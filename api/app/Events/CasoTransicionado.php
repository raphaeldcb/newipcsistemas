<?php

namespace App\Events;

use App\Models\Caso;
use App\Enums\CasoStatus;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class CasoTransicionado
{
    use Dispatchable, SerializesModels;

    public function __construct(
        public Caso $caso,
        public CasoStatus $statusAnterior,
        public CasoStatus $statusNovo,
        public ?string $motivo = null
    ) {
    }
}
