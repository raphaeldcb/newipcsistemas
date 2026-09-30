<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comunicações - Novos Sistemas IPC</title>
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

        .container {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            background: #2c3e50;
            color: white;
            padding: 20px;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
            position: fixed;
            height: 100vh;
            overflow-y: auto;
        }

        .sidebar-header {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .sidebar-header h2 {
            font-size: 20px;
            margin: 0;
        }

        .sidebar-header .logo {
            font-size: 24px;
            margin-right: 10px;
        }

        .menu-items {
            list-style: none;
        }

        .menu-item {
            margin-bottom: 10px;
        }

        .menu-link {
            display: flex;
            align-items: center;
            padding: 12px 15px;
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            border-radius: 6px;
            transition: all 0.3s;
        }

        .menu-link:hover,
        .menu-link.active {
            background: rgba(255, 255, 255, 0.1);
            color: white;
        }

        .menu-link .icon {
            margin-right: 12px;
            font-size: 18px;
        }

        .user-menu {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        .user-info {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            padding: 10px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 6px;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            margin-right: 10px;
            font-size: 18px;
        }

        .user-details {
            flex: 1;
            overflow: hidden;
        }

        .user-details p {
            margin: 0;
            font-size: 12px;
            color: rgba(255, 255, 255, 0.7);
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .user-details strong {
            display: block;
            color: white;
            font-size: 14px;
        }

        .logout-btn {
            width: 100%;
            padding: 10px;
            background: rgba(231, 76, 60, 0.2);
            color: #e74c3c;
            border: 1px solid #e74c3c;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s;
            text-decoration: none;
            display: block;
            text-align: center;
        }

        .logout-btn:hover {
            background: #e74c3c;
            color: white;
        }

        /* Main Content */
        .main-content {
            margin-left: 250px;
            flex: 1;
            padding: 30px;
        }

        .header {
            background: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header-title h1 {
            font-size: 28px;
            margin-bottom: 5px;
        }

        .header-title p {
            color: #666;
            font-size: 14px;
        }

        .header-actions {
            display: flex;
            gap: 10px;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 6px;
            border: none;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }

        .filters {
            background: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }

        .filter-group {
            flex: 1;
            min-width: 200px;
        }

        .filter-group label {
            display: block;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 5px;
            color: #666;
            text-transform: uppercase;
        }

        .filter-group select,
        .filter-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
        }

        .communications-list {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .communications-header {
            padding: 15px 20px;
            background: #f8f9fa;
            border-bottom: 1px solid #eee;
            display: grid;
            grid-template-columns: 40px 200px 150px 200px 100px 100px 80px;
            gap: 15px;
            font-size: 12px;
            font-weight: 600;
            color: #666;
            text-transform: uppercase;
        }

        .communication-item {
            padding: 15px 20px;
            border-bottom: 1px solid #eee;
            display: grid;
            grid-template-columns: 40px 200px 150px 200px 100px 100px 80px;
            gap: 15px;
            align-items: center;
            transition: background 0.3s;
        }

        .communication-item:hover {
            background: #f8f9fa;
        }

        .checkbox {
            width: 20px;
            height: 20px;
            cursor: pointer;
        }

        .btn-action {
            padding: 6px 12px;
            font-size: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background: white;
            color: #667eea;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 500;
        }

        .btn-action:hover {
            background: #667eea;
            color: white;
            border-color: #667eea;
        }

        .btn-action:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        .status-badge {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-align: center;
        }

        .status-new {
            background: #e8f4f8;
            color: #0288d1;
        }

        .status-processing {
            background: #fff3e0;
            color: #f57c00;
        }

        .status-processed {
            background: #e8f5e9;
            color: #388e3c;
        }

        .status-error {
            background: #ffebee;
            color: #c62828;
        }

        .empty-state {
            padding: 60px 20px;
            text-align: center;
            color: #999;
        }

        .empty-state-icon {
            font-size: 48px;
            margin-bottom: 20px;
        }

        .empty-state-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 10px;
            color: #333;
        }

        .empty-state-description {
            font-size: 14px;
            margin-bottom: 20px;
        }

        @media (max-width: 1200px) {
            .communications-header,
            .communication-item {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }

            .main-content {
                margin-left: 200px;
                padding: 20px;
            }

            .header {
                flex-direction: column;
                gap: 15px;
            }

            .header-actions {
                width: 100%;
            }

            .filters {
                flex-direction: column;
            }

            .filter-group {
                min-width: auto;
            }
        }

        @media (max-width: 600px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
                border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            }

            .container {
                flex-direction: column;
            }

            .main-content {
                margin-left: 0;
                padding: 15px;
            }

            .header h1 {
                font-size: 22px;
            }
        }
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
                    <a href="/" class="menu-link">
                        <span class="icon">📊</span>
                        <span>Dashboard</span>
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

// Check Microsoft authentication
$oauth = new OAuthController($pdo, $config);
$microsoft_authenticated = $_SESSION['microsoft_authenticated'] ?? false;
$microsoft_info = $microsoft_authenticated ? $oauth->getAccountInfo() : null;

// Handle sync
$sync_result = null;
$show_stats = false;
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $_POST['action'] === 'sync') {
    if (!$microsoft_authenticated) {
        $sync_result = ['success' => false, 'error' => 'Você precisa se conectar ao Microsoft 365 primeiro'];
    } else {
        $controller = new CommunicationsController($pdo, $config);
        $sync_result = $controller->sync();
        $show_stats = true;
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
                    <form method="POST" style="margin: 0;">
                        <input type="hidden" name="action" value="sync">
                        <button type="submit" class="btn btn-primary" <?php echo !$microsoft_authenticated ? 'disabled style="opacity: 0.5; cursor: not-allowed;"' : ''; ?>>↻ Sincronizar</button>
                    </form>
                </div>
            </div>

            <?php if ($microsoft_authenticated): ?>
            <div style="background: #e8f5e9; color: #2e7d32; padding: 12px 15px; border-radius: 6px; margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center;">
                <div>
                    <strong>✅ Conectado ao Microsoft 365</strong> — <?php echo htmlspecialchars($config['microsoft']['mailbox'] ?? 'Mailbox'); ?>
                </div>
                <a href="/newipcsistemas/index.php?page=auth/disconnect" style="color: #2e7d32; text-decoration: none; font-size: 12px; font-weight: 500;">Desconectar →</a>
            </div>
            <?php else: ?>
            <div style="background: #fff3cd; color: #856404; padding: 12px 15px; border-radius: 6px; margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center;">
                <div>
                    <strong>⚠️ Não conectado ao Microsoft 365</strong> — Clique no botão para sincronizar emails
                </div>
                <a href="/newipcsistemas/index.php?page=auth/microsoft" style="color: #856404; text-decoration: none; font-size: 12px; font-weight: 500;">Conectar →</a>
            </div>
            <?php endif; ?>

            <?php if ($sync_result): ?>
            <div style="background: <?php echo $sync_result['success'] ? '#e8f5e9' : '#ffebee'; ?>;
                        color: <?php echo $sync_result['success'] ? '#2e7d32' : '#c62828'; ?>;
                        padding: 15px; border-radius: 6px; margin-bottom: 20px; border-left: 4px solid <?php echo $sync_result['success'] ? '#2e7d32' : '#c62828'; ?>;">
                <?php echo htmlspecialchars($sync_result['message'] ?? $sync_result['error']); ?>
            </div>
            <?php endif; ?>

            <?php if ($show_stats): ?>
            <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 15px; margin-bottom: 20px;">
                <div style="background: white; padding: 15px; border-radius: 6px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); text-align: center;">
                    <div style="font-size: 24px; font-weight: bold; color: #667eea;"><?php echo $stats['total']; ?></div>
                    <div style="font-size: 12px; color: #666; margin-top: 5px;">Total</div>
                </div>
                <div style="background: white; padding: 15px; border-radius: 6px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); text-align: center;">
                    <div style="font-size: 24px; font-weight: bold; color: #0288d1;"><?php echo $stats['by_status']['new'] ?? 0; ?></div>
                    <div style="font-size: 12px; color: #666; margin-top: 5px;">Novas</div>
                </div>
                <div style="background: white; padding: 15px; border-radius: 6px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); text-align: center;">
                    <div style="font-size: 24px; font-weight: bold; color: #388e3c;"><?php echo $stats['by_status']['processed'] ?? 0; ?></div>
                    <div style="font-size: 12px; color: #666; margin-top: 5px;">Processadas</div>
                </div>
                <div style="background: white; padding: 15px; border-radius: 6px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); text-align: center;">
                    <div style="font-size: 24px; font-weight: bold; color: #c62828;"><?php echo $stats['by_status']['error'] ?? 0; ?></div>
                    <div style="font-size: 12px; color: #666; margin-top: 5px;">Erros</div>
                </div>
            </div>
            <?php endif; ?>

            <div class="filters">
                <form method="GET" style="display: flex; gap: 15px; flex-wrap: wrap; width: 100%;">
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

                    <div class="filter-group" style="display: flex; align-items: flex-end;">
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
                            <button type="button" class="btn-action" onclick="extractCommunication(<?php echo $comm['id']; ?>)">
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
    async function extractCommunication(id) {
        const button = event.target;
        const originalText = button.innerHTML;

        try {
            button.disabled = true;
            button.innerHTML = '⏳ Extraindo...';

            const response = await fetch(`/api.php?action=extract&id=${id}`);
            const result = await response.json();

            if (result.success) {
                alert('✅ Informações extraídas com sucesso!');
                location.reload();
            } else {
                alert(`❌ Erro: ${result.error}`);
                button.innerHTML = originalText;
                button.disabled = false;
            }
        } catch (error) {
            alert(`❌ Erro ao conectar: ${error.message}`);
            button.innerHTML = originalText;
            button.disabled = false;
        }
    }
    </script>
</body>
</html>
