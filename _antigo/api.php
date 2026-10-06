<?php
/**
 * API Endpoint for Communications
 * JSON API for frontend interactions
 */

// CRITICAL: No output before this header!
// Start session FIRST
session_start();

// THEN set header
header('Content-Type: application/json');
// Error handler for JSON output
set_error_handler(function($errno, $errstr, $errfile, $errline) {
    http_response_code(400);
    echo json_encode(['success' => false, 'error' => $errstr, 'file' => basename($errfile), 'line' => $errline]);
    exit;
});


// Check authentication (but allow API calls from authenticated page context)
// AJAX calls from the page inherit the session cookie
if (!isset($_SESSION['user_id']) && php_sapi_name() !== 'cli') {
    // Only reject if truly not authenticated (not a CLI test)
    http_response_code(401);
    echo json_encode(['success' => false, 'error' => 'Not authenticated']);
    exit;
}

// Load environment variables
require_once __DIR__ . '/config/load-env.php';

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

// Load controllers
require_once __DIR__ . '/html/controllers/CommunicacionsController.php';
require_once __DIR__ . '/html/controllers/ExtractionController.php';
require_once __DIR__ . '/html/controllers/EmailResponseController.php';
require_once __DIR__ . '/html/controllers/UserController.php';
require_once __DIR__ . '/html/services/EmailCategorizationService.php';
require_once __DIR__ . '/html/services/EmailClassifierService.php';
// Auto-refresh Microsoft token
require_once __DIR__ . '/html/services/MicrosoftTokenService.php';
require_once __DIR__ . '/html/services/MicrosoftAppAuthService.php';

// Try user token first, fall back to app-only auth
$tokenService = new MicrosoftTokenService($pdo, $config);
$validToken = $tokenService->getValidAccessToken();

if (!$validToken) {
    // User not authenticated, use app-only auth
    $appAuth = new MicrosoftAppAuthService($config);
    $validToken = $appAuth->getValidToken();
}

if ($validToken) {
    $_SESSION['microsoft_access_token'] = $validToken;
}


$controller = new CommunicationsController($pdo, $config);
$extraction = new ExtractionController($pdo, $config);
$email_response = new EmailResponseController($pdo, $config);
$categorization = new EmailCategorizationService($config, $pdo);

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

    case 'extract':
        $id = $_GET['id'] ?? null;
        if ($id) {
            $response = $extraction->extractCommunication($id);
        } else {
            $response = ['success' => false, 'error' => 'Missing communication ID'];
        }
        break;

    case 'extract_batch':
        $status = $_GET['status'] ?? 'new';
        $limit = $_GET['limit'] ?? 10;
        $response = $extraction->extractBatch($status, $limit);
        break;

    case 'get_detail':
        $id = $_GET['id'] ?? null;
        if ($id) {
            // Explicit select including new classification fields (confidence, reasoning, extracted_at)
            $query = 'SELECT id, message_id, conversation_id, subject, body_preview,
                             from_address, from_name, to_addresses, cc_addresses, bcc_addresses,
                             received_datetime, vara, comarca, processo_numero, pedido,
                             has_attachments, attachment_count, status, classification,
                             processed_at, processing_notes, is_duplicate, duplicate_of_id,
                             user_corrected, correction_notes, synced_at, created_at, updated_at,
                             confidence, reasoning, extracted_at
                      FROM communications WHERE id = ?';
            $stmt = $pdo->prepare($query);
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
        break;

    case 'mark_analyzed':
        $id = $_GET['id'] ?? $_POST['id'] ?? null;
        if ($id) {
            $access_token = $_SESSION['microsoft_access_token'] ?? null;
            $response = $categorization->markAsAnalyzed($id, $access_token);
        } else {
            $response = ['success' => false, 'error' => 'Missing communication ID'];
        }
        break;

    case 'schedule_response':
        $body_data = json_decode(file_get_contents('php://input'), true) ?? [];
        error_log('SCHEDULE_RESPONSE - body_data: ' . json_encode($body_data));

        $comm_id = $_POST['communication_id'] ?? $body_data['id'] ?? null;
        $to_email = $_POST['to_email'] ?? $body_data['to'] ?? null;
        $subject = $_POST['subject'] ?? $body_data['subject'] ?? null;
        $body = $_POST['body'] ?? $body_data['body'] ?? null;
        $scheduled_date = $_POST['scheduled_date'] ?? $body_data['date'] ?? null;
        $scheduled_time = $_POST['scheduled_time'] ?? $body_data['time'] ?? null;

        error_log("SCHEDULE_RESPONSE - Parsed: comm_id=$comm_id, to=$to_email, subject=$subject, body_len=" . strlen($body ?? '') . ", date=$scheduled_date, time=$scheduled_time");

        if ($comm_id && $to_email && $subject && $body && $scheduled_date && $scheduled_time) {
            $access_token = $_SESSION['microsoft_access_token'] ?? null;
            $response = $email_response->scheduleResponse(
                $comm_id,
                $to_email,
                $subject,
                $body,
                $scheduled_date,
                $scheduled_time,
                $access_token
            );
        } else {
            $response = ['success' => false, 'error' => 'Missing required fields'];
        }
        break;

    case 'classify_email':
        $comm_id = $_GET['id'] ?? $_POST['id'] ?? null;
        if ($comm_id) {
            $classifier = new EmailClassifierService($pdo);
            $response = $classifier->classifyEmail($comm_id);
        } else {
            $response = ['success' => false, 'error' => 'Missing communication ID'];
        }
        break;

    case 'create_user':
        $email = $_POST['email'] ?? null;
        $password = $_POST['password'] ?? null;
        $role = $_POST['role'] ?? 'user';

        if ($email && $password) {
            $user_controller = new UserController($pdo);
            $response = $user_controller->createUser($email, $password, $role);
        } else {
            $response = ['success' => false, 'error' => 'Missing email or password'];
        }
        break;

    case 'update_user':
        $id = $_POST['id'] ?? null;
        $email = $_POST['email'] ?? null;
        $role = $_POST['role'] ?? 'user';
        $password = $_POST['password'] ?? null;

        if ($id && $email) {
            $user_controller = new UserController($pdo);
            $response = $user_controller->updateUser($id, $email, $role);

            if ($response['success'] && $password) {
                $response = $user_controller->updatePassword($id, $password);
            }
        } else {
            $response = ['success' => false, 'error' => 'Missing id or email'];
        }
        break;

    case 'delete_user':
        $id = $_POST['id'] ?? null;
        if ($id) {
            $user_controller = new UserController($pdo);
            $response = $user_controller->deleteUser($id);
        } else {
            $response = ['success' => false, 'error' => 'Missing id'];
        }
        break;

    default:
        http_response_code(400);
        break;
}

echo json_encode($response);
?>