# Log de Decisões Arquiteturais (ADR)

> Architecture Decision Record (ADR) — Decisões e Rationale.
> Documento vivo: atualizar conforme novas decisões forem tomadas.
> Última atualização: 2026-10-06

---

## ADR-001 — Framework: Laravel 11

**Status**: Decidido | **Impacto**: Arquitetura

### Decisão
Usar **Laravel 11** como framework principal.

### Rationale
- Learning curve baixa, ecossistema rico
- Sanctum (JWT), Eloquent (ORM), Breeze (scaffolding) integrados
- Community grande, deployment conhecido
- Alternativas (Symfony, Slim) tinham overhead maior

### Consequências
**✓** Produtividade alta, team onboarding rápido  
**✗** Overhead ("batteries-included"), vendor lock-in potencial  
**~** Mitigado com Repository Pattern + Bounded Contexts

---

## ADR-002 — ORM: Eloquent

**Status**: Decidido | **Impacto**: Arquitetura

### Decisão
**Eloquent** (ORM nativa do Laravel) para abstração BD.

### Rationale
- Expressiva, relacionamentos simples (N:N, polymorph)
- Soft deletes + timestamps nativos
- Proteção SQL injection automática
- Sem dependência extra

### Consequências
**✓** Código limpo, testável, manutenível  
**✗** Algumas queries podem ser mais lentas (raw SQL otimizado)  
**~** N+1 mitigado com eager loading (`.with()`)

---

## ADR-003 — Autenticação: Sanctum JWT

**Status**: Decidido | **Impacto**: Segurança

### Decisão
**Laravel Sanctum** com **JWT tokens**:
- Access: 24h expiration
- Refresh: 7d (renovação automática)

### Rationale
Resposta negócio: autenticação local (username/password).  
Stateless (escalável), seguro (assinado), simples (integrado).

### Consequências
**✓** Escalável, seguro, HTTPS-ready  
**✗** Token theft possível (mitigado HTTPS + short-lived)  
**~** Revoke delay 24h (aceitável MVP)

---

## ADR-004 — Banco: MySQL 8.3

**Status**: Decidido (Fase 1) | **Impacto**: Infraestrutura

### Decisão
**Manter MySQL 8.3** (já migrado de Firebird 2.5).

### Rationale
Moderno, cloud-ready, bem suportado, ferramentas excelentes.

---

## ADR-005 — Padrão: Repository Pattern

**Status**: Decidido | **Impacto**: Arquitetura

### Decisão
**Repository**: Controller → Service → Repository → Eloquent

### Rationale
Testabilidade (mock sem BD), manutenção (trocar ORM isolado), reutilização (queries centralizadas).

---

## ADR-006 — Padrão: Service Layer

**Status**: Decidido | **Impacto**: Arquitetura

### Decisão
**Service Layer** para regra de negócio, não em Controllers.

### Rationale
Testabilidade, reutilização, escalabilidade (adicionar Queue/Jobs depois é trivial).

---

## ADR-007 — Workflow MVP: Transições Manuais

**Status**: Decidido (Negócio) | **Impacto**: Funcionalidade

### Decisão
**MVP com transições manuais** — usuário clica para avançar status.

Automação é **Fase 2+** com Job Queues.

### Rationale
Resposta negócio: "Integrações manuais no primeiro momento, depois automatizar."  
Simplicidade (state machine simples), time-to-market rápido (1-2 semanas vs 3-4).

---

## ADR-008 — Soft Deletes em Todas Tabelas

**Status**: Decidido | **Impacto**: LGPD

### Decisão
**Soft deletes**: `deleted_at` TIMESTAMP NULL em todas tabelas.

### Rationale
Auditoria (rastreia quem/quando), recuperação (reativar trivial), LGPD art. 46-48.

---

## ADR-009 — Auditoria: Events + Listeners

**Status**: Decidido | **Impacto**: LGPD

### Decisão
**Event-Driven auditoria**: `event(CasoCriado)` dispara `LogCasoHistorico` listener.

### Rationale
Desacoplado, paralelo (múltiplos listeners), testável, LGPD-compliant.

---

## ADR-010 — Monolito Único (SCPG + SCEI)

**Status**: Decidido (Negócio) | **Impacto**: Arquitetura

### Decisão
**Monolito único** com bounded contexts separados (não microserviços).

### Rationale
Resposta negócio: "Integrado".  
Simplicidade (mesma auth, DB, logger), integração futura possível.

---

## ADR-011 — Segurança: Bcrypt Passwords

**Status**: Decidido (Negócio) | **Impacto**: Segurança

### Decisão
**Bcrypt** para todas senhas (Firebird plain text → bcrypt).

### Rationale
Resposta negócio: "Migrar usuários e criptografar".  
Segurança (irrecuperável se BD roubada), LGPD art. 46.

---

## ADR-012 — Testing: PHPUnit + Pest, 80% Coverage

**Status**: Decidido | **Impacto**: Qualidade

### Decisão
**PHPUnit + Pest** com target **80% code coverage**.

### Rationale
Pest é Laravel-friendly (sintaxe limpa), Feature + Unit tests, CI/CD integrado.

---

## ADR-013 — Notifications: Events + Async Listeners

**Status**: Decidido | **Impacto**: Arquitetura

### Decisão
**Event-driven** com listeners **ShouldQueue** (async):
- Rápidos (créditos, log) → síncronos
- Lentos (email, SMS) → async com retry

### Rationale
UX (request rápida), resilience (falha não afeta), escalabilidade (workers paralelos).

---

## ADR-014 — Bounded Contexts: SCPG vs SCEI

**Status**: Decidido (DDD) | **Impacto**: Arquitetura

### Decisão
Separar domínios em diretórios:
```
app/Models/SCPG/ + app/Models/SCEI/
app/Services/SCPG/ + app/Services/SCEI/
app/Controllers/Api/SCPG/ + app/Controllers/Api/SCEI/
```

### Rationale
Clareza, escalabilidade, manutenção isolada.

---

## ADR-015 — Migrations: Schema Builder

**Status**: Decidido | **Impacto**: DevOps

### Decisão
**Laravel Schema Builder** (não raw SQL).

### Rationale
Reversibilidade (down() automático), portabilidade, safety (type-safe).

---

## Summary

15 decisões arquiteturais documentadas e decididas.  
Próximas: Job Queues, Caching, API Documentation, Error Handling.

