<?php
/**
 * Test if credentials are loaded correctly
 */

// Load environment variables
require_once __DIR__ . '/config/load-env.php';

// Load config
$config = require_once __DIR__ . '/config/config.php';

echo "═══════════════════════════════════════════════════════\n";
echo "CREDENCIAIS CARREGADAS\n";
echo "═══════════════════════════════════════════════════════\n\n";

echo "Environment Variables:\n";
echo "  GRAPH_CLIENT_ID: " . (getenv('GRAPH_CLIENT_ID') ? "✓ " . substr(getenv('GRAPH_CLIENT_ID'), 0, 20) . "..." : "✗ NÃO DEFINIDA") . "\n";
echo "  GRAPH_CLIENT_SECRET: " . (getenv('GRAPH_CLIENT_SECRET') ? "✓ " . substr(getenv('GRAPH_CLIENT_SECRET'), 0, 20) . "..." : "✗ NÃO DEFINIDA") . "\n";
echo "  GRAPH_TENANT_ID: " . (getenv('GRAPH_TENANT_ID') ? "✓ " . getenv('GRAPH_TENANT_ID') : "✗ NÃO DEFINIDA") . "\n\n";

echo "Config Array:\n";
echo "  Client ID: " . (!empty($config['microsoft']['client_id']) ? "✓ " . substr($config['microsoft']['client_id'], 0, 20) . "..." : "✗ VAZIA") . "\n";
echo "  Client Secret: " . (!empty($config['microsoft']['client_secret']) ? "✓ " . substr($config['microsoft']['client_secret'], 0, 20) . "..." : "✗ VAZIA") . "\n";
echo "  Tenant ID: " . (!empty($config['microsoft']['tenant_id']) ? "✓ " . $config['microsoft']['tenant_id'] : "✗ VAZIA") . "\n";
echo "  Mailbox: " . (!empty($config['microsoft']['mailbox']) ? "✓ " . $config['microsoft']['mailbox'] : "✗ VAZIA") . "\n\n";

$all_set = !empty($config['microsoft']['client_id']) &&
           !empty($config['microsoft']['client_secret']) &&
           !empty($config['microsoft']['tenant_id']);

if ($all_set) {
    echo "✅ TODAS AS CREDENCIAIS ESTÃO CONFIGURADAS\n";
    echo "Auto-conexão deve funcionar!\n";
} else {
    echo "❌ FALTAM CREDENCIAIS\n";
    echo "Auto-conexão NÃO vai funcionar\n";
}

echo "\n═══════════════════════════════════════════════════════\n";
?>
