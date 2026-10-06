<?php

namespace Tests\Unit\Services;

use Tests\TestCase;
use App\Models\Caso;
use App\Models\Extracao;
use App\Models\Alelo;
use App\Services\RelatorioService;
use Illuminate\Foundation\Testing\RefreshDatabase;

class RelatorioServiceTest extends TestCase
{
    use RefreshDatabase;

    protected RelatorioService $service;

    protected function setUp(): void
    {
        parent::setUp();
        $this->service = app(RelatorioService::class);
    }

    public function test_gerar_relatorio_caso_completo(): void
    {
        $caso = Caso::factory()->has('historicos', 3)->create();

        $relatorio = $this->service->gerarRelatorioCasoCompleto($caso->cas_contr);

        $this->assertArrayHasKey('titulo', $relatorio);
        $this->assertArrayHasKey('numero_processo', $relatorio);
        $this->assertArrayHasKey('caso', $relatorio);
        $this->assertArrayHasKey('historico', $relatorio);
        $this->assertCount(3, $relatorio['historico']);
    }

    public function test_gerar_relatorio_extracao(): void
    {
        $extracao = Extracao::factory()->has('alelos', 5)->create();

        $relatorio = $this->service->gerarRelatorioExtracao($extracao->ext_cod);

        $this->assertArrayHasKey('titulo', $relatorio);
        $this->assertArrayHasKey('alelos', $relatorio);
        $this->assertCount(5, $relatorio['alelos']);
    }

    public function test_gerar_relatorio_comparacao(): void
    {
        $ext1 = Extracao::factory()->create();
        $ext2 = Extracao::factory()->create();

        Alelo::factory()->create([
            'extracao_id' => $ext1->ext_cod,
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'alelo2' => '15',
        ]);

        Alelo::factory()->create([
            'extracao_id' => $ext2->ext_cod,
            'marcador' => 'D8S1179',
            'alelo1' => '13',
            'alelo2' => '15',
        ]);

        $relatorio = $this->service->gerarRelatorioComparacao($ext1->ext_cod, $ext2->ext_cod);

        $this->assertArrayHasKey('conclusao', $relatorio);
        $this->assertStringContainsString('Match 100%', $relatorio['conclusao']);
    }

    public function test_gerar_relatorio_creditos(): void
    {
        $caso = Caso::factory()->has('creditos', 2)->create();

        $relatorio = $this->service->gerarRelatorioCreditosFaturamento($caso->cas_contr);

        $this->assertArrayHasKey('resumo', $relatorio);
        $this->assertArrayHasKey('creditos', $relatorio);
        $this->assertEquals(2, $relatorio['resumo']['total_creditos']);
    }

    public function test_gerar_relatorio_kits(): void
    {
        \App\Models\Kit::factory()->count(5)->create();

        $relatorio = $this->service->gerarRelatorioKits();

        $this->assertArrayHasKey('total_kits', $relatorio);
        $this->assertArrayHasKey('por_status', $relatorio);
        $this->assertEquals(5, $relatorio['total_kits']);
    }

    public function test_gerar_relatorio_auditoria(): void
    {
        $caso = Caso::factory()->has('historicos', 4)->create();

        $relatorio = $this->service->gerarRelatorioAuditoria($caso->cas_contr);

        $this->assertArrayHasKey('historico', $relatorio);
        $this->assertArrayHasKey('total_transicoes', $relatorio);
        $this->assertEquals(4, $relatorio['total_transicoes']);
    }
}
