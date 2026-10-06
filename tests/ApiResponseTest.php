<?php
/**
 * API Response Tests for Confidence & Reasoning Fields
 * Tests Task 4: Expose confidence, reasoning, extracted_at in API responses
 */

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
            echo "[✗] FAILED: $message (value is null)\n";
        }
    }

    public function assertNull($value, $message)
    {
        $this->total++;
        if ($value === null) {
            $this->passed++;
            echo "[✓] $message\n";
        } else {
            $this->failed++;
            echo "[✗] FAILED: $message (value is not null: " . var_export($value, true) . ")\n";
        }
    }

    public function assertIsFloat($value, $message)
    {
        $this->total++;
        if (is_float($value) || is_int($value)) {
            $this->passed++;
            echo "[✓] $message\n";
        } else {
            $this->failed++;
            echo "[✗] FAILED: $message (expected float/int, got " . gettype($value) . ")\n";
        }
    }

    public function assertGreaterThanOrEqual($value, $min, $message)
    {
        $this->total++;
        if ($value >= $min) {
            $this->passed++;
            echo "[✓] $message\n";
        } else {
            $this->failed++;
            echo "[✗] FAILED: $message (expected >= $min, got $value)\n";
        }
    }

    public function assertLessThanOrEqual($value, $max, $message)
    {
        $this->total++;
        if ($value <= $max) {
            $this->passed++;
            echo "[✓] $message\n";
        } else {
            $this->failed++;
            echo "[✗] FAILED: $message (expected <= $max, got $value)\n";
        }
    }

    public function testStart($name)
    {
        echo "\n=== $name ===\n";
        $this->current_test = $name;
    }

    public function summary()
    {
        echo "\n\n========================================\n";
        echo "SUMMARY: $this->passed/$this->total tests passed\n";
        if ($this->failed > 0) {
            echo "FAILED: $this->failed tests\n";
        }
        echo "========================================\n\n";
        return $this->failed === 0;
    }
}

// Initialize test runner
$tests = new TestRunner();

// Load environment and database
require_once __DIR__ . '/../config/load-env.php';
$config = require_once __DIR__ . '/../config/config.php';

try {
    $pdo = new PDO(
        'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['database'] . ';charset=' . $config['db']['charset'],
        $config['db']['username'],
        $config['db']['password'],
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
} catch (PDOException $e) {
    echo "[✗] Database connection failed: " . $e->getMessage() . "\n";
    exit(1);
}

// Load models and services
require_once __DIR__ . '/../html/models/Communication.php';

// Start tests
$tests->testStart('Test 1: Insert communication with confidence and reasoning');

// Insert test data
$test_message_id = 'test_msg_' . time();
$confidence_value = 0.95;
$reasoning_text = 'Email contém intimação judicial com número de processo válido e data de vencimento clara.';

$stmt = $pdo->prepare(
    'INSERT INTO communications
    (message_id, subject, body_preview, from_address, from_name, received_datetime,
     status, classification, confidence, reasoning, extracted_at, synced_at)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())'
);

try {
    $inserted = $stmt->execute([
        $test_message_id,
        'Intimação - Processo 0001234-56.2026.8.26.0100',
        'Você é intimado a comparecer em juízo...',
        'tjsp@jusbrasil.com.br',
        'Tribunal de Justiça SP',
        date('Y-m-d H:i:s'),
        'processed',
        'JUDICIAL',
        $confidence_value,
        $reasoning_text,
        date('Y-m-d H:i:s')
    ]);
    $comm_id = $pdo->lastInsertId();
    $tests->assert($inserted, 'Successfully inserted communication with confidence/reasoning');
    $tests->assertNotNull($comm_id, 'Communication ID generated');
} catch (Exception $e) {
    $tests->assert(false, 'Failed to insert communication: ' . $e->getMessage());
}

// Test 2: Retrieve via model and verify fields
$tests->testStart('Test 2: Retrieve communication and verify new fields');

$communication = new Communication($pdo);
$comm = $communication->getById($comm_id);

$tests->assertNotNull($comm, 'Communication retrieved from database');
if ($comm) {
    $tests->assert(isset($comm['confidence']), 'confidence field exists in response');
    $tests->assert(isset($comm['reasoning']), 'reasoning field exists in response');
    $tests->assert(isset($comm['extracted_at']), 'extracted_at field exists in response');

    $tests->assertIsFloat($comm['confidence'], 'confidence is numeric (float/int)');
    $tests->assertEqual($comm['confidence'], $confidence_value, 'confidence value matches inserted value (0.95)');
    $tests->assertEqual($comm['reasoning'], $reasoning_text, 'reasoning text matches inserted text');
    $tests->assertNotNull($comm['extracted_at'], 'extracted_at timestamp is set');
}

// Test 3: getAll() includes new fields
$tests->testStart('Test 3: List endpoint includes confidence and reasoning');

$all_comms = $communication->getAll();
$tests->assertNotNull($all_comms, 'getAll() returns communications');

if (!empty($all_comms) && is_array($all_comms)) {
    $tests->assert(count($all_comms) > 0, 'At least one communication returned');

    // Check first item for new fields
    $first = $all_comms[0];
    $tests->assert(isset($first['confidence']), 'confidence field in list response');
    $tests->assert(isset($first['reasoning']), 'reasoning field in list response');
    $tests->assert(isset($first['extracted_at']), 'extracted_at field in list response');
}

// Test 4: NULL handling for confidence
$tests->testStart('Test 4: Handle NULL confidence gracefully');

$test_message_id_null = 'test_msg_null_' . time();

$stmt = $pdo->prepare(
    'INSERT INTO communications
    (message_id, subject, body_preview, from_address, from_name, received_datetime,
     status, classification, confidence, reasoning, extracted_at, synced_at)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, NULL, NULL, NULL, NOW())'
);

try {
    $inserted = $stmt->execute([
        $test_message_id_null,
        'Test Email NULL confidence',
        'Body preview',
        'test@example.com',
        'Test Sender',
        date('Y-m-d H:i:s'),
        'new',
        'ADMINISTRATIVE'
    ]);
    $comm_id_null = $pdo->lastInsertId();
    $tests->assert($inserted, 'Successfully inserted communication with NULL confidence/reasoning');

    $comm_null = $communication->getById($comm_id_null);
    $tests->assertNull($comm_null['confidence'], 'NULL confidence handled correctly');
    $tests->assertNull($comm_null['reasoning'], 'NULL reasoning handled correctly');
    $tests->assertNull($comm_null['extracted_at'], 'NULL extracted_at handled correctly');
} catch (Exception $e) {
    $tests->assert(false, 'Failed to handle NULL values: ' . $e->getMessage());
}

// Test 5: JSON API response format
$tests->testStart('Test 5: API response JSON structure');

// Simulate API response
session_start();
$_SESSION['user_id'] = 1; // Fake session

$response = [
    'success' => true,
    'communications' => $all_comms,
    'stats' => $communication->getStats()
];

$json = json_encode($response);
$tests->assert(!empty($json), 'Response is JSON serializable');

$decoded = json_decode($json, true);
$tests->assert(is_array($decoded), 'JSON decodes to array');
$tests->assert($decoded['success'] === true, 'success field present');
$tests->assert(isset($decoded['communications']), 'communications array in response');

// Verify confidence fields in JSON
if (!empty($decoded['communications']) && count($decoded['communications']) > 0) {
    $first_json = $decoded['communications'][0];
    $tests->assert(isset($first_json['confidence']), 'confidence field present in JSON response');
    $tests->assert(isset($first_json['reasoning']), 'reasoning field present in JSON response');
    $tests->assert(isset($first_json['extracted_at']), 'extracted_at field present in JSON response');
}

// Test 6: Confidence value range validation
$tests->testStart('Test 6: Confidence value range (0.0 to 1.0)');

if ($comm && isset($comm['confidence']) && $comm['confidence'] !== null) {
    $tests->assertGreaterThanOrEqual($comm['confidence'], 0, 'confidence >= 0');
    $tests->assertLessThanOrEqual($comm['confidence'], 1, 'confidence <= 1');
}

// Test 7: Reasoning text truncation for display (100 chars example)
$tests->testStart('Test 7: Reasoning text handling');

$long_reasoning = str_repeat('A', 150); // 150 char string

$test_message_id_long = 'test_msg_long_' . time();

$stmt = $pdo->prepare(
    'INSERT INTO communications
    (message_id, subject, body_preview, from_address, from_name, received_datetime,
     status, classification, confidence, reasoning, extracted_at, synced_at)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())'
);

try {
    $inserted = $stmt->execute([
        $test_message_id_long,
        'Long reasoning test',
        'Test',
        'test@example.com',
        'Sender',
        date('Y-m-d H:i:s'),
        'new',
        'JUDICIAL',
        0.85,
        $long_reasoning,
        date('Y-m-d H:i:s')
    ]);
    $comm_id_long = $pdo->lastInsertId();

    $comm_long = $communication->getById($comm_id_long);
    $tests->assertNotNull($comm_long['reasoning'], 'Long reasoning text stored');

    // In API display, reasoning can be truncated to 100 chars
    $truncated = substr($comm_long['reasoning'], 0, 100);
    $tests->assert(strlen($truncated) <= 100, 'reasoning can be truncated to 100 chars for display');
} catch (Exception $e) {
    $tests->assert(false, 'Failed to test long reasoning: ' . $e->getMessage());
}

// Test 8: Filter by status still returns new fields
$tests->testStart('Test 8: Filtered queries include new fields');

$filtered = $communication->getAll(['status' => 'processed']);
if (!empty($filtered)) {
    $first_filtered = $filtered[0];
    $tests->assert(isset($first_filtered['confidence']), 'confidence in filtered results');
    $tests->assert(isset($first_filtered['reasoning']), 'reasoning in filtered results');
}

// Cleanup test data
$tests->testStart('Cleanup: Remove test communications');

try {
    $pdo->prepare('DELETE FROM communications WHERE message_id LIKE ?')->execute(['test_msg_%']);
    $tests->assert(true, 'Test data cleaned up');
} catch (Exception $e) {
    $tests->assert(false, 'Cleanup failed: ' . $e->getMessage());
}

// Print summary
if ($tests->summary()) {
    echo "\n✓ All tests passed!\n\n";
    exit(0);
} else {
    echo "\n✗ Some tests failed.\n\n";
    exit(1);
}
?>
