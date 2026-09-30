<?php
/**
 * COMUNICAÇÕES - Versão DEBUG
 * Igual à original mas com diagnóstico detalhado
 */

echo "<!-- DEBUG: Iniciando comunicacoes-debug.php -->\n";
echo "<!-- PHP_VERSION: " . phpversion() . " -->\n";
echo "<!-- SESSION_ID: " . session_id() . " -->\n";

// Check if loaded
if (!isset($config)) {
    die("<pre style='color:red; padding:20px; background:#fee;'>❌ ERRO CRÍTICO: \$config não definido!\nVerifique se config.php está sendo carregado corretamente.</pre>");
}

echo "<!-- Config loaded: OK -->\n";
echo "<!-- Microsoft client_id: " . (empty($config['microsoft']['client_id']) ? "VAZIO" : substr($config['microsoft']['client_id'], 0, 10) . "...") . " -->\n";

// Load controllers
require_once __DIR__ . '/../controllers/CommunicationsController.php';
require_once __DIR__ . '/../controllers/OAuthController.php';

// Check Microsoft authentication (only if configured)
$oauth = null;
$microsoft_authenticated = false;
$microsoft_info = null;
$auto_sync_attempted = false;
$debug_log = [];

$debug_log[] = "Starting comunicacoes initialization...";

// Only try OAuth if credentials are configured
if (!empty($config['microsoft']['client_id']) && !empty($config['microsoft']['client_secret']) && !empty($config['microsoft']['tenant_id'])) {
    $debug_log[] = "✓ Microsoft credentials found in config";
    try {
        $oauth = new OAuthController($pdo, $config);
        $debug_log[] = "✓ OAuthController created";

        $microsoft_authenticated = $_SESSION['microsoft_authenticated'] ?? false;
        $debug_log[] = "Microsoft authenticated from session: " . ($microsoft_authenticated ? "true" : "false");

        $microsoft_info = $microsoft_authenticated ? $oauth->getAccountInfo() : null;

        // Auto-connect using Client Credentials if not authenticated
        if (!$microsoft_authenticated && $oauth && $oauth->isConfigured()) {
            $debug_log[] = "Attempting auto-connect with Client Credentials...";
            try {
                require_once __DIR__ . '/../services/MicrosoftGraphService.php';
                $graph = new MicrosoftGraphService($config, $pdo);
                $debug_log[] = "✓ MicrosoftGraphService created";

                $token_response = $graph->getClientCredentialsToken();
                $debug_log[] = "✓ Token response received";

                if (isset($token_response['access_token'])) {
                    $_SESSION['microsoft_access_token'] = $token_response['access_token'];
                    $_SESSION['microsoft_token_type'] = $token_response['token_type'] ?? 'Bearer';
                    $_SESSION['microsoft_expires_in'] = $token_response['expires_in'] ?? 3600;
                    $_SESSION['microsoft_token_expires_at'] = time() + ($token_response['expires_in'] ?? 3600);
                    $_SESSION['microsoft_authenticated'] = true;
                    $_SESSION['microsoft_auth_time'] = time();

                    $microsoft_authenticated = true;
                    $auto_sync_attempted = true;
                    $debug_log[] = "✓✓✓ AUTO-CONNECT SUCCESSFUL - microsoft_authenticated set to true";
                } else {
                    $debug_log[] = "❌ Token response missing access_token";
                }
            } catch (Exception $e) {
                $debug_log[] = "❌ Auto-connect failed: " . $e->getMessage();
                error_log('Auto-connect failed: ' . $e->getMessage());
            }
        } else {
            $debug_log[] = "Skipping auto-connect: authenticated=" . ($microsoft_authenticated ? "true" : "false") . ", oauth=" . ($oauth ? "set" : "null") . ", configured=" . ($oauth && $oauth->isConfigured() ? "true" : "false");
        }
    } catch (Exception $e) {
        $debug_log[] = "❌ OAuth initialization failed: " . $e->getMessage();
        error_log('OAuth initialization failed: ' . $e->getMessage());
    }
} else {
    $debug_log[] = "❌ Microsoft credentials NOT found:";
    $debug_log[] = "  - client_id: " . (empty($config['microsoft']['client_id']) ? "VAZIO" : "OK");
    $debug_log[] = "  - client_secret: " . (empty($config['microsoft']['client_secret']) ? "VAZIO" : "OK");
    $debug_log[] = "  - tenant_id: " . (empty($config['microsoft']['tenant_id']) ? "VAZIO" : "OK");
}

// Handle sync (manual or automatic)
$sync_result = null;
$show_stats = false;
$perform_sync = false;

if ($_SERVER['REQUEST_METHOD'] === 'POST' && $_POST['action'] === 'sync') {
    $perform_sync = true;
} elseif ($auto_sync_attempted && $microsoft_authenticated) {
    $perform_sync = true;
}

if ($perform_sync) {
    if (!empty($config['microsoft']['client_id']) && !empty($config['microsoft']['client_secret'])) {
        if (!$microsoft_authenticated) {
            $sync_result = ['success' => false, 'error' => 'Você precisa se conectar ao Microsoft 365 primeiro'];
        } else {
            $controller = new CommunicationsController($pdo, $config);
            $sync_result = $controller->sync();
            $show_stats = true;
        }
    } else {
        $sync_result = ['success' => false, 'error' => 'Microsoft 365 não está configurado'];
    }
}

// Load communications
$controller = new CommunicationsController($pdo, $config);
$data = $controller->list();
$communications = $data['communications'];
$stats = $data['stats'];
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comunicações - Novos Sistemas IPC (DEBUG)</title>
    <link rel="stylesheet" href="/newipcsistemas/html/css/theme-unified.css">
</head>
<body>
    <div class="container">
        <div class="debug-banner">
            <h3>🐛 MODO DEBUG ATIVADO</h3>
            <p>Este é um diagnosticador especial para ajudar a resolver problemas de conexão ao Microsoft 365.</p>
        </div>

        <div class="header">
            <h1>📧 Comunicações (Debug)</h1>
            <p>Status da auto-conexão ao Microsoft 365</p>
        </div>

        <div class="debug-log">
            <div>Debug Log:</div>
            <?php foreach ($debug_log as $log): ?>
                <div class="<?php echo strpos($log, '✓') !== false ? 'success' : (strpos($log, '❌') !== false ? 'error' : ''); ?>">
                    <?php echo htmlspecialchars($log); ?>
                </div>
            <?php endforeach; ?>
        </div>

        <div class="status-box <?php echo $microsoft_authenticated ? 'connected' : ''; ?>">
            <div>
                <strong><?php echo $microsoft_authenticated ? '✅ CONECTADO' : '⚠️ NÃO CONECTADO'; ?></strong>
                <p>
                    <?php echo $microsoft_authenticated
                        ? 'Sucesso! A auto-conexão funcionou. A tela normal exibirá as funcionalidades completas.'
                        : 'A auto-conexão falhou. Verifique os logs acima para entender o motivo.'; ?>
                </p>
            </div>
            <a href="/newipcsistemas/index.php?page=comunicacoes" class="btn">Voltar para Comunicações →</a>
        </div>

        <div>
            <h3>📋 Configurações Carregadas:</h3>
            <table>
                <tr>
                    <td>Config Key</td>
                    <td>Valor</td>
                </tr>
                <tr>
                    <td>microsoft.client_id</td>
                    <td><?php echo !empty($config['microsoft']['client_id']) ? substr($config['microsoft']['client_id'], 0, 20) . '...' : '(vazio)'; ?></td>
                </tr>
                <tr>
                    <td>microsoft.client_secret</td>
                    <td><?php echo !empty($config['microsoft']['client_secret']) ? substr($config['microsoft']['client_secret'], 0, 10) . '...' : '(vazio)'; ?></td>
                </tr>
                <tr>
                    <td>microsoft.tenant_id</td>
                    <td><?php echo !empty($config['microsoft']['tenant_id']) ? $config['microsoft']['tenant_id'] : '(vazio)'; ?></td>
                </tr>
                <tr>
                    <td>microsoft.mailbox</td>
                    <td><?php echo htmlspecialchars($config['microsoft']['mailbox'] ?? '(vazio)'); ?></td>
                </tr>
                <tr>
                    <td>database.host</td>
                    <td><?php echo htmlspecialchars($config['db']['host']); ?></td>
                </tr>
            </table>
        </div>

        <div>
            <h4>ℹ️ Próximos Passos:</h4>
            <ol>
                <li>Se a conexão foi bem-sucedida: clique no botão "Voltar para Comunicações" acima</li>
                <li>Se há erro: verifique os logs acima e procure por mensagens de erro (linhas em vermelho)</li>
                <li>Se o problema persistir, verifique:
                    <ul>
                        <li>Credenciais do Azure Portal estão corretas em .env.local</li>
                        <li>A aplicação tem permissões "Mail.Read" e "Mail.ReadWrite" no Azure</li>
                        <li>Admin Consent foi dado para a aplicação</li>
                        <li>Conectividade com https://login.microsoftonline.com</li>
                    </ul>
                </li>
            </ol>
        </div>
    </div>

    <script>
    // Refresh page a cada 10 segundos se não conectado
    <?php if (!$microsoft_authenticated): ?>
    setTimeout(() => {
        location.reload();
    }, 10000);
    <?php endif; ?>
    </script>
</body>
</html>
