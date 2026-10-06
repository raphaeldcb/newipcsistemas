<?php

namespace Tests\Unit\Services;

use Tests\TestCase;
use App\Models\Kit;
use App\Services\KitService;
use App\Enums\KitStatus;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Exception;

class KitServiceTest extends TestCase
{
    use RefreshDatabase;

    protected KitService $service;

    protected function setUp(): void
    {
        parent::setUp();
        $this->service = app(KitService::class);
    }

    public function test_rastrear_disponivel_para_em_uso(): void
    {
        $kit = Kit::factory()->create([
            'kit_status' => KitStatus::DISPONIVEL->value,
            'coletador_id' => 1,
        ]);

        $result = $this->service->rastrear(
            $kit,
            KitStatus::EM_USO->value,
            'Campo - Bairro Centro',
            'Coleta iniciada'
        );

        $this->assertTrue($result);
        $this->assertEquals(KitStatus::EM_USO->value, $kit->fresh()->kit_status);
        $this->assertEquals('Campo - Bairro Centro', $kit->fresh()->kit_local);
    }

    public function test_rastrear_sem_coletador(): void
    {
        $kit = Kit::factory()->create([
            'kit_status' => KitStatus::DISPONIVEL->value,
            'coletador_id' => null,
        ]);

        $this->expectException(Exception::class);
        $this->expectExceptionMessage('coletador designado');

        $this->service->rastrear($kit, KitStatus::EM_USO->value);
    }

    public function test_rastrear_transicao_invalida(): void
    {
        $kit = Kit::factory()->create([
            'kit_status' => KitStatus::DESCARTADO->value,
        ]);

        $this->expectException(Exception::class);
        $this->expectExceptionMessage('Transição inválida');

        $this->service->rastrear($kit, KitStatus::DISPONIVEL->value);
    }

    public function test_verificar_vencimento(): void
    {
        Kit::factory()->create([
            'data_vencimento' => now()->subDays(5),
            'kit_status' => KitStatus::DISPONIVEL->value,
        ]);
        Kit::factory()->create([
            'data_vencimento' => now()->subDays(15),
            'kit_status' => KitStatus::EM_USO->value,
        ]);
        Kit::factory()->create([
            'data_vencimento' => now()->addDays(30),
            'kit_status' => KitStatus::DISPONIVEL->value,
        ]);

        $resultado = $this->service->verificarVencimento();

        $this->assertEquals(2, $resultado['total_vencidos']);
    }

    public function test_obter_por_local(): void
    {
        Kit::factory()->count(3)->create(['kit_local' => 'Sala 101']);
        Kit::factory()->count(2)->create(['kit_local' => 'Sala 202']);
        Kit::factory()->create([
            'kit_local' => 'Sala 101',
            'kit_status' => KitStatus::DESCARTADO->value,
        ]);

        $kits = $this->service->obterPorLocal('Sala 101');

        $this->assertEquals(3, $kits->count());
    }

    public function test_obter_por_coletador(): void
    {
        Kit::factory()->count(2)->create([
            'coletador_id' => 1,
            'kit_status' => KitStatus::EM_USO->value,
        ]);
        Kit::factory()->create([
            'coletador_id' => 1,
            'kit_status' => KitStatus::DISPONIVEL->value,
        ]);

        $kits = $this->service->obterPorColetador(1);

        $this->assertEquals(2, $kits->count());
    }

    public function test_contagem_por_status(): void
    {
        Kit::factory()->count(5)->create(['kit_status' => KitStatus::DISPONIVEL->value]);
        Kit::factory()->count(3)->create(['kit_status' => KitStatus::EM_USO->value]);
        Kit::factory()->count(2)->create(['kit_status' => KitStatus::DANIFICADO->value]);

        $contagem = $this->service->contagemPorStatus();

        $this->assertCount(6, $contagem);
        $this->assertEquals(5, $contagem[0]['quantidade']); // DISPONIVEL
        $this->assertEquals(3, $contagem[1]['quantidade']); // EM_USO
    }

    public function test_workflow_rastreamento(): void
    {
        $kit = Kit::factory()->create([
            'kit_status' => KitStatus::DISPONIVEL->value,
            'coletador_id' => 1,
        ]);

        // DISPONIVEL → EM_USO
        $this->service->rastrear($kit, KitStatus::EM_USO->value, 'Campo A');
        $this->assertEquals(KitStatus::EM_USO->value, $kit->fresh()->kit_status);

        // EM_USO → RETORNADO
        $this->service->rastrear($kit, KitStatus::RETORNADO->value, 'Laboratório');
        $this->assertEquals(KitStatus::RETORNADO->value, $kit->fresh()->kit_status);

        // RETORNADO → DANIFICADO
        $this->service->rastrear($kit, KitStatus::DANIFICADO->value, null, 'Tubo quebrado');
        $this->assertEquals(KitStatus::DANIFICADO->value, $kit->fresh()->kit_status);

        // DANIFICADO → DESCARTADO
        $this->service->rastrear($kit, KitStatus::DESCARTADO->value);
        $this->assertEquals(KitStatus::DESCARTADO->value, $kit->fresh()->kit_status);
    }
}
