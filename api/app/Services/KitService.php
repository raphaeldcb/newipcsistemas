<?php

namespace App\Services;

use App\Models\Kit;
use App\Enums\KitStatus;
use App\Events\KitRastreado;
use App\Repositories\KitRepository;
use Illuminate\Support\Facades\DB;
use Exception;

class KitService extends BaseService
{
    public function __construct(KitRepository $repository)
    {
        parent::__construct($repository);
    }

    public function rastrear(Kit $kit, int $novoStatus, ?string $local = null, ?string $motivo = null): bool
    {
        DB::beginTransaction();
        try {
            $statusAnterior = KitStatus::from($kit->kit_status);
            $statusNovo = KitStatus::from($novoStatus);

            // Validar transição
            if (!$statusAnterior->canTransitionTo($statusNovo)) {
                throw new Exception("Transição inválida de {$statusAnterior->label()} para {$statusNovo->label()}");
            }

            // Validações específicas
            $this->validarTransicao($kit, $statusNovo);

            // Atualizar status e local
            $kit->kit_status = $novoStatus;
            if ($local) {
                $kit->kit_local = $local;
            }
            $kit->save();

            // Disparar evento de rastreamento
            event(new KitRastreado($kit, $statusAnterior, $statusNovo, $local, $motivo));

            DB::commit();
            return true;
        } catch (Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }

    protected function validarTransicao(Kit $kit, KitStatus $statusNovo): void
    {
        switch ($statusNovo) {
            case KitStatus::EM_USO:
                if (!$kit->coletador_id) {
                    throw new Exception("Kit deve ter coletador designado para ser ativado");
                }
                break;

            case KitStatus::RETORNADO:
                if (!$kit->coletador_id) {
                    throw new Exception("Kit deve ter coletador para ser retornado");
                }
                break;
        }
    }

    public function verificarVencimento(): array
    {
        $kitsVencidos = Kit::whereNotNull('data_vencimento')
            ->where('data_vencimento', '<', now())
            ->where('kit_status', '!=', KitStatus::DESCARTADO->value)
            ->where('kit_status', '!=', KitStatus::PERDIDO->value)
            ->get();

        return [
            'total_vencidos' => $kitsVencidos->count(),
            'kits' => $kitsVencidos->map(fn($kit) => [
                'id' => $kit->kit_cod,
                'numero' => $kit->kit_numero,
                'data_vencimento' => $kit->data_vencimento,
                'dias_vencido' => $kit->data_vencimento->diffInDays(now()),
            ]),
        ];
    }

    public function obterPorLocal(string $local)
    {
        return Kit::where('kit_local', $local)
            ->where('kit_status', '!=', KitStatus::DESCARTADO->value)
            ->where('kit_status', '!=', KitStatus::PERDIDO->value)
            ->get();
    }

    public function obterPorColetador(int $coletadorId)
    {
        return Kit::where('coletador_id', $coletadorId)
            ->where('kit_status', KitStatus::EM_USO->value)
            ->get();
    }

    public function contagemPorStatus(): array
    {
        $contagens = [];
        foreach (KitStatus::cases() as $status) {
            $contagens[] = [
                'status_id' => $status->value,
                'status_label' => $status->label(),
                'quantidade' => Kit::where('kit_status', $status->value)->count(),
            ];
        }
        return $contagens;
    }
}
