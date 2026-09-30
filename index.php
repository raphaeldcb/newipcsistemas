<?php
/**
 * Novos Sistemas IPC - Main Entry Point
 */

// Start session
session_start();

// Load configuration
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

// Check if user is logged in
$is_logged_in = isset($_SESSION['user_id']);
$user = null;

if ($is_logged_in) {
    $stmt = $pdo->prepare('SELECT * FROM users WHERE id = ?');
    $stmt->execute([$_SESSION['user_id']]);
    $user = $stmt->fetch();

    if (!$user) {
        session_destroy();
        header('Location: /');
        exit;
    }
}

// Routing
$path = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$path = rtrim($path, '/') ?: '/';

switch ($path) {
    case '/':
        if ($is_logged_in) {
            require __DIR__ . '/html/views/dashboard.php';
        } else {
            require __DIR__ . '/html/views/login.php';
        }
        break;

    case '/login':
        require __DIR__ . '/html/controllers/AuthController.php';
        break;

    case '/logout':
        session_destroy();
        header('Location: /');
        exit;

    case '/auth/microsoft':
        if (!$is_logged_in) {
            header('Location: /');
            exit;
        }
        require __DIR__ . '/html/controllers/OAuthController.php';
        $oauth = new OAuthController($pdo, $config);
        $auth_url = $oauth->getAuthorizationUrl();
        require __DIR__ . '/html/views/auth_microsoft.php';
        break;

    case '/auth/callback':
        if (!$is_logged_in) {
            header('Location: /');
            exit;
        }
        require __DIR__ . '/html/controllers/OAuthController.php';
        $oauth = new OAuthController($pdo, $config);
        $result = $oauth->handleCallback();
        require __DIR__ . '/html/views/auth_callback.php';
        break;

    case '/auth/disconnect':
        if (!$is_logged_in) {
            header('Location: /');
            exit;
        }
        require __DIR__ . '/html/controllers/OAuthController.php';
        $oauth = new OAuthController($pdo, $config);
        $oauth->disconnect();
        header('Location: /comunicacoes?disconnected=true');
        exit;

    case '/comunicacoes':
        if (!$is_logged_in) {
            header('Location: /');
            exit;
        }
        require __DIR__ . '/html/views/comunicacoes.php';
        break;

    default:
        http_response_code(404);
        echo '<h1>404 - Page Not Found</h1>';
        break;
}
