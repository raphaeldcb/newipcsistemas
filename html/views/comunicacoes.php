<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comunicações - Novos Sistemas IPC</title>
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
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
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
            .sidebar { width: 100%; height: auto; position: relative; }
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
            <button class="btn">↻ Sincronizar</button>
        </div>

        <div class="filter-section">
            <div class="form-group">
                <label>Status</label>
                <select>
                    <option>Todos</option>
                    <option>Novo</option>
                    <option>Processando</option>
                    <option>Processado</option>
                </select>
            </div>
            <div class="form-group">
                <label>Vara/Comarca</label>
                <input type="text" placeholder="Filtrar por vara...">
            </div>
            <div class="form-group">
                <label>Processo</label>
                <input type="text" placeholder="Número do processo...">
            </div>
            <div class="form-group">
                <button class="btn" style="align-self: flex-end;">🔍 Filtrar</button>
            </div>
        </div>

        <div class="table-section">
            <table class="table">
                <thead>
                    <tr>
                        <th>Data</th>
                        <th>Remetente</th>
                        <th>Vara</th>
                        <th>Processo</th>
                        <th>Status</th>
                        <th>Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>30/09/2026</td>
                        <td>Tribunal de Justiça</td>
                        <td>TJMS</td>
                        <td>0000000-00.0000.0.00.0000</td>
                        <td><span class="badge badge-success">Processado</span></td>
                        <td><a href="#" class="btn" style="padding: 5px 10px; font-size: 12px;">Ver</a></td>
                    </tr>
                    <tr>
                        <td>29/09/2026</td>
                        <td>Procuradora Geral</td>
                        <td>TJSP</td>
                        <td>1111111-11.1111.1.11.1111</td>
                        <td><span class="badge badge-success">Processado</span></td>
                        <td><a href="#" class="btn" style="padding: 5px 10px; font-size: 12px;">Ver</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
