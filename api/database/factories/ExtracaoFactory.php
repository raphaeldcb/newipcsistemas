<?php

namespace Database\Factories;

use App\Models\Extracao;
use App\Models\Caso;
use Illuminate\Database\Eloquent\Factories\Factory;

class ExtracaoFactory extends Factory
{
    protected $model = Extracao::class;

    public function definition(): array
    {
        $status_options = ['EXTRACAO', 'AMPLIFICACAO', 'SEQUENCIAMENTO', 'CONCLUIDA', 'FALHA'];

        return [
            'caso_id' => Caso::factory(),
            'status' => $this->faker->randomElement($status_options),
            'fase' => 'SEQUENCIAMENTO',
            'data_inicio' => $this->faker->dateTimeThisMonth(),
            'data_fim' => $this->faker->boolean(70) ? $this->faker->dateTimeThisMonth() : null,
            'tecnico_id' => null,
            'validador_id' => null,
            'resultado_json' => null,
        ];
    }

    public function concluida(): self
    {
        return $this->state([
            'status' => 'CONCLUIDA',
            'data_fim' => now(),
        ]);
    }

    public function emProgresso(): self
    {
        return $this->state([
            'status' => 'SEQUENCIAMENTO',
        ]);
    }

    public function comFalha(): self
    {
        return $this->state([
            'status' => 'FALHA',
            'data_fim' => now(),
        ]);
    }
}
