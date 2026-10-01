<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel - Novos Sistemas IPC</title>
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
        }

        .header h1 { font-size: 28px; margin-bottom: var(--spacing-md); }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: var(--spacing-lg);
        }

        .card {
            background: white;
            border: 1px solid var(--border-color);
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-md);
            overflow: hidden;
            transition: all 0.2s;
        }

        .card:hover {
            box-shadow: var(--shadow-lg);
            transform: translateY(-2px);
        }

        .card-header {
            background: linear-gradient(135deg, var(--color-primary) 0%, var(--color-primary-light) 100%);
            color: white;
            padding: var(--spacing-lg);
            font-size: 20px;
            font-weight: 600;
        }

        .card-body { padding: var(--spacing-lg); }
        .card-body p { color: var(--text-secondary); margin-bottom: var(--spacing-lg); line-height: 1.6; }

        .card-button {
            display: inline-block;
            background: linear-gradient(135deg, var(--color-primary) 0%, var(--color-primary-light) 100%);
            color: white;
            padding: 10px 20px;
            border-radius: var(--radius-md);
            text-decoration: none;
            font-weight: 600;
            transition: all 0.2s;
            box-shadow: var(--shadow-md);
        }

        .card-button:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
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
            .grid { grid-template-columns: 1fr; }
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
            <li><a href="/newipcsistemas/index.php" class="active">📊 Painel</a></li>
            <li><a href="/newipcsistemas/index.php?page=comunicacoes">📧 Comunicações</a></li>
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
            <h1>👋 Bem-vindo!</h1>
            <p>Sistema de Gestão de Perícias Judiciais</p>
        </div>

        <div class="grid">
            <div class="card">
                <div class="card-header">📧 Comunicações</div>
                <div class="card-body">
                    <p>Gerencie emails recebidos de tribunais, varas e comarcas. Extraia automaticamente informações de processos, pedidos e dados relevantes.</p>
                    <a href="/newipcsistemas/index.php?page=comunicacoes" class="card-button">Acessar →</a>
                </div>
            </div>

            <div class="card">
                <div class="card-header">📊 Estatísticas</div>
                <div class="card-body">
                    <p>Visualize gráficos e relatórios sobre comunicações processadas, taxa de sucesso de extração, e performance do sistema.</p>
                    <a href="#" class="card-button">Em Breve →</a>
                </div>
            </div>

            <div class="card">
                <div class="card-header">⚙️ Configurações</div>
                <div class="card-body">
                    <p>Configure a integração com Microsoft Graph, parâmetros de processamento e templates de resposta automática.</p>
                    <a href="#" class="card-button">Em Breve →</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
