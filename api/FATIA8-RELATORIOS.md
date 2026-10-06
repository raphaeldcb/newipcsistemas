# Fatia 8: Relatórios — PDF & Excel Generation

## Overview

Fatia 8 implementa **Relatórios** — geração de PDF/Excel com dados integrados de casos, extrações, alelos, créditos e auditoria.

8 tipos de relatórios: Caso Completo, Laudo Final, Extração, Comparação, Créditos, SCEI, Auditoria, Kits.

## Componentes

#### 1. Enum: TipoRelatorio
- 8 tipos (Caso Completo, Laudo Final, Extracao Resultado, Alelos Comparacao, Creditos Faturamento, SCEI Resultado, Auditoria, Kits)
- Formato automático (PDF/Excel)

#### 2. Service: RelatorioService
- `gerarRelatorioCasoCompleto()` — tudo sobre um caso
- `gerarRelatorioExtracao()` — DNA extraction results
- `gerarRelatorioComparacao()` — match entre 2 extrações
- `gerarRelatorioCreditosFaturamento()` — faturamento completo
- `gerarRelatorioKits()` — distribuição de kits
- `gerarRelatorioAuditoria()` — histórico de transições

#### 3. Controller: RelatoriosController
- 6 endpoints POST (casos, extração, comparação, créditos, auditoria)
- 1 endpoint GET (listarTipos)
- 1 endpoint GET (kits)

#### 4. Tests
- `RelatorioServiceTest` — 7 testes de geração

## API Endpoints

```
GET    /api/v1/relatorios/tipos
POST   /api/v1/relatorios/caso-completo
POST   /api/v1/relatorios/extracao
POST   /api/v1/relatorios/comparacao-alelos
POST   /api/v1/relatorios/creditos-faturamento
GET    /api/v1/relatorios/kits
POST   /api/v1/relatorios/auditoria
```

---

**Status**: ✅ Completo (7 relatórios + tipos endpoint + tests)
