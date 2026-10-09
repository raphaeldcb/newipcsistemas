<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$app->make(\Illuminate\Contracts\Console\Kernel::class)->bootstrap();

echo "=== Testando Microsoft Graph ===\n\n";

$svc = new \App\Services\MicrosoftGraphEmailService();

echo "1. Obtendo token...\n";
$token = $svc->getAccessToken();
if (!$token) {
    echo "❌ Erro ao obter token\n";
    exit(1);
}
echo "✅ Token obtido!\n\n";

echo "2. Buscando e-mails não lidos...\n";
$emails = $svc->getUnreadEmails(10);
echo "Total encontrado: " . count($emails) . "\n\n";

if (count($emails) > 0) {
    echo "3. E-mails:\n";
    foreach ($emails as $i => $e) {
        echo ($i+1) . ". {$e['subject']}\n";
        echo "   De: {$e['from']}\n";
        echo "   Para: {$e['to']}\n";
        echo "   Data: {$e['received_at']}\n";
        echo "   Body: " . substr($e['body'], 0, 100) . "...\n\n";
    }
} else {
    echo "⚠️ Nenhum e-mail não lido encontrado!\n";
    echo "Verifique:\n";
    echo "- Se há e-mails realmente não lidos em financeiro@ipcms.com.br\n";
    echo "- Se as credenciais estão corretas\n";
}
?>
