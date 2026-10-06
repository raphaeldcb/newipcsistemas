# Regras de Negócio — Módulo de Casos (Processos)

> Lógica de workflow, validações e regras operacionais para casos de perícia.
> Baseado em Delphi legado (ufProcesso.pas, fHistorico.pas, qCasos).
> Última atualização: 2026-10-06

---

## 📋 Conceito: Caso vs Processo

- **Caso**: Registro de uma perícia genética solicitada por um tribunal.
- **Processo**: Número único do processo judicial que originou o caso.
- **Sinonímia**: Em grande parte do código, "caso" e "processo" são usados intercambiávelmente.
- **Banco**: Tabela `tb_processo` (nomeada assim no Firebird, mas conceito é "caso").

---

## 🔄 Workflow de Casos (Estados e Transições)

### Estados Possíveis

```
PENDENTE
  ↓
  → COLETA_AGENDADA
  ↓
  → COLETA_REALIZADA
  ↓
  → AMOSTRA_RECEBIDA
  ↓
  → EM_EXTRACAO
  ↓
  → EXTRACAO_CONCLUIDA
  ↓
  → EM_ANALISE (SCEI)
  ↓
  → LAUDO_EMITIDO
  ↓
  → CASO_FINALIZADO
  ↓ (Branch de cancelamento)
  CANCELADO
```

### Transições Permitidas (Estado 1: Manual)

**Regra**: Conforme resposta da Fase 1, transições são **manuais** inicialmente.  
Usuário com permissão pode avançar manualmente de um estado para o próximo.

| De | Para | Condição | Quem Pode | Observação |
|----|------|----------|----------|-----------|
| PENDENTE | COLETA_AGENDADA | — | Gestor de Casos | Apenas mudança de status |
| COLETA_AGENDADA | COLETA_REALIZADA | — | Coletador | Após confirmação de coleta |
| COLETA_REALIZADA | AMOSTRA_RECEBIDA | — | Lab | Recepciona amostra |
| AMOSTRA_RECEBIDA | EM_EXTRACAO | — | Lab | Inicia extração |
| EM_EXTRACAO | EXTRACAO_CONCLUIDA | Extração finalizada | Lab | Validador autoriza |
| EXTRACAO_CONCLUIDA | EM_ANALISE | — | Lab | Passa para SCEI |
| EM_ANALISE | LAUDO_EMITIDO | — | Médico | Emite laudo |
| LAUDO_EMITIDO | CASO_FINALIZADO | — | Gestor | Encerra caso |
| * | CANCELADO | Justificativa | Gestor/Admin | Pode cancelar de qualquer estado |

### Transições Futuras (Estado 2: Automático)

Após MVP, implementar automação:
- **EXTRACAO_CONCLUIDA → EM_ANALISE**: Automático se validação OK
- **LAUDO_EMITIDO → CASO_FINALIZADO**: Automático após geração PDF
- **EM_EXTRACAO**: Job agendado verifica status (retry 3x) e muda para CONCLUÍDA se sucesso

---

## 📊 Estrutura de Dados: Caso

### Tabela: `tb_processo` (renomear para `tb_casos` em migration)

```sql
CREATE TABLE casos (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    
    -- Identificação
    processo_id VARCHAR(50) UNIQUE NOT NULL,  -- Ex: "0000001-02.2020.8.26.0100"
    vara_id BIGINT NOT NULL,                   -- FK para varas
    comarca_id BIGINT,                         -- FK para comarcas
    juiz_id BIGINT,                            -- FK para juizes
    
    -- Status & Workflow
    status ENUM('PENDENTE', 'COLETA_AGENDADA', 'COLETA_REALIZADA', 
                'AMOSTRA_RECEBIDA', 'EM_EXTRACAO', 'EXTRACAO_CONCLUIDA',
                'EM_ANALISE', 'LAUDO_EMITIDO', 'CASO_FINALIZADO', 'CANCELADO')
           DEFAULT 'PENDENTE',
    
    -- Datas críticas
    data_ajuizamento DATE NOT NULL,
    data_coleta DATE,
    data_recebimento DATE,
    data_laudo DATE,
    data_finalizacao DATE,
    
    -- Pessoas envolvidas (pivot será tabela separada)
    responsavel_id BIGINT,                     -- FK para usuarios (quem criou/gerencia)
    coletador_id BIGINT,                       -- FK para coletadores
    
    -- Especificidades
    tipo_analise VARCHAR(100),                 -- Ex: "DNA", "Paternidade", etc
    descricao TEXT,
    observacoes TEXT,
    
    -- Justificativa (se cancelado)
    motivo_cancelamento VARCHAR(255),
    
    -- Metadados
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL COMMENT 'Soft delete',
    
    INDEX(processo_id),
    INDEX(vara_id),
    INDEX(status),
    INDEX(data_ajuizamento),
    FOREIGN KEY(vara_id) REFERENCES varas(id),
    FOREIGN KEY(juiz_id) REFERENCES juizes(id),
    FOREIGN KEY(coletador_id) REFERENCES coletadores(id),
    FOREIGN KEY(responsavel_id) REFERENCES usuarios(id)
);
```

---

## 🔐 Validações & Regras

### 1. **Criação de Caso**

```
Campo                  | Validação
-----------------------|---------------------------------
processo_id            | Obrigatório, único, formato judicial
vara_id                | Obrigatório, deve existir
juiz_id                | Obrigatório, deve existir
data_ajuizamento       | Obrigatório, não pode ser data futura
tipo_analise           | Obrigatório (list: DNA, Paternidade, etc)
responsavel_id         | Obrigatório, deve ser usuário ativo
```

### 2. **Avançar de Status**

**Regra Geral**: Aplicar validações específicas do estado atual antes permitir transição.

**PENDENTE → COLETA_AGENDADA**
- ✅ Caso deve ter responsável
- ✅ Deve haver pelo menos 1 coletador disponível
- ✅ Coletador não pode ter > 5 agendamentos simultâneos

**COLETA_REALIZADA → AMOSTRA_RECEBIDA**
- ✅ Amostra deve estar catalogada no kit
- ✅ Lab deve ter recebido comunicação de entrega
- ✅ Amostra não pode estar vencida (validade > 30 dias)

**AMOSTRA_RECEBIDA → EM_EXTRACAO**
- ✅ Lab deve ter kit disponível
- ✅ Técnico de extração designado
- ✅ Nenhuma extração ativa para o mesmo processo

**EM_EXTRACAO → EXTRACAO_CONCLUIDA**
- ✅ Validador deve confirmar conclusão (ufExtracao.pas)
- ✅ Todos os alelos extraídos devem estar documentados
- ✅ Resultado não pode ser "inconclusivo" sem justificativa

**EXTRACAO_CONCLUIDA → EM_ANALISE**
- ✅ Caso deve estar atribuído a médico responsável (SCEI)
- ✅ Todos os alelos já extraídos

**EM_ANALISE → LAUDO_EMITIDO**
- ✅ Médico SCEI emitiu parecer
- ✅ Comparação genética executada (comparação com perfis)
- ✅ PDF do laudo gerado e armazenado

**LAUDO_EMITIDO → CASO_FINALIZADO**
- ✅ Laudo assinado digitalmente (opcional Phase 2)
- ✅ Créditos devem estar lançados (gerados para cobrança)

### 3. **Cancelamento (de qualquer estado)**

```
Condições:
- Apenas ADMIN ou Gestor podem cancelar
- Obrigatório informar motivo (campo motivo_cancelamento)
- Motivos permitidos: "Erro de entrada", "Solicitação juiz", "Falta de material", etc
- Log de auditoria: registrar quem cancelou e quando
- Créditos: já gerados devem ser anulados manualmente (via credit reversal)
```

---

## 📝 Histórico de Casos

### Conceito
- Cada ação realizada em um caso gera registro em `tb_historico`.
- Auditoria completa: quem, quando, o quê.

### Tabela: `tb_historico`

```sql
CREATE TABLE historicos (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    caso_id BIGINT NOT NULL,
    usuario_id BIGINT,                     -- FK para usuarios (quem executou)
    tipo_acao VARCHAR(50),                 -- Ex: "CRIACAO", "STATUS_ALTERADO", "ANEXO_ADICIONADO"
    descricao TEXT,
    status_anterior VARCHAR(50),           -- Se status foi alterado
    status_novo VARCHAR(50),               -- Se status foi alterado
    data_acao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY(caso_id) REFERENCES casos(id),
    FOREIGN KEY(usuario_id) REFERENCES usuarios(id),
    INDEX(caso_id),
    INDEX(data_acao)
);
```

### Tipos de Ação Registrados

```
CRIACAO                    Caso criado
STATUS_ALTERADO            Status mudou (com antes/depois)
COLETA_AGENDADA            Coleta agendada
COLETA_CONFIRMADA          Coletador confirmou realização
AMOSTRA_RECEBIDA           Lab registrou recebimento
EXTRACAO_INICIADA          Lab iniciou extração
EXTRACAO_VALIDADA          Validador aprovou resultado
LAUDO_EMITIDO              Médico emitiu laudo
CASO_FINALIZADO            Caso encerrado
CANCELAMENTO               Caso cancelado (com motivo)
ANEXO_ADICIONADO           Arquivo anexado
OBSERVACAO_ADICIONADA      Observação/comentário
RESPONSAVEL_ALTERADO       Novo responsável designado
COLETADOR_ALTERADO         Coletador trocado
```

---

## 🔗 Relacionamentos Principais

### Caso ↔ Pessoas

```php
// Caso tem múltiplas pessoas envolvidas (partes, réus, vítimas, suspeitos)
Caso
  ├─ hasMany Pessoa (pivot table: caso_pessoa)
  │   └─ tipo_envolvimento: "PARTE", "RÉU", "VÍTIMA", "SUSPEITO", etc.
  └─ belongsTo Responsavel (Usuario) — quem gerencia
```

### Caso ↔ Extração

```php
// Extração é N:N com Caso (um caso pode ter múltiplas extrações em paralelo?)
Caso
  ├─ belongsToMany Extracao (pivot: extracao_casos)
  │   └─ fase: "EXTRACAO", "AMPLIFICACAO", "SEQUENCIAMENTO"
  └─ hasMany Kit (kits usados na coleta)
```

### Caso ↔ Créditos

```php
// Cada caso gera créditos quando finalizado
Caso
  └─ hasMany Parcela (pagamento de serviço)
      ├─ tipo: "COLETA", "EXTRACAO", "ANALISE", "LAUDO"
      ├─ valor: valor do serviço
      ├─ juiz: para quem cobrar
      └─ status: "PENDENTE", "PAGO", "VENCIDO"
```

---

## 💰 Geração de Créditos (Workflow)

### Gatilho
Quando caso alcança estado **CASO_FINALIZADO**, sistema dispara geração de créditos.

### Lógica (Simplificada — detalhes em REGRAS-NEGOCIO-CREDITOS.md)

```
Para cada pessoa (coletador, técnico, médico):
  1. Calcular valor por tipo de análise (DNA = X, Paternidade = Y, etc)
  2. Aplicar descontos/taxas (juiz, vara, categoria)
  3. Gerar parcela (entrada em tb_parcelas)
  4. Registrar em historico ("CREDITO_GERADO")
  5. Disparar evento para notificação/email
```

### Regras Específicas

```
- Coletador: crédito só se confirmou coleta (COLETA_REALIZADA)
- Técnico de Extração: crédito se extração foi validada
- Médico/Analista: crédito se laudo foi emitido
- Caso cancelado: reverter créditos já gerados (status = "CANCELADO")
```

---

## 🎯 Permissões (Roles)

### Roles Envolvidas em Casos

| Role | Ações Permitidas |
|------|------------------|
| **admin** | Criar, atualizar, deletar, cancelar, alterar status qualquer caso |
| **gestor_casos** | Criar, atualizar, cancelar, atualizar status |
| **coletador** | Confirmar coleta realizada, visualizar próprios agendamentos |
| **tech_extracao** | Iniciar extração, validar resultado, finalizar |
| **medico** | Emitir laudo, visualizar extrações, finalizar análise |
| **usuario_comum** | Apenas visualizar (casos onde é responsável) |

### Policies (Laravel)

```php
// CasoPolicy
class CasoPolicy
{
    public function create(Usuario $user): bool {
        return in_array($user->role, ['admin', 'gestor_casos']);
    }
    
    public function updateStatus(Usuario $user, Caso $caso): bool {
        // Admin sempre pode
        if ($user->is_admin) return true;
        
        // Gestor pode avançar em geral
        if ($user->role === 'gestor_casos') return true;
        
        // Coletador só se coleta agendada → realizada
        if ($user->role === 'coletador') {
            return $caso->status === 'COLETA_AGENDADA';
        }
        
        return false;
    }
    
    public function view(Usuario $user, Caso $caso): bool {
        // Próprio responsável
        if ($caso->responsavel_id === $user->id) return true;
        
        // Admin/gestor
        if (in_array($user->role, ['admin', 'gestor_casos'])) return true;
        
        return false;
    }
}
```

---

## 📧 Notificações

### Eventos que Disparam Notificações

| Evento | Destinatário | Conteúdo |
|--------|-------------|----------|
| **Caso Criado** | Responsável | "Novo caso atribuído a você: processo #123" |
| **Coleta Agendada** | Coletador | "Coleta agendada para 2026-10-15 em São Paulo" |
| **Amostra Recebida** | Tech Extração | "Amostra recebida: processo #123, pronto para extração" |
| **Extração Concluída** | Médico | "Extração finalizada: alelos disponíveis para análise" |
| **Laudo Emitido** | Gestor Casos | "Laudo emitido: processo #123 pronto para fechamento" |
| **Caso Finalizado** | Responsável + Admin | "Caso finalizado: créditos gerados" |
| **Cancelamento** | Todos | "Caso cancelado por: motivo aqui" |

---

## 📊 Relatórios do Módulo Casos

### Relatórios Disponíveis

1. **Casos Pendentes** — status PENDENTE > 30 dias
2. **Casos em Andamento** — status entre COLETA_AGENDADA e EM_ANALISE
3. **Casos Finalizados (período)** — status CASO_FINALIZADO em período
4. **Casos Cancelados** — com motivo
5. **Performance por Vara** — tempo médio resolução por vara
6. **Performance por Técnico** — quantos/tempo médio extrações finalizadas

---

## 🔍 Queries Comuns

### Repository: CasoRepository

```php
// Buscar caso
public function findById(int $id): ?Caso
public function findByProcessoId(string $processoId): ?Caso

// Listar
public function findAll(int $paginate = 15): Collection
public function findByVara(int $varaId): Collection
public function findPendentes(): Collection
public function findEmAndamento(): Collection
public function findFinalizados(Carbon $desde, Carbon $ate): Collection

// Busca avançada
public function search(array $filtros): Collection
  // Filtros: vara_id, juiz_id, status, data_ajuizamento_de, data_ate, responsavel_id

// Criar/atualizar
public function create(array $dados): Caso
public function update(Caso $caso, array $dados): Caso
public function cancel(Caso $caso, string $motivo): void
```

---

## ⚠️ Casos Especiais

### 1. Caso sem Coletador Agendado
- Sistema não impede criar caso sem coletador
- Avisar usuário: "Caso criado mas sem coleta agendada"
- Lembrança: task agendado (1x/semana) para casos > 15 dias sem coleta

### 2. Amostra Vencida
- Amostras DNA têm validade ~30 dias em condição ambiente
- Após vencimento, marcar caso como "AMOSTRA_VENCIDA" (cancelar com motivo)
- Job agendado: verificar validade diariamente

### 3. Extração Inconclusiva
- Se resultado for "inconclusivo" ou "falhou", técnico pode:
  - Solicitar nova amostra (volta para COLETA_AGENDADA)
  - Ou registrar como "EXTRACAO_FALHOU" e cancelar

### 4. Laudo com Conflito Genético
- Médico detecta conflito (ex: "não é pai biologicamente")
- Aviso especial no laudo + Email para juiz/advogados envolvidos
- Registrar em histórico: "LAUDO_COM_CONFLITO_GENETICO"

---

## 📝 Exemplo: Fluxo Completo de um Caso

```
2026-10-06 10:00
└─ CRIACAO (usuário: gestor_casos@lab.com)
   └─ Caso criado: processo "0000001-02.2026.8.26.0100"
   └─ Status: PENDENTE
   └─ Responsável: João Gestor
   └─ Tipo: DNA

2026-10-07 09:30
└─ STATUS_ALTERADO: PENDENTE → COLETA_AGENDADA
   └─ Coletador: Maria Coletadora
   └─ Local: Coletório Centro, São Paulo
   └─ Data agendada: 2026-10-15

2026-10-15 14:00
└─ COLETA_CONFIRMADA (usuário: maria_coletadora@lab.com)
   └─ Amostra coletada e entregue ao lab

2026-10-16 08:00
└─ STATUS_ALTERADO: COLETA_REALIZADA → AMOSTRA_RECEBIDA
   └─ Lab recebeu amostra
   └─ Valididade: 2026-11-15

2026-10-16 10:30
└─ STATUS_ALTERADO: AMOSTRA_RECEBIDA → EM_EXTRACAO
   └─ Técnico: Pedro Técnico
   └─ Iniciada extração de DNA

2026-10-20 15:00
└─ STATUS_ALTERADO: EM_EXTRACAO → EXTRACAO_CONCLUIDA
   └─ Validador: Dr. Silva
   └─ Resultado: Alelos extraídos com sucesso
   └─ Alelos: D8S1179: 13,15 | D21S11: 29,32 | ...

2026-10-21 09:00
└─ STATUS_ALTERADO: EXTRACAO_CONCLUIDA → EM_ANALISE
   └─ Atribuído a: Dra. Ana Médica

2026-10-25 16:00
└─ STATUS_ALTERADO: EM_ANALISE → LAUDO_EMITIDO
   └─ Médico: Dra. Ana Médica
   └─ Conclusão: "Compatibilidade genética presente"
   └─ PDF gerado e armazenado

2026-10-25 17:00
└─ STATUS_ALTERADO: LAUDO_EMITIDO → CASO_FINALIZADO
   └─ Caso encerrado

2026-10-25 17:05
└─ CREDITOS_GERADOS
   └─ Coletador: R$ 150,00
   └─ Técnico: R$ 300,00
   └─ Médico: R$ 250,00
   └─ Total para Juiz: R$ 700,00
```

---

## 📞 Próximos Documentos

- **REGRAS-NEGOCIO-CREDITOS.md** — Cálculo de créditos e parcelamento
- **REGRAS-NEGOCIO-EXTRACOS.md** — Workflow de extração (3 fases)
- **REGRAS-NEGOCIO-SCEI.md** — Módulo laboratório (SCEI)

