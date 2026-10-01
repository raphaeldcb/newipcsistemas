<?php
/**
 * Email Categorization Service
 * Handles marking emails as "ANALISADO PELO NEW Sistemas IPCMS" in Outlook
 */

class EmailCategorizationService
{
    private $config;
    private $pdo;

    public function __construct($config, $pdo)
    {
        $this->config = $config;
        $this->pdo = $pdo;
    }

    /**
     * Categorize email in Outlook
     * Adds category "ANALISADO PELO NEW Sistemas IPCMS" to the message
     */
    public function categorizeEmailAsAnalyzed($access_token, $message_id)
    {
        $graph_url = 'https://graph.microsoft.com/v1.0';
        $mailbox = $this->config['microsoft']['mailbox'];

        $endpoint = $graph_url . '/users/' . urlencode($mailbox) . '/messages/' . urlencode($message_id);

        $update_data = [
            'categories' => ['ANALISADO PELO NEW Sistemas IPCMS']
        ];

        $ch = curl_init($endpoint);

        $headers = [
            'Authorization: Bearer ' . $access_token,
            'Content-Type: application/json',
        ];

        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'PATCH');
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($update_data));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        // SSL verification
        $verify_ssl = (getenv('APP_ENV') === 'production') ? true : false;
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, $verify_ssl);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, $verify_ssl ? 2 : 0);

        $response = curl_exec($ch);
        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $curl_error = curl_error($ch);
        curl_close($ch);

        if ($http_code >= 400) {
            $error_msg = $response ?: $curl_error;
            throw new Exception('Failed to categorize email: ' . $error_msg);
        }

        return true;
    }

    /**
     * Mark communication as analyzed in database
     */
    public function markAsAnalyzed($communication_id, $access_token = null)
    {
        try {
            $stmt = $this->pdo->prepare('
                UPDATE communications
                SET status = "processed", analyzed_at = NOW()
                WHERE id = ?
            ');
            $stmt->execute([$communication_id]);

            // If access token available, also categorize in Outlook
            if ($access_token) {
                $comm = $this->pdo->prepare('SELECT message_id FROM communications WHERE id = ?');
                $comm->execute([$communication_id]);
                $data = $comm->fetch();

                if ($data && $data['message_id']) {
                    try {
                        $this->categorizeEmailAsAnalyzed($access_token, $data['message_id']);
                    } catch (Exception $e) {
                        error_log('Failed to categorize in Outlook: ' . $e->getMessage());
                        // Continue anyway - database update succeeded
                    }
                }
            }

            return ['success' => true, 'message' => 'Communication marked as analyzed'];
        } catch (Exception $e) {
            return ['success' => false, 'error' => $e->getMessage()];
        }
    }

    /**
     * Get analyzed communications
     */
    public function getAnalyzedCommunications()
    {
        $stmt = $this->pdo->query('
            SELECT * FROM communications
            WHERE status = "processed"
            ORDER BY analyzed_at DESC
            LIMIT 100
        ');

        return $stmt->fetchAll();
    }
}
?>
