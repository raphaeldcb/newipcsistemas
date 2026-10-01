<?php
session_start();

$config = require_once __DIR__ . '/config/config.php';
require_once __DIR__ . '/html/services/MicrosoftAppAuthService.php';

echo "<h2>Testing App-Only Authentication</h2>";
echo "<pre>";

// Show config
echo "✓ GRAPH_CLIENT_ID: " . (strlen($config['microsoft']['client_id'] ?? '') > 0 ? "SET (" . strlen($config['microsoft']['client_id']) . " chars)" : "EMPTY") . "\n";
echo "✓ GRAPH_CLIENT_SECRET: " . (strlen($config['microsoft']['client_secret'] ?? '') > 0 ? "SET (" . strlen($config['microsoft']['client_secret']) . " chars)" : "EMPTY") . "\n";
echo "✓ GRAPH_TENANT_ID: " . (strlen($config['microsoft']['tenant_id'] ?? '') > 0 ? "SET (" . strlen($config['microsoft']['tenant_id']) . " chars)" : "EMPTY") . "\n";

// Test token endpoint directly
echo "\n--- Testing Token Endpoint Directly ---\n";

$clientId = $config['microsoft']['client_id'];
$clientSecret = $config['microsoft']['client_secret'];
$tenantId = $config['microsoft']['tenant_id'];

$tokenEndpoint = "https://login.microsoftonline.com/{$tenantId}/oauth2/v2.0/token";

$data = [
    'client_id' => $clientId,
    'client_secret' => $clientSecret,
    'scope' => 'https://graph.microsoft.com/.default',
    'grant_type' => 'client_credentials'
];

echo "Endpoint: $tokenEndpoint\n";
echo "POST Data: grant_type=" . $data['grant_type'] . ", scope=" . $data['scope'] . "\n\n";

$ch = curl_init($tokenEndpoint);
curl_setopt_array($ch, [
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_POST => true,
    CURLOPT_POSTFIELDS => http_build_query($data),
    CURLOPT_HTTPHEADER => ['Content-Type: application/x-www-form-urlencoded'],
    CURLOPT_TIMEOUT => 10,
    CURLOPT_VERBOSE => false
]);

$response = curl_exec($ch);
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$curlError = curl_error($ch);
curl_close($ch);

echo "HTTP Code: $httpCode\n";
echo "cURL Error: " . ($curlError ?: "None") . "\n";

if ($response) {
    $decoded = json_decode($response, true);
    if (json_last_error() === JSON_ERROR_NONE) {
        echo "Response (JSON):\n";
        echo json_encode($decoded, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES) . "\n";
    } else {
        echo "Response (Raw):\n";
        echo substr($response, 0, 500) . "\n";
    }
}

echo "</pre>";
