<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Novos Sistemas IPC</title>
    <link rel="stylesheet" href="/newipcsistemas/html/css/theme-unified.css">
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
                    <a href="/newipcsistemas/index.php" class="menu-link active">
                        <span class="icon">📊</span>
                        <span>Painel</span>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="/newipcsistemas/index.php?page=comunicacoes" class="menu-link">
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
                    <a href="/newipcsistemas/index.php?page=comunicacoes" class="card-button">Acessar →</a>
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
