<?php

namespace App\Services;

use Illuminate\Support\Facades\Log;

class DocConverterService
{
    /**
     * Converter .doc antigo para .docx
     * Tenta: LibreOffice → Pandoc → Fallback (copiar)
     */
    public static function converter(string $caminhoDoc): ?string
    {
        try {
            Log::info("Iniciando conversão: {$caminhoDoc}");

            if (!file_exists($caminhoDoc)) {
                Log::error("Arquivo não existe: {$caminhoDoc}");
                return null;
            }

            $pastaTemp = sys_get_temp_dir() . '/doc_' . uniqid();
            @mkdir($pastaTemp, 0777, true);

            $nomeArquivo = pathinfo($caminhoDoc, PATHINFO_FILENAME);
            $caminhoDocx = "{$pastaTemp}/{$nomeArquivo}.docx";

            // MÉTODO 1: LibreOffice
            Log::info("Método 1: LibreOffice");
            if (self::converterLibreOffice($caminhoDoc, $pastaTemp, $caminhoDocx)) {
                return $caminhoDocx;
            }

            // MÉTODO 2: Pandoc
            Log::info("Método 2: Pandoc");
            if (self::converterPandoc($caminhoDoc, $caminhoDocx)) {
                return $caminhoDocx;
            }

            // MÉTODO 3: Fallback - copiar como .docx
            Log::info("Método 3: Fallback (copiar como .docx)");
            if (@copy($caminhoDoc, $caminhoDocx)) {
                Log::info("Fallback OK: {$caminhoDocx}");
                return $caminhoDocx;
            }

            Log::error("Nenhum método funcionou");
            return null;

        } catch (\Exception $e) {
            Log::error("Erro conversão: " . $e->getMessage());
            return null;
        }
    }

    private static function converterLibreOffice(string $origem, string $pastaTemp, string $destino): bool
    {
        $isWindows = strtoupper(substr(PHP_OS, 0, 3)) === 'WIN';

        if ($isWindows) {
            $caminhos = [
                'C:\\Program Files\\LibreOffice\\program\\soffice.exe',
                'C:\\Program Files (x86)\\LibreOffice\\program\\soffice.exe',
            ];

            $soffice = null;
            foreach ($caminhos as $c) {
                if (file_exists($c)) {
                    $soffice = $c;
                    break;
                }
            }

            if (!$soffice) {
                Log::debug("LibreOffice não encontrado");
                return false;
            }

            $cmd = "\"{$soffice}\" --headless --convert-to docx --outdir \"{$pastaTemp}\" \"{$origem}\" 2>&1";
        } else {
            $cmd = "command -v soffice >/dev/null 2>&1 && soffice --headless --convert-to docx --outdir \"{$pastaTemp}\" \"{$origem}\" 2>&1";
        }

        Log::debug("Executando: {$cmd}");
        @shell_exec($cmd);
        sleep(1);

        if (file_exists($destino) && filesize($destino) > 0) {
            Log::info("LibreOffice OK");
            return true;
        }

        return false;
    }

    private static function converterPandoc(string $origem, string $destino): bool
    {
        $cmd = "command -v pandoc >/dev/null 2>&1 && pandoc \"{$origem}\" -o \"{$destino}\" 2>&1";

        Log::debug("Tentando Pandoc: {$cmd}");
        @shell_exec($cmd);

        if (file_exists($destino) && filesize($destino) > 0) {
            Log::info("Pandoc OK");
            return true;
        }

        return false;
    }
}
