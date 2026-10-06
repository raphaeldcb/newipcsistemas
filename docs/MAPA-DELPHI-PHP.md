# Mapa de Correspondência: Delphi → API REST + PHP

> Como cada componente Delphi se transformará em endpoints/serviços PHP.
> Será refinado após discussão sobre arquitetura.

---

## 🎯 Padrão de Conversão

```
Form Delphi (UI+CRUD)           →  API REST (endpoints HTTP) + Frontend (React/Vue/etc)
├── TDataModule (queries + DS)   →  Repository/DAO + Service (PHP)
├── Query (SELECT/INSERT/UPDATE) →  Repository methods + ORM/PDO
└── Events (business logic)      →  Service class (métodos públicos)

TfPadrao (form base CRUD)        →  CrudController + CrudService (base para todos)
```

---

## 📋 Mapeamento de Módulos Verticais

### Fatia 1: Gestão de Pessoas

| Componente Delphi | Tipo | → Equivalente PHP | Endpoints (REST) |
|---|---|---|---|
| **fPessoas** (25KB) | Form CRUD | PessoasController | `POST/GET/PUT/DELETE /pessoas` |
| **qPessoas** | Query | PessoasRepository | `getById()`, `getAll()`, `create()`, `update()`, `delete()` |
| **qMaxPessoa** | Query | PessoasService | `nextCodigo()` |
| **fConsultaJuizes** | Form Lookup | JuizesController | `GET /juizes?search=` |
| **fJuiz** | Form CRUD | JuizesController | `POST/GET/PUT/DELETE /juizes` |
| **fVara** | Form CRUD | VarasController | `POST/GET/PUT/DELETE /varas` |
| **fComarca** | Form CRUD | ComarcasController | `POST/GET/PUT/DELETE /comarcas` |
| **fEstado** | Form CRUD | EstadosController | `GET /estados` |

**Banco**: `tb_pessoas`, `tb_juiz`, `tb_vara`, `tb_comarca`, `tb_estado`
**Dúvida**: Separar em 5 endpoints ou agrupar em People microservice?

---

### Fatia 2: Gestão de Processos/Casos

| Componente Delphi | Tipo | → Equivalente PHP | Endpoints (REST) |
|---|---|---|---|
| **fProcessos** | Form CRUD | CasosController | `POST/GET/PUT/DELETE /casos` |
| **qCasos** | Query | CasosRepository | `getById()`, `search()`, `create()`, `update()` |
| **qHistorico** | Query | HistoricoRepository | `getCasoHistorico(casoId)`, `addHistorico()` |
| **fHistorico** | Form (historiquement) | HistoricoController | `GET /casos/{id}/historico` |
| **qDadosProcesso** | Query | DadosProcessoRepository | `getProcessData()`, `updateProcessData()` |
| **fConsultaCPG** | Form Search | CasosController | `GET /casos?filter=` |
| **qStatus** | Query (status de casos) | StatusService | `getCasoStatus(casoId)` |

**Banco**: `tb_processo` (renamed from tb_caso?), `tb_historico`, `tb_item`, `tb_dadosprocesso`, `tb_status_procedimento`
**Dúvida**: Renomear "Caso" para "Processo"? Workflow de status automático?

---

### Fatia 3: Gestão de Kits (Coletas)

| Componente Delphi | Tipo | → Equivalente PHP | Endpoints (REST) |
|---|---|---|---|
| **fKits** | Form CRUD | KitsController | `POST/GET/PUT/DELETE /kits` |
| **qKits** | Query | KitsRepository | `getById()`, `getByCase()`, `create()`, `updateStatus()` |
| **fConsultaKits** | Form Lookup | KitsController | `GET /kits?casoId=` |
| **fEmissaoKits** | Form (emissor) | KitsService | `issueKit(casoId)`, `generateLabel()` |
| **fRastrearKits** | Form (tracker) | KitsService | `GET /kits/{id}/rastreamento` |
| **fColetadoresKits** | Form CRUD | ColetadorKitController | `POST/GET /coletadores/{id}/kits` |
| **qColetador** | Query | ColetadorRepository | `getByKit()`, `getList()` |
| **fLocaisColeta** | Form CRUD | LocaisColetaController | `POST/GET/PUT/DELETE /locais-coleta` |
| **fLocaisColetaComprovante** | Form (comprovante) | LocaisColetaService | `GET /locais-coleta/{id}/comprovante` |
| **ufColetadorAdicional** | Utilitário | ColetadorAdicionalService | `addColetadorAdicional()` |

**Banco**: `tb_kits`, `tb_coleta_adicional`, `tb_local_coleta`, `tb_coletadores_relatorios`, `tb_coletadores_kits`
**Dúvida**: Fluxo de emissão (gera etiqueta + código)? QR code em Kit? Integração com impressora?

---

### Fatia 4: Extração de ADN (3 fases)

| Componente Delphi | Tipo | → Equivalente PHP | Endpoints (REST) |
|---|---|---|---|
| **fExtracao** | Form CRUD (fase 1) | ExtracaoController | `POST/GET/PUT /extracos` |
| **qExtracao** | Query | ExtracaoRepository | `getById()`, `create()`, `updatePhase()` |
| **fExtracaoCasos** | Form (N:N) | ExtracaoCasoController | `POST /extracos/{id}/casos` |
| **fValidaExtracao** (fUserValidaExtracao) | Validator | ExtracaoValidatorService | `validateResponsavel()`, `validateSupervisor()` |
| **fMapa_ExtAmpli** | Form (mapa EXT→AMPL) | MapaExtAmpliController | `GET/POST /extracos/{id}/amplificacoes` |
| **fMapa_ExtAmpliNew** | Form (versão nova) | MapaExtAmpliController | [mesma coisa] |

**Banco**: `tb_extracao`, `tb_extracao_casos`, `tb_mapa_extampli`
**Lógica**: 3 fases sequenciais (Extração → Amplificação → Sequenciamento)?
**Dúvida**: Como o usuário avança de fase? Validadores automáticos?

---

### Fatia 5: Subsistema SCEI (Laboratório de Infectologia)

| Componente Delphi | Tipo | → Equivalente PHP | Endpoints (REST) |
|---|---|---|---|
| **DMI/DMRI** | DataModules | ScseiService (separado?) | Config/Dependency Injection |
| **fExames** | Form CRUD | ExamesController (SCEI) | `POST/GET/PUT /scei/exames` |
| **fProcedimentos** | Form (lançamento) | ProcedimentosController | `POST/GET /scei/procedimentos` |
| **fLancaProcedimentos** | Form (batch) | ProcedimentoService | `POST /scei/procedimentos/batch` |
| **fExamesResultados** | Form (resultados) | ExamesResultadosController | `GET/POST /scei/exames/{id}/resultados` |
| **fLaboratorios** (SCEI) | Form CRUD | LaboratoriosController | `POST/GET/PUT /scei/laboratorios` |
| **fMedicos** | Form CRUD | MedicosController | `POST/GET/PUT /scei/medicos` |
| **fPacientes** | Form CRUD | PacientesController | `POST/GET/PUT /scei/pacientes` |
| **fEmissaoLaudo** (SCEI) | Form (emitter) | LaudoService | `POST /scei/laudos/emitir` |
| **fCarga** | Form (import) | CargaService | `POST /scei/carga` |
| **fServicoAutoma** | Service (automation) | AutomationService | `POST /scei/automacao/executar` |

**Banco**: `tb_exames`, `tb_laboratorios` (SCEI), `tb_medicos`, `tb_pacientes`, `tb_procedimentos`, `tb_procedimentos_resultado`, `tb_procedimentos_carga`
**Dúvida**: SCEI é módulo separado? Herda DM ou usa DMI/DMRI isoladamente?

---

### Fatia 6: Créditos e Finanças

| Componente Delphi | Tipo | → Equivalente PHP | Endpoints (REST) |
|---|---|---|---|
| **fParcelamento** | Form CRUD | ParcelamentoController | `POST/GET/PUT /creditos/parcelamento` |
| **qParcelamento** | Query | ParcelamentoRepository | `getByCase()`, `create()`, `updateStatus()` |
| **fCreditosGeracao** | Form (gerador) | CreditoService | `POST /creditos/gerar-por-juiz` |
| **fGeraValorColetadores** | Form (calulator) | ColetadorValorService | `POST /coletadores/calcular-valor` |
| **fVinculaCreditos** | Form (linker) | CreditoVinculoController | `POST /creditos/{id}/vincular` |
| **fCreditoHabilitacao** | Form (consultor) | CreditoConsultorController | `GET /creditos/{id}/habilitacao` |
| **fParcelamento_Infe** | Form (alt version) | ParcelamentoService | [integrar com fParcelamento] |
| **qCreditos** | Query (se existir) | CreditoRepository | `getByJuiz()`, `getByColetador()`, etc. |

**Banco**: `tb_parcelas`, `tb_creditos`, `tb_creditos_temporario`, `tb_temp_credito`, `tb_temp_mec`
**Lógica**: Cálculos complexos por tipo de kit, juiz, coletador.
**Dúvida**: Workflow de aprovação de créditos? Integração com sistema financeiro externo?

---

### Fatia 7: Alelos (Marcadores Genéticos)

| Componente Delphi | Tipo | → Equivalente PHP | Endpoints (REST) |
|---|---|---|---|
| **ufGeraDocLab** | Form (documento gerador) | AleloService | `POST /alelos/gerar-documento` |
| **ufGeraDocLabTipos** | Form (tipos gerador) | AleloTiposService | `POST /alelos-tipos/gerar-documento` |
| **fConsultaAlelosDuplicados** | Form (busca) | AleloController | `GET /alelos/duplicados` |
| **ufExportaAlelosPlanilhas** | Exportador | AleloService | `POST /alelos/exportar` |
| **qAlelos** | Query (se existir) | AleloRepository | `getByExtracao()`, `getByMarcador()` |
| **qContaAlelo** | Query | AleloCountService | `countByMarcador()` |

**Banco**: `tb_alelos`, `tb_alelos_tipos`, `tb_alelos_frequencia`, `tb_alelos_resultados`, `tb_alelos_tmp`, `tb_contaalelo`
**Dúvida**: Alelo é parte de Extração ou módulo separado?

---

### Fatia 8: Relatórios & Impressões

| Componente Delphi | Tipo | → Equivalente PHP | Endpoints (REST) |
|---|---|---|---|
| **ufRelEtiquetas** | Report | EtiquetaService | `POST /relatorios/etiquetas/gerar` |
| **ufRelFinanceiro** | Report | RelatorioFinanceiroService | `POST /relatorios/financeiro` |
| **ufRelLaudosEmitidos** | Report | RelatorioLaudoService | `POST /relatorios/laudos-emitidos` |
| **ufRelConsulta** | Report (geral) | RelatorioService | `POST /relatorios/consulta` |
| **ufImprimeLaudo** | Print | LaudioService | `POST /laudos/{id}/imprimir` |
| **ufImprimeComprovante** | Print | ComprovanteService | `POST /comprovantes/{id}/imprimir` |
| **Geradores** (ufGeradorRel*) | Report builders | ReportService | `POST /relatorios/{tipo}/gerar` |

**Tecnologia**: TBD (PDF via TCPDF/mPDF/wkhtmltopdf? WebPrint?)
**Dúvida**: Como gerar PDFs/Word? Mandar para impressora?

---

### Fatia 9: Configuração & Administração

| Componente Delphi | Tipo | → Equivalente PHP | Endpoints (REST) |
|---|---|---|---|
| **fAcesso** | Login | AuthController | `POST /auth/login`, `POST /auth/logout` |
| **fUsuarios** | Form CRUD | UsuariosController | `POST/GET/PUT /usuarios` |
| **fParametros** | Form Config | ParametrosController | `GET/PUT /parametros` |
| **fAlteraSenha** | Form (changer) | AuthService | `POST /auth/alterar-senha` |
| **ufRegras** | Form CRUD (regras de processamento) | RegrasController | `POST/GET/PUT /regras` |
| **fTimer** | Service (scheduler) | SchedulerService | [integración com cron/queue] |
| **fConsultaAuditoria** | Form (audit log) | AuditoriaController | `GET /auditoria?filtro=` |

**Banco**: `tb_usuarios` (se existir), `tb_parametros`, `tb_hosts`, `tb_auditoria`, `tb_regras`
**Autenticação**: Onde estão os dados de login? Em tb_usuarios? Em tb_hosts?
**Dúvida**: JWT + Sessão? LDAP/AD?

---

## 🗄️ Mapeamento de Tabelas Delphi → Modelos PHP

```
Delphi (tabelas do banco)      →  PHP (Model/Entity)

tb_pessoas                      →  Pessoa (PessoaModel, PessoaRepository)
tb_juiz                         →  Juiz
tb_vara                         →  Vara
tb_comarca                      →  Comarca
tb_estado (tb_uf)               →  Estado
tb_processo                     →  Processo / Caso (renomear?)
tb_historico                    →  Historico
tb_item                         →  Item
tb_dadosprocesso                →  DadosProcesso
tb_kits                         →  Kit
tb_local_coleta                 →  LocalColeta
tb_extracao                     →  Extracao
tb_extracao_casos               →  ExtracaoCaso (pivot)
tb_mapa_extampli                →  MapaExtAmpli
tb_alelos                       →  Alelo
tb_alelos_tipos                 →  AleloTipo
tb_parcelas                     →  Parcela
tb_creditos                     →  Credito
tb_exames                       →  Exame (SCEI)
tb_laboratorios                 →  Laboratorio (SCEI)
tb_medicos                      →  Medico (SCEI)
tb_pacientes                    →  Paciente (SCEI)
tb_procedimentos                →  Procedimento (SCEI)
tb_procedimentos_resultado      →  ProcedimentoResultado (SCEI)
tb_usuarios                     →  Usuario
tb_parametros                   →  Parametro
tb_hosts                        →  Host (acesso remoto?)
tb_auditoria                    →  AuditoriaLog
tb_regras                       →  Regra
tb_impressoes                   →  Impressao
tb_correspondencia              →  Correspondencia
tb_coleta_adicional             →  ColetaAdicional
tb_endereco                     →  Endereco
tb_coletadores_relatorios       →  ColetadorRelatorio (view)
tb_coletadores_kits             →  ColetadorKit (view)
tb_contaalelo                   →  ContaAlelo
```

---

## 🏗️ Estrutura de Diretórios PHP (Proposta)

```
api/
├── src/
│   ├── Controllers/
│   │   ├── CasosController.php
│   │   ├── KitsController.php
│   │   ├── ExtracaoController.php
│   │   ├── PessoasController.php
│   │   ├── ParcelsController.php
│   │   ├── SCEI/
│   │   │   ├── ExamesController.php
│   │   │   └── ...
│   │   └── AdminController.php
│   │
│   ├── Services/
│   │   ├── CasoService.php
│   │   ├── KitService.php
│   │   ├── ExtracaoService.php
│   │   └── ...
│   │
│   ├── Repositories/
│   │   ├── CasoRepository.php
│   │   ├── KitRepository.php
│   │   └── ...
│   │
│   ├── Models/
│   │   ├── Caso.php
│   │   ├── Kit.php
│   │   └── ...
│   │
│   ├── Middleware/
│   │   ├── AuthMiddleware.php
│   │   ├── ValidationMiddleware.php
│   │   └── ...
│   │
│   ├── Validators/
│   │   ├── CasoValidator.php
│   │   └── ...
│   │
│   └── Core/
│       ├── Router.php
│       ├── Database.php
│       ├── Container.php
│       └── ...
│
├── config/
│   ├── database.php
│   ├── app.php
│   └── ...
│
├── routes/
│   ├── api.php
│   ├── admin.php
│   └── ...
│
├── public/
│   └── index.php
│
└── tests/
    ├── Feature/
    ├── Unit/
    └── ...
```

---

## 🔄 Fluxo de Requisição (Example)

```
Cliente (React/Vue)
    ↓ POST /api/casos
    ↓
Router → casosController@store()
    ↓
CasoService::criar($data)
    ├→ CasoValidator::validate($data)
    ├→ CasoRepository::insert($data)
    └→ HistoricoService::logCriacao(...)
    ↓
DB → mysql (tb_processo + tb_historico + tb_item)
    ↓
Response: {id, status, ...}
```

---

## ⚠️ Decisões Pendentes

1. **Framework PHP**: Laravel, Slim, Symphony, custom lightweight?
2. **ORM**: Eloquent, Doctrine, Propel, PDO raw?
3. **Autenticação**: JWT, Session, OAuth2, LDAP?
4. **Relatórios**: PDF via TCPDF/mPDF? HTML→PDF? Word?
5. **Filas/Jobs**: Para operações pesadas (imports, relatórios)?
6. **Logs/Audit**: Onde gravar? Banco (tb_auditoria) ou arquivo?
7. **Versionamento de API**: v1, v2, content-negotiation?
8. **CORS**: Quem consome? Frontend local ou remoto?
9. **Rate Limiting**: Necessário?
10. **Documentação API**: Swagger/OpenAPI?

---

## 📚 Ordem de Implementação (Proposta)

### Fase 1: Fundação
1. Setup PHP + DB connection
2. CrudController base + CrudService base
3. Autenticação (login/logout)

### Fase 2: Core SCPG (Perícias)
1. Casos (Processo) + Histórico
2. Pessoas (Juiz, Vara, Comarca, Estado)
3. Kits + Coletas
4. Extrações (ADN)

### Fase 3: Suporte
1. Créditos + Parcelamento
2. Relatórios (PDF)
3. Impressões (etiquetas)
4. Alelos/Marcadores

### Fase 4: SCEI (Laboratório)
1. Exames + Procedimentos
2. Laboratórios, Médicos, Pacientes
3. Laudos SCEI

### Fase 5: Otimização
1. Caching
2. Performance queries
3. Testes (unit + integration)
4. Deployment

---

## 📞 Próximo Passo

Validar com o time de negócio:
- ✅ Mapeamento de Forms → Endpoints está correto?
- ✅ Prioridade de fatias (qual fazer primeiro)?
- ✅ Decisões arquiteturais: Framework, autenticação, relatórios?
- ✅ Dúvidas listadas acima?

