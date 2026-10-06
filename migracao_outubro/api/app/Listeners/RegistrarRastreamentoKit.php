<?php

namespace App\Listeners;

use App\Events\KitRastreado;

class RegistrarRastreamentoKit
{
    public function handle(KitRastreado $event): void
    {
        // Criar registro de rastreamento
        // TODO: criar tabela tb_kit_rastreamento se necessário

        \Log::info('Kit rastreado', [
            'kit_id' => $event->kit->kit_cod,
            'kit_numero' => $event->kit->kit_numero,
            'status_anterior' => $event->statusAnterior->label(),
            'status_novo' => $event->statusNovo->label(),
            'local' => $event->local,
            'motivo' => $event->motivo,
            'usuario' => auth()->user()->email ?? 'sistema',
            'timestamp' => now(),
        ]);
    }
}
