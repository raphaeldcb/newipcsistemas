<?php

namespace App\Enums;

enum KitStatus: int
{
    case DISPONIVEL = 1;
    case EM_USO = 2;
    case RETORNADO = 3;
    case DANIFICADO = 4;
    case DESCARTADO = 5;
    case PERDIDO = 6;

    public function label(): string
    {
        return match($this) {
            self::DISPONIVEL => 'Disponível',
            self::EM_USO => 'Em Uso',
            self::RETORNADO => 'Retornado',
            self::DANIFICADO => 'Danificado',
            self::DESCARTADO => 'Descartado',
            self::PERDIDO => 'Perdido',
        };
    }

    public function canTransitionTo(self $target): bool
    {
        $transitions = [
            self::DISPONIVEL => [self::EM_USO, self::DESCARTADO],
            self::EM_USO => [self::RETORNADO, self::DANIFICADO, self::PERDIDO],
            self::RETORNADO => [self::EM_USO, self::DANIFICADO, self::DESCARTADO],
            self::DANIFICADO => [self::DESCARTADO, self::DISPONIVEL],
            self::DESCARTADO => [],
            self::PERDIDO => [self::DESCARTADO],
        ];

        return in_array($target, $transitions[$this] ?? []);
    }
}
