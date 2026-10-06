<?php

namespace App\Events;

use App\Models\Caso;
use Illuminate\Broadcasting\InteractsWithBroadcasting;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class CasoCriado
{
    use Dispatchable, SerializesModels;

    public function __construct(public Caso $caso)
    {
    }
}
