<?php

namespace Tests\Unit\Services;

use Tests\TestCase;
use App\Models\Alelo;
use App\Models\Extracao;
use App\Services\AleloService;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Exception;

class AleloServiceTest extends TestCase
{
    use RefreshDatabase;

    protected AleloService $service;

    protected function setUp(): void
    {
        parent::setUp();
        $this->service = app(AleloService::class);
    }

    public function test_registrar_alelos(): void
    {
        $extracao = Extracao::factory()->create();

        $alelos = [
            [
                'tipo_alelo' => 'STR',
                'marcador' => 'D8S1179',
                'alelo1' => '13',
                'alelo2' => '15',
                'frequencia_alelo1' => 0.15,
            ],
            [
                'tipo_alelo' => 'STR',
                'marcador' => 'D21S11',
                'alelo1' => '29',
                'alelo2' => '30',
            ],
        ];

        $result = $this->service->registrarAlelos($extracao->ext_cod, $alelos);

        $this->assertCount(2, $result);
        $this->assertEquals('D8S1179', $result[0]->marcador);
        $this->assertEquals('D21S11', $result[1]->marcador);
    }

    public function test_validar_alelo_invalido(): void
    {
        $extracao = Extracao::factory()->create();

        $alelos = [
            [
                'tipo_alelo' => 'INVALIDO',
                'marcador' => 'D8S1179',
                'alelo1' => '13',
                'alelo2' => '15',
            ],
        ];

        $this->expectException(Exception::class);
        $this->expectExceptionMessage('Tipo de alelo inválido');

        $this->service->registrarAlelos($extracao->ext_cod, $alelos);
    }

    public function test_validar_frequencia(): void
    {
        $extracao = Extracao::factory()->create();

        $alelos = [
            [
                'tipo_alelo' => 'STR',
                'marcador' => 'D8S1179',
                'alelo1' => '13',
                'frequencia_alelo1' => 1.5, // Inválido: > 1
            ],
        ];

        $this->expectException(Exception::class);
        $this->expectExceptionMessage('entre 0 e 1');

        $this->service->registrarAlelos($extracao->ext_cod, $alelos);
    }

    public function test_comparar_alelos_match(): void
    {
        $extracao1 = Extracao::factory()->create();
        $extracao2 = Extracao::factory()->create();

        Alelo::factory()->create([
            'extracao_id' => $extracao1->ext_cod,
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'alelo2' => '15',
        ]);

        Alelo::factory()->create([
            'extracao_id' => $extracao2->ext_cod,
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'alelo2' => '15',
        ]);

        $comparacao = $this->service->compararAlelos($extracao1->ext_cod, $extracao2->ext_cod);

        $this->assertEquals(1, $comparacao['matches']);
        $this->assertEquals(100.0, $comparacao['percentual_match']);
    }

    public function test_comparar_alelos_mismatch(): void
    {
        $extracao1 = Extracao::factory()->create();
        $extracao2 = Extracao::factory()->create();

        Alelo::factory()->create([
            'extracao_id' => $extracao1->ext_cod,
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'alelo2' => '15',
        ]);

        Alelo::factory()->create([
            'extracao_id' => $extracao2->ext_cod,
            'marcador' => 'D8S1179',
            'alelo1' => '14',
            'alelo2' => '16',
        ]);

        $comparacao = $this->service->compararAlelos($extracao1->ext_cod, $extracao2->ext_cod);

        $this->assertEquals(0, $comparacao['matches']);
        $this->assertEquals(0.0, $comparacao['percentual_match']);
    }

    public function test_comparar_alelos_ordem_inversida(): void
    {
        $extracao1 = Extracao::factory()->create();
        $extracao2 = Extracao::factory()->create();

        Alelo::factory()->create([
            'extracao_id' => $extracao1->ext_cod,
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'alelo2' => '15',
        ]);

        Alelo::factory()->create([
            'extracao_id' => $extracao2->ext_cod,
            'marcador' => 'D8S1179',
            'alelo1' => '15',
            'alelo2' => '13', // ordem invertida
        ]);

        $comparacao = $this->service->compararAlelos($extracao1->ext_cod, $extracao2->ext_cod);

        $this->assertEquals(1, $comparacao['matches']);
    }

    public function test_obter_por_extracao(): void
    {
        $extracao = Extracao::factory()->create();
        Alelo::factory()->count(3)->create(['extracao_id' => $extracao->ext_cod]);

        $alelos = $this->service->obterPorExtracao($extracao->ext_cod);

        $this->assertCount(3, $alelos);
    }

    public function test_obter_por_marcador(): void
    {
        Alelo::factory()->count(5)->create(['marcador' => 'D8S1179']);
        Alelo::factory()->count(2)->create(['marcador' => 'D21S11']);

        $alelos = $this->service->obterPorMarcador('D8S1179');

        $this->assertCount(5, $alelos);
    }

    public function test_contagem_por_tipo(): void
    {
        Alelo::factory()->count(5)->create(['tipo_alelo' => 'STR']);
        Alelo::factory()->count(3)->create(['tipo_alelo' => 'SNP']);

        $contagem = $this->service->contagemPorTipo();

        $this->assertCount(2, $contagem);
    }

    public function test_obter_marcadores_unicos(): void
    {
        Alelo::factory()->create(['marcador' => 'D8S1179']);
        Alelo::factory()->create(['marcador' => 'D21S11']);
        Alelo::factory()->create(['marcador' => 'D8S1179']); // repetido

        $marcadores = $this->service->obterMarcadoresUnicos();

        $this->assertCount(2, $marcadores);
        $this->assertContains('D8S1179', $marcadores);
        $this->assertContains('D21S11', $marcadores);
    }

    public function test_calcular_frequencia(): void
    {
        Alelo::factory()->create([
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'alelo2' => '15',
        ]);
        Alelo::factory()->create([
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'alelo2' => '14',
        ]);

        $frequencia = $this->service->calcularFrequenciaAleloPopulacao('D8S1179', '13');

        // 2 ocorrências de '13' em 4 alelos totais = 0.5
        $this->assertEquals(0.5, $frequencia);
    }

    public function test_alelo_homozigoto(): void
    {
        $extracao = Extracao::factory()->create();

        $alelos = [
            [
                'tipo_alelo' => 'STR',
                'marcador' => 'D8S1179',
                'alelo1' => '13',
                'alelo2' => '13',
            ],
        ];

        $result = $this->service->registrarAlelos($extracao->ext_cod, $alelos);

        $this->assertEquals('13', $result[0]->alelo1);
        $this->assertEquals('13', $result[0]->alelo2);
    }
}
