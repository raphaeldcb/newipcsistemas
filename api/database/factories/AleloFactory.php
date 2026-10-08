<?php

namespace Database\Factories;

use App\Models\Alelo;
use App\Models\Extracao;
use Illuminate\Database\Eloquent\Factories\Factory;

class AleloFactory extends Factory
{
    protected $model = Alelo::class;

    public function definition(): array
    {
        $tipos_alelo = ['STR', 'SNP', 'mtDNA', 'Y-STR', 'AMELOGENINA'];
        $marcadores = ['D8S1179', 'D21S11', 'D7S820', 'CSF1PO', 'D3S1358', 'D13S317', 'D16S539'];
        $tipo = $this->faker->randomElement($tipos_alelo);
        $marcador = $this->faker->randomElement($marcadores);

        $alelo1 = $tipo === 'SNP'
            ? $this->faker->randomElement(['A', 'T', 'G', 'C'])
            : $this->faker->numberBetween(8, 20);

        $alelo2 = $this->faker->boolean(70)
            ? ($tipo === 'SNP'
                ? $this->faker->randomElement(['A', 'T', 'G', 'C'])
                : $this->faker->numberBetween(8, 20))
            : null;

        $genótipo = $alelo2 ? "$alelo1/$alelo2" : $alelo1;

        return [
            'extracao_id' => Extracao::factory(),
            'tipo_alelo' => $tipo,
            'marcador' => $marcador,
            'alelo1' => (string) $alelo1,
            'alelo2' => $alelo2 ? (string) $alelo2 : null,
            'genótipo' => $genótipo,
            'frequencia_alelo1' => $this->faker->boolean(60) ? $this->faker->randomFloat(4, 0, 1) : null,
            'frequencia_alelo2' => $alelo2 && $this->faker->boolean(60) ? $this->faker->randomFloat(4, 0, 1) : null,
            'observacoes' => $this->faker->boolean(40) ? $this->faker->paragraph() : null,
            'data_analise' => $this->faker->boolean(60) ? $this->faker->dateTime() : null,
        ];
    }

    public function str(): self
    {
        return $this->state([
            'tipo_alelo' => 'STR',
        ]);
    }

    public function snp(): self
    {
        return $this->state([
            'tipo_alelo' => 'SNP',
        ]);
    }

    public function comDataAnalise(): self
    {
        return $this->state([
            'data_analise' => now(),
        ]);
    }

    public function semAlelo2(): self
    {
        return $this->state([
            'alelo2' => null,
            'frequencia_alelo2' => null,
        ]);
    }
}
