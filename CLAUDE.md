# Novos Sistemas IPC — Unificação Completa

> Migração do App Comunicações (PHP puro) + SCPG (Laravel) em uma aplicação única.
> Este arquivo é lido automaticamente no início de cada sessão.

## 📌 Contexto

**Status**: Em unificação (Etapa 2/8)  
**Stack**: Laravel 13 + PHP 8.3 + MySQL 8.3  
**Bancos**: `sgbd_scpg` único (59 tabelas SCPG + 6 tabelas Comunicações)  
**Módulos**: Comunicações, Casos, Pessoas, Kits, Extrações, SCEI, Créditos, Alelos, Relatórios, Admin

## 🎯 Regras de Trabalho

- **Português do Brasil** sempre.
- **Sem credenciais** no repositório (`.env` no `.gitignore`).
- **Sem dados reais** (LGPD): estrutura e amostras anonimizadas apenas.
- **Decisões** em `docs/DECISOES.md` (ADRs).
- **Regras de negócio** em `docs/REGRAS-NEGOCIO-*.md`.
- **Testes**: `composer test` deve passar (banco separado `sgbd_scpg_test`).
- **NUNCA** `php artisan migrate:fresh/reset` contra `sgbd_scpg`.
- Confirmação antes de ações destrutivas (DROP, rm -rf, rewrite git).

## 📁 Estrutura de Pastas

```
newipcsistemas/
├── api/                    ← Laravel (raiz, ex.: migracao_outubro/api)
│   ├── app/ (Models, Controllers, Services, Repositories, ...)
│   ├── database/migrations/ (18+ migrations)
│   ├── resources/views/    (Blade: auth, dashboard, comunicacoes, casos, ...)
│   ├── routes/             (web.php, api.php)
│   ├── .env.example        (variáveis: GRAPH_*, OLLAMA_*, DB_*, ...)
│   └── composer.json, artisan, vite.config.js, phpunit.xml, ...
│
├── python/                 ← Serviço auxiliar (Ollama/Qwen)
│   ├── QwenClassifierService.py
│   ├── extraction_service.py
│   └── requirements.txt
│
├── banco/                  ← Scripts de banco
│   ├── mysql/estrutura_mysql.sql
│   ├── migracao/, firebird/
│   └── converter_migrations.py
│
├── docs/                   ← Documentação consolidada
│   ├── ARQUITETURA.md
│   ├── DECISOES.md (15 ADRs)
│   ├── REGRAS-NEGOCIO-*.md
│   ├── PROGRESSO.md
│   ├── banco/CONVERSAO-FIREBIRD-MYSQL.md
│   └── superpowers/
│
├── _antigo/                ← App Comunicações (temporário, será deletado)
│   ├── html/ (views antigo)
│   ├── config-comunicacoes.php
│   ├── index.php, api.php
│   └── ...
│
├── CLAUDE.md               ← Este arquivo
├── README.md               ← Setup + troubleshooting
├── .env.example            ← Variáveis de ambiente
├── .gitignore              ← Legado, migracao_outubro, .env, etc.
└── backup-bancos.sh        ← Script de backup (Etapa 1)
```

## 🔧 Stack Técnico

| Componente | Tecnologia |
|---|---|
| **Linguagem** | PHP 8.3+ |
| **Framework** | Laravel 13 |
| **Banco** | MySQL 8.3 (InnoDB) |
| **ORM** | Eloquent |
| **Autenticação** | Laravel Sanctum (JWT 24h, refresh 7d) + sessão web |
| **Front-end** | Blade + Vite |
| **Classificação** | Qwen 7B (Ollama, timeout 30s) + fallback keyword matching |
| **PDF/Excel** | TCPDF, PhpSpreadsheet |
| **Testes** | PHPUnit + Pest (80%+ coverage) |
| **Cache** | Redis (opcional) |
| **Logging** | Monolog (Laravel padrão) |

## 📋 Etapas de Unificação (8 total)

1. ✅ **Preparação**: tag pre-unificacao, branch unificacao, backup bancos
2. ⏳ **Estrutura** (esta etapa): mover Laravel, consolidar docs/banco, remover legado
3. ⏳ **Banco**: migrations unificadas, merge users
4. ⏳ **Back-end**: portar Comunicações para Laravel
5. ⏳ **Front-end**: Blade + Vite, menu único, MVP
6. ⏳ **Testes**: portar tests, cobertura 80%+
7. ⏳ **Limpeza**: remover scripts soltos, documentação final
8. ⏳ **GitHub**: push, PR, merge em main

## 🚀 Quick Start (Depois da Unificação)

```bash
# Instalar dependências
composer install
npm install

# Configurar ambiente
cp api/.env.example .env
# Editar .env: DB_*, GRAPH_*, OLLAMA_*, etc.

# Migrations (NÃO usar migrate:fresh contra sgbd_scpg)
php artisan migrate

# Seed admin
php artisan db:seed --class=AdminSeeder

# Servidor
php artisan serve          # http://localhost:8000
npm run dev                # Vite (assets)

# Testes
composer test              # PHPUnit
```

## 📍 Documentação Chave

- **docs/ARQUITETURA.md** — Stack, padrões, estrutura Laravel
- **docs/DECISOES.md** — 15 ADRs (Laravel 11, Sanctum, Eloquent, soft deletes, etc.)
- **docs/REGRAS-NEGOCIO-*.md** — Casos, Créditos, Extrações, SCEI
- **docs/banco/CONVERSAO-FIREBIRD-MYSQL.md** — Migração Firebird→MySQL, armadilhas
- **docs/PROGRESSO.md** — Estado atual, próximos passos
- **README.md** — Setup, troubleshooting, deploy

## 🔐 Segurança

- ✅ Senhas: bcrypt (Laravel padrão)
- ✅ API: Sanctum JWT + HTTPS (produção)
- ✅ Validação: Form Requests, input sanitização
- ✅ LGPD: soft deletes, auditoria, event sourcing
- ✅ NUNCA: credenciais no git, dados reais em code, SQL injection

## 🎬 Próximos Passos (Após Aprovação)

Ao fim de cada etapa, executar `/encerrar` (não implementado ainda; será `git commit` + atualizar PROGRESSO.md).

---

**Última atualização**: 2026-10-06 (Etapa 2)  
**Responsável**: Unificação em progresso
