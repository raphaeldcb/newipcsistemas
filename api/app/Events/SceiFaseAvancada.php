<?php

namespace App\Events;

use App\Models\Scei;
use App\Enums\SceiFase;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class SceiFaseAvancada
{
    use Dispatchable, SerializesModels;

    public function __construct(
        public Scei $scei,
        public SceiFase $faseAnterior,
        public SceiFase $faseNova,
        public ?array $resultado = null,
        public ?string $motivo = null
    ) {
    }
}
