<?php

namespace App\Services;

use App\Models\Caso;
use App\Models\Comunicacao;
use App\Models\Extracao;
use App\Models\Alelo;
use App\Models\Scei;
use App\Enums\TipoRelatorio;
use Carbon\Carbon;
use TCPDF;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use Illuminate\Support\Facades\Storage;

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

    /**
     * Gerar relatório de Comunicações por classificação
     */
    public function gerarRelatorioComunicacoes(?\DateTime $dataInicio = null, ?\DateTime $dataFim = null): array
    {
        $query = Comunicacao::query();

        if ($dataInicio) {
            $query->where('received_at', '>=', $dataInicio);
        }

        if ($dataFim) {
            $query->where('received_at', '<=', $dataFim);
        }

        $comunicacoes = $query->get();
        $porClassificacao = $comunicacoes->groupBy('classification');
        $porConfidencia = $comunicacoes->where('confidence', '>=', 0.8)->count();

        return [
            'titulo' => 'Relatório de Comunicações',
            'data_geracao' => now()->format('d/m/Y H:i:s'),
            'periodo' => [
                'inicio' => $dataInicio?->format('d/m/Y') ?? 'N/A',
                'fim' => $dataFim?->format('d/m/Y') ?? 'N/A',
            ],
            'resumo' => [
                'total_comunicacoes' => $comunicacoes->count(),
                'por_classificacao' => $porClassificacao->map(fn($grupo) => [
                    'classificacao' => $grupo[0]->classification,
                    'quantidade' => $grupo->count(),
                    'percentual' => round(($grupo->count() / $comunicacoes->count()) * 100, 2),
                ])->values(),
                'alta_confianca' => $porConfidencia,
                'confianca_media' => round($comunicacoes->avg('confidence'), 4),
            ],
            'detalhes' => $comunicacoes->map(fn($c) => [
                'id' => $c->id,
                'caso_id' => $c->caso_id,
                'de' => $c->email_from,
                'para' => $c->email_to,
                'assunto' => $c->subject,
                'classificacao' => $c->classification,
                'confianca' => round($c->confidence, 4),
                'data_recebimento' => $c->received_at?->format('d/m/Y H:i'),
                'status_sync' => $c->sync_status,
            ])->values(),
        ];
    }

    /**
     * Gerar PDF de um relatório
     */
    public function gerarPDF(array $dados, string $nomeArquivo = 'relatorio.pdf'): string
    {
        $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_PAGE_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
        $pdf->SetCreator(PDF_CREATOR);
        $pdf->SetAuthor('Sistema IPC');
        $pdf->SetTitle($dados['titulo'] ?? 'Relatório');
        $pdf->SetSubject($dados['titulo'] ?? 'Relatório');

        $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
        $pdf->SetMargins(15, 15, 15);
        $pdf->SetAutoPageBreak(TRUE, 15);

        $pdf->AddPage();

        // Cabeçalho
        $pdf->SetFont('helvetica', 'B', 16);
        $pdf->Cell(0, 10, $dados['titulo'] ?? 'Relatório', 0, 1, 'C');

        $pdf->SetFont('helvetica', '', 10);
        $pdf->Cell(0, 5, 'Gerado em: ' . ($dados['data_geracao'] ?? now()->format('d/m/Y H:i:s')), 0, 1, 'R');
        $pdf->Ln(5);

        // Conteúdo
        $pdf->SetFont('helvetica', '', 10);

        if (isset($dados['resumo'])) {
            $pdf->SetFont('helvetica', 'B', 12);
            $pdf->Cell(0, 8, 'Resumo', 0, 1);
            $pdf->SetFont('helvetica', '', 10);

            foreach ($dados['resumo'] as $chave => $valor) {
                if (is_array($valor)) {
                    $pdf->Cell(0, 6, $chave . ':', 0, 1);
                    foreach ($valor as $item) {
                        if (is_array($item)) {
                            $desc = implode(' | ', array_values($item));
                            $pdf->Cell(0, 5, '  • ' . $desc, 0, 1);
                        } else {
                            $pdf->Cell(0, 5, '  • ' . $item, 0, 1);
                        }
                    }
                } else {
                    $pdf->Cell(0, 6, ucfirst(str_replace('_', ' ', $chave)) . ': ' . $valor, 0, 1);
                }
            }
        }

        // Salvar arquivo
        $caminhoArquivo = storage_path('app/relatorios/' . $nomeArquivo);
        if (!is_dir(dirname($caminhoArquivo))) {
            mkdir(dirname($caminhoArquivo), 0755, true);
        }

        $pdf->Output($caminhoArquivo, 'F');
        return $caminhoArquivo;
    }

    /**
     * Gerar Excel de um relatório
     */
    public function gerarExcel(array $dados, string $nomeArquivo = 'relatorio.xlsx'): string
    {
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Título
        $sheet->setCellValue('A1', $dados['titulo'] ?? 'Relatório');
        $sheet->getStyle('A1')->getFont()->setBold(true)->setSize(14);

        // Data de geração
        $sheet->setCellValue('A2', 'Gerado em: ' . ($dados['data_geracao'] ?? now()->format('d/m/Y H:i:s')));

        $linha = 4;

        // Resumo
        if (isset($dados['resumo'])) {
            $sheet->setCellValue('A' . $linha, 'Resumo');
            $sheet->getStyle('A' . $linha)->getFont()->setBold(true);
            $linha++;

            foreach ($dados['resumo'] as $chave => $valor) {
                if (is_array($valor)) {
                    $sheet->setCellValue('A' . $linha, ucfirst(str_replace('_', ' ', $chave)));
                    $sheet->getStyle('A' . $linha)->getFont()->setBold(true);
                    $linha++;

                    foreach ($valor as $item) {
                        if (is_array($item)) {
                            $col = 'A';
                            foreach ($item as $k => $v) {
                                $sheet->setCellValue($col . $linha, $v);
                                $col++;
                            }
                        } else {
                            $sheet->setCellValue('A' . $linha, $item);
                        }
                        $linha++;
                    }
                } else {
                    $sheet->setCellValue('A' . $linha, ucfirst(str_replace('_', ' ', $chave)));
                    $sheet->setCellValue('B' . $linha, $valor);
                    $linha++;
                }
            }
        }

        // Detalhes (se houver)
        if (isset($dados['detalhes']) && is_array($dados['detalhes'])) {
            $linha += 2;
            $sheet->setCellValue('A' . $linha, 'Detalhes');
            $sheet->getStyle('A' . $linha)->getFont()->setBold(true);
            $linha++;

            // Cabeçalhos
            if (!empty($dados['detalhes'])) {
                $headers = array_keys($dados['detalhes'][0]);
                $col = 'A';
                foreach ($headers as $header) {
                    $sheet->setCellValue($col . $linha, ucfirst(str_replace('_', ' ', $header)));
                    $sheet->getStyle($col . $linha)->getFont()->setBold(true);
                    $col++;
                }
                $linha++;

                // Dados
                foreach ($dados['detalhes'] as $item) {
                    $col = 'A';
                    foreach ($item as $valor) {
                        $sheet->setCellValue($col . $linha, $valor);
                        $col++;
                    }
                    $linha++;
                }
            }
        }

        // Auto-ajustar colunas
        foreach ($sheet->getColumnIterator() as $column) {
            $sheet->getColumnDimension($column->getColumnIndex())->setAutoSize(true);
        }

        // Salvar arquivo
        $caminhoArquivo = storage_path('app/relatorios/' . $nomeArquivo);
        if (!is_dir(dirname($caminhoArquivo))) {
            mkdir(dirname($caminhoArquivo), 0755, true);
        }

        $writer = new Xlsx($spreadsheet);
        $writer->save($caminhoArquivo);

        return $caminhoArquivo;
    }
}
