# Progresso da migração

_Atualizado por /encerrar ao fim de cada sessão. Mais recente no topo._

## Estado atual (2026-10-06)
- [x] Estrutura do banco convertida de Firebird 2.5 para MySQL 8.3 (banco/mysql/estrutura_mysql.sql)
- [x] Exportador de dados Firebird → MySQL (banco/migracao/exportar_dados_firebird.py), arquivos de até 500 mil registros
- [ ] Carga de dados validada no MySQL (conferir contagens com banco/migracao/conferencia_mysql.sql)
- [x] **FASE 1: Inventário completo do código Delphi** ✅
  - [x] 116 units mapeadas
  - [x] 30+ forms catalogadas
  - [x] 5 DataModules documentadas
  - [x] 17 relatórios listados
  - [x] 9 fatias de implementação mapeadas
  - [x] 20 dúvidas críticas levantadas
- [x] **FASE 2: Arquitetura definida** ✅
  - [x] Stack: Laravel 11, Sanctum JWT, Eloquent ORM
  - [x] 5 respostas de alta prioridade incorporadas
  - [x] Estrutura de diretórios proposta
  - [x] Padrões de design (Service, Repository, State Machine, Events)
  - [x] REST API endpoints estruturados
  - [x] Workflow de Casos documentado
- [ ] Regras de negócio detalhadas por módulo (em progresso)
  - [x] Casos (REGRAS-NEGOCIO-CASOS.md)
  - [ ] Créditos e Parcelamento
  - [ ] Extrações (ADN — 3 fases)
  - [ ] SCEI (Laboratório)
- [ ] Setup de ambiente local (Laravel project scaffolding)
- [ ] Database migrations geradas (Eloquent)
- [ ] Implementação dos módulos (Fase 4+)

## Próximos passos
1. **Fase 3**: Documentar regras de negócio para Créditos, Extrações, SCEI
2. **Fase 3**: Criar DECISOES.md (decisions log)
3. **Fase 4**: Setup Laravel scaffolding + migrations
4. **Fase 4**: Implementar Fatia 1 (Pessoas) com testes
5. **Fase 5**: Progressão para demais fatias (Casos, Kits, Extrações, etc)

## Diário

### 2026-10-06 (Fase 1 + 2 Concluídas)
- ✅ Inventário completo: 116 units, 30+ forms, 17 relatórios
  - Gerado: INVENTARIO.md, MAPA-DELPHI-PHP.md, DUVIDAS-FASE1.md, LEIA-ME-FASE1.md
- ✅ Respondidas 5 questões de alta prioridade:
  1. Relatórios: QuickReport + Fortes Report CE
  2. Workflow: Integrações manuais inicialmente, depois automatizar
  3. SCEI: Integrado (não separado)
  4. Segurança: Migrar usuários e criptografar senhas
  5. Autenticação: Local (username/password + JWT)
- ✅ Arquitetura definida:
  - Framework: Laravel 11
  - Auth: Sanctum JWT (24h tokens)
  - ORM: Eloquent
  - PDF: TCPDF + PhpSpreadsheet
  - Pattern: Service/Repository/Resources/Events
  - Testes: PHPUnit + Pest, 80% coverage
- ✅ Regras de Negócio (Casos):
  - 10 estados de workflow definidos
  - Transições manuais (MVP) → automáticas (future)
  - Validações por estado
  - Histórico (auditoria) completo
  - Créditos gatilhados ao finalizar caso
  - Roles e permissões
  - Exemplo completo de caso fim-a-fim

### Commits
1. d7dcddf: Phase 1 complete — Inventory + Mapping
2. fb55aa5: Phase 1 — Navigation guides
3. 9a164fc: Phase 2 complete — Architecture + Business Rules (Cases)
