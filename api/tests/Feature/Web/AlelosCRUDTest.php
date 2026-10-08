<?php

namespace Tests\Feature\Web;

use App\Models\Alelo;
use App\Models\Extracao;
use App\Models\User;
use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;

class AlelosCRUDTest extends TestCase
{
    use RefreshDatabase;

    private User $user;
    private Extracao $extracao;

    protected function setUp(): void
    {
        parent::setUp();
        $this->user = User::factory()->create();
        $this->extracao = Extracao::factory()->create();
    }

    /** @test */
    public function usuario_nao_autenticado_nao_pode_acessar_index()
    {
        $response = $this->get(route('alelos.index'));
        $response->assertRedirect('/login');
    }

    /** @test */
    public function usuario_autenticado_pode_ver_lista_de_alelos()
    {
        Alelo::factory(3)->create();

        $response = $this->actingAs($this->user)->get(route('alelos.index'));

        $response->assertOk();
        $response->assertViewIs('alelos.index');
        $response->assertViewHas('alelos');
    }

    /** @test */
    public function pode_filtrar_alelos_por_marcador()
    {
        Alelo::create([
            'tipo_alelo' => 'STR',
            'marcador' => 'D8S1179',
            'alelo1' => '13',
        ]);
        Alelo::create([
            'tipo_alelo' => 'STR',
            'marcador' => 'D21S11',
            'alelo1' => '29',
        ]);

        $response = $this->actingAs($this->user)
                        ->get(route('alelos.index', ['marcador' => 'D8S1179']));

        $response->assertOk();
    }

    /** @test */
    public function pode_filtrar_alelos_por_tipo()
    {
        Alelo::create([
            'tipo_alelo' => 'STR',
            'marcador' => 'D8S1179',
            'alelo1' => '13',
        ]);
        Alelo::create([
            'tipo_alelo' => 'SNP',
            'marcador' => 'rs123456',
            'alelo1' => 'A',
        ]);

        $response = $this->actingAs($this->user)
                        ->get(route('alelos.index', ['tipo_alelo' => 'STR']));

        $response->assertOk();
    }

    /** @test */
    public function usuario_autenticado_pode_ver_formulario_criar()
    {
        $response = $this->actingAs($this->user)->get(route('alelos.create'));

        $response->assertOk();
        $response->assertViewIs('alelos.create');
        $response->assertViewHas('extracos');
        $response->assertViewHas('tipos_alelo');
    }

    /** @test */
    public function pode_criar_novo_alelo()
    {
        $data = [
            'extracao_id' => $this->extracao->ext_cod,
            'tipo_alelo' => 'STR',
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'alelo2' => '15',
            'frequencia_alelo1' => 0.1234,
            'frequencia_alelo2' => 0.5678,
            'observacoes' => 'Teste',
        ];

        $response = $this->actingAs($this->user)
                        ->post(route('alelos.store'), $data);

        $response->assertRedirect();
        $this->assertDatabaseHas('tb_alelos', [
            'tipo_alelo' => 'STR',
            'marcador' => 'D8S1179',
            'alelo1' => '13',
        ]);
    }

    /** @test */
    public function campo_genotype_e_preenchido_automaticamente()
    {
        $data = [
            'extracao_id' => $this->extracao->ext_cod,
            'tipo_alelo' => 'STR',
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'alelo2' => '15',
        ];

        $this->actingAs($this->user)->post(route('alelos.store'), $data);

        $this->assertDatabaseHas('tb_alelos', [
            'genótipo' => '13/15',
        ]);
    }

    /** @test */
    public function pode_visualizar_alelo()
    {
        $alelo = Alelo::create([
            'extracao_id' => $this->extracao->ext_cod,
            'tipo_alelo' => 'STR',
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'alelo2' => '15',
            'genótipo' => '13/15',
        ]);

        $response = $this->actingAs($this->user)
                        ->get(route('alelos.show', $alelo));

        $response->assertOk();
        $response->assertViewIs('alelos.show');
        $response->assertViewHas('alelo');
        $response->assertSee('D8S1179');
        $response->assertSee('13/15');
    }

    /** @test */
    public function usuario_autenticado_pode_ver_formulario_editar()
    {
        $alelo = Alelo::create([
            'tipo_alelo' => 'STR',
            'marcador' => 'D8S1179',
            'alelo1' => '13',
        ]);

        $response = $this->actingAs($this->user)
                        ->get(route('alelos.edit', $alelo));

        $response->assertOk();
        $response->assertViewIs('alelos.edit');
        $response->assertViewHas('alelo', $alelo);
    }

    /** @test */
    public function pode_atualizar_alelo()
    {
        $alelo = Alelo::create([
            'extracao_id' => $this->extracao->ext_cod,
            'tipo_alelo' => 'STR',
            'marcador' => 'D8S1179',
            'alelo1' => '13',
        ]);

        $data = [
            'extracao_id' => $this->extracao->ext_cod,
            'tipo_alelo' => 'STR',
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'alelo2' => '15',
            'frequencia_alelo1' => 0.2,
        ];

        $response = $this->actingAs($this->user)
                        ->put(route('alelos.update', $alelo), $data);

        $response->assertRedirect(route('alelos.show', $alelo));
        $this->assertDatabaseHas('tb_alelos', [
            'cod_ale' => $alelo->cod_ale,
            'alelo2' => '15',
            'frequencia_alelo1' => 0.2,
        ]);
    }

    /** @test */
    public function pode_deletar_alelo()
    {
        $alelo = Alelo::create([
            'tipo_alelo' => 'STR',
            'marcador' => 'D8S1179',
            'alelo1' => '13',
        ]);

        $response = $this->actingAs($this->user)
                        ->delete(route('alelos.destroy', $alelo));

        $response->assertRedirect(route('alelos.index'));
        $this->assertSoftDeleted('tb_alelos', ['cod_ale' => $alelo->cod_ale]);
    }

    /** @test */
    public function validacao_rejeita_extracao_invalida()
    {
        $data = [
            'extracao_id' => 99999,
            'tipo_alelo' => 'STR',
            'marcador' => 'D8S1179',
            'alelo1' => '13',
        ];

        $response = $this->actingAs($this->user)
                        ->post(route('alelos.store'), $data);

        $response->assertSessionHasErrors('extracao_id');
    }

    /** @test */
    public function validacao_rejeita_tipo_alelo_invalido()
    {
        $data = [
            'extracao_id' => $this->extracao->ext_cod,
            'tipo_alelo' => 'INVALID_TYPE',
            'marcador' => 'D8S1179',
            'alelo1' => '13',
        ];

        $response = $this->actingAs($this->user)
                        ->post(route('alelos.store'), $data);

        $response->assertSessionHasErrors('tipo_alelo');
    }

    /** @test */
    public function validacao_rejeita_alelo1_vazio()
    {
        $data = [
            'extracao_id' => $this->extracao->ext_cod,
            'tipo_alelo' => 'STR',
            'marcador' => 'D8S1179',
            'alelo1' => '',
        ];

        $response = $this->actingAs($this->user)
                        ->post(route('alelos.store'), $data);

        $response->assertSessionHasErrors('alelo1');
    }

    /** @test */
    public function pode_armazenar_data_analise()
    {
        $data = [
            'extracao_id' => $this->extracao->ext_cod,
            'tipo_alelo' => 'STR',
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'data_analise' => '2026-10-08 14:30',
        ];

        $this->actingAs($this->user)->post(route('alelos.store'), $data);

        $this->assertDatabaseHas('tb_alelos', [
            'marcador' => 'D8S1179',
        ]);

        $alelo = Alelo::where('marcador', 'D8S1179')->first();
        $this->assertNotNull($alelo->data_analise);
    }

    /** @test */
    public function frequencia_alelo_deve_estar_entre_0_e_1()
    {
        $data = [
            'extracao_id' => $this->extracao->ext_cod,
            'tipo_alelo' => 'STR',
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'frequencia_alelo1' => 1.5,
        ];

        $response = $this->actingAs($this->user)
                        ->post(route('alelos.store'), $data);

        $response->assertSessionHasErrors('frequencia_alelo1');
    }
}
