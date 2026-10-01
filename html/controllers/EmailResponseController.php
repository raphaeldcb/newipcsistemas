<?php
/**
 * Email Response Controller
 * Handles automatic response generation and scheduling
 */

class EmailResponseController
{
    private $pdo;
    private $config;

    public function __construct($pdo, $config)
    {
        $this->pdo = $pdo;
        $this->config = $config;
    }

    /**
     * Generate automatic response
     */
    public function generateResponse($communication_id)
    {
        // Get communication details
        $stmt = $this->pdo->prepare('SELECT * FROM communications WHERE id = ?');
        $stmt->execute([$communication_id]);
        $comm = $stmt->fetch();

        if (!$comm) {
            return ['success' => false, 'error' => 'Communication not found'];
        }

        // Standard response template
        $response_template = <<<'EOT'
Prezados,

Acusamos o recebimento de sua comunicação e do(s) respectivo(s) anexo(s).

Para garantirmos a celeridade no processamento desta intimação e a rápida distribuição à nossa equipe técnica, solicitamos, por gentileza, que as próximas comunicações ou respostas a este e-mail incluam:

• O número dos Autos no formato padrão do CNJ (ex: 0000000-00.0000.0.00.0000).
• A confirmação de que o nosso CPF/CNPJ já se encontra devidamente cadastrado e habilitado no sistema do tribunal, garantindo nosso acesso à consulta integral dos autos, indispensável para casos que tramitam em Segredo de Justiça.

Aviso de Sistema: A ausência do número processual no formato CNJ ou a impossibilidade de acesso integral aos autos por falta de habilitação impede a triagem automática do nosso sistema de gestão, o que poderá impossibilitar o prosseguimento imediato e ocasionar atrasos no cumprimento dos prazos periciais.

Esta é uma mensagem automática. O e-mail original foi devidamente encaminhado para o nosso departamento administrativo.
EOT;

        return [
            'success' => true,
            'communication_id' => $communication_id,
            'to' => $comm['from_address'],
            'to_name' => $comm['from_name'],
            'subject' => 'RE: ' . $comm['subject'],
            'body' => $response_template,
            'scheduled_date' => date('Y-m-d', strtotime('+1 day')),
            'scheduled_time' => '09:00:00'
        ];
    }

    /**
     * Schedule email response for sending
     */
    public function scheduleResponse($communication_id, $to_email, $subject, $body, $scheduled_date, $scheduled_time, $access_token = null)
    {
        try {
            $stmt = $this->pdo->prepare('
                INSERT INTO email_responses
                (communication_id, to_email, subject, body, scheduled_date, scheduled_time, status, created_at)
                VALUES (?, ?, ?, ?, ?, ?, ?, NOW())
            ');

            $stmt->execute([
                $communication_id,
                $to_email,
                $subject,
                $body,
                $scheduled_date,
                $scheduled_time,
                'scheduled'
            ]);

            // Update communication status
            $update = $this->pdo->prepare('UPDATE communications SET status = ? WHERE id = ?');
            $update->execute(['processing', $communication_id]);

            // If access token available, create draft in Outlook
            if ($access_token) {
                try {
                    $this->createDraftInOutlook($to_email, $subject, $body, $access_token);
                } catch (Exception $e) {
                    error_log('Failed to create Outlook draft: ' . $e->getMessage());
                    // Continue anyway - database save succeeded
                }
            }

            return ['success' => true, 'message' => 'Response scheduled for ' . $scheduled_date . ' at ' . $scheduled_time];
        } catch (Exception $e) {
            return ['success' => false, 'error' => $e->getMessage()];
        }
    }

    /**
     * Create draft email in Outlook via Graph API
     */
    private function createDraftInOutlook($to_email, $subject, $body, $access_token)
    {
        error_log("🔍 createDraftInOutlook - token present: " . (empty($access_token) ? 'NO' : 'YES'));

        $mailbox = $this->config['microsoft']['mailbox'] ?? 'financeiro@ipcms.com.br';
        $url = 'https://graph.microsoft.com/v1.0/users/' . urlencode($mailbox) . '/messages';
        error_log("📍 Draft URL: " . $url);

        $ch = curl_init($url);

        $payload = [
            'subject' => $subject,
            'toRecipients' => [
                ['emailAddress' => ['address' => $to_email]]
            ],
            'body' => [
                'contentType' => 'HTML',
                'content' => nl2br($body)
            ]
        ];

        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Authorization: Bearer ' . $access_token,
            'Content-Type: application/json'
        ]);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($payload));
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);

        error_log("📤 Sending to Graph API: " . json_encode(['to' => $to_email, 'subject' => $subject]));

        $response = curl_exec($ch);
        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $curl_error = curl_error($ch);
        curl_close($ch);

        error_log("📥 Graph API Response (HTTP $http_code): " . substr($response, 0, 500));

        if ($http_code >= 400) {
            throw new Exception("Graph API error ($http_code): " . $response);
        }

        error_log("✅ Draft created successfully!");
        return json_decode($response, true);
    }

    /**
     * Get all scheduled responses
     */
    public function getScheduledResponses()
    {
        $stmt = $this->pdo->query('
            SELECT er.*, c.subject as original_subject
            FROM email_responses er
            JOIN communications c ON er.communication_id = c.id
            WHERE er.status = "scheduled"
            ORDER BY er.scheduled_date, er.scheduled_time
        ');

        return $stmt->fetchAll();
    }

    /**
     * Send scheduled responses (call this via cron job)
     */
    public function sendScheduledResponses($access_token)
    {
        $now = date('Y-m-d H:i:s');

        $stmt = $this->pdo->prepare('
            SELECT * FROM email_responses
            WHERE status = "scheduled"
            AND CONCAT(scheduled_date, " ", scheduled_time) <= ?
        ');

        $stmt->execute([$now]);
        $responses = $stmt->fetchAll();

        $sent_count = 0;
        foreach ($responses as $response) {
            try {
                // Send via Microsoft Graph
                require_once __DIR__ . '/../services/MicrosoftGraphService.php';
                $graph = new MicrosoftGraphService($this->config, $this->pdo);

                $message = [
                    'subject' => $response['subject'],
                    'toRecipients' => [
                        ['emailAddress' => ['address' => $response['to_email']]]
                    ],
                    'body' => [
                        'contentType' => 'HTML',
                        'content' => nl2br(htmlspecialchars($response['body']))
                    ]
                ];

                // Send message (you'll need to implement sendMessage in MicrosoftGraphService)
                // $graph->sendMessage($access_token, $message);

                // Update status
                $update = $this->pdo->prepare('UPDATE email_responses SET status = ?, sent_at = NOW() WHERE id = ?');
                $update->execute(['sent', $response['id']]);

                $sent_count++;
            } catch (Exception $e) {
                error_log('Failed to send response ' . $response['id'] . ': ' . $e->getMessage());
            }
        }

        return ['success' => true, 'sent_count' => $sent_count];
    }
}
?>
