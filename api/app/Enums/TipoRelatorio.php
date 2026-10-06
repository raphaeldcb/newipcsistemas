<?php

namespace App\Enums;

enum TipoRelatorio: string
{
    case CASO_COMPLETO = 'caso_completo';
    case LAUDO_FINAL = 'laudo_final';
    case EXTRACAO_RESULTADO = 'extracao_resultado';
    case ALELOS_COMPARACAO = 'alelos_comparacao';
    case CREDITOS_FATURAMENTO = 'creditos_faturamento';
    case SCEI_RESULTADO = 'scei_resultado';
    case AUDITORIA_CASOS = 'auditoria_casos';
    case RESUMO_KITS = 'resumo_kits';

    public function label(): string
    {
        return match($this) {
            self::CASO_COMPLETO => 'Caso Completo',
            self::LAUDO_FINAL => 'Laudo Final',
            self::EXTRACAO_RESULTADO => 'Resultado Extração',
            self::ALELOS_COMPARACAO => 'Comparação Alelos',
            self::CREDITOS_FATURAMENTO => 'Faturamento',
            self::SCEI_RESULTADO => 'Resultado SCEI',
            self::AUDITORIA_CASOS => 'Auditoria Casos',
            self::RESUMO_KITS => 'Resumo Kits',
        };
    }

    public function formato(): string
    {
        return match($this) {
            self::LAUDO_FINAL, self::CASO_COMPLETO => 'pdf',
            default => 'excel',
        };
    }
}
