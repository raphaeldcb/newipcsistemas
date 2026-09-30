<?php
/**
 * Debug API errors
 * Shows what's happening with get_detail endpoint
 */

session_start();

// Fake authentication for testing
$_SESSION['user_id'] = 1;

echo "═══════════════════════════════════════════════════════\n";
echo "DEBUG API - get_detail Endpoint\n";
echo "═══════════════════════════════════════════════════════\n\n";

// Load environment and config
require_once __DIR__ . '/config/load-env.php';
$config = require_once __DIR__ . '/config/config.php';

echo "✓ Config loaded\n";
echo "  DB Host: " . $config['db']['host'] . "\n";
echo "  DB Name: " . $config['db']['database'] . "\n\n";

// Connect to database
try {
    $pdo = new PDO(
        'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['database'] . ';charset=' . $config['db']['charset'],
        $config['db']['username'],
        $config['db']['password'],
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
    echo "✓ Database connected\n\n";
} catch (PDOException $e) {
    echo "❌ Database error: " . $e->getMessage() . "\n";
    exit(1);
}

// Load controllers
try {
    require_once __DIR__ . '/html/controllers/CommunicacionsController.php';
    require_once __DIR__ . '/html/controllers/ExtractionController.php';
    require_once __DIR__ . '/html/controllers/EmailResponseController.php';
    require_once __DIR__ . '/html/services/EmailCategorizationService.php';

    echo "✓ All classes loaded\n\n";
} catch (Exception $e) {
    echo "❌ Error loading classes: " . $e->getMessage() . "\n";
    exit(1);
}

// Test get_detail with first communication
echo "Testing get_detail endpoint:\n";
echo "─────────────────────────────\n\n";

$stmt = $pdo->prepare('SELECT id FROM communications LIMIT 1');
$stmt->execute();
$result = $stmt->fetch();

if ($result) {
    $id = $result['id'];
    echo "Found communication ID: {$id}\n\n";

    // Simulate the API call
    $stmt = $pdo->prepare('SELECT * FROM communications WHERE id = ?');
    $stmt->execute([$id]);
    $comm = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($comm) {
        echo "✅ Communication fetched successfully!\n\n";
        echo "Data returned:\n";
        echo "───────────────\n";
        foreach ($comm as $key => $value) {
            $display_value = strlen($value ?? '') > 50 ? substr($value, 0, 50) . '...' : $value;
            echo "  {$key}: {$display_value}\n";
        }

        echo "\n✅ JSON Response would be:\n";
        echo "──────────────────────────\n";
        $response = ['success' => true, 'communication' => $comm];
        echo json_encode($response, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
    } else {
        echo "❌ Communication not found\n";
    }
} else {
    echo "❌ No communications in database\n";
    echo "   Run: php seed-test-data.php\n";
}

echo "\n═══════════════════════════════════════════════════════\n";
?>
