<?php

namespace Tests\Unit\Services;

use Tests\TestCase;
use App\Models\Scei;
use App\Services\SceiService;
use App\Enums\SceiFase;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Exception;

class SceiServiceTest extends TestCase
{
    use RefreshDatabase;

    protected SceiService $service;

    protected function setUp(): void
    {
        parent::setUp();
        $this->service = app(SceiService::class);
    }

    public function test_criar_batch_exames(): void
    {
        $exames = [
            ['tipo_exame' => 'HIV'],
            ['tipo_exame' => 'Hepatite'],
        ];

        $result = $this->service->criarBatch(
            casoId: 1,
            exames: $exames,
            dataColeta: '2026-10-01',
            responsavelId: 1
        );

        $this->assertCount(2, $result);
        $this->assertEquals('HIV', $result[0]->tipo_exame);
        $this->assertEquals('Hepatite', $result[1]->tipo_exame);
    }

    public function test_valor_exame_tabela(): void
    {
        $exames = [
            ['tipo_exame' => 'HIV'],
            ['tipo_exame' => 'Malária'],
            ['tipo_exame' => 'Outro'],
        ];

        $result = $this->service->criarBatch(1, $exames, '2026-10-01');

        $this->assertEquals(150.00, $result[0]->valor_exame); // HIV
        $this->assertEquals(90.00, $result[1]->valor_exame); // Malária
        $this->assertEquals(50.00, $result[2]->valor_exame); // Outro
    }

    public function test_registrar_fase_pendente_para_amostra(): void
    {
        $scei = Scei::factory()->create([
            'scei_fase' => SceiFase::PENDENTE->value,
        ]);

        $result = $this->service->registrarFase(
            $scei,
            SceiFase::AMOSTRA_RECEBIDA->value
        );

        $this->assertTrue($result);
        $this->assertEquals(SceiFase::AMOSTRA_RECEBIDA->value, $scei->fresh()->scei_fase);
    }

    public function test_registrar_resultado_exame(): void
    {
        $scei = Scei::factory()->create([
            'scei_fase' => SceiFase::EM_ANALISE->value,
        ]);

        $this->service->registrarFase(
            $scei,
            SceiFase::RESULTADO_LIBERADO->value,
            [
                'valor' => 'Negativo',
                'referencia' => 'Não reator',
                'unidade' => 'U/mL',
            ]
        );

        $scei->refresh();
        $this->assertEquals('Negativo', $scei->resultado_valor);
        $this->assertEquals('Não reator', $scei->resultado_referencia);
        $this->assertEquals('U/mL', $scei->resultado_unidade);
    }

    public function test_registrar_laudo(): void
    {
        $scei = Scei::factory()->create([
            'scei_fase' => SceiFase::RESULTADO_LIBERADO->value,
        ]);

        $this->service->registrarFase(
            $scei,
            SceiFase::LAUDO_EMITIDO->value,
            [
                'valor' => 'Negativo',
                'referencia' => 'Não reator',
            ]
        );

        $scei->refresh();
        $this->assertEquals('emitido', $scei->status_laudo);
        $this->assertNotNull($scei->data_laudo);
    }

    public function test_cancelar_exame(): void
    {
        $scei = Scei::factory()->create([
            'scei_fase' => SceiFase::EM_ANALISE->value,
        ]);

        $this->service->registrarFase(
            $scei,
            SceiFase::CANCELADO->value,
            null,
            'Amostra contaminada'
        );

        $scei->refresh();
        $this->assertEquals(SceiFase::CANCELADO->value, $scei->scei_fase);
        $this->assertEquals('Amostra contaminada', $scei->motivo_cancelamento);
    }

    public function test_transicao_invalida(): void
    {
        $scei = Scei::factory()->create([
            'scei_fase' => SceiFase::LAUDO_FINALIZADO->value,
        ]);

        $this->expectException(Exception::class);
        $this->expectExceptionMessage('Transição inválida');

        $this->service->registrarFase($scei, SceiFase::PENDENTE->value);
    }

    public function test_resultado_sem_valor(): void
    {
        $scei = Scei::factory()->create([
            'scei_fase' => SceiFase::EM_ANALISE->value,
        ]);

        $this->expectException(Exception::class);
        $this->expectExceptionMessage('Resultado requer valor');

        $this->service->registrarFase(
            $scei,
            SceiFase::RESULTADO_LIBERADO->value,
            [] // sem valor
        );
    }

    public function test_obter_por_caso(): void
    {
        Scei::factory()->count(3)->create(['caso_id' => 1]);
        Scei::factory()->count(2)->create(['caso_id' => 2]);

        $exames = $this->service->obterPorCaso(1);

        $this->assertCount(3, $exames);
    }

    public function test_soma_valores_exames(): void
    {
        Scei::factory()->create(['caso_id' => 1, 'valor_exame' => 150.00]);
        Scei::factory()->create(['caso_id' => 1, 'valor_exame' => 120.00]);

        $soma = $this->service->somaValoresExames(1);

        $this->assertEquals(270.00, $soma);
    }

    public function test_contagem_por_fase(): void
    {
        Scei::factory()->count(5)->create(['scei_fase' => SceiFase::PENDENTE->value]);
        Scei::factory()->count(3)->create(['scei_fase' => SceiFase::EM_ANALISE->value]);

        $contagem = $this->service->contagemPorFase();

        $this->assertGreaterThan(0, count($contagem));
    }

    public function test_workflow_completo(): void
    {
        $scei = Scei::factory()->create([
            'scei_fase' => SceiFase::PENDENTE->value,
        ]);

        // Amostra
        $this->service->registrarFase($scei, SceiFase::AMOSTRA_RECEBIDA->value);
        $scei->refresh();
        $this->assertEquals(SceiFase::AMOSTRA_RECEBIDA->value, $scei->scei_fase);

        // Análise
        $this->service->registrarFase($scei, SceiFase::EM_ANALISE->value);
        $scei->refresh();
        $this->assertEquals(SceiFase::EM_ANALISE->value, $scei->scei_fase);

        // Resultado
        $this->service->registrarFase(
            $scei,
            SceiFase::RESULTADO_LIBERADO->value,
            ['valor' => 'Negativo']
        );
        $scei->refresh();
        $this->assertEquals(SceiFase::RESULTADO_LIBERADO->value, $scei->scei_fase);

        // Laudo
        $this->service->registrarFase(
            $scei,
            SceiFase::LAUDO_EMITIDO->value,
            ['valor' => 'Negativo', 'referencia' => 'OK']
        );
        $scei->refresh();
        $this->assertEquals(SceiFase::LAUDO_EMITIDO->value, $scei->scei_fase);

        // Finalizado
        $this->service->registrarFase($scei, SceiFase::LAUDO_FINALIZADO->value);
        $scei->refresh();
        $this->assertEquals(SceiFase::LAUDO_FINALIZADO->value, $scei->scei_fase);
    }
}
