<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Autenticando...</title>
    <link rel="stylesheet" href="../css/theme-unified.css">
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

            <a href="/" class="back-link">← Voltar para Painel</a>
        <?php endif; ?>
    </div>
</body>
</html>
