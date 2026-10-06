<?php

namespace Tests\Feature\Api;

use Tests\TestCase;
use App\Models\User;
use App\Models\Pessoa;
use Illuminate\Foundation\Testing\RefreshDatabase;

class PessoasControllerTest extends TestCase
{
    use RefreshDatabase;

    protected User $user;

    protected function setUp(): void
    {
        parent::setUp();
        $this->user = User::factory()->create();
    }

    public function test_login_required(): void
    {
        $response = $this->getJson('/api/v1/pessoas');

        $response->assertStatus(401);
    }

    public function test_list_pessoas(): void
    {
        Pessoa::factory()->count(5)->create();

        $response = $this->actingAs($this->user)->getJson('/api/v1/pessoas');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    '*' => ['id', 'nome', 'numero_documento']
                ],
                'links',
                'meta',
            ]);
    }

    public function test_create_pessoa(): void
    {
        $data = [
            'pes_nome' => 'João Silva',
            'pes_iniciais' => 'JS',
            'pes_tdoc' => 'CPF',
            'pes_ndoc' => '12345678901',
            'pes_sexo' => 'M',
            'pes_dtnas' => '1990-01-15',
            'pes_lcnas' => 'São Paulo',
        ];

        $response = $this->actingAs($this->user)
            ->postJson('/api/v1/pessoas', $data);

        $response->assertStatus(201)
            ->assertJsonPath('data.nome', 'João Silva')
            ->assertJsonPath('data.numero_documento', '12345678901');

        $this->assertDatabaseHas('tb_pessoas', [
            'pes_nome' => 'João Silva',
        ]);
    }

    public function test_create_pessoa_validation(): void
    {
        $data = [
            'pes_nome' => '', // Inválido
            'pes_tdoc' => 'INVALIDO', // Inválido
        ];

        $response = $this->actingAs($this->user)
            ->postJson('/api/v1/pessoas', $data);

        $response->assertStatus(422)
            ->assertJsonValidationErrors(['pes_nome', 'pes_tdoc']);
    }

    public function test_show_pessoa(): void
    {
        $pessoa = Pessoa::factory()->create();

        $response = $this->actingAs($this->user)
            ->getJson("/api/v1/pessoas/{$pessoa->pes_cod}");

        $response->assertStatus(200)
            ->assertJsonPath('data.nome', $pessoa->pes_nome);
    }

    public function test_update_pessoa(): void
    {
        $pessoa = Pessoa::factory()->create();
        $newData = [
            'pes_nome' => 'Maria Silva',
            'pes_sexo' => 'F',
        ];

        $response = $this->actingAs($this->user)
            ->putJson("/api/v1/pessoas/{$pessoa->pes_cod}", $newData);

        $response->assertStatus(200)
            ->assertJsonPath('data.nome', 'Maria Silva');

        $this->assertDatabaseHas('tb_pessoas', [
            'pes_cod' => $pessoa->pes_cod,
            'pes_nome' => 'Maria Silva',
        ]);
    }

    public function test_delete_pessoa_soft_delete(): void
    {
        $pessoa = Pessoa::factory()->create();

        $response = $this->actingAs($this->user)
            ->deleteJson("/api/v1/pessoas/{$pessoa->pes_cod}");

        $response->assertStatus(204);

        // Verificar soft delete (deleted_at preenchido)
        $this->assertSoftDeleted('tb_pessoas', [
            'pes_cod' => $pessoa->pes_cod,
        ]);
    }

    public function test_document_uniqueness(): void
    {
        Pessoa::factory()->create(['pes_ndoc' => '12345678901']);

        $data = [
            'pes_nome' => 'Outro Pessoa',
            'pes_ndoc' => '12345678901', // Duplicado
        ];

        $response = $this->actingAs($this->user)
            ->postJson('/api/v1/pessoas', $data);

        $response->assertStatus(422)
            ->assertJsonValidationErrors(['pes_ndoc']);
    }

    public function test_birth_date_validation(): void
    {
        $data = [
            'pes_nome' => 'João Silva',
            'pes_dtnas' => '2030-01-01', // Data futura inválida
        ];

        $response = $this->actingAs($this->user)
            ->postJson('/api/v1/pessoas', $data);

        $response->assertStatus(422)
            ->assertJsonValidationErrors(['pes_dtnas']);
    }
}
