<?php
/**
 * Novos Sistemas IPC - Main Entry Point
 * Suporta query string (?page=) e URL rewriting
 */

session_start();

// Load environment variables from .env or .env.local
require_once __DIR__ . '/config/load-env.php';

$config = require_once __DIR__ . '/config/config.php';

// Database connection
try {
    $pdo = new PDO(
        'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['database'] . ';charset=' . $config['db']['charset'],
        $config['db']['username'],
        $config['db']['password'],
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        ]
    );
} catch (PDOException $e) {
    die('Database connection error: ' . $e->getMessage());
}

// Check authentication
$is_logged_in = isset($_SESSION['user_id']);
$user = null;

if ($is_logged_in) {
    $stmt = $pdo->prepare('SELECT * FROM users WHERE id = ?');
    $stmt->execute([$_SESSION['user_id']]);
    $user = $stmt->fetch();
    if (!$user) {
        session_destroy();
        header('Location: /newipcsistemas/index.php');
        exit;
    }
}

// Determine page
$page = strtolower($_GET['page'] ?? '');

// AUTO-AUTHENTICATE WITH MICROSOFT
// If logged in, not already authenticated with Microsoft, and not on a auth page
if ($is_logged_in && !isset($_SESSION['microsoft_access_token']) &&
    strpos($page, 'auth') === false && $page !== 'logout') {
    // Automatically redirect to Microsoft authentication
    header('Location: /newipcsistemas/index.php?page=auth/microsoft');
    exit;
}

// Base path for redirects
$base = '/newipcsistemas/index.php';

// Route handling
switch ($page) {
    // ===== LOGIN =====
    case 'login':
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            require __DIR__ . '/html/controllers/AuthController.php';
        } else {
            if ($is_logged_in) {
                header("Location: {$base}");
                exit;
            }
            require __DIR__ . '/html/views/login.php';
        }
        break;

    // ===== LOGOUT =====
    case 'logout':
        session_destroy();
        header("Location: {$base}");
        exit;

    // ===== MICROSOFT OAUTH =====
    case 'auth/microsoft':
        if (!$is_logged_in) {
            header("Location: {$base}?page=login");
            exit;
        }
        require __DIR__ . '/html/controllers/OAuthController.php';
        $oauth = new OAuthController($pdo, $config);
        $auth_url = $oauth->getAuthorizationUrl();
        require __DIR__ . '/html/views/auth_microsoft.php';
        break;

    case 'auth/callback':
        if (!$is_logged_in) {
            header("Location: {$base}?page=login");
            exit;
        }
        require __DIR__ . '/html/controllers/OAuthController.php';
        $oauth = new OAuthController($pdo, $config);
        $result = $oauth->handleCallback();
        require __DIR__ . '/html/views/auth_callback.php';
        break;

    case 'auth/disconnect':
        if (!$is_logged_in) {
            header("Location: {$base}?page=login");
            exit;
        }
        require __DIR__ . '/html/controllers/OAuthController.php';
        $oauth = new OAuthController($pdo, $config);
        $oauth->disconnect();
        header("Location: {$base}?page=comunicacoes&disconnected=true");
        exit;

    // ===== COMMUNICATIONS DEBUG =====
    case 'comunicacoes-debug':
        if (!$is_logged_in) {
            header("Location: {$base}?page=login");
            exit;
        }
        require __DIR__ . '/html/views/comunicacoes-debug.php';
        break;

    // ===== COMMUNICATIONS =====
    case 'comunicacoes':
        if (!$is_logged_in) {
            header("Location: {$base}?page=login");
            exit;
        }
        require __DIR__ . '/html/views/comunicacoes.php';
        break;

    // ===== DEFAULT / DASHBOARD =====
    default:
        if ($is_logged_in) {
            require __DIR__ . '/html/views/dashboard.php';
        } else {
            require __DIR__ . '/html/views/login.php';
        }
        break;
}
