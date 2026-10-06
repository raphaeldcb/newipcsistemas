<?php

namespace Tests\Unit\Services;

use App\Services\ClassificacaoService;
use Tests\TestCase;

class ClassificacaoServiceTest extends TestCase
{
    protected ClassificacaoService $service;

    protected function setUp(): void
    {
        parent::setUp();
        $this->service = new ClassificacaoService();
    }

    /** @test */
    public function fallback_classifica_texto_judicial()
    {
        $result = $this->service->fallback(
            'Recurso de Apelação',
            'Conforme deliberado em audiência, segue parecer técnico da perícia judicial'
        );

        $this->assertEquals('JUDICIAL', $result['classification']);
        $this->assertGreaterThan(0.5, $result['confidence']);
        $this->assertEquals('keyword_matching', $result['method']);
    }

    /** @test */
    public function fallback_classifica_texto_nao_judicial()
    {
        $result = $this->service->fallback(
            'Convite para evento',
            'Você está convidado para uma reunião administrativa'
        );

        $this->assertEquals('NON_JUDICIAL', $result['classification']);
        $this->assertLessThan(0.7, $result['confidence']);
    }

    /** @test */
    public function fallback_retorna_estrutura_esperada()
    {
        $result = $this->service->fallback('Assunto', 'Corpo');

        $this->assertArrayHasKey('classification', $result);
        $this->assertArrayHasKey('confidence', $result);
        $this->assertArrayHasKey('reasoning', $result);
        $this->assertArrayHasKey('extracted_fields', $result);
        $this->assertArrayHasKey('method', $result);
    }

    /** @test */
    public function confidence_entre_zero_e_um()
    {
        $result = $this->service->fallback('Qualquer assunto', 'Qualquer corpo');

        $this->assertGreaterThanOrEqual(0, $result['confidence']);
        $this->assertLessThanOrEqual(1, $result['confidence']);
    }

    /** @test */
    public function detecta_multiplas_palavras_chave()
    {
        $text = 'PROCESSO de apelação contra SENTENÇA de primeira instância';

        $result = $this->service->fallback('Recurso', $text);

        // Deve ter detectado múltiplas keywords (PROCESSO, apelação, SENTENÇA)
        $this->assertGreaterThan(0.5, $result['confidence']);
        $this->assertEquals('JUDICIAL', $result['classification']);
    }
}
