<?php

namespace App\Listeners;

use App\Events\CasoTransicionado;
use App\Enums\CasoStatus;
use App\Models\Credito;
use App\Models\Parcela;

class GerarCreditosCaso
{
    public function handle(CasoTransicionado $event): void
    {
        // Apenas executar quando caso finalizado
        if ($event->statusNovo !== CasoStatus::CASO_FINALIZADO) {
            return;
        }

        // Calcular valor base (TODO: implementar 5-factor formula)
        $valorBase = $this->calcularValorBase($event->caso);

        // Criar crédito principal
        $credito = Credito::create([
            'pro_cod' => $event->caso->pro_cod,
            'cre_vlr' => $valorBase,
            'cre_status' => 'pendente',
            'cre_data' => now(),
        ]);

        // Gerar parcelas (3x por padrão)
        $valorParcela = $valorBase / 3;
        for ($i = 1; $i <= 3; $i++) {
            Parcela::create([
                'pro_cod' => $event->caso->pro_cod,
                'par_nparc' => $i,
                'par_vlr' => $valorParcela,
                'par_data' => now()->addDays($i * 10),
                'par_sit' => 1, // PENDENTE
            ]);
        }
    }

    protected function calcularValorBase($caso): float
    {
        // TODO: Implementar 5-factor calculation
        // BASE × FATOR_TIPO × FATOR_JUIZ × FATOR_VARA × FATOR_CATEGORIA
        return 1000.00;
    }
}
