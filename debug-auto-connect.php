<?php
/**
 * Debug script to diagnose auto-connect failure
 * Run: php debug-auto-connect.php
 */

// Load environment variables first
require_once __DIR__ . '/config/load-env.php';

// Load config
$config = require_once __DIR__ . '/config/config.php';

// Load services
require_once __DIR__ . '/html/services/MicrosoftGraphService.php';

// Initialize database connection (if available)
try {
    $pdo = new PDO(
        "mysql:host={$config['database']['host']};dbname={$config['database']['name']}",
        $config['database']['user'],
        $config['database']['password'],
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
} catch (Exception $e) {
    $pdo = null;
}

echo "═══════════════════════════════════════════════════════\n";
echo "AUTO-CONNECT DIAGNOSIS\n";
echo "═══════════════════════════════════════════════════════\n\n";

// Step 1: Verify credentials
echo "STEP 1: Verificando Credenciais\n";
echo "─────────────────────────────────\n";

$creds = [
    'client_id' => $config['microsoft']['client_id'] ?? null,
    'client_secret' => $config['microsoft']['client_secret'] ?? null,
    'tenant_id' => $config['microsoft']['tenant_id'] ?? null,
    'mailbox' => $config['microsoft']['mailbox'] ?? null,
];

foreach ($creds as $key => $value) {
    if (empty($value)) {
        echo "  ❌ $key: VAZIO\n";
    } else {
        // Hide sensitive values
        if (in_array($key, ['client_secret'])) {
            $masked = substr($value, 0, 5) . '...' . substr($value, -5);
        } else {
            $masked = $value;
        }
        echo "  ✓ $key: {$masked}\n";
    }
}

if (empty($creds['client_id']) || empty($creds['client_secret']) || empty($creds['tenant_id'])) {
    echo "\n❌ Credenciais incompletas! Abortando.\n";
    exit(1);
}

// Step 2: Try to create service
echo "\n\nSTEP 2: Criando MicrosoftGraphService\n";
echo "─────────────────────────────────────\n";

try {
    $graph = new MicrosoftGraphService($config, $pdo);
    echo "  ✓ Service criado com sucesso\n";
} catch (Exception $e) {
    echo "  ❌ Erro: " . $e->getMessage() . "\n";
    exit(1);
}

// Step 3: Test Client Credentials Flow
echo "\n\nSTEP 3: Testando Client Credentials Flow\n";
echo "─────────────────────────────────────────\n";

try {
    echo "  → Enviando requisição para: " .
        str_replace('{tenant}', $creds['tenant_id'], 'https://login.microsoftonline.com/{tenant}/oauth2/v2.0/token') . "\n";

    $token_response = $graph->getClientCredentialsToken();

    if (isset($token_response['access_token'])) {
        echo "  ✓ Token obtido com sucesso!\n";
        echo "    - Token Type: " . ($token_response['token_type'] ?? 'N/A') . "\n";
        echo "    - Expires In: " . ($token_response['expires_in'] ?? 'N/A') . "s\n";
        echo "    - Access Token: " . substr($token_response['access_token'], 0, 20) . "...\n";
    } else {
        echo "  ❌ Resposta sem access_token:\n";
        echo "     " . json_encode($token_response, JSON_PRETTY_PRINT) . "\n";
    }
} catch (Exception $e) {
    echo "  ❌ Erro: " . $e->getMessage() . "\n";
    echo "\n💡 Possíveis causas:\n";
    echo "   1. Credenciais inválidas no .env.local\n";
    echo "   2. Azure App não tem permissões 'Mail.Read' e 'Mail.ReadWrite' ativadas\n";
    echo "   3. Admin consent não foi dado para o App no Azure\n";
    echo "   4. Problema de conectividade com Azure (firewall/proxy)\n";
    exit(1);
}

echo "\n\n═══════════════════════════════════════════════════════\n";
echo "✅ AUTO-CONNECT DEVE FUNCIONAR!\n";
echo "═══════════════════════════════════════════════════════\n";
?>
