<?php
/**
 * Change Admin Password
 * Muda a senha do admin@ipcms.com.br
 */

require_once __DIR__ . '/config/config.php';
require_once __DIR__ . '/config/load-env.php';

// Senha nova
$new_password = 'Tucano%23';

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

// Buscar usuário
$stmt = $pdo->prepare('SELECT id, email, password_hash FROM users WHERE email = ?');
$stmt->execute(['admin@ipcms.com.br']);
$user = $stmt->fetch();

if (!$user) {
    echo "❌ Usuário admin@ipcms.com.br não encontrado!\n";
    exit(1);
}

echo "\n📋 Alterando Senha\n";
echo "==================\n";
echo "Email: " . $user['email'] . "\n";
echo "Senha antiga: admin123\n";
echo "Senha nova: " . $new_password . "\n\n";

// Gerar novo hash
$new_hash = password_hash($new_password, PASSWORD_BCRYPT);

// Atualizar
$update_stmt = $pdo->prepare('UPDATE users SET password_hash = ? WHERE id = ?');
$update_stmt->execute([$new_hash, $user['id']]);

// Verificar atualização
$verify_stmt = $pdo->prepare('SELECT password_hash FROM users WHERE id = ?');
$verify_stmt->execute([$user['id']]);
$updated_user = $verify_stmt->fetch();

if (password_verify($new_password, $updated_user['password_hash'])) {
    echo "✅ Senha alterada com sucesso!\n\n";
    echo "🔓 Agora você pode fazer login com:\n";
    echo "   Email: admin@ipcms.com.br\n";
    echo "   Senha: " . $new_password . "\n";
} else {
    echo "❌ Falha ao alterar senha\n";
    exit(1);
}
?>
