<?php

namespace Database\Factories;

use App\Models\Caso;
use App\Enums\CasoStatus;
use Illuminate\Database\Eloquent\Factories\Factory;

class CasoFactory extends Factory
{
    protected $model = Caso::class;

    public function definition(): array
    {
        return [
            'pro_numero' => $this->faker->unique()->numerify('####/####'),
            'cas_status' => CasoStatus::PENDENTE->value,
            'jui_cod' => $this->faker->numberBetween(1, 100),
            'var_cod' => $this->faker->numberBetween(1, 50),
            'responsavel_id' => null,
            'coletador_id' => null,
            'medico_id' => null,
            'data_ajuizamento' => $this->faker->dateTime(),
        ];
    }

    public function emColeta(): self
    {
        return $this->state([
            'cas_status' => CasoStatus::COLETA_AGENDADA->value,
            'responsavel_id' => 1,
            'coletador_id' => 1,
        ]);
    }

    public function finalizado(): self
    {
        return $this->state([
            'cas_status' => CasoStatus::CASO_FINALIZADO->value,
            'responsavel_id' => 1,
            'coletador_id' => 1,
            'medico_id' => 1,
        ]);
    }

    public function cancelado(): self
    {
        return $this->state([
            'cas_status' => CasoStatus::CANCELADO->value,
        ]);
    }
}
