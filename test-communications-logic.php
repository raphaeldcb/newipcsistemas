<?php
/**
 * Testa a lógica EXATA que acontece em html/views/comunicacoes.php
 * Simula a sequência de inicialização
 */

error_reporting(E_ALL);
ini_set('display_errors', 1);

echo "═══════════════════════════════════════════════════════\n";
echo "TESTE: Lógica de Comunicações (Auto-Connect)\n";
echo "═══════════════════════════════════════════════════════\n\n";

// Simular session
$_SESSION = [];

// Step 1: Load env (deve vir ANTES do config)
echo "STEP 1: Carregando .env.local\n";
require_once __DIR__ . '/config/load-env.php';
echo "  ✓ load-env.php executado\n";
echo "  GRAPH_CLIENT_ID = " . getenv('GRAPH_CLIENT_ID') . "\n";

// Step 2: Load config
echo "\nSTEP 2: Carregando config.php\n";
$config = require_once __DIR__ . '/config/config.php';
echo "  ✓ config.php carregado\n";
echo "  microsoft.client_id = " . $config['microsoft']['client_id'] . "\n";

// Step 3: Verificar condição da tela (linha 475)
echo "\nSTEP 3: Verificando condição para OAuth (linha 475 da tela)\n";
$condition = !empty($config['microsoft']['client_id']) &&
             !empty($config['microsoft']['client_secret']) &&
             !empty($config['microsoft']['tenant_id']);
echo "  Condição: " . ($condition ? "✓ VERDADEIRA" : "❌ FALSA") . "\n";

if (!$condition) {
    echo "  ❌ PROBLEMA: Credenciais não estão definidas!\n";
    exit(1);
}

// Step 4: Simular database (mock)
echo "\nSTEP 4: Criando conexão PDO (mock)\n";
$pdo = null; // Mock - não vamos conectar de verdade
echo "  ✓ PDO mock criado\n";

// Step 5: Criar OAuth controller
echo "\nSTEP 5: Criando OAuthController\n";
try {
    require_once __DIR__ . '/html/controllers/OAuthController.php';
    $oauth = new OAuthController($pdo, $config);
    echo "  ✓ OAuthController criado\n";
} catch (Exception $e) {
    echo "  ❌ Erro: " . $e->getMessage() . "\n";
    exit(1);
}

// Step 6: Verificar autenticação
echo "\nSTEP 6: Verificando autenticação Microsoft\n";
$microsoft_authenticated = $_SESSION['microsoft_authenticated'] ?? false;
echo "  microsoft_authenticated = " . ($microsoft_authenticated ? "true" : "false") . "\n";

// Step 7: Tentar auto-conexão (linhas 482-502)
echo "\nSTEP 7: Tentando auto-conexão com Client Credentials\n";
if (!$microsoft_authenticated && $oauth && $oauth->isConfigured()) {
    echo "  → Precondições para auto-conexão: ✓ OK\n";
    try {
        require_once __DIR__ . '/html/services/MicrosoftGraphService.php';
        $graph = new MicrosoftGraphService($config, $pdo);
        echo "  → MicrosoftGraphService criado\n";

        $token_response = $graph->getClientCredentialsToken();
        echo "  → Token obtido!\n";

        if (isset($token_response['access_token'])) {
            $_SESSION['microsoft_access_token'] = $token_response['access_token'];
            $_SESSION['microsoft_token_type'] = $token_response['token_type'] ?? 'Bearer';
            $_SESSION['microsoft_expires_in'] = $token_response['expires_in'] ?? 3600;
            $_SESSION['microsoft_token_expires_at'] = time() + ($token_response['expires_in'] ?? 3600);
            $_SESSION['microsoft_authenticated'] = true;
            $_SESSION['microsoft_auth_time'] = time();

            $microsoft_authenticated = true;
            echo "  ✓ Sessão atualizada - microsoft_authenticated = true\n";
        } else {
            echo "  ❌ Token response inválido\n";
            var_dump($token_response);
        }
    } catch (Exception $e) {
        echo "  ❌ AUTO-CONNECT FALHOU: " . $e->getMessage() . "\n";
        exit(1);
    }
} else {
    echo "  → Precondições NÃO atendidas:\n";
    echo "    - microsoft_authenticated = " . ($microsoft_authenticated ? "true" : "false") . "\n";
    echo "    - oauth = " . ($oauth ? "set" : "null") . "\n";
    echo "    - oauth->isConfigured() = " . ($oauth && $oauth->isConfigured() ? "true" : "false") . "\n";
}

// Final check
echo "\n═══════════════════════════════════════════════════════\n";
if ($microsoft_authenticated) {
    echo "✅ AUTO-CONNECT SUCESSO!\n";
    echo "   A tela deve exibir 'Conectado ao Microsoft 365'\n";
} else {
    echo "❌ AUTO-CONNECT FALHOU\n";
    echo "   A tela exibirá 'Não conectado ao Microsoft 365'\n";
}
echo "═══════════════════════════════════════════════════════\n";
?>
