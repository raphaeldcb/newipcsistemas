<?php
/**
 * Database Migration Script
 * Run this once to add classification columns
 */

session_start();

// Load config
$config = require_once __DIR__ . '/config/config.php';

try {
    $pdo = new PDO(
        'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['database'] . ';charset=' . $config['db']['charset'],
        $config['db']['username'],
        $config['db']['password'],
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );

    echo "<h2>🔄 Running Database Migration...</h2>";
    echo "<pre>";

    // Add classification columns if they don't exist
    $migrations = [
        "ALTER TABLE communications ADD COLUMN classification VARCHAR(50) DEFAULT 'UNKNOWN' COMMENT 'JUDICIAL, NON_JUDICIAL, UNKNOWN'",
        "ALTER TABLE communications ADD COLUMN cnj_number VARCHAR(50) DEFAULT NULL COMMENT 'Número de autos CNJ'",
        "ALTER TABLE communications ADD COLUMN has_complete_data BOOLEAN DEFAULT FALSE COMMENT 'Has CNJ, vara, comarca'",
    ];

    foreach ($migrations as $sql) {
        try {
            $pdo->exec($sql);
            echo "✅ " . substr($sql, 0, 60) . "...\n";
        } catch (Exception $e) {
            if (strpos($e->getMessage(), 'already exists') !== false) {
                echo "⏭️  Column already exists\n";
            } else {
                echo "❌ " . $e->getMessage() . "\n";
            }
        }
    }

    echo "</pre>";
    echo "<h3>✅ Migration Complete!</h3>";
    echo "<p><a href='index.php?page=comunicacoes'>← Back to Comunicações</a></p>";

} catch (Exception $e) {
    echo "<h3>❌ Migration Failed</h3>";
    echo "<pre>" . $e->getMessage() . "</pre>";
}
?>
