<?php
/**
 * Fix: Registra todas as migrations como executadas
 * Usa quando o banco já existe mas as migrations não foram registradas
 *
 * Uso: php fix-migrations.php
 */

require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(\Illuminate\Contracts\Http\Kernel::class);

use Illuminate\Support\Facades\DB;

echo "\n╔════════════════════════════════════════════════════════╗\n";
echo "║  FIX: Registrar migrations como executadas             ║\n";
echo "╚════════════════════════════════════════════════════════╝\n\n";

// Migrations do Laravel (padrão)
$laravel_migrations = [
    '0001_01_01_000000_create_users_table',
    '0001_01_01_000001_create_cache_table',
    '0001_01_01_000002_create_jobs_table',
    '2026_10_06_134702_create_personal_access_tokens_table',
];

// Migrations do projeto
$project_migrations = [
    '2026_10_06_134714_create_tb_uf_table',
    '2026_10_06_134715_create_tb_comarca_table',
    '2026_10_06_134716_create_tb_vara_table',
    '2026_10_06_134717_create_tb_juiz_table',
    '2026_10_06_134801_create_tb_pessoa_table',
    '2026_10_06_134802_create_tb_caso_table',
    '2026_10_06_134803_create_tb_kit_table',
    '2026_10_06_134804_create_tb_extraco_table',
    '2026_10_06_134805_create_tb_scei_table',
    '2026_10_06_134806_create_tb_credito_table',
    '2026_10_06_134807_create_tb_alelo_table',
    '2026_10_06_134900_create_comunicacoes_table',
];

$all_migrations = array_merge($laravel_migrations, $project_migrations);

// Verificar qual batch usar
$last_batch = DB::table('migrations')->max('batch') ?? 0;
$next_batch = $last_batch + 1;

echo "Registrando " . count($all_migrations) . " migrations como executadas...\n";
echo "Batch: $next_batch\n\n";

$inserted = 0;
$skipped = 0;

foreach ($all_migrations as $migration) {
    // Verificar se já existe
    $exists = DB::table('migrations')
        ->where('migration', $migration)
        ->exists();

    if ($exists) {
        echo "⏭️  $migration (já registrada)\n";
        $skipped++;
    } else {
        DB::table('migrations')->insert([
            'migration' => $migration,
            'batch' => $next_batch,
        ]);
        echo "✅ $migration\n";
        $inserted++;
    }
}

echo "\n╔════════════════════════════════════════════════════════╗\n";
echo "║  RESULTADO                                             ║\n";
echo "╚════════════════════════════════════════════════════════╝\n\n";
echo "✅ Registradas: $inserted\n";
echo "⏭️  Já existentes: $skipped\n";
echo "📊 Total: " . count($all_migrations) . "\n\n";

echo "Próximo passo:\n";
echo "  php validar-banco-simples.php\n\n";

exit(0);
