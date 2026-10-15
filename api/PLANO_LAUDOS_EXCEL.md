# 📋 Plano: Gerador de Laudos em Excel

## 🎯 Objetivo
Criar sistema completo de exportação de laudos em Excel, similar ao `ufExportaAlelosPlanilhas` do Delphi, mas para laudos (DNA, HIV, etc.)

---

## 📊 Estrutura do Padrão (ufExportaAlelosPlanilhas)

```
Delphi Pattern:
1. Open CSV file (origem)
2. Read rows (alelos)
3. Parse data
4. Insert into database
5. Export to Excel (destino)
6. Validate and save
```

---

## 🔧 Implementação Laravel

### Fase 1: Estrutura de Dados

**Nova Tabela: `tb_laudo_exportacao`**
```sql
CREATE TABLE tb_laudo_exportacao (
  exp_cod        INT PRIMARY KEY AUTO_INCREMENT,
  pro_cod        INT,
  exp_tipo       VARCHAR(20),      -- DNA, HIV, etc
  exp_data       DATETIME,
  exp_arquivo    VARCHAR(255),     -- nome arquivo gerado
  exp_status     VARCHAR(20),      -- processado, pendente, erro
  exp_obs        TEXT,             -- observações/erros
  created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
```

### Fase 2: Serviço de Exportação

**Arquivo: `app/Services/LaudoExcelExportService.php`**

Funcionalidades:
- ✅ Importar CSV (alelos, resultados, etc)
- ✅ Validar dados
- ✅ Processar e calcular
- ✅ Exportar para Excel
- ✅ Adicionar fórmulas (genótipos, alelos, etc)

### Fase 3: Controller & Rotas

**Endpoint:**
- POST `/laudos/{id}/exportar-excel` → Gera Excel
- POST `/laudos/importar-csv` → Importa CSV
- GET `/laudos/{id}/download-excel` → Download

### Fase 4: Views

**Nova view: `laudos/exportar.blade.php`**
- Upload CSV
- Preview dos dados
- Botão exportar
- Download

---

## 📝 Tipos de Laudos (Compatível com tags)

| Tipo | Arquivo | Campos |
|------|---------|--------|
| **DNA** | LPADRAO.xlsx | Alelos, Genótipos, Matches |
| **HIV** | LHIV.xlsx | Carga viral, Contagem CD4 |
| **Paternity** | LPATERNITY.xlsx | Índice de Paternidade, Exclusão |
| **SCEI** | LSCEI.xlsx | Medicamentos, Doses |

---

## 🔗 Integração com Tags

Usar tags do DocumentGenerationService:

```
<PROPOSITUS_NOME>, <PROPOSITUS_DTNAS>
<PAI_NOME>, <MAE_NOME>
<IRMAO_NOME>, <IRMA_NOME>
<ITEM1>, <ITEM1_DATA>, <ITEM1_DESC>
```

Exemplo em Excel:
```
Propositus: [<PROPOSITUS_NOME>]  DOC: [<PROPOSITUS_DOC>]
Data Nascimento: [<PROPOSITUS_DTNAS>]

Pai: [<PAI_NOME>]
Mãe: [<MAE_NOME>]

Análise Realizada: [<ITEM1>]
Data: [<ITEM1_DATA>]
```

---

## 📅 Sequência de Implementação

1. ⏳ **Analisar estrutura Delphi** (ufExportaAlelosPlanilhas)
2. ⏳ **Criar LaudoExcelExportService.php**
3. ⏳ **Criar LaudosExportController.php**
4. ⏳ **Criar migration para tb_laudo_exportacao**
5. ⏳ **Criar views (upload, preview, download)**
6. ⏳ **Adicionar rotas**
7. ⏳ **Testes manuais**

---

## 💾 Formato do CSV de Entrada

```csv
ALELO_ID, NOME_MARCADOR, ALELO_1, ALELO_2, GENÓTIPO, FREQ
1, D5S818, 11, 13, 11/13, 0.156
2, D7S820, 10, 12, 10/12, 0.198
3, D8S1179, 13, 15, 13/15, 0.142
```

---

## 📦 Saída Excel

```
┌─────────────────────────────┐
│ LAUDO DE ANÁLISE DE DNA     │
├─────────────────────────────┤
│ Caso: 12345                 │
│ Data: 15/10/2026           │
├─────────────────────────────┤
│ ANÁLISE GENÉTICA            │
│ Marcador | AL1 | AL2 | Genó │
│ D5S818   | 11  | 13  | 11/13│
│ D7S820   | 10  | 12  | 10/12│
├─────────────────────────────┤
│ Resultado: POSITIVO         │
│ Índice: 99.9%              │
└─────────────────────────────┘
```

---

## 🚀 Próximo Passo

Confirmar implementação de:
- [ ] Fase 1 (BD)
- [ ] Fase 2 (Service)
- [ ] Fase 3 (Controller)
- [ ] Fase 4 (Views)
