<?php

namespace App\Listeners;

use App\Events\CasoTransicionado;
use App\Models\Historico;

class RegistrarHistoricoCaso
{
    public function handle(CasoTransicionado $event): void
    {
        Historico::create([
            'pro_cod' => $event->caso->pro_cod,
            'his_status_anterior' => $event->statusAnterior->value,
            'his_status_novo' => $event->statusNovo->value,
            'his_motivo' => $event->motivo,
            'his_usuario' => auth()->user()->email ?? 'sistema',
            'his_data' => now(),
        ]);
    }
}
