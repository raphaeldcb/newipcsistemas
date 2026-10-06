<?php

namespace App\Enums;

enum AleloTipo: string
{
    case STR = 'STR';              // Short Tandem Repeat (comum)
    case SNP = 'SNP';              // Single Nucleotide Polymorphism
    case MITOCONDRIAL = 'mtDNA';   // Mitochondrial DNA
    case Y_CROMOSSOMO = 'Y-STR';   // Y-chromosome (masculino)
    case AMELOGENINA = 'AMELOGENINA'; // Sexo determinação

    public function label(): string
    {
        return match($this) {
            self::STR => 'STR (Short Tandem Repeat)',
            self::SNP => 'SNP (Single Nucleotide Polymorphism)',
            self::MITOCONDRIAL => 'Mitocondrial (mtDNA)',
            self::Y_CROMOSSOMO => 'Y-Cromossomo (Y-STR)',
            self::AMELOGENINA => 'Amelogenina (Sexo)',
        };
    }

    public function descricao(): string
    {
        return match($this) {
            self::STR => '16 marcadores autossômicos padrão CODIS',
            self::SNP => 'Polimorfismos de nucleotídeo único para ancestry',
            self::MITOCONDRIAL => 'DNA mitocondrial para amostras degradadas',
            self::Y_CROMOSSOMO => 'Marcadores Y para linhagem paternal',
            self::AMELOGENINA => 'Determinação de sexo biológico',
        };
    }
}
