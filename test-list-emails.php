<?php
session_start();

$config = require_once __DIR__ . '/config/config.php';
require_once __DIR__ . '/html/services/MicrosoftAppAuthService.php';

echo "<h2>Testing Email Listing</h2>";
echo "<pre>";

// Get token
$appAuth = new MicrosoftAppAuthService($config);
$token = $appAuth->getValidToken();

if (!$token) {
    echo "❌ Failed to get token\n";
    exit;
}

echo "✅ Token obtained\n";
echo "Token: " . substr($token, 0, 50) . "...\n\n";

// Test mailbox parameter
$mailbox = $config['microsoft']['mailbox'] ?? 'financeiro@ipcms.com.br';
echo "Mailbox: $mailbox\n\n";

// List emails
echo "--- Listing Emails ---\n";

$graphUrl = "https://graph.microsoft.com/v1.0/users/{$mailbox}/mailFolders/inbox/messages";
echo "URL: $graphUrl\n\n";

$ch = curl_init($graphUrl);
curl_setopt_array($ch, [
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_HTTPHEADER => [
        'Authorization: Bearer ' . $token,
        'Content-Type: application/json'
    ],
    CURLOPT_TIMEOUT => 10,
    CURLOPT_SSL_VERIFYPEER => false,
    CURLOPT_SSL_VERIFYHOST => false
]);

$response = curl_exec($ch);
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$curlError = curl_error($ch);
curl_close($ch);

echo "HTTP Code: $httpCode\n";
echo "cURL Error: " . ($curlError ?: "None") . "\n\n";

if ($response) {
    $decoded = json_decode($response, true);
    if ($httpCode === 200 && isset($decoded['value'])) {
        echo "✅ SUCCESS! Found " . count($decoded['value']) . " emails\n\n";
        echo "First 3 emails:\n";
        foreach (array_slice($decoded['value'], 0, 3) as $email) {
            echo "  - " . $email['subject'] . " (from: " . $email['from']['emailAddress']['address'] . ")\n";
        }
    } else {
        echo "Response:\n";
        echo json_encode($decoded, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES) . "\n";
    }
}

echo "</pre>";
