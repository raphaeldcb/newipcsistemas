<?php
/**
 * Test API with active session (simulates logged-in user)
 */

// Start session FIRST
session_start();

// Simulate logged-in user
$_SESSION['user_id'] = 1;

// Now test the API call
$_GET['action'] = 'get_detail';
$_GET['id'] = 1;

echo "═══════════════════════════════════════════════════════\n";
echo "API TEST WITH SESSION\n";
echo "═══════════════════════════════════════════════════════\n\n";

echo "Session ID: " . session_id() . "\n";
echo "User ID in session: " . ($_SESSION['user_id'] ?? 'NOT SET') . "\n\n";

// Now simulate what api.php does
header('Content-Type: application/json');

try {
    require_once __DIR__ . '/config/load-env.php';
    $config = require_once __DIR__ . '/config/config.php';

    // Database connection
    $pdo = new PDO(
        'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['database'] . ';charset=' . $config['db']['charset'],
        $config['db']['username'],
        $config['db']['password'],
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );

    // Load classes
    require_once __DIR__ . '/html/controllers/CommunicacionsController.php';
    require_once __DIR__ . '/html/controllers/ExtractionController.php';
    require_once __DIR__ . '/html/controllers/EmailResponseController.php';
    require_once __DIR__ . '/html/services/EmailCategorizationService.php';

    // Check authentication (same as api.php)
    if (!isset($_SESSION['user_id']) && php_sapi_name() !== 'cli') {
        throw new Exception('Not authenticated');
    }

    echo "✓ Authentication check passed\n";
    echo "✓ Database connected\n";
    echo "✓ Classes loaded\n\n";

    // Process request
    $action = $_GET['action'] ?? null;
    $response = ['success' => false, 'error' => 'Unknown action'];

    if ($action === 'get_detail') {
        $id = $_GET['id'] ?? null;
        if ($id) {
            $stmt = $pdo->prepare('SELECT * FROM communications WHERE id = ?');
            $stmt->execute([$id]);
            $comm = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($comm) {
                $response = ['success' => true, 'communication' => $comm];
            } else {
                $response = ['success' => false, 'error' => 'Communication not found'];
            }
        } else {
            $response = ['success' => false, 'error' => 'Missing communication ID'];
        }
    }

    echo "Action: $action\n";
    echo "Response: " . json_encode($response, JSON_UNESCAPED_SLASHES) . "\n";

} catch (Exception $e) {
    echo "ERROR: " . $e->getMessage() . "\n";
    echo "File: " . $e->getFile() . "\n";
    echo "Line: " . $e->getLine() . "\n";
}

echo "\n═══════════════════════════════════════════════════════\n";
?>
