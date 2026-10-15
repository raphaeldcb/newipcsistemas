<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Processo;
use App\Services\LaudoExcelExportService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class LaudoExportController extends Controller
{
    /**
     * Página de exportação de laudos
     */
    public function index(Processo $processo)
    {
        try {
            $exportacoes = LaudoExcelExportService::listarExportacoes($processo);

            return view('laudos.exportar', [
                'processo' => $processo,
                'exportacoes' => $exportacoes,
                'tipos' => ['DNA', 'HIV', 'PATERNITY', 'SCEI', 'GENERICO']
            ]);
        } catch (\Exception $e) {
            Log::error("Erro ao carregar página de exportação: " . $e->getMessage());
            return redirect()->back()->with('error', 'Erro ao carregar página de exportação');
        }
    }

    /**
     * Exportar laudo para Excel
     */
    public function exportar(Request $processo, Processo $processo_model)
    {
        try {
            $validated = $processo->validate([
                'tipo_laudo' => 'required|in:DNA,HIV,PATERNITY,SCEI,GENERICO',
                'dados_json' => 'nullable|json'
            ]);

            $dados = null;
            if ($validated['dados_json'] ?? null) {
                $dados = json_decode($validated['dados_json'], true);
            }

            $nomeArquivo = LaudoExcelExportService::exportar(
                $processo_model,
                $validated['tipo_laudo'],
                $dados
            );

            return redirect()->route('laudos.exportar', $processo_model)
                ->with('success', 'Laudo exportado com sucesso!');

        } catch (\Exception $e) {
            Log::error("Erro ao exportar laudo: " . $e->getMessage());
            return redirect()->back()->with('error', 'Erro ao exportar laudo: ' . $e->getMessage());
        }
    }

    /**
     * Importar CSV de alelos
     */
    public function importarCSV(Request $processo, Processo $processo_model)
    {
        try {
            $validated = $processo->validate([
                'csv_file' => 'required|file|mimes:csv,txt|max:5120'
            ]);

            $caminhoTemp = $validated['csv_file']->store('temp');
            $caminhoCheio = storage_path('app/' . $caminhoTemp);

            $dados = LaudoExcelExportService::importarCSV($caminhoCheio);

            // Limpar arquivo temporário
            @unlink($caminhoCheio);

            return response()->json([
                'success' => true,
                'dados' => $dados,
                'contador' => count($dados)
            ]);

        } catch (\Exception $e) {
            Log::error("Erro ao importar CSV: " . $e->getMessage());
            return response()->json([
                'success' => false,
                'error' => $e->getMessage()
            ], 400);
        }
    }

    /**
     * Download de arquivo exportado
     */
    public function download(Processo $processo, string $nomeArquivo)
    {
        try {
            $caminhoCompleto = LaudoExcelExportService::downloadArquivo($nomeArquivo);

            return response()->download($caminhoCompleto, $nomeArquivo, [
                'Content-Type' => 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
            ]);

        } catch (\Exception $e) {
            Log::error("Erro ao fazer download: " . $e->getMessage());
            return redirect()->back()->with('error', 'Erro ao fazer download do arquivo');
        }
    }

    /**
     * Listar exportações de um processo
     */
    public function listar(Processo $processo)
    {
        try {
            $exportacoes = LaudoExcelExportService::listarExportacoes($processo);

            return response()->json([
                'success' => true,
                'exportacoes' => $exportacoes
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage()
            ], 400);
        }
    }

    /**
     * Deletar exportação
     */
    public function deletar(Processo $processo, int $exp_cod)
    {
        try {
            $exportacao = \App\Models\LaudoExportacao::findOrFail($exp_cod);

            // Deletar arquivo físico
            $caminhoArquivo = storage_path("laudo-exports/{$exportacao->exp_arquivo}");
            if (file_exists($caminhoArquivo)) {
                unlink($caminhoArquivo);
            }

            // Deletar registro
            $exportacao->delete();

            return redirect()->back()->with('success', 'Exportação deletada com sucesso!');

        } catch (\Exception $e) {
            Log::error("Erro ao deletar exportação: " . $e->getMessage());
            return redirect()->back()->with('error', 'Erro ao deletar exportação');
        }
    }
}
