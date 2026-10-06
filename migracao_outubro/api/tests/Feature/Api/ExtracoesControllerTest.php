<?php

namespace Tests\Feature\Api;

use Tests\TestCase;
use App\Models\User;
use App\Models\Extracao;
use App\Enums\ExtracacaoFase;
use Illuminate\Foundation\Testing\RefreshDatabase;

class ExtracoesControllerTest extends TestCase
{
    use RefreshDatabase;

    protected User $user;

    protected function setUp(): void
    {
        parent::setUp();
        $this->user = User::factory()->create();
    }

    public function test_list_extracos(): void
    {
        Extracao::factory()->count(5)->create();

        $response = $this->actingAs($this->user)->getJson('/api/v1/extracos');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    '*' => ['id', 'caso_id', 'amostra_tipo', 'fase_atual', 'fase_label']
                ],
            ]);
    }

    public function test_create_extracao(): void
    {
        $data = [
            'caso_id' => 1,
            'amostra_tipo' => 'Sangue',
            'volume_inicial' => 25.5,
            'unidade_volume' => 'mL',
            'data_coleta' => '2026-10-01',
            'responsavel_extracao_id' => 1,
        ];

        $response = $this->actingAs($this->user)
            ->postJson('/api/v1/extracos', $data);

        $response->assertStatus(201)
            ->assertJsonPath('data.amostra_tipo', 'Sangue')
            ->assertJsonPath('data.fase_atual', ExtracacaoFase::PENDENTE->value)
            ->assertJsonPath('data.fase_label', 'Pendente');
    }

    public function test_registrar_fase_extracao(): void
    {
        $extracao = Extracao::factory()->create([
            'ext_fase' => ExtracacaoFase::PENDENTE->value,
        ]);

        $response = $this->actingAs($this->user)
            ->postJson("/api/v1/extracos/{$extracao->ext_cod}/registrar-fase", [
                'nova_fase' => ExtracacaoFase::EXTRACAO_INICIADA->value,
                'responsavel_id' => 1,
            ]);

        $response->assertStatus(200)
            ->assertJsonPath('data.fase_atual', ExtracacaoFase::EXTRACAO_INICIADA->value);
    }

    public function test_registrar_fase_extracao_concluida_com_validacao(): void
    {
        $extracao = Extracao::factory()->create([
            'ext_fase' => ExtracacaoFase::EXTRACAO_INICIADA->value,
        ]);

        $response = $this->actingAs($this->user)
            ->postJson("/api/v1/extracos/{$extracao->ext_cod}/registrar-fase", [
                'nova_fase' => ExtracacaoFase::EXTRACAO_CONCLUIDA->value,
                'resultado_fase_anterior' => [
                    'concentracao' => 150.0,
                    'qualidade' => 1.85,
                ],
            ]);

        $response->assertStatus(200)
            ->assertJsonPath('data.fase_atual', ExtracacaoFase::EXTRACAO_CONCLUIDA->value)
            ->assertJsonPath('data.concentracao_dna', 150.0)
            ->assertJsonPath('data.qualidade_dna', 1.85);
    }

    public function test_registrar_fase_extracao_falha_validacao_concentracao(): void
    {
        $extracao = Extracao::factory()->create([
            'ext_fase' => ExtracacaoFase::EXTRACAO_INICIADA->value,
        ]);

        $response = $this->actingAs($this->user)
            ->postJson("/api/v1/extracos/{$extracao->ext_cod}/registrar-fase", [
                'nova_fase' => ExtracacaoFase::EXTRACAO_CONCLUIDA->value,
                'resultado_fase_anterior' => [
                    'concentracao' => 25.0,  // Abaixo de 50 ng/µL
                    'qualidade' => 1.85,
                ],
            ]);

        $response->assertStatus(422)
            ->assertJsonPath('message', 'Erro ao registrar fase');
    }

    public function test_workflow_3_fases(): void
    {
        $extracao = Extracao::factory()->create([
            'ext_fase' => ExtracacaoFase::PENDENTE->value,
        ]);

        // Fase 1: Extração
        $this->actingAs($this->user)
            ->postJson("/api/v1/extracos/{$extracao->ext_cod}/registrar-fase", [
                'nova_fase' => ExtracacaoFase::EXTRACAO_INICIADA->value,
            ])->assertStatus(200);

        $extracao->refresh();
        $this->actingAs($this->user)
            ->postJson("/api/v1/extracos/{$extracao->ext_cod}/registrar-fase", [
                'nova_fase' => ExtracacaoFase::EXTRACAO_CONCLUIDA->value,
                'resultado_fase_anterior' => [
                    'concentracao' => 200.0,
                    'qualidade' => 1.9,
                ],
            ])->assertStatus(200);

        // Fase 2: Amplificação
        $extracao->refresh();
        $this->actingAs($this->user)
            ->postJson("/api/v1/extracos/{$extracao->ext_cod}/registrar-fase", [
                'nova_fase' => ExtracacaoFase::AMPLIFICACAO_INICIADA->value,
            ])->assertStatus(200);

        $extracao->refresh();
        $this->actingAs($this->user)
            ->postJson("/api/v1/extracos/{$extracao->ext_cod}/registrar-fase", [
                'nova_fase' => ExtracacaoFase::AMPLIFICACAO_CONCLUIDA->value,
                'resultado_fase_anterior' => [
                    'valor1' => 'Banda presente',
                    'valor2' => '200bp ±5bp',
                ],
            ])->assertStatus(200);

        // Fase 3: Sequenciamento
        $extracao->refresh();
        $this->actingAs($this->user)
            ->postJson("/api/v1/extracos/{$extracao->ext_cod}/registrar-fase", [
                'nova_fase' => ExtracacaoFase::SEQUENCIAMENTO_INICIADO->value,
            ])->assertStatus(200);

        $extracao->refresh();
        $response = $this->actingAs($this->user)
            ->postJson("/api/v1/extracos/{$extracao->ext_cod}/registrar-fase", [
                'nova_fase' => ExtracacaoFase::SEQUENCIAMENTO_CONCLUIDO->value,
                'resultado_fase_anterior' => [
                    'qualidade' => 98.5,
                ],
            ])->assertStatus(200);

        $extracao->refresh();
        $this->assertEquals(ExtracacaoFase::SEQUENCIAMENTO_CONCLUIDO->value, $extracao->ext_fase);
    }

    public function test_progresso(): void
    {
        $extracao = Extracao::factory()->create([
            'ext_fase' => ExtracacaoFase::AMPLIFICACAO_CONCLUIDA->value,
        ]);

        $response = $this->actingAs($this->user)
            ->getJson("/api/v1/extracos/{$extracao->ext_cod}/progresso");

        $response->assertStatus(200)
            ->assertJsonPath('progresso.fase_numero', 2)
            ->assertJsonPath('progresso.percentual_completo', 66.66666666666666)
            ->assertJsonPath('progresso.fases_completas.fase_1_extracao', true)
            ->assertJsonPath('progresso.fases_completas.fase_2_amplificacao', true)
            ->assertJsonPath('progresso.fases_completas.fase_3_sequenciamento', false);
    }

    public function test_contagem_por_fase(): void
    {
        Extracao::factory()->count(5)->create(['ext_fase' => ExtracacaoFase::PENDENTE->value]);
        Extracao::factory()->count(3)->create(['ext_fase' => ExtracacaoFase::EXTRACAO_CONCLUIDA->value]);
        Extracao::factory()->count(2)->create(['ext_fase' => ExtracacaoFase::SEQUENCIAMENTO_CONCLUIDO->value]);

        $response = $this->actingAs($this->user)
            ->getJson('/api/v1/extracos/contagem-por-fase');

        $response->assertStatus(200)
            ->assertJsonPath('total_extracos', 10);

        $this->assertGreaterThan(0, count($response->json('por_fase')));
    }

    public function test_em_progresso(): void
    {
        Extracao::factory()->create(['ext_fase' => ExtracacaoFase::EXTRACAO_INICIADA->value]);
        Extracao::factory()->create(['ext_fase' => ExtracacaoFase::AMPLIFICACAO_INICIADA->value]);
        Extracao::factory()->create(['ext_fase' => ExtracacaoFase::PENDENTE->value]);

        $response = $this->actingAs($this->user)
            ->getJson('/api/v1/extracos/em-progresso');

        $response->assertStatus(200)
            ->assertJsonPath('quantidade_em_progresso', 2);
    }
}
