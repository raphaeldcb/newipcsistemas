<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Novos Sistemas IPC</title>
    <style>
        :root {
          --color-primary: #132F4A;
          --color-primary-light: #1A4A6F;
          --color-primary-dark: #0D1F2D;
          --bg-primary: #FFFFFF;
          --bg-secondary: #F9FAFB;
          --text-primary: #1F2937;
          --text-secondary: #6B7280;
          --border-color: #E5E7EB;
          --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.07);
          --shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.1);
          --color-error: #EF4444;
          --spacing-lg: 1.5rem;
          --spacing-md: 1rem;
          --spacing-sm: 0.5rem;
          --radius-md: 8px;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        html {
          font-size: 16px;
          -webkit-font-smoothing: antialiased;
          -moz-osx-font-smoothing: grayscale;
        }

        body {
          font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
          background: linear-gradient(135deg, var(--color-primary) 0%, var(--color-primary-light) 100%);
          min-height: 100vh;
          display: flex;
          align-items: center;
          justify-content: center;
          padding: 20px;
        }

        .login-wrapper {
          background: white;
          border-radius: 12px;
          box-shadow: var(--shadow-lg);
          width: 100%;
          max-width: 400px;
          overflow: hidden;
        }

        .login-header {
          background: linear-gradient(135deg, var(--color-primary) 0%, var(--color-primary-light) 100%);
          color: white;
          padding: 30px;
          text-align: center;
        }

        .login-header h1 {
          font-size: 24px;
          margin-bottom: 8px;
        }

        .login-header p {
          font-size: 14px;
          opacity: 0.9;
        }

        .login-body {
          padding: 30px;
        }

        .form-group {
          margin-bottom: var(--spacing-lg);
        }

        label {
          display: block;
          font-weight: 600;
          margin-bottom: var(--spacing-sm);
          color: var(--text-primary);
          font-size: 14px;
        }

        input[type="email"],
        input[type="password"] {
          width: 100%;
          padding: 12px;
          border: 1.5px solid var(--border-color);
          border-radius: var(--radius-md);
          font-size: 14px;
          font-family: inherit;
          transition: all 0.2s;
          background: white;
          color: var(--text-primary);
        }

        input[type="email"]:focus,
        input[type="password"]:focus {
          outline: none;
          border-color: var(--color-primary);
          box-shadow: 0 0 0 3px rgba(19, 47, 74, 0.1);
        }

        .btn-login {
          width: 100%;
          padding: 12px;
          background: linear-gradient(135deg, var(--color-primary) 0%, var(--color-primary-light) 100%);
          color: white;
          border: none;
          border-radius: var(--radius-md);
          font-size: 16px;
          font-weight: 600;
          cursor: pointer;
          transition: all 0.2s;
          box-shadow: var(--shadow-md);
        }

        .btn-login:hover {
          transform: translateY(-2px);
          box-shadow: var(--shadow-lg);
        }

        .error-box {
          background: rgba(239, 68, 68, 0.1);
          border-left: 4px solid var(--color-error);
          color: var(--color-error);
          padding: var(--spacing-md);
          border-radius: 4px;
          margin-bottom: var(--spacing-lg);
          font-size: 14px;
        }

        .demo-info {
          background: var(--bg-secondary);
          border-radius: var(--radius-md);
          padding: 15px;
          text-align: center;
          font-size: 13px;
          color: var(--text-secondary);
          margin-top: var(--spacing-lg);
        }

        .demo-info strong {
          color: var(--text-primary);
        }
    </style>
</head>
<body>
    <div class="login-wrapper">
        <div class="login-header">
            <h1>🏛️ Novos Sistemas IPC</h1>
            <p>Gestão de Perícias Judiciais</p>
        </div>

        <div class="login-body">
            <?php if (!empty($error)): ?>
                <div class="error-box">
                    <strong>❌ Erro:</strong> <?php echo htmlspecialchars($error); ?>
                </div>
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

                <button type="submit" class="btn-login">🔐 Entrar</button>
            </form>

            <div class="demo-info">
                <strong>🔓 Demonstração:</strong><br>
                admin@ipcms.com.br / admin123
            </div>
        </div>
    </div>
</body>
</html>
