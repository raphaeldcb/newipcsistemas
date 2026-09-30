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
            grid-template-columns: 40px 200px 150px 200px 100px 100px;
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
            grid-template-columns: 40px 200px 150px 200px 100px 100px;
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
                    <a href="/comunicacoes" class="menu-link active">
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
                <div class="header-title">
                    <h1>📧 Comunicações</h1>
                    <p>Gerencie emails recebidos de tribunais e varas</p>
                </div>
                <div class="header-actions">
                    <button class="btn btn-primary">↻ Sincronizar</button>
                </div>
            </div>

            <div class="filters">
                <div class="filter-group">
                    <label>Status</label>
                    <select>
                        <option value="">Todos</option>
                        <option value="new">Novas</option>
                        <option value="processing">Processando</option>
                        <option value="processed">Processadas</option>
                        <option value="error">Erros</option>
                    </select>
                </div>

                <div class="filter-group">
                    <label>Vara/Comarca</label>
                    <input type="text" placeholder="Filtrar por vara...">
                </div>

                <div class="filter-group">
                    <label>Processo</label>
                    <input type="text" placeholder="Número do processo...">
                </div>

                <div class="filter-group">
                    <label>Período</label>
                    <select>
                        <option value="">Últimos 30 dias</option>
                        <option value="">Últimos 7 dias</option>
                        <option value="">Hoje</option>
                    </select>
                </div>
            </div>

            <div class="communications-list">
                <div class="communications-header">
                    <div></div>
                    <div>Remetente</div>
                    <div>Vara</div>
                    <div>Processo</div>
                    <div>Assunto</div>
                    <div>Status</div>
                </div>

                <div class="empty-state">
                    <div class="empty-state-icon">📧</div>
                    <div class="empty-state-title">Nenhuma comunicação recebida</div>
                    <div class="empty-state-description">
                        Clique em "Sincronizar" para buscar emails da mailbox configurada.
                    </div>
                    <button class="btn btn-primary">Sincronizar Agora</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
