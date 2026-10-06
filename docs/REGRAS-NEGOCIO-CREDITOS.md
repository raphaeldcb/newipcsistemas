# Regras de Negócio — Módulo Créditos & Parcelamento

> Lógica de geração de créditos, cálculo de valores, parcelamento e financeiro.
> Baseado em Delphi legado (ufParcelamento.pas, ufCreditosJuiz.pas, ufGeraValorColetadores.pas, vi_valor_coletador).
> Última atualização: 2026-10-06

---

## 📋 Conceitos Fundamentais

### Crédito vs Parcela

**Crédito**: Direito de recebimento gerado após finalizar um caso.
- Uma pessoa (coletador, técnico, médico) tem direito a crédito após sua ação ser concluída.
- Exemplo: "Coletador Maria tem crédito de R$ 150 pelo caso #123"

**Parcela**: Divisão do crédito em prestações (se houver parcelamento).
- Um crédito pode ser pago à vista (1 parcela) ou parcelado (2-12 parcelas).
- Exemplo: "Crédito de R$ 600 dividido em 3 parcelas de R$ 200 (10/10, 10/20, 10/30)"

### Tabelas Principais

```sql
tb_creditos              -- Registro de crédito (já finalizado)
├─ id, pessoa_id, caso_id, tipo_servico, valor_total, data_geracao
├─ status: PENDENTE, PAGO, VENCIDO, CANCELADO
└─ juiz_id, vara_id (para rastreabilidade)

tb_parcelas             -- Divisão em prestações
├─ id, credito_id, numero_parcela, valor_parcela, data_vencimento
├─ status: PENDENTE, PAGO, VENCIDA, CANCELADA
├─ data_pagamento, forma_pagamento
└─ juiz_id (quem paga)

tb_creditos_temporario  -- Cache/staging de cálculos
└─ valores parciais durante processamento

tb_parcela_juiz         -- Relação parcela ↔ juiz (agregação por juiz)
└─ juiz_id, total_vencido, total_pendente
```

---

## 🔄 Fluxo de Geração de Créditos

### Gatilho: Caso → CASO_FINALIZADO

Quando um caso muda para estado `CASO_FINALIZADO`:

```
1. Sistema dispara evento: CasoFinalizado($caso)
2. Listener: CreditoGenerationListener escuta
3. Chama: CreditoService::gerarCreditos($caso)
4. Calcula créditos para cada pessoa envolvida
5. Cria registros em tb_creditos
6. Cria parcelas em tb_parcelas (parcelamento padrão)
7. Log em historico: "CREDITOS_GERADOS"
8. Dispara notificação: "Créditos gerados para caso #..."
9. Retorna: array de créditos criados
```

### Pseudocódigo

```php
// CreditoService.php
public function gerarCreditos(Caso $caso): Collection
{
    // 1. Validar se caso pode gerar créditos
    if ($caso->status !== 'CASO_FINALIZADO') {
        throw new CasoNaoFinalizadoException();
    }
    
    if ($caso->creditos()->exists()) {
        throw new CreditosJaGeradosException(); // Idempotência
    }
    
    $creditos = collect();
    
    // 2. Coletador
    $credito_coletador = $this->calcularCreditoColetador($caso);
    if ($credito_coletador > 0) {
        $creditos->push($this->criarCredito(
            pessoa: $caso->coletador,
            caso: $caso,
            tipo: 'COLETA',
            valor: $credito_coletador
        ));
    }
    
    // 3. Técnico de Extração
    $credito_tecnico = $this->calcularCreditoTecnico($caso);
    if ($credito_tecnico > 0) {
        $creditos->push($this->criarCredito(
            pessoa: $caso->extracao->tecnico,
            caso: $caso,
            tipo: 'EXTRACAO',
            valor: $credito_tecnico
        ));
    }
    
    // 4. Médico/Analista
    $credito_medico = $this->calcularCreditoMedico($caso);
    if ($credito_medico > 0) {
        $creditos->push($this->criarCredito(
            pessoa: $caso->laudo->medico,
            caso: $caso,
            tipo: 'ANALISE',
            valor: $credito_medico
        ));
    }
    
    // 5. Criar parcelas para cada crédito
    foreach ($creditos as $credito) {
        $this->parcelamentoService->criarParcelas($credito);
    }
    
    // 6. Log e notificação
    $caso->historicos()->create([
        'tipo_acao' => 'CREDITOS_GERADOS',
        'descricao' => "Total gerado: R$ " . $creditos->sum('valor_total')
    ]);
    
    event(new CreditosGerados($creditos, $caso));
    
    return $creditos;
}
```

---

## 💰 Cálculo de Valores

### Fórmula Geral

```
VALOR_FINAL = VALOR_BASE × FATOR_TIPO × FATOR_JUIZ × FATOR_VARA × FATOR_CATEGORIA
```

### 1. **VALOR_BASE** (por tipo de análise)

```
Tipo de Análise          Valor Base (R$)
─────────────────────────────────────────
DNA Paternidade          R$ 600,00
DNA Herança              R$ 800,00
DNA Criminal             R$ 1.000,00
DNA Compatibilidade      R$ 750,00
Paternidade Rápida       R$ 400,00
Teste Compatibilidade    R$ 500,00
[Outro]                  R$ 650,00 (default)
```

### 2. **FATOR_TIPO** (por tipo de serviço prestado)

```
Tipo de Serviço    Fator    Valor do Crédito
──────────────────────────────────────────────
COLETA (coletador)   20%    0.20 × VALOR_BASE
EXTRACAO (técnico)   35%    0.35 × VALOR_BASE
ANALISE (médico)     45%    0.45 × VALOR_BASE
────────────────────
TOTAL               100%    1.00 × VALOR_BASE
```

**Nota**: A soma (20% + 35% + 45%) = 100% do valor base é distribuída entre os 3.

### 3. **FATOR_JUIZ** (por tribunal)

```
Tribunal                           Fator
─────────────────────────────────────────
Tribunais Federais                1.20 (20% acréscimo)
Tribunais Estaduais (TJ)          1.00 (sem modificação)
Comarcas de Primeira Instância    0.90 (-10%)
Juizados Especiais                0.80 (-20%)
```

### 4. **FATOR_VARA** (por especialização)

```
Vara                       Fator
─────────────────────────────────
Vara de Família           1.10 (10% acréscimo)
Vara Criminal             1.15 (15% acréscimo)
Vara Cível                1.00 (sem modificação)
Vara de Sucessões         1.05 (5% acréscimo)
```

### 5. **FATOR_CATEGORIA** (por categoria de coletador/profissional)

```
Categoria                              Fator
──────────────────────────────────────────────
Profissional Sênior (>10 anos)        1.10
Profissional Pleno (5-10 anos)        1.00
Profissional Junior (<5 anos)         0.90
Estagiário                            0.70
```

### Exemplo de Cálculo

```
Caso: DNA Paternidade, Vara de Família, Tribunal Estadual
Coletador: Maria (Profissional Pleno)

VALOR_BASE = R$ 600,00
FATOR_TIPO = 0.20 (coletador)
FATOR_JUIZ = 1.00 (TJ)
FATOR_VARA = 1.10 (Família)
FATOR_CATEGORIA = 1.00 (Pleno)

VALOR_FINAL = 600 × 0.20 × 1.00 × 1.10 × 1.00
            = 600 × 0.22
            = R$ 132,00

Crédito de Maria: R$ 132,00
```

---

## 📅 Parcelamento Padrão

### Regra Padrão

Todos os créditos são parcelados em **3 parcelas iguais** com vencimento:
- **1ª parcela**: 10 dias após caso finalizado
- **2ª parcela**: 20 dias após caso finalizado
- **3ª parcela**: 30 dias após caso finalizado

### Customização por Juiz

Um juiz específico pode ter regra diferente (parametrizável):

```sql
-- Tabela: juiz_parcelamento (novo)
CREATE TABLE juiz_parcelamento (
    juiz_id BIGINT PRIMARY KEY,
    quantidade_parcelas INT DEFAULT 3,
    intervalo_dias INT DEFAULT 10,  -- intervalo entre parcelas
    data_vencimento_primeira DATE DEFAULT (DATE_ADD(CURDATE(), INTERVAL 10 DAY)),
    FOREIGN KEY(juiz_id) REFERENCES juizes(id)
);
```

### Cálculo de Vencimentos

```php
// ParcelamentoService.php
public function criarParcelas(Credito $credito): Collection
{
    $juiz = $credito->caso->juiz;
    $config = $juiz->parcelamento ?? $this->padraoGlobal();
    
    $parcelas = collect();
    $valor_parcela = $credito->valor_total / $config->quantidade_parcelas;
    
    for ($i = 1; $i <= $config->quantidade_parcelas; $i++) {
        $dias_vencimento = $i * $config->intervalo_dias;
        $data_vencimento = $credito->caso->data_finalizacao
                          ->addDays($dias_vencimento);
        
        $parcela = Parcela::create([
            'credito_id' => $credito->id,
            'numero_parcela' => $i,
            'valor_parcela' => $valor_parcela,
            'data_vencimento' => $data_vencimento,
            'status' => 'PENDENTE',
            'juiz_id' => $juiz->id,
        ]);
        
        $parcelas->push($parcela);
    }
    
    return $parcelas;
}
```

### Exceções de Parcelamento

```
Condição                           Ação
─────────────────────────────────────────────────────────
Valor < R$ 100                    Pagamento à vista (1 parcela)
Valor entre R$ 100-500            2 parcelas (15 e 30 dias)
Valor > R$ 500                    3 parcelas (10, 20, 30 dias)
Juiz com histórico inadimplente   Reduzir para 2 parcelas
Crédito cancelado                 Todas as parcelas → CANCELADA
```

---

## 📊 Status de Créditos e Parcelas

### Status de Crédito

```
PENDENTE        Crédito gerado, aguardando pagamento
PAGO            Todas as parcelas foram pagas
VENCIDO         Pelo menos uma parcela venceu e não foi paga
CANCELADO       Crédito anulado (caso foi cancelado)
AJUSTADO        Valor foi ajustado após geração (ex: desconto)
```

### Status de Parcela

```
PENDENTE        Aguardando pagamento
PAGO            Já recebido (com data_pagamento preenchida)
VENCIDA         Data vencimento passou e ainda não foi paga
CANCELADA       Parcela anulada
CONTESTADA      Juiz contestou o valor
```

### Transições de Status (State Machine)

```
Crédito: PENDENTE → PAGO (quando todas parcelas pagas)
         PENDENTE → VENCIDO (quando 1+ parcelas vencerem)
         PENDENTE → CANCELADO (se caso for cancelado)
         PAGO → AJUSTADO → PENDENTE (se ajuste feito após pagto)

Parcela: PENDENTE → PAGO (quando receber pagamento)
         PENDENTE → VENCIDA (quando passar data vencimento)
         VENCIDA → PAGO (se pagar após vencimento)
         VENCIDA → CANCELADA (se cancelar)
         * → CANCELADA (se crédito for cancelado)
```

---

## 🚫 Validações & Regras

### 1. **Antes de Gerar Créditos**

```
✓ Caso deve estar em status CASO_FINALIZADO
✓ Caso não pode ter créditos já gerados (idempotência)
✓ Coletador: deve ter confirmado coleta (COLETA_REALIZADA)
✓ Técnico: extração deve estar validada (EXTRACAO_CONCLUIDA)
✓ Médico: laudo deve estar emitido (LAUDO_EMITIDO)
✗ Caso cancelado: não gera créditos (status CANCELADO)
```

### 2. **Cálculo de Valores**

```
✓ Tipo de análise deve estar registrado em tabela de valores base
✓ Juiz deve existir e ter tribunal designado
✓ Vara deve existir e ter especialização
✓ Categoria do profissional deve ser válida
✓ Valor final deve ser > R$ 0
✗ Não pode gerar crédito sem profissional responsável
```

### 3. **Parcelamento**

```
✓ Quantidade de parcelas: 1-12
✓ Intervalos devem ser >= 10 dias
✓ Data primeira parcela > data finalização caso
✓ Valores de parcelas devem ser positivos
✗ Não pode parcelar valor < R$ 50
```

### 4. **Pagamento de Parcela**

```
✓ Parcela status = PENDENTE ou VENCIDA
✓ Valor pagamento <= valor_parcela + 5% (margem tolerância)
✓ Data pagamento deve ser >= data vencimento (se VENCIDA)
✓ Forma pagamento válida (boleto, transferência, etc)
✓ Juiz deve ter saldo/crédito suficiente
```

---

## 🔄 Reversão e Ajustes de Créditos

### Cenário 1: Caso Cancelado

Quando um caso muda para `CANCELADO`:

```php
public function cancelarCreditosDoCaso(Caso $caso): void
{
    // 1. Encontrar créditos
    $creditos = $caso->creditos()->where('status', '!=', 'CANCELADO');
    
    // 2. Reverter cada crédito
    foreach ($creditos as $credito) {
        // Reverter parcelas
        $credito->parcelas()
                ->whereIn('status', ['PENDENTE', 'VENCIDA'])
                ->update(['status' => 'CANCELADA']);
        
        // Reverter crédito
        $credito->update(['status' => 'CANCELADO']);
        
        // Log
        Historico::create([
            'tipo_acao' => 'CREDITO_CANCELADO',
            'descricao' => "Crédito revertido por cancelamento de caso: {$caso->processo_id}",
            'caso_id' => $caso->id
        ]);
    }
}
```

### Cenário 2: Ajuste de Valor (Erro ou Desconto)

Um admin pode ajustar valor de crédito (ex: desconto para cliente VIP):

```php
public function ajustarCredito(Credito $credito, float $novo_valor): void
{
    $valor_anterior = $credito->valor_total;
    
    // Validações
    if ($novo_valor < 0 || $novo_valor > $valor_anterior * 1.1) {
        throw new AjusteInvalidoException("Ajuste fora da faixa permitida");
    }
    
    if ($credito->status === 'PAGO') {
        throw new CreditoJaPagoException("Não pode ajustar crédito já pago");
    }
    
    // Aplicar ajuste
    $credito->update([
        'valor_total' => $novo_valor,
        'status' => 'AJUSTADO'
    ]);
    
    // Recalcular parcelas
    $this->parcelamentoService->recalcularParcelas($credito);
    
    // Log
    Historico::create([
        'tipo_acao' => 'CREDITO_AJUSTADO',
        'descricao' => "Valor ajustado de R$ $valor_anterior para R$ $novo_valor",
        'caso_id' => $credito->caso_id
    ]);
}
```

---

## 📈 Relatórios Disponíveis

### Relatório 1: Créditos Gerados (período)

```
Filtros: data_inicio, data_fim, juiz_id, vara_id, tipo_servico

Colunas:
├─ Caso: processo_id, data_finalização
├─ Pessoa: nome, CPF, categoria
├─ Tipo Serviço: COLETA/EXTRACAO/ANALISE
├─ Valor Total
├─ Status Crédito
├─ Data Geração
└─ Link para detalhe (parcelas)

Agregações:
├─ Total por tipo de serviço
├─ Total por juiz
├─ Total por vara
└─ Total geral
```

### Relatório 2: Parcelas Vencidas

```
Filtros: data_vencimento_ate, juiz_id

Colunas:
├─ Caso: processo_id
├─ Crédito: valor_total, data_geracao
├─ Parcela: número, valor, data_vencimento
├─ Dias em Atraso
├─ Status
├─ Juiz: nome, contato
└─ Observações

Agregações:
├─ Total em atraso por juiz
├─ Dias médios em atraso
└─ % de inadimplência
```

### Relatório 3: Performance por Profissional

```
Filtros: data_inicio, data_fim, tipo_servico, categoria

Colunas:
├─ Pessoa: nome, categoria, ativo
├─ Quantidade de créditos gerados
├─ Valor total gerado
├─ Valor médio por crédito
├─ Taxa de pagamento (%)
├─ Dias médios para receber
└─ Rating/Score

Ordenação: por valor total (desc)
```

### Relatório 4: Inadimplência por Juiz

```
Filtros: data_vencimento_ate, mínimo_em_atraso

Colunas:
├─ Juiz: nome, tribunal, contato
├─ Total em atraso (R$)
├─ Quantidade de parcelas vencidas
├─ Dias médios em atraso
├─ Histórico de pagamento (%)
├─ Observações
└─ Data último contato/email

Alertas:
├─ Juiz com > R$ 5k em atraso
├─ Juiz com > 30 dias de atraso
└─ Juiz com histórico de inadimplência
```

---

## 🔍 Queries Comuns (Repository)

### CreditoRepository

```php
// Buscar
public function findById(int $id): ?Credito
public function findByCaso(Caso $caso): Collection
public function findByPessoa(Pessoa $pessoa): Collection
public function findByJuiz(Juiz $juiz): Collection

// Listar
public function findPendentes(): Collection
public function findVencidos(): Collection
public function findPagosPeriodo(Carbon $inicio, Carbon $fim): Collection

// Busca avançada
public function search(array $filtros): Collection
  // Filtros: caso_id, pessoa_id, juiz_id, vara_id, tipo_servico, status, data_inicio, data_fim

// Agregações
public function totalPorJuiz(Juiz $juiz): float
public function totalPorVara(Vara $vara): float
public function totalPorTipoServico(string $tipo): float
public function totalVencido(): float

// Criar/atualizar
public function create(array $dados): Credito
public function update(Credito $credito, array $dados): Credito
public function cancelar(Credito $credito, string $motivo): void
public function ajustar(Credito $credito, float $novo_valor): void
```

### ParcelaRepository

```php
// Buscar
public function findById(int $id): ?Parcela
public function findByCredito(Credito $credito): Collection
public function findByJuiz(Juiz $juiz): Collection

// Listar
public function findPendentes(): Collection
public function findVencidas(): Collection
public function findPagas(): Collection

// Agregações
public function totalVencidoPorJuiz(Juiz $juiz): float
public function diasMedioEmAtraso(Juiz $juiz): float
public function taxaPagamentoPorJuiz(Juiz $juiz): float

// Registrar pagamento
public function registrarPagamento(Parcela $parcela, float $valor_pago, string $forma): void
```

---

## 📧 Notificações & Alertas

### Notificações de Crédito

| Evento | Destinatário | Conteúdo |
|--------|-------------|----------|
| **Créditos Gerados** | Pessoa (coletador/técnico/médico) | "Créditos gerados do caso #123: R$ 150,00" |
| **Parcela Vencida** | Juiz | "Parcela vencida em 10/30: R$ 200,00 (caso #123)" |
| **Pagamento Recebido** | Pessoa | "Parcela 1/3 paga: R$ 200,00 (caso #123)" |
| **Crédito Totalmente Pago** | Admin | "Crédito finalizado (100% pago): Maria Silva - R$ 600,00" |
| **Crédito Cancelado** | Pessoa + Admin | "Crédito cancelado por cancelamento de caso: #123" |

### Alertas Automáticos (Batch)

**Daily @ 09:00 AM**:
- Enviar email para juízes com parcelas vencidas > 15 dias
- Cobrar: "Favor regularizar parcela vencida: R$ XXX"

**Weekly (segunda @ 08:00 AM)**:
- Relatório de inadimplência para admin
- Juízes com > R$ 5k em atraso

**Monthly (1º do mês @ 10:00 AM)**:
- Resumo de créditos gerados (por pessoa, juiz, vara)
- Enviar para gestores

---

## 🎯 Exemplo: Fluxo Completo de Crédito

```
2026-10-25 17:00
└─ Caso finalizado: processo "0000123-02.2026.8.26.0100"

2026-10-25 17:05
└─ CreditoGenerationListener ouve evento CasoFinalizado
   └─ Chama CreditoService::gerarCreditos($caso)

2026-10-25 17:06
└─ CREDITO 1: Coletador Maria
   ├─ Tipo: COLETA
   ├─ Valor Base: R$ 600 (DNA Paternidade)
   ├─ Fator Juiz: 1.00 (TJ)
   ├─ Fator Vara: 1.10 (Família)
   ├─ Fator Categoria: 1.00 (Pleno)
   ├─ Fator Tipo: 0.20
   └─ VALOR FINAL: R$ 132,00
   
   └─ Parcelas:
      ├─ Parcela 1: R$ 44,00 (vencimento 11/04)
      ├─ Parcela 2: R$ 44,00 (vencimento 11/14)
      └─ Parcela 3: R$ 44,00 (vencimento 11/24)

2026-10-25 17:07
└─ CREDITO 2: Técnico Pedro
   ├─ Tipo: EXTRACAO
   ├─ Fator Tipo: 0.35
   └─ VALOR FINAL: R$ 231,00
   
   └─ Parcelas (3x R$ 77,00 cada)

2026-10-25 17:08
└─ CREDITO 3: Médica Dra. Ana
   ├─ Tipo: ANALISE
   ├─ Fator Tipo: 0.45
   └─ VALOR FINAL: R$ 297,00
   
   └─ Parcelas (3x R$ 99,00 cada)

2026-10-25 17:09
└─ Log: "Créditos gerados para caso #123: Total R$ 660,00"
└─ Notificação enviada: Maria, Pedro, Dra. Ana

2026-10-28
└─ Notificação para juiz: "Parcelas vencem em 2 dias"

2026-11-04
└─ Parcela 1 vencida
└─ Email para juiz: "Favor pagar R$ 165,00 (soma parcelas de todos)"

2026-11-08 (Juiz pagou)
└─ Registrar pagamento: R$ 165,00
└─ Atualizar status: Parcelas 1 → PAGAS
└─ Notificação: Maria/Pedro/Dra. Ana "Parcela 1 recebida"

2026-11-25 (Última parcela paga)
└─ Todos os créditos → PAGO
└─ Log: "Créditos finalizados com sucesso"
```

---

## ⚠️ Casos Especiais

### 1. Crédito Parcial (Amostra Falha)

Se extração falhar e amostra não puder ser recuperada:
- Coletador recebe crédito (coleta foi realizada)
- Técnico NÃO recebe crédito (extração falhou)
- Médico NÃO recebe crédito (sem alelos para analisar)

```php
// Override padrão
$valor_coletador = $this->calcularCreditoColetador($caso);  // Sim
$valor_tecnico = 0;    // Não
$valor_medico = 0;     // Não
```

### 2. Revisão/Reexame

Se juiz solicita reexame (nova análise):
- Primeiro crédito: marcado como "SUSPENSO" (pode reverter se reexame dá resultado diferente)
- Segundo crédito: gerado apenas após 2º laudo ser finalizado
- Log: rastrear ambos os créditos

### 3. Juiz Inadimplente

Se juiz tem histórico de não pagamento:
- Exigir pagamento à vista (1 parcela) ao invés de parcelar
- Ou bloquear novos créditos até quitar antigos
- Admin deve autorizar exceção manualmente

### 4. Desconto/Cortesia

Admin pode aplicar desconto a um juiz específico:
- Ajustar crédito após geração (via `ajustarCredito()`)
- Status muda para AJUSTADO
- Log registra desconto + motivo
- Parcelas recalculadas automaticamente

---

## 📞 Próximos Documentos (Fase 3)

- **REGRAS-NEGOCIO-EXTRACOS.md** — Extração de ADN (3 fases: extração → amplificação → sequenciamento)
- **REGRAS-NEGOCIO-SCEI.md** — Módulo laboratório integrado
- **DECISOES.md** — Log de decisões arquiteturais (por quê cada decisão)

