<?php

namespace App\Services;

use App\Models\Caso;
use App\Models\Credito;

class CalculoCreditoService
{
    /**
     * Base value for credit calculation
     */
    public const VALOR_BASE = 1000.00;

    /**
     * Fator 1: Tipo de Processo
     *
     * Classifies by type of legal proceeding
     */
    private const FATORES_TIPO_PROCESSO = [
        'civel' => 1.0,
        'criminal' => 1.2,
        'familia' => 0.8,
        'trabalhista' => 1.1,
        'administrativo' => 0.9,
    ];

    /**
     * Fator 2: Posição do Juiz
     *
     * Classifies by judge experience and position
     */
    private const FATORES_JUIZ = [
        'titular' => 1.0,
        'substituto' => 0.8,
        'conciliador' => 0.6,
        'arbitro' => 1.2,
    ];

    /**
     * Fator 3: Tipo de Vara/Tribunal
     *
     * Classifies by court jurisdiction and complexity
     */
    private const FATORES_VARA = [
        'vara_criminal' => 1.0,
        'vara_civel' => 1.1,
        'jec' => 0.7,
        'jrim' => 0.9,
        'tribunal' => 1.3,
    ];

    /**
     * Fator 4: Complexidade do Caso
     *
     * Classifies by case complexity level
     */
    private const FATORES_COMPLEXIDADE = [
        'simples' => 0.8,
        'media' => 1.0,
        'complexa' => 1.3,
        'altamente_complexa' => 1.5,
        'com_pericia' => 1.4,
    ];

    /**
     * Fator 5: Estágio do Processo
     *
     * Classifies by current stage in proceedings
     */
    private const FATORES_ESTAGIO = [
        'inicial' => 0.8,
        'em_andamento' => 1.0,
        'sentenca' => 1.3,
        'recurso' => 1.5,
        'execucao' => 1.2,
    ];

    /**
     * Calculate credit value using 5-factor method
     *
     * @param Caso $caso The case for which to calculate credit
     * @param array $overrides Optional factor overrides for customization
     * @return array Calculation result with breakdown
     */
    public function calcular(Caso $caso, array $overrides = []): array
    {
        $fator1 = $this->obterFatorTipo($caso, $overrides['fator_1'] ?? null);
        $fator2 = $this->obterFatorJuiz($caso, $overrides['fator_2'] ?? null);
        $fator3 = $this->obterFatorVara($caso, $overrides['fator_3'] ?? null);
        $fator4 = $this->obterFatorComplexidade($caso, $overrides['fator_4'] ?? null);
        $fator5 = $this->obterFatorEstagio($caso, $overrides['fator_5'] ?? null);

        $valorCalculado = self::VALOR_BASE * $fator1 * $fator2 * $fator3 * $fator4 * $fator5;
        $valorCalculado = round($valorCalculado, 2);

        return [
            'valor_base' => self::VALOR_BASE,
            'fator_1' => round($fator1, 4),
            'fator_2' => round($fator2, 4),
            'fator_3' => round($fator3, 4),
            'fator_4' => round($fator4, 4),
            'fator_5' => round($fator5, 4),
            'valor_calculado' => $valorCalculado,
            'multiplicador_total' => round($fator1 * $fator2 * $fator3 * $fator4 * $fator5, 4),
        ];
    }

    /**
     * Calculate installment plan for a credit
     *
     * @param float $valorTotal Total credit value
     * @param int $numParcelas Number of installments
     * @return array Array of installment details
     */
    public function calcularParcelas(float $valorTotal, int $numParcelas = 3): array
    {
        $parcelas = [];
        $valorPorParcela = $valorTotal / $numParcelas;
        $diasPorParcela = 10;

        for ($i = 1; $i <= $numParcelas; $i++) {
            // Last installment gets remainder to ensure exact total
            $valor = $i === $numParcelas
                ? $valorTotal - array_sum(array_column($parcelas, 'valor'))
                : round($valorPorParcela, 2);

            $parcelas[] = [
                'numero' => $i,
                'valor' => $valor,
                'dias_vencimento' => $i * $diasPorParcela,
                'data_vencimento' => now()->addDays($i * $diasPorParcela),
                'percentual' => round(($valor / $valorTotal) * 100, 2),
            ];
        }

        return $parcelas;
    }

    /**
     * Get factor 1: Type of Process
     */
    protected function obterFatorTipo(Caso $caso, ?float $override): float
    {
        if ($override !== null) {
            return $override;
        }

        $tipo = strtolower($caso->tipo_processo ?? 'civel');
        return self::FATORES_TIPO_PROCESSO[$tipo] ?? 1.0;
    }

    /**
     * Get factor 2: Judge Position
     */
    protected function obterFatorJuiz(Caso $caso, ?float $override): float
    {
        if ($override !== null) {
            return $override;
        }

        if (!$caso->jui_cod || !$caso->juiz) {
            return 1.0;
        }

        $posicao = strtolower($caso->juiz->posicao ?? 'titular');
        return self::FATORES_JUIZ[$posicao] ?? 1.0;
    }

    /**
     * Get factor 3: Court Type
     */
    protected function obterFatorVara(Caso $caso, ?float $override): float
    {
        if ($override !== null) {
            return $override;
        }

        if (!$caso->var_cod || !$caso->vara) {
            return 1.0;
        }

        $tipo = strtolower($caso->vara->descricao ?? 'vara_civel');
        return self::FATORES_VARA[$tipo] ?? 1.0;
    }

    /**
     * Get factor 4: Case Complexity
     */
    protected function obterFatorComplexidade(Caso $caso, ?float $override): float
    {
        if ($override !== null) {
            return $override;
        }

        // Check for pericia (expertise) requirement
        if ($caso->extracos && $caso->extracos()->exists()) {
            return self::FATORES_COMPLEXIDADE['com_pericia'];
        }

        // Default to medium complexity
        return self::FATORES_COMPLEXIDADE['media'];
    }

    /**
     * Get factor 5: Case Stage
     */
    protected function obterFatorEstagio(Caso $caso, ?float $override): float
    {
        if ($override !== null) {
            return $override;
        }

        $status = strtolower($caso->status ?? 'em_andamento');
        return self::FATORES_ESTAGIO[$status] ?? 1.0;
    }

    /**
     * Get all factor tables
     */
    public function obterTabelaFatores(): array
    {
        return [
            'fator_1_tipo_processo' => self::FATORES_TIPO_PROCESSO,
            'fator_2_juiz' => self::FATORES_JUIZ,
            'fator_3_vara' => self::FATORES_VARA,
            'fator_4_complexidade' => self::FATORES_COMPLEXIDADE,
            'fator_5_estagio' => self::FATORES_ESTAGIO,
        ];
    }

    /**
     * Get base value
     */
    public function obterValorBase(): float
    {
        return self::VALOR_BASE;
    }

    /**
     * Validate factor value is within reasonable range
     */
    public function validarFator(float $valor): bool
    {
        return $valor >= 0.1 && $valor <= 3.0;
    }
}
