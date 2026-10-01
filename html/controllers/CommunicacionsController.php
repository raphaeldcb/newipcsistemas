<?php
/**
 * Communications Controller
 */

require_once __DIR__ . '/../services/MicrosoftGraphService.php';
require_once __DIR__ . '/../services/EmailClassifierService.php';
require_once __DIR__ . '/../models/Communication.php';

class CommunicationsController
{
    private $pdo;
    private $config;
    private $graph;
    private $communication;

    public function __construct($pdo, $config)
    {
        $this->pdo = $pdo;
        $this->config = $config;
        $this->communication = new Communication($pdo);

        try {
            $this->graph = new MicrosoftGraphService($config, $pdo);
        } catch (Exception $e) {
            error_log('Microsoft Graph not configured: ' . $e->getMessage());
        }
    }

    /**
     * List all communications
     */
    public function list()
    {
        $filters = [];

        if (!empty($_GET['status'])) {
            $filters['status'] = $_GET['status'];
        }
        if (!empty($_GET['vara'])) {
            $filters['vara'] = $_GET['vara'];
        }
        if (!empty($_GET['processo'])) {
            $filters['processo'] = $_GET['processo'];
        }
        if (!empty($_GET['search'])) {
            $filters['search'] = $_GET['search'];
        }

        $communications = $this->communication->getAll($filters);
        $stats = $this->communication->getStats();

        return [
            'communications' => $communications,
            'stats' => $stats,
            'filters' => $filters,
        ];
    }

    /**
     * Get single communication
     */
    public function get($id)
    {
        return $this->communication->getById($id);
    }

    /**
     * Sync communications from Microsoft Graph
     */
    public function sync()
    {
        if (!$this->graph) {
            return ['success' => false, 'error' => 'Microsoft Graph not configured'];
        }

        try {
            // Get access token from session or config
            $access_token = $_SESSION['microsoft_access_token'] ?? null;

            if (!$access_token) {
                return ['success' => false, 'error' => 'Not authenticated with Microsoft'];
            }

            // Sync messages
            $result = $this->graph->syncMessages($access_token);

            $synced_count = 0;
            if (!empty($result['value'])) {
                foreach ($result['value'] as $message) {
                    $data = [
                        'message_id' => $message['id'],
                        'conversation_id' => $message['conversationId'] ?? null,
                        'subject' => $message['subject'] ?? 'No Subject',
                        'body_preview' => $message['bodyPreview'] ?? '',
                        'from_address' => $message['from']['emailAddress']['address'] ?? null,
                        'from_name' => $message['from']['emailAddress']['name'] ?? null,
                        'received_datetime' => $message['receivedDateTime'] ?? null,
                        'has_attachments' => $message['hasAttachments'] ?? false,
                        'attachment_count' => count($message['attachments'] ?? []),
                    ];

                    $comm_id = $this->communication->save($data);

                    // Log the sync
                    $this->logProcessing($comm_id, 'synced', json_encode($data));

                    // Auto-classify email
                    try {
                        $classifier = new EmailClassifierService($this->pdo);
                        $classifier->classifyEmail($comm_id);
                    } catch (Exception $e) {
                        error_log('Email classification failed: ' . $e->getMessage());
                    }

                    $synced_count++;
                }
            }

            // Store delta token for next sync
            if (!empty($result['@odata.deltaLink'])) {
                $_SESSION['microsoft_delta_token'] = $result['@odata.deltaLink'];
            }

            // Reprocess ALL emails with new classification rules
            $reprocessed = $this->reprocessAllEmails();

            return [
                'success' => true,
                'synced_count' => $synced_count,
                'reprocessed_count' => $reprocessed,
                'message' => "Synced $synced_count messages, reprocessed $reprocessed emails",
            ];

        } catch (Exception $e) {
            error_log('Sync error: ' . $e->getMessage());
            return ['success' => false, 'error' => $e->getMessage()];
        }
    }

    /**
     * Update communication status
     */
    public function updateStatus($id, $status)
    {
        $valid_statuses = ['new', 'processing', 'processed', 'error', 'archived'];

        if (!in_array($status, $valid_statuses)) {
            return ['success' => false, 'error' => 'Invalid status'];
        }

        $this->communication->updateStatus($id, $status);
        $this->logProcessing($id, 'status_updated', "Status changed to $status");

        return ['success' => true];
    }

    /**
     * Update extracted information
     */
    public function updateExtracted($id, $data)
    {
        $this->communication->updateExtracted($id, $data);
        $this->logProcessing($id, 'information_extracted', json_encode($data));

        return ['success' => true];
    }

    /**
     * Reprocess ALL emails with current classification rules
     */
    private function reprocessAllEmails()
    {
        try {
            $stmt = $this->pdo->query("SELECT id FROM communications ORDER BY received_datetime DESC");
            $emails = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $classifier = new EmailClassifierService($this->pdo);
            $count = 0;

            foreach ($emails as $email) {
                try {
                    $classifier->classifyEmail($email['id']);
                    $count++;
                } catch (Exception $e) {
                    error_log('Failed to reclassify email ' . $email['id'] . ': ' . $e->getMessage());
                }
            }

            return $count;
        } catch (Exception $e) {
            error_log('Reprocess all emails failed: ' . $e->getMessage());
            return 0;
        }
    }

    /**
     * Log processing action
     */
    private function logProcessing($communication_id, $action, $details)
    {
        $user_id = $_SESSION['user_id'] ?? null;
        $ip_address = $_SERVER['REMOTE_ADDR'] ?? null;

        $this->pdo->prepare(
            'INSERT INTO processing_log (communication_id, action, details, user_id, ip_address)
             VALUES (?, ?, ?, ?, ?)'
        )->execute([
            $communication_id,
            $action,
            $details,
            $user_id,
            $ip_address,
        ]);
    }
}
