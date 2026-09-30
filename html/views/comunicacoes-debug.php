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
        /**
 * Theme Unified CSS - Modern & Professional
 * Paleta corporativa Perito v6 + Design System Elegante
 * Dark/Light mode automático
 */

/* ============================================
   ROOT THEME VARIABLES
   ============================================ */
:root {
  /* Cores Corporativas - Perito v6 */
  --color-primary: #132F4A;
  --color-primary-light: #1A4A6F;
  --color-primary-dark: #0D1F2D;
  --color-accent: #10B981;

  /* Cinzas */
  --color-gray-50: #F9FAFB;
  --color-gray-100: #F3F4F6;
  --color-gray-200: #E5E7EB;
  --color-gray-300: #D1D5DB;
  --color-gray-400: #9CA3AF;
  --color-gray-500: #6B7280;
  --color-gray-600: #4B5563;
  --color-gray-700: #374151;
  --color-gray-800: #1F2937;
  --color-gray-900: #111827;

  /* Status Colors */
  --color-success: #10B981;
  --color-warning: #F59E0B;
  --color-error: #EF4444;
  --color-info: #3B82F6;

  /* Light Mode */
  --bg-primary: #FFFFFF;
  --bg-secondary: #F9FAFB;
  --bg-tertiary: #F3F4F6;
  --bg-card: #FFFFFF;
  --text-primary: #1F2937;
  --text-secondary: #6B7280;
  --text-muted: #9CA3AF;
  --border-color: #E5E7EB;

  --shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.05);
  --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.07);
  --shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.1);
  --shadow-xl: 0 20px 25px rgba(0, 0, 0, 0.12);

  --spacing-xs: 0.25rem;
  --spacing-sm: 0.5rem;
  --spacing-md: 1rem;
  --spacing-lg: 1.5rem;
  --spacing-xl: 2rem;
  --spacing-2xl: 3rem;

  --radius-sm: 6px;
  --radius-md: 8px;
  --radius-lg: 12px;
  --radius-xl: 16px;

  --transition: all 0.2s ease;
}

@media (prefers-color-scheme: dark) {
  :root {
    --bg-primary: #0F172A;
    --bg-secondary: #1A2332;
    --bg-tertiary: #243447;
    --bg-card: #1F2937;
    --text-primary: #F3F4F6;
    --text-secondary: #D1D5DB;
    --text-muted: #9CA3AF;
    --border-color: #374151;
    --shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.3);
    --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.4);
    --shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.5);
  }
}

/* ============================================
   RESET & GLOBAL
   ============================================ */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html {
  font-size: 16px;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

body {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
  background-color: var(--bg-primary);
  color: var(--text-primary);
  line-height: 1.6;
  transition: var(--transition);
}

/* ============================================
   TYPOGRAPHY
   ============================================ */
h1 { font-size: 2.5rem; font-weight: 700; letter-spacing: -0.02em; }
h2 { font-size: 2rem; font-weight: 600; letter-spacing: -0.01em; }
h3 { font-size: 1.5rem; font-weight: 600; }
h4 { font-size: 1.25rem; font-weight: 600; }
h5 { font-size: 1.1rem; font-weight: 500; }
h6 { font-size: 1rem; font-weight: 500; }

h1, h2, h3, h4, h5, h6 {
  margin-bottom: var(--spacing-md);
  color: var(--text-primary);
  line-height: 1.3;
}

p {
  margin-bottom: var(--spacing-md);
  color: var(--text-secondary);
}

a {
  color: var(--color-primary);
  text-decoration: none;
  transition: var(--transition);
  font-weight: 500;
}

a:hover {
  color: var(--color-primary-light);
  text-decoration: underline;
}

/* ============================================
   BUTTONS
   ============================================ */
.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 0.75rem 1.5rem;
  border: none;
  border-radius: var(--radius-md);
  font-size: 0.95rem;
  font-weight: 600;
  cursor: pointer;
  transition: var(--transition);
  white-space: nowrap;
  text-decoration: none;
}

.btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

.btn-primary {
  background: linear-gradient(135deg, var(--color-primary) 0%, var(--color-primary-light) 100%);
  color: white;
  box-shadow: var(--shadow-md);
}

.btn-primary:hover:not(:disabled) {
  transform: translateY(-2px);
  box-shadow: var(--shadow-lg);
}

.btn-secondary {
  background-color: var(--bg-secondary);
  color: var(--text-primary);
  border: 1.5px solid var(--border-color);
}

.btn-secondary:hover:not(:disabled) {
  background-color: var(--bg-tertiary);
  transform: translateY(-2px);
}

.btn-success {
  background-color: var(--color-success);
  color: white;
  box-shadow: var(--shadow-md);
}

.btn-success:hover:not(:disabled) {
  transform: translateY(-2px);
  box-shadow: var(--shadow-lg);
}

.btn-sm { padding: 0.5rem 1rem; font-size: 0.875rem; }
.btn-lg { padding: 1rem 2rem; font-size: 1.1rem; }

/* ============================================
   FORMS
   ============================================ */
.form-group {
  margin-bottom: var(--spacing-lg);
  display: flex;
  flex-direction: column;
}

.form-label {
  font-weight: 600;
  margin-bottom: var(--spacing-sm);
  color: var(--text-primary);
  font-size: 0.95rem;
}

.form-input,
.form-textarea,
.form-select {
  padding: 0.75rem 1rem;
  border: 1.5px solid var(--border-color);
  border-radius: var(--radius-md);
  background-color: var(--bg-card);
  color: var(--text-primary);
  font-size: 1rem;
  font-family: inherit;
  transition: var(--transition);
}

.form-input:focus,
.form-textarea:focus,
.form-select:focus {
  outline: none;
  border-color: var(--color-primary);
  box-shadow: 0 0 0 3px rgba(19, 47, 74, 0.1);
  background-color: var(--bg-card);
}

.form-input::placeholder,
.form-textarea::placeholder {
  color: var(--text-muted);
}

/* ============================================
   CARDS & CONTAINERS
   ============================================ */
.card {
  background-color: var(--bg-card);
  border: 1px solid var(--border-color);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-sm);
  overflow: hidden;
  transition: var(--transition);
}

.card:hover {
  box-shadow: var(--shadow-md);
  transform: translateY(-2px);
}

.card-header {
  padding: var(--spacing-lg);
  background: linear-gradient(135deg, var(--color-primary) 0%, var(--color-primary-light) 100%);
  color: white;
  border-bottom: none;
}

.card-header h2 {
  margin-bottom: 0;
  color: white;
}

.card-body {
  padding: var(--spacing-lg);
}

.card-footer {
  padding: var(--spacing-lg);
  background-color: var(--bg-secondary);
  border-top: 1px solid var(--border-color);
  display: flex;
  gap: var(--spacing-md);
}

.panel {
  background-color: var(--bg-card);
  border: 1px solid var(--border-color);
  border-radius: var(--radius-lg);
  padding: var(--spacing-lg);
  box-shadow: var(--shadow-sm);
}

/* ============================================
   MODALS
   ============================================ */
.modal {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  z-index: 1000;
  align-items: center;
  justify-content: center;
}

.modal.active {
  display: flex;
}

.modal-content {
  background-color: var(--bg-card);
  border-radius: var(--radius-xl);
  width: 100%;
  max-width: 600px;
  max-height: 90vh;
  overflow-y: auto;
  box-shadow: var(--shadow-xl);
  animation: slideUp 0.3s ease;
}

.modal-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: var(--spacing-lg);
  background: linear-gradient(135deg, var(--color-primary) 0%, var(--color-primary-light) 100%);
  color: white;
  border-radius: var(--radius-xl) var(--radius-xl) 0 0;
}

.modal-title {
  font-size: 1.25rem;
  font-weight: 600;
  color: white;
}

.modal-body {
  padding: var(--spacing-lg);
}

.modal-footer {
  padding: var(--spacing-lg);
  border-top: 1px solid var(--border-color);
  display: flex;
  gap: var(--spacing-md);
  justify-content: flex-end;
}

/* ============================================
   TABLES
   ============================================ */
.table {
  width: 100%;
  border-collapse: collapse;
  background-color: var(--bg-card);
  border-radius: var(--radius-lg);
  overflow: hidden;
}

.table th {
  background: linear-gradient(135deg, var(--color-primary) 0%, var(--color-primary-light) 100%);
  color: white;
  padding: var(--spacing-md);
  text-align: left;
  font-weight: 600;
  font-size: 0.9rem;
  text-transform: uppercase;
  letter-spacing: 0.05em;
}

.table td {
  padding: var(--spacing-md);
  color: var(--text-secondary);
  border-bottom: 1px solid var(--border-color);
}

.table tbody tr:hover {
  background-color: var(--bg-secondary);
}

.table-striped tbody tr:nth-child(odd) {
  background-color: var(--bg-secondary);
}

/* ============================================
   BADGES & STATUS
   ============================================ */
.badge {
  display: inline-block;
  padding: 0.4rem 0.8rem;
  border-radius: var(--radius-full);
  font-size: 0.8rem;
  font-weight: 600;
  white-space: nowrap;
}

.badge-success {
  background-color: rgba(16, 185, 129, 0.1);
  color: var(--color-success);
}

.badge-warning {
  background-color: rgba(245, 158, 11, 0.1);
  color: var(--color-warning);
}

.badge-error {
  background-color: rgba(239, 68, 68, 0.1);
  color: var(--color-error);
}

.badge-primary {
  background-color: rgba(19, 47, 74, 0.1);
  color: var(--color-primary);
}

/* ============================================
   UTILITIES
   ============================================ */
.flex { display: flex; }
.flex-center { display: flex; align-items: center; justify-content: center; }
.flex-between { display: flex; align-items: center; justify-content: space-between; }
.flex-col { flex-direction: column; }
.gap-md { gap: var(--spacing-md); }
.gap-lg { gap: var(--spacing-lg); }

.grid { display: grid; }
.grid-2 { display: grid; grid-template-columns: repeat(2, 1fr); gap: var(--spacing-lg); }
.grid-3 { display: grid; grid-template-columns: repeat(3, 1fr); gap: var(--spacing-lg); }

.mb-md { margin-bottom: var(--spacing-md); }
.mb-lg { margin-bottom: var(--spacing-lg); }
.mt-lg { margin-top: var(--spacing-lg); }

.px-lg { padding-left: var(--spacing-lg); padding-right: var(--spacing-lg); }
.py-lg { padding-top: var(--spacing-lg); padding-bottom: var(--spacing-lg); }

.rounded { border-radius: var(--radius-md); }
.rounded-lg { border-radius: var(--radius-lg); }

.shadow { box-shadow: var(--shadow-md); }
.shadow-lg { box-shadow: var(--shadow-lg); }

.text-muted { color: var(--text-muted); }
.text-center { text-align: center; }

/* ============================================
   ANIMATIONS
   ============================================ */
@keyframes slideUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

/* ============================================
   RESPONSIVE
   ============================================ */
@media (max-width: 768px) {
  h1 { font-size: 1.75rem; }
  h2 { font-size: 1.5rem; }

  .grid-2, .grid-3 {
    grid-template-columns: 1fr;
  }

  .modal-content {
    width: 95%;
    border-radius: 0;
  }

  .btn {
    width: 100%;
    padding: 1rem;
  }
}

@media (max-width: 600px) {
  body { font-size: 14px; }

  h1 { font-size: 1.5rem; }
  h2 { font-size: 1.25rem; }

  .card-body, .card-header, .card-footer {
    padding: var(--spacing-md);
  }

  .table {
    font-size: 0.9rem;
  }

  .table th, .table td {
    padding: var(--spacing-sm);
  }
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
