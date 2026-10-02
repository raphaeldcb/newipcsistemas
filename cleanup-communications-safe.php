<?php
/**
 * Safe Cleanup - Delete all communications
 * Clears: communications, email_responses, processing_logs
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

    echo "🗑️  LIMPEZA DE COMUNICAÇÕES\n";
    echo "═════════════════════════════════════\n\n";

    // Count antes
    $count_before = $pdo->query("SELECT COUNT(*) as count FROM communications")->fetch();
    echo "📊 Antes da limpeza:\n";
    echo "   - Communications: " . $count_before['count'] . "\n\n";

    // Disable foreign keys
    $pdo->exec("SET FOREIGN_KEY_CHECKS=0");
    echo "🔓 Foreign keys desabilitadas\n";

    // Delete communications
    $deleted = $pdo->exec("DELETE FROM communications");
    echo "✅ Deletadas " . $deleted . " comunicações\n";

    // Delete email responses
    $deleted = $pdo->exec("DELETE FROM email_responses");
    echo "✅ Deletadas " . $deleted . " respostas agendadas\n";

    // Delete processing logs (se existir)
    try {
        $deleted = $pdo->exec("DELETE FROM processing_logs");
        echo "✅ Deletados " . $deleted . " logs de processamento\n";
    } catch (Exception $e) {
        echo "ℹ️  Tabela processing_logs não existe (OK)\n";
    }

    // Re-enable foreign keys
    $pdo->exec("SET FOREIGN_KEY_CHECKS=1");
    echo "\n🔒 Foreign keys habilitadas\n";

    // Count depois
    $count_after = $pdo->query("SELECT COUNT(*) as count FROM communications")->fetch();
    echo "\n📊 Depois da limpeza:\n";
    echo "   - Communications: " . $count_after['count'] . "\n";

    echo "\n✅ LIMPEZA CONCLUÍDA COM SUCESSO!\n";
    echo "═════════════════════════════════════\n";
    echo "Sistema pronto para sincronizar novos e-mails.\n";

} catch (PDOException $e) {
    echo "❌ Erro: " . $e->getMessage() . "\n";
    exit(1);
}
?>
