<?php

namespace App\Services;

use App\Models\Caso;
use App\Models\Extracao;
use App\Models\Alelo;
use App\Models\Scei;
use App\Enums\TipoRelatorio;
use Carbon\Carbon;

class RelatorioService
{
    public function gerarRelatorioCasoCompleto(int $casoId): array
    {
        $caso = Caso::with(['historicos', 'creditos', 'extracos', 'sceis'])->findOrFail($casoId);

        return [
            'titulo' => 'Relatório Completo do Caso',
            'numero_processo' => $caso->pro_numero,
            'data_geracao' => now()->format('d/m/Y H:i:s'),
            'caso' => [
                'id' => $caso->cas_contr,
                'processo' => $caso->pro_numero,
                'status' => $caso->casStatus?->label(),
                'juiz' => $caso->juiz?->jui_nome,
                'vara' => $caso->vara?->descricao,
                'comarca' => $caso->comarca?->com_nome,
                'data_ajuizamento' => $caso->data_ajuizamento?->format('d/m/Y'),
            ],
            'extracos' => $caso->extracos->map(fn($e) => [
                'id' => $e->ext_cod,
                'amostra' => $e->amostra_tipo,
                'fase' => $e->extracaoFase?->label(),
                'concentracao' => $e->concentracao_dna,
                'qualidade' => $e->qualidade_dna,
            ]),
            'sceis' => $caso->sceis->map(fn($s) => [
                'id' => $s->scei_cod,
                'exame' => $s->tipo_exame,
                'resultado' => $s->resultado_valor,
                'fase' => $s->sceiFase?->label(),
            ]),
            'creditos' => $caso->creditos->map(fn($c) => [
                'id' => $c->id_credito,
                'valor' => $c->cre_vlr,
                'pago' => $c->cre_vlr_pago,
                'status' => $c->cre_status,
            ]),
            'historico' => $caso->historicos->map(fn($h) => [
                'status_anterior' => $h->his_status_anterior,
                'status_novo' => $h->his_status_novo,
                'data' => $h->his_data?->format('d/m/Y H:i'),
                'usuario' => $h->his_usuario,
            ]),
        ];
    }

    public function gerarRelatorioExtracao(int $extracaoId): array
    {
        $extracao = Extracao::with(['alelos'])->findOrFail($extracaoId);

        return [
            'titulo' => 'Resultado de Extração de DNA',
            'numero_extracao' => $extracaoId,
            'data_geracao' => now()->format('d/m/Y H:i:s'),
            'extracao' => [
                'id' => $extracao->ext_cod,
                'caso_id' => $extracao->caso_id,
                'amostra' => $extracao->amostra_tipo,
                'volume' => $extracao->volume_inicial . ' ' . $extracao->unidade_volume,
                'data_coleta' => $extracao->data_coleta?->format('d/m/Y'),
                'fase' => $extracao->extracaoFase?->label(),
            ],
            'resultados' => [
                'concentracao_dna' => $extracao->concentracao_dna,
                'qualidade_dna' => $extracao->qualidade_dna,
                'data_extracao' => $extracao->data_extracao?->format('d/m/Y H:i'),
            ],
            'alelos' => $extracao->alelos->map(fn($a) => [
                'tipo' => $a->tipo_alelo,
                'marcador' => $a->marcador,
                'alelo1' => $a->alelo1,
                'alelo2' => $a->alelo2,
                'genótipo' => $a->alelo1 . ($a->alelo2 ? '/' . $a->alelo2 : ''),
                'frequencia1' => $a->frequencia_alelo1,
                'frequencia2' => $a->frequencia_alelo2,
            ]),
        ];
    }

    public function gerarRelatorioComparacao(int $ext1, int $ext2): array
    {
        $service = new AleloService(app('App\Repositories\AleloRepository'));
        $comparacao = $service->compararAlelos($ext1, $ext2);

        return [
            'titulo' => 'Comparação de Alelos',
            'data_geracao' => now()->format('d/m/Y H:i:s'),
            'extracao_1' => [
                'id' => $ext1,
            ],
            'extracao_2' => [
                'id' => $ext2,
            ],
            'resultado' => $comparacao,
            'conclusao' => match(true) {
                $comparacao['percentual_match'] === 100.0 => 'Match 100% - Mesma pessoa',
                $comparacao['percentual_match'] >= 90.0 => 'Match muito provável (>90%)',
                $comparacao['percentual_match'] >= 70.0 => 'Match possível (70-90%)',
                default => 'Match improvável (<70%)',
            },
        ];
    }

    public function gerarRelatorioCreditosFaturamento(int $casoId): array
    {
        $caso = Caso::with('creditos.parcelas')->findOrFail($casoId);
        $creditos = $caso->creditos;

        return [
            'titulo' => 'Faturamento de Créditos',
            'numero_processo' => $caso->pro_numero,
            'data_geracao' => now()->format('d/m/Y H:i:s'),
            'resumo' => [
                'total_creditos' => $creditos->count(),
                'valor_total' => $creditos->sum('cre_vlr'),
                'valor_pago' => $creditos->sum('cre_vlr_pago'),
                'saldo' => $creditos->sum('cre_vlr') - $creditos->sum('cre_vlr_pago'),
            ],
            'creditos' => $creditos->map(fn($c) => [
                'id' => $c->id_credito,
                'valor' => $c->cre_vlr,
                'pago' => $c->cre_vlr_pago,
                'saldo' => $c->cre_vlr - $c->cre_vlr_pago,
                'percentual' => $c->cre_vlr > 0 ? round(($c->cre_vlr_pago / $c->cre_vlr) * 100, 2) : 0,
                'status' => $c->cre_status,
                'data_geracao' => $c->data_geracao?->format('d/m/Y'),
                'parcelas' => $c->parcelas->map(fn($p) => [
                    'numero' => $p->par_nparc,
                    'valor' => $p->par_vlr,
                    'vencimento' => $p->par_data_vencimento?->format('d/m/Y'),
                    'status' => $p->par_status,
                ]),
            ]),
        ];
    }

    public function gerarRelatorioKits(): array
    {
        $kits = \App\Models\Kit::selectRaw('kit_status, COUNT(*) as quantidade')
            ->groupBy('kit_status')
            ->get();

        return [
            'titulo' => 'Resumo de Kits',
            'data_geracao' => now()->format('d/m/Y H:i:s'),
            'total_kits' => \App\Models\Kit::count(),
            'por_status' => $kits->map(fn($k) => [
                'status' => \App\Enums\KitStatus::from($k->kit_status)->label(),
                'quantidade' => $k->quantidade,
                'percentual' => round(($k->quantidade / \App\Models\Kit::count()) * 100, 2),
            ]),
        ];
    }

    public function gerarRelatorioAuditoria(int $casoId): array
    {
        $caso = Caso::with('historicos')->findOrFail($casoId);

        return [
            'titulo' => 'Auditoria de Caso',
            'numero_processo' => $caso->pro_numero,
            'data_geracao' => now()->format('d/m/Y H:i:s'),
            'historico' => $caso->historicos->map(fn($h) => [
                'id' => $h->his_contr,
                'status_anterior' => $h->his_status_anterior,
                'status_novo' => $h->his_status_novo,
                'motivo' => $h->his_motivo,
                'usuario' => $h->his_usuario,
                'data_hora' => $h->his_data?->format('d/m/Y H:i:s'),
            ])->sortByDesc('data_hora')->values(),
            'total_transicoes' => $caso->historicos->count(),
        ];
    }
}
