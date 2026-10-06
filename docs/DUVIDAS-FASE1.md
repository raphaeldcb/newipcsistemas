# Dúvidas Críticas — Fase 1 (Inventário)

> Questões que precisam da sua resposta para prosseguir com a Fase 2 (Arquitetura).
> Prioridade: Alta → Média → Baixa

---

## 🔴 Prioridade Alta

### 1. Tecnologia de Relatórios
**Questão**: Qual biblioteca Delphi é usada para gerar os 17+ relatórios?
- QuickReport?
- FastReport?
- Crystal Reports?
- Delphi Reports nativo?
- Outra?

**Impacto**: Determina como reescrever relatórios em PHP (TCPDF, mPDF, wkhtmltopdf, etc).

---

### 2. Workflow de Casos (Processo)
**Questão**: Qual é o fluxo completo de um "caso" do início até laudo?
- Criação → Coleta → Extração → Análise → Laudo → Fechamento?
- Quais são os status intermediários?
- Há aprovações/validações obrigatórias em cada fase?
- Quem pode fazer cada ação (roles/permissions)?

**Impacto**: Define workflow/pipeline na API, roles e middleware de autorização.

---

### 3. SCEI: Módulo Opcional ou Core?
**Questão**: O subsistema SCEI (laboratório de infectologia) é:
- Integrado ao core SCPG (perícias genéticas)?
- Módulo totalmente separado?
- Pode ser migrado de forma independente?
- Qual a "bridge" entre SCPG (perícias) e SCEI (infectologia)?

**Impacto**: Define microserviços vs monolito, priorização de implementação, isolamento de DataModules.

---

### 4. Segurança: Armazenamento de Senha
**Questão**: A tabela `tb_hosts` armazena `hos_senha` em texto plano.
- Essas senhas são para quê? Acesso remoto a máquinas? APIs externas?
- Devem ser migradas? Se sim, como (com segurança)?
- Necessário criar certificado/chave privada para decriptá-las?
- Simplesmente descartar na migração?

**Impacto**: Segurança da API, compliance, integração com sistemas legados.

---

### 5. Autenticação: Local ou LDAP/AD?
**Questão**: Como usuários fazem login?
- Apenas login local (usuário + senha em `tb_usuarios` ou `tb_hosts`)?
- Integração com Active Directory / LDAP?
- Há `dn` (Distinguished Name) armazenado?

**Impacto**: Implementação de AuthController, autenticação JWT vs Session, integração LDAP.

---

## 🟡 Prioridade Média

### 6. Parcelamento e Créditos
**Questão**: Qual é a lógica completa de geração de créditos?
- Como créditos são calculados por juiz/kit/coletador?
- Quanto tempo leva para um crédito ser aprovado?
- Há fluxo de aprovação automático ou manual?
- Integração com sistema financeiro externo?

**Impacto**: Regras de negócio em ParcelamentoService/CreditoService.

---

### 7. Extração de ADN: 3 Fases
**Questão**: As 3 fases (Extração → Amplificação → Sequenciamento) são:
- Sequenciais obrigatoriamente?
- Podem ser executadas em paralelo?
- Há validadores que precisam avançar de fase?
- Como validadores são designados (automático ou manual)?

**Impacto**: Workflow state machine em ExtracaoService, validações.

---

### 8. Tabelas sem Chave Primária
**Questão**: Das 18 tabelas listadas em CONVERSAO-FIREBIRD-MYSQL.md sem PK, qual ação tomar?
- Criar PK com AUTO_INCREMENT?
- Usar chave natural existente?
- Deixar como está (serviço não gerenciado)?

**Exemplo**: `tb_alelos_frequencia`, `tb_contaalelo`, `tb_sequencial`.

**Impacto**: Modelagem de dados, ORMs.

---

### 9. Relatórios: Geração em Batch ou On-demand?
**Questão**: Relatórios são:
- Gerados manualmente pelo usuário (on-demand)?
- Agendados em lote (batch/cron)?
- Enviados automaticamente por email?
- Salvos em arquivo para download posterior?

**Impacto**: Arquitetura de jobs/queues, endpoints REST.

---

### 10. Integração com Sistemas Externos
**Questão**: O SCPG integra com algum sistema externo?
- Email (SMTP)?
- SMS?
- Webservice de terceiros?
- APIs de laboratórios?
- Sistema de impressão em rede?

**Impacto**: Configuração de integrações, validação de dados.

---

## 🟢 Prioridade Média-Baixa

### 11. Dados Pessoais Sensíveis
**Questão**: Quais campos são dados pessoais sensíveis (LGPD)?
- CPF, RG, data de nascimento (pessoas)?
- Resultados de exames (genéticos)?
- Dados de doadores de material genético?
- Há política de retenção (quanto tempo manter)?

**Impacto**: Logging, auditoria, rotinas de limpeza de dados.

---

### 12. Procedure `bu_alelos`
**Questão**: A procedure `bu_alelos(v1, v2, marcador, OUT mensagem)` é:
- Ainda utilizada no código Delphi?
- Se sim, por qual form/service?
- Qual é a lógica (adiciona alelo em `tb_contaalelo`)?

**Impacto**: Migração para PHP, necessidade de replicar lógica.

---

### 13. Geração de Código / Auto-increment
**Questão**: Há regras especiais para geração de códigos/IDs?
- Exemplos: `CAS_CODIGO` (em qCasos)?
- Formato esperado (AAA-123-456)?
- Constraints (único por vara/comarca)?

**Impacto**: Serviço de geração de código único, validações.

---

### 14. Modelos Word/Laudos
**Questão**: Os modelos em `Modelos/Laudos/` (274 pastas) são:
- Templates estáticos com merge de dados?
- Gerados dinamicamente por código?
- Um modelo por tipo de análise genética?

**Impacto**: Serviço de geração de Word/PDF, mail-merge.

---

### 15. Impressora de Rede
**Questão**: Sistema tem integração com impressora de rede?
- Como? Windows Print Spooler, WSD, SNMP?
- Necessário manter na API?

**Impacto**: Frontend maneja impressão ou API envia para fila?

---

## 🟢 Prioridade Baixa

### 16. Performance / Índices
**Questão**: Há índices conhecidos no Firebird que precisam ser replicados?
- Quais tabelas são lentas?
- Há indices não óbvios (ex.: índices parciais)?

**Impacto**: Otimização de migrations, índices MySQL.

---

### 17. Versionamento de API
**Questão**: Como versionar a API?
- `/api/v1/`, `/api/v2/`?
- Content-Type negotiation?
- Sem versioning (sempre latest)?

**Impacto**: Estratégia de backward-compatibility.

---

### 18. Upload/Armazenamento de Arquivos
**Questão**: Sistema aceita upload de arquivos?
- Fotos de amostras?
- Resultados de exames (PDFs)?
- Aonde armazenar? S3, local disk, outro?

**Impacto**: Configuração de upload, middleware de validação.

---

### 19. Auditoria Completa
**Questão**: Quais ações devem ser auditadas?
- Criação de casos?
- Alteração de créditos?
- Impressão de laudos?
- Acesso/login?

**Impacto**: AuditoriaService, middleware de logging.

---

### 20. Testes
**Questão**: Há requisitos de teste?
- Unit tests obrigatórios?
- Coverage mínima (80%)?
- Testes de integração com Firebird de test?

**Impacto**: Setup de testes, CI/CD.

---

## 📋 Resumo: Próximas Ações

1. **Responda as 5 dúvidas de alta prioridade** (seção 🔴)
   - Vai destravar Arquitetura (Fase 2)
   
2. **Opcionalmente, responda médias** (seção 🟡)
   - Ajuda a refinar Regras de Negócio

3. **Forneca exemplos concretos** (se possível)
   - Um caso do início ao fim
   - Um crédito gerado (valores, datas, status)
   - Um laudo finalizado (estrutura, campos)

4. **Confirmação de Mapa Delphi → PHP** (docs/MAPA-DELPHI-PHP.md)
   - Forms → Endpoints estão mapeados corretamente?
   - Fatias de implementação (1-9) — qual priorizar?

---

## 📞 Formato de Resposta Sugerido

Pode responder em:
- **Linha** (inline): `Questão X: ...`
- **Arquivo separado** (RESPOSTAS-FASE1.md)
- **Reunião** (com notas depois)

Após as respostas, atualizo:
- ✅ INVENTARIO.md (com detalhes confirmados)
- ✅ MAPA-DELPHI-PHP.md (com endpoints finais)
- ✅ ARQUITETURA.md (nova)
- ✅ REGRAS-NEGOCIO-*.md (por módulo)

