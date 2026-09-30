<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Autenticando...</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
        }

        .container {
            text-align: center;
            color: white;
        }

        .spinner {
            width: 50px;
            height: 50px;
            border: 4px solid rgba(255, 255, 255, 0.3);
            border-top: 4px solid white;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin: 0 auto 20px;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        h1 {
            font-size: 24px;
            margin: 20px 0;
            font-weight: 600;
        }

        p {
            font-size: 16px;
            opacity: 0.9;
            margin: 10px 0;
        }

        .error {
            background: rgba(255, 0, 0, 0.2);
            border: 1px solid rgba(255, 0, 0, 0.5);
            padding: 20px;
            border-radius: 8px;
            margin-top: 20px;
            text-align: left;
        }

        .error h2 {
            margin-top: 0;
            font-size: 18px;
        }

        .error-message {
            font-size: 14px;
            font-family: monospace;
            word-break: break-all;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 6px;
            transition: background 0.3s;
        }

        .back-link:hover {
            background: rgba(255, 255, 255, 0.3);
        }
    </style>
</head>
<body>
    <div class="container">
        <?php if ($result['success']): ?>
            <div class="spinner"></div>
            <h1>✅ Autenticação Bem-Sucedida</h1>
            <p>Conectando ao Microsoft 365...</p>
            <p>Você será redirecionado em alguns segundos.</p>

            <script>
                // Redirect after 2 seconds
                setTimeout(() => {
                    window.location.href = '<?php echo htmlspecialchars($result['redirect']); ?>';
                }, 2000);
            </script>
        <?php else: ?>
            <div class="spinner" style="border-top-color: #ff6b6b;"></div>
            <h1>❌ Erro na Autenticação</h1>

            <div class="error">
                <h2>Falha ao conectar com Microsoft 365</h2>
                <div class="error-message">
                    <?php echo htmlspecialchars($result['error']); ?>
                </div>
            </div>

            <p style="margin-top: 20px;">Por favor, tente novamente.</p>

            <a href="/" class="back-link">← Voltar para Dashboard</a>
        <?php endif; ?>
    </div>
</body>
</html>
