<?php
/**
 * Check users table structure
 */

require_once __DIR__ . '/config/load-env.php';
$config = require_once __DIR__ . '/config/config.php';

try {
    $pdo = new PDO(
        'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['database'] . ';charset=' . $config['db']['charset'],
        $config['db']['username'],
        $config['db']['password'],
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );

    echo "✅ Conectado ao banco de dados\n\n";

    // Show table structure
    echo "📋 Estrutura da tabela 'users':\n";
    echo "================================\n";

    $stmt = $pdo->query("DESCRIBE users");
    $columns = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($columns as $col) {
        echo "- {$col['Field']}: {$col['Type']} ";
        if ($col['Null'] === 'NO') echo "(NOT NULL) ";
        if ($col['Key'] === 'PRI') echo "(PRIMARY KEY) ";
        if ($col['Default']) echo "(DEFAULT: {$col['Default']}) ";
        echo "\n";
    }

    echo "\n📊 Dados dos usuários:\n";
    echo "================================\n";

    $stmt = $pdo->query("SELECT * FROM users");
    $users = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($users as $user) {
        echo "\n- Email: {$user['email']}\n";
        foreach ($user as $key => $value) {
            if ($key !== 'password_hash' && $key !== 'email') {
                echo "  {$key}: {$value}\n";
            }
        }
    }

} catch (Exception $e) {
    echo "❌ Erro: " . $e->getMessage() . "\n";
}
?>
