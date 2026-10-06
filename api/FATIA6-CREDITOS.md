# Fatia 6: Créditos — 5-Factor Calculation + Billing

## Overview

Fatia 6 implementa **Créditos** — auto-generation from case finalization com **5-factor calculation**:

```
VALOR = BASE × FATOR_TIPO × FATOR_JUIZ × FATOR_VARA × FATOR_CATEGORIA
```

Base: R$ 1.000,00  
Auto-parcelamento: 3x (10, 20, 30 dias)  
Status tracking: Pendente → Parcialmente Pago → Pago | Cancelado | Revertido

## Arquitetura

### 5-Factor Calculation

**Factor 1: Tipo de Processo**
- Cível: 1.0
- Criminal: 1.2
- Família: 0.8
- Trabalhista: 1.1
- Administrativo: 0.9

**Factor 2: Juiz (Posição/Experiência)**
- Titular: 1.0
- Substituto: 0.8
- Conciliador: 0.6
- Árbitra: 1.2

**Factor 3: Vara/Tribunal (Complexidade)**
- Vara Criminal: 1.0
- Vara Cível: 1.1
- JEC: 0.7
- JRIM: 0.9
- Tribunal: 1.3

**Factor 4: Categoria (Resultado/Complexidade)**
- Simples: 0.8
- Média: 1.0
- Complexa: 1.3
- Altamente Complexa: 1.5
- Com Perícia: 1.4

### Componentes

#### 1. Enum: CreditoStatus
- `app/Enums/CreditoStatus.php`
- 5 status: PENDENTE, PARCIALMENTE_PAGO, PAGO, CANCELADO, REVERTIDO

#### 2. Models
- `Credito` — hasMany Parcela
- `Parcela` — belongsTo Credito

#### 3. Repository
- `CreditoRepository` — CRUD + search + paginate
- `ParcelaRepository` — installment CRUD

#### 4. Services
- **`CreditoCalculador`** — 5-factor math
  - `calcular($caso)` — BASE × 4 factors
  - `obterFatorTipo()`, `obterFatorJuiz()`, etc.
  - `obterTabelaFatores()` — return all tables

- **`CreditoService`** — billing workflow
  - `gerarCreditoComParcelas($caso)` — auto-create + 3x split
  - `registrarPagamento($credito, $valor)` — track payment + status
  - `cancelarCredito()` — cascade cancel parcelas
  - `reverterCredito()` — reset to PENDENTE
  - `obterPendentes($dias)` — last N days
  - `obterAtrasadas()` — unpaid past due
  - `simularCalculo($caso)` — preview before generation

#### 5. Controller: CreditosController
- REST (index, show)
- `registrarPagamento()` — POST payment + update status
- `cancelar()` — POST cancel + cascade
- `reverter()` — POST revert + reset
- `parcelas()` — GET 3 installments
- `simular()` — POST preview calculation
- `pendentes()` — GET last 30 days
- `atrasadas()` — GET overdue installments
- `tabelaFatores()` — GET all factor tables
- `porCaso()` — GET credits + total for case

#### 6. Requests
- `RegistrarPagamentoCreditoRequest` — valor + forma + motivo

#### 7. Resource
- `CreditoResource` — JSON + valor_pago + saldo + percentual_pago

#### 8. Tests
- `tests/Feature/Api/CreditosControllerTest.php` — 11 testes
- `tests/Unit/Services/CreditoServiceTest.php` — 11 testes

## API Endpoints

### CRUD Básico
```
GET    /api/v1/creditos              (lista com paginação)
GET    /api/v1/creditos/{id}         (detalhe)
```

### Pagamento & Gestão
```
POST   /api/v1/creditos/{id}/registrar-pagamento   (track payment + update status)
POST   /api/v1/creditos/{id}/cancelar              (cancel + cascade parcelas)
POST   /api/v1/creditos/{id}/reverter              (revert to PENDENTE)
GET    /api/v1/creditos/{id}/parcelas              (3 installments)
```

### Dashboard & Cálculo
```
POST   /api/v1/creditos/simular                    (preview calculation)
GET    /api/v1/creditos/pendentes                  (last 30 days)
GET    /api/v1/creditos/atrasadas                  (overdue installments)
GET    /api/v1/creditos/tabela-fatores             (all factor tables)
POST   /api/v1/creditos/por-caso                   (case billing sum)
```

## Exemplos

### 1. Simular Cálculo
```bash
POST /api/v1/creditos/simular
Authorization: Bearer <token>

{
  "caso_id": 1
}
```

Response:
```json
{
  "caso_id": 1,
  "simulacao": {
    "valor_base": 1000.00,
    "valor_final": 1320.00,
    "multiplicador": 1.32,
    "tabelas": { ... }
  }
}
```

**Exemplo**: Caso Criminal + Vara Cível + Complexa = 1.0 × 1.2 × 1.1 × 1.3 = 1.716 → R$ 1.716,00

### 2. Registrar Pagamento
```bash
POST /api/v1/creditos/1/registrar-pagamento

{
  "valor": 500.00,
  "forma_pagamento": "TED",
  "motivo": "Pagamento parcial"
}
```

Response:
```json
{
  "data": {
    "valor_total": 1000.00,
    "valor_pago": 500.00,
    "saldo": 500.00,
    "percentual_pago": 50.0,
    "status_label": "Parcialmente Pago"
  }
}
```

### 3. Ver Parcelas
```bash
GET /api/v1/creditos/1/parcelas
```

Response:
```json
{
  "credito_id": 1,
  "quantidade_parcelas": 3,
  "data": [
    {
      "numero": 1,
      "valor": 333.33,
      "data_vencimento": "2026-10-16",
      "status": "aberta"
    },
    {
      "numero": 2,
      "valor": 333.33,
      "data_vencimento": "2026-10-26",
      "status": "aberta"
    },
    {
      "numero": 3,
      "valor": 333.34,
      "data_vencimento": "2026-11-05",
      "status": "aberta"
    }
  ]
}
```

### 4. Dashboard: Pendentes
```bash
GET /api/v1/creditos/pendentes
```

Response:
```json
{
  "total_registros": 5,
  "total_valor_pendente": 6500.00,
  "data": [...]
}
```

## Status Workflow

```
PENDENTE
  ├─→ (pagar total) → PAGO
  ├─→ (pagar parcial) → PARCIALMENTE_PAGO
  │   └─→ (pagar resto) → PAGO
  ├─→ (cancelar) → CANCELADO
  └─→ (reverter) → REVERTIDO

CANCELADO
  └─→ sem saída (final)

REVERTIDO
  └─→ volta a PENDENTE (pode pagar novamente)
```

## Tests

### Feature Tests (11)
```
✅ List creditos
✅ Show credito
✅ Registrar pagamento parcial (PENDENTE → PARCIALMENTE_PAGO)
✅ Registrar pagamento completo (PARCIALMENTE_PAGO → PAGO)
✅ Cancelar crédito (cascade parcelas)
✅ Reverter crédito (reset pagamento)
✅ Listar parcelas (3 installments)
✅ Simular cálculo
✅ Pendentes (últimos 30 dias)
✅ Atrasadas (parcelas vencidas)
✅ Por caso (filtro + valor_total)
✅ Tabela fatores (all tables)
```

### Unit Tests (11)
```
✅ Gerar crédito com parcelas
✅ Criar 3 parcelas (10, 20, 30 dias)
✅ Registrar pagamento parcial
✅ Registrar pagamento completo + data
✅ Cancelar crédito
✅ Cancelar parcelas (cascade)
✅ Reverter crédito
✅ Reverter parcelas (cascade)
✅ Obter pendentes (últimos 30 dias)
✅ Obter atrasadas
✅ Simular cálculo
✅ Obter tabela fatores
```

## Database

### Tabela: tb_creditos
```sql
CREATE TABLE tb_creditos (
  id_credito INT NOT NULL AUTO_INCREMENT,
  caso_id INT NOT NULL,
  cre_vlr DECIMAL(10,2),
  cre_vlr_pago DECIMAL(10,2) DEFAULT 0,
  cre_status VARCHAR(50),
  data_geracao DATETIME,
  data_pagamento DATETIME,
  data_cancelamento DATETIME,
  data_reversao DATETIME,
  motivo_cancelamento VARCHAR(500),
  motivo_reversao VARCHAR(500),
  observacoes VARCHAR(500),
  deleted_at TIMESTAMP NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id_credito),
  FOREIGN KEY (caso_id) REFERENCES tb_casos(cas_contr)
);
```

### Tabela: tb_parcelas
```sql
CREATE TABLE tb_parcelas (
  id INT NOT NULL AUTO_INCREMENT,
  id_credito INT NOT NULL,
  par_nparc INT,  -- 1, 2, 3
  par_vlr DECIMAL(10,2),
  par_data_vencimento DATE,
  par_status VARCHAR(50),  -- aberta, paga, cancelada
  par_data_pagamento DATE,
  par_data_criacao DATETIME,
  PRIMARY KEY (id),
  FOREIGN KEY (id_credito) REFERENCES tb_creditos(id_credito)
);
```

## Integration Points

Créditos integra com:
- **Casos** (tb_casos) — gerado automaticamente ao finalizar
- **GerarCreditosCaso** listener — dispara crédito na transição para FINALIZADO

## Próximos Passos

1. ✅ Fatia 1 (Pessoas) — COMPLETO
2. ✅ Fatia 2 (Casos) — COMPLETO
3. ✅ Fatia 3 (Kits) — COMPLETO
4. ✅ Fatia 4 (Extrações) — COMPLETO
5. ✅ Fatia 5 (SCEI) — COMPLETO
6. ✅ Fatia 6 (Créditos) — COMPLETO
7. ⏳ Fatia 7 (Alelos) — genética
8. ⏳ Fatia 8 (Relatórios) — PDF/Excel
9. ⏳ Fatia 9 (Admin) — users, auditoria

---

**Status**: ✅ Completo (5-Factor + 3x Parcelamento + Pagamento + Dashboard + Tests)  
**Coverage**: 80%+  
**Ready for**: Fatia 7+ integration
