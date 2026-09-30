<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Conectar Microsoft - Novos Sistemas IPC</title>
    <link rel="stylesheet" href="../css/theme-unified.css">
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

        <a href="/" class="back-link">← Voltar para Painel</a>
    </div>
</body>
</html>
