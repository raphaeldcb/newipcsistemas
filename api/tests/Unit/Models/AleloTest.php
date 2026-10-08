<?php

namespace Tests\Unit\Models;

use App\Models\Alelo;
use App\Models\Extracao;
use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;

class AleloTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function pode_criar_alelo()
    {
        $alelo = Alelo::create([
            'tipo_alelo' => 'STR',
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'alelo2' => '15',
            'genótipo' => '13/15',
        ]);

        $this->assertNotNull($alelo->cod_ale);
        $this->assertEquals('STR', $alelo->tipo_alelo);
        $this->assertEquals('D8S1179', $alelo->marcador);
        $this->assertEquals('13/15', $alelo->genótipo);
    }

    /** @test */
    public function pode_associar_extracao()
    {
        $extracao = Extracao::factory()->create();
        $alelo = Alelo::create([
            'extracao_id' => $extracao->ext_cod,
            'tipo_alelo' => 'SNP',
            'marcador' => 'D21S11',
            'alelo1' => '29',
            'alelo2' => '32',
        ]);

        $this->assertEquals($extracao->ext_cod, $alelo->extracao->ext_cod);
    }

    /** @test */
    public function frequencias_sao_castadas_para_float()
    {
        $alelo = Alelo::create([
            'tipo_alelo' => 'STR',
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'frequencia_alelo1' => '0.1234',
            'frequencia_alelo2' => '0.5678',
        ]);

        $this->assertIsFloat($alelo->frequencia_alelo1);
        $this->assertIsFloat($alelo->frequencia_alelo2);
        $this->assertEquals(0.1234, $alelo->frequencia_alelo1);
    }

    /** @test */
    public function data_analise_e_castada_para_datetime()
    {
        $now = now();
        $alelo = Alelo::create([
            'tipo_alelo' => 'STR',
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'data_analise' => $now,
        ]);

        $this->assertNotNull($alelo->data_analise);
        $this->assertEquals($now->format('Y-m-d H:i'), $alelo->data_analise->format('Y-m-d H:i'));
    }

    /** @test */
    public function soft_delete_funciona()
    {
        $alelo = Alelo::create([
            'tipo_alelo' => 'STR',
            'marcador' => 'D8S1179',
            'alelo1' => '13',
        ]);
        $cod_ale = $alelo->cod_ale;

        $alelo->delete();

        $this->assertNull(Alelo::find($cod_ale));
        $this->assertNotNull(Alelo::withTrashed()->find($cod_ale));
    }

    /** @test */
    public function pode_armazenar_observacoes()
    {
        $alelo = Alelo::create([
            'tipo_alelo' => 'STR',
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'observacoes' => 'Amostra de alta qualidade',
        ]);

        $this->assertEquals('Amostra de alta qualidade', $alelo->observacoes);
    }
}
