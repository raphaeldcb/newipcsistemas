# 🔍 Investigação: GeraDadosPessoas e Tags de Parentesco

## Status da Busca

### ✅ O Que Encontrei

**Arquivo:** `/migracao_outubro/legado/delphi/Fontes/ufGeraWord.pas` (linhas 886-887)
```delphi
GeraDadosPessoas;      // Chamada na procedure sbEmitirClick
InformacoesColetador;  // Chamada após GeraDadosPessoas
```

**Mas:** A procedure `GeraDadosPessoas` NÃO está **definida** no arquivo `ufGeraWord.pas`

Isso significa que ela pode estar:
1. ✅ **Em outro arquivo (.pas)** na unidade ufGeraWord
2. ✅ **Em uma classe base** (herança de TfPadrao)
3. ✅ **Em um arquivo incluído** (via `{$I arquivo.inc}`)

---

## 📊 O Que Sabemos Sobre Pessoas

### Tabela: `tb_pessoas`
```sql
CREATE TABLE tb_pessoas (
  pro_cod      INT,          -- ID processo
  pes_cod      INT,          -- ID pessoa (auto increment)
  pes_nome     VARCHAR(60),  -- Nome
  pes_iniciais VARCHAR(10),  -- Iniciais
  pes_sit      INT,          -- Situação (FK -> tb_situacao)
  pes_dtnas    DATE,         -- Data nascimento
  pes_lcnas    VARCHAR(50),  -- Local nascimento
  pes_sexo     CHAR(1),      -- M/F
  pes_tdoc     VARCHAR(30),  -- Tipo documento
  pes_ndoc     VARCHAR(200)  -- Número documento
)
```

### Tabela: `tb_situacao` (Relação com tb_pessoas via pes_sit)
```sql
CREATE TABLE tb_situacao (
  sit_cod   INT PRIMARY KEY,
  sit_nm    VARCHAR(20),     -- Nome da situação
  sit_sigla VARCHAR(5),      -- Sigla
  sit_ordem INT              -- Ordem exibição
)
```

---

## ❓ Situações Possíveis de Pessoa

Baseado em padrões de DNA/parentesco:
- `1` = **Propositus** (indivíduo em questão)
- `2` = **Mãe** (Mother)
- `3` = **Pai** (Father)
- `4` = **Avó materna** (Maternal Grandmother)
- `5` = **Avô materno** (Maternal Grandfather)
- `6` = **Avó paterna** (Paternal Grandmother)
- `7` = **Avô paterno** (Paternal Grandfather)
- `8` = **Irmão** (Brother)
- `9` = **Irmã** (Sister)
- `10` = **Cônjuge** (Spouse)
- `11` = **Tio** (Uncle)
- `12` = **Tia** (Aunt)
- `13` = **Avô/Avó** (Generic Grandparent)
- etc.

---

## 🎯 Como Confirmar

### Opção 1: Direto no Banco (Windows/MySQL)
```sql
SELECT * FROM tb_situacao;
```
Isso listará TODAS as situações/tipos de pessoa existentes.

### Opção 2: No Código Delphi
1. Abra `/migracao_outubro/legado/delphi/Fontes/ufGeraWord.dfm`
2. Procure por `GeraDadosPessoas` - pode estar como método da classe
3. Se não achar, procure em:
   - `/Fontes/ufPadrao.pas` (classe base)
   - `/Fontes/ufDM.pas` (data module)

### Opção 3: No Laudo Antigo (Outlook/Word)
Abra um laudo .doc antigo em Microsoft Word e procure por tags tipo:
- `<PAI...>`, `<MAE...>`, `<AVO...>`, `<IRMA...>`, etc.

---

## 📝 Tags que Provavelmente Existem

Se seguir o padrão de DNA:
```
<!-- PROPOSITUS -->
<PROPOSITUS_NOME>
<PROPOSITUS_DOC>
<PROPOSITUS_SEXO>
<PROPOSITUS_DTNAS>

<!-- MAE -->
<MAE_NOME>
<MAE_DOC>
<MAE_SEXO>
<MAE_DTNAS>

<!-- PAI -->
<PAI_NOME>
<PAI_DOC>
<PAI_SEXO>
<PAI_DTNAS>

<!-- AVÓ/AVÔ -->
<AVO_NOME>
<AVO_DOC>
<AVO_DTNAS>

<!-- IRMAO/IRMA -->
<IRMAO_NOME>, <IRMA_NOME>
<IRMAO_DOC>, <IRMA_DOC>

<!-- TIO/TIA -->
<TIO_NOME>, <TIA_NOME>
<TIO_DOC>, <TIA_DOC>

<!-- CONJUGE -->
<CONJUGE_NOME>
<CONJUGE_DOC>
<CONJUGE_DTNAS>
```

---

## 🔗 Arquivo que Precisa Ser Atualizado

Quando confirmadas as tags:
- `/api/app/Services/DocumentGenerationService.php` (linha ~161)
- Método: `prepararTags()`

---

## 📌 Próximos Passos

1. ✅ **Executar query** no banco Windows:
   ```sql
   SELECT sit_cod, sit_nm, sit_sigla FROM tb_situacao ORDER BY sit_cod;
   ```

2. ✅ **Abrir um laudo antigo** em Word e procurar por tags de parentesco

3. ✅ **Informar os resultados** para que eu adicione as tags ao DocumentGenerationService

---

**Criado:** 2026-10-14  
**Status:** Aguardando confirmação de dados do banco
