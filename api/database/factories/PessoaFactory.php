<?php

namespace Database\Factories;

use App\Models\Pessoa;
use Illuminate\Database\Eloquent\Factories\Factory;

class PessoaFactory extends Factory
{
    protected $model = Pessoa::class;

    public function definition(): array
    {
        return [
            'pes_nome' => $this->faker->name(),
            'pes_iniciais' => strtoupper(substr($this->faker->firstName(), 0, 1)) . strtoupper(substr($this->faker->lastName(), 0, 1)),
            'pes_tdoc' => $this->faker->randomElement(['CPF', 'RG', 'CNH']),
            'pes_ndoc' => $this->faker->unique()->numerify('###########'),
            'pes_sexo' => $this->faker->randomElement(['M', 'F']),
            'pes_dtnas' => $this->faker->dateTimeBetween('-80 years', '-18 years'),
            'pes_lcnas' => $this->faker->city(),
            'pes_sit' => 1,
            'pro_cod' => null,
        ];
    }
}
