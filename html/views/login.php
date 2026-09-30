<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Novos Sistemas IPC</title>
    <link rel="stylesheet" href="../css/theme-unified.css">
    <style>
        body {
            background: linear-gradient(135deg, #132F4A 0%, #1A4A6F 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-container {
            width: 100%;
            max-width: 400px;
            padding: var(--spacing-xl);
        }

        .login-header {
            text-align: center;
            margin-bottom: var(--spacing-lg);
        }

        .login-header h1 {
            font-size: 1.75rem;
            margin-bottom: var(--spacing-xs);
        }

        .login-header p {
            color: var(--text-secondary);
            font-size: 0.95rem;
        }

        .error-message {
            background: rgba(239, 68, 68, 0.1);
            color: var(--color-error);
            padding: var(--spacing-md);
            border-radius: var(--radius-md);
            margin-bottom: var(--spacing-lg);
            font-size: 0.95rem;
            border-left: 4px solid var(--color-error);
        }

        .submit-btn {
            width: 100%;
            padding: var(--spacing-md);
            background: linear-gradient(135deg, var(--color-primary) 0%, var(--color-primary-light) 100%);
            color: white;
            border: none;
            border-radius: var(--radius-md);
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
        }

        .demo-credentials {
            margin-top: var(--spacing-lg);
            padding-top: var(--spacing-lg);
            border-top: 1px solid var(--border-color);
            text-align: center;
            font-size: 0.8rem;
            color: var(--text-muted);
        }

        .demo-credentials strong {
            display: block;
            color: var(--text-secondary);
            margin-bottom: var(--spacing-xs);
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <h1>🏛️ Novos Sistemas IPC</h1>
            <p>Gestão de Perícias Judiciais</p>
        </div>

        <?php if (!empty($error)): ?>
            <div class="error-message"><?php echo htmlspecialchars($error); ?></div>
        <?php endif; ?>

        <form method="POST" action="/newipcsistemas/index.php?page=login">
            <div class="form-group">
                <label for="email">Email</label>
                <input
                    type="email"
                    id="email"
                    name="email"
                    value="<?php echo htmlspecialchars($_POST['email'] ?? ''); ?>"
                    required
                    autofocus
                    placeholder="seu@email.com"
                >
            </div>

            <div class="form-group">
                <label for="password">Senha</label>
                <input
                    type="password"
                    id="password"
                    name="password"
                    required
                    placeholder="••••••••"
                >
            </div>

            <button type="submit" class="submit-btn">Entrar</button>
        </form>

        <div class="demo-credentials">
            <strong>Demonstração:</strong>
            admin@ipcms.com.br / admin123
        </div>
    </div>
</body>
</html>
