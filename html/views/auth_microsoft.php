<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Conectar Microsoft - Novos Sistemas IPC</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 450px;
            padding: 40px;
            text-align: center;
        }

        .header {
            margin-bottom: 30px;
        }

        .header h1 {
            font-size: 28px;
            color: #333;
            margin-bottom: 10px;
        }

        .header p {
            color: #666;
            font-size: 14px;
        }

        .logo {
            font-size: 48px;
            margin-bottom: 20px;
        }

        .description {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin: 20px 0;
            text-align: left;
            font-size: 14px;
            line-height: 1.6;
            color: #666;
        }

        .description h3 {
            color: #333;
            margin-bottom: 10px;
            font-size: 16px;
        }

        .description ul {
            list-style: none;
            padding: 0;
        }

        .description li {
            padding: 5px 0;
            padding-left: 25px;
            position: relative;
        }

        .description li:before {
            content: "✓";
            position: absolute;
            left: 0;
            color: #667eea;
            font-weight: bold;
        }

        .microsoft-btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
            text-decoration: none;
            display: inline-block;
        }

        .microsoft-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 20px rgba(102, 126, 234, 0.4);
        }

        .microsoft-btn:active {
            transform: translateY(0);
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #667eea;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            padding: 10px 0;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        .warning {
            background: #fff3cd;
            border: 1px solid #ffc107;
            color: #856404;
            padding: 15px;
            border-radius: 6px;
            font-size: 13px;
            margin-bottom: 20px;
        }

        .icons-row {
            display: flex;
            justify-content: space-around;
            margin: 20px 0;
            font-size: 32px;
        }

        .icons-row span {
            opacity: 0.7;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="logo">🏛️</div>
            <h1>Conectar Microsoft 365</h1>
            <p>Novos Sistemas IPC</p>
        </div>

        <div class="icons-row">
            <span>📧</span>
            <span>↔️</span>
            <span>☁️</span>
        </div>

        <div class="description">
            <h3>Funcionalidades Desbloqueadas:</h3>
            <ul>
                <li>Sincronizar emails de tribunais</li>
                <li>Processar comunicações automáticas</li>
                <li>Extrair informações de varas e processos</li>
                <li>Respostas automáticas configuráveis</li>
            </ul>
        </div>

        <a href="<?php echo htmlspecialchars($auth_url); ?>" class="microsoft-btn">
            🔐 Conectar com Microsoft 365
        </a>

        <div class="warning">
            <strong>⚠️ Nota:</strong> Você será redirecionado para o login da Microsoft de forma segura. Nós não armazenamos sua senha.
        </div>

        <a href="/" class="back-link">← Voltar para Dashboard</a>
    </div>
</body>
</html>
