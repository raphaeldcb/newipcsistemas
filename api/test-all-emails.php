<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$app->make(\Illuminate\Contracts\Console\Kernel::class)->bootstrap();

echo "=== Listando TODOS os e-mails ===\n\n";

$token = env('GRAPH_CLIENT_ID') ? true : false;

if (!$token) {
    echo "❌ Credenciais não carregadas\n";
    exit(1);
}

// Teste direto com cURL
$client_id = env('GRAPH_CLIENT_ID');
$client_secret = env('GRAPH_CLIENT_SECRET');
$tenant_id = env('GRAPH_TENANT_ID');
$mailbox = env('GRAPH_MAILBOX');

// Obter token
$ch = curl_init();
curl_setopt_array($ch, [
    CURLOPT_URL => "https://login.microsoftonline.com/{$tenant_id}/oauth2/v2.0/token",
    CURLOPT_POST => true,
    CURLOPT_POSTFIELDS => http_build_query([
        'client_id' => $client_id,
        'client_secret' => $client_secret,
        'scope' => 'https://graph.microsoft.com/.default',
        'grant_type' => 'client_credentials',
    ]),
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_SSL_VERIFYPEER => false,
]);

$response = curl_exec($ch);
$data = json_decode($response, true);
$token = $data['access_token'] ?? null;

if (!$token) {
    echo "❌ Erro ao obter token\n";
    exit(1);
}

echo "✅ Token obtido\n\n";

// Buscar e-mails
echo "Buscando e-mails em: $mailbox\n\n";

$ch = curl_init();
curl_setopt_array($ch, [
    CURLOPT_URL => "https://graph.microsoft.com/v1.0/users/{$mailbox}/mailFolders/inbox/messages?\$top=20&\$orderby=receivedDateTime desc",
    CURLOPT_HTTPHEADER => [
        "Authorization: Bearer $token",
        "Content-Type: application/json",
    ],
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_SSL_VERIFYPEER => false,
]);

$response = curl_exec($ch);
$emails = json_decode($response, true);

if (isset($emails['value'])) {
    echo "Total encontrado: " . count($emails['value']) . "\n\n";

    foreach ($emails['value'] as $i => $email) {
        echo ($i+1) . ". {$email['subject']}\n";
        echo "   De: {$email['from']['emailAddress']['address']}\n";
        echo "   Data: {$email['receivedDateTime']}\n";
        echo "   Lido: " . ($email['isRead'] ? 'SIM' : 'NÃO') . "\n";
        echo "   ID: {$email['id']}\n\n";
    }
} else {
    echo "❌ Erro na resposta:\n";
    echo json_encode($emails, JSON_PRETTY_PRINT);
}

?>
