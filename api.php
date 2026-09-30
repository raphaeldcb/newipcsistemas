<?php
/**
 * API Endpoint for Communications
 * JSON API for frontend interactions
 */

header('Content-Type: application/json');

// Start session
session_start();

// Check authentication
if (!isset($_SESSION['user_id'])) {
    http_response_code(401);
    echo json_encode(['success' => false, 'error' => 'Not authenticated']);
    exit;
}

// Load config and database
$config = require_once __DIR__ . '/config/config.php';
try {
    $pdo = new PDO(
        'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['database'] . ';charset=' . $config['db']['charset'],
        $config['db']['username'],
        $config['db']['password'],
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'error' => 'Database connection error']);
    exit;
}

// Load controller
require_once __DIR__ . '/html/controllers/CommunicacionsController.php';
$controller = new CommunicationsController($pdo, $config);

// Route the request
$action = $_GET['action'] ?? null;
$response = ['success' => false, 'error' => 'Unknown action'];

switch ($action) {
    case 'sync':
        $response = $controller->sync();
        break;

    case 'list':
        $data = $controller->list();
        $response = [
            'success' => true,
            'communications' => $data['communications'],
            'stats' => $data['stats'],
        ];
        break;

    case 'get':
        $id = $_GET['id'] ?? null;
        if ($id) {
            $comm = $controller->get($id);
            $response = ['success' => (bool)$comm, 'communication' => $comm];
        }
        break;

    case 'update_status':
        $id = $_POST['id'] ?? null;
        $status = $_POST['status'] ?? null;
        if ($id && $status) {
            $response = $controller->updateStatus($id, $status);
        }
        break;

    case 'update_extracted':
        $id = $_POST['id'] ?? null;
        if ($id) {
            $data = [
                'vara' => $_POST['vara'] ?? null,
                'comarca' => $_POST['comarca'] ?? null,
                'processo' => $_POST['processo'] ?? null,
                'pedido' => $_POST['pedido'] ?? null,
                'classification' => $_POST['classification'] ?? null,
            ];
            $response = $controller->updateExtracted($id, $data);
        }
        break;

    case 'stats':
        $data = $controller->list();
        $response = ['success' => true, 'stats' => $data['stats']];
        break;

    default:
        http_response_code(400);
        break;
}

echo json_encode($response);
