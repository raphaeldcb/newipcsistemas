<?php

namespace Tests\Unit\Services;

use Tests\TestCase;
use App\Models\Caso;
use App\Models\Historico;
use App\Services\CasoService;
use App\Enums\CasoStatus;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Exception;

class CasoServiceTest extends TestCase
{
    use RefreshDatabase;

    protected CasoService $service;

    protected function setUp(): void
    {
        parent::setUp();
        $this->service = app(CasoService::class);
    }

    public function test_transition_pendente_to_coleta_agendada(): void
    {
        $caso = Caso::factory()->create([
            'cas_status' => CasoStatus::PENDENTE->value,
            'responsavel_id' => 1,
            'coletador_id' => 1,
        ]);

        $result = $this->service->transicionar(
            $caso,
            CasoStatus::COLETA_AGENDADA->value,
            'Agendado'
        );

        $this->assertTrue($result);
        $this->assertEquals(CasoStatus::COLETA_AGENDADA->value, $caso->fresh()->cas_status);

        // Verificar histórico
        $this->assertDatabaseHas('tb_historico', [
            'pro_cod' => $caso->pro_cod,
            'his_status_anterior' => CasoStatus::PENDENTE->value,
            'his_status_novo' => CasoStatus::COLETA_AGENDADA->value,
        ]);
    }

    public function test_transition_requires_responsavel_and_coletador(): void
    {
        $caso = Caso::factory()->create([
            'cas_status' => CasoStatus::PENDENTE->value,
            'responsavel_id' => null,
            'coletador_id' => null,
        ]);

        $this->expectException(Exception::class);
        $this->expectExceptionMessage('Caso deve ter responsável e coletador designados');

        $this->service->transicionar(
            $caso,
            CasoStatus::COLETA_AGENDADA->value
        );
    }

    public function test_invalid_transition(): void
    {
        $caso = Caso::factory()->create([
            'cas_status' => CasoStatus::CASO_FINALIZADO->value,
        ]);

        $this->expectException(Exception::class);
        $this->expectExceptionMessage('Transição inválida');

        $this->service->transicionar(
            $caso,
            CasoStatus::PENDENTE->value
        );
    }

    public function test_generate_credits_on_finalization(): void
    {
        $caso = Caso::factory()->create([
            'cas_status' => CasoStatus::LAUDO_EMITIDO->value,
            'medico_id' => 1,
        ]);

        $this->service->transicionar(
            $caso,
            CasoStatus::CASO_FINALIZADO->value,
            'Laudo aprovado'
        );

        // Verificar que créditos foram gerados
        $this->assertDatabaseHas('tb_creditos', [
            'pro_cod' => $caso->pro_cod,
        ]);

        // Verificar que parcelas foram criadas
        $this->assertDatabaseHas('tb_parcelas', [
            'pro_cod' => $caso->pro_cod,
            'par_nparc' => 1,
        ]);
    }

    public function test_workflow_sequence(): void
    {
        $caso = Caso::factory()->create([
            'cas_status' => CasoStatus::PENDENTE->value,
            'responsavel_id' => 1,
            'coletador_id' => 1,
            'medico_id' => 1,
        ]);

        // Sequência completa
        $sequence = [
            CasoStatus::COLETA_AGENDADA,
            CasoStatus::COLETA_REALIZADA,
            CasoStatus::AMOSTRA_RECEBIDA,
            CasoStatus::EM_EXTRACAO,
            CasoStatus::EXTRACAO_CONCLUIDA,
            CasoStatus::EM_ANALISE,
            CasoStatus::LAUDO_EMITIDO,
            CasoStatus::CASO_FINALIZADO,
        ];

        foreach ($sequence as $status) {
            $this->service->transicionar($caso, $status->value);
            $caso->refresh();
            $this->assertEquals($status->value, $caso->cas_status);
        }

        // Verificar histórico completo
        $historicos = Historico::where('pro_cod', $caso->pro_cod)->count();
        $this->assertEquals(count($sequence), $historicos);
    }

    public function test_cancel_at_any_state(): void
    {
        $caso = Caso::factory()->create([
            'cas_status' => CasoStatus::EM_EXTRACAO->value,
        ]);

        $this->service->transicionar(
            $caso,
            CasoStatus::CANCELADO->value,
            'Cancelado por falta de amostra'
        );

        $this->assertEquals(CasoStatus::CANCELADO->value, $caso->fresh()->cas_status);
    }
}
