<?php

namespace App\Services;

use App\Models\Processo;
use App\Models\LaudoExportacao;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Style\Font;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Exception;

class LaudoExcelExportService
{
    /**
     * Exportar laudo para Excel
     */
    public static function exportar(Processo $processo, string $tipoLaudo, ?array $dados = null): string
    {
        try {
            $spreadsheet = new Spreadsheet();
            $sheet = $spreadsheet->getActiveSheet();

            // Preparar tags do DocumentGenerationService
            $tags = DocumentGenerationService::prepararTags($processo);

            // Montar cabeçalho do laudo
            self::adicionarCabecalho($sheet, $processo, $tags, $tipoLaudo);

            // Adicionar dados conforme tipo de laudo
            switch ($tipoLaudo) {
                case 'DNA':
                    self::adicionarDadosDNA($sheet, $dados, $tags);
                    break;
                case 'HIV':
                    self::adicionarDadosHIV($sheet, $dados, $tags);
                    break;
                case 'PATERNITY':
                    self::adicionarDadosPaternity($sheet, $dados, $tags);
                    break;
                case 'SCEI':
                    self::adicionarDadosSCEI($sheet, $dados, $tags);
                    break;
                default:
                    self::adicionarDadosGenerico($sheet, $dados, $tags);
            }

            // Salvar arquivo
            $nomeArquivo = self::gerarNomeArquivo($processo, $tipoLaudo);
            $caminhoCompleto = storage_path("laudo-exports/{$nomeArquivo}");

            // Criar diretório se não existir
            if (!is_dir(storage_path('laudo-exports'))) {
                mkdir(storage_path('laudo-exports'), 0755, true);
            }

            $writer = new Xlsx($spreadsheet);
            $writer->save($caminhoCompleto);

            // Registrar exportação
            LaudoExportacao::create([
                'pro_cod' => $processo->pro_cod,
                'exp_tipo' => $tipoLaudo,
                'exp_data' => now(),
                'exp_arquivo' => $nomeArquivo,
                'exp_status' => 'processado',
                'exp_obs' => 'Exportação realizada com sucesso'
            ]);

            Log::info("Laudo exportado: {$nomeArquivo} para processo {$processo->pro_cod}");

            return $nomeArquivo;

        } catch (Exception $e) {
            Log::error("Erro ao exportar laudo: " . $e->getMessage());

            LaudoExportacao::create([
                'pro_cod' => $processo->pro_cod,
                'exp_tipo' => $tipoLaudo,
                'exp_data' => now(),
                'exp_status' => 'erro',
                'exp_obs' => $e->getMessage()
            ]);

            throw $e;
        }
    }

    /**
     * Adicionar cabeçalho do laudo
     */
    private static function adicionarCabecalho($sheet, Processo $processo, array $tags, string $tipoLaudo): void
    {
        $row = 1;

        // Título
        $sheet->setCellValue("A{$row}", "LAUDO DE ANÁLISE - " . strtoupper($tipoLaudo));
        $sheet->getStyle("A{$row}")->getFont()->setBold(true)->setSize(14);
        $sheet->getStyle("A{$row}")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
        $sheet->mergeCells("A{$row}:F{$row}");
        $row++;

        // Informações do processo
        $sheet->setCellValue("A{$row}", "Processo:");
        $sheet->setCellValue("B{$row}", $tags['<PROCESSO>'] ?? '');
        $row++;

        $sheet->setCellValue("A{$row}", "Código:");
        $sheet->setCellValue("B{$row}", $tags['<CODIGO>'] ?? '');
        $row++;

        // Dados de pessoas
        if (!empty($tags['<PROPOSITUS_NOME>'])) {
            $sheet->setCellValue("A{$row}", "Propositus:");
            $sheet->setCellValue("B{$row}", $tags['<PROPOSITUS_NOME>']);
            $row++;
        }

        if (!empty($tags['<PAI_NOME>'])) {
            $sheet->setCellValue("A{$row}", "Pai:");
            $sheet->setCellValue("B{$row}", $tags['<PAI_NOME>']);
            $row++;
        }

        if (!empty($tags['<MAE_NOME>'])) {
            $sheet->setCellValue("A{$row}", "Mãe:");
            $sheet->setCellValue("B{$row}", $tags['<MAE_NOME>']);
            $row++;
        }

        // Datas
        $sheet->setCellValue("A{$row}", "Data Coleta:");
        $sheet->setCellValue("B{$row}", $tags['<DTCOLETA>'] ?? '');
        $row++;

        $sheet->setCellValue("A{$row}", "Data Resultado:");
        $sheet->setCellValue("B{$row}", $tags['<DTRESULT>'] ?? '');
        $row += 2;
    }

    /**
     * Adicionar dados DNA
     */
    private static function adicionarDadosDNA($sheet, ?array $dados, array $tags): void
    {
        $row = 8;

        $sheet->setCellValue("A{$row}", "ANÁLISE GENÉTICA");
        $sheet->getStyle("A{$row}")->getFont()->setBold(true);
        $row += 2;

        // Cabeçalhos da tabela
        $sheet->setCellValue("A{$row}", "Marcador");
        $sheet->setCellValue("B{$row}", "Alelo 1");
        $sheet->setCellValue("C{$row}", "Alelo 2");
        $sheet->setCellValue("D{$row}", "Genótipo");
        $sheet->setCellValue("E{$row}", "Frequência");

        // Negrito e bordas
        self::aplicarEstiloCabecalho($sheet, "A{$row}:E{$row}");
        $row++;

        // Dados (exemplo)
        if ($dados && is_array($dados)) {
            foreach ($dados as $marcador) {
                $sheet->setCellValue("A{$row}", $marcador['marcador'] ?? '');
                $sheet->setCellValue("B{$row}", $marcador['al1'] ?? '');
                $sheet->setCellValue("C{$row}", $marcador['al2'] ?? '');
                $sheet->setCellValue("D{$row}", ($marcador['al1'] ?? '') . "/" . ($marcador['al2'] ?? ''));
                $sheet->setCellValue("E{$row}", $marcador['freq'] ?? '');
                $row++;
            }
        }

        // Resultado
        $row += 2;
        $sheet->setCellValue("A{$row}", "Resultado:");
        $sheet->setCellValue("B{$row}", $tags['<PROBABILIDADEPPC>'] ?? '');
        $sheet->getStyle("B{$row}")->getFont()->setBold(true);
    }

    /**
     * Adicionar dados HIV
     */
    private static function adicionarDadosHIV($sheet, ?array $dados, array $tags): void
    {
        $row = 8;

        $sheet->setCellValue("A{$row}", "ANÁLISE HIV");
        $sheet->getStyle("A{$row}")->getFont()->setBold(true);
        $row += 2;

        if ($dados && is_array($dados)) {
            $sheet->setCellValue("A{$row}", "Carga Viral:");
            $sheet->setCellValue("B{$row}", $dados['carga_viral'] ?? '');
            $row++;

            $sheet->setCellValue("A{$row}", "CD4:");
            $sheet->setCellValue("B{$row}", $dados['cd4'] ?? '');
            $row++;

            $sheet->setCellValue("A{$row}", "Status:");
            $sheet->setCellValue("B{$row}", $dados['status'] ?? '');
        }
    }

    /**
     * Adicionar dados Paternity
     */
    private static function adicionarDadosPaternity($sheet, ?array $dados, array $tags): void
    {
        $row = 8;

        $sheet->setCellValue("A{$row}", "ANÁLISE DE PATERNIDADE");
        $sheet->getStyle("A{$row}")->getFont()->setBold(true);
        $row += 2;

        $sheet->setCellValue("A{$row}", "Índice de Paternidade:");
        $sheet->setCellValue("B{$row}", $tags['<PROBABILIDADEPPC>'] ?? '');
        $row++;

        $sheet->setCellValue("A{$row}", "Conclusão:");
        $sheet->setCellValue("B{$row}", $dados['conclusao'] ?? 'Análise pendente');
    }

    /**
     * Adicionar dados SCEI
     */
    private static function adicionarDadosSCEI($sheet, ?array $dados, array $tags): void
    {
        $row = 8;

        $sheet->setCellValue("A{$row}", "ANÁLISE SCEI");
        $sheet->getStyle("A{$row}")->getFont()->setBold(true);
        $row += 2;

        if ($dados && is_array($dados)) {
            $sheet->setCellValue("A{$row}", "Medicamento");
            $sheet->setCellValue("B{$row}", "Dose");
            $sheet->setCellValue("C{$row}", "Frequência");
            self::aplicarEstiloCabecalho($sheet, "A{$row}:C{$row}");
            $row++;

            foreach ($dados as $med) {
                $sheet->setCellValue("A{$row}", $med['medicamento'] ?? '');
                $sheet->setCellValue("B{$row}", $med['dose'] ?? '');
                $sheet->setCellValue("C{$row}", $med['frequencia'] ?? '');
                $row++;
            }
        }
    }

    /**
     * Adicionar dados genérico
     */
    private static function adicionarDadosGenerico($sheet, ?array $dados, array $tags): void
    {
        $row = 8;

        $sheet->setCellValue("A{$row}", "DADOS DO LAUDO");
        $sheet->getStyle("A{$row}")->getFont()->setBold(true);
        $row += 2;

        if ($dados && is_array($dados)) {
            foreach ($dados as $chave => $valor) {
                $sheet->setCellValue("A{$row}", ucfirst(str_replace('_', ' ', $chave)));
                $sheet->setCellValue("B{$row}", $valor);
                $row++;
            }
        }
    }

    /**
     * Aplicar estilo de cabeçalho
     */
    private static function aplicarEstiloCabecalho($sheet, string $range): void
    {
        $sheet->getStyle($range)->getFont()->setBold(true);
        $sheet->getStyle($range)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
        $sheet->getStyle($range)->getAlignment()->setVertical(Alignment::VERTICAL_CENTER);
        $sheet->getStyle($range)->getBorders()->applyFromArray([
            'outline' => [
                'style' => Border::BORDER_THIN,
            ]
        ]);
    }

    /**
     * Gerar nome do arquivo
     */
    private static function gerarNomeArquivo(Processo $processo, string $tipo): string
    {
        $data = now()->format('YmdHis');
        $codigo = $processo->pro_cod ?? 'SEM_COD';
        return "LAUDO_{$tipo}_{$codigo}_{$data}.xlsx";
    }

    /**
     * Importar CSV de alelos/dados
     */
    public static function importarCSV(string $caminhoCSV): array
    {
        $dados = [];

        if (!file_exists($caminhoCSV)) {
            throw new Exception("Arquivo CSV não encontrado: {$caminhoCSV}");
        }

        $handle = fopen($caminhoCSV, 'r');

        if (!$handle) {
            throw new Exception("Não foi possível abrir arquivo CSV");
        }

        // Pular cabeçalho
        $header = fgetcsv($handle);

        while (($row = fgetcsv($handle)) !== false) {
            // Mapear coluna para campo
            $linha = [];
            foreach ($header as $index => $coluna) {
                $linha[strtolower(trim($coluna))] = $row[$index] ?? '';
            }

            $dados[] = $linha;
        }

        fclose($handle);

        Log::info("CSV importado: " . count($dados) . " linhas");

        return $dados;
    }

    /**
     * Listar exportações de um processo
     */
    public static function listarExportacoes(Processo $processo): array
    {
        return LaudoExportacao::where('pro_cod', $processo->pro_cod)
            ->orderBy('exp_data', 'desc')
            ->get()
            ->toArray();
    }

    /**
     * Download de arquivo exportado
     */
    public static function downloadArquivo(string $nomeArquivo): string
    {
        $caminhoCompleto = storage_path("laudo-exports/{$nomeArquivo}");

        if (!file_exists($caminhoCompleto)) {
            throw new Exception("Arquivo não encontrado: {$nomeArquivo}");
        }

        return $caminhoCompleto;
    }
}
