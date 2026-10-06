# Inventário do Código Delphi — SCPG

> Levantamento completo da aplicação legada Delphi. Atualizado: 2026-10-06.

## 📋 Resumo executivo

- **Projeto**: SCPG (Sistema de Controle de Perícias Genéticas)
- **Linguagem**: Delphi (DPR + PAS + DFM)
- **Banco de Dados**: Firebird 2.5 (SGBD_SCPG.fdb)
- **Estrutura**: 116 units + 5 DataModules + ~30 Forms
- **Total de arquivos**: ~1.185 arquivos (incluindo imagens, modelos, laudos)
- **Domínio**: laboratório forense / perícias genéticas (casos, coletas, kits, exames, alelos, laudos, créditos)

---

## 🏗️ Arquitetura Delphi

### Estrutura de diretórios

```
legado/delphi/
├── Fontes/                    (116 units)
│   ├── *.pas + *.dfm          (Forms, units de negócio)
│   ├── *.ddp                  (Dados design-time)
│   ├── scei/                  (Subsistema SCEI — 20 units)
│   ├── qrcode/                (Biblioteca QR code)
│   └── SCPG.dpr              (Projeto principal)
├── Imagens/                   (46 pastas de ícones/recursos)
├── Laboratorio/               (módulo específico)
├── LAUDOS/                    (templates de laudos — ~274 pastas)
├── Modelos/                   (templates de documentos Word/Excel)
└── OFÖCIOS/                   (templates de ofícios)
```

---

## 🔌 DataModules (coração da aplicação)

| Módulo | Localização | Propósito | Queries Principais |
|--------|-------------|----------|-------------------|
| **DM** | ufDM.pas | Principal — SCPG | Casos, Pessoas, Kits, Extrações, Parcelamento, Histórico, Regras, Processos |
| **DMR** | ufDMR.pas | Créditos/Financeiro | [a verificar] |
| **DMD** | ufDMD.pas | [especializado] | [a verificar] |
| **DMI** | scei/ufDMI.pas | SCEI (laboratório) | Exames, Laboratórios, Médicos, Pacientes, Procedimentos |
| **DMRI** | scei/ufDMRI.pas | SCEI (especializado) | [a verificar] |

### Queries em DM (principais)

```
qRestricao, qHosts, qLocalColeta, qCasos, qVara, qItem, qUF, qParametros,
qMaxProcesso, qHistorico, qRegras, qParcelamento, qMaxComarca,
qJuiz, qPessoas, qMaxPessoa, qMaxHistorico, qComarca, qDadosProcesso,
qKits, qColetador, qPesquisa, qEnderecos, qCorrespondencia,
qMapa_ExtAmpli, qExtracao, qLocalColetaLkp, qHostsLkp,
qImpressoes, qPessoasGrid, qContaAlelo, qColetadoresRelatorios,
qColetadoresKits, qKitsLkpColetador, qHostsLkp
```

---

## 📋 Forms (30 units com TForm)

### Gestão de Processos (casos)

| Form | Unit | Funcionalidade |
|------|------|---|
| fProcessos | ufProcesso.pas | Criar/editar/consultar casos |
| fHistorico | ufHistorico.pas | Histórico de atos do caso |
| fItemHist | ufItemHistorico.pas | Itens do histórico |
| fConsultaCPG | ufConsultaCPG.pas | Busca de casos |

### Gestão de Pessoas

| Form | Unit | Funcionalidade |
|------|------|---|
| fPessoas | ufPessoas.pas | Cadastro de pessoas (25 KB — complexa) |
| fJuiz | ufJuiz.pas | Cadastro de juízes |
| fConsultaJuizes | ufConsultaJuiz.pas | Consulta de juízes |
| fVara | ufVara.pas | Cadastro de varas judiciais |
| fConsultaVara.pas | ufConsultaVara.pas | Consulta de varas |
| fComarca | ufComarca.pas | Cadastro de comarcas |
| fConsultaComarca | ufConsultaComarca.pas | Consulta de comarcas |
| fEstado | ufEstado.pas | Cadastro de estados (UF) |

### Gestão de Kits (coletas)

| Form | Unit | Funcionalidade |
|------|------|---|
| fKits | ufKits.pas | Cadastro de kits |
| fConsultaKits | ufConsultaKits.pas | Consulta de kits |
| fEmissaoKits | ufEmissaoKits.pas | Emissão de kits |
| fColetadoresKits | ufColetadoresKits.pas | Coletadores × Kits |
| fRastrearKits | ufRastrearKits.pas | Rastreamento de kits |
| fLocaisColeta | ufLocaisColeta.pas | Locais de coleta |
| fConsultaLocaisColetas | ufConsultaLocaisColeta.pas | Consulta locais |
| fLocaisColetaComprovante | ufLocaisColetaComprovantes.pas | Comprovantes de coleta |
| fColetadorAdicional | ufColetadorAdicional.pas | Coletadores adicionais |

### Gestão de Extrações (análises de DNA)

| Form | Unit | Funcionalidade |
|------|------|---|
| fExtracao | ufExtracao.pas | Cadastro de extrações (ADN/amplificação/sequenciamento) |
| fExtracaoCasos | ufExtracaoCasos.pas | Casos × Extrações |
| fValidaExtracao | fUserValidaExtracao.pas | Validação de responsáveis em extrração |
| fMapa_ExtAmpli | ufMapa_ExtAmpli.pas | Mapa de extrações × amplificações |
| fMapa_ExtAmpliNew | ufMapa_ExtAmpliNew.pas | Versão nova do mapa |

### Subsistema SCEI (laboratório)

| Form | Unit | Funcionalidade |
|------|------|---|
| fExames | scei/ufExames.pas | Cadastro de exames |
| fProcedimentos | scei/ufProcedimentos.pas | Lançamento de procedimentos |
| fLancaProcedimentos | scei/ufLancaProcedimentos.pas | Lançamento em lote |
| fExamesResultados | scei/ufExamesResultados.pas | Resultados de procedimentos |
| fProcedimentosResultados | scei/ufExamesResultados.pas | [alias] |
| fLaboratorios | scei/ufLaboratorios.pas | Cadastro de laboratórios |
| fConsultaLaboratorios | ufConsultaLaboratorios.pas | Consulta laboratórios |
| fMedicos | scei/ufMedicos.pas | Cadastro de médicos |
| fPacientes | scei/ufPacientes.pas | Cadastro de pacientes (SCEI) |
| fConsultaPacientes | scei/ufConsultaPacientes.pas | Consulta pacientes |
| fConsultaGeralInf | scei/ufConsultaGeralInf.pas | Consulta geral do SCEI |
| fEmissaoLaudo | scei/ufEmissaoLaudos.pas | Emissão de laudos SCEI |
| fCarga | scei/ufCarga.pas | Carga de dados (importação) |
| fServicoAutoma | scei/ufServicoAutoma.pas | Serviço automatizado |

### Créditos e Finanças

| Form | Unit | Funcionalidade |
|------|------|---|
| fParcelamento | ufParcelamento.pas | Parcelamento de créditos |
| fCreditosGeracao | ufCreditosJuiz.pas | Geração de créditos por juiz |
| fGeraValorColetadores | ufGeraValorColetadores.pas | Cálculo de valores de coletadores |
| fVinculaCreditos | ufVinculaCreditos.pas | Vinculação de créditos |
| fCreditoHabilitacao | ufConsultaDadosparaCredito.pas | Consultoria para crédito |
| fParcelamento_Infe | ufParcelamento_Infe.pas | Parcelamento (versão INFE) |

### Configuração/Administração

| Form | Unit | Funcionalidade |
|------|------|---|
| fAcesso | ufAcesso.pas | Login / autenticação |
| fAbertura | UnitFormAbertura.pas | Splash/loading |
| fPadrao | ufPadrao.pas | Base para todos os forms (CRUD genérico) |
| fRegras | ufRegras.pas | Cadastro de regras de processamento |
| fParametros | ufParametros.pas | Parâmetros da aplicação |
| fAlteraSenha | ufAlteraSenha.pas | Alteração de senha |
| fUsuarios | ufUsuarios.pas | Gestão de usuários |
| fTimer | ufTimer.pas | Timer da aplicação |
| fColaborador | ufColaborador.pas | Cadastro de colaboradores |
| fConsultaStatus | ufConsultaStatus.pas | Consulta status de casos |
| fAuditoria | ufConsultaAuditoria.pas | Auditoria de alterações |

### Consultas de Dados

| Form | Unit | Funcionalidade |
|------|------|---|
| fConsultaItemHistorico | ufConsultaItemHistorico.pas | Consulta histórico |
| fConsultaPericia | ufConsultaPericia.pas | Consulta perícia |
| fConsultaEnderecos | ufConsultaEnderecos.pas | Consulta endereços |
| fConsultaAlelosDuplicados | ufConsultaAlelosDuplicados.pas | Busca de alelos duplicados |
| fLotes | ufConsultaLotes.pas | Consulta de lotes |

### Utilitários

| Form | Unit | Funcionalidade |
|------|------|---|
| fCasoEndereco | ufCasoEndereco.pas | Endereço do caso |
| fCompraKits | ufCompraKits.pas | Compra de kits |
| fAjustaProtocolo | ufAjustaProcotolo.pas | Ajuste de protocolos |
| fRecebimentoLaboratorio | ufRecebimentoLaboratorio.pas | Recebimento no lab |
| fExcluiLotes | fExclusaoLotes.pas | Exclusão de lotes |

---

## 📊 Relatórios (17 units)

### Relatórios de Etiquetas

| Relatório | Unit | Tipo | Uso |
|-----------|------|------|-----|
| fRelEtiquetas | ufRelEtiquetas.pas | Report | Impressão de etiquetas padrão |
| fRelEtiquetasAdesiva | ufRelEtiquetasAdesiva.pas | Report | Etiquetas adesivas |
| fEmissaoEtiquetas | ufGeradorRelEtiquetas.pas | Gerador | Geração de relatório de etiquetas |

### Relatórios de Laudos

| Relatório | Unit | Tipo | Uso |
|-----------|------|------|-----|
| fRelLaudosEmitidos | ufRelLaudosEmitidos.pas | Report | Laudos já emitidos |
| fRelLaudosPendentes | ufRelLaudosPendentes.pas | Report | Laudos pendentes |
| fLaudosVencendoPeriodo | ufLaudosVencendoPeriodo.pas | Report | Laudos vencendo em período |

### Relatórios Financeiros

| Relatório | Unit | Tipo | Uso |
|-----------|------|------|-----|
| fRelFinanceiro | ufRelFinanceiro.pas | Report | Financeiro geral |
| fEmissaoRelFinanceiro | ufGeradorRelFinanceiro.pas | Gerador | Geração de relatório financeiro |
| fRelCreditosporJuiz | ufRelCreditosJuiz.pas | Report | Créditos por juiz |

### Relatórios de Consulta

| Relatório | Unit | Tipo | Uso |
|-----------|------|------|-----|
| fRelConsulta | ufRelConsulta.pas | Report | Consulta geral |
| fEmissaoRelEnviados | ufEmissaoRelQuantidades.pas | Report | Quantidade de casos enviados |
| fEmissaoRelLaudosEmitidos | ufEmissaoLaudosEmitidos.pas | Report | Laudos emitidos (por período?) |

### Relatórios de Kits e Coletadores

| Relatório | Unit | Tipo | Uso |
|-----------|------|------|-----|
| fRelMinimoKits | ufRelMinimoKits.pas | Report | Mínimo de kits em estoque |
| fColetadoresRelatorios | ufColetadoresRelatorios.pas | Report | Relatório de coletadores |

### Relatórios Especializados

| Relatório | Unit | Tipo | Uso |
|-----------|------|------|-----|
| fRelCapa | ufRelCapa.pas | Report | Capa de processo |
| fRelCapa2 | ufRelCapa2.pas | Report | Capa alternativa |
| fRelGuiaPostagem | ufRelGuiaPostagem.pas | Report | Guia de postagem |
| fEmissaoRelInfecciosas | ufGeradorRelInfecciosas.pas | Gerador | Relatório de doenças infecciosas |

---

## 🖨️ Impressoras / Impressões (7 units)

| Unit | Funcionalidade |
|------|---|
| ufImpressoes.pas | Controle geral de impressões (histórico, rastreamento) |
| ufImprimeLaudo.pas | Impressão de laudo DNA |
| ufImprimeLaudo2.pas | Versão alternativa de impressão |
| ufImprimeFolhaResultados.pas | Impressão de folha de resultados |
| ufImprimeComprovante.pas | Impressão de comprovante |
| scei/ufImprimeComprovante.pas | Comprovante SCEI |
| scei/ufImprimeLaudoImpressora.pas | Laudo para impressora SCEI |
| scei/ufImprimeMapa.pas | Impressão de mapa SCEI |
| ufImprimeComprovantePaternidade.pas | Comprovante de paternidade (cálculo genético) |

---

## 📦 Exportação / Importação

| Unit | Funcionalidade |
|------|---|
| ufExportaAlelosPlanilhas.pas | Exportação de alelos para Excel |
| ufExportaExcel.pas | Exportação geral para Excel |
| ufImportaDados.pas | Importação de dados (bulk) |
| ufImportaProcedimentos.pas | Importação de procedimentos (fácil) |
| ufImportaProcedimentosHist.pas | Importação histórica |
| ufColaboradorImporta.pas | Importação de ponto/colaboradores |
| ufColaboradorExporta.pas | Exportação de colaboradores |
| ufEnvioCasosExternos.pas | Envio de casos a laboratórios externos |

---

## 🔬 Geração de Documentos (Word/Excel)

| Unit | Funcionalidade |
|------|---|
| ufGeraWord.pas | Geração de documentos Word (via OleAutomation) |
| ufGeraDocLab.pas | Geração de documento de alelos |
| ufGeraDocLabTipos.pas | Geração de documento com tipos de alelos |

---

## 📝 Units de Negócio / Utilitários

| Unit | Propósito |
|------|----------|
| UFUNCOES.pas | Funções gerais da aplicação (helpers) |
| ufBits.pas | Manipulação de bits |
| ufPesquisa.pas | Busca/pesquisa de dados |

---

## 🗂️ Consultas / Lookups

| Unit | Funcionalidade |
|------|---|
| Múltiplas `ufConsulta*.pas` | Forms de busca/seleção rápida (dropdown, lookup) |
| DMI, DMRI | DataModules separados (possível isolamento SCEI) |

---

## 🔧 Integrações Externas / Tecnologias

| Tecnologia | Uso | Referência |
|-----------|-----|-----------|
| **COM/OleVariant** | Word, Excel, geração de relatórios | ufGeraWord.pas, ufGeraDocLab.pas |
| **ShellExecute / CreateProcess** | Upgrade automático, chamada de programas | SCPG.dpr (Upgrade.exe) |
| **QR Code** | Geração de código QR | qrcode/src/QRCODE.pas |
| **INI / Registry** | Configuração e leitura de preferências | SCPG.dpr (SCPG.ini, Registry) |
| **ADO / Firebird** | Acesso ao banco de dados | ADODB via TADOConnection/Query |
| **Reports** | Relatórios (provavelmente QuickReport ou similar) | ufRel*.pas |
| **DBGrid / DBEdit** | UI data-bound | ufPadrao.pas (base) |
| **Timer** | Rotinas agendadas | ufTimer.pas |

---

## 📂 Templates e Modelos

```
Modelos/
├── Autorizacoes_Coleta/        (33 templates de autorização)
├── Folhas_Resultado/             (17 templates de resultado)
├── Laudos/                        (274 templates de laudos — grande!)
├── COMPRA_KITS.doc
├── CORRESPONDENCIA.doc
├── Declaracao.doc
├── ENTREGA.doc
└── [outras]

LAUDOS/                            (repositório de laudos finalizados)
```

---

## 🚨 Observações Críticas

### 1. Segurança
- **tb_hosts** armazena senha em texto plano (`hos_senha VARCHAR(10)`).
- Login em ufAcesso.pas — implementar hash (password_hash) na migração.

### 2. Regras de Negócio Complexas
- **Parcelamento**: lógica de créditos e parcelas (ufParcelamento.pas).
- **Extração de ADN**: 3 fases (extração, amplificação, sequenciamento) com validadores (fUserValidaExtracao.pas).
- **Mapa de extração**: relação N:N entre casos e extrações (ufMapa_ExtAmpli.pas).
- **Cálculo de valor para coletadores**: faixas por kit type (vi_valor_coletador view).
- **Status de casos**: workflow complexo com histórico (qHistorico).

### 3. DataModules Separados
- **DMI/DMRI** em `scei/` sugerem subsistema isolado (laboratório + gestão de exames).
- Investigar se SCEI é módulo opcional ou integrado.

### 4. Muitos Relatórios
- Relatórios parecem ser o coração da UI (não há muita navegação, parece ser batch-driven).
- Tecnologia não identificada ainda (QuickReport? FastReport? Crystal? built-in Reports).

### 5. Sem Chave Primária em Várias Tabelas
- Ver docs/banco/CONVERSAO-FIREBIRD-MYSQL.md: 18 tabelas sem PK.
- API REST exigirá PK em todas as tabelas.

### 6. Padrão de Desenvolvimento
- Cada form herda de `TfPadrao` (base CRUD).
- DataModules contêm queries, DataSources, Fields.
- Lógica concentrada em events (DBEdit.OnEnter, DBCheckBox.OnClick).
- Pouca separação de concerns.

---

## ❓ Dúvidas Pendentes

1. **Tecnologia de Relatórios**: Qual biblioteca? QuickReport, FastReport, Crystal, built-in Delphi Reports?
2. **SCEI**: Módulo opcional ou core? Pode ser migrado de forma independente?
3. **Workflow de casos**: Qual o fluxo completo de um caso do início até laudo final?
4. **Procedimentos**: `bu_alelos` está sendo usado? Como?
5. **Integrações**: Existem APIs externas ou integrações (email, webservice, fax)?
6. **Relatórios em Batch**: Há processamento em lote, fila de impressão ou é tudo manual?
7. **Autenticação**: Apenas login local (ufAcesso.pas) ou LDAP/AD?
8. **Performance**: Há índices no Firebird? Queries preparadas ou SQL ad-hoc?
9. **Versionamento**: Como controlar versões de código PHP? Versioning de API?
10. **Migração de Dados**: Dados reais já estão no MySQL? Como validar paridade?

---

## 📊 Estatísticas

| Métrica | Valor |
|---------|-------|
| Total de units | 116 |
| Forms (TForm) | 30+ |
| DataModules | 5 |
| Relatórios | 17 |
| Units SCEI | 20 |
| Arquivos no repositório | ~1.185 |
| Tabelas no banco | 59 |
| Views | 8 |
| Procedures/Functions | 3 |

---

## 🔗 Próximos Passos

1. **DECISÕES-ARQUITETURA.md**: Definir stack PHP (framework, autenticação, ORM).
2. **MAPA-DELPHI-PHP.md**: Mapear cada form/unit para endpoint API + funcionalidade PHP.
3. **REGRAS-NEGOCIO/*.md**: Documentar regras de parcelamento, extrações, créditos, etc.
4. **BANCO/AUDIT.md**: Revisar queries Firebird + triggers + procedures → SQL MySQL.
5. Começar migração por **módulos verticais** (ex.: Pessoas → Kits → Extrações).

