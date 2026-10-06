# Regras de Negócio — Módulo SCEI (Laboratório Integrado)

> Fluxo de exames clínicos, procedimentos laboratoriais e emissão de laudos.
> Baseado em Delphi legado (ufExames.pas, ufProcedimentos.pas, ufEmissaoLaudos.pas, DMI/DMRI).
> Última atualização: 2026-10-06

---

## 📋 Conceito: SCEI vs SCPG

### SCPG (Perícias Genéticas)
- **Domínio**: Análise genética forense para casos judiciais
- **Sujeito**: Caso (processo judicial)
- **Análise**: Extração DNA → Alelos → Comparação genética → Laudo
- **Usuários**: Técnicos lab, Supervisores, Médicos, Gestores de casos
- **Saída**: Parecer de compatibilidade genética (paternidade, criminal, herança)

### SCEI (Laboratório de Infectologia)
- **Domínio**: Exames clínicos de doenças infecciosas (HIV, Hepatite, TB, etc)
- **Sujeito**: Paciente (pessoa com histórico clínico)
- **Análise**: Exame solicitado → Coleta amostra → Procedimento → Resultado → Laudo
- **Usuários**: Médicos solicitantes, Técnicos lab, Laboratoristas, Analistas
- **Saída**: Resultado de teste (positivo/negativo/inconclusivo) + interpretação médica

### Integração
```
SCPG (Perícias)                 SCEI (Infectologia)
├─ Casos judiciais              ├─ Pacientes clínicos
├─ Extrações de DNA             ├─ Exames de sangue/outros fluidos
├─ Alelos (marcadores STR)      ├─ Sorologia (detecção Ag/Ac)
├─ Laudos comparativos          ├─ Virologia/Bacteriologia
└─ Responsáveis: Juízes         └─ Responsáveis: Médicos solicitantes

Monolito Único (não separado):
├─ Mesmo banco: sgbd_scpg
├─ Mesmo servidor: API Laravel
├─ DataModules separados no Delphi: DM/DMR/DMD (SCPG) vs DMI/DMRI (SCEI)
├─ Endpoints separados: /api/v1/... (SCPG) vs /api/v1/scei/... (SCEI)
└─ Mas compartilham infraestrutura (auth, logging, etc)
```

---

## 🔄 Fluxo de SCEI (End-to-End)

### Workflow Simplificado

```
SOLICITAÇÃO (Médico solicita exame)
    ↓
AGENDAMENTO COLETA
    ↓
COLETA AMOSTRA (sangue, saliva, urina, etc)
    ↓
RECEBIMENTO AMOSTRA
    ↓
PROCEDIMENTO LABORATORIAL (teste, cultura, PCR, etc)
    ↓
RESULTADO (positivo, negativo, inconclusivo)
    ↓
INTERPRETAÇÃO MÉDICA
    ↓
LAUDO EMITIDO (relatório com conclusão)
    ↓
PACIENTE NOTIFICADO
```

### Estados Possíveis de Exame

```
PENDENTE                Solicitação recebida, aguardando coleta
    ↓
AGENDADO                Coleta foi agendada
    ↓
AMOSTRA_COLETADA        Amostra foi coletada
    ↓
AMOSTRA_RECEBIDA        Lab recebeu amostra
    ↓
EM_PROCESSAMENTO        Teste/análise em andamento
    ↓
RESULTADO_PRELIMINAR    Resultado saiu, aguardando confirmação
    ↓
RESULTADO_FINALIZADO    Resultado confirmado
    ↓
LAUDO_EMITIDO           Médico emitiu laudo + interpretação
    ↓
LAUDO_FINALIZADO        Laudo assinado, pronto para paciente
    ↓ (ou)
CANCELADO               Exame foi cancelado (motivo: amostra inadequada, etc)
```

---

## 📊 Banco de Dados SCEI

### Tabela: tb_pacientes (SCEI)

```sql
CREATE TABLE pacientes (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    
    -- Identificação
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(11),                              -- opcional (pode ser RG, passaporte)
    data_nascimento DATE,
    sexo ENUM('M', 'F', 'O'),
    
    -- Contato
    telefone VARCHAR(20),
    email VARCHAR(255),
    endereco TEXT,
    
    -- Clínico
    medicao_solicitante_id BIGINT,               -- FK para medicos
    condicao_clinica TEXT,                        -- breve descrição
    comorbidades TEXT,
    medicamentos_em_uso TEXT,
    
    -- Metadados
    ativo BOOLEAN DEFAULT TRUE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY(medicao_solicitante_id) REFERENCES medicos(id),
    INDEX(cpf),
    INDEX(data_cadastro)
);
```

### Tabela: tb_exames (SCEI)

```sql
CREATE TABLE exames (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    
    -- Identificação
    paciente_id BIGINT NOT NULL,
    tipo_exame VARCHAR(100) NOT NULL,            -- HIV, Hepatite B, TB, etc
    
    -- Solicitação
    medico_solicitante_id BIGINT,
    data_solicitacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    motivo_clinico TEXT,
    
    -- Coleta
    data_coleta SCHEDULED DATE,
    local_coleta VARCHAR(255),
    tipo_amostra VARCHAR(50),                    -- Sangue, Saliva, Urina, etc
    volume_amostra INT,                          -- mL
    
    -- Processamento
    laboratorista_id BIGINT,
    data_recebimento_amostra DATE,
    data_inicio_procedimento TIMESTAMP,
    data_conclusao_procedimento TIMESTAMP,
    
    -- Resultado
    resultado VARCHAR(100),                      -- POSITIVO, NEGATIVO, INCONCLUSIVO
    valor_resultado DECIMAL(10,2),               -- ex: carga viral CD4 count
    unidade VARCHAR(50),                         -- copies/mL, células/mL, etc
    
    -- Status
    status ENUM('PENDENTE', 'AGENDADO', 'AMOSTRA_COLETADA', 'AMOSTRA_RECEBIDA',
                'EM_PROCESSAMENTO', 'RESULTADO_PRELIMINAR', 'RESULTADO_FINALIZADO',
                'LAUDO_EMITIDO', 'LAUDO_FINALIZADO', 'CANCELADO')
           DEFAULT 'PENDENTE',
    
    -- Laudo
    medico_analista_id BIGINT,                   -- FK para medicos (quem interpreta)
    data_laudo DATE,
    observacoes_analista TEXT,
    
    -- Qualidade
    adequacao_amostra BOOLEAN DEFAULT TRUE,      -- amostra adequada para análise?
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,
    
    FOREIGN KEY(paciente_id) REFERENCES pacientes(id),
    FOREIGN KEY(medico_solicitante_id) REFERENCES medicos(id),
    FOREIGN KEY(laboratorista_id) REFERENCES usuarios(id),
    FOREIGN KEY(medico_analista_id) REFERENCES medicos(id),
    INDEX(paciente_id),
    INDEX(tipo_exame),
    INDEX(status),
    INDEX(data_solicitacao)
);
```

### Tabela: tb_procedimentos (SCEI)

```sql
CREATE TABLE procedimentos (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    exame_id BIGINT NOT NULL,
    
    -- Identificação
    nome VARCHAR(255),                          -- PCR HIV, ELISA Hepatite, etc
    protocolo VARCHAR(100),                     -- versão/lote do kit/reagente
    
    -- Execução
    data_inicio TIMESTAMP,
    data_conclusao TIMESTAMP,
    tempo_execucao INT,                         -- minutos
    tecnico_id BIGINT,                          -- quem fez
    
    -- Parâmetros
    temperatura_incubacao DECIMAL(5,1),         -- graus C
    velocidade_centrifugacao INT,               -- RPM
    tempo_incubacao INT,                        -- minutos
    reagentes_utilizados TEXT,
    
    -- Resultado Bruto (antes interpretação)
    valor_bruto DECIMAL(10,2),
    unidade VARCHAR(50),
    
    -- Status
    status ENUM('EM_PROGRESSO', 'CONCLUIDO', 'FALHOU', 'REEXECUTANDO')
           DEFAULT 'EM_PROGRESSO',
    
    -- Validação
    validador_id BIGINT,                        -- supervisor que aprova
    data_validacao TIMESTAMP,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY(exame_id) REFERENCES exames(id),
    FOREIGN KEY(tecnico_id) REFERENCES usuarios(id),
    FOREIGN KEY(validador_id) REFERENCES usuarios(id),
    INDEX(exame_id),
    INDEX(status)
);
```

### Tabela: tb_laboratorios (SCEI)

```sql
CREATE TABLE laboratorios (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    
    nome VARCHAR(255) NOT NULL,
    cnpj VARCHAR(14),
    endereco TEXT,
    telefone VARCHAR(20),
    email VARCHAR(255),
    
    -- Capacidade
    tipos_exame_oferecidos TEXT,                -- JSON ou lista separada por vírgula
    horario_coleta_inicio TIME,
    horario_coleta_fim TIME,
    dias_funcionamento VARCHAR(50),             -- "seg-sex", "seg-sab", etc
    
    -- Referência
    diretor_responsavel VARCHAR(255),           -- nome do diretor técnico
    responsavel_tecnico_id BIGINT,              -- FK para usuarios
    
    ativo BOOLEAN DEFAULT TRUE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY(responsavel_tecnico_id) REFERENCES usuarios(id),
    INDEX(cnpj)
);
```

### Tabela: tb_medicos (SCEI / Geral)

```sql
CREATE TABLE medicos (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    
    nome VARCHAR(255) NOT NULL,
    crm VARCHAR(20),                           -- Conselho Regional de Medicina
    especialidade VARCHAR(100),                -- Infectologia, Clínica, etc
    telefone VARCHAR(20),
    email VARCHAR(255),
    
    laboratorio_id BIGINT,                     -- Lab onde trabalha (opcional)
    
    ativo BOOLEAN DEFAULT TRUE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY(laboratorio_id) REFERENCES laboratorios(id),
    UNIQUE KEY(crm),
    INDEX(especialidade)
);
```

---

## 📋 Tipos de Exames Comuns (SCEI)

```
Grupo: VIROLOGIA
├─ HIV (1º geração: Ag/Ac combinado)
├─ Hepatite B (HBsAg, anti-HBc, HBV DNA)
├─ Hepatite C (anti-HCV, HCV RNA)
├─ HTLV (anti-HTLV)
└─ Sífilis (reagina/Treponema)

Grupo: BACTERIOLOGIA
├─ TB (baciloscopia, cultura, GeneXpert)
├─ Uretrite (Neisseria gonorrhoeae)
└─ Meningite (cultura LCR)

Grupo: PARASITOLOGIA
├─ Malária (gota espessa, PCR)
├─ Dengue (IgM, PCR)
└─ Leishmania (PCR, cultura)

Grupo: CLÍNICA GERAL
├─ Hemograma (CBC)
├─ Bioquímica (glicose, TGO/TGP, creatinina)
└─ Coagulação (TP/INR, TTPA)
```

---

## ✅ Validações & Regras

### Antes de Agendar Coleta

```
✓ Paciente registrado em sistema
✓ Tipo exame válido (na lista de oferecidos)
✓ Médico solicitante existe e está ativo
✓ Indicação clínica preenchida
✗ Não pode agendar sem motivo clínico documentado
```

### Antes de Receber Amostra

```
✓ Coleta foi executada e confirmada
✓ Amostra identificada corretamente (code bar ou rótulo)
✓ Tipo amostra confere com tipo exame (ex: sangue para HIV)
✓ Volume adequado para procedimento
✓ Amostra preservada corretamente (temperatura, tempo)
✗ Amostra hemolisada/coagulada (sangue)? → REJEITAR
✗ Amostra contaminada? → REJEITAR
```

### Durante Procedimento

```
✓ Protocolo seguido conforme especificado
✓ Reagentes dentro da validade
✓ Equipamentos calibrados
✓ Controles positivos/negativos executados com sucesso
✗ Controle negativo falhou? → REEXECUTAR procedimento
✗ Controle positivo falhou? → Investigar reagentes/equipamento
```

### Antes de Emitir Resultado

```
✓ Procedimento validado por supervisor
✓ Resultado dentro de range esperado (ou é realmente anormal?)
✓ Valor repetível (replicata bateu?)
✓ Médico analista confirma resultado
✗ Resultado ambíguo? → Solicitar nova amostra
✗ Resultado inesperado? → Revisar procedimento
```

---

## 🔄 Transições de Status

### Normal (Path Feliz)

```
PENDENTE (solicitação recebida)
    ↓
AGENDADO (coleta marcada)
    ↓
AMOSTRA_COLETADA (colheu sangue/outro)
    ↓
AMOSTRA_RECEBIDA (lab recebeu)
    ↓
EM_PROCESSAMENTO (teste rodando)
    ↓
RESULTADO_PRELIMINAR (saiu resultado bruto)
    ↓
RESULTADO_FINALIZADO (supervisor validou)
    ↓
LAUDO_EMITIDO (médico emitiu parecer)
    ↓
LAUDO_FINALIZADO (pronto para paciente)
```

### Com Falha/Retrabalho

```
EM_PROCESSAMENTO
    ↓ (se controles falharam)
REEXECUTANDO PROCEDIMENTO
    ↓ (novo procedimento)
EM_PROCESSAMENTO
    ↓
RESULTADO_PRELIMINAR
    ... (continua normal)
```

### Rejeição de Amostra

```
AMOSTRA_RECEBIDA
    ↓ (se inadequada: hemolisada, tempo vencido, etc)
CANCELADO (motivo: amostra inadequada)
    ↓
Solicitar NOVA COLETA (volta para PENDENTE com nova data)
```

---

## 📧 Notificações SCEI

| Evento | Destinatário | Conteúdo |
|--------|-------------|----------|
| **Exame Agendado** | Paciente | "Seu exame foi agendado para 11/15 às 10:00 em Lab XYZ" |
| **Lembrete Coleta** | Paciente | "Seu exame é amanhã — compareça em jejum" |
| **Amostra Recebida** | Lab | "Amostra HIV recebida de João Silva — inicie procedimento" |
| **Resultado Pronto** | Médico Solicitante | "Resultado exame João Silva (HIV) — revisar laudo" |
| **Laudo Pronto** | Paciente + Médico | "Seu resultado está pronto — entre em contato com seu médico" |
| **Amostra Inadequada** | Médico + Paciente | "Amostra foi rejeitada — nova coleta necessária" |

---

## 💰 Relacionamento com Créditos (SCPG)

### Diferença Fundamental

```
SCPG (Perícias):
├─ Crédito = direito de recebimento do tribunal/juiz
├─ Gerado quando caso finalizado
└─ Pago pelo juiz (cobrança forense)

SCEI (Laboratório):
├─ Cobrança = fatura ao paciente/convênio/secretaria
├─ Não usa sistema de créditos do SCPG
├─ Pago pelo paciente/SUS/convênio
└─ Financeiro = faturação separada (não integrado nesta Phase)
```

### Isolamento

```
Caso SCPG:
├─ tb_casos, tb_extracos, tb_parcelas
├─ Workflow: Caso → Extração → Laudo → Créditos
└─ Usuários: Juízes, técnicos, médicos forenses

Paciente SCEI:
├─ tb_pacientes, tb_exames, tb_procedimentos
├─ Workflow: Paciente → Exame → Laudo
└─ Usuários: Médicos, técnicos, pacientes
```

**Nota**: No futuro, pode haver integração (ex: paciente SUS solicitado por juiz para perícia → seria ambos SCPG e SCEI), mas MVP trata como sistemas separados.

---

## 📈 Relatórios SCEI

### Relatório 1: Exames Processados (Período)

```
Filtros: data_solicitacao_de, data_ate, tipo_exame, laboratorio_id

Colunas:
├─ Paciente: nome, data_nascimento
├─ Exame: tipo, data_solicitacao, data_coleta
├─ Resultado: valor, unidade, interpretação
├─ Laudo: data_emissão, médico_analista
├─ Tempo total (dias)
└─ Status final

Agregações:
├─ Quantidade por tipo exame
├─ Taxa positivo/negativo (prevalência)
├─ Tempo médio processamento
└─ Total por laboratório
```

### Relatório 2: Exames Cancelados / Retrabalho

```
Filtros: motivo_cancelamento, periodo

Colunas:
├─ Paciente: nome, exame
├─ Data: coleta, cancelamento
├─ Motivo: "Amostra inadequada", "Amostra vencida", "Erro procedimento"
├─ Ação tomada: "Nova coleta agendada", "Procedimento repetido"
└─ Custo (re-execução)

Alertas:
├─ > 10% taxa cancelamento
├─ > 5 dias de atraso
└─ Laboratório com problemas recorrentes
```

### Relatório 3: Performance Laboratorial

```
Filtros: laboratorio_id, periodo

Colunas:
├─ Laboratório: nome, localização
├─ Quantidade exames processados
├─ Tempo médio (solicitação → laudo)
├─ Taxa cancelamento (%)
├─ Taxa retrabalho (%)
├─ Conformidade (%, adequação procedimentos)
└─ Score geral

Ranking: por score (melhor → pior)
```

### Relatório 4: Vigilância Epidemiológica

```
Filtros: tipo_exame, data_coleta_de, data_ate, municipio

Colunas:
├─ Tipo exame: HIV, Hepatite, TB, Dengue, etc
├─ Quantidade positivos
├─ Quantidade negativos
├─ Taxa positividade (%)
├─ Faixa etária: proporção por faixa
├─ Município: distribuição geográfica
└─ Tendência (subindo/descendo)

Observação: SCEI pode servir dados para vigilância pública (Secretaria Saúde)
```

---

## 🔍 Queries Comuns (Repository)

### ExameRepository

```php
// Buscar
public function findById(int $id): ?Exame
public function findByPaciente(Paciente $paciente): Collection
public function findByTipoExame(string $tipo): Collection

// Listar
public function findPendentes(): Collection
public function findEmProcessamento(): Collection
public function findProntos(): Collection
public function findCancelados(): Collection

// Busca avançada
public function search(array $filtros): Collection
  // Filtros: paciente_id, tipo_exame, status, data_coleta_de, data_ate

// Agregações
public function quantidadePositivos(string $tipo, Carbon $desde): int
public function taxaPositividade(string $tipo, Carbon $desde): float
public function tempoMedioProcessamento(string $tipo): float
public function taxaCancelamento(Laboratorio $lab): float

// Criar/atualizar
public function create(array $dados): Exame
public function update(Exame $exame, array $dados): Exame
public function marcarResultado(Exame $exame, array $resultado): void
public function emitirLaudo(Exame $exame, Usuario $medico, string $interpretacao): void
public function cancelar(Exame $exame, string $motivo): void
```

### ProcedimentoRepository

```php
// Buscar
public function findByExame(Exame $exame): Collection
public function findEmAndamento(): Collection

// Validação
public function validarResultado(Procedimento $proc, Usuario $validador): void
public function aprovarProcedimento(Procedimento $proc): void
```

---

## 📊 Banco de Dados: Relacionamentos

```
Paciente (1) ──────────────→ (N) Exame
             ╲
              └───→ (N) Endereco (opcional, para perfil clínico)

Exame (1) ───────────────→ (N) Procedimento
    │
    ├─→ Médico Solicitante (quem pediu o exame)
    ├─→ Médico Analista (quem interpretou resultado)
    ├─→ Laboratorista (quem processou)
    └─→ Laboratório (onde foi feito)

Procedimento (1) ──────→ Técnico (quem executou)
              ├─→ Supervisor (quem validou)
              └─→ Exame (pertence a qual exame)

Laboratório (1) ────────→ (N) Médico (funciona lá)
         ├─→ (N) Procedimento (oferece esses testes)
         └─→ Responsável Técnico (diretor)
```

---

## ⚠️ Casos Especiais SCEI

### 1. Resultado Inesperado / Anômalo

Se resultado é muito diferente do esperado:
- Médico pode solicitar: "Confirme este resultado (replicata)"
- Lab reexecuta procedimento com mesma amostra
- Se resultado se confirma: resultado é válido (pode ser real anormalidade)
- Se resultado diferente: relatar discrepância, verificar procedimento

### 2. Amostra Vencida

Hemoderivados têm prazo de validade:
- Sangue: 2-8°C por 5 dias (máx)
- Soro: -20°C indefinido
- Liquor (CSF): 1-2 horas ambiente
- Se passou validade: CANCELAR, solicitar nova coleta

### 3. Exame em Cascata

Alguns testes levam a testes adicionais:
- Exemplo: HIV Ag/Ac POSITIVO → confirmação por Western Blot (ou HIV DNA PCR)
- Médico solicitante autoriza: "Se POSITIVO, fazer confirmação"
- Sistema auto-gera novo exame se resultado POSITIVO

### 4. Exposição Ocupacional

Profissional de saúde se picou com agulha contaminada:
- Urgência: exame imediato (baseline) + 6 semanas + 3 meses
- Sistema cria série de exames automática (follow-up)
- Rastreamento de todos os testes até 6 meses

### 5. Privacidade: Teste Anônimo

Alguns pacientes querem teste anônimo (sem identificação):
- Usar código anônimo (ex: "ANON-2026-001")
- Não registrar nome completo
- Resultado entregue apenas com código
- Conformidade com legislação de privacidade

---

## 🎯 Exemplo: Fluxo Completo SCEI

```
2026-10-20 09:00
└─ Paciente João chega ao laboratório com pedido de HIV do seu médico

2026-10-20 09:15
└─ Laboratorista registra:
   ├─ Exame: HIV Ag/Ac combinado
   ├─ Médico solicitante: Dr. Silva
   ├─ Status: AGENDADO
   └─ Data coleta: 2026-10-20 (hoje)

2026-10-20 09:30
└─ Técnico coleta 5 mL de sangue
└─ Rótulo com código: "E20261020001"
└─ Status: AMOSTRA_COLETADA

2026-10-20 09:45
└─ Lab recebe amostra
└─ Verifica: código OK, volume OK, sem hemólise
└─ Status: AMOSTRA_RECEBIDA

2026-10-20 10:00
└─ Técnico inicia procedimento HIV ELISA
└─ Incuba amostra + reagentes por 30 min a 37°C
└─ Lava e adiciona substrato
└─ Lê optical density (OD) em leitor automático

2026-10-20 10:45
└─ Resultado bruto: OD = 0.85 (cut-off = 0.5)
└─ Interpretação: POSITIVO (presumido)
└─ Status: RESULTADO_PRELIMINAR

2026-10-20 11:00
└─ Supervisor revisa:
   ├─ Controle negativo: OD = 0.10 ✓ (OK)
   ├─ Controle positivo: OD = 1.50 ✓ (OK)
   ├─ Resultado paciente: OD = 0.85 (definitivamente positivo)
   └─ Aprova resultado
└─ Status: RESULTADO_FINALIZADO

2026-10-20 12:00
└─ Dr. Silva (médico solicitante) recebe notificação
└─ Revisa resultado + laudo preliminar
└─ Marca paciente para entrevista (breaking bad news)

2026-10-20 14:00
└─ Dr. Silva recomenda: confirmação por Western Blot (protocolo)
└─ Gera novo exame automático: "HIV Confirmação (Western)"
└─ Status novo exame: PENDENTE

2026-10-21 10:00
└─ Paciente volta para coleta de confirmação

2026-10-22 14:00
└─ Western Blot completo: gp120/gp41 bandas presentes
└─ Confirmação: POSITIVO ✓✓
└─ Status exame confirmação: LAUDO_EMITIDO

2026-10-22 15:00
└─ Dr. Silva emite laudo final:
   ├─ ELISA + Western: POSITIVO para HIV
   ├─ Interpretação: "Infecção confirmada"
   ├─ Recomendações: referência para infectologia, iniciar medicação
   └─ Assinatura digital

2026-10-22 15:30
└─ Paciente notificado: "Resultado disponível — contate seu médico"
└─ Sistema marca: LAUDO_FINALIZADO (pronto para paciente)
└─ Histórico completo registrado
```

---

## 📞 Próximos Documentos (Fase 3)

- **DECISOES.md** — Log de decisões arquiteturais: por quê cada tecnologia/padrão
- Fase 4: Laravel scaffolding + migrations
- Fase 5: Implementação das 9 fatias

