<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class ValidarBanco extends Command
{
    protected $signature = 'db:validar {--detalhado : Mostrar campos de cada tabela}';
    protected $description = 'Valida se todas as tabelas e campos do banco foram criados corretamente';

    public function handle()
    {
        $this->info('=== VALIDAÇÃO DE BANCO DE DADOS ===');
        $this->newLine();

        // 1. Conexão
        try {
            DB::connection()->getPdo();
            $this->line('✅ Conexão com banco: OK');
        } catch (\Exception $e) {
            $this->error('❌ Erro de conexão: ' . $e->getMessage());
            return 1;
        }

        // 2. Tabelas esperadas
        $tabelas = [
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

        $this->line('Verificando tabelas:');
        $this->newLine();

        $tabelas_ok = 0;
        $tabelas_faltando = [];
        $campos_faltando_list = [];

        foreach ($tabelas as $tabela => $campos_esperados) {
            if (Schema::hasTable($tabela)) {
                $count = DB::table($tabela)->count();
                $this->line("✅ $tabela ($count registros)");

                if ($this->option('detalhado')) {
                    $campos_faltando = [];
                    foreach ($campos_esperados as $campo) {
                        if (!Schema::hasColumn($tabela, $campo)) {
                            $campos_faltando[] = $campo;
                        }
                    }

                    if (!empty($campos_faltando)) {
                        $this->line("   ⚠️  Campos faltando: " . implode(", ", $campos_faltando));
                        $campos_faltando_list[$tabela] = $campos_faltando;
                    }
                }

                $tabelas_ok++;
            } else {
                $this->error("❌ $tabela (FALTANDO)");
                $tabelas_faltando[] = $tabela;
            }
        }

        $this->newLine();
        $this->info('=== RESUMO ===');
        $this->line("Tabelas OK: $tabelas_ok / " . count($tabelas));

        if (!empty($tabelas_faltando)) {
            $this->error("❌ Tabelas faltando: " . implode(", ", $tabelas_faltando));
            $this->line("Solução: php artisan migrate");
            return 1;
        } else {
            $this->line("✅ Todas as tabelas criadas!");
        }

        if (!empty($campos_faltando_list) && $this->option('detalhado')) {
            $this->newLine();
            $this->error('⚠️  Campos faltando em algumas tabelas:');
            foreach ($campos_faltando_list as $tabela => $campos) {
                $this->line("  $tabela: " . implode(", ", $campos));
            }
        }

        $this->newLine();
        $this->info('✅ Validação concluída!');
        return 0;
    }
}
