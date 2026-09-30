<?php
/**
 * Debug Session Cookie
 * Verifies if session cookie is properly configured
 */

// Start session
session_start();

echo "═══════════════════════════════════════════════════════\n";
echo "SESSION COOKIE DEBUG\n";
echo "═══════════════════════════════════════════════════════\n\n";

// Check session configuration
echo "PHP Session Configuration:\n";
echo "─────────────────────────\n";
echo "Session Name: " . session_name() . "\n";
echo "Session ID: " . session_id() . "\n";
echo "Session Status: " . session_status() . " (1=disabled, 2=none, 3=active)\n";
echo "Cookie HttpOnly: " . (ini_get('session.cookie_httponly') ? 'YES' : 'NO') . "\n";
echo "Cookie SameSite: " . (ini_get('session.cookie_samesite') ?: 'NOT SET') . "\n";
echo "Cookie Secure: " . (ini_get('session.cookie_secure') ? 'YES' : 'NO') . "\n";
echo "Cookie Path: " . ini_get('session.cookie_path') . "\n";
echo "Cookie Domain: " . ini_get('session.cookie_domain') . "\n\n";

// Check if session data exists
echo "Session Data:\n";
echo "─────────────\n";
if (!empty($_SESSION)) {
    foreach ($_SESSION as $key => $value) {
        $display = is_array($value) ? json_encode($value) : $value;
        echo "  \$_SESSION['{$key}'] = " . substr($display, 0, 50) . "\n";
    }
} else {
    echo "  ⚠️  SESSION IS EMPTY - User not logged in!\n";
}
echo "\n";

// Check request headers
echo "Request Headers Received:\n";
echo "────────────────────────\n";
if (isset($_SERVER['HTTP_COOKIE'])) {
    echo "Cookie Header: " . $_SERVER['HTTP_COOKIE'] . "\n";
} else {
    echo "⚠️  NO COOKIE HEADER RECEIVED!\n";
}

echo "User-Agent: " . ($_SERVER['HTTP_USER_AGENT'] ?? 'N/A') . "\n";
echo "Referer: " . ($_SERVER['HTTP_REFERER'] ?? 'N/A') . "\n";
echo "\n";

// Test authentication
echo "Authentication Status:\n";
echo "──────────────────────\n";
if (isset($_SESSION['user_id'])) {
    echo "✅ User ID: " . $_SESSION['user_id'] . "\n";
    echo "✅ User is AUTHENTICATED\n";
} else {
    echo "❌ User ID: NOT SET\n";
    echo "❌ User is NOT AUTHENTICATED\n";
    echo "\nℹ️  Please log in first at http://localhost/newipcsistemas/\n";
}

echo "\n═══════════════════════════════════════════════════════\n";
?>
