<?php

namespace App\Services;

use App\Models\Caso;
use App\Enums\CasoStatus;
use InvalidArgumentException;

class EstadoCasoService
{
    public function transicionar(Caso $caso, CasoStatus $novoStatus, string $motivo = ''): bool
    {
        $transicoes_validas = [
            CasoStatus::ABERTO => [CasoStatus::JULGADO, CasoStatus::CANCELADO],
            CasoStatus::JULGADO => [CasoStatus::ENCERRADO, CasoStatus::ABERTO],
            CasoStatus::ENCERRADO => [],
            CasoStatus::CANCELADO => [CasoStatus::ABERTO],
        ];

        $statusAtual = CasoStatus::from($caso->status);
        if (!in_array($novoStatus, $transicoes_validas[$statusAtual] ?? [])) {
            throw new InvalidArgumentException("Transição inválida: {$statusAtual->value} → {$novoStatus->value}");
        }

        $caso->update(['status' => $novoStatus->value]);
        event(new \App\Events\CasoTransicionado($caso, $statusAtual, $novoStatus, $motivo));
        return true;
    }
}
