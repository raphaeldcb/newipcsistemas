<?php

namespace Tests\Feature\Web;

use App\Models\User;
use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;

class RoutesTest extends TestCase
{
    use RefreshDatabase;

    protected User $user;

    protected function setUp(): void
    {
        parent::setUp();
        $this->user = User::factory()->create(['role' => 'user']);
    }

    /** @test */
    public function rota_raiz_redireciona_para_dashboard_autenticado()
    {
        $response = $this->actingAs($this->user)
            ->get('/');

        $response->assertRedirect('/dashboard');
    }

    /** @test */
    public function rota_raiz_redireciona_para_login_nao_autenticado()
    {
        $response = $this->get('/');

        $response->assertRedirect('/login');
    }

    /** @test */
    public function pagina_login_disponivel()
    {
        $response = $this->get('/login');

        $response->assertStatus(200)
            ->assertViewIs('auth.login');
    }

    /** @test */
    public function dashboard_requer_autenticacao()
    {
        $response = $this->get('/dashboard');

        $response->assertRedirect('/login');
    }

    /** @test */
    public function dashboard_disponivel_para_autenticado()
    {
        $response = $this->actingAs($this->user)
            ->get('/dashboard');

        $response->assertStatus(200)
            ->assertViewIs('dashboard');
    }

    /** @test */
    public function comunicacoes_index_requer_autenticacao()
    {
        $response = $this->get('/comunicacoes');

        $response->assertRedirect('/login');
    }

    /** @test */
    public function comunicacoes_index_disponivel_para_autenticado()
    {
        $response = $this->actingAs($this->user)
            ->get('/comunicacoes');

        $response->assertStatus(200)
            ->assertViewIs('comunicacoes.index');
    }

    /** @test */
    public function casos_index_disponivel_para_autenticado()
    {
        $response = $this->actingAs($this->user)
            ->get('/casos');

        $response->assertStatus(200)
            ->assertViewIs('casos.index');
    }

    /** @test */
    public function pessoas_index_disponivel_para_autenticado()
    {
        $response = $this->actingAs($this->user)
            ->get('/pessoas');

        $response->assertStatus(200)
            ->assertViewIs('pessoas.index');
    }

    /** @test */
    public function logout_requer_autenticacao()
    {
        $response = $this->post('/logout');

        $response->assertRedirect('/login');
    }

    /** @test */
    public function logout_limpa_sessao()
    {
        $this->actingAs($this->user)
            ->post('/logout')
            ->assertRedirect('/login');

        $this->assertGuest();
    }
}
