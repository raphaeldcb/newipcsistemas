<?php

namespace Tests\Unit\Services;

use Tests\TestCase;
use App\Models\Credito;
use App\Models\Caso;
use App\Services\CreditoService;
use App\Enums\CreditoStatus;
use Illuminate\Foundation\Testing\RefreshDatabase;

class CreditoServiceTest extends TestCase
{
    use RefreshDatabase;

    protected CreditoService $service;

    protected function setUp(): void
    {
        parent::setUp();
        $this->service = app(CreditoService::class);
    }

    public function test_gerar_credito_com_parcelas(): void
    {
        $caso = Caso::factory()->create();

        $credito = $this->service->gerarCreditoComParcelas($caso);

        $this->assertNotNull($credito->id_credito);
        $this->assertEquals($caso->cas_contr, $credito->caso_id);
        $this->assertGreaterThan(0, $credito->cre_vlr);
        $this->assertEquals(CreditoStatus::PENDENTE->value, $credito->cre_status);
    }

    public function test_criar_3_parcelas(): void
    {
        $caso = Caso::factory()->create();

        $credito = $this->service->gerarCreditoComParcelas($caso);

        $parcelas = $credito->parcelas;

        $this->assertCount(3, $parcelas);
        $this->assertEquals(1, $parcelas[0]->par_nparc);
        $this->assertEquals(2, $parcelas[1]->par_nparc);
        $this->assertEquals(3, $parcelas[2]->par_nparc);
    }

    public function test_registrar_pagamento_parcial(): void
    {
        $credito = Credito::factory()->create([
            'cre_vlr' => 1000.00,
            'cre_vlr_pago' => 0,
            'cre_status' => CreditoStatus::PENDENTE->value,
        ]);

        $this->service->registrarPagamento($credito, 500.00, 'Pagamento parcial');

        $credito->refresh();
        $this->assertEquals(500.00, $credito->cre_vlr_pago);
        $this->assertEquals(CreditoStatus::PARCIALMENTE_PAGO->value, $credito->cre_status);
    }

    public function test_registrar_pagamento_completo(): void
    {
        $credito = Credito::factory()->create([
            'cre_vlr' => 1000.00,
            'cre_vlr_pago' => 500.00,
            'cre_status' => CreditoStatus::PARCIALMENTE_PAGO->value,
        ]);

        $this->service->registrarPagamento($credito, 500.00);

        $credito->refresh();
        $this->assertEquals(1000.00, $credito->cre_vlr_pago);
        $this->assertEquals(CreditoStatus::PAGO->value, $credito->cre_status);
        $this->assertNotNull($credito->data_pagamento);
    }

    public function test_cancelar_credito(): void
    {
        $credito = Credito::factory()->has('parcelas', 3)->create([
            'cre_status' => CreditoStatus::PENDENTE->value,
        ]);

        $this->service->cancelarCredito($credito, 'Caso cancelado');

        $credito->refresh();
        $this->assertEquals(CreditoStatus::CANCELADO->value, $credito->cre_status);
        $this->assertEquals('Caso cancelado', $credito->motivo_cancelamento);
        $this->assertNotNull($credito->data_cancelamento);
    }

    public function test_cancelar_parcelas(): void
    {
        $credito = Credito::factory()->has('parcelas', 3)->create();

        $this->service->cancelarCredito($credito);

        $credito->refresh();
        $parcelas = $credito->parcelas;

        foreach ($parcelas as $parcela) {
            $this->assertEquals('cancelada', $parcela->par_status);
        }
    }

    public function test_reverter_credito(): void
    {
        $credito = Credito::factory()->create([
            'cre_vlr' => 1000.00,
            'cre_vlr_pago' => 500.00,
            'cre_status' => CreditoStatus::PARCIALMENTE_PAGO->value,
        ]);

        $this->service->reverterCredito($credito, 'Erro no cálculo');

        $credito->refresh();
        $this->assertEquals(CreditoStatus::REVERTIDO->value, $credito->cre_status);
        $this->assertEquals(0, $credito->cre_vlr_pago);
        $this->assertEquals('Erro no cálculo', $credito->motivo_reversao);
    }

    public function test_reverter_parcelas(): void
    {
        $credito = Credito::factory()->has('parcelas', 3)->create();
        $credito->parcelas()->update(['par_status' => 'paga']);

        $this->service->reverterCredito($credito);

        $credito->refresh();
        $parcelas = $credito->parcelas;

        foreach ($parcelas as $parcela) {
            $this->assertEquals('aberta', $parcela->par_status);
        }
    }

    public function test_obter_pendentes(): void
    {
        Credito::factory()->create([
            'cre_status' => CreditoStatus::PENDENTE->value,
            'data_geracao' => now()->subDays(10),
        ]);
        Credito::factory()->create([
            'cre_status' => CreditoStatus::PENDENTE->value,
            'data_geracao' => now()->subDays(40),
        ]);
        Credito::factory()->create([
            'cre_status' => CreditoStatus::PAGO->value,
        ]);

        $pendentes = $this->service->obterPendentes(30);

        $this->assertCount(1, $pendentes);
    }

    public function test_obter_atrasadas(): void
    {
        $credito = Credito::factory()->has('parcelas', 3)->create();
        $credito->parcelas()->update([
            'par_data_vencimento' => now()->subDays(10),
            'par_status' => 'aberta',
        ]);

        $atrasadas = $this->service->obterAtrasadas();

        $this->assertGreaterThan(0, count($atrasadas));
    }

    public function test_simular_calculo(): void
    {
        $caso = Caso::factory()->create();

        $simulacao = $this->service->simularCalculo($caso);

        $this->assertArrayHasKey('valor_base', $simulacao);
        $this->assertArrayHasKey('valor_final', $simulacao);
        $this->assertArrayHasKey('multiplicador', $simulacao);
        $this->assertArrayHasKey('tabelas', $simulacao);
        $this->assertEquals(1000.00, $simulacao['valor_base']);
    }

    public function test_obter_tabela_fatores(): void
    {
        $tabelas = $this->service->obterTabelaFatores();

        $this->assertArrayHasKey('tipos', $tabelas);
        $this->assertArrayHasKey('juizes', $tabelas);
        $this->assertArrayHasKey('varas', $tabelas);
        $this->assertArrayHasKey('categorias', $tabelas);
    }
}
