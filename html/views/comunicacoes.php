<?php
// Verificar autenticação
if (!isset($_SESSION['user_id'])) {
    header('Location: /newipcsistemas/index.php?page=login');
    exit;
}

$user = $_SESSION['user'] ?? [];

// Get real communications from database
global $pdo;

// Get filter from URL
$filter = $_GET['filter'] ?? 'ALL';

// Build query with filter
$sql = "
    SELECT id, received_datetime as date, from_name, from_address,
           vara, comarca, processo_numero as process, status, subject,
           classification, cnj_number, has_complete_data, analyzed
    FROM communications
    WHERE 1=1
";

if ($filter === 'JUDICIAL') {
    $sql .= " AND classification = 'JUDICIAL'";
} elseif ($filter === 'NON_JUDICIAL') {
    $sql .= " AND classification = 'NON_JUDICIAL'";
} elseif ($filter === 'INCOMPLETE') {
    $sql .= " AND classification = 'JUDICIAL' AND has_complete_data = 0";
} elseif ($filter === 'COMPLETE') {
    $sql .= " AND classification = 'JUDICIAL' AND has_complete_data = 1";
}

$sql .= " ORDER BY received_datetime DESC LIMIT 100";

$stmt = $pdo->query($sql);
$communications = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comunicações - Novos Sistemas IPC</title>
    <link rel="icon" type="image/svg+xml" href="/newipcsistemas/html/favicon.svg">
    <style>
        :root {
            --color-primary: #132F4A;
            --color-primary-light: #1A4A6F;
            --bg-primary: #FFFFFF;
            --bg-secondary: #F9FAFB;
            --text-primary: #1F2937;
            --text-secondary: #6B7280;
            --border-color: #E5E7EB;
            --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.07);
            --shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.1);
            --color-success: #10B981;
            --spacing-lg: 1.5rem;
            --spacing-md: 1rem;
            --radius-lg: 12px;
            --radius-md: 8px;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background-color: var(--bg-secondary);
            color: var(--text-primary);
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 250px;
            background: linear-gradient(135deg, var(--color-primary) 0%, var(--color-primary-light) 100%);
            color: white;
            padding: var(--spacing-lg);
            box-shadow: var(--shadow-lg);
            position: fixed;
            height: 100vh;
            overflow-y: auto;
        }

        .sidebar-header {
            margin-bottom: var(--spacing-lg);
            padding-bottom: var(--spacing-lg);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .sidebar-header h2 { font-size: 18px; margin-top: var(--spacing-md); }

        .menu-items {
            list-style: none;
            margin-bottom: var(--spacing-lg);
        }

        .menu-items li { margin-bottom: var(--spacing-md); }

        .menu-items a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: var(--spacing-md);
            padding: var(--spacing-md);
            border-radius: var(--radius-md);
            transition: all 0.2s;
        }

        .menu-items a:hover, .menu-items a.active {
            background: rgba(255, 255, 255, 0.1);
            color: white;
        }

        .main-content {
            margin-left: 250px;
            flex: 1;
            padding: var(--spacing-lg);
        }

        .header {
            background: white;
            padding: var(--spacing-lg);
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-md);
            margin-bottom: var(--spacing-lg);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 { font-size: 28px; margin-bottom: 0; }

        .btn {
            background: linear-gradient(135deg, var(--color-primary) 0%, var(--color-primary-light) 100%);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: var(--radius-md);
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s;
            box-shadow: var(--shadow-md);
            text-decoration: none;
            display: inline-block;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
        }

        .btn-small {
            padding: 6px 12px;
            font-size: 13px;
        }

        .filter-section {
            background: white;
            padding: var(--spacing-lg);
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-md);
            margin-bottom: var(--spacing-lg);
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: var(--spacing-md);
        }

        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: var(--text-primary);
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid var(--border-color);
            border-radius: var(--radius-md);
            font-family: inherit;
        }

        .table-section {
            background: white;
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-md);
            overflow: hidden;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th {
            background: linear-gradient(135deg, var(--color-primary) 0%, var(--color-primary-light) 100%);
            color: white;
            padding: var(--spacing-md);
            text-align: left;
            font-weight: 600;
        }

        .table td {
            padding: var(--spacing-md);
            border-bottom: 1px solid var(--border-color);
        }

        .table tbody tr:hover {
            background-color: var(--bg-secondary);
        }

        .badge {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .badge-success {
            background-color: rgba(16, 185, 129, 0.1);
            color: var(--color-success);
        }

        .badge-new {
            background-color: rgba(59, 130, 246, 0.1);
            color: #3B82F6;
        }

        .user-menu {
            margin-top: auto;
            padding-top: var(--spacing-lg);
            border-top: 1px solid rgba(255, 255, 255, 0.2);
        }

        .logout-btn {
            display: block;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            padding: var(--spacing-md);
            border-radius: var(--radius-md);
            text-align: center;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.2s;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .logout-btn:hover { background: rgba(255, 255, 255, 0.2); }

        @media (max-width: 768px) {
            .sidebar { width: 100%; height: auto; position: relative; padding: var(--spacing-md); }
            .main-content { margin-left: 0; }
            .header { flex-direction: column; gap: var(--spacing-md); }
            .filter-section { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="sidebar-header">
            <div>🏛️</div>
            <h2>Novos Sistemas</h2>
        </div>

        <ul class="menu-items">
            <li><a href="/newipcsistemas/index.php">📊 Painel</a></li>
            <li><a href="/newipcsistemas/index.php?page=comunicacoes" class="active">📧 Comunicações</a></li>
            <?php if (($_SESSION['role'] ?? '') === 'admin'): ?>
                <li><a href="/newipcsistemas/index.php?page=usuarios">👥 Usuários</a></li>
            <?php endif; ?>
            <li><a href="#">⚙️ Configurações</a></li>
            <li><a href="#">📋 Relatórios</a></li>
        </ul>

        <div class="user-menu">
            <?php if ($user): ?>
                <div style="margin-bottom: var(--spacing-md); font-size: 14px;">
                    <strong><?php echo htmlspecialchars($user['name'] ?? 'Usuário'); ?></strong><br>
                    <span style="opacity: 0.8;"><?php echo htmlspecialchars($user['email'] ?? ''); ?></span>
                </div>
            <?php endif; ?>
            <a href="/newipcsistemas/index.php?page=logout" class="logout-btn">🚪 Sair</a>
        </div>
    </div>

    <div class="main-content">
        <div class="header">
            <div>
                <h1>📧 Comunicações</h1>
                <p>Gerencie emails recebidos de tribunais e varas</p>
            </div>
            <button class="btn" onclick="syncEmails()">↻ Sincronizar</button>
        </div>

        <div class="filter-section">
            <div class="form-group">
                <label>Classificação</label>
                <div style="display: flex; gap: 10px;">
                    <a href="?page=comunicacoes&filter=ALL" class="btn" style="text-decoration: none; padding: 8px 12px; font-size: 13px;">Todos</a>
                    <a href="?page=comunicacoes&filter=JUDICIAL" class="btn" style="text-decoration: none; padding: 8px 12px; font-size: 13px;">⚖️ Judicial</a>
                    <a href="?page=comunicacoes&filter=NON_JUDICIAL" class="btn" style="text-decoration: none; padding: 8px 12px; font-size: 13px;">📄 Não Judicial</a>
                    <a href="?page=comunicacoes&filter=COMPLETE" class="btn" style="text-decoration: none; padding: 8px 12px; font-size: 13px;">✅ Completos</a>
                    <a href="?page=comunicacoes&filter=INCOMPLETE" class="btn" style="text-decoration: none; padding: 8px 12px; font-size: 13px;">❌ Incompletos</a>
                </div>
            </div>
        </div>

        <div class="table-section">
            <table class="table">
                <thead>
                    <tr>
                        <th style="width: 130px;">Data</th>
                        <th style="width: 140px;">Remetente</th>
                        <th style="width: 220px;">Vara</th>
                        <th style="width: 160px;">Processo (CNJ)</th>
                        <th style="width: 130px;">Classificação</th>
                        <th style="width: 100px;">Analisado</th>
                        <th style="width: 60px;">Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($communications as $comm): ?>
                    <tr>
                        <td><?php echo htmlspecialchars(substr($comm['date'], 0, 16)); ?></td>
                        <td><?php echo htmlspecialchars($comm['from_name'] ?? '-'); ?></td>
                        <td><?php echo htmlspecialchars($comm['vara'] ?? '-'); ?></td>
                        <td><?php echo htmlspecialchars($comm['cnj_number'] ?? ($comm['process'] ?? '-')); ?></td>
                        <td>
                            <?php
                            $class = $comm['classification'] === 'JUDICIAL' ? 'badge-success' : ($comm['classification'] === 'NON_JUDICIAL' ? 'badge-warning' : 'badge-info');
                            $label = $comm['classification'] === 'JUDICIAL' ? '⚖️ Judicial' : ($comm['classification'] === 'NON_JUDICIAL' ? '📄 Não Judicial' : '❓ Desconhecido');
                            ?>
                            <span class="badge <?php echo $class; ?>"><?php echo $label; ?></span>
                        </td>
                        <td>
                            <?php echo ($comm['analyzed'] ?? false) ? '✅ Sim' : '⏳ Não'; ?>
                        </td>
                        <td><button class="btn btn-small" onclick="openEmailModal('<?php echo $comm['id']; ?>')">Ver</button></td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Email Detail Modal -->
    <?php include __DIR__ . '/email-detail-modal.php'; ?>

    <script>
        function syncEmails() {
            const btn = document.querySelector('.btn');
            const originalText = btn.textContent;
            const startTime = Date.now();

            // Change button to loading state
            btn.disabled = true;
            btn.textContent = '⏳ Processando...';
            btn.style.opacity = '0.6';

            // Start timer
            const timerInterval = setInterval(() => {
                const elapsed = Math.floor((Date.now() - startTime) / 1000);
                const secs = elapsed % 60;
                const mins = Math.floor(elapsed / 60);
                btn.textContent = `⏳ ${mins}:${String(secs).padStart(2, '0')}`;
            }, 100);

            fetch('/newipcsistemas/api.php?action=sync', {
                method: 'POST',
                credentials: 'include'
            })
            .then(r => r.json())
            .then(data => {
                clearInterval(timerInterval);
                btn.disabled = false;
                btn.style.opacity = '1';

                const elapsed = Math.floor((Date.now() - startTime) / 1000);
                const mins = Math.floor(elapsed / 60);
                const secs = elapsed % 60;

                if (data.success) {
                    const syncedCount = data.synced_count || 0;
                    const reprocessedCount = data.reprocessed_count || 0;
                    alert(`✅ Sincronização Completa!\n\n📧 ${syncedCount} emails sincronizados\n🔄 ${reprocessedCount} reprocessados\n⏱️ ${mins}:${String(secs).padStart(2, '0')}s`);
                    location.reload();
                } else {
                    btn.textContent = originalText;
                    alert('❌ Erro: ' + (data.error || 'Desconhecido'));
                }
            })
            .catch(err => {
                clearInterval(timerInterval);
                btn.disabled = false;
                btn.style.opacity = '1';
                btn.textContent = originalText;
                alert('❌ Erro ao sincronizar: ' + err);
            });
        }
    </script>
</body>
</html>
