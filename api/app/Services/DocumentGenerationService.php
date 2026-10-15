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
     * Baseado na estrutura: DNA/[pasta]/[modelos]
     */
    const ITEM_TYPES = [
        'L' => 'laudos',                // Laudo (DNA/Laudos/)
        'F' => 'folhas_resultado',      // Folha de Resultado (DNA/Folhas_Resultado/)
        'A' => 'autorizacoes_coleta',   // Autorização de Coleta (DNA/Autorizacoes_Coleta/)
        'E' => 'gerais',                // Entrega (DNA/ENTREGA.doc)
        'R' => 'gerais',                // Recibo/Correspondência (DNA/CORRESPONDENCIA.doc)
        'O' => 'gerais',                // Ofício (DNA/Oficios/*)
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
            if (!file_exists($caminhoTemplate)) {
                throw new \Exception("Arquivo template não encontrado: {$caminhoTemplate}");
            }

            if (!is_readable($caminhoTemplate)) {
                throw new \Exception("Arquivo template não é legível: {$caminhoTemplate}. Permissões insuficientes.");
            }

            $fileSize = filesize($caminhoTemplate);
            if ($fileSize < 1000) {
                throw new \Exception("Arquivo template corrompido ou muito pequeno ({$fileSize} bytes): {$caminhoTemplate}");
            }

            Log::debug("Carregando template: {$caminhoTemplate} ({$fileSize} bytes)");

            // Se é .doc antigo, converter para .docx usando LibreOffice
            $caminhoTemporario = null;
            if (strtolower(pathinfo($caminhoTemplate, PATHINFO_EXTENSION)) === 'doc') {
                Log::debug("Arquivo .doc detectado, convertendo para .docx via LibreOffice...");
                $caminhoTemporario = self::converterDocParaDocx($caminhoTemplate);
                if ($caminhoTemporario) {
                    $caminhoTemplate = $caminhoTemporario;
                    Log::debug("Conversão bem-sucedida: {$caminhoTemporario}");
                }
            }

            // Carregar com Word2007 (padrão para .docx)
            try {
                Log::debug("Carregando template como Word2007: {$caminhoTemplate}");
                $phpWord = IOFactory::load($caminhoTemplate, 'Word2007');
                Log::debug("Template carregado com sucesso");
            } catch (\Throwable $e) {
                Log::warning("Falha ao carregar template: " . $e->getMessage());
                // Se falhar, criar documento em branco
                Log::warning("Criando documento em branco...");
                $phpWord = new PhpWord();
                $section = $phpWord->addSection();
                $section->addText("DOCUMENTO GERADO - " . strtoupper($tipoItem), ['size' => 14, 'bold' => true]);
                $section->addText("Processo: " . ($processo->pro_nperc ?? ''));
                $section->addText("Data: " . date('d/m/Y H:i:s'));
            } finally {
                // Limpar arquivo temporário
                if ($caminhoTemporario && file_exists($caminhoTemporario)) {
                    unlink($caminhoTemporario);
                    Log::debug("Arquivo temporário removido: {$caminhoTemporario}");
                }
            }

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
     * Converter .doc antigo para .docx usando LibreOffice
     * Retorna caminho do arquivo temporário convertido, ou null se falhar
     */
    private static function converterDocParaDocx(string $caminhoDoc): ?string
    {
        try {
            // Criar pasta temporária
            $pastaTemp = sys_get_temp_dir() . '/laravel_doc_convert_' . time();
            if (!mkdir($pastaTemp, 0777, true) && !is_dir($pastaTemp)) {
                Log::warning("Não foi possível criar pasta temporária: {$pastaTemp}");
                return null;
            }

            // Caminhos
            $nomeArquivo = pathinfo($caminhoDoc, PATHINFO_FILENAME);
            $caminhoDocx = "{$pastaTemp}/{$nomeArquivo}.docx";

            // Comando LibreOffice para converter
            // Detectar SO
            $isWindows = strtoupper(substr(PHP_OS, 0, 3)) === 'WIN';

            if ($isWindows) {
                // Windows: procurar soffice.exe
                $caminhos = [
                    'C:\\Program Files\\LibreOffice\\program\\soffice.exe',
                    'C:\\Program Files (x86)\\LibreOffice\\program\\soffice.exe',
                ];

                $libreoffice = null;
                foreach ($caminhos as $caminho) {
                    if (file_exists($caminho)) {
                        $libreoffice = $caminho;
                        break;
                    }
                }

                if (!$libreoffice) {
                    Log::error("ERRO: LibreOffice não encontrado! Instale em: https://www.libreoffice.org/download/");
                    @rmdir($pastaTemp);
                    return null;
                }

                Log::debug("LibreOffice encontrado: {$libreoffice}");
                // Comando Windows (simplificado)
                $comando = "\"{$libreoffice}\" --headless --convert-to docx --outdir \"{$pastaTemp}\" \"{$caminhoDoc}\"";
            } else {
                // Linux/Mac: usar unoconv ou soffice
                $comando = "soffice --headless --convert-to docx:\"MS Word 2007 XML\" --outdir \"{$pastaTemp}\" \"{$caminhoDoc}\"";
            }

            Log::debug("Executando: {$comando}");

            // Executar conversão com timeout
            $output = shell_exec($comando . " 2>&1");
            Log::debug("LibreOffice output: {$output}");

            // Aguardar conversão (LibreOffice pode levar)
            sleep(2);

            // Verificar se foi criado
            $arquivosTemp = scandir($pastaTemp);
            Log::debug("Arquivos em {$pastaTemp}: " . implode(", ", $arquivosTemp));

            if (file_exists($caminhoDocx) && filesize($caminhoDocx) > 0) {
                Log::info("Conversão OK: {$caminhoDocx} (" . filesize($caminhoDocx) . " bytes)");
                return $caminhoDocx;
            } else {
                Log::error("Conversão FALHOU! Arquivo não encontrado: {$caminhoDocx}");
                // Limpar pasta temporária
                foreach ($arquivosTemp as $arq) {
                    if ($arq !== '.' && $arq !== '..') {
                        @unlink("{$pastaTemp}/{$arq}");
                    }
                }
                @rmdir($pastaTemp);
                return null;
            }
        } catch (\Exception $e) {
            Log::error("Erro ao converter .doc para .docx: " . $e->getMessage());
            return null;
        }
    }

    /**
     * Buscar arquivo template na pasta
     */
    private static function buscarTemplate(string $pastaModelo, ?string $nomeTemplate): ?string
    {
        $caminhoBase = storage_path("templates/{$pastaModelo}");

        Log::debug("DEBUG: Procurando templates em: {$caminhoBase}");
        Log::debug("DEBUG: Pasta existe? " . (is_dir($caminhoBase) ? 'SIM' : 'NÃO'));

        if (!is_dir($caminhoBase)) {
            Log::warning("Pasta de modelo não existe: {$caminhoBase}");
            return null;
        }

        // Se especificou nome do template, usar esse
        if ($nomeTemplate) {
            $caminho = "{$caminhoBase}/{$nomeTemplate}";
            if (file_exists($caminho)) {
                Log::debug("DEBUG: Template encontrado: {$caminho}");
                return $caminho;
            }
        }

        // Buscar primeiro arquivo .docx ou .doc da pasta
        $arquivos = glob("{$caminhoBase}/*.docx");
        Log::debug("DEBUG: Arquivos .docx encontrados: " . count($arquivos ?? []));

        if (empty($arquivos)) {
            $arquivos = glob("{$caminhoBase}/*.doc");
            Log::debug("DEBUG: Arquivos .doc encontrados: " . count($arquivos ?? []));
        }

        if (!empty($arquivos)) {
            Log::debug("DEBUG: Primeira template: {$arquivos[0]}");
            Log::debug("DEBUG: Tamanho: " . filesize($arquivos[0]) . " bytes");
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
        // Buscar pessoas vinculadas ao processo com sua situação
        $pessoas = \App\Models\Pessoa::where('pro_cod', $processo->pro_cod)
            ->orderBy('pes_cod')
            ->get();

        // Mapeamento de situações (pes_sit) para tipo de pessoa
        $situacaoMap = self::mapearSituacoes();

        // Arrays para armazenar pessoas por tipo
        $pessoasPorTipo = [];

        foreach ($pessoas as $index => $pessoa) {
            $num = $index + 1;

            // Tags indexadas (genéricas por número)
            $tags["<PESSOA{$num}>"] = $pessoa->pes_nome ?? '';
            $tags["<PESSOA{$num}_NOME>"] = $pessoa->pes_nome ?? '';
            $tags["<PESSOA{$num}_INICIAIS>"] = $pessoa->pes_iniciais ?? '';
            $tags["<PESSOA{$num}_DOC>"] = $pessoa->pes_ndoc ?? '';
            $tags["<PESSOA{$num}_SEXO>"] = $pessoa->pes_sexo ?? '';

            if ($pessoa->pes_dtnas) {
                $tags["<PESSOA{$num}_DTNAS>"] = self::formatarDataExtenso($pessoa->pes_dtnas);
            }

            // Determinar tipo de pessoa pela situação (pes_sit)
            $tipoPersona = $situacaoMap[$pessoa->pes_sit] ?? null;
            if ($tipoPersona) {
                if (!isset($pessoasPorTipo[$tipoPersona])) {
                    $pessoasPorTipo[$tipoPersona] = [];
                }
                $pessoasPorTipo[$tipoPersona][] = $pessoa;
            }
        }

        // Tags específicas por tipo de pessoa (PAI, MÃE, AVÓ, TIO, etc.)
        foreach ($pessoasPorTipo as $tipo => $pessoasDoTipo) {
            foreach ($pessoasDoTipo as $idx => $pessoa) {
                $numTipo = $idx + 1;

                // Se há múltiplas pessoas do mesmo tipo, adicionar número
                $prefixo = ($numTipo > 1) ? "{$tipo}{$numTipo}" : $tipo;

                $tags["<{$prefixo}>"] = $pessoa->pes_nome ?? '';
                $tags["<{$prefixo}_NOME>"] = $pessoa->pes_nome ?? '';
                $tags["<{$prefixo}_INICIAIS>"] = $pessoa->pes_iniciais ?? '';
                $tags["<{$prefixo}_DOC>"] = $pessoa->pes_ndoc ?? '';
                $tags["<{$prefixo}_SEXO>"] = $pessoa->pes_sexo ?? '';

                if ($pessoa->pes_dtnas) {
                    $tags["<{$prefixo}_DTNAS>"] = self::formatarDataExtenso($pessoa->pes_dtnas);
                }
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

    /**
     * Mapear situação de pessoa (pes_sit) para tipo (PAI, MÃE, AVÓ, etc.)
     *
     * Baseado em padrão de análise de DNA/parentesco da tabela tb_situacao
     * sit_cod → nome_tipo (para tags <tipo_NOME>, <tipo_DOC>, etc.)
     */
    private static function mapearSituacoes(): array
    {
        return [
            1  => 'PROPOSITUS',    // Indivíduo em questão
            2  => 'MAE',           // Mãe
            3  => 'PAI',           // Pai
            4  => 'AVO_MAE',       // Avó materna
            5  => 'AVO_PAI',       // Avó paterna
            6  => 'AVO_MAE',       // Avó (pode ser mãe ou pai da mãe)
            7  => 'AVO_PAI',       // Avô (pode ser mãe ou pai do pai)
            8  => 'IRMAO',         // Irmão
            9  => 'IRMA',          // Irmã
            10 => 'CONJUGE',       // Cônjuge
            11 => 'TIO',           // Tio
            12 => 'TIA',           // Tia
            13 => 'PRIMA',         // Prima
            14 => 'PRIMO',         // Primo
            15 => 'SOBRINHO',      // Sobrinho
            16 => 'SOBRINHA',      // Sobrinha
            17 => 'TATAAVO',       // Tataavó/Tataavô
            // Adicionar mais conforme documentado em tb_situacao
        ];
    }
}
