<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comunicações - Novos Sistemas IPC</title>
    <link rel="stylesheet" href="/newipcsistemas/html/css/theme-unified.css">
    <style>
        /* TEST: Se você vê FUNDO AZUL, o CSS está funcionando */
        body { background-color: #132F4A !important; color: white !important; }
        .sidebar { background-color: #0D1F2D !important; }
        .btn-primary { background-color: #10B981 !important; }
    </style>
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="sidebar-header">
                <div class="logo">🏛️</div>
                <h2>Novos Sistemas</h2>
            </div>

            <ul class="menu-items">
                <li class="menu-item">
                    <a href="/newipcsistemas/index.php" class="menu-link">
                        <span class="icon">📊</span>
                        <span>Painel</span>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="/newipcsistemas/index.php?page=comunicacoes" class="menu-link active">
                        <span class="icon">📧</span>
                        <span>Comunicações</span>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="#" class="menu-link">
                        <span class="icon">⚙️</span>
                        <span>Configurações</span>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="#" class="menu-link">
                        <span class="icon">📋</span>
                        <span>Relatórios</span>
                    </a>
                </li>
            </ul>

            <div class="user-menu">
                <div class="user-info">
                    <div class="user-avatar"><?php echo strtoupper(substr($user['name'], 0, 1)); ?></div>
                    <div class="user-details">
                        <strong><?php echo htmlspecialchars($user['name']); ?></strong>
                        <p><?php echo htmlspecialchars($user['email']); ?></p>
                    </div>
                </div>
                <a href="/newipcsistemas/index.php?page=logout" class="logout-btn">Sair</a>
            </div>
        </div>

        <!-- Main Content -->
<?php
// Load controllers
require_once __DIR__ . '/../controllers/CommunicacionsController.php';
require_once __DIR__ . '/../controllers/OAuthController.php';

// Check Microsoft authentication (only if configured)
$oauth = null;
$microsoft_authenticated = false;
$microsoft_info = null;
$auto_sync_attempted = false;

// Only try OAuth if credentials are configured
if (!empty($config['microsoft']['client_id']) && !empty($config['microsoft']['client_secret']) && !empty($config['microsoft']['tenant_id'])) {
    try {
        $oauth = new OAuthController($pdo, $config);
        $microsoft_authenticated = $_SESSION['microsoft_authenticated'] ?? false;
        $microsoft_info = $microsoft_authenticated ? $oauth->getAccountInfo() : null;

        // Auto-connect using Client Credentials if not authenticated
        if (!$microsoft_authenticated && $oauth && $oauth->isConfigured()) {
            try {
                require_once __DIR__ . '/../services/MicrosoftGraphService.php';
                $graph = new MicrosoftGraphService($config, $pdo);
                $token_response = $graph->getClientCredentialsToken();

                if (isset($token_response['access_token'])) {
                    $_SESSION['microsoft_access_token'] = $token_response['access_token'];
                    $_SESSION['microsoft_token_type'] = $token_response['token_type'] ?? 'Bearer';
                    $_SESSION['microsoft_expires_in'] = $token_response['expires_in'] ?? 3600;
                    $_SESSION['microsoft_token_expires_at'] = time() + ($token_response['expires_in'] ?? 3600);
                    $_SESSION['microsoft_authenticated'] = true;
                    $_SESSION['microsoft_auth_time'] = time();

                    $microsoft_authenticated = true;
                    $auto_sync_attempted = true;
                }
            } catch (Exception $e) {
                error_log('Auto-connect failed: ' . $e->getMessage());
            }
        }
    } catch (Exception $e) {
        // OAuth not properly configured, continue without it
        error_log('OAuth initialization failed: ' . $e->getMessage());
    }
}

// Handle sync (manual or automatic)
$sync_result = null;
$show_stats = false;
$perform_sync = false;

if ($_SERVER['REQUEST_METHOD'] === 'POST' && $_POST['action'] === 'sync') {
    $perform_sync = true;
} elseif ($auto_sync_attempted && $microsoft_authenticated) {
    // Auto-sync after successful auto-connect
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
        <div class="main-content">
            <div class="header">
                <div class="header-title">
                    <h1>📧 Comunicações</h1>
                    <p>Gerencie emails recebidos de tribunais e varas</p>
                </div>
                <div class="header-actions">
                    <form method="POST">
                        <input type="hidden" name="action" value="sync">
                        <button type="submit" class="btn btn-primary" <?php echo !$microsoft_authenticated ? 'disabled' : ''; ?>>↻ Sincronizar</button>
                    </form>
                </div>
            </div>

            <?php if ($microsoft_authenticated): ?>
            <div>
                <div>
                    <strong>✅ Conectado ao Microsoft 365</strong> — <?php echo htmlspecialchars($config['microsoft']['mailbox'] ?? 'Mailbox'); ?>
                </div>
                <a href="/newipcsistemas/index.php?page=auth/disconnect">Desconectar →</a>
            </div>
            <?php else: ?>
            <div>
                <div>
                    <strong>⚠️ Não conectado ao Microsoft 365</strong> — Clique no botão para sincronizar emails
                </div>
                <a href="/newipcsistemas/index.php?page=auth/microsoft">Conectar →</a>
            </div>
            <?php endif; ?>

            <?php if ($sync_result): ?>
            <div>
                <?php echo htmlspecialchars($sync_result['message'] ?? $sync_result['error']); ?>
            </div>
            <?php endif; ?>

            <?php if ($show_stats): ?>
            <div>
                <div>
                    <div><?php echo $stats['total']; ?></div>
                    <div>Total</div>
                </div>
                <div>
                    <div><?php echo $stats['by_status']['new'] ?? 0; ?></div>
                    <div>Novas</div>
                </div>
                <div>
                    <div><?php echo $stats['by_status']['processed'] ?? 0; ?></div>
                    <div>Processadas</div>
                </div>
                <div>
                    <div><?php echo $stats['by_status']['error'] ?? 0; ?></div>
                    <div>Erros</div>
                </div>
            </div>
            <?php endif; ?>

            <div class="filters">
                <form method="GET">
                    <div class="filter-group">
                        <label>Status</label>
                        <select name="status">
                            <option value="">Todos</option>
                            <option value="new" <?php echo ($_GET['status'] ?? '') === 'new' ? 'selected' : ''; ?>>Novas</option>
                            <option value="processing" <?php echo ($_GET['status'] ?? '') === 'processing' ? 'selected' : ''; ?>>Processando</option>
                            <option value="processed" <?php echo ($_GET['status'] ?? '') === 'processed' ? 'selected' : ''; ?>>Processadas</option>
                            <option value="error" <?php echo ($_GET['status'] ?? '') === 'error' ? 'selected' : ''; ?>>Erros</option>
                        </select>
                    </div>

                    <div class="filter-group">
                        <label>Vara/Comarca</label>
                        <input type="text" name="vara" placeholder="Filtrar por vara..." value="<?php echo htmlspecialchars($_GET['vara'] ?? ''); ?>">
                    </div>

                    <div class="filter-group">
                        <label>Processo</label>
                        <input type="text" name="processo" placeholder="Número do processo..." value="<?php echo htmlspecialchars($_GET['processo'] ?? ''); ?>">
                    </div>

                    <div class="filter-group">
                        <button type="submit" class="btn btn-primary">🔍 Filtrar</button>
                    </div>
                </form>
            </div>

            <div class="communications-list">
                <div class="communications-header">
                    <div>✓</div>
                    <div>Remetente</div>
                    <div>Vara</div>
                    <div>Processo</div>
                    <div>Status</div>
                    <div>Data</div>
                    <div>Ação</div>
                </div>

                <?php if (empty($communications)): ?>
                <div class="empty-state">
                    <div class="empty-state-icon">📧</div>
                    <div class="empty-state-title">Nenhuma comunicação encontrada</div>
                    <div class="empty-state-description">
                        Clique em "Sincronizar" para buscar emails da mailbox configurada.
                    </div>
                </div>
                <?php else: ?>
                    <?php foreach ($communications as $comm): ?>
                    <div class="communication-item">
                        <input type="checkbox" class="checkbox">
                        <div><?php echo htmlspecialchars($comm['from_name'] ?? $comm['from_address'] ?? 'Desconhecido'); ?></div>
                        <div><?php echo htmlspecialchars($comm['vara'] ?? '-'); ?></div>
                        <div><?php echo htmlspecialchars($comm['processo_numero'] ?? '-'); ?></div>
                        <div>
                            <span class="status-badge status-<?php echo $comm['status']; ?>">
                                <?php echo ucfirst($comm['status']); ?>
                            </span>
                        </div>
                        <div><?php echo date('d/m/Y H:i', strtotime($comm['received_datetime'] ?? 'now')); ?></div>
                        <div>
                            <button type="button" class="btn-action" onclick="openEmailModal(<?php echo $comm['id']; ?>)">
                                🔍 Extrair
                            </button>
                        </div>
                    </div>
                    <?php endforeach; ?>
                <?php endif; ?>
            </div>
        </div>
    </div>

    <script>
    // Note: extractCommunication() replaced by openEmailModal()
    // Modal now handles viewing, extracting, response scheduling, and marking as analyzed
    // See email-detail-modal.php for implementation
    </script>

    <!-- Email Detail Modal -->
    <?php require_once __DIR__ . '/email-detail-modal.php'; ?>
</body>
</html>
