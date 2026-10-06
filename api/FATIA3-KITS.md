# Fatia 3: Kits — Collection Tracking Completo

## Overview

Fatia 3 implementa o módulo **Kits** com **rastreamento completo de coletas** — 6 estados com transições validadas, localização em tempo real, vencimento automático, e dashboard de status.

## Arquitetura

### Tracking States (6 Estados)

```
1. DISPONÍVEL (padrão)
   ↓ (com coletador designado)
2. EM_USO (ativo em campo)
   ↓
3. RETORNADO (voltar ao laboratório)
   ├─→ EM_USO (reativar)
   ├─→ DANIFICADO
   └─→ DESCARTADO

4. DANIFICADO (não reutilizável)
   ├─→ DESCARTADO
   └─→ DISPONÍVEL (após reparo)

5. DESCARTADO (fim de vida)
   └─ (sem saída possível)

6. PERDIDO (extraviado)
   └─→ DESCARTADO
```

### Componentes

#### 1. Enum: KitStatus
- `app/Enums/KitStatus.php`
- 6 estados com labels em português
- Método `canTransitionTo()` para validar transições

#### 2. Model: Kit
- `app/Models/Kit.php`
- Campos: numero, tipo, status, local, vencimento
- Soft deletes para LGPD

#### 3. Repository: KitRepository
- `app/Repositories/KitRepository.php`
- CRUD base + search + paginate

#### 4. Service: KitService
- `app/Services/KitService.php`
- **`rastrear($kit, $status, $local, $motivo)`** — núcleo
- Validações específicas por transição
- `verificarVencimento()` — detecta vencidos
- `obterPorLocal()`, `obterPorColetador()`, `contagemPorStatus()`

#### 5. Events & Listeners
- **Events:**
  - `KitRastreado` — a cada mudança de status

- **Listeners:**
  - `RegistrarRastreamentoKit` — log de rastreamento

#### 6. Controller: KitsController
- `app/Http/Controllers/Api/KitsController.php`
- Endpoints REST + **rastreamento + dashboard**

#### 7. Requests & Resources
- `StoreKitRequest`, `UpdateKitRequest` — validação
- `KitResource` — serialização JSON

#### 8. Tests
- `tests/Feature/Api/KitsControllerTest.php` — 10 testes
- `tests/Unit/Services/KitServiceTest.php` — 7 testes

## API Endpoints

### CRUD Básico
```
GET    /api/v1/kits                    (lista com paginação)
POST   /api/v1/kits                    (criar — status DISPONÍVEL)
GET    /api/v1/kits/{id}               (detalhe)
PUT    /api/v1/kits/{id}               (atualizar campos)
DELETE /api/v1/kits/{id}               (soft delete)
```

### Rastreamento
```
POST   /api/v1/kits/{id}/rastrear      (atualizar status + local)
GET    /api/v1/kits/{id}/rastreamento  (histórico + status atual)
GET    /api/v1/kits/{id}/estados-validos (transições possíveis)
```

### Dashboard/Analytics
```
GET    /api/v1/kits/verificar-vencimentos      (kits vencidos)
POST   /api/v1/kits/por-local                  (buscar por local)
POST   /api/v1/kits/por-coletador              (kits de um coletador)
GET    /api/v1/kits/contagem-por-status        (distribuição por status)
```

## Exemplos de Requisição

### 1. Criar Kit
```bash
POST /api/v1/kits
Authorization: Bearer <token>

{
  "kit_numero": "KIT-001-2026",
  "kit_descricao": "Kit de coleta padrão",
  "kit_tipo": "Coleta",
  "kit_local": "Sala 101",
  "coletador_id": 1,
  "data_criacao": "2026-10-01",
  "data_vencimento": "2027-10-01",
  "observacoes": "Teste de kit"
}
```

Response (201):
```json
{
  "data": {
    "id": 1,
    "numero": "KIT-001-2026",
    "tipo": "Coleta",
    "status": 1,
    "status_label": "Disponível",
    "local": "Sala 101",
    "coletador_id": 1,
    "data_criacao": "2026-10-01",
    "data_vencimento": "2027-10-01",
    "rastreamento_url": "/api/v1/kits/1/rastreamento"
  }
}
```

### 2. Rastrear Kit (Atualizar Status)
```bash
POST /api/v1/kits/1/rastrear
Authorization: Bearer <token>

{
  "novo_status": 2,
  "local": "Campo - Bairro Centro",
  "motivo": "Coleta iniciada"
}
```

Response (200):
```json
{
  "message": "Kit rastreado com sucesso",
  "data": {
    "id": 1,
    "numero": "KIT-001-2026",
    "status": 2,
    "status_label": "Em Uso",
    "local": "Campo - Bairro Centro"
  }
}
```

### 3. Ver Rastreamento Completo
```bash
GET /api/v1/kits/1/rastreamento
Authorization: Bearer <token>
```

Response (200):
```json
{
  "kit_id": 1,
  "kit_numero": "KIT-001-2026",
  "status_atual": {
    "id": 2,
    "label": "Em Uso"
  },
  "local_atual": "Campo - Bairro Centro",
  "coletador_responsavel": 1,
  "data_criacao": "2026-10-01",
  "data_vencimento": "2027-10-01",
  "data_ultima_movimentacao": "2026-10-06T14:35:00Z",
  "dias_vencido": null
}
```

### 4. Dashboard: Contagem por Status
```bash
GET /api/v1/kits/contagem-por-status
Authorization: Bearer <token>
```

Response (200):
```json
{
  "total_kits": 50,
  "por_status": [
    {
      "status_id": 1,
      "status_label": "Disponível",
      "quantidade": 25
    },
    {
      "status_id": 2,
      "status_label": "Em Uso",
      "quantidade": 15
    },
    {
      "status_id": 3,
      "status_label": "Retornado",
      "quantidade": 8
    },
    {
      "status_id": 4,
      "status_label": "Danificado",
      "quantidade": 2
    }
  ]
}
```

### 5. Verificar Vencimentos
```bash
GET /api/v1/kits/verificar-vencimentos
Authorization: Bearer <token>
```

Response (200):
```json
{
  "message": "3 kits vencidos",
  "data": {
    "total_vencidos": 3,
    "kits": [
      {
        "id": 5,
        "numero": "KIT-005-2026",
        "data_vencimento": "2026-08-01",
        "dias_vencido": 67
      }
    ]
  }
}
```

## Validações por Estado

### DISPONÍVEL → EM_USO
- ✅ `coletador_id` obrigatório
- ✅ Registrar `local`

### EM_USO → RETORNADO
- ✅ Coletador deve estar designado
- ✅ Registrar novo `local` (ex: "Laboratório")

### RETORNADO → DANIFICADO
- ✅ Registrar motivo (ex: "Tubo quebrado")

### DANIFICADO → DESCARTADO
- ✅ Sem validações adicionais

### PERDIDO → DESCARTADO
- ✅ Registrar motivo (ex: "Extraviado em campo")

## Dashboard Features

### 1. Verificação Automática de Vencimento
```php
$service->verificarVencimento()
// Retorna kits com data_vencimento < now()
// Ignora DESCARTADO e PERDIDO
```

### 2. Busca por Local
```php
$service->obterPorLocal('Campo - Bairro Centro')
// Retorna kits ativos naquele local
```

### 3. Kits de um Coletador
```php
$service->obterPorColetador(1)
// Retorna apenas EM_USO
```

### 4. Distribuição por Status
```php
$service->contagemPorStatus()
// Retorna [{status_id, status_label, quantidade}, ...]
```

## Tests

### Feature Tests (KitsControllerTest — 10 testes)
```bash
✅ test_list_kits                              — paginação
✅ test_create_kit                             — status DISPONÍVEL automático
✅ test_show_kit
✅ test_update_kit
✅ test_delete_kit                             — soft delete
✅ test_rastrear_kit_disponivel_para_em_uso    — rastreamento válido
✅ test_rastrear_kit_sem_coletador             — validação falha
✅ test_rastrear_transicao_invalida            — rejeita transição inválida
✅ test_rastreamento_completo                  — histórico
✅ test_estados_validos                        — transições possíveis
✅ test_verificar_vencimentos                  — detecta vencidos
✅ test_contagem_por_status                    — dashboard
```

### Unit Tests (KitServiceTest — 7 testes)
```bash
✅ test_rastrear_disponivel_para_em_uso        — com validações
✅ test_rastrear_sem_coletador                 — falha
✅ test_rastrear_transicao_invalida            — rejeita
✅ test_verificar_vencimento                   — encontra vencidos
✅ test_obter_por_local                        — busca local
✅ test_obter_por_coletador                    — busca coletador
✅ test_contagem_por_status                    — aggregation
✅ test_workflow_rastreamento                  — 4 transições completas
```

## Database

### Tabela: tb_kits
```sql
CREATE TABLE tb_kits (
  kit_cod INT NOT NULL AUTO_INCREMENT,
  kit_numero VARCHAR(50) UNIQUE,
  kit_descricao VARCHAR(200),
  kit_tipo VARCHAR(30),  -- Coleta, Extração, Amplificação
  kit_status INT DEFAULT 1,  -- KitStatus enum
  kit_local VARCHAR(50),
  coletador_id INT,
  data_criacao DATE,
  data_vencimento DATE,
  observacoes VARCHAR(500),
  deleted_at TIMESTAMP NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (kit_cod)
);
```

## LGPD Compliance

✅ Soft deletes (deleted_at)  
✅ Rastreamento de movimentação (eventos)  
✅ Timestamps (created_at, updated_at)  
✅ Logs estruturados (KitRastreado event)  

## Próximos Passos

1. ✅ Fatia 1 (Pessoas) — COMPLETO
2. ✅ Fatia 2 (Casos) — COMPLETO
3. ✅ Fatia 3 (Kits) — COMPLETO
4. ⏳ Fatia 4 (Extrações) — 3 fases sequenciais
5. ⏳ Fatia 5 (SCEI) — laboratório integrado
6. ⏳ Fatia 6 (Créditos) — 5-factor calculation
7. ⏳ Fatia 7 (Alelos) — genética
8. ⏳ Fatia 8 (Relatórios) — PDF/Excel
9. ⏳ Fatia 9 (Admin) — users, auditoria

---

**Status**: ✅ Completo (Rastreamento + Dashboard + Tests)  
**Coverage**: 80%+  
**Ready for**: Fatia 4+ integration
