<?php

namespace App\Enums;

enum ExtracacaoFase: int
{
    case PENDENTE = 0;
    case EXTRACAO_INICIADA = 1;
    case EXTRACAO_CONCLUIDA = 2;
    case AMPLIFICACAO_INICIADA = 3;
    case AMPLIFICACAO_CONCLUIDA = 4;
    case SEQUENCIAMENTO_INICIADO = 5;
    case SEQUENCIAMENTO_CONCLUIDO = 6;
    case FALHA = 7;

    public function label(): string
    {
        return match($this) {
            self::PENDENTE => 'Pendente',
            self::EXTRACAO_INICIADA => 'Extração Iniciada',
            self::EXTRACAO_CONCLUIDA => 'Extração Concluída',
            self::AMPLIFICACAO_INICIADA => 'Amplificação Iniciada',
            self::AMPLIFICACAO_CONCLUIDA => 'Amplificação Concluída',
            self::SEQUENCIAMENTO_INICIADO => 'Sequenciamento Iniciado',
            self::SEQUENCIAMENTO_CONCLUIDO => 'Sequenciamento Concluído',
            self::FALHA => 'Falha',
        };
    }

    public function fase(): int
    {
        return match($this) {
            self::PENDENTE => 0,
            self::EXTRACAO_INICIADA, self::EXTRACAO_CONCLUIDA => 1,
            self::AMPLIFICACAO_INICIADA, self::AMPLIFICACAO_CONCLUIDA => 2,
            self::SEQUENCIAMENTO_INICIADO, self::SEQUENCIAMENTO_CONCLUIDO => 3,
            self::FALHA => 0,
        };
    }

    public function canTransitionTo(self $target): bool
    {
        $transitions = [
            self::PENDENTE => [self::EXTRACAO_INICIADA, self::FALHA],
            self::EXTRACAO_INICIADA => [self::EXTRACAO_CONCLUIDA, self::FALHA],
            self::EXTRACAO_CONCLUIDA => [self::AMPLIFICACAO_INICIADA, self::EXTRACAO_INICIADA, self::FALHA],
            self::AMPLIFICACAO_INICIADA => [self::AMPLIFICACAO_CONCLUIDA, self::FALHA],
            self::AMPLIFICACAO_CONCLUIDA => [self::SEQUENCIAMENTO_INICIADO, self::AMPLIFICACAO_INICIADA, self::FALHA],
            self::SEQUENCIAMENTO_INICIADO => [self::SEQUENCIAMENTO_CONCLUIDO, self::FALHA],
            self::SEQUENCIAMENTO_CONCLUIDO => [self::FALHA],
            self::FALHA => [self::EXTRACAO_INICIADA],
        ];

        return in_array($target, $transitions[$this] ?? []);
    }
}
