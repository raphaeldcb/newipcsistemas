<?php

namespace App\Services;

use Illuminate\Support\Facades\Storage;

class TemplateLoaderService
{
    /**
     * Mapeia tipo_item para pasta de templates
     */
    public static function obterCaminhoTemplate(string $tipoItem): ?string
    {
        $templates = self::listarTemplates($tipoItem);

        if (empty($templates)) {
            return null;
        }

        // Retorna o primeiro template válido
        return $templates[0];
    }

    /**
     * Lista todos os templates para um tipo_item
     */
    public static function listarTemplates(string $tipoItem): array
    {
        $pastaPrincipal = storage_path('templates');
        $templates = [];

        switch ($tipoItem) {
            case 'L': // Laudo
                $pastaPrincipal = storage_path('templates/laudos');
                if (is_dir($pastaPrincipal)) {
                    $arquivos = array_diff(scandir($pastaPrincipal), ['.', '..']);
                    foreach ($arquivos as $arquivo) {
                        if (is_file("$pastaPrincipal/$arquivo")) {
                            $templates[] = "$pastaPrincipal/$arquivo";
                        }
                    }
                }
                break;

            case 'F': // Folha Resultado
                $pastaPrincipal = storage_path('templates/folhas_resultado');
                if (is_dir($pastaPrincipal)) {
                    $arquivos = array_diff(scandir($pastaPrincipal), ['.', '..']);
                    foreach ($arquivos as $arquivo) {
                        if (is_file("$pastaPrincipal/$arquivo")) {
                            $templates[] = "$pastaPrincipal/$arquivo";
                        }
                    }
                }
                break;

            case 'A': // Autorização Coleta
                $pastaPrincipal = storage_path('templates/autorizacoes_coleta');
                if (is_dir($pastaPrincipal)) {
                    $arquivos = array_diff(scandir($pastaPrincipal), ['.', '..']);
                    foreach ($arquivos as $arquivo) {
                        if (is_file("$pastaPrincipal/$arquivo")) {
                            $templates[] = "$pastaPrincipal/$arquivo";
                        }
                    }
                }
                break;

            case 'E': // Entrega
                $arquivo = storage_path('templates/gerais/ENTREGA.doc');
                if (file_exists($arquivo)) {
                    $templates[] = $arquivo;
                }
                break;

            case 'R': // Recibo/Correspondência
                $arquivo = storage_path('templates/gerais/CORRESPONDENCIA.doc');
                if (file_exists($arquivo)) {
                    $templates[] = $arquivo;
                }
                break;

            case 'O': // Ofício
                $pastaPrincipal = storage_path('templates/gerais');
                if (is_dir($pastaPrincipal)) {
                    $arquivos = array_diff(scandir($pastaPrincipal), ['.', '..']);
                    foreach ($arquivos as $arquivo) {
                        if (str_starts_with(strtolower($arquivo), 'oficio') || str_starts_with(strtolower($arquivo), 'of')) {
                            if (is_file("$pastaPrincipal/$arquivo")) {
                                $templates[] = "$pastaPrincipal/$arquivo";
                            }
                        }
                    }
                }
                break;
        }

        // Ordena alfabeticamente
        sort($templates);

        return $templates;
    }

    /**
     * Retorna nomes dos templates (apenas nomes, sem caminhos)
     */
    public static function listarNomesTemplates(string $tipoItem): array
    {
        $templates = self::listarTemplates($tipoItem);
        return array_map(fn($t) => basename($t), $templates);
    }
}
