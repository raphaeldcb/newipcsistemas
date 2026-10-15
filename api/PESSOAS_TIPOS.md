# 👥 Tipos de Pessoas e Relacionamentos

## Status de Análise

Após análise completa do código Delphi e banco de dados SQL:

### ✅ CAMPOS CONFIRMADOS (tb_pessoas)
```
pes_cod         - ID pessoa
pes_nome        - Nome
pes_iniciais    - Iniciais
pes_sit         - Situação
pes_dtnas       - Data nascimento
pes_lcnas       - Local nascimento
pes_sexo        - Sexo (M/F)
pes_tdoc        - Tipo documento (RG, CPF, etc)
pes_ndoc        - Número documento
```

### ❓ RELACIONAMENTOS (VERIFICAR)

Na tabela de **alelos** existe:
- `are_al1_mae`, `are_al2_mae` - Alelos mãe (campo de resultado)
- `nome_supai`, `cpf_supai`, `ende_supai` - Suposto pai (em tb_compra_kit)

**Mas NÃO há campo de tipo de relacionamento** na tabela tb_pessoas como:
- `pes_relacionamento` 
- `pes_parentesco`
- `pes_tipo` (tipo de pessoa no processo)

---

## 🔍 POSSÍVEIS INTERPRETAÇÕES

### Opção 1: Relacionamento por TIPO PESSOA (seu_codigo)
Pode existir uma tabela `tb_tipo_pessoa` ou código que indique:
- 1 = Propositus (o indivíduo em questão)
- 2 = Pai
- 3 = Mãe
- 4 = Avó
- 5 = Avô
- 6 = Tio
- 7 = Tia
- 8 = Irmão
- 9 = Irmã
- 10 = Cônjuge
- etc.

### Opção 2: Campo Separado (não encontrado no SQL)
Pode haver um campo `pes_relacionamento` ou similar não capturado.

### Opção 3: Ordem de Inserção (Delphi)
O Delphi pode ter lógica que assume:
- 1ª pessoa inserida = Propositus
- 2ª pessoa = Mãe
- 3ª pessoa = Pai
- etc.

---

## 📋 AÇÃO RECOMENDADA

**Para confirmar tags de parentesco, verificar:**

1. **SCPG Table Structure** (Créditos system)
   - Pode ter estrutura de relacionamentos mais clara

2. **Histórico table** (tb_historico)
   - Pode indicar tipo de pessoa por item

3. **Procedimentos table** (tb_procedimentos)
   - Conexão com pes_cod pode revelar tipos

4. **Código Delphi completo**
   - Buscar por `GeraDadosPessoas` procedure em ufGeraWord.pas

---

## 📞 PRÓXIMAS TAGS A ADICIONAR (quando confirmadas)

Se existirem tipos de pessoa:
```
<PAI_NOME>, <PAI_DOC>, <PAI_SEXO>, <PAI_DTNAS>
<MAE_NOME>, <MAE_DOC>, <MAE_SEXO>, <MAE_DTNAS>
<AVÓ_NOME>, <AVÓ_DOC>, <AVÓ_SEXO>, <AVÓ_DTNAS>
<AVO_NOME>, <AVO_DOC>, <AVO_SEXO>, <AVO_DTNAS>
<TIO_NOME>, <TIO_DOC>, <TIO_SEXO>, <TIO_DTNAS>
<TIA_NOME>, <TIA_DOC>, <TIA_SEXO>, <TIA_DTNAS>
<IRMAO_NOME>, <IRMAO_DOC>, <IRMAO_SEXO>, <IRMAO_DTNAS>
<IRMA_NOME>, <IRMA_DOC>, <IRMA_SEXO>, <IRMA_DTNAS>
<CONJUGE_NOME>, <CONJUGE_DOC>, <CONJUGE_SEXO>, <CONJUGE_DTNAS>
<PROPOSITUS_NOME>, <PROPOSITUS_DOC>, <PROPOSITUS_SEXO>, <PROPOSITUS_DTNAS>
```

---

## 🔗 Arquivo Relevante

- `/api/app/Services/DocumentGenerationService.php` - Linha 161 (prepararTags)
- Banco: `tb_pessoas` (15 colunas)
- Delphi: `ufGeraWord.pas` - procedure `GeraDadosPessoas`

**Status**: Tags dinâmicas IMPLEMENTADAS
**Próximo passo**: Confirmar tipos de pessoa/relacionamento no banco
