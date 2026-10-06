# 🗂️ Índice Rápido — Onde Encontrar Cada Coisa

> Navegação rápida pelos documentos da Fase 1.

---

## 🎯 Seu Próximo Passo?

### "Quero saber o que foi feito"
→ Leia: **LEIA-ME-FASE1.md** (5 min)

### "Quero entender o código Delphi"
→ Leia: **INVENTARIO.md** (15 min)
- Procure por: Sua form/report favorita
- Procure por: Que tabelas ela usa
- Procure por: Que queries ela executa

### "Quero saber como converter para PHP"
→ Leia: **MAPA-DELPHI-PHP.md** (10 min)
- Procure por: Sua fatia de negócio (Pessoas, Kits, Créditos, etc.)
- Procure por: Endpoints REST propostos
- Procure por: Estrutura de diretórios

### "Preciso responder dúvidas"
→ Edite: **DUVIDAS-FASE1.md**
- Procure por: 🔴 (prioridade alta — COMECE AQUI)
- Procure por: Sua resposta à questão X
- Escreva a resposta inline

### "Quero um sumário visual"
→ Leia: **FASE1-RESUMO.txt** (no raiz; 3 min)

---

## 📍 Estrutura de Documentação

```
migracao_outubro/
│
├── FASE1-RESUMO.txt               ← Sumário visual (comece aqui!)
│
└── docs/
    ├── LEIA-ME-FASE1.md           ← Guia de leitura (depois do sumário)
    ├── INVENTARIO.md              ← Catálogo Delphi (consulta)
    ├── MAPA-DELPHI-PHP.md         ← Blueprint PHP (consulta)
    ├── DUVIDAS-FASE1.md           ← Questões a responder (ação!)
    ├── ÍNDICE-RÁPIDO.md           ← Este arquivo
    │
    ├── banco/
    │   └── CONVERSAO-FIREBIRD-MYSQL.md  (já existia)
    │
    └── [TBD — Fase 2+ produzirá mais]
        ├── ARQUITETURA.md
        ├── REGRAS-NEGOCIO-*.md
        └── ...
```

---

## 🔍 Procurando por um Tópico Específico?

### **Pessoas** (Gestão de pessoas, juízes, varas)
- Inventário: `INVENTARIO.md` → seção "Gestão de Pessoas"
- Mapa: `MAPA-DELPHI-PHP.md` → "Fatia 1: Gestão de Pessoas"
- Forms: fPessoas, fJuiz, fVara, fComarca, fEstado
- Banco: tb_pessoas, tb_juiz, tb_vara, tb_comarca, tb_estado

### **Casos** (Processos, histórico)
- Inventário: `INVENTARIO.md` → "Gestão de Processos"
- Mapa: `MAPA-DELPHI-PHP.md` → "Fatia 2: Gestão de Processos/Casos"
- Forms: fProcessos, fHistorico, fConsultaCPG
- Banco: tb_processo, tb_historico, tb_item

### **Kits** (Coletas de amostras)
- Inventário: `INVENTARIO.md` → "Gestão de Kits (Coletas)"
- Mapa: `MAPA-DELPHI-PHP.md` → "Fatia 3: Gestão de Kits"
- Forms: fKits, fEmissaoKits, fRastrearKits, fLocaisColeta
- Banco: tb_kits, tb_local_coleta, tb_coleta_adicional

### **Extração de ADN** (3 fases)
- Inventário: `INVENTARIO.md` → "Gestão de Extrações"
- Mapa: `MAPA-DELPHI-PHP.md` → "Fatia 4: Extração de ADN"
- Forms: fExtracao, fMapa_ExtAmpli, fValidaExtracao
- Banco: tb_extracao, tb_extracao_casos, tb_mapa_extampli
- ⚠️ Questão: Dúvida #7 em DUVIDAS-FASE1.md (3 fases sequenciais?)

### **SCEI** (Laboratório — infectologia)
- Inventário: `INVENTARIO.md` → "Subsistema SCEI"
- Mapa: `MAPA-DELPHI-PHP.md` → "Fatia 5: Subsistema SCEI"
- Forms: fExames, fProcedimentos, fEmissaoLaudo, fCarga
- Banco: tb_exames, tb_laboratorios, tb_procedimentos
- ⚠️ Questão: Dúvida #3 em DUVIDAS-FASE1.md (módulo separado?)

### **Créditos & Finanças**
- Inventário: `INVENTARIO.md` → "Créditos e Finanças"
- Mapa: `MAPA-DELPHI-PHP.md` → "Fatia 6: Créditos e Finanças"
- Forms: fParcelamento, fCreditosGeracao, fVinculaCreditos
- Banco: tb_parcelas, tb_creditos
- ⚠️ Questão: Dúvida #6 em DUVIDAS-FASE1.md (lógica de cálculo?)

### **Alelos & Marcadores Genéticos**
- Inventário: `INVENTARIO.md` → "Alelos"
- Mapa: `MAPA-DELPHI-PHP.md` → "Fatia 7: Alelos"
- Forms: ufGeraDocLab, ufExportaAlelosPlanilhas
- Banco: tb_alelos, tb_alelos_tipos, tb_contaalelo

### **Relatórios** (17 relatórios)
- Inventário: `INVENTARIO.md` → "Relatórios (17 units)"
- Mapa: `MAPA-DELPHI-PHP.md` → "Fatia 8: Relatórios & Impressões"
- Units: ufRelEtiquetas, ufRelFinanceiro, ufRelLaudos*, ufGeradorRel*
- ⚠️ Questão: Dúvida #1 em DUVIDAS-FASE1.md (qual biblioteca?)

### **Impressoras**
- Inventário: `INVENTARIO.md` → "Impressoras / Impressões (7 units)"
- Mapa: `MAPA-DELPHI-PHP.md` → "Fatia 8"
- Units: ufImprimeLaudo, ufImprimeComprovante, ufImprimeFolha*
- ⚠️ Questão: Dúvida #9 em DUVIDAS-FASE1.md (print local ou servidor?)

### **Administração & Config**
- Inventário: `INVENTARIO.md` → "Configuração/Administração"
- Mapa: `MAPA-DELPHI-PHP.md` → "Fatia 9: Admin & Configuração"
- Forms: fAcesso (login), fUsuarios, fParametros, fRegras
- ⚠️ Questão: Dúvida #5 em DUVIDAS-FASE1.md (LDAP?)

### **Segurança**
- INVENTARIO.md → seção "Observações Críticas" → subsection "Segurança"
- DUVIDAS-FASE1.md → Dúvida #4 (senhas em texto plano)
- DUVIDAS-FASE1.md → Dúvida #5 (autenticação)

### **Banco de Dados**
- CONVERSAO-FIREBIRD-MYSQL.md (já existia — migração Firebird→MySQL)
- INVENTARIO.md → "Mapeamento de Tabelas Delphi → Modelos PHP"
- MAPA-DELPHI-PHP.md → "Mapeamento de Tabelas ... → Models PHP"

---

## 📊 Estatísticas Rápidas

| O Quê | Quantidade |
|-------|-----------|
| Units | 116 |
| Forms | 30+ |
| DataModules | 5 |
| Relatórios | 17 |
| Impressoras | 7 |
| Tabelas Banco | 59+ |
| Fatias de Implementação | 9 |
| Dúvidas Críticas | 20 (5 alta, 10 média, 5 baixa) |

---

## ⏭️ Sequência de Leitura Recomendada

### Para Gerente/Product Owner
1. **FASE1-RESUMO.txt** (5 min) — Visão geral
2. **LEIA-ME-FASE1.md** (5 min) — O que fazer agora
3. **DUVIDAS-FASE1.md** → Seção 🔴 (5 min) — Responda isso!

**Tempo total: 15 minutos**

### Para Desenvolvedor PHP
1. **FASE1-RESUMO.txt** (5 min) — Contexto
2. **MAPA-DELPHI-PHP.md** (20 min) — Como converter
3. **INVENTARIO.md** (15 min) — Consulta ao precisar

**Tempo total: 40 minutos**

### Para Testador/QA
1. **FASE1-RESUMO.txt** (5 min) — Visão geral
2. **INVENTARIO.md** → Seções de Forms (20 min) — Entender o que existe
3. Aguardar REGRAS-NEGOCIO-*.md (Fase 3) — Casos de teste

---

## 💬 Perguntas Frequentes

### "Onde está a lista de Forms?"
→ INVENTARIO.md, seção "Forms (30 units com TForm)"

### "Qual é o endpoint REST para X form?"
→ MAPA-DELPHI-PHP.md, procure pela Fatia corresponde

### "Como a tabela X é usada?"
→ INVENTARIO.md, seção "Mapeamento de Tabelas"

### "Qual é a tecnologia de relatórios?"
→ DUVIDAS-FASE1.md, Dúvida #1 (você precisa responder!)

### "Quando começamos a programar?"
→ Fase 2 (Arquitetura) após você responder as 5 dúvidas de alta prioridade

### "Como tiro dúvida sobre um documento?"
→ Responda inline em DUVIDAS-FASE1.md OU edite INVENTARIO.md/MAPA-DELPHI-PHP.md

---

## 🎯 Ação Imediata

**👉 COMECE AQUI (agora):**

1. Abra `FASE1-RESUMO.txt` (este diretório, raiz)
2. Leia os primeiros 100 linhas
3. Depois leia `docs/LEIA-ME-FASE1.md`
4. Identifique qual seção te interessa em `docs/DUVIDAS-FASE1.md`
5. **Responda as 5 questões de alta prioridade** 🔴

**Após responder:**
- Eu crio ARQUITETURA.md (Fase 2)
- Começamos planejamento de implementação

---

## 📞 Resumo de Documentos

| Documento | Tamanho | Tipo | Tempo de Leitura | Ação |
|-----------|---------|------|------------------|------|
| FASE1-RESUMO.txt | 10 KB | Sumário | 5 min | Leia primeiro! |
| LEIA-ME-FASE1.md | 6 KB | Guia | 5 min | Depois disso |
| INVENTARIO.md | 10 KB | Catálogo | 15 min | Consulte |
| MAPA-DELPHI-PHP.md | 12 KB | Blueprint | 15 min | Consulte |
| DUVIDAS-FASE1.md | 8 KB | Questões | Var. | **Responda!** ⭐ |
| ÍNDICE-RÁPIDO.md | 5 KB | Este | 5 min | Navegação |

**Total: ~51 KB de documentação | Tempo total de leitura: ~45 min**

---

## ✅ Checklist Final

- [ ] Li FASE1-RESUMO.txt
- [ ] Li LEIA-ME-FASE1.md
- [ ] Abri INVENTARIO.md (consultei áreas que me interessam)
- [ ] Abri MAPA-DELPHI-PHP.md (vi as 9 fatias)
- [ ] Abri DUVIDAS-FASE1.md
- [ ] Identifiquei as 5 questões de alta prioridade
- [ ] Respondi ou agendei reunião para responder
- [ ] Validei que as 9 fatias fazem sentido

---

## 🚀 Próximo Milestone

Quando todas as checkboxes acima estiverem ✅:

→ **Fase 2 (Arquitetura)** será criada com:
- Framework PHP recomendado
- Padrão de Controllers/Services/Repositories
- Estrutura de pastas confirmada
- Documentação de API (Swagger)
- Stack definitivo (ORM, autenticação, relatórios)

---

Boa leitura! 📖

