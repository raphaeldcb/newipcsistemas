<?php

namespace App\Enums;

enum CasoStatus: string
{
    case ABERTO = 'ABERTO';
    case JULGADO = 'JULGADO';
    case ENCERRADO = 'ENCERRADO';
    case CANCELADO = 'CANCELADO';

    public function label(): string
    {
        return match($this) {
            self::ABERTO => 'Aberto',
            self::JULGADO => 'Julgado',
            self::ENCERRADO => 'Encerrado',
            self::CANCELADO => 'Cancelado',
        };
    }
}
