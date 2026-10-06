<?php

namespace Tests\Feature\Api;

use Tests\TestCase;
use App\Models\User;
use App\Models\Caso;
use App\Enums\CasoStatus;
use Illuminate\Foundation\Testing\RefreshDatabase;

class CasosControllerTest extends TestCase
{
    use RefreshDatabase;

    protected User $user;

    protected function setUp(): void
    {
        parent::setUp();
        $this->user = User::factory()->create();
    }

    public function test_list_casos(): void
    {
        Caso::factory()->count(5)->create();

        $response = $this->actingAs($this->user)->getJson('/api/v1/casos');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    '*' => ['id', 'processo_id', 'status', 'status_label']
                ],
            ]);
    }

    public function test_create_caso(): void
    {
        $data = [
            'pro_numero' => '0000123/2026',
            'jui_cod' => 1,
            'var_cod' => 1,
            'uf_sigla' => 'SP',
            'com_cod' => 1,
            'data_ajuizamento' => '2026-10-01',
            'responsavel_id' => 1,
        ];

        $response = $this->actingAs($this->user)
            ->postJson('/api/v1/casos', $data);

        $response->assertStatus(201)
            ->assertJsonPath('data.processo_id', '0000123/2026')
            ->assertJsonPath('data.status', CasoStatus::PENDENTE->value)
            ->assertJsonPath('data.status_label', 'Pendente');

        $this->assertDatabaseHas('tb_casos', [
            'pro_numero' => '0000123/2026',
            'cas_status' => CasoStatus::PENDENTE->value,
        ]);
    }

    public function test_show_caso(): void
    {
        $caso = Caso::factory()->create();

        $response = $this->actingAs($this->user)
            ->getJson("/api/v1/casos/{$caso->cas_contr}");

        $response->assertStatus(200)
            ->assertJsonPath('data.id', $caso->cas_contr);
    }

    public function test_update_caso(): void
    {
        $caso = Caso::factory()->create();

        $response = $this->actingAs($this->user)
            ->putJson("/api/v1/casos/{$caso->cas_contr}", [
                'observacoes' => 'Atualizado',
            ]);

        $response->assertStatus(200);
        $this->assertDatabaseHas('tb_casos', [
            'cas_contr' => $caso->cas_contr,
            'observacoes' => 'Atualizado',
        ]);
    }

    public function test_delete_caso(): void
    {
        $caso = Caso::factory()->create();

        $response = $this->actingAs($this->user)
            ->deleteJson("/api/v1/casos/{$caso->cas_contr}");

        $response->assertStatus(204);
        $this->assertSoftDeleted('tb_casos', ['cas_contr' => $caso->cas_contr]);
    }

    public function test_transicionar_pendente_to_coleta_agendada(): void
    {
        $caso = Caso::factory()->create([
            'cas_status' => CasoStatus::PENDENTE->value,
            'responsavel_id' => 1,
            'coletador_id' => 1,
        ]);

        $response = $this->actingAs($this->user)
            ->postJson("/api/v1/casos/{$caso->cas_contr}/transicionar", [
                'novo_status' => CasoStatus::COLETA_AGENDADA->value,
                'motivo' => 'Agendado para 10/10',
            ]);

        $response->assertStatus(200)
            ->assertJsonPath('data.status', CasoStatus::COLETA_AGENDADA->value);

        $this->assertDatabaseHas('tb_casos', [
            'cas_contr' => $caso->cas_contr,
            'cas_status' => CasoStatus::COLETA_AGENDADA->value,
        ]);
    }

    public function test_transicionar_invalid(): void
    {
        $caso = Caso::factory()->create([
            'cas_status' => CasoStatus::CASO_FINALIZADO->value,
        ]);

        $response = $this->actingAs($this->user)
            ->postJson("/api/v1/casos/{$caso->cas_contr}/transicionar", [
                'novo_status' => CasoStatus::PENDENTE->value,
            ]);

        $response->assertStatus(422)
            ->assertJsonPath('message', 'Erro na transição');
    }

    public function test_estados_validos(): void
    {
        $caso = Caso::factory()->create([
            'cas_status' => CasoStatus::PENDENTE->value,
        ]);

        $response = $this->actingAs($this->user)
            ->getJson("/api/v1/casos/{$caso->cas_contr}/estados-validos");

        $response->assertStatus(200)
            ->assertJsonStructure([
                'estado_atual' => ['id', 'label'],
                'estados_possiveis' => [
                    '*' => ['id', 'label'],
                ],
            ]);

        $this->assertGreaterThan(0, count($response->json('estados_possiveis')));
    }

    public function test_historico(): void
    {
        $caso = Caso::factory()->create();

        $response = $this->actingAs($this->user)
            ->getJson("/api/v1/casos/{$caso->cas_contr}/historico");

        $response->assertStatus(200)
            ->assertJsonStructure([
                'data',
                'links',
                'meta',
            ]);
    }
}
