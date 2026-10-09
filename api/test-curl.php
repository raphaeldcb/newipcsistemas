<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$app->make(\Illuminate\Contracts\Console\Kernel::class)->bootstrap();

echo "=== Teste Direto com cURL ===\n\n";

$client_id = env('GRAPH_CLIENT_ID');
$client_secret = env('GRAPH_CLIENT_SECRET');
$tenant_id = env('GRAPH_TENANT_ID');

$url = "https://login.microsoftonline.com/{$tenant_id}/oauth2/v2.0/token";

echo "URL: $url\n";
echo "Client ID: " . substr($client_id, 0, 10) . "...\n\n";

$ch = curl_init();
curl_setopt_array($ch, [
    CURLOPT_URL => $url,
    CURLOPT_POST => true,
    CURLOPT_POSTFIELDS => http_build_query([
        'client_id' => $client_id,
        'client_secret' => $client_secret,
        'scope' => 'https://graph.microsoft.com/.default',
        'grant_type' => 'client_credentials',
    ]),
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_TIMEOUT => 30,
    CURLOPT_SSL_VERIFYPEER => false,  // Desabilitar verificação SSL (risco!)
]);

echo "Enviando requisição...\n";
$response = curl_exec($ch);
$httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$error = curl_error($ch);

echo "HTTP Status: $httpcode\n";

if ($error) {
    echo "cURL Error: $error\n";
} else {
    echo "Response: " . substr($response, 0, 200) . "...\n";
}

if ($httpcode === 200) {
    $data = json_decode($response, true);
    echo "\n✅ Token obtido com sucesso!\n";
    echo "Token: " . substr($data['access_token'], 0, 50) . "...\n";
} else {
    echo "\n❌ Erro ao obter token\n";
}

?>
