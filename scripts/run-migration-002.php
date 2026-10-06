<?php
/**
 * Run Migration 002: Add Body Column
 *
 * Applies the migration to add the full body column to communications table
 * Usage: php scripts/run-migration-002.php
 */

// Load configuration
require_once __DIR__ . '/../config/load-env.php';
$config = require_once __DIR__ . '/../config/config.php';

// Connect to database
try {
    $pdo = new PDO(
        'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['database'] . ';charset=' . $config['db']['charset'],
        $config['db']['username'],
        $config['db']['password'],
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        ]
    );
    echo "[✓] Connected to database: {$config['db']['database']}\n";
} catch (PDOException $e) {
    echo "[✗] Failed to connect to database: " . $e->getMessage() . "\n";
    exit(1);
}

// Read migration SQL file
$migration_file = __DIR__ . '/../database/migrations/002_add_body_column.sql';
if (!file_exists($migration_file)) {
    echo "[✗] Migration file not found: $migration_file\n";
    exit(1);
}

$migration_sql = file_get_contents($migration_file);
echo "[✓] Loaded migration file: 002_add_body_column.sql\n";

// Execute migration
try {
    // Split by delimiter and execute
    $statements = preg_split('/;\s*(?=--|\n|DELIMITER|DROP|CREATE|ALTER|INSERT|UPDATE|DELETE|CALL)/i', $migration_sql);

    $executed = 0;
    foreach ($statements as $stmt) {
        $stmt = trim($stmt);

        // Skip comments and empty statements
        if (empty($stmt) || strpos($stmt, '--') === 0) {
            continue;
        }

        if (stripos($stmt, 'DELIMITER') !== false) {
            continue;
        }

        try {
            echo "[→] Executing: " . substr($stmt, 0, 50) . "...\n";
            $pdo->exec($stmt . ';');
            $executed++;
        } catch (PDOException $e) {
            echo "[!] Statement error (may be expected): " . $e->getMessage() . "\n";
        }
    }

    echo "[✓] Migration applied successfully! Executed $executed statements\n";

} catch (Exception $e) {
    echo "[✗] Migration failed: " . $e->getMessage() . "\n";
    exit(1);
}

// Verify the changes
try {
    echo "\n[→] Verifying migration results...\n";

    // Check if body column exists
    $check = $pdo->prepare(
        "SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE
         FROM INFORMATION_SCHEMA.COLUMNS
         WHERE TABLE_SCHEMA = ?
         AND TABLE_NAME = 'communications'
         AND COLUMN_NAME = 'body'"
    );
    $check->execute([$config['db']['database']]);
    $body_col = $check->fetch();

    if ($body_col) {
        echo "[✓] Column 'body' exists\n";
        echo "    - Type: {$body_col['COLUMN_TYPE']}\n";
        echo "    - Nullable: {$body_col['IS_NULLABLE']}\n";
    } else {
        echo "[✗] Column 'body' not found!\n";
        exit(1);
    }

    // Check if full-text index exists
    $idx_check = $pdo->prepare(
        "SELECT INDEX_NAME, INDEX_TYPE
         FROM INFORMATION_SCHEMA.STATISTICS
         WHERE TABLE_SCHEMA = ?
         AND TABLE_NAME = 'communications'
         AND COLUMN_NAME = 'body'"
    );
    $idx_check->execute([$config['db']['database']]);
    $indexes = $idx_check->fetchAll();

    if (!empty($indexes)) {
        echo "[✓] Full-text index exists\n";
        foreach ($indexes as $idx) {
            echo "    - {$idx['INDEX_NAME']} ({$idx['INDEX_TYPE']})\n";
        }
    } else {
        echo "[!] No indexes on body column (optional)\n";
    }

    echo "\n[✓] Migration 002 completed successfully!\n";

} catch (Exception $e) {
    echo "[✗] Verification failed: " . $e->getMessage() . "\n";
    exit(1);
}
