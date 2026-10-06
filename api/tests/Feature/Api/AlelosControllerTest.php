<?php

namespace Tests\Feature\Api;

use Tests\TestCase;
use App\Models\User;
use App\Models\Alelo;
use App\Models\Extracao;
use Illuminate\Foundation\Testing\RefreshDatabase;

class AlelosControllerTest extends TestCase
{
    use RefreshDatabase;

    protected User $user;

    protected function setUp(): void
    {
        parent::setUp();
        $this->user = User::factory()->create();
    }

    public function test_list_alelos(): void
    {
        Alelo::factory()->count(5)->create();

        $response = $this->actingAs($this->user)->getJson('/api/v1/alelos');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    '*' => ['id', 'extracao_id', 'tipo_alelo', 'marcador', 'alelo1', 'genótipo']
                ],
            ]);
    }

    public function test_create_alelo(): void
    {
        $extracao = Extracao::factory()->create();

        $data = [
            'extracao_id' => $extracao->ext_cod,
            'tipo_alelo' => 'STR',
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'alelo2' => '15',
            'frequencia_alelo1' => 0.15,
            'frequencia_alelo2' => 0.12,
        ];

        $response = $this->actingAs($this->user)
            ->postJson('/api/v1/alelos', $data);

        $response->assertStatus(201)
            ->assertJsonPath('data.0.marcador', 'D8S1179')
            ->assertJsonPath('data.0.genótipo', '13/15')
            ->assertJsonPath('data.0.homozigoto', false);
    }

    public function test_show_alelo(): void
    {
        $alelo = Alelo::factory()->create();

        $response = $this->actingAs($this->user)
            ->getJson("/api/v1/alelos/{$alelo->cod_ale}");

        $response->assertStatus(200)
            ->assertJsonPath('data.id', $alelo->cod_ale);
    }

    public function test_delete_alelo(): void
    {
        $alelo = Alelo::factory()->create();

        $response = $this->actingAs($this->user)
            ->deleteJson("/api/v1/alelos/{$alelo->cod_ale}");

        $response->assertStatus(204);
    }

    public function test_registrar_batch(): void
    {
        $extracao = Extracao::factory()->create();

        $data = [
            'extracao_id' => $extracao->ext_cod,
            'alelos' => [
                [
                    'tipo_alelo' => 'STR',
                    'marcador' => 'D8S1179',
                    'alelo1' => '13',
                    'alelo2' => '15',
                ],
                [
                    'tipo_alelo' => 'STR',
                    'marcador' => 'D21S11',
                    'alelo1' => '29',
                    'alelo2' => '30',
                ],
            ],
        ];

        $response = $this->actingAs($this->user)
            ->postJson('/api/v1/alelos/registrar-batch', $data);

        $response->assertStatus(201)
            ->assertJsonPath('message', '2 alelo(s) registrado(s)');
    }

    public function test_comparar_extracos(): void
    {
        $extracao1 = Extracao::factory()->create();
        $extracao2 = Extracao::factory()->create();

        // Mesmos alelos em ambas
        Alelo::factory()->create([
            'extracao_id' => $extracao1->ext_cod,
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'alelo2' => '15',
        ]);

        Alelo::factory()->create([
            'extracao_id' => $extracao2->ext_cod,
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'alelo2' => '15',
        ]);

        $response = $this->actingAs($this->user)
            ->postJson('/api/v1/alelos/comparar-extracos', [
                'extracao_id_1' => $extracao1->ext_cod,
                'extracao_id_2' => $extracao2->ext_cod,
            ]);

        $response->assertStatus(200)
            ->assertJsonPath('matches', 1)
            ->assertJsonPath('percentual_match', 100.0);
    }

    public function test_por_extracao(): void
    {
        $extracao = Extracao::factory()->create();
        Alelo::factory()->count(3)->create(['extracao_id' => $extracao->ext_cod]);

        $response = $this->actingAs($this->user)
            ->postJson('/api/v1/alelos/por-extracao', [
                'extracao_id' => $extracao->ext_cod,
            ]);

        $response->assertStatus(200)
            ->assertJsonPath('quantidade_marcadores', 3);
    }

    public function test_por_marcador(): void
    {
        Alelo::factory()->count(5)->create(['marcador' => 'D8S1179']);
        Alelo::factory()->count(2)->create(['marcador' => 'D21S11']);

        $response = $this->actingAs($this->user)
            ->postJson('/api/v1/alelos/por-marcador', [
                'marcador' => 'D8S1179',
            ]);

        $response->assertStatus(200)
            ->assertJsonPath('quantidade_registros', 5);
    }

    public function test_contagem_por_tipo(): void
    {
        Alelo::factory()->count(5)->create(['tipo_alelo' => 'STR']);
        Alelo::factory()->count(3)->create(['tipo_alelo' => 'SNP']);

        $response = $this->actingAs($this->user)
            ->getJson('/api/v1/alelos/contagem-por-tipo');

        $response->assertStatus(200)
            ->assertJsonPath('total_alelos', 8);
    }

    public function test_marcadores_unicos(): void
    {
        Alelo::factory()->create(['marcador' => 'D8S1179']);
        Alelo::factory()->create(['marcador' => 'D21S11']);
        Alelo::factory()->create(['marcador' => 'D8S1179']); // repetido

        $response = $this->actingAs($this->user)
            ->getJson('/api/v1/alelos/marcadores-unicos');

        $response->assertStatus(200)
            ->assertJsonPath('quantidade_marcadores', 2);
    }

    public function test_frequencia_populacao(): void
    {
        Alelo::factory()->count(10)->create([
            'marcador' => 'D8S1179',
            'alelo1' => '13',
        ]);

        $response = $this->actingAs($this->user)
            ->postJson('/api/v1/alelos/frequencia-populacao', [
                'marcador' => 'D8S1179',
                'alelo' => '13',
            ]);

        $response->assertStatus(200)
            ->assertJsonPath('frequencia_populacional', 1.0);
    }

    public function test_alelo_homozigoto(): void
    {
        $extracao = Extracao::factory()->create();

        $data = [
            'extracao_id' => $extracao->ext_cod,
            'tipo_alelo' => 'STR',
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'alelo2' => '13',
        ];

        $response = $this->actingAs($this->user)
            ->postJson('/api/v1/alelos', $data);

        $response->assertStatus(201)
            ->assertJsonPath('data.0.genótipo', '13')
            ->assertJsonPath('data.0.homozigoto', true);
    }
}
