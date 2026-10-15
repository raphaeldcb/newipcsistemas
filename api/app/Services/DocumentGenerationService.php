<?php

namespace App\Services;

use App\Models\Processo;
use PhpOffice\PhpWord\IOFactory;
use PhpOffice\PhpWord\PhpWord;
use Illuminate\Support\Facades\Log;
use Carbon\Carbon;

class DocumentGenerationService
{
    /**
     * Tipos de itens e suas respectivas pastas de modelo
     */
    const ITEM_TYPES = [
        'L' => 'laudos',           // Laudo
        'F' => 'folhas_resultado', // Folha de Resultado
        'A' => 'autorizacoes_coleta', // Autorização de Coleta
        'R' => 'recibos',          // Recibo (não existe ainda)
        'E' => 'termos_entrega',   // Termo de Entrega (não existe ainda)
    ];

    /**
     * Gerar documento a partir de processo e tipo de item
     */
    public static function gerar(Processo $processo, string $tipoItem, ?string $nomeTemplate = null)
    {
        try {
            Log::info('Iniciando geração de documento', [
                'processo_id' => $processo->id,
                'tipo_item' => $tipoItem,
                'template' => $nomeTemplate
            ]);

            // 1. Identificar pasta de modelo
            $pastaModelo = self::identificarPasta($tipoItem);

            // 2. Buscar arquivo template
            $caminhoTemplate = self::buscarTemplate($pastaModelo, $nomeTemplate);

            if (!$caminhoTemplate) {
                throw new \Exception("Modelo não encontrado para tipo: {$tipoItem}");
            }

            // 3. Carregar template
            $phpWord = IOFactory::load($caminhoTemplate);

            // 4. Preparar tags para substituição
            $tags = self::prepararTags($processo);

            // 5. Substituir tags no documento
            self::substituirTags($phpWord, $tags);

            // 6. Salvar documento gerado
            $caminhoSaida = self::salvarDocumento($phpWord, $processo, $tipoItem);

            Log::info('Documento gerado com sucesso', ['arquivo' => $caminhoSaida]);

            return $caminhoSaida;

        } catch (\Exception $e) {
            Log::error('Erro ao gerar documento: ' . $e->getMessage());
            throw $e;
        }
    }

    /**
     * Identificar pasta de modelo baseado no tipo de item
     */
    private static function identificarPasta(string $tipoItem): string
    {
        return self::ITEM_TYPES[$tipoItem] ?? 'oficios';
    }

    /**
     * Buscar arquivo template na pasta
     */
    private static function buscarTemplate(string $pastaModelo, ?string $nomeTemplate): ?string
    {
        $caminhoBase = storage_path("templates/{$pastaModelo}");

        if (!is_dir($caminhoBase)) {
            Log::warning("Pasta de modelo não existe: {$caminhoBase}");
            return null;
        }

        // Se especificou nome do template, usar esse
        if ($nomeTemplate) {
            $caminho = "{$caminhoBase}/{$nomeTemplate}";
            if (file_exists($caminho)) {
                return $caminho;
            }
        }

        // Buscar primeiro arquivo .docx ou .doc da pasta
        $arquivos = glob("{$caminhoBase}/*.docx");
        if (empty($arquivos)) {
            $arquivos = glob("{$caminhoBase}/*.doc");
        }

        return !empty($arquivos) ? $arquivos[0] : null;
    }

    /**
     * Preparar array de tags para substituição
     *
     * Tags baseadas no sistema Delphi original (ufGeraWord.pas)
     */
    private static function prepararTags(Processo $processo): array
    {
        $tags = [];

        // ===== INFORMAÇÕES BÁSICAS DO PROCESSO =====
        $tags['<PROCESSO>'] = $processo->pro_nperc ?? '';
        $tags['<CODIGO>'] = $processo->pro_cod ?? '';
        $tags['<DOCUMENTOHISTORICO>'] = $processo->his_doc ?? ''; // Número laudo do histórico

        // ===== DATAS - EXTENSAS (DD de mês de YYYY) =====
        if ($processo->pro_dcole) {
            $tags['<DTCOLETA>'] = self::formatarDataExtenso($processo->pro_dcole);
        }

        $tags['<DTATUAL>'] = self::formatarDataExtenso(now());

        if ($processo->pro_drec) {
            $tags['<DTREC>'] = self::formatarDataExtenso($processo->pro_drec);
        }

        if ($processo->pro_dresu) {
            $tags['<DTRESULT>'] = self::formatarDataExtenso($processo->pro_dresu);
        }

        // ===== DATAS - FORMATADAS (DD/MM/YYYY) =====
        if ($processo->pro_dresu) {
            $dtResultF = \Carbon\Carbon::parse($processo->pro_dresu)->format('d/m/Y');
            $tags['<DTRESULTF>'] = $dtResultF;
        }

        // ===== HORAS - COLETA =====
        if ($processo->pro_hcole) {
            $partes = explode(':', $processo->pro_hcole);
            $tags['<HORA>'] = $partes[0] ?? '';
            $tags['<MINUTO>'] = $partes[1] ?? '';
        }

        // ===== HORAS - RECEPÇÃO =====
        if ($processo->pro_hrec) {
            $partes = explode(':', $processo->pro_hrec);
            $tags['<HORARECEPCAO>'] = $partes[0] ?? '';
            $tags['<MINUTORECEPCAO>'] = $partes[1] ?? '';
        }

        // ===== RESULTADOS =====
        $tags['<PROBABILIDADE>'] = $processo->pro_prob ?? '';

        if ($processo->pro_resul == 1) {
            $tags['<PROBABILIDADEPPC>'] = 'POSITIVO COM ' . ($processo->pro_prob ?? '0') . '%';
        } else {
            $tags['<PROBABILIDADEPPC>'] = 'NEGATIVO COM 100% DE CERTEZA DE EXCLUSÃO';
        }

        $tags['<AUTORETIRAR>'] = $processo->pro_areti ?? '';

        // ===== DADOS JUDICIÁRIOS =====
        if ($processo->juiz) {
            $tags['<JUIZ>'] = $processo->juiz->nome ?? '';
        }
        if ($processo->vara) {
            $tags['<VARA>'] = $processo->vara->nome ?? '';
        }
        if ($processo->comarca) {
            $tags['<COMARCA>'] = $processo->comarca->nome ?? '';
        }
        if ($processo->uf) {
            $tags['<ESTADO>'] = $processo->uf->sigla ?? '';
        }

        // ===== DADOS DE PESSOAS ENVOLVIDAS =====
        // Buscar pessoas vinculadas ao processo
        $pessoas = \App\Models\Pessoa::where('pro_cod', $processo->pro_cod)->get();

        foreach ($pessoas as $index => $pessoa) {
            $num = $index + 1;

            // Tags de pessoa (múltiplas)
            $tags["<PESSOA{$num}>"] = $pessoa->pes_nome ?? '';
            $tags["<PESSOA{$num}_NOME>"] = $pessoa->pes_nome ?? '';
            $tags["<PESSOA{$num}_INICIAIS>"] = $pessoa->pes_iniciais ?? '';
            $tags["<PESSOA{$num}_DOC>"] = $pessoa->pes_ndoc ?? '';
            $tags["<PESSOA{$num}_SEXO>"] = $pessoa->pes_sexo ?? '';

            if ($pessoa->pes_dtnas) {
                $tags["<PESSOA{$num}_DTNAS>"] = self::formatarDataExtenso($pessoa->pes_dtnas);
            }
        }

        // Tags genéricas da primeira pessoa (compatibilidade)
        if ($pessoas->count() > 0) {
            $p1 = $pessoas->first();
            $tags['<NOME>'] = $p1->pes_nome ?? '';
            $tags['<INICIAIS>'] = $p1->pes_iniciais ?? '';
            $tags['<DOCUMENTO>'] = $p1->pes_ndoc ?? '';
            $tags['<SEXO>'] = $p1->pes_sexo ?? '';
            if ($p1->pes_dtnas) {
                $tags['<DATANASC>'] = self::formatarDataExtenso($p1->pes_dtnas);
            }
        }

        // ===== DADOS DE HISTÓRICO (ITENS) =====
        // Buscar históricos do processo
        $historicos = \App\Models\Historico::where('pro_cod', $processo->pro_cod)->get();

        foreach ($historicos as $index => $historico) {
            $num = $index + 1;

            if ($historico->item) {
                $tags["<ITEM{$num}>"] = $historico->item->nome ?? '';
                $tags["<ITEM{$num}_DESC>"] = $historico->item->descricao ?? '';
            }

            if ($historico->his_data) {
                $tags["<ITEM{$num}_DATA>"] = self::formatarDataExtenso($historico->his_data);
            }

            $tags["<ITEM{$num}_DOC>"] = $historico->his_doc ?? '';
            $tags["<ITEM{$num}_OBS>"] = $historico->his_obs ?? '';
        }

        // Tags genéricas do primeiro item (compatibilidade)
        if ($historicos->count() > 0) {
            $h1 = $historicos->first();
            if ($h1->item) {
                $tags['<ITEM>'] = $h1->item->nome ?? '';
            }
            $tags['<ITEM_DATA>'] = $h1->his_data ? self::formatarDataExtenso($h1->his_data) : '';
            $tags['<ITEM_DOC>'] = $h1->his_doc ?? '';
        }

        Log::debug('Tags preparadas para substituição', [
            'quantidade' => count($tags),
            'pessoas' => $pessoas->count(),
            'itens' => $historicos->count()
        ]);

        return $tags;
    }

    /**
     * Substituir tags no documento
     */
    private static function substituirTags(PhpWord &$phpWord, array $tags): void
    {
        // Iterar por todos os parágrafos do documento
        foreach ($phpWord->getSections() as $section) {
            // Parágrafos principais
            foreach ($section->getElements() as $element) {
                if (method_exists($element, 'getElements')) {
                    // Elementos com sub-elementos (tabelas, etc)
                    foreach ($element->getElements() as $subElement) {
                        if (method_exists($subElement, 'getText')) {
                            self::substituirEmTexto($subElement, $tags);
                        }
                    }
                } elseif (method_exists($element, 'getText')) {
                    // Parágrafos simples
                    self::substituirEmTexto($element, $tags);
                }
            }

            // Headers e Footers
            foreach ($section->getHeaders() as $header) {
                foreach ($header->getElements() as $element) {
                    if (method_exists($element, 'getText')) {
                        self::substituirEmTexto($element, $tags);
                    }
                }
            }

            foreach ($section->getFooters() as $footer) {
                foreach ($footer->getElements() as $element) {
                    if (method_exists($element, 'getText')) {
                        self::substituirEmTexto($element, $tags);
                    }
                }
            }
        }
    }

    /**
     * Substituir tags em um elemento de texto
     */
    private static function substituirEmTexto(&$element, array $tags): void
    {
        try {
            if (method_exists($element, 'getText')) {
                $texto = $element->getText();

                // Verificar se tem alguma tag
                $temTag = false;
                foreach ($tags as $tag => $valor) {
                    if (strpos($texto, $tag) !== false) {
                        $temTag = true;
                        break;
                    }
                }

                // Se tem tag, substituir
                if ($temTag) {
                    $novoTexto = $texto;
                    foreach ($tags as $tag => $valor) {
                        $novoTexto = str_replace($tag, $valor ?? '', $novoTexto);
                    }

                    if (method_exists($element, 'setText')) {
                        $element->setText($novoTexto);
                    }
                }
            }
        } catch (\Exception $e) {
            Log::warning('Erro ao substituir tag: ' . $e->getMessage());
        }
    }

    /**
     * Formatar data em extenso
     * Ex: "15 de outubro de 2026"
     */
    private static function formatarDataExtenso($data): string
    {
        if (!$data) {
            return '';
        }

        $carbon = $data instanceof Carbon ? $data : Carbon::parse($data);

        $meses = [
            'janeiro', 'fevereiro', 'março', 'abril', 'maio', 'junho',
            'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro'
        ];

        $dia = $carbon->day;
        if ($dia == 1) {
            $dia = 'Primeiro';
        } else {
            $dia = str_pad($carbon->day, 2, '0', STR_PAD_LEFT);
        }

        $mes = $meses[$carbon->month - 1];
        $ano = $carbon->year;

        return "{$dia} de {$mes} de {$ano}";
    }

    /**
     * Salvar documento gerado
     */
    private static function salvarDocumento(PhpWord &$phpWord, Processo $processo, string $tipoItem): string
    {
        $pastaDestino = storage_path('documents/generated');

        if (!is_dir($pastaDestino)) {
            mkdir($pastaDestino, 0755, true);
        }

        // Nome do arquivo
        $nomeArquivo = sprintf(
            '%s_%s_%s.docx',
            $processo->id,
            $tipoItem,
            now()->format('YmdHis')
        );

        $caminhoSaida = "{$pastaDestino}/{$nomeArquivo}";

        // Salvar em DOCX
        $writer = IOFactory::createWriter($phpWord, 'Word2007');
        $writer->save($caminhoSaida);

        return $caminhoSaida;
    }

    /**
     * Listar templates disponíveis para um tipo de item
     */
    public static function listarTemplates(string $tipoItem): array
    {
        $pastaModelo = self::identificarPasta($tipoItem);
        $caminhoBase = storage_path("templates/{$pastaModelo}");

        if (!is_dir($caminhoBase)) {
            return [];
        }

        $arquivos = array_merge(
            glob("{$caminhoBase}/*.docx") ?? [],
            glob("{$caminhoBase}/*.doc") ?? []
        );

        return array_map(fn($caminho) => basename($caminho), $arquivos);
    }
}
