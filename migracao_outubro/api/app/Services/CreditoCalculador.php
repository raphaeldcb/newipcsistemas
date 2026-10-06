<?php

namespace App\Services;

use App\Models\Caso;

class CreditoCalculador
{
    // Base value for all credits
    private const VALOR_BASE = 1000.00;

    // Type factors (tipo_proceso)
    private const FATORES_TIPO = [
        'Cível' => 1.0,
        'Criminal' => 1.2,
        'Família' => 0.8,
        'Trabalhista' => 1.1,
        'Administrativo' => 0.9,
    ];

    // Judge factors (by experience, position)
    private const FATORES_JUIZ = [
        'Titular' => 1.0,
        'Substituto' => 0.8,
        'Conciliador' => 0.6,
        'Árbitra' => 1.2,
    ];

    // Court factors (by location, complexity)
    private const FATORES_VARA = [
        'Vara Criminal' => 1.0,
        'Vara Cível' => 1.1,
        'JEC' => 0.7,
        'JRIM' => 0.9,
        'Tribunal' => 1.3,
    ];

    // Category factors (by result, complexity)
    private const FATORES_CATEGORIA = [
        'Simples' => 0.8,
        'Média' => 1.0,
        'Complexa' => 1.3,
        'Altamente Complexa' => 1.5,
        'Com Perícia' => 1.4,
    ];

    public function calcular(Caso $caso): float
    {
        // Aplicar 5-factor calculation
        $fatorTipo = $this->obterFatorTipo($caso);
        $fatorJuiz = $this->obterFatorJuiz($caso);
        $fatorVara = $this->obterFatorVara($caso);
        $fatorCategoria = $this->obterFatorCategoria($caso);

        $valor = self::VALOR_BASE
            * $fatorTipo
            * $fatorJuiz
            * $fatorVara
            * $fatorCategoria;

        // Arredondar para 2 casas decimais
        return round($valor, 2);
    }

    protected function obterFatorTipo(Caso $caso): float
    {
        // TODO: buscar tipo_processo do caso
        $tipo = $caso->tipo_processo ?? 'Cível';
        return self::FATORES_TIPO[$tipo] ?? 1.0;
    }

    protected function obterFatorJuiz(Caso $caso): float
    {
        // TODO: buscar posição/experiência do juiz
        if (!$caso->jui_cod) return 1.0;

        $juiz = $caso->juiz;
        if (!$juiz) return 1.0;

        $posicao = $juiz->posicao ?? 'Titular';
        return self::FATORES_JUIZ[$posicao] ?? 1.0;
    }

    protected function obterFatorVara(Caso $caso): float
    {
        // TODO: buscar vara/tribunal
        if (!$caso->var_cod) return 1.0;

        $vara = $caso->vara;
        if (!$vara) return 1.0;

        $tipo = $vara->descricao ?? 'Vara Cível';
        return self::FATORES_VARA[$tipo] ?? 1.0;
    }

    protected function obterFatorCategoria(Caso $caso): float
    {
        // TODO: avaliar complexidade do caso
        // Por enquanto: usar categoria padrão

        // Heurística simples: verificar se tem perícia
        $temPericia = $caso->extracos()->exists();

        if ($temPericia) {
            return self::FATORES_CATEGORIA['Com Perícia']; // 1.4
        }

        return self::FATORES_CATEGORIA['Média']; // 1.0
    }

    public function obterTabelaFatores(): array
    {
        return [
            'tipos' => self::FATORES_TIPO,
            'juizes' => self::FATORES_JUIZ,
            'varas' => self::FATORES_VARA,
            'categorias' => self::FATORES_CATEGORIA,
        ];
    }

    public function obterValorBase(): float
    {
        return self::VALOR_BASE;
    }
}
