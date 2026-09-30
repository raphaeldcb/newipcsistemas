<?php
/**
 * Debug AJAX Flow
 * Simulates the exact AJAX call from the modal
 */

session_start();

echo "═══════════════════════════════════════════════════════\n";
echo "AJAX FLOW DEBUG\n";
echo "═══════════════════════════════════════════════════════\n\n";

// Simulate being logged in (in real scenario, this should already exist)
if (!isset($_SESSION['user_id'])) {
    $_SESSION['user_id'] = 1;
    echo "⚠️  No session found. Simulating logged-in user (user_id=1)\n\n";
} else {
    echo "✅ Session exists. User ID: " . $_SESSION['user_id'] . "\n\n";
}

// Now simulate what happens when fetch() is called
echo "Simulating fetch('/api.php?action=get_detail&id=1')\n";
echo "─────────────────────────────────────────────────────\n\n";

// Load API
$_GET['action'] = 'get_detail';
$_GET['id'] = 1;

echo "Step 1: Check authentication\n";
if (!isset($_SESSION['user_id']) && php_sapi_name() !== 'cli') {
    echo "  ❌ REJECTED: Not authenticated\n";
    echo "  This is what happens in real API when fetch() doesn't send cookie!\n";
} else {
    echo "  ✅ PASSED: User is authenticated (user_id=" . ($_SESSION['user_id'] ?? 'N/A') . ")\n";
}

echo "\nStep 2: Load database\n";
require_once __DIR__ . '/config/load-env.php';
$config = require_once __DIR__ . '/config/config.php';

try {
    $pdo = new PDO(
        'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['database'] . ';charset=' . $config['db']['charset'],
        $config['db']['username'],
        $config['db']['password'],
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
    echo "  ✅ Database connected\n";
} catch (PDOException $e) {
    echo "  ❌ Database error: " . $e->getMessage() . "\n";
    exit(1);
}

echo "\nStep 3: Execute get_detail query\n";
$id = $_GET['id'];
$stmt = $pdo->prepare('SELECT * FROM communications WHERE id = ?');
$stmt->execute([$id]);
$comm = $stmt->fetch(PDO::FETCH_ASSOC);

if ($comm) {
    echo "  ✅ Communication found (ID: {$id})\n";
    echo "  Subject: " . substr($comm['subject'] ?? '', 0, 50) . "...\n";
    echo "  From: " . ($comm['from_address'] ?? 'N/A') . "\n";

    echo "\nStep 4: Return JSON response\n";
    $response = ['success' => true, 'communication' => $comm];
    $json = json_encode($response);
    echo "  ✅ JSON Response:\n";
    echo "     " . substr($json, 0, 100) . "...\n";
} else {
    echo "  ❌ Communication NOT found (ID: {$id})\n";
    echo "  Check if table has data: SELECT COUNT(*) FROM communications;\n";
}

echo "\n═══════════════════════════════════════════════════════\n";
echo "\nTROUBLESHOOTING:\n";
echo "1. If 'REJECTED: Not authenticated' appears above:\n";
echo "   → Browser is NOT sending the cookie with fetch()\n";
echo "   → Check: Are you logged in? (visit http://localhost/newipcsistemas/ first)\n";
echo "   → Check: Browser console for CORS/cookie warnings\n";
echo "   → Check: Use curl test with explicit cookies\n\n";

echo "2. To test with curl including cookies:\n";
echo "   curl -b 'PHPSESSID=YOUR_SESSION_ID' \\\n";
echo "        'http://localhost/newipcsistemas/api.php?action=get_detail&id=1'\n\n";

echo "3. To get current session ID from browser:\n";
echo "   Open DevTools (F12) → Console → document.cookie\n";
?>
