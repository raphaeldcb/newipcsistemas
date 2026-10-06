# Leia-me: Fase 1 — Inventário (Completo ✅)

> 📅 Gerado: 2026-10-06
> 👤 Responsável: Inventário Automatizado (Delphi Code Analysis)

---

## 📚 O Que Foi Feito

A **Fase 1** realizou o inventário completo do código-fonte Delphi legado, gerando 3 documentos principais:

### 1️⃣ **INVENTARIO.md** (10 KB)
Catálogo detalhado de TUDO no código Delphi:
- ✅ 116 units (formulários, serviços, utilitários)
- ✅ 5 DataModules (DM, DMR, DMD, DMI, DMRI)
- ✅ 30+ Forms (CRUD, relatórios, consultas)
- ✅ 17 Relatórios (etiquetas, financeiro, laudos, etc.)
- ✅ 7 Impressoras/Geração de documentos
- ✅ Tecnologias/Integrações (COM, QR code, Word, Excel)
- ✅ Templates e modelos (274 laudos, autorizações, etc.)
- ✅ Estatísticas de projeto

**Ler se**: você quer saber "o que existe" no código legado.

---

### 2️⃣ **MAPA-DELPHI-PHP.md** (12 KB)
Plano de conversão: como cada componente Delphi → API REST + PHP:
- ✅ 9 fatias de implementação (pessoas, casos, kits, extrações, SCEI, créditos, alelos, relatórios, admin)
- ✅ Para cada fatia: Forms Delphi → Controllers PHP → Endpoints REST → Banco de dados
- ✅ Exemplo: `fPessoas` (form) → `PessoasController` → `POST/GET/PUT/DELETE /pessoas` → `tb_pessoas`
- ✅ Mapeamento de todas as 59+ tabelas para Models PHP
- ✅ Estrutura de diretórios proposta (src/Controllers, Services, Repositories, Models)
- ✅ Fluxo de requisição (ex: POST /api/casos)
- ✅ Ordem de implementação recomendada (Fase 1-5)

**Ler se**: você quer saber "como converter para PHP" e qual é a primeira coisa a fazer.

---

### 3️⃣ **DUVIDAS-FASE1.md** (8 KB)
20 questões críticas que **você precisa responder** para prosseguir:
- 🔴 **Prioridade Alta (5)**: relatórios, workflow, SCEI, segurança, autenticação
- 🟡 **Prioridade Média (10)**: parcelamento, extração, PKs, integrações
- 🟢 **Prioridade Baixa (5)**: performance, versionamento, upload, auditoria, testes

**Próximo Passo**: responder as 5 de alta prioridade para desbloquear Fase 2.

---

## 🎯 Resumo da Aplicação Legada

### Visão Geral
- **Nome**: SCPG (Sistema de Controle de Perícias Genéticas)
- **Banco**: Firebird 2.5 (SGBD_SCPG.fdb)
- **Arquitetura**: 5 DataModules + 30+ Forms + 59 tabelas
- **Domínio**: Laboratório forense, gestão de casos genéticos, coletas, kits, extrações DNA, créditos, laudos

### Fluxo de Negócio (Estimado)
```
1. Caso é criado (processo judicial → perícia genética)
   ↓
2. Coleta de amostras (kit enviado a local de coleta)
   ↓
3. Recebimento da amostra (lab registra)
   ↓
4. Extração de ADN (3 fases: extração → amplificação → sequenciamento)
   ↓
5. Análise de alelos (marcadores genéticos)
   ↓
6. Emissão de laudo (relatório técnico com conclusão)
   ↓
7. Fechamento do caso + Créditos gerados (cobrança de serviço)
```

### Tecnologias
| Aspecto | Stack |
|--------|-------|
| **Linguagem** | Delphi (1990-2023) |
| **Banco de Dados** | Firebird 2.5 |
| **Acesso BD** | ADO (ActiveX Data Objects) |
| **UI Framework** | VCL (Visual Component Library) |
| **Relatórios** | [TBD — QuickReport? FastReport?] |
| **Integrações** | COM (Word, Excel), QR Code, INI/Registry |
| **Segurança** | Senhas em texto plano (⚠️) |

---

## 🚀 Próximas Etapas

### ✅ Fase 1 — Concluído
- [x] Inventário completo do código Delphi
- [x] Mapeamento Delphi → PHP
- [x] Lista de dúvidas críticas

### 🔜 Fase 2 — Aguardando Suas Respostas
**Para iniciar, você precisa responder:**

1. ❓ Qual tecnologia de **Relatórios**? (QuickReport, FastReport, Crystal, nativo?)
2. ❓ Qual é o **Workflow de Casos** completo? (status, validações, aprovações)
3. ❓ **SCEI** é módulo separado ou integrado?
4. ❓ Como **armazenar senhas** de forma segura na migração?
5. ❓ **Autenticação**: Local ou LDAP/AD?

**Depois de responder (forma: comentário inline em DUVIDAS-FASE1.md ou reunião):**

### 📋 Fase 2 — Arquitetura (será criada)
- Framework PHP (Laravel, Slim, custom)
- ORM (Eloquent, Doctrine, PDO raw)
- Autenticação (JWT, Session, LDAP)
- Estrutura de pastas
- Padrão de Controllers/Services/Repositories
- Documentação de API (Swagger/OpenAPI)

### 🛠️ Fase 3 — Regras de Negócio
- Documento por módulo explicando lógica de negócio
  - `REGRAS-PARCELAMENTO.md`
  - `REGRAS-EXTRACAO.md`
  - `REGRAS-CREDITOS.md`
  - etc.

### 💻 Fase 4+ — Implementação
- Começar com Fatia 1 (Pessoas/Casos)
- Progressão para Fatias 2-9

---

## 📖 Como Ler Estes Documentos

### Se você é **Desenvolvedor PHP**:
1. Leia **MAPA-DELPHI-PHP.md** (entender a conversão)
2. Aguarde **Fase 2** (Arquitetura)
3. Use **INVENTARIO.md** como referência quando precisar de detalhes

### Se você é **Analista de Negócio / Product Owner**:
1. Leia **Resumo acima** (visão geral)
2. Responda **DUVIDAS-FASE1.md** (seção 🔴)
3. Valide **MAPA-DELPHI-PHP.md** (fatias estão corretas?)

### Se você é **Testador / QA**:
1. Aguarde **Fase 3** (Regras de Negócio)
2. Use **INVENTARIO.md** para entender casos de teste

---

## 🗂️ Estrutura de docs/ (Atual)

```
docs/
├── LEIA-ME-FASE1.md          ← Você está aqui
├── INVENTARIO.md             (116 units, 30 forms, 17 relatórios, etc.)
├── MAPA-DELPHI-PHP.md        (9 fatias: pessoas → relatórios)
├── DUVIDAS-FASE1.md          (20 questões: 5 alta, 10 média, 5 baixa prioridade)
│
├── banco/
│   ├── CONVERSAO-FIREBIRD-MYSQL.md  (já existe)
│   └── ... (esquema, dados, migrations)
│
└── [TBD — após Fase 2]
    ├── ARQUITETURA.md
    ├── REGRAS-NEGOCIO-CASOS.md
    ├── REGRAS-NEGOCIO-KITS.md
    └── ...
```

---

## 💬 Próximo Passo: Você

**Marque com um ✅ quando terminar:**

- [ ] Li INVENTARIO.md (entendi o que existe)
- [ ] Li MAPA-DELPHI-PHP.md (entendi a conversão)
- [ ] Respondi as 5 dúvidas de alta prioridade em DUVIDAS-FASE1.md
- [ ] Validei as 9 fatias de implementação

**Quando tudo estiver ✅, avise!** Passamos para Fase 2 (Arquitetura).

---

## 📞 Dúvidas sobre Este Documento?

- **O INVENTARIO.md está incompleto?** → Diga qual seção falta detalhes
- **O mapa Delphi → PHP está errado?** → Que form/endpoint está incorreto?
- **Não entendi uma seção?** → Peça para detalhar
- **Precisa de mais exemplos?** → Solicite (ex: exemplo de workflow completo)

---

## 📌 Métricas da Fase 1

| Métrica | Valor |
|---------|-------|
| **Documentos criados** | 3 (+ este) |
| **Tamanho total** | ~38 KB |
| **Dúvidas levantadas** | 20 |
| **Fatias de implementação mapeadas** | 9 |
| **Units inventariadas** | 116 |
| **Forms documentadas** | 30+ |
| **Tabelas mapeadas para Models** | 59+ |
| **Tempo estimado para Fase 2** | 1-2 dias (após suas respostas) |

---

## 🎬 Ação Imediata

1. **Hoje**: Leia este LEIA-ME + DUVIDAS-FASE1.md (prioridade alta)
2. **Semana que vem**: Responda as 5 dúvidas de alta prioridade
3. **Então**: Passamos para Fase 2 (Arquitetura + Decisões)

**Obrigado! 🙏** A Fase 1 está pronta para você revisar.

