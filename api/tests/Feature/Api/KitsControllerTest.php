<?php

namespace Tests\Feature\Api;

use Tests\TestCase;
use App\Models\User;
use App\Models\Kit;
use App\Enums\KitStatus;
use Illuminate\Foundation\Testing\RefreshDatabase;

class KitsControllerTest extends TestCase
{
    use RefreshDatabase;

    protected User $user;

    protected function setUp(): void
    {
        parent::setUp();
        $this->user = User::factory()->create();
    }

    public function test_list_kits(): void
    {
        Kit::factory()->count(5)->create();

        $response = $this->actingAs($this->user)->getJson('/api/v1/kits');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    '*' => ['id', 'numero', 'tipo', 'status', 'status_label']
                ],
            ]);
    }

    public function test_create_kit(): void
    {
        $data = [
            'kit_numero' => 'KIT-001-2026',
            'kit_descricao' => 'Kit de coleta padrão',
            'kit_tipo' => 'Coleta',
            'kit_local' => 'Sala 101',
            'data_criacao' => '2026-10-01',
            'data_vencimento' => '2027-10-01',
        ];

        $response = $this->actingAs($this->user)
            ->postJson('/api/v1/kits', $data);

        $response->assertStatus(201)
            ->assertJsonPath('data.numero', 'KIT-001-2026')
            ->assertJsonPath('data.status', KitStatus::DISPONIVEL->value)
            ->assertJsonPath('data.status_label', 'Disponível');

        $this->assertDatabaseHas('tb_kits', [
            'kit_numero' => 'KIT-001-2026',
            'kit_status' => KitStatus::DISPONIVEL->value,
        ]);
    }

    public function test_show_kit(): void
    {
        $kit = Kit::factory()->create();

        $response = $this->actingAs($this->user)
            ->getJson("/api/v1/kits/{$kit->kit_cod}");

        $response->assertStatus(200)
            ->assertJsonPath('data.id', $kit->kit_cod);
    }

    public function test_update_kit(): void
    {
        $kit = Kit::factory()->create();

        $response = $this->actingAs($this->user)
            ->putJson("/api/v1/kits/{$kit->kit_cod}", [
                'kit_local' => 'Sala 205',
            ]);

        $response->assertStatus(200);
        $this->assertDatabaseHas('tb_kits', [
            'kit_cod' => $kit->kit_cod,
            'kit_local' => 'Sala 205',
        ]);
    }

    public function test_delete_kit(): void
    {
        $kit = Kit::factory()->create();

        $response = $this->actingAs($this->user)
            ->deleteJson("/api/v1/kits/{$kit->kit_cod}");

        $response->assertStatus(204);
        $this->assertSoftDeleted('tb_kits', ['kit_cod' => $kit->kit_cod]);
    }

    public function test_rastrear_kit_disponivel_para_em_uso(): void
    {
        $kit = Kit::factory()->create([
            'kit_status' => KitStatus::DISPONIVEL->value,
            'coletador_id' => 1,
        ]);

        $response = $this->actingAs($this->user)
            ->postJson("/api/v1/kits/{$kit->kit_cod}/rastrear", [
                'novo_status' => KitStatus::EM_USO->value,
                'local' => 'Campo - Bairro Centro',
                'motivo' => 'Coleta iniciada',
            ]);

        $response->assertStatus(200)
            ->assertJsonPath('data.status', KitStatus::EM_USO->value)
            ->assertJsonPath('data.status_label', 'Em Uso');

        $this->assertDatabaseHas('tb_kits', [
            'kit_cod' => $kit->kit_cod,
            'kit_status' => KitStatus::EM_USO->value,
            'kit_local' => 'Campo - Bairro Centro',
        ]);
    }

    public function test_rastrear_kit_sem_coletador(): void
    {
        $kit = Kit::factory()->create([
            'kit_status' => KitStatus::DISPONIVEL->value,
            'coletador_id' => null,
        ]);

        $response = $this->actingAs($this->user)
            ->postJson("/api/v1/kits/{$kit->kit_cod}/rastrear", [
                'novo_status' => KitStatus::EM_USO->value,
            ]);

        $response->assertStatus(422)
            ->assertJsonPath('message', 'Erro ao rastrear kit');
    }

    public function test_rastrear_transicao_invalida(): void
    {
        $kit = Kit::factory()->create([
            'kit_status' => KitStatus::DESCARTADO->value,
        ]);

        $response = $this->actingAs($this->user)
            ->postJson("/api/v1/kits/{$kit->kit_cod}/rastrear", [
                'novo_status' => KitStatus::DISPONIVEL->value,
            ]);

        $response->assertStatus(422);
    }

    public function test_rastreamento_completo(): void
    {
        $kit = Kit::factory()->create();

        $response = $this->actingAs($this->user)
            ->getJson("/api/v1/kits/{$kit->kit_cod}/rastreamento");

        $response->assertStatus(200)
            ->assertJsonStructure([
                'kit_id',
                'kit_numero',
                'status_atual',
                'local_atual',
                'data_ultima_movimentacao',
            ]);
    }

    public function test_estados_validos(): void
    {
        $kit = Kit::factory()->create([
            'kit_status' => KitStatus::DISPONIVEL->value,
        ]);

        $response = $this->actingAs($this->user)
            ->getJson("/api/v1/kits/{$kit->kit_cod}/estados-validos");

        $response->assertStatus(200)
            ->assertJsonStructure([
                'estado_atual' => ['id', 'label'],
                'estados_possiveis' => [
                    '*' => ['id', 'label'],
                ],
            ]);

        $this->assertGreaterThan(0, count($response->json('estados_possiveis')));
    }

    public function test_verificar_vencimentos(): void
    {
        // Kit vencido
        Kit::factory()->create([
            'data_vencimento' => now()->subDays(10),
            'kit_status' => KitStatus::DISPONIVEL->value,
        ]);

        // Kit não vencido
        Kit::factory()->create([
            'data_vencimento' => now()->addDays(30),
            'kit_status' => KitStatus::DISPONIVEL->value,
        ]);

        $response = $this->actingAs($this->user)
            ->getJson('/api/v1/kits/verificar-vencimentos');

        $response->assertStatus(200)
            ->assertJsonPath('data.total_vencidos', 1);
    }

    public function test_contagem_por_status(): void
    {
        Kit::factory()->count(3)->create(['kit_status' => KitStatus::DISPONIVEL->value]);
        Kit::factory()->count(2)->create(['kit_status' => KitStatus::EM_USO->value]);

        $response = $this->actingAs($this->user)
            ->getJson('/api/v1/kits/contagem-por-status');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'total_kits',
                'por_status' => [
                    '*' => ['status_id', 'status_label', 'quantidade'],
                ],
            ]);

        $this->assertEquals(5, $response->json('total_kits'));
    }
}
