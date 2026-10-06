<?php
/**
 * PHP Wrapper for QwenClassifierService
 * Executes Python service as subprocess and handles communication
 */

class QwenClassifierServicePHP
{
    private $python_script_path;
    private $timeout = 30;
    private $debug = false;

    public function __construct($python_script_path = null, $timeout = 30)
    {
        // Default to the QwenClassifierService in python directory
        if ($python_script_path === null) {
            $python_script_path = dirname(dirname(__DIR__)) . '/python/QwenClassifierService.py';
        }

        if (!file_exists($python_script_path)) {
            throw new Exception("Python script not found at: $python_script_path");
        }

        $this->python_script_path = $python_script_path;
        $this->timeout = $timeout;
        $this->debug = getenv('DEBUG_QWEN_CLASSIFIER') === 'true';
    }

    /**
     * Classify an email using Qwen AI
     *
     * @param string $subject Email subject line
     * @param string $body Email body text (full body preferred over preview)
     * @return array Classification result with fallback flag on error
     */
    public function classifyEmail($subject, $body)
    {
        try {
            // Build input data
            $input_data = [
                'subject' => $subject,
                'body' => $body
            ];

            // Call Python service
            $result = $this->callPythonService($input_data);

            if ($this->debug) {
                error_log("QwenClassifierServicePHP result: " . json_encode($result));
            }

            return $result;

        } catch (Exception $e) {
            error_log("QwenClassifierServicePHP error: " . $e->getMessage());

            // Return fallback result on error
            return [
                'success' => false,
                'error' => $e->getMessage(),
                'fallback' => true,
                'classification' => 'UNKNOWN',
                'confidence' => 0.0,
                'cnj_number' => null,
                'vara' => null,
                'comarca' => null,
                'reasoning' => 'Fallback mode due to service error'
            ];
        }
    }

    /**
     * Execute Python service via subprocess
     *
     * @param array $input_data Input data to pass to Python
     * @return array Python service response
     * @throws Exception On subprocess error, timeout, or parse error
     */
    private function callPythonService($input_data)
    {
        // Prepare input as JSON
        $json_input = json_encode($input_data);

        // Build Python command
        $python_bin = $this->findPythonBinary();
        $escaped_script = escapeshellarg($this->python_script_path);
        $escaped_input = escapeshellarg($json_input);

        // Build complete command
        $command = "{$python_bin} -c '
import json
import sys
sys.path.insert(0, \"" . dirname(dirname(__DIR__)) . "/python\")
from QwenClassifierService import QwenClassifierService

try:
    input_data = json.loads({$escaped_input})
    service = QwenClassifierService()
    result = service.classify_email(input_data[\"subject\"], input_data[\"body\"])
    print(json.dumps(result))
except Exception as e:
    print(json.dumps({\"success\": false, \"error\": str(e), \"fallback\": true}))
'";

        if ($this->debug) {
            error_log("Executing Python command");
        }

        // Execute with timeout
        $descriptorspec = [
            0 => ['pipe', 'r'],  // stdin
            1 => ['pipe', 'w'],  // stdout
            2 => ['pipe', 'w'],  // stderr
        ];

        $process = proc_open($command, $descriptorspec, $pipes, null, null);

        if (!is_resource($process)) {
            throw new Exception('Failed to start Python subprocess');
        }

        // Write input to stdin
        fwrite($pipes[0], $json_input);
        fclose($pipes[0]);

        // Set timeout on output streams
        stream_set_blocking($pipes[1], false);
        stream_set_blocking($pipes[2], false);

        $start_time = time();
        $stdout = '';
        $stderr = '';

        // Read output with timeout
        while (time() - $start_time < $this->timeout) {
            $chunk = fread($pipes[1], 8192);
            if ($chunk !== false && $chunk !== '') {
                $stdout .= $chunk;
            }

            $chunk = fread($pipes[2], 8192);
            if ($chunk !== false && $chunk !== '') {
                $stderr .= $chunk;
            }

            // Check if process is still running
            $status = proc_get_status($process);
            if (!$status['running']) {
                // Read any remaining output
                $stdout .= stream_get_contents($pipes[1]);
                $stderr .= stream_get_contents($pipes[2]);
                break;
            }

            usleep(100000); // 100ms
        }

        // Check if process is still running (timeout)
        $status = proc_get_status($process);
        if ($status['running']) {
            proc_terminate($process);
            fclose($pipes[1]);
            fclose($pipes[2]);
            proc_close($process);
            throw new Exception('Python subprocess timeout (exceeded ' . $this->timeout . ' seconds)');
        }

        fclose($pipes[1]);
        fclose($pipes[2]);
        $exit_code = proc_close($process);

        if ($this->debug) {
            error_log("Python process exit code: $exit_code");
            if ($stderr) {
                error_log("Python stderr: $stderr");
            }
        }

        // Parse output
        $output = trim($stdout);

        if (empty($output)) {
            if (!empty($stderr)) {
                throw new Exception("Python error: $stderr");
            }
            throw new Exception("Empty response from Python service");
        }

        // Try to parse JSON response
        $result = json_decode($output, true);

        if ($result === null) {
            throw new Exception("Invalid JSON response from Python: " . substr($output, 0, 200));
        }

        return $result;
    }

    /**
     * Find Python binary
     *
     * @return string Path to Python executable
     * @throws Exception If Python not found
     */
    private function findPythonBinary()
    {
        $python_bins = [
            'python3',
            'python',
            '/usr/bin/python3',
            '/usr/bin/python',
            '/usr/local/bin/python3',
            '/usr/local/bin/python',
            '/opt/homebrew/bin/python3'
        ];

        foreach ($python_bins as $bin) {
            $full_path = shell_exec("which $bin 2>/dev/null");
            if ($full_path) {
                return trim($full_path);
            }
        }

        throw new Exception('Python binary not found. Install Python 3 and ensure it is in PATH.');
    }

    /**
     * Set debug mode
     */
    public function setDebug($debug)
    {
        $this->debug = (bool)$debug;
    }

    /**
     * Set timeout
     */
    public function setTimeout($timeout)
    {
        $this->timeout = (int)$timeout;
    }
}
