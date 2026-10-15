# 📋 Tags de Substituição - Referência Completa

## Geração de Documentos - DocumentGenerationService

Este documento lista **todas as tags** disponíveis para uso em templates DOCX/DOC.

---

## ⚖️ INFORMAÇÕES BÁSICAS DO PROCESSO

| Tag | Descrição | Exemplo |
|-----|-----------|---------|
| `<PROCESSO>` | Número CNJ do processo | 0000000-00.0000.0.00.0000 |
| `<CODIGO>` | ID interno do processo | 12345 |
| `<DOCUMENTOHISTORICO>` | Número laudo/documento | LAU-2026-001 |

---

## 📅 DATAS - FORMATO EXTENSO (DD de mês de YYYY)

| Tag | Descrição | Exemplo |
|-----|-----------|---------|
| `<DTCOLETA>` | Data coleta (extenso) | 15 de outubro de 2026 |
| `<DTATUAL>` | Data atual (extenso) | 14 de outubro de 2026 |
| `<DTREC>` | Data recepção (extenso) | 16 de outubro de 2026 |
| `<DTRESULT>` | Data resultado (extenso) | Primeiro de outubro de 2026 |

---

## 📅 DATAS - FORMATO NUMÉRICO (DD/MM/YYYY)

| Tag | Descrição | Exemplo |
|-----|-----------|---------|
| `<DTRESULTF>` | Data resultado (formato numérico) | 15/10/2026 |

---

## ⏰ HORAS - COLETA

| Tag | Descrição | Exemplo |
|-----|-----------|---------|
| `<HORA>` | Hora coleta (HH) | 10 |
| `<MINUTO>` | Minuto coleta (MM) | 30 |

---

## ⏰ HORAS - RECEPÇÃO

| Tag | Descrição | Exemplo |
|-----|-----------|---------|
| `<HORARECEPCAO>` | Hora recepção (HH) | 14 |
| `<MINUTORECEPCAO>` | Minuto recepção (MM) | 45 |

---

## 🧬 RESULTADOS (DNA)

| Tag | Descrição | Exemplo |
|-----|-----------|---------|
| `<PROBABILIDADE>` | Percentual resultado | 99.9 |
| `<PROBABILIDADEPPC>` | Resultado com texto | POSITIVO COM 99.9% |
| `<AUTORETIRAR>` | Autorização retirada | SIM |

---

## ⚖️ DADOS JUDICIÁRIOS

| Tag | Descrição | Exemplo |
|-----|-----------|---------|
| `<JUIZ>` | Nome do juiz | Dr. João Silva |
| `<VARA>` | Nome da vara | Vara de Família |
| `<COMARCA>` | Comarca | São Paulo |
| `<ESTADO>` | Estado (sigla) | SP |

---

## 👥 PESSOAS ENVOLVIDAS (Dinâmicas)

### Primeira Pessoa (genérica)
```
<NOME>              - Nome completo
<INICIAIS>          - Iniciais
<DOCUMENTO>         - Número documento (RG, CPF)
<SEXO>              - Sexo (M/F)
<DATANASC>          - Data nascimento (extenso)
```

### Múltiplas Pessoas (indexadas)
```
<PESSOA1>           - Nome da 1ª pessoa
<PESSOA1_NOME>      - Nome da 1ª pessoa
<PESSOA1_INICIAIS>  - Iniciais da 1ª pessoa
<PESSOA1_DOC>       - Documento da 1ª pessoa
<PESSOA1_SEXO>      - Sexo da 1ª pessoa
<PESSOA1_DTNAS>     - Data nascimento da 1ª pessoa

<PESSOA2>           - Nome da 2ª pessoa
<PESSOA2_NOME>      - Nome da 2ª pessoa
... (repetir padrão)

<PESSOA3>, <PESSOA4>, ... (N pessoas)
```

**Exemplo:**
```
Certifico que <?= <PESSOA1_NOME> ?>, <?= <PESSOA1_SEXO> ?>,
nascido(a) em <?= <PESSOA1_DTNAS> ?>, documento <?= <PESSOA1_DOC> ?>...
```

---

## 📋 ITENS DE HISTÓRICO (Dinâmicos)

### Primeiro Item (genérico)
```
<ITEM>              - Nome do item/tipo
<ITEM_DATA>         - Data do item (extenso)
<ITEM_DOC>          - Número documento
```

### Múltiplos Itens (indexados)
```
<ITEM1>             - Nome 1º item
<ITEM1_DESC>        - Descrição 1º item
<ITEM1_DATA>        - Data 1º item (extenso)
<ITEM1_DOC>         - Doc 1º item
<ITEM1_OBS>         - Observação 1º item

<ITEM2>             - Nome 2º item
<ITEM2_DESC>        - Descrição 2º item
... (repetir padrão)

<ITEM3>, <ITEM4>, ... (N itens)
```

**Exemplo:**
```
Laudo solicitado em <?= <ITEM1_DATA> ?>
Tipo: <?= <ITEM1> ?>
Observações: <?= <ITEM1_OBS> ?>
```

---

## 🔄 BOAS PRÁTICAS

### 1. **Verificações Condicionais**
Se um campo pode estar vazio, use condicional no template:
```
{%if PESSOA1_NOME%}
Nome: <?= <PESSOA1_NOME> ?>
{%endif%}
```

### 2. **Múltiplas Pessoas**
Para loop de pessoas:
```
Pessoas envolvidas:
<?= <PESSOA1_NOME> ?> (Doc: <?= <PESSOA1_DOC> ?>)
<?= <PESSOA2_NOME> ?> (Doc: <?= <PESSOA2_DOC> ?>)
<?= <PESSOA3_NOME> ?> (Doc: <?= <PESSOA3_DOC> ?>)
```

### 3. **Histórico**
Para histórico de itens/eventos:
```
Item 1: <?= <ITEM1> ?> (<?= <ITEM1_DATA> ?>)
Item 2: <?= <ITEM2> ?> (<?= <ITEM2_DATA> ?>)
Item 3: <?= <ITEM3> ?> (<?= <ITEM3_DATA> ?>)
```

### 4. **Datas em Documentos Formais**
Use as datas extensas para documentos oficiais:
```
Laudo realizado em <?= <DTCOLETA> ?>
Recebido em <?= <DTREC> ?>
Resultado disponível em <?= <DTRESULT> ?>
```

---

## 📊 CONTAGEM DINÂMICA

O serviço **detecta automaticamente** a quantidade de:
- **Pessoas** vinculadas ao processo
- **Itens** (históricos) relacionados

Você pode usar de 1 a N tags indexadas:
- `<PESSOA1>` a `<PERSON∞>`
- `<ITEM1>` a `<ITEM∞>`

---

## ⚠️ NOTAS IMPORTANTES

1. **Tags são case-sensitive**: `<PROCESSO>` ≠ `<processo>`
2. **Sem espaços**: `< PROCESSO >` NÃO funciona
3. **Valores vazios**: Tags com valores vazios serão substituídas por string vazia
4. **Formatação preservada**: Caracters especiais são escapados automaticamente
5. **Data null**: Se data for nula, tag não será substituída (mantém `<TAG>` original)

---

## 🔗 Integração

Usado em:
- `DocumentGenerationService::gerar()`
- `DocumentGenerationService::prepararTags()`
- `DocumentGenerationService::substituirTags()`

Arquivo: `/app/Services/DocumentGenerationService.php`

---

**Última atualização**: 2026-10-14
**Versão**: 2.0 (com Pessoas e Itens dinâmicos)
