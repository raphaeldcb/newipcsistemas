<?php

namespace Tests\Feature\Api;

use App\Models\User;
use App\Models\Comunicacao;
use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;

class ComunicacoesTest extends TestCase
{
    use RefreshDatabase;

    protected User $user;

    protected function setUp(): void
    {
        parent::setUp();
        $this->user = User::factory()->create(['role' => 'user']);
    }

    /** @test */
    public function pode_listar_comunicacoes()
    {
        Comunicacao::factory()->count(5)->create();

        $response = $this->actingAs($this->user, 'sanctum')
            ->getJson('/api/v1/comunicacoes');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    '*' => ['id', 'email_from', 'email_to', 'subject', 'classification', 'confidence'],
                ],
                'pagination' => ['total', 'count', 'per_page', 'current_page', 'last_page'],
            ]);
    }

    /** @test */
    public function pode_criar_comunicacao()
    {
        $data = [
            'email_from' => 'remetente@example.com',
            'email_to' => 'destinatario@example.com',
            'subject' => 'Assunto de teste',
            'body' => 'Corpo do email',
        ];

        $response = $this->actingAs($this->user, 'sanctum')
            ->postJson('/api/v1/comunicacoes', $data);

        $response->assertStatus(201)
            ->assertJsonStructure([
                'data' => ['id', 'email_from', 'email_to', 'subject', 'classification', 'confidence'],
            ]);

        $this->assertDatabaseHas('comunicacoes', [
            'email_from' => $data['email_from'],
            'email_to' => $data['email_to'],
        ]);
    }

    /** @test */
    public function pode_visualizar_comunicacao()
    {
        $comunicacao = Comunicacao::factory()->create();

        $response = $this->actingAs($this->user, 'sanctum')
            ->getJson("/api/v1/comunicacoes/{$comunicacao->id}");

        $response->assertStatus(200)
            ->assertJson([
                'data' => [
                    'id' => $comunicacao->id,
                    'email_from' => $comunicacao->email_from,
                ],
            ]);
    }

    /** @test */
    public function pode_atualizar_comunicacao()
    {
        $comunicacao = Comunicacao::factory()->create();
        $newClassification = 'JUDICIAL';

        $response = $this->actingAs($this->user, 'sanctum')
            ->patchJson("/api/v1/comunicacoes/{$comunicacao->id}", [
                'classification' => $newClassification,
            ]);

        $response->assertStatus(200);
        $this->assertEquals($newClassification, $comunicacao->fresh()->classification);
    }

    /** @test */
    public function pode_deletar_comunicacao()
    {
        $comunicacao = Comunicacao::factory()->create();

        $response = $this->actingAs($this->user, 'sanctum')
            ->deleteJson("/api/v1/comunicacoes/{$comunicacao->id}");

        $response->assertStatus(204);
        $this->assertSoftDeleted('comunicacoes', ['id' => $comunicacao->id]);
    }

    /** @test */
    public function pode_classificar_comunicacao()
    {
        $comunicacao = Comunicacao::factory()->create([
            'classification' => 'UNKNOWN',
            'confidence' => null,
        ]);

        $response = $this->actingAs($this->user, 'sanctum')
            ->postJson("/api/v1/comunicacoes/{$comunicacao->id}/classificar");

        $response->assertStatus(200);
        $this->assertNotNull($comunicacao->fresh()->classified_at);
    }

    /** @test */
    public function requer_autenticacao()
    {
        $response = $this->getJson('/api/v1/comunicacoes');
        $response->assertStatus(401);
    }

    /** @test */
    public function filtra_por_classification()
    {
        Comunicacao::factory()->create(['classification' => 'JUDICIAL']);
        Comunicacao::factory()->create(['classification' => 'NON_JUDICIAL']);

        $response = $this->actingAs($this->user, 'sanctum')
            ->getJson('/api/v1/comunicacoes?classification=JUDICIAL');

        $response->assertStatus(200);
        $this->assertEquals(1, $response->json('pagination.total'));
    }
}
