<?php

namespace App\Enums;

enum SceiFase: int
{
    case PENDENTE = 1;
    case AMOSTRA_RECEBIDA = 2;
    case EM_ANALISE = 3;
    case RESULTADO_LIBERADO = 4;
    case LAUDO_EMITIDO = 5;
    case LAUDO_FINALIZADO = 6;
    case CANCELADO = 7;

    public function label(): string
    {
        return match($this) {
            self::PENDENTE => 'Pendente',
            self::AMOSTRA_RECEBIDA => 'Amostra Recebida',
            self::EM_ANALISE => 'Em Análise',
            self::RESULTADO_LIBERADO => 'Resultado Liberado',
            self::LAUDO_EMITIDO => 'Laudo Emitido',
            self::LAUDO_FINALIZADO => 'Laudo Finalizado',
            self::CANCELADO => 'Cancelado',
        };
    }

    public function canTransitionTo(self $target): bool
    {
        $transitions = [
            self::PENDENTE => [self::AMOSTRA_RECEBIDA, self::CANCELADO],
            self::AMOSTRA_RECEBIDA => [self::EM_ANALISE, self::CANCELADO],
            self::EM_ANALISE => [self::RESULTADO_LIBERADO, self::CANCELADO],
            self::RESULTADO_LIBERADO => [self::LAUDO_EMITIDO, self::CANCELADO],
            self::LAUDO_EMITIDO => [self::LAUDO_FINALIZADO, self::CANCELADO],
            self::LAUDO_FINALIZADO => [self::CANCELADO],
            self::CANCELADO => [],
        ];

        return in_array($target, $transitions[$this] ?? []);
    }
}
