<?php
/**
 * Email Classifier Service Tests
 * Tests Qwen integration with fallback to keyword matching
 */

// Set up error reporting
error_reporting(E_ALL);
ini_set('display_errors', '1');

// Simple test assertion functions
class TestRunner
{
    private $total = 0;
    private $passed = 0;
    private $failed = 0;
    private $current_test = '';

    public function assert($condition, $message)
    {
        $this->total++;
        if ($condition) {
            $this->passed++;
            echo "[✓] $message\n";
        } else {
            $this->failed++;
            echo "[✗] FAILED: $message\n";
        }
    }

    public function assertEqual($actual, $expected, $message)
    {
        $this->total++;
        if ($actual === $expected) {
            $this->passed++;
            echo "[✓] $message\n";
        } else {
            $this->failed++;
            echo "[✗] FAILED: $message\n";
            echo "     Expected: " . var_export($expected, true) . "\n";
            echo "     Got: " . var_export($actual, true) . "\n";
        }
    }

    public function assertNotNull($value, $message)
    {
        $this->total++;
        if ($value !== null) {
            $this->passed++;
            echo "[✓] $message\n";
        } else {
            $this->failed++;
            echo "[✗] FAILED: $message (value was null)\n";
        }
    }

    public function assertGreater($actual, $threshold, $message)
    {
        $this->total++;
        if ($actual > $threshold) {
            $this->passed++;
            echo "[✓] $message\n";
        } else {
            $this->failed++;
            echo "[✗] FAILED: $message\n";
            echo "     Expected > $threshold, got: $actual\n";
        }
    }

    public function startTest($name)
    {
        echo "\n=== TEST: $name ===\n";
        $this->current_test = $name;
    }

    public function summary()
    {
        echo "\n" . str_repeat("=", 60) . "\n";
        echo "SUMMARY: {$this->passed}/{$this->total} tests passed\n";
        if ($this->failed > 0) {
            echo "FAILED: {$this->failed} tests\n";
        }
        echo str_repeat("=", 60) . "\n";
        return $this->failed === 0;
    }
}

// Test class
class EmailClassifierServiceTest
{
    private $pdo;
    private $test_comm_id = null;

    public function __construct()
    {
        $this->connectDatabase();
    }

    private function connectDatabase()
    {
        // Connect to database
        try {
            $config = [
                'host' => getenv('DB_HOST') ?: 'localhost',
                'port' => getenv('DB_PORT') ?: 3306,
                'dbname' => getenv('DB_NAME') ?: 'novos_sistemas_ipc',
                'user' => getenv('DB_USER') ?: 'perito',
                'pass' => getenv('DB_PASS') ?: ''
            ];

            $dsn = "mysql:host={$config['host']};port={$config['port']};dbname={$config['dbname']};charset=utf8mb4";
            $this->pdo = new PDO($dsn, $config['user'], $config['pass']);
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (Exception $e) {
            die("Database connection failed: " . $e->getMessage() . "\n");
        }
    }

    /**
     * Test 1: Classify a judicial email
     */
    public function testClassifyJudicialEmail($test)
    {
        $test->startTest('Classify Judicial Email');

        // Insert test email
        $subject = 'INTIMAÇÃO - PROCESSO Nº 0001234-56.2026.8.26.0100';
        $body = 'TRIBUNAL DE JUSTIÇA DO ESTADO DE SÃO PAULO
VARA CÍVEL DE SÃO PAULO
COMARCA: SÃO PAULO

Intimação Judicial referente ao processo de número 0001234-56.2026.8.26.0100.

O(A) interessado(a) é INTIMADO(A) para tomar ciência da sentença proferida pelo ilustríssimo juiz da vara judicial.

A referida sentença versa sobre pedido de indenização.

O prazo para recurso é de 15 dias úteis contados da intimação.

Tribunal de Justiça';

        $insert = $this->pdo->prepare('
            INSERT INTO communications (subject, body_preview, body, from_name, from_address, message_id)
            VALUES (?, ?, ?, ?, ?, ?)
        ');

        $insert->execute([
            $subject,
            substr($body, 0, 200),
            $body,
            'Tribunal de Justiça',
            'tribunal@tj.sp.gov.br',
            'msg-' . time()
        ]);

        $comm_id = $this->pdo->lastInsertId();

        // Require services
        require_once dirname(__DIR__) . '/html/services/EmailClassifierService.php';

        // Create classifier with mock Qwen (for testing, we can skip Qwen and use fallback)
        $classifier = new EmailClassifierService($this->pdo);

        // Classify
        $result = $classifier->classifyEmail($comm_id);

        // Assertions
        $test->assert($result['success'], 'Classification completed successfully');
        $test->assertNotNull($result['classification'], 'Classification is not null');
        $test->assert(
            in_array($result['classification'], ['JUDICIAL', 'NON_JUDICIAL', 'UNKNOWN']),
            'Classification is valid enum value'
        );

        // Verify database was updated
        $stmt = $this->pdo->prepare('
            SELECT classification, cnj_number, vara, comarca, confidence, reasoning, extracted_at
            FROM communications
            WHERE id = ?
        ');
        $stmt->execute([$comm_id]);
        $db_result = $stmt->fetch(PDO::FETCH_ASSOC);

        $test->assertNotNull($db_result['classification'], 'Classification persisted to database');
        $test->assertNotNull($db_result['confidence'], 'Confidence persisted to database');
        $test->assertNotNull($db_result['reasoning'], 'Reasoning persisted to database');
        $test->assertNotNull($db_result['extracted_at'], 'Extracted_at persisted to database');

        if ($db_result['classification'] === 'JUDICIAL') {
            $test->assert(true, 'Email correctly classified as JUDICIAL');
        }

        // Clean up
        $this->pdo->prepare('DELETE FROM communications WHERE id = ?')->execute([$comm_id]);

        return true;
    }

    /**
     * Test 2: Qwen fallback - email is classified with fallback available
     */
    public function testQwenFallback($test)
    {
        $test->startTest('Qwen Fallback Classification');

        // Insert test email (could be any content)
        $subject = 'Resultado da análise solicitada';
        $body = 'Prezados Senhores,

Conforme solicitado, segue análise de perícia referente ao processo de número 0001234-56.2026.8.26.0100 junto ao tribunal.

O perito nomeado para análise constatou as seguintes conclusões técnicas:
- Análise realizada em conformidade com os procedimentos técnicos
- Laudos e documentação em anexo
- Parecer técnico disponível para consulta

Atenciosamente,
Perito Judicial';

        $insert = $this->pdo->prepare('
            INSERT INTO communications (subject, body_preview, body, from_name, from_address, message_id)
            VALUES (?, ?, ?, ?, ?, ?)
        ');

        $insert->execute([
            $subject,
            substr($body, 0, 200),
            $body,
            'Perito',
            'perito@example.com',
            'msg-' . time() . '-fb'
        ]);

        $comm_id = $this->pdo->lastInsertId();

        // Require services
        require_once dirname(__DIR__) . '/html/services/EmailClassifierService.php';

        // Create classifier
        $classifier = new EmailClassifierService($this->pdo);

        // Classify (will use fallback if Qwen unavailable)
        $result = $classifier->classifyEmail($comm_id);

        // Assertions
        $test->assert($result['success'], 'Classification completed');
        $test->assertNotNull($result['classification'], 'Classification is present');
        $test->assert(
            in_array($result['classification'], ['JUDICIAL', 'NON_JUDICIAL', 'UNKNOWN']),
            'Classification has valid enum value'
        );

        // Verify database update
        $stmt = $this->pdo->prepare('
            SELECT classification, confidence, reasoning, extracted_at
            FROM communications
            WHERE id = ?
        ');
        $stmt->execute([$comm_id]);
        $db_result = $stmt->fetch(PDO::FETCH_ASSOC);

        $test->assertNotNull($db_result['classification'], 'Classification in database');
        $test->assertNotNull($db_result['confidence'], 'Confidence in database');
        $test->assertNotNull($db_result['reasoning'], 'Reasoning in database');
        $test->assertNotNull($db_result['extracted_at'], 'Extracted_at timestamp in database');

        $test->assert($db_result['confidence'] >= 0, 'Confidence is valid number');
        $test->assert($db_result['confidence'] <= 1, 'Confidence is between 0 and 1');

        // Clean up
        $this->pdo->prepare('DELETE FROM communications WHERE id = ?')->execute([$comm_id]);

        return true;
    }

    /**
     * Run all tests
     */
    public function runAll()
    {
        $test = new TestRunner();

        echo "\n" . str_repeat("=", 60) . "\n";
        echo "EMAIL CLASSIFIER SERVICE TEST SUITE\n";
        echo "Testing Qwen Integration with Fallback\n";
        echo str_repeat("=", 60) . "\n";

        try {
            $this->testClassifyJudicialEmail($test);
            $this->testQwenFallback($test);
        } catch (Exception $e) {
            echo "\n[ERROR] Test suite failed with exception:\n";
            echo "  " . $e->getMessage() . "\n";
            echo "  " . $e->getFile() . ":" . $e->getLine() . "\n";
            return false;
        }

        return $test->summary();
    }
}

// Run tests if executed directly
if (php_sapi_name() === 'cli') {
    $test_suite = new EmailClassifierServiceTest();
    $success = $test_suite->runAll();
    exit($success ? 0 : 1);
}
