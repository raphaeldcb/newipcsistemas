<?php

namespace App\Events;

use App\Models\Kit;
use App\Enums\KitStatus;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class KitRastreado
{
    use Dispatchable, SerializesModels;

    public function __construct(
        public Kit $kit,
        public KitStatus $statusAnterior,
        public KitStatus $statusNovo,
        public ?string $local = null,
        public ?string $motivo = null
    ) {
    }
}
