<?php

namespace App\Events;

use App\Models\Extracao;
use App\Enums\ExtracacaoFase;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class ExtracacaoFaseAvancada
{
    use Dispatchable, SerializesModels;

    public function __construct(
        public Extracao $extracao,
        public ExtracacaoFase $faseAnterior,
        public ExtracacaoFase $faseNova,
        public ?array $resultado = null,
        public ?string $motivo = null
    ) {
    }
}
