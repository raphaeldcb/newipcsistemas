<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Novos Sistemas IPC</title>
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
        }

        .header h1 {
            font-size: 28px;
            margin-bottom: 5px;
        }

        .header p {
            color: #666;
            font-size: 14px;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
        }

        .card-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }

        .card-title .icon {
            font-size: 24px;
            margin-right: 10px;
        }

        .card-description {
            color: #666;
            font-size: 14px;
            margin-bottom: 15px;
            line-height: 1.5;
        }

        .card-button {
            display: inline-block;
            padding: 10px 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 500;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .card-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }

            .main-content {
                margin-left: 200px;
                padding: 20px;
            }

            .header h1 {
                font-size: 24px;
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

            .dashboard-grid {
                grid-template-columns: 1fr;
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
                    <a href="/" class="menu-link active">
                        <span class="icon">📊</span>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="/comunicacoes" class="menu-link">
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
                <a href="/logout" class="logout-btn">Sair</a>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="header">
                <h1>Bem-vindo! 👋</h1>
                <p>Sistema de Gestão de Perícias Judiciais</p>
            </div>

            <div class="dashboard-grid">
                <div class="card">
                    <div class="card-title">
                        <span class="icon">📧</span>
                        Comunicações
                    </div>
                    <div class="card-description">
                        Gerencie emails recebidos de tribunais, varas e comarcas. Extraia automaticamente informações de processos, pedidos e dados relevantes.
                    </div>
                    <a href="/comunicacoes" class="card-button">Acessar →</a>
                </div>

                <div class="card">
                    <div class="card-title">
                        <span class="icon">📊</span>
                        Estatísticas
                    </div>
                    <div class="card-description">
                        Visualize gráficos e relatórios sobre comunicações processadas, taxa de sucesso de extração, e performance do sistema.
                    </div>
                    <a href="#" class="card-button">Em Breve →</a>
                </div>

                <div class="card">
                    <div class="card-title">
                        <span class="icon">⚙️</span>
                        Configurações
                    </div>
                    <div class="card-description">
                        Configure a integração com Microsoft Graph, parâmetros de processamento e templates de resposta automática.
                    </div>
                    <a href="#" class="card-button">Em Breve →</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
