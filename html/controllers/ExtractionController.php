<?php
/**
 * Extraction Controller
 * Handles email information extraction via Python service
 */

class ExtractionController
{
    private $pdo;
    private $config;
    private $python_path;

    public function __construct($pdo, $config)
    {
        $this->pdo = $pdo;
        $this->config = $config;
        $this->python_path = $config['python']['path'] ?? '/usr/bin/python3';
    }

    /**
     * Extract information from a single communication
     */
    public function extractCommunication($communication_id)
    {
        try {
            // Get communication from database
            $comm = $this->getCommunication($communication_id);

            if (!$comm) {
                return ['success' => false, 'error' => 'Communication not found'];
            }

            // Call Python extraction service
            $extraction = $this->callExtractionService($comm);

            if (!$extraction['success']) {
                return $extraction;
            }

            // Save extracted information
            $extracted_data = $extraction['extraction'];
            $this->saveExtraction($communication_id, $extracted_data);

            // Log the extraction
            $this->logExtraction($communication_id, $extracted_data);

            return [
                'success' => true,
                'message' => 'Information extracted successfully',
                'extraction' => $extracted_data,
            ];

        } catch (Exception $e) {
            error_log('Extraction error: ' . $e->getMessage());
            return ['success' => false, 'error' => $e->getMessage()];
        }
    }

    /**
     * Extract information from multiple communications (batch)
     */
    public function extractBatch($status = 'new', $limit = 10)
    {
        try {
            // Get communications to extract
            $communications = $this->getCommunicationsByStatus($status, $limit);

            if (empty($communications)) {
                return ['success' => true, 'message' => 'No communications to extract', 'count' => 0];
            }

            $results = [];
            $success_count = 0;
            $error_count = 0;

            foreach ($communications as $comm) {
                $result = $this->extractCommunication($comm['id']);

                if ($result['success']) {
                    $success_count++;
                } else {
                    $error_count++;
                    error_log("Failed to extract communication {$comm['id']}: " . $result['error']);
                }

                $results[] = $result;
            }

            return [
                'success' => true,
                'message' => "Extracted $success_count communications, $error_count errors",
                'count' => count($communications),
                'success_count' => $success_count,
                'error_count' => $error_count,
                'results' => $results,
            ];

        } catch (Exception $e) {
            error_log('Batch extraction error: ' . $e->getMessage());
            return ['success' => false, 'error' => $e->getMessage()];
        }
    }

    /**
     * Get communication data
     */
    private function getCommunication($id)
    {
        $stmt = $this->pdo->prepare(
            'SELECT id, subject, from_name, from_address, body_preview, received_datetime
             FROM communications WHERE id = ?'
        );
        $stmt->execute([$id]);
        return $stmt->fetch();
    }

    /**
     * Get communications by status
     */
    private function getCommunicationsByStatus($status, $limit)
    {
        $stmt = $this->pdo->prepare(
            'SELECT id, subject, from_name, from_address, body_preview, received_datetime
             FROM communications WHERE status = ? LIMIT ?'
        );
        $stmt->execute([$status, $limit]);
        return $stmt->fetchAll();
    }

    /**
     * Call Python extraction service
     */
    private function callExtractionService($email_data)
    {
        try {
            $script_path = dirname(__DIR__) . '/../python/extraction_service.py';
            $ollama_url = $this->config['python']['ollama_url'] ?? 'http://localhost:11434';
            $model = $this->config['python']['ollama_model'] ?? 'qwen:7b';

            // Prepare email data as JSON
            $email_json = json_encode($email_data);

            // Call Python script
            $command = sprintf(
                '%s %s extract %s %s',
                escapeshellarg($this->python_path),
                escapeshellarg($script_path),
                escapeshellarg($ollama_url),
                escapeshellarg($model)
            );

            $process = proc_open(
                $command,
                [
                    0 => ['pipe', 'r'],  // stdin
                    1 => ['pipe', 'w'],  // stdout
                    2 => ['pipe', 'w'],  // stderr
                ],
                $pipes
            );

            if (!is_resource($process)) {
                throw new Exception('Failed to open Python process');
            }

            // Write email data to stdin
            fwrite($pipes[0], $email_json);
            fclose($pipes[0]);

            // Read output
            $output = stream_get_contents($pipes[1]);
            $error = stream_get_contents($pipes[2]);
            fclose($pipes[1]);
            fclose($pipes[2]);

            $exit_code = proc_close($process);

            if ($exit_code !== 0) {
                throw new Exception("Python script failed: $error");
            }

            // Parse response
            $response = json_decode($output, true);

            if (!$response) {
                throw new Exception('Invalid JSON response from extraction service');
            }

            return $response;

        } catch (Exception $e) {
            error_log('Python call error: ' . $e->getMessage());
            return ['success' => false, 'error' => $e->getMessage()];
        }
    }

    /**
     * Save extraction results to database
     */
    private function saveExtraction($communication_id, $extracted_data)
    {
        $this->pdo->prepare(
            'UPDATE communications SET
             vara = ?, comarca = ?, processo_numero = ?, pedido = ?,
             classification = ?, status = ?, updated_at = NOW()
             WHERE id = ?'
        )->execute([
            $extracted_data['vara'] ?? null,
            $extracted_data['comarca'] ?? null,
            $extracted_data['processo'] ?? null,
            $extracted_data['pedido'] ?? null,
            $extracted_data['classification'] ?? 'unknown',
            'processed',
            $communication_id,
        ]);
    }

    /**
     * Log extraction event
     */
    private function logExtraction($communication_id, $extracted_data)
    {
        $user_id = $_SESSION['user_id'] ?? null;

        $this->pdo->prepare(
            'INSERT INTO processing_log (communication_id, action, details, user_id, ip_address)
             VALUES (?, ?, ?, ?, ?)'
        )->execute([
            $communication_id,
            'information_extracted',
            json_encode([
                'vara' => $extracted_data['vara'] ?? null,
                'comarca' => $extracted_data['comarca'] ?? null,
                'processo' => $extracted_data['processo'] ?? null,
                'confidence' => $extracted_data['confidence'] ?? null,
            ]),
            $user_id,
            $_SERVER['REMOTE_ADDR'] ?? null,
        ]);
    }
}
