<?php

namespace App\Listeners;

use App\Events\CasoTransicionado;
use App\Models\ProcessingLog;

class RegistrarTransicaoCaso
{
    public function handle(CasoTransicionado $event): void
    {
        ProcessingLog::create([
            'comunicacao_id' => null,
            'action' => 'caso_transicionado',
            'status' => 'SUCCESS',
            'result' => json_encode([
                'caso_id' => $event->caso->id,
                'de' => $event->statusAnterior->value,
                'para' => $event->statusNovo->value,
                'motivo' => $event->motivo,
            ]),
            'duration_ms' => 0,
        ]);
    }
}
