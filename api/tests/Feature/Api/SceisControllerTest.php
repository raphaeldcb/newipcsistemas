<?php

namespace Tests\Feature\Api;

use Tests\TestCase;
use App\Models\User;
use App\Models\Scei;
use App\Enums\SceiFase;
use Illuminate\Foundation\Testing\RefreshDatabase;

class SceisControllerTest extends TestCase
{
    use RefreshDatabase;

    protected User $user;

    protected function setUp(): void
    {
        parent::setUp();
        $this->user = User::factory()->create();
    }

    public function test_list_exames(): void
    {
        Scei::factory()->count(5)->create();

        $response = $this->actingAs($this->user)->getJson('/api/v1/sceis');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    '*' => ['id', 'caso_id', 'tipo_exame', 'fase_atual', 'fase_label']
                ],
            ]);
    }

    public function test_create_batch_exames(): void
    {
        $data = [
            'caso_id' => 1,
            'exames' => [
                ['tipo_exame' => 'HIV'],
                ['tipo_exame' => 'Hepatite'],
            ],
            'data_coleta' => '2026-10-01',
            'responsavel_id' => 1,
        ];

        $response = $this->actingAs($this->user)
            ->postJson('/api/v1/sceis', $data);

        $response->assertStatus(201)
            ->assertJsonPath('message', '2 exame(s) criado(s)')
            ->assertJsonPath('data.0.tipo_exame', 'HIV')
            ->assertJsonPath('data.1.tipo_exame', 'Hepatite');

        $this->assertDatabaseHas('tb_scei', [
            'caso_id' => 1,
            'tipo_exame' => 'HIV',
            'scei_fase' => SceiFase::PENDENTE->value,
        ]);
    }

    public function test_show_exame(): void
    {
        $scei = Scei::factory()->create();

        $response = $this->actingAs($this->user)
            ->getJson("/api/v1/sceis/{$scei->scei_cod}");

        $response->assertStatus(200)
            ->assertJsonPath('data.id', $scei->scei_cod);
    }

    public function test_delete_exame(): void
    {
        $scei = Scei::factory()->create();

        $response = $this->actingAs($this->user)
            ->deleteJson("/api/v1/sceis/{$scei->scei_cod}");

        $response->assertStatus(204);
        $this->assertSoftDeleted('tb_scei', ['scei_cod' => $scei->scei_cod]);
    }

    public function test_registrar_fase_amostra_recebida(): void
    {
        $scei = Scei::factory()->create([
            'scei_fase' => SceiFase::PENDENTE->value,
        ]);

        $response = $this->actingAs($this->user)
            ->postJson("/api/v1/sceis/{$scei->scei_cod}/registrar-fase", [
                'nova_fase' => SceiFase::AMOSTRA_RECEBIDA->value,
            ]);

        $response->assertStatus(200)
            ->assertJsonPath('data.fase_atual', SceiFase::AMOSTRA_RECEBIDA->value);
    }

    public function test_registrar_resultado(): void
    {
        $scei = Scei::factory()->create([
            'scei_fase' => SceiFase::EM_ANALISE->value,
        ]);

        $response = $this->actingAs($this->user)
            ->postJson("/api/v1/sceis/{$scei->scei_cod}/registrar-fase", [
                'nova_fase' => SceiFase::RESULTADO_LIBERADO->value,
                'resultado' => [
                    'valor' => 'Negativo',
                    'referencia' => 'Não reator',
                    'unidade' => 'U/mL',
                ],
            ]);

        $response->assertStatus(200)
            ->assertJsonPath('data.resultado_valor', 'Negativo');
    }

    public function test_workflow_pendente_a_finalizado(): void
    {
        $scei = Scei::factory()->create([
            'scei_fase' => SceiFase::PENDENTE->value,
        ]);

        // Amostra Recebida
        $this->actingAs($this->user)
            ->postJson("/api/v1/sceis/{$scei->scei_cod}/registrar-fase", [
                'nova_fase' => SceiFase::AMOSTRA_RECEBIDA->value,
            ])->assertStatus(200);

        // Em Análise
        $scei->refresh();
        $this->actingAs($this->user)
            ->postJson("/api/v1/sceis/{$scei->scei_cod}/registrar-fase", [
                'nova_fase' => SceiFase::EM_ANALISE->value,
            ])->assertStatus(200);

        // Resultado Liberado
        $scei->refresh();
        $this->actingAs($this->user)
            ->postJson("/api/v1/sceis/{$scei->scei_cod}/registrar-fase", [
                'nova_fase' => SceiFase::RESULTADO_LIBERADO->value,
                'resultado' => ['valor' => 'Negativo'],
            ])->assertStatus(200);

        // Laudo Emitido
        $scei->refresh();
        $this->actingAs($this->user)
            ->postJson("/api/v1/sceis/{$scei->scei_cod}/registrar-fase", [
                'nova_fase' => SceiFase::LAUDO_EMITIDO->value,
                'resultado' => [
                    'valor' => 'Negativo',
                    'referencia' => 'Não reator',
                ],
            ])->assertStatus(200);

        // Laudo Finalizado
        $scei->refresh();
        $response = $this->actingAs($this->user)
            ->postJson("/api/v1/sceis/{$scei->scei_cod}/registrar-fase", [
                'nova_fase' => SceiFase::LAUDO_FINALIZADO->value,
            ])->assertStatus(200);

        $scei->refresh();
        $this->assertEquals(SceiFase::LAUDO_FINALIZADO->value, $scei->scei_fase);
    }

    public function test_cancelar_exame(): void
    {
        $scei = Scei::factory()->create([
            'scei_fase' => SceiFase::EM_ANALISE->value,
        ]);

        $response = $this->actingAs($this->user)
            ->postJson("/api/v1/sceis/{$scei->scei_cod}/registrar-fase", [
                'nova_fase' => SceiFase::CANCELADO->value,
                'motivo_cancelamento' => 'Amostra contaminada',
            ]);

        $response->assertStatus(200)
            ->assertJsonPath('data.fase_atual', SceiFase::CANCELADO->value);
    }

    public function test_por_caso(): void
    {
        Scei::factory()->count(3)->create(['caso_id' => 1]);
        Scei::factory()->count(2)->create(['caso_id' => 2]);

        $response = $this->actingAs($this->user)
            ->postJson('/api/v1/sceis/por-caso', ['caso_id' => 1]);

        $response->assertStatus(200)
            ->assertJsonPath('quantidade_exames', 3);
    }

    public function test_contagem_por_fase(): void
    {
        Scei::factory()->count(5)->create(['scei_fase' => SceiFase::PENDENTE->value]);
        Scei::factory()->count(3)->create(['scei_fase' => SceiFase::EM_ANALISE->value]);

        $response = $this->actingAs($this->user)
            ->getJson('/api/v1/sceis/contagem-por-fase');

        $response->assertStatus(200)
            ->assertJsonPath('total_exames', 8);
    }

    public function test_em_analise(): void
    {
        Scei::factory()->create(['scei_fase' => SceiFase::AMOSTRA_RECEBIDA->value]);
        Scei::factory()->create(['scei_fase' => SceiFase::EM_ANALISE->value]);
        Scei::factory()->create(['scei_fase' => SceiFase::PENDENTE->value]);

        $response = $this->actingAs($this->user)
            ->getJson('/api/v1/sceis/em-analise');

        $response->assertStatus(200)
            ->assertJsonPath('quantidade_em_analise', 2);
    }

    public function test_estados_validos(): void
    {
        $scei = Scei::factory()->create([
            'scei_fase' => SceiFase::PENDENTE->value,
        ]);

        $response = $this->actingAs($this->user)
            ->getJson("/api/v1/sceis/{$scei->scei_cod}/estados-validos");

        $response->assertStatus(200)
            ->assertJsonStructure([
                'fase_atual' => ['id', 'label'],
                'estados_possiveis' => [
                    '*' => ['fase_id', 'fase_label'],
                ],
            ]);
    }
}
