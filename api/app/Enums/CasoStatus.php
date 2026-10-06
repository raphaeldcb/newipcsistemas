<?php

namespace App\Enums;

enum CasoStatus: int
{
    case PENDENTE = 1;
    case COLETA_AGENDADA = 2;
    case COLETA_REALIZADA = 3;
    case AMOSTRA_RECEBIDA = 4;
    case EM_EXTRACAO = 5;
    case EXTRACAO_CONCLUIDA = 6;
    case EM_ANALISE = 7;
    case LAUDO_EMITIDO = 8;
    case CASO_FINALIZADO = 9;
    case CANCELADO = 10;

    public function label(): string
    {
        return match($this) {
            self::PENDENTE => 'Pendente',
            self::COLETA_AGENDADA => 'Coleta Agendada',
            self::COLETA_REALIZADA => 'Coleta Realizada',
            self::AMOSTRA_RECEBIDA => 'Amostra Recebida',
            self::EM_EXTRACAO => 'Em Extração',
            self::EXTRACAO_CONCLUIDA => 'Extração Concluída',
            self::EM_ANALISE => 'Em Análise',
            self::LAUDO_EMITIDO => 'Laudo Emitido',
            self::CASO_FINALIZADO => 'Caso Finalizado',
            self::CANCELADO => 'Cancelado',
        };
    }

    public function canTransitionTo(self $target): bool
    {
        $transitions = [
            self::PENDENTE => [self::COLETA_AGENDADA, self::CANCELADO],
            self::COLETA_AGENDADA => [self::COLETA_REALIZADA, self::CANCELADO],
            self::COLETA_REALIZADA => [self::AMOSTRA_RECEBIDA, self::CANCELADO],
            self::AMOSTRA_RECEBIDA => [self::EM_EXTRACAO, self::CANCELADO],
            self::EM_EXTRACAO => [self::EXTRACAO_CONCLUIDA, self::CANCELADO],
            self::EXTRACAO_CONCLUIDA => [self::EM_ANALISE, self::CANCELADO],
            self::EM_ANALISE => [self::LAUDO_EMITIDO, self::CANCELADO],
            self::LAUDO_EMITIDO => [self::CASO_FINALIZADO, self::CANCELADO],
            self::CASO_FINALIZADO => [self::CANCELADO],
            self::CANCELADO => [],
        ];

        return in_array($target, $transitions[$this] ?? []);
    }
}
