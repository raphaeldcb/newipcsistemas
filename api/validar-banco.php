<?php
/**
 * Validador de Banco de Dados SCPG — Script PHP Puro
 *
 * Uso: php validar-banco.php
 */

// Carrega Laravel
require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make('Illuminate\Contracts\Http\Kernel');

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

echo "\n╔════════════════════════════════════════════════════════╗\n";
echo "║  VALIDAÇÃO DE BANCO DE DADOS SCPG UNIFICADO            ║\n";
echo "╚════════════════════════════════════════════════════════╝\n\n";

// 1. Testar conexão
try {
    DB::connection()->getPdo();
    echo "✅ Conexão com banco: OK\n";
} catch (\Exception $e) {
    echo "❌ Erro de conexão: " . $e->getMessage() . "\n";
    exit(1);
}

// 2. Tabelas esperadas
$tabelas_esperadas = [
    'tb_ufs' => ['id', 'uf_sigla', 'uf_nome'],
    'tb_comarcas' => ['id', 'comarca_nome', 'uf_id'],
    'tb_varas' => ['id', 'vara_nome', 'comarca_id', 'vara_tipo'],
    'tb_juizes' => ['id', 'juiz_nome', 'vara_id'],
    'tb_pessoas' => ['id', 'nome', 'tipo', 'documento', 'email', 'telefone'],
    'tb_casos' => ['id', 'numero', 'pessoa_id', 'uf_id', 'vara_id', 'juiz_id', 'data_abertura', 'status'],
    'tb_kits' => ['id', 'kit_num', 'kit_status', 'kit_denv', 'kit_dret'],
    'tb_extracos' => ['id', 'caso_id', 'extracao_fase', 'resultado'],
    'tb_scei' => ['id', 'caso_id', 'exame_tipo', 'resultado', 'data_exame'],
    'tb_creditos' => ['id', 'caso_id', 'valor_base', 'fator_1', 'fator_2', 'fator_3', 'fator_4', 'fator_5'],
    'tb_alelos' => ['id', 'extracao_id', 'marcador', 'tipo_alelo', 'genótipo'],
    'comunicacoes' => ['id', 'email_from', 'email_to', 'subject', 'body', 'classification', 'confidence'],
    'users' => ['id', 'name', 'email', 'password', 'microsoft_id', 'role', 'is_active'],
];

echo "Verificando tabelas esperadas:\n";
echo "──────────────────────────────────────────────────────\n\n";

$tabelas_ok = 0;
$tabelas_faltando = [];
$campos_problemas = [];

foreach ($tabelas_esperadas as $tabela => $campos_esperados) {
    if (Schema::hasTable($tabela)) {
        $count = DB::table($tabela)->count();
        echo "✅ $tabela ($count registros)\n";

        // Verificar campos
        $campos_faltando = [];
        foreach ($campos_esperados as $campo) {
            if (!Schema::hasColumn($tabela, $campo)) {
                $campos_faltando[] = $campo;
            }
        }

        if (!empty($campos_faltando)) {
            echo "   ⚠️  Campos faltando: " . implode(", ", $campos_faltando) . "\n";
            $campos_problemas[$tabela] = $campos_faltando;
        }

        $tabelas_ok++;
    } else {
        echo "❌ $tabela (FALTANDO)\n";
        $tabelas_faltando[] = $tabela;
    }
}

// 3. Resumo
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
} elseif (!empty($campos_problemas)) {
    echo "\n⚠️  CAMPOS FALTANDO EM:\n";
    foreach ($campos_problemas as $tabela => $campos) {
        echo "   - $tabela: " . implode(", ", $campos) . "\n";
    }
    echo "\n📌 Solução: php artisan migrate\n";
    $status = "⚠️  PARCIAL";
} else {
    echo "\n✅ TODAS AS TABELAS E CAMPOS CRIADOS!\n";
    $status = "✅ COMPLETO";
}

// 4. Migrations executadas
echo "\n╔════════════════════════════════════════════════════════╗\n";
echo "║  MIGRATIONS EXECUTADAS                                 ║\n";
echo "╚════════════════════════════════════════════════════════╝\n\n";

$migrations = DB::table('migrations')->orderBy('batch')->get();
echo count($migrations) . " migrations no histórico:\n";
foreach ($migrations as $m) {
    echo "  [{$m->batch}] {$m->migration}\n";
}

// 5. Contagem de registros principais
echo "\n╔════════════════════════════════════════════════════════╗\n";
echo "║  CONTAGEM DE REGISTROS (DADOS)                         ║\n";
echo "╚════════════════════════════════════════════════════════╝\n\n";

$tabelas_dados = ['users', 'tb_pessoas', 'tb_casos', 'comunicacoes', 'tb_creditos'];
foreach ($tabelas_dados as $tabela) {
    if (Schema::hasTable($tabela)) {
        $count = DB::table($tabela)->count();
        echo "$tabela: " . str_pad($count, 3, " ", STR_PAD_LEFT) . " registros\n";
    }
}

// Status final
echo "\n╔════════════════════════════════════════════════════════╗\n";
echo "║  STATUS FINAL: $status                                           \n";
echo "╚════════════════════════════════════════════════════════╝\n\n";

exit(0);
