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

### Múltiplas Pessoas (indexadas por número)
```
<PESSOA1>           - Nome da 1ª pessoa
<PESSOA1_NOME>      - Nome da 1ª pessoa
<PESSOA1_INICIAIS>  - Iniciais da 1ª pessoa
<PESSOA1_DOC>       - Documento da 1ª pessoa
<PESSOA1_SEXO>      - Sexo da 1ª pessoa
<PESSOA1_DTNAS>     - Data nascimento da 1ª pessoa

<PESSOA2>, <PESSOA3>, ... <PERSONN>
```

### Pessoas por Parentesco (tipos específicos)
```
<!-- PROPOSITUS -->
<PROPOSITUS>         - Nome do propositus
<PROPOSITUS_NOME>    - Nome
<PROPOSITUS_DOC>     - Documento
<PROPOSITUS_SEXO>    - Sexo
<PROPOSITUS_DTNAS>   - Data nascimento

<!-- PAI & MÃE -->
<PAI>, <PAI_NOME>, <PAI_DOC>, <PAI_SEXO>, <PAI_DTNAS>
<MAE>, <MAE_NOME>, <MAE_DOC>, <MAE_SEXO>, <MAE_DTNAS>

<!-- AVÓS -->
<AVO_PAI>, <AVO_PAI_NOME>, <AVO_PAI_DOC>, ...
<AVO_MAE>, <AVO_MAE_NOME>, <AVO_MAE_DOC>, ...

<!-- IRMÃOS -->
<IRMAO>, <IRMAO_NOME>, <IRMAO_DOC>, <IRMAO_SEXO>, <IRMAO_DTNAS>
<IRMA>, <IRMA_NOME>, <IRMA_DOC>, <IRMA_SEXO>, <IRMA_DTNAS>

<!-- CÔNJUGE -->
<CONJUGE>, <CONJUGE_NOME>, <CONJUGE_DOC>, <CONJUGE_SEXO>, <CONJUGE_DTNAS>

<!-- TIOS/TIAS -->
<TIO>, <TIO_NOME>, <TIO_DOC>, <TIO_SEXO>, <TIO_DTNAS>
<TIA>, <TIA_NOME>, <TIA_DOC>, <TIA_SEXO>, <TIA_DTNAS>

<!-- PRIMOS/PRIMAS -->
<PRIMO>, <PRIMO_NOME>, <PRIMO_DOC>, <PRIMO_SEXO>, <PRIMO_DTNAS>
<PRIMA>, <PRIMA_NOME>, <PRIMA_DOC>, <PRIMA_SEXO>, <PRIMA_DTNAS>

<!-- SOBRINHOS/SOBRINHAS -->
<SOBRINHO>, <SOBRINHO_NOME>, <SOBRINHO_DOC>, <SOBRINHO_SEXO>, <SOBRINHO_DTNAS>
<SOBRINHA>, <SOBRINHA_NOME>, <SOBRINHA_DOC>, <SOBRINHA_SEXO>, <SOBRINHA_DTNAS>

<!-- TATAAVÓS -->
<TATAAVO>, <TATAAVO_NOME>, <TATAAVO_DOC>, <TATAAVO_SEXO>, <TATAAVO_DTNAS>
```

### Suporte a Múltiplos Parentes do Mesmo Tipo
```
<!-- Se há 2 pais/mães/tios/etc. -->
<PAI>      - Primeiro pai
<PAI2>     - Segundo pai
<PAI3>     - Terceiro pai

<MAE>      - Primeira mãe
<MAE2>     - Segunda mãe

<TIO>      - Primeiro tio
<TIO2>     - Segundo tio
<TIO3>     - Terceiro tio

<!-- Mesmo padrão para todos os tipos -->
```

**Exemplo:**
```
Certifico que <?= <PAI_NOME> ?>, <?= <PAI_SEXO> ?>,
nascido(a) em <?= <PAI_DTNAS> ?>, documento <?= <PAI_DOC> ?>

E <?= <MAE_NOME> ?>, <?= <MAE_SEXO> ?>,
nascida em <?= <MAE_DTNAS> ?>, documento <?= <MAE_DOC> ?>...
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
