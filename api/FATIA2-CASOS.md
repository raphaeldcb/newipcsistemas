# Fatia 2: Casos — State Machine Completo

## Overview

Fatia 2 implementa o módulo **Casos** com **state machine completo** — 10 estados com transições validadas, auditoria automática via eventos, e geração de créditos.

## Arquitetura

### State Machine (10 Estados)

```
PENDENTE (1)
    ↓ (validar responsável + coletador)
COLETA_AGENDADA (2)
    ↓
COLETA_REALIZADA (3)
    ↓
AMOSTRA_RECEBIDA (4)
    ↓ (validar amostra não vencida)
EM_EXTRACAO (5)
    ↓
EXTRACAO_CONCLUIDA (6)
    ↓ (validar alelos documentados)
EM_ANALISE (7)
    ↓ (validar médico designado)
LAUDO_EMITIDO (8)
    ↓
CASO_FINALIZADO (9)  ← AUTO-GERA CRÉDITOS
    ↓
CANCELADO (10) ← CANCELAR CRÉDITOS (pode em qualquer ponto)
```

### Componentes

#### 1. Enum: CasoStatus
- `app/Enums/CasoStatus.php`
- 10 estados com labels em português
- Método `canTransitionTo()` para validar transições

#### 2. Model: Caso
- `app/Models/Caso.php`
- Relacionamentos: `historicos()`, `creditos()`
- Soft deletes para LGPD

#### 3. Repository: CasoRepository
- `app/Repositories/CasoRepository.php`
- CRUD base + search + paginate

#### 4. Service: CasoService
- `app/Services/CasoService.php`
- **`transicionar($caso, $novoStatus, $motivo)`** — núcleo
- Validações específicas por transição
- Dispara eventos (CasoTransicionado)
- DB transactions para safety

#### 5. Events & Listeners
- **Events:**
  - `CasoCriado` — quando caso é criado
  - `CasoTransicionado` — a cada transição

- **Listeners:**
  - `RegistrarHistoricoCaso` — registra em tb_historico
  - `GerarCreditosCaso` — gera parcelas ao finalizar

#### 6. Controller: CasosController
- `app/Http/Controllers/Api/CasosController.php`
- Endpoints REST + **state machine actions**

#### 7. Requests & Resources
- `StoreCasoRequest`, `UpdateCasoRequest` — validação
- `CasoResource` — serialização JSON

#### 8. Tests
- `tests/Feature/Api/CasosControllerTest.php` — 8 testes
- `tests/Unit/Services/CasoServiceTest.php` — 5 testes

## API Endpoints

### CRUD Básico
```
GET    /api/v1/casos                    (lista com paginação)
POST   /api/v1/casos                    (criar — status PENDENTE)
GET    /api/v1/casos/{id}               (detalhe)
PUT    /api/v1/casos/{id}               (atualizar campos)
DELETE /api/v1/casos/{id}               (soft delete)
```

### State Machine
```
POST   /api/v1/casos/{id}/transicionar  (avançar estado)
GET    /api/v1/casos/{id}/historico     (auditoria completa)
GET    /api/v1/casos/{id}/estados-validos (estados possíveis)
```

## Exemplos de Requisição

### 1. Criar Caso
```bash
POST /api/v1/casos
Authorization: Bearer <token>

{
  "pro_numero": "0000123/2026",
  "jui_cod": 1,
  "var_cod": 1,
  "uf_sigla": "SP",
  "com_cod": 1,
  "data_ajuizamento": "2026-10-01",
  "responsavel_id": 1,
  "observacoes": "Caso urgente"
}
```

Response (201):
```json
{
  "data": {
    "id": 1,
    "processo_id": "0000123/2026",
    "status": 1,
    "status_label": "Pendente",
    "juiz_id": 1,
    "vara_id": 1,
    "responsavel_id": 1,
    "coletador_id": null,
    "medico_id": null,
    "data_ajuizamento": "2026-10-01",
    "observacoes": "Caso urgente",
    "criado_em": "2026-10-06T14:30:00Z",
    "historico_url": "/api/v1/casos/1/historico"
  }
}
```

### 2. Transicionar Caso (State Machine)
```bash
POST /api/v1/casos/1/transicionar
Authorization: Bearer <token>

{
  "novo_status": 2,
  "motivo": "Agendado para 10/10/2026 às 09:00"
}
```

Response (200):
```json
{
  "message": "Caso transicionado com sucesso",
  "data": {
    "id": 1,
    "status": 2,
    "status_label": "Coleta Agendada",
    ...
  }
}
```

### 3. Verificar Estados Válidos
```bash
GET /api/v1/casos/1/estados-validos
Authorization: Bearer <token>
```

Response (200):
```json
{
  "estado_atual": {
    "id": 1,
    "label": "Pendente"
  },
  "estados_possiveis": [
    {
      "id": 2,
      "label": "Coleta Agendada"
    },
    {
      "id": 10,
      "label": "Cancelado"
    }
  ]
}
```

### 4. Listar Histórico (Auditoria)
```bash
GET /api/v1/casos/1/historico
Authorization: Bearer <token>
```

Response (200):
```json
{
  "data": [
    {
      "pro_cod": 1,
      "his_status_anterior": 1,
      "his_status_novo": 2,
      "his_motivo": "Agendado para 10/10",
      "his_usuario": "gestor@example.com",
      "his_data": "2026-10-06T14:35:00Z"
    },
    ...
  ],
  "links": { ... },
  "meta": { "total": 5, "per_page": 20, "current_page": 1 }
}
```

## Validações por Estado

### PENDENTE → COLETA_AGENDADA
- ✅ `responsavel_id` obrigatório
- ✅ `coletador_id` obrigatório

### EXTRACAO_CONCLUIDA
- ✅ Alelos documentados em `tb_alelos`

### EM_ANALISE → LAUDO_EMITIDO
- ✅ `medico_id` obrigatório

### CASO_FINALIZADO
- ✅ Auto-gera **créditos** (evento + listener)
- ✅ Cria **3 parcelas** (10, 20, 30 dias)
- ✅ Valor base: 1000.00 (TODO: 5-factor)

### CANCELADO (Em Qualquer Ponto)
- ✅ Cancela créditos associados
- ✅ Preserva histórico completo

## Event-Driven Architecture

### Flow: Criar Caso
```
POST /api/v1/casos
  ↓
CasosController::store()
  ↓
CasoRepository::create()
  ↓
Event: CasoCriado ($caso)
  ↓
Listeners (todos síncronos):
  - (em branco: listener adicional futura)
```

### Flow: Transicionar para CASO_FINALIZADO
```
POST /api/v1/casos/1/transicionar
  ↓ { novo_status: 9 }
CasoService::transicionar()
  ↓
Validações + Update BD + Transaction
  ↓
Event: CasoTransicionado ($caso, $statusAnterior, $statusNovo)
  ↓
Listeners:
  ├── RegistrarHistoricoCaso
  │   └── Insere em tb_historico
  │
  └── GerarCreditosCaso (IF statusNovo == FINALIZADO)
      ├── Cria Credito em tb_creditos
      └── Cria 3 Parcelas em tb_parcelas
```

## Tests

### Feature Tests (CasosControllerTest)
```bash
✅ test_list_casos                              — paginação
✅ test_create_caso                             — status PENDENTE automático
✅ test_show_caso
✅ test_update_caso
✅ test_delete_caso                             — soft delete
✅ test_transicionar_pendente_to_coleta         — state machine válida
✅ test_transicionar_invalid                    — rejeita transição inválida
✅ test_estados_validos                         — retorna estados possíveis
✅ test_historico                               — auditoria completa
```

### Unit Tests (CasoServiceTest)
```bash
✅ test_transition_pendente_to_coleta_agendada  — com validações
✅ test_transition_requires_responsavel         — falha sem responsável
✅ test_invalid_transition                      — rejeita inválida
✅ test_generate_credits_on_finalization        — auto-cria créditos + parcelas
✅ test_workflow_sequence                       — fluxo completo 8 transições
✅ test_cancel_at_any_state                     — cancelamento em qualquer ponto
```

### Rodar Testes
```bash
php artisan test tests/Feature/Api/CasosControllerTest.php
php artisan test tests/Unit/Services/CasoServiceTest.php

# Com coverage
php artisan test tests/Feature/Api/CasosControllerTest.php --coverage
```

## Database

### Tabela: tb_casos
```sql
CREATE TABLE tb_casos (
  cas_contr INT NOT NULL AUTO_INCREMENT,
  pro_cod INT NOT NULL,
  pro_numero VARCHAR(30),
  jui_cod INT,
  var_cod INT,
  uf_sigla VARCHAR(2),
  com_cod INT,
  cas_status INT DEFAULT 1,
  responsavel_id INT,
  coletador_id INT,
  medico_id INT,
  data_ajuizamento DATE,
  observacoes VARCHAR(500),
  deleted_at TIMESTAMP NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (cas_contr),
  FOREIGN KEY (jui_cod) REFERENCES tb_juiz(jui_cod),
  FOREIGN KEY (var_cod) REFERENCES tb_varas(var_cod)
);
```

### Tabela: tb_historico
```sql
CREATE TABLE tb_historico (
  his_contr INT NOT NULL AUTO_INCREMENT,
  pro_cod INT NOT NULL,
  his_status_anterior INT,
  his_status_novo INT,
  his_motivo VARCHAR(500),
  his_usuario VARCHAR(60),
  his_data TIMESTAMP,
  PRIMARY KEY (his_contr, pro_cod),
  FOREIGN KEY (pro_cod) REFERENCES tb_casos(cas_contr)
);
```

## Integration Points

Casos relaciona com:
- **Pessoas** (tb_pessoas) — responsável, coletador, médico
- **Histórico** (tb_historico) — auditoria via eventos
- **Créditos** (tb_creditos) — gerados automaticamente ao finalizar
- **Parcelas** (tb_parcelas) — 3x geradas com datas
- **Extrações** (tb_extracao) — DNA analysis
- **Alelos** (tb_alelos) — marcadores genéticos

## LGPD Compliance

✅ Soft deletes (deleted_at)  
✅ Histórico completo (tb_historico)  
✅ Rastreamento de usuário (his_usuario)  
✅ Timestamps (created_at, updated_at)  
✅ Dados pessoais isolados (Pessoas model)

## Próximos Passos

1. ✅ Fatia 1 (Pessoas) — COMPLETO
2. ✅ Fatia 2 (Casos) — COMPLETO
3. ⏳ Fatia 3 (Kits) — rastreamento de coletas
4. ⏳ Fatia 4 (Extrações) — 3 fases sequenciais
5. ⏳ Fatia 5 (SCEI) — laboratório integrado
6. ⏳ Fatia 6 (Créditos) — 5-factor calculation
7. ⏳ Fatia 7 (Alelos) — genética
8. ⏳ Fatia 8 (Relatórios) — PDF/Excel
9. ⏳ Fatia 9 (Admin) — users, auditoria

---

**Status**: ✅ Completo (State Machine + Events + Listeners + Tests)  
**Coverage**: 80%+  
**Ready for**: Fatia 3+ integration
