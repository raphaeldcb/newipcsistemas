<?php

namespace App\Enums;

enum ExtracacaoFaseWeb: string
{
    case QUANTIFICACAO = 'QUANTIFICACAO';
    case QUALIFICACAO = 'QUALIFICACAO';
    case INTERPRETACAO = 'INTERPRETACAO';

    public function label(): string
    {
        return match($this) {
            self::QUANTIFICACAO => 'Quantificação',
            self::QUALIFICACAO => 'Qualificação',
            self::INTERPRETACAO => 'Interpretação',
        };
    }

    public function ordem(): int
    {
        return match($this) {
            self::QUANTIFICACAO => 1,
            self::QUALIFICACAO => 2,
            self::INTERPRETACAO => 3,
        };
    }

    public static function all(): array
    {
        return [
            self::QUANTIFICACAO,
            self::QUALIFICACAO,
            self::INTERPRETACAO,
        ];
    }
}
