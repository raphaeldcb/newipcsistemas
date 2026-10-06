<?php

namespace Tests\Unit\Models;

use App\Models\Comunicacao;
use App\Models\Caso;
use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;

class ComunicacaoTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function pode_criar_comunicacao()
    {
        $comunicacao = Comunicacao::create([
            'email_from' => 'teste@example.com',
            'email_to' => 'destino@example.com',
            'subject' => 'Assunto teste',
            'body' => 'Corpo do email',
        ]);

        $this->assertNotNull($comunicacao->id);
        $this->assertEquals('teste@example.com', $comunicacao->email_from);
        $this->assertEquals('UNKNOWN', $comunicacao->classification);
    }

    /** @test */
    public function pode_associar_caso()
    {
        $caso = Caso::factory()->create();
        $comunicacao = Comunicacao::factory()->create(['caso_id' => $caso->id]);

        $this->assertEquals($caso->id, $comunicacao->caso->id);
    }

    /** @test */
    public function scope_judicial_filtra_corretamente()
    {
        Comunicacao::factory()->create(['classification' => 'JUDICIAL']);
        Comunicacao::factory()->create(['classification' => 'NON_JUDICIAL']);
        Comunicacao::factory()->create(['classification' => 'UNKNOWN']);

        $judiciais = Comunicacao::judicial()->get();

        $this->assertEquals(1, $judiciais->count());
        $this->assertEquals('JUDICIAL', $judiciais->first()->classification);
    }

    /** @test */
    public function scope_high_confidence_filtra_corretamente()
    {
        Comunicacao::factory()->create(['confidence' => 0.95]);
        Comunicacao::factory()->create(['confidence' => 0.70]);
        Comunicacao::factory()->create(['confidence' => 0.50]);

        $highConfidence = Comunicacao::highConfidence()->get();

        $this->assertEquals(1, $highConfidence->count());
        $this->assertEquals(0.95, $highConfidence->first()->confidence);
    }

    /** @test */
    public function soft_delete_funciona()
    {
        $comunicacao = Comunicacao::factory()->create();
        $id = $comunicacao->id;

        $comunicacao->delete();

        $this->assertNull(Comunicacao::find($id));
        $this->assertNotNull(Comunicacao::withTrashed()->find($id));
    }

    /** @test */
    public function castings_funcionam_corretamente()
    {
        $comunicacao = Comunicacao::create([
            'email_from' => 'test@example.com',
            'email_to' => 'dest@example.com',
            'subject' => 'Test',
            'body' => 'Test body',
            'confidence' => '0.85',
            'extracted_fields' => ['cnj' => '12345'],
        ]);

        $this->assertIsFloat($comunicacao->confidence);
        $this->assertIsArray($comunicacao->extracted_fields);
        $this->assertEquals('12345', $comunicacao->extracted_fields['cnj']);
    }
}
