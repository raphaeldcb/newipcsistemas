<?php

namespace Tests\Unit\Services;

use Tests\TestCase;
use App\Models\Extracao;
use App\Services\ExtracacaoService;
use App\Enums\ExtracacaoFase;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Exception;

class ExtracacaoServiceTest extends TestCase
{
    use RefreshDatabase;

    protected ExtracacaoService $service;

    protected function setUp(): void
    {
        parent::setUp();
        $this->service = app(ExtracacaoService::class);
    }

    public function test_registrar_fase_pendente_para_extracao_iniciada(): void
    {
        $extracao = Extracao::factory()->create([
            'ext_fase' => ExtracacaoFase::PENDENTE->value,
        ]);

        $result = $this->service->registrarFase(
            $extracao,
            ExtracacaoFase::EXTRACAO_INICIADA->value
        );

        $this->assertTrue($result);
        $this->assertEquals(ExtracacaoFase::EXTRACAO_INICIADA->value, $extracao->fresh()->ext_fase);
    }

    public function test_registrar_fase_extracao_concluida_valida_concentracao(): void
    {
        $extracao = Extracao::factory()->create([
            'ext_fase' => ExtracacaoFase::EXTRACAO_INICIADA->value,
        ]);

        $this->service->registrarFase(
            $extracao,
            ExtracacaoFase::EXTRACAO_CONCLUIDA->value,
            [
                'concentracao' => 200.0,
                'qualidade' => 1.9,
            ]
        );

        $extracao->refresh();
        $this->assertEquals(200.0, $extracao->concentracao_dna);
        $this->assertEquals(1.9, $extracao->qualidade_dna);
    }

    public function test_registrar_fase_extracao_falha_concentracao_baixa(): void
    {
        $extracao = Extracao::factory()->create([
            'ext_fase' => ExtracacaoFase::EXTRACAO_INICIADA->value,
        ]);

        $this->expectException(Exception::class);
        $this->expectExceptionMessage('Concentração deve estar entre 50-500');

        $this->service->registrarFase(
            $extracao,
            ExtracacaoFase::EXTRACAO_CONCLUIDA->value,
            ['concentracao' => 25.0, 'qualidade' => 1.9]
        );
    }

    public function test_registrar_fase_extracao_falha_qualidade_baixa(): void
    {
        $extracao = Extracao::factory()->create([
            'ext_fase' => ExtracacaoFase::EXTRACAO_INICIADA->value,
        ]);

        $this->expectException(Exception::class);
        $this->expectExceptionMessage('Qualidade (A260/A280) deve ser ≥ 1.7');

        $this->service->registrarFase(
            $extracao,
            ExtracacaoFase::EXTRACAO_CONCLUIDA->value,
            ['concentracao' => 200.0, 'qualidade' => 1.5]
        );
    }

    public function test_registrar_fase_sequenciamento_valida_qualidade(): void
    {
        $extracao = Extracao::factory()->create([
            'ext_fase' => ExtracacaoFase::SEQUENCIAMENTO_INICIADO->value,
        ]);

        $this->service->registrarFase(
            $extracao,
            ExtracacaoFase::SEQUENCIAMENTO_CONCLUIDO->value,
            ['qualidade' => 97.5]
        );

        $extracao->refresh();
        $this->assertEquals(ExtracacaoFase::SEQUENCIAMENTO_CONCLUIDO->value, $extracao->ext_fase);
    }

    public function test_registrar_fase_sequenciamento_falha_qualidade_baixa(): void
    {
        $extracao = Extracao::factory()->create([
            'ext_fase' => ExtracacaoFase::SEQUENCIAMENTO_INICIADO->value,
        ]);

        $this->expectException(Exception::class);
        $this->expectExceptionMessage('Qualidade do sequenciamento deve ser ≥ 95%');

        $this->service->registrarFase(
            $extracao,
            ExtracacaoFase::SEQUENCIAMENTO_CONCLUIDO->value,
            ['qualidade' => 92.0]
        );
    }

    public function test_transicao_invalida(): void
    {
        $extracao = Extracao::factory()->create([
            'ext_fase' => ExtracacaoFase::SEQUENCIAMENTO_CONCLUIDO->value,
        ]);

        $this->expectException(Exception::class);
        $this->expectExceptionMessage('Transição inválida');

        $this->service->registrarFase(
            $extracao,
            ExtracacaoFase::PENDENTE->value
        );
    }

    public function test_obter_progresso(): void
    {
        $extracao = Extracao::factory()->create([
            'ext_fase' => ExtracacaoFase::AMPLIFICACAO_CONCLUIDA->value,
        ]);

        $progresso = $this->service->obterProgresso($extracao);

        $this->assertEquals(2, $progresso['fase_numero']);
        $this->assertEquals(66.66666666666666, $progresso['percentual_completo']);
        $this->assertTrue($progresso['fases_completas']['fase_1_extracao']);
        $this->assertTrue($progresso['fases_completas']['fase_2_amplificacao']);
        $this->assertFalse($progresso['fases_completas']['fase_3_sequenciamento']);
    }

    public function test_workflow_3_fases_sequencial(): void
    {
        $extracao = Extracao::factory()->create([
            'ext_fase' => ExtracacaoFase::PENDENTE->value,
        ]);

        // Fase 1: Extração
        $this->service->registrarFase($extracao, ExtracacaoFase::EXTRACAO_INICIADA->value);
        $this->service->registrarFase(
            $extracao,
            ExtracacaoFase::EXTRACAO_CONCLUIDA->value,
            ['concentracao' => 200.0, 'qualidade' => 1.9]
        );
        $extracao->refresh();
        $this->assertEquals(1, $this->service->obterProgresso($extracao)['fase_numero']);

        // Fase 2: Amplificação
        $this->service->registrarFase($extracao, ExtracacaoFase::AMPLIFICACAO_INICIADA->value);
        $this->service->registrarFase(
            $extracao,
            ExtracacaoFase::AMPLIFICACAO_CONCLUIDA->value,
            ['valor1' => 'OK']
        );
        $extracao->refresh();
        $this->assertEquals(2, $this->service->obterProgresso($extracao)['fase_numero']);

        // Fase 3: Sequenciamento
        $this->service->registrarFase($extracao, ExtracacaoFase::SEQUENCIAMENTO_INICIADO->value);
        $this->service->registrarFase(
            $extracao,
            ExtracacaoFase::SEQUENCIAMENTO_CONCLUIDO->value,
            ['qualidade' => 98.0]
        );
        $extracao->refresh();
        $this->assertEquals(3, $this->service->obterProgresso($extracao)['fase_numero']);
    }

    public function test_contar_por_fase(): void
    {
        Extracao::factory()->count(5)->create(['ext_fase' => ExtracacaoFase::PENDENTE->value]);
        Extracao::factory()->count(3)->create(['ext_fase' => ExtracacaoFase::EXTRACAO_CONCLUIDA->value]);

        $contagem = $this->service->contarPorFase();

        $this->assertGreaterThan(0, count($contagem));
        $this->assertArrayHasKey('fase_id', $contagem[0]);
        $this->assertArrayHasKey('quantidade', $contagem[0]);
    }
}
