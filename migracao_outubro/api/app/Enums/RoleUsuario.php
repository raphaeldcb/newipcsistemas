<?php

namespace App\Enums;

enum RoleUsuario: string
{
    case ADMIN = 'admin';
    case PERITO = 'perito';
    case SUPERVISOR = 'supervisor';
    case ANALISTA = 'analista';
    case ASSISTENTE = 'assistente';

    public function label(): string
    {
        return match($this) {
            self::ADMIN => 'Administrador',
            self::PERITO => 'Perito',
            self::SUPERVISOR => 'Supervisor',
            self::ANALISTA => 'Analista',
            self::ASSISTENTE => 'Assistente',
        };
    }

    public function permissoes(): array
    {
        return match($this) {
            self::ADMIN => ['*'],
            self::PERITO => ['casos:criar', 'casos:editar', 'extracos:registrar', 'alelos:registrar', 'creditos:visualizar'],
            self::SUPERVISOR => ['casos:visualizar', 'relatórios:gerar', 'auditoria:visualizar'],
            self::ANALISTA => ['casos:visualizar', 'extracos:visualizar', 'alelos:visualizar'],
            self::ASSISTENTE => ['casos:visualizar', 'relatórios:visualizar'],
        };
    }
}
