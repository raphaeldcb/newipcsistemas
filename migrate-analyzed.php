<?php
/**
 * Add analyzed column to track processed emails
 */

session_start();
$config = require_once __DIR__ . '/config/config.php';

try {
    $pdo = new PDO(
        'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['database'] . ';charset=' . $config['db']['charset'],
        $config['db']['username'],
        $config['db']['password'],
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );

    echo "<h2>🔄 Adding 'analyzed' column...</h2>";
    echo "<pre>";

    try {
        $pdo->exec("ALTER TABLE communications ADD COLUMN analyzed BOOLEAN DEFAULT FALSE COMMENT 'User has analyzed this email'");
        echo "✅ Column 'analyzed' added successfully\n";
    } catch (Exception $e) {
        if (strpos($e->getMessage(), 'Duplicate column name') !== false) {
            echo "⏭️  Column 'analyzed' already exists\n";
        } else {
            throw $e;
        }
    }

    echo "\n✅ Migration Complete!\n";
    echo "You can now mark emails as analyzed.\n";
    echo "</pre>";
    echo "<p><a href='index.php?page=comunicacoes'>← Back to Comunicações</a></p>";

} catch (Exception $e) {
    echo "<h3>❌ Migration Failed</h3>";
    echo "<pre>" . $e->getMessage() . "</pre>";
}
?>
