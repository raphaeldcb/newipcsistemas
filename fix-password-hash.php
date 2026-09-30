<?php
/**
 * Fix Password Hash
 * Corrige o hash da senha do admin se estiver inválido
 */

require_once __DIR__ . '/config/config.php';

try {
    $pdo = new PDO(
        'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['database'] . ';charset=' . $config['db']['charset'],
        $config['db']['username'],
        $config['db']['password'],
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
    echo "✅ Conectado ao banco de dados\n";
} catch (PDOException $e) {
    echo "❌ Erro de conexão: " . $e->getMessage() . "\n";
    exit(1);
}

// Hash correto para admin123
$correct_hash = '$2y$10$sOqiAF3IX9OhhcE4b6GdHON4A7IttnxKZCWCuXBwyNgxm4FSCbobW';

// Verificar hash atual
$stmt = $pdo->prepare('SELECT id, email, password_hash FROM users WHERE email = ?');
$stmt->execute(['admin@ipcms.com.br']);
$user = $stmt->fetch();

if (!$user) {
    echo "❌ Usuário admin@ipcms.com.br não encontrado!\n";
    exit(1);
}

echo "\n📋 Status do hash:\n";
echo "================\n";

// Testar hash atual
if (password_verify('admin123', $user['password_hash'])) {
    echo "✅ Hash já está CORRETO! Nenhuma ação necessária.\n";
    exit(0);
} else {
    echo "❌ Hash INCORRETO (não valida 'admin123')\n";
    echo "   Senha atual: " . substr($user['password_hash'], 0, 30) . "...\n";
    echo "   Atualizando...\n\n";

    // Atualizar
    $update_stmt = $pdo->prepare('UPDATE users SET password_hash = ? WHERE id = ?');
    $update_stmt->execute([$correct_hash, $user['id']]);

    // Verificar atualização
    $verify_stmt = $pdo->prepare('SELECT password_hash FROM users WHERE id = ?');
    $verify_stmt->execute([$user['id']]);
    $updated_user = $verify_stmt->fetch();

    if (password_verify('admin123', $updated_user['password_hash'])) {
        echo "✅ Hash CORRIGIDO com sucesso!\n";
        echo "   Nova senha: " . substr($updated_user['password_hash'], 0, 30) . "...\n";
        echo "\n🔓 Agora você pode fazer login com:\n";
        echo "   Email: admin@ipcms.com.br\n";
        echo "   Senha: admin123\n";
    } else {
        echo "❌ Falha ao atualizar hash\n";
        exit(1);
    }
}
