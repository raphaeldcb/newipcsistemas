<?php
/**
 * Clean up: Delete all communications and related data
 * Safe deletion with dependencies handled first
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

    echo "<h2>🗑️ Cleaning up Communications...</h2>";
    echo "<pre>";

    // Disable foreign key checks temporarily
    $pdo->exec("SET FOREIGN_KEY_CHECKS=0");
    echo "✅ Foreign key checks disabled\n";

    // Delete in order of dependencies
    $tables_to_clean = [
        'email_responses',      // Depends on communications
        'processing_logs',      // Depends on communications (if exists)
        'communications'        // Main table
    ];

    foreach ($tables_to_clean as $table) {
        try {
            $pdo->exec("TRUNCATE TABLE $table");
            echo "✅ Truncated $table\n";
        } catch (Exception $e) {
            if (strpos($e->getMessage(), 'exist') !== false) {
                echo "⏭️  Table $table does not exist\n";
            } else {
                echo "⚠️  Warning for $table: " . $e->getMessage() . "\n";
            }
        }
    }

    // Re-enable foreign key checks
    $pdo->exec("SET FOREIGN_KEY_CHECKS=1");
    echo "✅ Foreign key checks re-enabled\n";

    echo "\n✅ Cleanup Complete!\n";
    echo "All communications and related data have been deleted.\n";
    echo "</pre>";
    echo "<p><a href='index.php?page=comunicacoes'>← Back to Comunicações</a></p>";

} catch (Exception $e) {
    echo "<h3>❌ Cleanup Failed</h3>";
    echo "<pre>" . $e->getMessage() . "</pre>";
}
?>
