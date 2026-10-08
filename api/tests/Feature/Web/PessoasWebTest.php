<?php

namespace Tests\Feature\Web;

use Tests\TestCase;
use App\Models\User;
use App\Models\Pessoa;
use Illuminate\Foundation\Testing\RefreshDatabase;

class PessoasWebTest extends TestCase
{
    use RefreshDatabase;

    protected User $user;

    public function setUp(): void
    {
        parent::setUp();
        $this->user = User::factory()->create();
    }

    /** @test */
    public function test_lista_pessoas_autenticadas()
    {
        Pessoa::factory(5)->create();

        $response = $this->actingAs($this->user)->get('/pessoas');

        $response->assertStatus(200)
                ->assertViewIs('pessoas.index')
                ->assertViewHas('pessoas');
    }

    /** @test */
    public function test_lista_pessoas_nao_autenticadas_redireciona()
    {
        $response = $this->get('/pessoas');

        $response->assertRedirect('login');
    }

    /** @test */
    public function test_criar_pessoa_form_abre()
    {
        $response = $this->actingAs($this->user)->get('/pessoas/create');

        $response->assertStatus(200)
                ->assertViewIs('pessoas.create');
    }

    /** @test */
    public function test_cria_pessoa_com_dados_validos()
    {
        $data = [
            'nome' => 'João Silva',
            'tipo' => 'FISICA',
            'documento' => '12345678900',
            'email' => 'joao@example.com',
            'telefone' => '11999999999',
        ];

        $response = $this->actingAs($this->user)->post('/pessoas', $data);

        $response->assertRedirect();
        $this->assertDatabaseHas('tb_pessoas', [
            'nome' => 'João Silva',
            'tipo' => 'FISICA',
            'documento' => '12345678900',
            'email' => 'joao@example.com',
        ]);
    }

    /** @test */
    public function test_cria_pessoa_sem_nome_falha()
    {
        $data = [
            'nome' => '',
            'tipo' => 'FISICA',
            'documento' => '12345678900',
        ];

        $response = $this->actingAs($this->user)->post('/pessoas', $data);

        $response->assertSessionHasErrors('nome');
        $this->assertDatabaseCount('tb_pessoas', 0);
    }

    /** @test */
    public function test_cria_pessoa_tipo_invalido_falha()
    {
        $data = [
            'nome' => 'João Silva',
            'tipo' => 'INVALIDO',
            'documento' => '12345678900',
        ];

        $response = $this->actingAs($this->user)->post('/pessoas', $data);

        $response->assertSessionHasErrors('tipo');
    }

    /** @test */
    public function test_cria_pessoa_documento_duplicado_falha()
    {
        Pessoa::factory()->create(['documento' => '12345678900']);

        $data = [
            'nome' => 'Outro João',
            'tipo' => 'FISICA',
            'documento' => '12345678900',
        ];

        $response = $this->actingAs($this->user)->post('/pessoas', $data);

        $response->assertSessionHasErrors('documento');
    }

    /** @test */
    public function test_exibe_detalhe_pessoa()
    {
        $pessoa = Pessoa::factory()->create();

        $response = $this->actingAs($this->user)->get("/pessoas/{$pessoa->pes_cod}");

        $response->assertStatus(200)
                ->assertViewIs('pessoas.show')
                ->assertViewHas('pessoa', $pessoa);
    }

    /** @test */
    public function test_editar_pessoa_form_abre()
    {
        $pessoa = Pessoa::factory()->create();

        $response = $this->actingAs($this->user)->get("/pessoas/{$pessoa->pes_cod}/edit");

        $response->assertStatus(200)
                ->assertViewIs('pessoas.edit')
                ->assertViewHas('pessoa', $pessoa);
    }

    /** @test */
    public function test_edita_pessoa_com_dados_validos()
    {
        $pessoa = Pessoa::factory()->create([
            'nome' => 'João Original',
            'tipo' => 'FISICA',
        ]);

        $data = [
            'nome' => 'João Atualizado',
            'tipo' => 'JURIDICA',
            'email' => 'novo@example.com',
        ];

        $response = $this->actingAs($this->user)->patch("/pessoas/{$pessoa->pes_cod}", $data);

        $response->assertRedirect("/pessoas/{$pessoa->pes_cod}");
        $this->assertDatabaseHas('tb_pessoas', [
            'pes_cod' => $pessoa->pes_cod,
            'nome' => 'João Atualizado',
            'tipo' => 'JURIDICA',
            'email' => 'novo@example.com',
        ]);
    }

    /** @test */
    public function test_edita_pessoa_sem_nome_falha()
    {
        $pessoa = Pessoa::factory()->create();

        $data = [
            'nome' => '',
            'tipo' => 'FISICA',
        ];

        $response = $this->actingAs($this->user)->patch("/pessoas/{$pessoa->pes_cod}", $data);

        $response->assertSessionHasErrors('nome');
    }

    /** @test */
    public function test_deleta_pessoa()
    {
        $pessoa = Pessoa::factory()->create();

        $response = $this->actingAs($this->user)->delete("/pessoas/{$pessoa->pes_cod}");

        $response->assertRedirect('/pessoas');
        $this->assertSoftDeleted('tb_pessoas', [
            'pes_cod' => $pessoa->pes_cod,
        ]);
    }

    /** @test */
    public function test_busca_pessoa_por_nome()
    {
        Pessoa::factory()->create(['nome' => 'João Silva']);
        Pessoa::factory()->create(['nome' => 'Maria Santos']);

        $response = $this->actingAs($this->user)->get('/pessoas?search=João');

        $response->assertStatus(200);
        $pessoas = $response->viewData('pessoas');
        $this->assertEquals(1, $pessoas->count());
        $this->assertEquals('João Silva', $pessoas->first()->nome);
    }

    /** @test */
    public function test_busca_pessoa_por_documento()
    {
        Pessoa::factory()->create(['documento' => '12345678900']);
        Pessoa::factory()->create(['documento' => '98765432100']);

        $response = $this->actingAs($this->user)->get('/pessoas?search=123456');

        $response->assertStatus(200);
        $pessoas = $response->viewData('pessoas');
        $this->assertEquals(1, $pessoas->count());
    }

    /** @test */
    public function test_filtra_pessoa_por_tipo()
    {
        Pessoa::factory()->create(['tipo' => 'FISICA']);
        Pessoa::factory()->create(['tipo' => 'JURIDICA']);

        $response = $this->actingAs($this->user)->get('/pessoas?tipo=FISICA');

        $response->assertStatus(200);
        $pessoas = $response->viewData('pessoas');
        $this->assertEquals(1, $pessoas->count());
        $this->assertEquals('FISICA', $pessoas->first()->tipo);
    }

    /** @test */
    public function test_email_valido_obrigatorio()
    {
        $data = [
            'nome' => 'João Silva',
            'tipo' => 'FISICA',
            'email' => 'email-invalido',
        ];

        $response = $this->actingAs($this->user)->post('/pessoas', $data);

        $response->assertSessionHasErrors('email');
    }

    /** @test */
    public function test_documento_opcional()
    {
        $data = [
            'nome' => 'Pessoa sem documento',
            'tipo' => 'JURIDICA',
        ];

        $response = $this->actingAs($this->user)->post('/pessoas', $data);

        $response->assertRedirect();
        $this->assertDatabaseHas('tb_pessoas', [
            'nome' => 'Pessoa sem documento',
        ]);
    }

    /** @test */
    public function test_paginacao_funciona()
    {
        Pessoa::factory(20)->create();

        $response = $this->actingAs($this->user)->get('/pessoas');

        $response->assertStatus(200);
        $pessoas = $response->viewData('pessoas');
        $this->assertLessThanOrEqual(15, $pessoas->count());
        $this->assertTrue($pessoas->hasPages());
    }
}
