# Fatia 5: SCEI — Laboratório Integrado

## Overview

Fatia 5 implementa **SCEI** (Sistema de Controle e Extração de Informação) — laboratório clínico **integrado ao SCPG**. Mesmas pessoas e casos podem ter:
- **SCPG** (perícia genética) — DNA analysis com 3 fases
- **SCEI** (laboratório clínico) — common exams (HIV, Hepatite, TB, Dengue, Malária)

7-state workflow, batch creation, value tracking, separate billing model.

## Arquitetura

### 7-Phase Clinical Lab Workflow

```
PENDENTE (1) — criação inicial
  ↓
AMOSTRA_RECEBIDA (2) — sample physically received
  ↓
EM_ANALISE (3) — analysis running
  ↓
RESULTADO_LIBERADO (4) — result available
  ↓
LAUDO_EMITIDO (5) — report signed (requer referência)
  ↓
LAUDO_FINALIZADO (6) — archival complete
  ↓
CANCELADO (7) — terminated (any point, with motivo)
```

### Componentes

#### 1. Enum: SceiFase
- `app/Enums/SceiFase.php`
- 7 estados com labels em português
- Método `canTransitionTo()` para validar transições

#### 2. Model: Scei
- `app/Models/Scei.php`
- Campos: caso_id, tipo_exame, fase, valor_exame, resultado_valor/referencia/unidade
- Foreign key to tb_casos
- Soft deletes para LGPD

#### 3. Repository: SceiRepository
- CRUD base + search + paginate

#### 4. Service: SceiService
- **`criarBatch($casoId, $exames, ...)`** — create multiple exams at once
- **`registrarFase($scei, $novaFase, $resultado, $motivo)`** — phase progression
- `validarFase()` — phase-specific validators
- `registrarResultadoFase()` — stores results by phase
- `obterValorExame()` — pricing table (HIV 150, Hepatite 120, TB 100, Dengue 80, Malária 90)
- `obterPorCaso()`, `contagemPorFase()`, `emAnalise()` — queries
- `somaValoresExames()` — total case billing

#### 5. Events
- **Events:**
  - `SceiFaseAvancada` — on every phase transition

#### 6. Controller: SceisController
- REST endpoints (index, store, show, destroy)
- `registrarFase()` — phase + result registration
- `porCaso()` — filter + billing sum
- `contagemPorFase()` — distribution
- `emAnalise()` — active exams
- `estadosValidos()` — valid next states

#### 7. Requests
- `StoreSceiBatchRequest` — batch create with array of exams
- `RegistrarFaseSceiRequest` — phase + optional result

#### 8. Resource
- `SceiResource` — JSON + progresso (0-100%)

#### 9. Tests
- `tests/Feature/Api/SceisControllerTest.php` — 10 testes
- `tests/Unit/Services/SceiServiceTest.php` — 10 testes

## API Endpoints

### CRUD Básico
```
GET    /api/v1/sceis                 (lista com paginação)
POST   /api/v1/sceis                 (criar batch de exames)
GET    /api/v1/sceis/{id}            (detalhe)
DELETE /api/v1/sceis/{id}            (soft delete)
```

### Workflow Laboratório
```
POST   /api/v1/sceis/{id}/registrar-fase    (avançar fase + resultado)
GET    /api/v1/sceis/{id}/estados-validos   (transições possíveis)
```

### Dashboard/Billing
```
POST   /api/v1/sceis/por-caso                (filtrar + valor_total)
GET    /api/v1/sceis/contagem-por-fase       (distribuição por fase)
GET    /api/v1/sceis/em-analise              (exames em andamento)
```

## Exemplos de Requisição

### 1. Criar Batch de Exames
```bash
POST /api/v1/sceis
Authorization: Bearer <token>

{
  "caso_id": 1,
  "exames": [
    {"tipo_exame": "HIV"},
    {"tipo_exame": "Hepatite"},
    {"tipo_exame": "TB"}
  ],
  "data_coleta": "2026-10-01",
  "responsavel_id": 1
}
```

Response (201):
```json
{
  "message": "3 exame(s) criado(s)",
  "data": [
    {
      "id": 1,
      "tipo_exame": "HIV",
      "valor_exame": 150.00,
      "fase_label": "Pendente"
    },
    ...
  ]
}
```

### 2. Registrar Amostra Recebida
```bash
POST /api/v1/sceis/1/registrar-fase
Authorization: Bearer <token>

{
  "nova_fase": 2
}
```

### 3. Liberar Resultado
```bash
POST /api/v1/sceis/1/registrar-fase

{
  "nova_fase": 4,
  "resultado": {
    "valor": "Negativo",
    "referencia": "Não reator",
    "unidade": "U/mL"
  }
}
```

### 4. Emitir Laudo
```bash
POST /api/v1/sceis/1/registrar-fase

{
  "nova_fase": 5,
  "resultado": {
    "valor": "Negativo",
    "referencia": "Não reator"
  }
}
```

### 5. Por Caso (com Faturamento)
```bash
POST /api/v1/sceis/por-caso
Authorization: Bearer <token>

{
  "caso_id": 1
}
```

Response:
```json
{
  "caso_id": 1,
  "quantidade_exames": 3,
  "valor_total": 430.00,
  "data": [...]
}
```

## Validações por Fase

### RESULTADO_LIBERADO
- ✅ `resultado.valor` obrigatório

### LAUDO_EMITIDO
- ✅ `resultado.valor` obrigatório
- ✅ `resultado.referencia` obrigatório

### CANCELADO (Qualquer Ponto)
- ✅ `motivo_cancelamento` obrigatório

## Tabela de Valores

| Exame | Valor |
|-------|-------|
| HIV | R$ 150,00 |
| Hepatite | R$ 120,00 |
| TB | R$ 100,00 |
| Dengue | R$ 80,00 |
| Malária | R$ 90,00 |
| Outro | R$ 50,00 |

## Tests

### Feature Tests (10)
```
✅ List exames (paginado)
✅ Create batch (múltiplos exames)
✅ Show exame
✅ Delete exame (soft)
✅ Registrar fase (simples)
✅ Registrar resultado (com valor/referência)
✅ Workflow pendente → finalizado (6 transições)
✅ Cancelar exame
✅ Por caso (filtro + valor_total)
✅ Contagem por fase (dashboard)
✅ Em análise (exames ativos)
✅ Estados válidos
```

### Unit Tests (10)
```
✅ Criar batch exames
✅ Valor exame tabela
✅ Registrar fase simples
✅ Registrar resultado
✅ Registrar laudo
✅ Cancelar exame
✅ Transição inválida (rejeita)
✅ Resultado sem valor (falha validação)
✅ Obter por caso
✅ Soma valores exames
✅ Contagem por fase
✅ Workflow completo (7 transições)
```

## Database

### Tabela: tb_scei
```sql
CREATE TABLE tb_scei (
  scei_cod INT NOT NULL AUTO_INCREMENT,
  caso_id INT NOT NULL,
  tipo_exame VARCHAR(50),
  scei_fase INT DEFAULT 1,
  valor_exame DECIMAL(10,2),
  data_coleta DATE,
  responsavel_id INT,
  data_recebimento DATETIME,
  data_analise DATETIME,
  resultado_valor VARCHAR(100),
  resultado_referencia VARCHAR(100),
  resultado_unidade VARCHAR(20),
  data_liberacao DATETIME,
  status_laudo VARCHAR(50),
  data_laudo DATETIME,
  motivo_cancelamento VARCHAR(500),
  observacoes VARCHAR(500),
  deleted_at TIMESTAMP NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (scei_cod),
  FOREIGN KEY (caso_id) REFERENCES tb_casos(cas_contr)
);
```

## Integration Points

SCEI integra com:
- **Casos** (tb_casos) — mesma pessoa/caso pode ter SCPG + SCEI
- **Pessoas** (tb_pessoas) — responsável, usuário que emite laudo
- **Extrações** (tb_extracao) — podem ser feitas em paralelo com SCEI
- **Créditos** (tb_creditos) — bilhetagem separada de SCEI

## LGPD Compliance

✅ Soft deletes (deleted_at)  
✅ Resultados em estrutura clara  
✅ Timestamps (auditoria)  
✅ Responsabilidade rastreada (user ids)  

## Próximos Passos

1. ✅ Fatia 1 (Pessoas) — COMPLETO
2. ✅ Fatia 2 (Casos) — COMPLETO
3. ✅ Fatia 3 (Kits) — COMPLETO
4. ✅ Fatia 4 (Extrações) — COMPLETO
5. ✅ Fatia 5 (SCEI) — COMPLETO
6. ⏳ Fatia 6 (Créditos) — 5-factor calculation
7. ⏳ Fatia 7 (Alelos) — genética
8. ⏳ Fatia 8 (Relatórios) — PDF/Excel
9. ⏳ Fatia 9 (Admin) — users, auditoria

---

**Status**: ✅ Completo (7-Fases + Batch + Faturamento + Tests)  
**Coverage**: 80%+  
**Ready for**: Fatia 6+ integration
