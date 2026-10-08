<?php
/**
 * Validador de Banco de Dados — Versão Simples (PDO Direto)
 * Uso: php validar-banco-simples.php
 */

// Ler .env
$env_file = __DIR__ . '/.env';
$env = [];
if (file_exists($env_file)) {
    foreach (file($env_file) as $line) {
        $line = trim($line);
        if (!empty($line) && strpos($line, '=') !== false && $line[0] !== '#') {
            [$key, $value] = explode('=', $line, 2);
            $env[trim($key)] = trim($value, '\'"');
        }
    }
}

echo "\n╔════════════════════════════════════════════════════════╗\n";
echo "║  VALIDAÇÃO DE BANCO DE DADOS SCPG UNIFICADO            ║\n";
echo "╚════════════════════════════════════════════════════════╝\n\n";

// Conectar
try {
    $dsn = sprintf(
        'mysql:host=%s;dbname=%s;charset=utf8mb4',
        $env['DB_HOST'] ?? 'localhost',
        $env['DB_DATABASE'] ?? 'sgbd_scpg'
    );

    $pdo = new PDO(
        $dsn,
        $env['DB_USERNAME'] ?? 'root',
        $env['DB_PASSWORD'] ?? ''
    );
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    echo "✅ Conexão com banco: OK\n";
    echo "   Host: " . ($env['DB_HOST'] ?? 'localhost') . "\n";
    echo "   DB: " . ($env['DB_DATABASE'] ?? 'sgbd_scpg') . "\n\n";
} catch (PDOException $e) {
    echo "❌ Erro de conexão: " . $e->getMessage() . "\n";
    echo "   Verifique o .env:\n";
    echo "   - DB_HOST\n";
    echo "   - DB_DATABASE\n";
    echo "   - DB_USERNAME\n";
    echo "   - DB_PASSWORD\n";
    exit(1);
}

// Tabelas esperadas
$tabelas_esperadas = [
    'tb_ufs',
    'tb_comarcas',
    'tb_varas',
    'tb_juizes',
    'tb_pessoas',
    'tb_casos',
    'tb_kits',
    'tb_extracos',
    'tb_scei',
    'tb_creditos',
    'tb_alelos',
    'comunicacoes',
    'users',
];

echo "Verificando tabelas esperadas:\n";
echo "──────────────────────────────────────────────────────\n\n";

$tabelas_ok = 0;
$tabelas_faltando = [];

foreach ($tabelas_esperadas as $tabela) {
    try {
        $result = $pdo->query("SELECT COUNT(*) as cnt FROM `$tabela`");
        $row = $result->fetch(PDO::FETCH_ASSOC);
        $count = $row['cnt'] ?? 0;
        echo "✅ $tabela ($count registros)\n";
        $tabelas_ok++;
    } catch (PDOException $e) {
        echo "❌ $tabela (FALTANDO)\n";
        $tabelas_faltando[] = $tabela;
    }
}

// Resumo
echo "\n╔════════════════════════════════════════════════════════╗\n";
echo "║  RESUMO DA VALIDAÇÃO                                   ║\n";
echo "╚════════════════════════════════════════════════════════╝\n\n";

echo "Tabelas OK: $tabelas_ok / " . count($tabelas_esperadas) . "\n";

if (!empty($tabelas_faltando)) {
    echo "\n❌ TABELAS FALTANDO:\n";
    foreach ($tabelas_faltando as $tabela) {
        echo "   - $tabela\n";
    }
    echo "\n📌 Solução: php artisan migrate\n";
    $status = "⚠️  INCOMPLETO";
} else {
    echo "\n✅ TODAS AS TABELAS CRIADAS!\n";
    $status = "✅ COMPLETO";
}

// Migrations
echo "\n╔════════════════════════════════════════════════════════╗\n";
echo "║  MIGRATIONS EXECUTADAS                                 ║\n";
echo "╚════════════════════════════════════════════════════════╝\n\n";

try {
    $result = $pdo->query("SELECT * FROM migrations ORDER BY batch ASC");
    $migrations = $result->fetchAll(PDO::FETCH_ASSOC);
    echo count($migrations) . " migrations no histórico:\n";
    foreach ($migrations as $m) {
        echo "  [{$m['batch']}] {$m['migration']}\n";
    }
} catch (PDOException $e) {
    echo "⚠️  Tabela migrations não encontrada\n";
}

// Resumo final
echo "\n╔════════════════════════════════════════════════════════╗\n";
echo "║  STATUS FINAL: $status" . str_repeat(" ", 54 - strlen($status)) . "║\n";
echo "╚════════════════════════════════════════════════════════╝\n\n";

exit(0);
