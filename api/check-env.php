<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$app->make(\Illuminate\Contracts\Console\Kernel::class)->bootstrap();

echo "=== Verificando Variáveis de Ambiente ===\n\n";

$vars = [
    'GRAPH_CLIENT_ID',
    'GRAPH_CLIENT_SECRET',
    'GRAPH_TENANT_ID',
    'GRAPH_MAILBOX',
    'OLLAMA_URL'
];

foreach ($vars as $var) {
    $value = env($var);
    $status = $value ? '✅' : '❌';
    echo "$status $var = " . ($value ? substr($value, 0, 20) . '...' : 'NÃO DEFINIDO') . "\n";
}

echo "\n=== Arquivo .env ===\n";
if (file_exists('.env')) {
    $content = file_get_contents('.env');
    $lines = array_filter(explode("\n", $content), fn($l) => strpos($l, 'GRAPH_') === 0);
    foreach ($lines as $line) {
        echo $line . "\n";
    }
} else {
    echo "❌ .env não encontrado!\n";
}
?>
