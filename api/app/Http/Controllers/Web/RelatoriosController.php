<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Services\RelatorioService;
use App\Models\Caso;
use App\Models\Comunicacao;
use Illuminate\Http\Request;

class RelatoriosController extends Controller
{

    /**
     * Exibir página de índice de relatórios
     */
    public function index()
    {
        $totalCasos = Caso::count();
        $totalComunicacoes = Comunicacao::count();

        return view('relatorios.index', compact(
            'totalCasos',
            'totalComunicacoes'
        ));
    }

    /**
     * Exibir página de relatório de comunicações
     */
    public function comunicacoes(Request $request)
    {
        $dataInicio = $request->query('data_inicio') ?
            \Carbon\Carbon::createFromFormat('Y-m-d', $request->query('data_inicio'))->startOfDay() :
            null;

        $dataFim = $request->query('data_fim') ?
            \Carbon\Carbon::createFromFormat('Y-m-d', $request->query('data_fim'))->endOfDay() :
            null;

        $dados = $this->relatorioService->gerarRelatorioComunicacoes($dataInicio, $dataFim);

        return view('relatorios.comunicacoes', compact('dados', 'dataInicio', 'dataFim'));
    }

    /**
     * Exportar relatório de comunicações em PDF
     */
    public function comunicacoesPDF(Request $request)
    {
        $dataInicio = $request->query('data_inicio') ?
            \Carbon\Carbon::createFromFormat('Y-m-d', $request->query('data_inicio'))->startOfDay() :
            null;

        $dataFim = $request->query('data_fim') ?
            \Carbon\Carbon::createFromFormat('Y-m-d', $request->query('data_fim'))->endOfDay() :
            null;

        $dados = $this->relatorioService->gerarRelatorioComunicacoes($dataInicio, $dataFim);
        $nomeArquivo = 'comunicacoes_' . now()->format('YmdHis') . '.pdf';

        $caminhoArquivo = $this->relatorioService->gerarPDF($dados, $nomeArquivo);

        return response()->download($caminhoArquivo, $nomeArquivo, [
            'Content-Type' => 'application/pdf',
        ])->deleteFileAfterSend(true);
    }

    /**
     * Exportar relatório de comunicações em Excel
     */
    public function comunicacoesExcel(Request $request)
    {
        $dataInicio = $request->query('data_inicio') ?
            \Carbon\Carbon::createFromFormat('Y-m-d', $request->query('data_inicio'))->startOfDay() :
            null;

        $dataFim = $request->query('data_fim') ?
            \Carbon\Carbon::createFromFormat('Y-m-d', $request->query('data_fim'))->endOfDay() :
            null;

        $dados = $this->relatorioService->gerarRelatorioComunicacoes($dataInicio, $dataFim);
        $nomeArquivo = 'comunicacoes_' . now()->format('YmdHis') . '.xlsx';

        $caminhoArquivo = $this->relatorioService->gerarExcel($dados, $nomeArquivo);

        return response()->download($caminhoArquivo, $nomeArquivo, [
            'Content-Type' => 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        ])->deleteFileAfterSend(true);
    }

    /**
     * Exibir e exportar relatório de caso completo em PDF
     */
    public function casoPDF(Request $request)
    {
        $request->validate(['caso_id' => 'required|integer|exists:tb_casos,cas_contr']);

        try {
            $dados = $this->relatorioService->gerarRelatorioCasoCompleto($request->input('caso_id'));
            $nomeArquivo = 'caso_' . $request->input('caso_id') . '_' . now()->format('YmdHis') . '.pdf';

            $caminhoArquivo = $this->relatorioService->gerarPDF($dados, $nomeArquivo);

            return response()->download($caminhoArquivo, $nomeArquivo, [
                'Content-Type' => 'application/pdf',
            ])->deleteFileAfterSend(true);
        } catch (\Exception $e) {
            return redirect()->back()->withErrors(['error' => 'Erro ao gerar relatório: ' . $e->getMessage()]);
        }
    }

    /**
     * Exibir e exportar relatório de caso completo em Excel
     */
    public function casoExcel(Request $request)
    {
        $request->validate(['caso_id' => 'required|integer|exists:tb_casos,cas_contr']);

        try {
            $dados = $this->relatorioService->gerarRelatorioCasoCompleto($request->input('caso_id'));
            $nomeArquivo = 'caso_' . $request->input('caso_id') . '_' . now()->format('YmdHis') . '.xlsx';

            $caminhoArquivo = $this->relatorioService->gerarExcel($dados, $nomeArquivo);

            return response()->download($caminhoArquivo, $nomeArquivo, [
                'Content-Type' => 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            ])->deleteFileAfterSend(true);
        } catch (\Exception $e) {
            return redirect()->back()->withErrors(['error' => 'Erro ao gerar relatório: ' . $e->getMessage()]);
        }
    }

    /**
     * Exibir e exportar relatório de extrações em PDF
     */
    public function extracaoPDF(Request $request)
    {
        $request->validate(['extracao_id' => 'required|integer|exists:tb_extracao,ext_cod']);

        try {
            $dados = $this->relatorioService->gerarRelatorioExtracao($request->input('extracao_id'));
            $nomeArquivo = 'extracao_' . $request->input('extracao_id') . '_' . now()->format('YmdHis') . '.pdf';

            $caminhoArquivo = $this->relatorioService->gerarPDF($dados, $nomeArquivo);

            return response()->download($caminhoArquivo, $nomeArquivo, [
                'Content-Type' => 'application/pdf',
            ])->deleteFileAfterSend(true);
        } catch (\Exception $e) {
            return redirect()->back()->withErrors(['error' => 'Erro ao gerar relatório: ' . $e->getMessage()]);
        }
    }

    /**
     * Exibir e exportar relatório de extrações em Excel
     */
    public function extracaoExcel(Request $request)
    {
        $request->validate(['extracao_id' => 'required|integer|exists:tb_extracao,ext_cod']);

        try {
            $dados = $this->relatorioService->gerarRelatorioExtracao($request->input('extracao_id'));
            $nomeArquivo = 'extracao_' . $request->input('extracao_id') . '_' . now()->format('YmdHis') . '.xlsx';

            $caminhoArquivo = $this->relatorioService->gerarExcel($dados, $nomeArquivo);

            return response()->download($caminhoArquivo, $nomeArquivo, [
                'Content-Type' => 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            ])->deleteFileAfterSend(true);
        } catch (\Exception $e) {
            return redirect()->back()->withErrors(['error' => 'Erro ao gerar relatório: ' . $e->getMessage()]);
        }
    }

    /**
     * Exibir e exportar relatório de créditos em Excel
     */
    public function creditosExcel(Request $request)
    {
        $request->validate(['caso_id' => 'required|integer|exists:tb_casos,cas_contr']);

        try {
            $dados = $this->relatorioService->gerarRelatorioCreditosFaturamento($request->input('caso_id'));
            $nomeArquivo = 'creditos_' . $request->input('caso_id') . '_' . now()->format('YmdHis') . '.xlsx';

            $caminhoArquivo = $this->relatorioService->gerarExcel($dados, $nomeArquivo);

            return response()->download($caminhoArquivo, $nomeArquivo, [
                'Content-Type' => 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            ])->deleteFileAfterSend(true);
        } catch (\Exception $e) {
            return redirect()->back()->withErrors(['error' => 'Erro ao gerar relatório: ' . $e->getMessage()]);
        }
    }

    /**
     * Exibir e exportar relatório de auditoria em Excel
     */
    public function auditoriaExcel(Request $request)
    {
        $request->validate(['caso_id' => 'required|integer|exists:tb_casos,cas_contr']);

        try {
            $dados = $this->relatorioService->gerarRelatorioAuditoria($request->input('caso_id'));
            $nomeArquivo = 'auditoria_' . $request->input('caso_id') . '_' . now()->format('YmdHis') . '.xlsx';

            $caminhoArquivo = $this->relatorioService->gerarExcel($dados, $nomeArquivo);

            return response()->download($caminhoArquivo, $nomeArquivo, [
                'Content-Type' => 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            ])->deleteFileAfterSend(true);
        } catch (\Exception $e) {
            return redirect()->back()->withErrors(['error' => 'Erro ao gerar relatório: ' . $e->getMessage()]);
        }
    }
}
