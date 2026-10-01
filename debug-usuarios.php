<?php
/**
 * Debug usuarios page
 */

session_start();

echo "=== DEBUG USUARIOS PAGE ===\n\n";

// Check session
echo "1. Session:\n";
echo "   - user_id: " . ($_SESSION['user_id'] ?? 'NOT SET') . "\n";
echo "   - role: " . ($_SESSION['role'] ?? 'NOT SET') . "\n";
echo "   - logged_in: " . (isset($_SESSION['user_id']) ? 'YES' : 'NO') . "\n\n";

// Check if admin
$is_admin = ($_SESSION['role'] ?? '') === 'admin';
echo "2. Admin check:\n";
echo "   - is_admin: " . ($is_admin ? 'YES' : 'NO') . "\n\n";

// Try to load database
echo "3. Database:\n";
require_once __DIR__ . '/config/load-env.php';
$config = require_once __DIR__ . '/config/config.php';

try {
    $pdo = new PDO(
        'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['database'] . ';charset=' . $config['db']['charset'],
        $config['db']['username'],
        $config['db']['password'],
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
    echo "   - Connected: YES\n";

    // Count users
    $stmt = $pdo->query("SELECT COUNT(*) as count FROM users");
    $result = $stmt->fetch();
    echo "   - Users count: " . $result['count'] . "\n\n";

} catch (Exception $e) {
    echo "   - Connected: NO\n";
    echo "   - Error: " . $e->getMessage() . "\n\n";
}

// Try to load controller
echo "4. UserController:\n";
try {
    require_once __DIR__ . '/html/controllers/UserController.php';
    $controller = new UserController($pdo);
    echo "   - Loaded: YES\n";

    $users = $controller->listUsers();
    echo "   - listUsers() returned: " . count($users) . " users\n\n";

} catch (Exception $e) {
    echo "   - Loaded: NO\n";
    echo "   - Error: " . $e->getMessage() . "\n\n";
}

// Summary
echo "5. Summary:\n";
if (!isset($_SESSION['user_id'])) {
    echo "   ❌ NOT LOGGED IN - redirect to login\n";
} elseif (($_SESSION['role'] ?? '') !== 'admin') {
    echo "   ❌ NOT ADMIN - access denied\n";
    echo "   Your role: " . $_SESSION['role'] . "\n";
} else {
    echo "   ✅ OK - should load usuarios.php\n";
}
?>
