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
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: #f5f7fa;
            color: #333;
        }

        .debug-banner {
            background: #fff3cd;
            border-bottom: 3px solid #ffc107;
            padding: 15px;
            margin-bottom: 20px;
        }

        .debug-banner h3 {
            color: #856404;
            margin-bottom: 10px;
            font-size: 16px;
        }

        .debug-log {
            background: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 4px;
            padding: 10px;
            max-height: 200px;
            overflow-y: auto;
            font-family: monospace;
            font-size: 12px;
            line-height: 1.4;
        }

        .debug-log div {
            padding: 2px 0;
            color: #666;
        }

        .debug-log div.success {
            color: #28a745;
        }

        .debug-log div.error {
            color: #dc3545;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            background: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .header h1 {
            font-size: 28px;
            margin-bottom: 5px;
        }

        .status-box {
            background: #fff3cd;
            color: #856404;
            padding: 15px;
            border-radius: 6px;
            margin: 20px 0;
            border-left: 4px solid #ffc107;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .status-box.connected {
            background: #e8f5e9;
            color: #2e7d32;
            border-left-color: #2e7d32;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 6px;
            border: none;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
    </style>
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
            <div style="font-weight: bold; margin-bottom: 10px; border-bottom: 1px solid #ddd; padding-bottom: 10px;">Debug Log:</div>
            <?php foreach ($debug_log as $log): ?>
                <div class="<?php echo strpos($log, '✓') !== false ? 'success' : (strpos($log, '❌') !== false ? 'error' : ''); ?>">
                    <?php echo htmlspecialchars($log); ?>
                </div>
            <?php endforeach; ?>
        </div>

        <div class="status-box <?php echo $microsoft_authenticated ? 'connected' : ''; ?>">
            <div>
                <strong><?php echo $microsoft_authenticated ? '✅ CONECTADO' : '⚠️ NÃO CONECTADO'; ?></strong>
                <p style="font-size: 12px; margin-top: 5px;">
                    <?php echo $microsoft_authenticated
                        ? 'Sucesso! A auto-conexão funcionou. A tela normal exibirá as funcionalidades completas.'
                        : 'A auto-conexão falhou. Verifique os logs acima para entender o motivo.'; ?>
                </p>
            </div>
            <a href="/newipcsistemas/index.php?page=comunicacoes" class="btn">Voltar para Comunicações →</a>
        </div>

        <div style="background: white; padding: 20px; border-radius: 8px; margin-top: 20px;">
            <h3>📋 Configurações Carregadas:</h3>
            <table style="width: 100%; margin-top: 15px; border-collapse: collapse;">
                <tr style="border-bottom: 1px solid #ddd;">
                    <td style="padding: 10px; font-weight: bold;">Config Key</td>
                    <td style="padding: 10px; font-weight: bold;">Valor</td>
                </tr>
                <tr style="background: #f8f9fa; border-bottom: 1px solid #ddd;">
                    <td style="padding: 10px;">microsoft.client_id</td>
                    <td style="padding: 10px; font-family: monospace;"><?php echo !empty($config['microsoft']['client_id']) ? substr($config['microsoft']['client_id'], 0, 20) . '...' : '(vazio)'; ?></td>
                </tr>
                <tr style="border-bottom: 1px solid #ddd;">
                    <td style="padding: 10px;">microsoft.client_secret</td>
                    <td style="padding: 10px; font-family: monospace;"><?php echo !empty($config['microsoft']['client_secret']) ? substr($config['microsoft']['client_secret'], 0, 10) . '...' : '(vazio)'; ?></td>
                </tr>
                <tr style="background: #f8f9fa; border-bottom: 1px solid #ddd;">
                    <td style="padding: 10px;">microsoft.tenant_id</td>
                    <td style="padding: 10px; font-family: monospace;"><?php echo !empty($config['microsoft']['tenant_id']) ? $config['microsoft']['tenant_id'] : '(vazio)'; ?></td>
                </tr>
                <tr style="border-bottom: 1px solid #ddd;">
                    <td style="padding: 10px;">microsoft.mailbox</td>
                    <td style="padding: 10px; font-family: monospace;"><?php echo htmlspecialchars($config['microsoft']['mailbox'] ?? '(vazio)'); ?></td>
                </tr>
                <tr style="background: #f8f9fa;">
                    <td style="padding: 10px;">database.host</td>
                    <td style="padding: 10px; font-family: monospace;"><?php echo htmlspecialchars($config['db']['host']); ?></td>
                </tr>
            </table>
        </div>

        <div style="background: #e7f3ff; border: 1px solid #b3d9ff; padding: 15px; border-radius: 6px; margin-top: 20px;">
            <h4 style="color: #004085;">ℹ️ Próximos Passos:</h4>
            <ol style="margin-left: 20px; color: #004085; line-height: 1.8;">
                <li>Se a conexão foi bem-sucedida: clique no botão "Voltar para Comunicações" acima</li>
                <li>Se há erro: verifique os logs acima e procure por mensagens de erro (linhas em vermelho)</li>
                <li>Se o problema persistir, verifique:
                    <ul style="margin-top: 10px; margin-left: 20px;">
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
