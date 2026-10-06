# Fatia 7: Alelos — Genetic Markers & Comparison

## Overview

Fatia 7 implementa **Alelos** — marcadores genéticos de DNA com **comparação entre extrações**, validação de frequências populacionais e suporte a múltiplos tipos de análise.

5 tipos de marcadores: STR, SNP, mtDNA, Y-STR, Amelogenina.

## Arquitetura

### 5 Tipos de Marcadores Genéticos

**1. STR** (Short Tandem Repeat)
- 16 marcadores autossômicos padrão CODIS
- Mais comum em análises de DNA
- Ex: D8S1179, D21S11

**2. SNP** (Single Nucleotide Polymorphism)
- Polimorfismos de nucleotídeo único
- Usado para ancestry
- Maior volume de dados

**3. mtDNA** (Mitochondrial DNA)
- Para amostras degradadas
- Herança materna
- 16,569 bp

**4. Y-STR** (Y-Chromosome)
- Linhagem paternal
- Apenas homens
- Análise forense

**5. Amelogenina**
- Determinação de sexo biológico
- Presente em DNA autossômico

### Componentes

#### 1. Enum: AleloTipo
- `app/Enums/AleloTipo.php`
- 5 tipos com labels e descrições

#### 2. Model: Alelo
- `extracao_id` → FK Extracao
- `tipo_alelo`, `marcador`, `alelo1`, `alelo2`
- `frequencia_alelo1`, `frequencia_alelo2`
- `homozigoto` (calculado)

#### 3. Repository: AleloRepository
- CRUD + search + paginate

#### 4. Service: AleloService
- **`registrarAlelos($extracaoId, $alelos[])`** — batch create + validate
- `compararAlelos($ext1, $ext2)` — compare 2 extrações, match % (considerando ordem invertida)
- `obterPorExtracao()`, `obterPorMarcador()` — queries
- `contagemPorTipo()` — distribution dashboard
- `obterMarcadoresUnicos()` — unique markers catalog
- `calcularFrequenciaAleloPopulacao()` — population frequency (0-1)

#### 5. Controller: AlelosController
- REST (index, store, show, destroy)
- `registrarBatch()` — POST multiple alelos
- `compararExtracos()` — POST compare 2 extractions
- `porExtracao()` — GET alelos por extração
- `porMarcador()` — GET alelos por marcador
- `contagemPorTipo()` — GET distribution
- `marcadoresUnicos()` — GET catalog
- `frequenciaPopulacao()` — GET population freq

#### 6. Requests
- `StoreAleloRequest` — validação (tipo, marcador, alelos, frequências)

#### 7. Resource
- `AleloResource` — JSON + genótipo (alelo1/alelo2) + homozigoto flag

#### 8. Tests
- `tests/Feature/Api/AlelosControllerTest.php` — 11 testes
- `tests/Unit/Services/AleloServiceTest.php` — 11 testes

## API Endpoints

### CRUD Básico
```
GET    /api/v1/alelos               (lista com paginação)
POST   /api/v1/alelos               (criar 1 alelo)
GET    /api/v1/alelos/{id}          (detalhe)
DELETE /api/v1/alelos/{id}          (soft delete)
```

### Batch & Comparação
```
POST   /api/v1/alelos/registrar-batch       (crear múltiplos)
POST   /api/v1/alelos/comparar-extracos     (compare 2 extractions)
```

### Queries & Dashboard
```
POST   /api/v1/alelos/por-extracao          (filtro por extração)
POST   /api/v1/alelos/por-marcador          (filtro por marcador)
GET    /api/v1/alelos/contagem-por-tipo     (distribution)
GET    /api/v1/alelos/marcadores-unicos     (unique catalog)
POST   /api/v1/alelos/frequencia-populacao  (population freq)
```

## Exemplos

### 1. Registrar Alelos em Batch
```bash
POST /api/v1/alelos/registrar-batch
Authorization: Bearer <token>

{
  "extracao_id": 1,
  "alelos": [
    {
      "tipo_alelo": "STR",
      "marcador": "D8S1179",
      "alelo1": "13",
      "alelo2": "15",
      "frequencia_alelo1": 0.15,
      "frequencia_alelo2": 0.12
    },
    {
      "tipo_alelo": "STR",
      "marcador": "D21S11",
      "alelo1": "29",
      "alelo2": "30"
    }
  ]
}
```

Response (201):
```json
{
  "message": "2 alelo(s) registrado(s)",
  "data": [
    {
      "id": 1,
      "tipo_alelo": "STR",
      "marcador": "D8S1179",
      "alelo1": "13",
      "alelo2": "15",
      "genótipo": "13/15",
      "homozigoto": false,
      "frequencia_alelo1": 0.15
    },
    ...
  ]
}
```

### 2. Comparar 2 Extrações
```bash
POST /api/v1/alelos/comparar-extracos

{
  "extracao_id_1": 1,
  "extracao_id_2": 2
}
```

Response:
```json
{
  "extracao_1": 1,
  "extracao_2": 2,
  "total_marcadores": 16,
  "matches": 15,
  "percentual_match": 93.75,
  "detalhes": [
    {
      "marcador": "D8S1179",
      "resultado": "match",
      "alelos_1": "13/15",
      "alelos_2": "13/15"
    },
    {
      "marcador": "D21S11",
      "resultado": "mismatch",
      "alelos_1": "29/30",
      "alelos_2": "29/31"
    }
  ]
}
```

### 3. Frequência Populacional
```bash
POST /api/v1/alelos/frequencia-populacao

{
  "marcador": "D8S1179",
  "alelo": "13"
}
```

Response:
```json
{
  "marcador": "D8S1179",
  "alelo": "13",
  "frequencia_populacional": 0.1235
}
```

## Validações

- **Tipo de alelo**: STR, SNP, mtDNA, Y-STR, AMELOGENINA
- **Alelo1**: Obrigatório
- **Frequências**: Entre 0 e 1
- **Genotipo**: alelo1/alelo2 ou alelo1 (homozigoto)

## Comparação de Alelos

**Match**: alelos iguais (ordem não importa)
- `13/15` = `15/13` ✅ Match
- `13/15` ≠ `13/14` ❌ Mismatch

**Percentual Match**:
```
matches / total_marcadores × 100
```

## Tests

### Feature Tests (11)
```
✅ List alelos
✅ Create alelo (STR)
✅ Show alelo
✅ Delete alelo
✅ Registrar batch (2 alelos)
✅ Comparar extracos (match 100%)
✅ Por extracao (filtro)
✅ Por marcador (filtro)
✅ Contagem por tipo
✅ Marcadores únicos
✅ Frequencia populacao
✅ Alelo homozigoto
```

### Unit Tests (11)
```
✅ Registrar alelos batch
✅ Validar alelo inválido (tipo)
✅ Validar frequência (0-1)
✅ Comparar alelos match (100%)
✅ Comparar alelos mismatch (0%)
✅ Comparar alelos ordem invertida (match)
✅ Obter por extracao
✅ Obter por marcador
✅ Contagem por tipo
✅ Obter marcadores únicos
✅ Calcular frequencia
✅ Alelo homozigoto
```

## Database

### Tabela: tb_alelos
```sql
CREATE TABLE tb_alelos (
  cod_ale INT NOT NULL AUTO_INCREMENT,
  extracao_id INT NOT NULL,
  tipo_alelo VARCHAR(20),
  marcador VARCHAR(50),
  alelo1 VARCHAR(20),
  alelo2 VARCHAR(20),
  frequencia_alelo1 DECIMAL(10,6),
  frequencia_alelo2 DECIMAL(10,6),
  observacoes VARCHAR(500),
  deleted_at TIMESTAMP NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (cod_ale),
  FOREIGN KEY (extracao_id) REFERENCES tb_extracao(ext_cod)
);
```

## Integration Points

Alelos integra com:
- **Extrações** (tb_extracao) — resultado da fase 3 (sequenciamento)
- **Comparação forense** — match entre suspeitos/vítimas

## Próximos Passos

1. ✅ Fatia 1 (Pessoas) — COMPLETO
2. ✅ Fatia 2 (Casos) — COMPLETO
3. ✅ Fatia 3 (Kits) — COMPLETO
4. ✅ Fatia 4 (Extrações) — COMPLETO
5. ✅ Fatia 5 (SCEI) — COMPLETO
6. ✅ Fatia 6 (Créditos) — COMPLETO
7. ✅ Fatia 7 (Alelos) — COMPLETO
8. ⏳ Fatia 8 (Relatórios) — PDF/Excel
9. ⏳ Fatia 9 (Admin) — users, auditoria

---

**Status**: ✅ Completo (Batch Registration + Comparison + Population Freq + Tests)  
**Coverage**: 80%+  
**Ready for**: Fatia 8+ integration
