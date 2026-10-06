<?php

namespace Tests\Feature\Api;

use Tests\TestCase;
use App\Models\User;
use App\Models\Credito;
use App\Models\Caso;
use App\Enums\CreditoStatus;
use Illuminate\Foundation\Testing\RefreshDatabase;

class CreditosControllerTest extends TestCase
{
    use RefreshDatabase;

    protected User $user;

    protected function setUp(): void
    {
        parent::setUp();
        $this->user = User::factory()->create();
    }

    public function test_list_creditos(): void
    {
        Credito::factory()->count(5)->create();

        $response = $this->actingAs($this->user)->getJson('/api/v1/creditos');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    '*' => ['id', 'caso_id', 'valor_total', 'status', 'status_label']
                ],
            ]);
    }

    public function test_show_credito(): void
    {
        $credito = Credito::factory()->create();

        $response = $this->actingAs($this->user)
            ->getJson("/api/v1/creditos/{$credito->id_credito}");

        $response->assertStatus(200)
            ->assertJsonPath('data.id', $credito->id_credito)
            ->assertJsonPath('data.valor_total', (float) $credito->cre_vlr);
    }

    public function test_registrar_pagamento(): void
    {
        $credito = Credito::factory()->create([
            'cre_vlr' => 1000.00,
            'cre_vlr_pago' => 0,
            'cre_status' => CreditoStatus::PENDENTE->value,
        ]);

        $response = $this->actingAs($this->user)
            ->postJson("/api/v1/creditos/{$credito->id_credito}/registrar-pagamento", [
                'valor' => 500.00,
                'forma_pagamento' => 'TED',
                'motivo' => 'Pagamento parcial',
            ]);

        $response->assertStatus(200)
            ->assertJsonPath('data.valor_pago', 500.00)
            ->assertJsonPath('data.status_label', 'Parcialmente Pago');
    }

    public function test_registrar_pagamento_completo(): void
    {
        $credito = Credito::factory()->create([
            'cre_vlr' => 1000.00,
            'cre_vlr_pago' => 500.00,
            'cre_status' => CreditoStatus::PARCIALMENTE_PAGO->value,
        ]);

        $response = $this->actingAs($this->user)
            ->postJson("/api/v1/creditos/{$credito->id_credito}/registrar-pagamento", [
                'valor' => 500.00,
            ]);

        $response->assertStatus(200)
            ->assertJsonPath('data.valor_pago', 1000.00)
            ->assertJsonPath('data.status_label', 'Pago');
    }

    public function test_cancelar_credito(): void
    {
        $credito = Credito::factory()->create([
            'cre_status' => CreditoStatus::PENDENTE->value,
        ]);

        $response = $this->actingAs($this->user)
            ->postJson("/api/v1/creditos/{$credito->id_credito}/cancelar", [
                'motivo' => 'Caso cancelado',
            ]);

        $response->assertStatus(200)
            ->assertJsonPath('data.status_label', 'Cancelado');
    }

    public function test_reverter_credito(): void
    {
        $credito = Credito::factory()->create([
            'cre_vlr' => 1000.00,
            'cre_vlr_pago' => 500.00,
            'cre_status' => CreditoStatus::PARCIALMENTE_PAGO->value,
        ]);

        $response = $this->actingAs($this->user)
            ->postJson("/api/v1/creditos/{$credito->id_credito}/reverter", [
                'motivo' => 'Erro no cálculo',
            ]);

        $response->assertStatus(200)
            ->assertJsonPath('data.valor_pago', 0)
            ->assertJsonPath('data.status_label', 'Revertido');
    }

    public function test_listar_parcelas(): void
    {
        $credito = Credito::factory()->has('parcelas', 3)->create();

        $response = $this->actingAs($this->user)
            ->getJson("/api/v1/creditos/{$credito->id_credito}/parcelas");

        $response->assertStatus(200)
            ->assertJsonPath('quantidade_parcelas', 3);
    }

    public function test_simular_calculo(): void
    {
        $caso = Caso::factory()->create();

        $response = $this->actingAs($this->user)
            ->postJson('/api/v1/creditos/simular', [
                'caso_id' => $caso->cas_contr,
            ]);

        $response->assertStatus(200)
            ->assertJsonStructure([
                'caso_id',
                'simulacao' => [
                    'valor_base',
                    'valor_final',
                    'multiplicador',
                    'tabelas',
                ],
            ]);
    }

    public function test_pendentes(): void
    {
        Credito::factory()->create([
            'cre_status' => CreditoStatus::PENDENTE->value,
            'data_geracao' => now()->subDays(10),
        ]);
        Credito::factory()->create([
            'cre_status' => CreditoStatus::PAGO->value,
        ]);

        $response = $this->actingAs($this->user)
            ->getJson('/api/v1/creditos/pendentes');

        $response->assertStatus(200)
            ->assertJsonPath('total_registros', 1);
    }

    public function test_atrasadas(): void
    {
        $credito = Credito::factory()->has('parcelas')->create();
        $credito->parcelas()->update([
            'par_data_vencimento' => now()->subDays(10),
            'par_status' => 'aberta',
        ]);

        $response = $this->actingAs($this->user)
            ->getJson('/api/v1/creditos/atrasadas');

        $response->assertStatus(200)
            ->assertJsonPath('total_parcelas_atrasadas', 3);
    }

    public function test_por_caso(): void
    {
        Credito::factory()->count(2)->create([
            'caso_id' => 1,
            'cre_vlr' => 1000.00,
        ]);

        $response = $this->actingAs($this->user)
            ->postJson('/api/v1/creditos/por-caso', ['caso_id' => 1]);

        $response->assertStatus(200)
            ->assertJsonPath('quantidade_creditos', 2)
            ->assertJsonPath('valor_total', 2000.00);
    }

    public function test_tabela_fatores(): void
    {
        $response = $this->actingAs($this->user)
            ->getJson('/api/v1/creditos/tabela-fatores');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'valor_base',
                'tabelas' => [
                    'tipos',
                    'juizes',
                    'varas',
                    'categorias',
                ],
            ]);
    }
}
