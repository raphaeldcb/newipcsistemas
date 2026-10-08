<?php

namespace Tests\Unit\Services;

use Tests\TestCase;
use App\Models\Caso;
use App\Models\Vara;
use App\Models\Juiz;
use App\Services\CalculoCreditoService;
use Illuminate\Foundation\Testing\RefreshDatabase;

class CalculoCreditoServiceTest extends TestCase
{
    use RefreshDatabase;

    protected CalculoCreditoService $service;

    protected function setUp(): void
    {
        parent::setUp();
        $this->service = app(CalculoCreditoService::class);
    }

    public function test_calcular_with_default_values(): void
    {
        $caso = Caso::factory()->create();

        $resultado = $this->service->calcular($caso);

        $this->assertEquals(1000.00, $resultado['valor_base']);
        $this->assertEquals(1.0, $resultado['fator_1']);
        $this->assertEquals(1.0, $resultado['fator_2']);
        $this->assertEquals(1.0, $resultado['fator_3']);
        $this->assertEquals(1.0, $resultado['fator_4']);
        $this->assertEquals(1.0, $resultado['fator_5']);
        $this->assertEquals(1000.00, $resultado['valor_calculado']);
        $this->assertEquals(1.0, $resultado['multiplicador_total']);
    }

    public function test_calcular_with_custom_factors(): void
    {
        $caso = Caso::factory()->create();

        $resultado = $this->service->calcular($caso, [
            'fator_1' => 1.2,
            'fator_2' => 0.8,
            'fator_3' => 1.1,
            'fator_4' => 1.3,
            'fator_5' => 0.9,
        ]);

        $this->assertEquals(1.2, $resultado['fator_1']);
        $this->assertEquals(0.8, $resultado['fator_2']);
        $this->assertEquals(1.1, $resultado['fator_3']);
        $this->assertEquals(1.3, $resultado['fator_4']);
        $this->assertEquals(0.9, $resultado['fator_5']);

        // valor = 1000 * 1.2 * 0.8 * 1.1 * 1.3 * 0.9 = 1037.28
        $expectedValor = 1000 * 1.2 * 0.8 * 1.1 * 1.3 * 0.9;
        $this->assertEquals(round($expectedValor, 2), $resultado['valor_calculado']);
    }

    public function test_calcular_parcelas_divides_equally(): void
    {
        $valorTotal = 300.00;
        $numParcelas = 3;

        $parcelas = $this->service->calcularParcelas($valorTotal, $numParcelas);

        $this->assertCount(3, $parcelas);

        // Check each installment
        $this.assertEquals(1, $parcelas[0]['numero']);
        $this.assertEquals(2, $parcelas[1]['numero']);
        $this.assertEquals(3, $parcelas[2]['numero']);

        // Sum should equal total
        $total = array_sum(array_column($parcelas, 'valor'));
        $this->assertEquals($valorTotal, $total);

        // All values should be equal (100 each)
        $this.assertEquals(100.00, $parcelas[0]['valor']);
        $this.assertEquals(100.00, $parcelas[1]['valor']);
        $this.assertEquals(100.00, $parcelas[2]['valor']);
    }

    public function test_calcular_parcelas_with_different_counts(): void
    {
        $valorTotal = 1000.00;

        // Test 2 parcelas
        $parcelas2 = $this->service->calcularParcelas($valorTotal, 2);
        $this->assertCount(2, $parcelas2);
        $this->assertEquals(500.00, array_sum(array_column($parcelas2, 'valor')));

        // Test 6 parcelas
        $parcelas6 = $this->service->calcularParcelas($valorTotal, 6);
        $this->assertCount(6, $parcelas6);
        $this->assertEquals($valorTotal, array_sum(array_column($parcelas6, 'valor')));

        // Test 12 parcelas (maximum)
        $parcelas12 = $this->service->calcularParcelas($valorTotal, 12);
        $this->assertCount(12, $parcelas12);
        $this->assertEquals($valorTotal, array_sum(array_column($parcelas12, 'valor')));
    }

    public function test_parcelas_have_correct_due_dates(): void
    {
        $valorTotal = 300.00;
        $numParcelas = 3;

        $parcelas = $this->service->calcularParcelas($valorTotal, $numParcelas);

        $this->assertEquals(10, $parcelas[0]['dias_vencimento']);
        $this->assertEquals(20, $parcelas[1]['dias_vencimento']);
        $this->assertEquals(30, $parcelas[2]['dias_vencimento']);
    }

    public function test_obter_tabela_fatores(): void
    {
        $tabelas = $this->service->obterTabelaFatores();

        $this->assertArrayHasKey('fator_1_tipo_processo', $tabelas);
        $this->assertArrayHasKey('fator_2_juiz', $tabelas);
        $this->assertArrayHasKey('fator_3_vara', $tabelas);
        $this->assertArrayHasKey('fator_4_complexidade', $tabelas);
        $this->assertArrayHasKey('fator_5_estagio', $tabelas);

        $this->assertIsArray($tabelas['fator_1_tipo_processo']);
        $this->assertIsArray($tabelas['fator_2_juiz']);
    }

    public function test_obter_valor_base(): void
    {
        $valorBase = $this->service->obterValorBase();

        $this->assertEquals(1000.00, $valorBase);
    }

    public function test_validar_fator_valid_range(): void
    {
        $this->assertTrue($this->service->validarFator(0.1));
        $this->assertTrue($this->service->validarFator(1.0));
        $this->assertTrue($this->service->validarFator(3.0));
        $this->assertTrue($this->service->validarFator(1.5));
    }

    public function test_validar_fator_invalid_range(): void
    {
        $this->assertFalse($this->service->validarFator(0.05)); // Too low
        $this->assertFalse($this->service->validarFator(3.5));  // Too high
        $this->assertFalse($this->service->validarFator(0));    // Zero
    }
}
