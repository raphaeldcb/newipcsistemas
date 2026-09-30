<?php
/**
 * Test API call exactly as the browser does
 * Simulates: GET /api.php?action=get_detail&id=1
 */

error_reporting(E_ALL);
ini_set('display_errors', 0);  // Don't show errors as text

// Simulate browser environment
session_start();
$_SESSION['user_id'] = 1;
$_GET['action'] = 'get_detail';
$_GET['id'] = 1;

// Set header BEFORE any output
header('Content-Type: application/json');

echo "Starting API test...\n";

try {
    // Load environment and config
    require_once __DIR__ . '/config/load-env.php';
    $config = require_once __DIR__ . '/config/config.php';

    // Connect to database
    $pdo = new PDO(
        'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['database'] . ';charset=' . $config['db']['charset'],
        $config['db']['username'],
        $config['db']['password'],
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );

    // Load controllers
    require_once __DIR__ . '/html/controllers/CommunicacionsController.php';
    require_once __DIR__ . '/html/controllers/ExtractionController.php';
    require_once __DIR__ . '/html/controllers/EmailResponseController.php';
    require_once __DIR__ . '/html/services/EmailCategorizationService.php';

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

    // Output as JSON
    echo json_encode($response);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'error' => 'Server error: ' . $e->getMessage(),
        'file' => $e->getFile(),
        'line' => $e->getLine()
    ]);
}
?>
