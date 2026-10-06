<?php

namespace App\Http\Controllers\Api;

use App\Models\Caso;
use App\Models\Extracao;
use App\Services\RelatorioService;
use App\Enums\TipoRelatorio;
use Illuminate\Http\Request;

class RelatoriosController
{
    public function __construct(
        private RelatorioService $relatorioService
    ) {
    }

    public function casosCompletosPDF(Request $request)
    {
        $request->validate(['caso_id' => 'required|integer|exists:tb_casos,cas_contr']);

        try {
            $dados = $this->relatorioService->gerarRelatorioCasoCompleto(
                $request->input('caso_id')
            );

            // TODO: Implementar geração de PDF (TCPDF)
            return response()->json([
                'message' => 'PDF gerado com sucesso',
                'tipo' => TipoRelatorio::CASO_COMPLETO->label(),
                'formato' => 'application/pdf',
                'dados_preview' => $dados,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Erro ao gerar relatório',
                'error' => $e->getMessage(),
            ], 422);
        }
    }

    public function extracao(Request $request)
    {
        $request->validate(['extracao_id' => 'required|integer|exists:tb_extracao,ext_cod']);

        try {
            $dados = $this->relatorioService->gerarRelatorioExtracao(
                $request->input('extracao_id')
            );

            return response()->json([
                'message' => 'Relatório gerado com sucesso',
                'tipo' => TipoRelatorio::EXTRACAO_RESULTADO->label(),
                'formato' => 'excel',
                'data' => $dados,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Erro ao gerar relatório',
                'error' => $e->getMessage(),
            ], 422);
        }
    }

    public function comparacaoAlelos(Request $request)
    {
        $request->validate([
            'extracao_1' => 'required|integer|exists:tb_extracao,ext_cod',
            'extracao_2' => 'required|integer|exists:tb_extracao,ext_cod',
        ]);

        try {
            $dados = $this->relatorioService->gerarRelatorioComparacao(
                $request->input('extracao_1'),
                $request->input('extracao_2')
            );

            return response()->json([
                'message' => 'Comparação gerada com sucesso',
                'tipo' => TipoRelatorio::ALELOS_COMPARACAO->label(),
                'data' => $dados,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Erro ao comparar alelos',
                'error' => $e->getMessage(),
            ], 422);
        }
    }

    public function creditosFaturamento(Request $request)
    {
        $request->validate(['caso_id' => 'required|integer|exists:tb_casos,cas_contr']);

        try {
            $dados = $this->relatorioService->gerarRelatorioCreditosFaturamento(
                $request->input('caso_id')
            );

            return response()->json([
                'message' => 'Faturamento gerado com sucesso',
                'tipo' => TipoRelatorio::CREDITOS_FATURAMENTO->label(),
                'formato' => 'excel',
                'data' => $dados,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Erro ao gerar faturamento',
                'error' => $e->getMessage(),
            ], 422);
        }
    }

    public function kits()
    {
        try {
            $dados = $this->relatorioService->gerarRelatorioKits();

            return response()->json([
                'message' => 'Resumo de kits gerado com sucesso',
                'tipo' => TipoRelatorio::RESUMO_KITS->label(),
                'formato' => 'excel',
                'data' => $dados,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Erro ao gerar resumo',
                'error' => $e->getMessage(),
            ], 422);
        }
    }

    public function auditoria(Request $request)
    {
        $request->validate(['caso_id' => 'required|integer|exists:tb_casos,cas_contr']);

        try {
            $dados = $this->relatorioService->gerarRelatorioAuditoria(
                $request->input('caso_id')
            );

            return response()->json([
                'message' => 'Auditoria gerada com sucesso',
                'tipo' => TipoRelatorio::AUDITORIA_CASOS->label(),
                'formato' => 'excel',
                'data' => $dados,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Erro ao gerar auditoria',
                'error' => $e->getMessage(),
            ], 422);
        }
    }

    public function listarTipos()
    {
        $tipos = array_map(fn($t) => [
            'id' => $t->value,
            'nome' => $t->label(),
            'formato' => $t->formato(),
        ], TipoRelatorio::cases());

        return response()->json([
            'total_tipos' => count($tipos),
            'tipos' => $tipos,
        ]);
    }
}
