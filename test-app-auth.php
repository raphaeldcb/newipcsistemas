<?php
session_start();

// Load config
$config = require_once __DIR__ . '/config/config.php';

// Load service
require_once __DIR__ . '/html/services/MicrosoftAppAuthService.php';

echo "<h2>Testing App-Only Authentication</h2>";
echo "<pre>";

// Debug: Show config
echo "GRAPH_CLIENT_ID: " . (isset($config['microsoft']['client_id']) && $config['microsoft']['client_id'] ? "✅ SET" : "❌ EMPTY") . "\n";
echo "GRAPH_CLIENT_SECRET: " . (isset($config['microsoft']['client_secret']) && $config['microsoft']['client_secret'] ? "✅ SET" : "❌ EMPTY") . "\n";
echo "GRAPH_TENANT_ID: " . (isset($config['microsoft']['tenant_id']) && $config['microsoft']['tenant_id'] ? "✅ SET" : "❌ EMPTY") . "\n";

echo "\n--- Attempting to get token ---\n";

$appAuth = new MicrosoftAppAuthService($config);
$token = $appAuth->getValidToken();

if ($token) {
    echo "✅ SUCCESS! Token obtained:\n";
    echo "Token (first 50 chars): " . substr($token, 0, 50) . "...\n";
} else {
    echo "❌ FAILED! No token returned.\n";
}

echo "</pre>";
