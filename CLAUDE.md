# Migração SCPG: Delphi/Firebird → PHP/API/MySQL

> Este arquivo é lido automaticamente no início de cada sessão. Mantenha-o CURTO.
> Detalhes ficam em docs/. Estado atual e próximos passos: @docs/PROGRESSO.md

## Objetivo
Migrar o sistema legado Delphi + Firebird 2.5 para PHP (API REST) + MySQL 8.3.
Domínio (inferido do schema, CONFIRMAR): laboratório / processos (casos), pessoas, coletas, kits, alelos e marcadores, laudos.

## Regras de trabalho
- Responda sempre em português do Brasil.
- `legado/delphi/` é SOMENTE LEITURA. Nunca altere o código legado.
- Antes de implementar um módulo: ler o código Delphi correspondente e registrar as regras de negócio em docs/.
- Paridade: o comportamento novo deve bater com o legado (comparar saídas com o Firebird quando possível).
- Nada de credenciais no repositório. Use `.env` (já no .gitignore). NUNCA enviar/commitar dados reais (LGPD): só estrutura e amostras anonimizadas.
- Decisões de arquitetura/banco vão em docs/DECISOES.md (formato ADR curto).
- Ao final de cada bloco de trabalho: rodar /encerrar (atualiza PROGRESSO.md, DECISOES.md e faz commit).
- Ao começar uma sessão: rodar /retomar.
- Pedir confirmação antes de ações destrutivas (apagar arquivos, DROP, reset de banco, reescrever histórico git).

## Banco (já convertido)
- Origem: banco/firebird/estrutura.sql  → Destino: banco/mysql/estrutura_mysql.sql
- MySQL 8.3, schema `sgbd_scpg`, utf8mb4 / utf8mb4_0900_ai_ci, InnoDB, nomes em minúsculo.
- Detalhes e armadilhas: @docs/banco/CONVERSAO-FIREBIRD-MYSQL.md

## Stack alvo (PREENCHER após definir a arquitetura, ver docs/ARQUITETURA.md)
- PHP: <versão> | Framework: <a definir> | Autenticação: <a definir>
- Comandos: instalar `composer install` | testes `<a definir>` | servidor local `<a definir>`

## Mapa do repositório
- legado/delphi/   código-fonte Delphi (somente leitura)
- banco/           scripts Firebird, MySQL e de migração de dados
- api/             nova API PHP
- docs/            arquitetura, decisões, progresso, mapeamentos
