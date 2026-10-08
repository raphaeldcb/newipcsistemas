<?php

namespace App\Providers;

use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use App\Events\CasoCriado;
use App\Events\CasoTransicionado;
use App\Listeners\RegistrarHistoricoCaso;
use App\Listeners\GerarCreditosCaso;
use App\Listeners\RegistrarTransicaoCaso;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        Registered::class => [
            SendEmailVerificationNotification::class,
        ],
        CasoCriado::class => [
            // Adicionar listeners aqui se necessário
        ],
        CasoTransicionado::class => [
            RegistrarHistoricoCaso::class,
            GerarCreditosCaso::class,
            RegistrarTransicaoCaso::class,
        ],
    ];

    public function boot(): void
    {
        //
    }

    public function shouldDiscoverEvents(): bool
    {
        return false;
    }
}
