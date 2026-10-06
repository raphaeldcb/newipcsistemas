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
- [x] **FASE 3: Regras de negócio detalhadas + Decisões arquiteturais** ✅
  - [x] Casos (REGRAS-NEGOCIO-CASOS.md)
  - [x] Créditos e Parcelamento (REGRAS-NEGOCIO-CREDITOS.md)
  - [x] Extrações ADN — 3 fases (REGRAS-NEGOCIO-EXTRACOS.md)
  - [x] SCEI — Laboratório (REGRAS-NEGOCIO-SCEI.md)
  - [x] 15 ADRs documentadas (DECISOES.md)
- [ ] **FASE 4: Setup Laravel + Migrations** ⏳
  - [ ] Laravel 11 project scaffolding
  - [ ] Database migrations (19+ tabelas)
  - [ ] Models + Repositories base
  - [ ] Fatia 1 (Pessoas) com testes
- [ ] **FASE 5: Implementação das fatias** ⏳

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

### 2026-10-06 (Fase 3 Concluída)
- ✅ Créditos & Parcelamento (18 KB):
  - 5-factor calculation (BASE × FATOR_TIPO × FATOR_JUIZ × FATOR_VARA × FATOR_CATEGORIA)
  - 3x installments default, status management, reversals on cancellation
- ✅ Extrações ADN (25 KB) — 3 Fases sequenciais:
  - Fase 1 (Extração): Isolate pure DNA, concentration 50-500 ng/µL, quality A260/A280 ≥ 1.7
  - Fase 2 (Amplificação): PCR multiply, band present, correct size ±5 bp
  - Fase 3 (Sequenciamento): Determine alleles, quality ≥95%, all markers, 100% replicate match
- ✅ SCEI (22 KB) — Laboratório integrado:
  - 9-state workflow (PENDENTE → LAUDO_FINALIZADO / CANCELADO)
  - Common exams (HIV, Hepatite, TB, Dengue, malária)
  - Integration with SCPG, separate billing model
- ✅ 15 ADRs Arquiteturais (DECISOES.md):
  - ADR-001/002: Laravel + Eloquent
  - ADR-003: Sanctum JWT (24h access, 7d refresh)
  - ADR-004: MySQL 8.3
  - ADR-005/006: Repository + Service Layer
  - ADR-007: MVP manual transitions
  - ADR-008/009: Soft deletes + Event auditoria (LGPD)
  - ADR-010: Monolito SCPG+SCEI
  - ADR-011: Bcrypt passwords
  - ADR-012/013: PHPUnit + Pest + Async notifications
  - ADR-014: Bounded contexts
  - ADR-015: Schema Builder migrations

### Commits (Fase 3)
1. a0db7e9: docs(phase-3): Créditos & Parcelamento
2. 92b32b2: docs(phase-3): Extração ADN (3 fases)
3. c3c7bd1: docs(phase-3): SCEI Laboratório
4. 1df754f: docs(phase-3): ADR — 15 decisões arquiteturais

### Histórico Completo
1. d7dcddf: Phase 1 complete — Inventory + Mapping
2. fb55aa5: Phase 1 — Navigation guides
3. 9a164fc: Phase 2 complete — Architecture + Business Rules (Cases)
4. a0db7e9 → 1df754f: Phase 3 complete — Business Rules (Créditos, Extrações, SCEI) + ADRs
