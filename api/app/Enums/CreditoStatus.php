<?php

namespace App\Enums;

enum CreditoStatus: string
{
    case PENDENTE = 'pendente';
    case PARCIALMENTE_PAGO = 'parcialmente_pago';
    case PAGO = 'pago';
    case CANCELADO = 'cancelado';
    case REVERTIDO = 'revertido';

    public function label(): string
    {
        return match($this) {
            self::PENDENTE => 'Pendente',
            self::PARCIALMENTE_PAGO => 'Parcialmente Pago',
            self::PAGO => 'Pago',
            self::CANCELADO => 'Cancelado',
            self::REVERTIDO => 'Revertido',
        };
    }
}
