<?php
/**
 * Script de Validação de Banco de Dados
 * Valida se todas as tabelas e campos foram criados corretamente
 *
 * Uso: php artisan tinker < scripts/validar-banco.php
 * Ou: php -r "include 'scripts/validar-banco.php';"
 */

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

echo "\n=== VALIDAÇÃO DE BANCO DE DADOS ===\n\n";

// 1. Verificar conexão
try {
    DB::connection()->getPdo();
    echo "✅ Conexão com banco: OK\n";
} catch (\Exception $e) {
    echo "❌ Erro de conexão: " . $e->getMessage() . "\n";
    exit(1);
}

// 2. Tabelas esperadas (baseado no schema SCPG)
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
$tabelas_ok = 0;
$tabelas_faltando = [];

foreach ($tabelas_esperadas as $tabela => $campos_esperados) {
    if (Schema::hasTable($tabela)) {
        echo "✅ $tabela\n";

        // Verificar campos
        $campos_faltando = [];
        foreach ($campos_esperados as $campo) {
            if (!Schema::hasColumn($tabela, $campo)) {
                $campos_faltando[] = $campo;
            }
        }

        if (!empty($campos_faltando)) {
            echo "   ⚠️  Campos faltando: " . implode(", ", $campos_faltando) . "\n";
        }
        $tabelas_ok++;
    } else {
        echo "❌ $tabela (FALTANDO)\n";
        $tabelas_faltando[] = $tabela;
    }
}

echo "\n=== RESUMO ===\n";
echo "Tabelas OK: $tabelas_ok / " . count($tabelas_esperadas) . "\n";

if (!empty($tabelas_faltando)) {
    echo "❌ Tabelas faltando: " . implode(", ", $tabelas_faltando) . "\n";
    echo "\nExecute: php artisan migrate\n";
} else {
    echo "✅ Todas as tabelas criadas!\n";
}

// 3. Verificar migrations executadas
echo "\n=== MIGRATIONS EXECUTADAS ===\n";
$migrations = DB::table('migrations')->orderBy('batch')->get();
echo count($migrations) . " migrations executadas:\n";
foreach ($migrations as $m) {
    echo "  - {$m->migration} (batch {$m->batch})\n";
}

// 4. Estatísticas de dados
echo "\n=== CONTAGEM DE REGISTROS ===\n";
$tabelas_dados = ['users', 'tb_pessoas', 'tb_casos', 'comunicacoes', 'tb_creditos'];
foreach ($tabelas_dados as $tabela) {
    if (Schema::hasTable($tabela)) {
        $count = DB::table($tabela)->count();
        echo "$tabela: $count registros\n";
    }
}

echo "\n✅ Validação concluída!\n\n";
