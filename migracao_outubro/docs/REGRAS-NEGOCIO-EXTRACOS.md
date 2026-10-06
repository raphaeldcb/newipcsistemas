# Regras de Negócio — Módulo Extração de ADN (3 Fases)

> Lógica de extração genética, amplificação, sequenciamento e validação de alelos.
> Baseado em Delphi legado (ufExtracao.pas, ufMapa_ExtAmpli.pas, fUserValidaExtracao.pas, ufGeraDocLab.pas).
> Última atualização: 2026-10-06

---

## 📋 Conceito: 3 Fases de Extração

Após uma amostra ser recebida no laboratório, ela passa por 3 fases sequenciais de análise genética:

```
FASE 1: EXTRAÇÃO          FASE 2: AMPLIFICAÇÃO      FASE 3: SEQUENCIAMENTO
┌──────────────────┐      ┌──────────────────┐      ┌──────────────────┐
│ Isolação de ADN  │  →   │ PCR (cópias)     │  →   │ Análise bases    │
│ do material      │      │ multiplicação    │      │ genéticas (A/T/G)│
│ biológico        │      │ de sequências    │      │ e geração de     │
│                  │      │                  │      │ perfil genético  │
└──────────────────┘      └──────────────────┘      └──────────────────┘
Responsável: Tech.        Responsável: Tech.        Responsável: Médico
Validador: Supervisor     Validador: Supervisor     Validador: Médico
Resultado: ADN puro       Resultado: Cópias de ADN  Resultado: Alelos
Status: EXTRACAO          Status: AMPLIFICACAO      Status: SEQUENCIAMENTO
```

### Características por Fase

| Aspecto | Extração | Amplificação | Sequenciamento |
|---------|----------|--------------|---|
| **Duração típica** | 1-2 dias | 2-3 horas | 4-8 horas |
| **Responsável** | Técnico Lab | Técnico Lab | Médico/Analista |
| **Validador** | Supervisor Lab | Supervisor Lab | Médico/Chefe Lab |
| **Entrada** | Amostra bruta | ADN isolado | ADN amplificado |
| **Saída** | ADN puro | ADN copiado (amplificado) | Alelos (perfil genético) |
| **Falha comum** | Material insuficiente | Degradação ADN | Baixa qualidade sequência |
| **Ação se falhar** | Nova coleta | Reextrair | Reampliflicar |

---

## 🔄 Fluxo Sequencial (MVP: Transições Manuais)

### Estado Geral do Caso

```
AMOSTRA_RECEBIDA
     ↓
EM_EXTRACAO (contém Fase 1, 2, 3)
  ├─ Fase 1: EXTRACAO
  ├─ Fase 2: AMPLIFICACAO
  └─ Fase 3: SEQUENCIAMENTO
     ↓
EXTRACAO_CONCLUIDA (quando todas 3 fases ✅)
```

### Pseudocódigo: Fluxo Sequencial (Obrigatório)

```php
// ExtracaoService.php
public function iniciarExtracao(Caso $caso): Extracao
{
    // Validações
    if ($caso->status !== 'AMOSTRA_RECEBIDA') {
        throw new StatusInvalidoException("Caso deve estar em AMOSTRA_RECEBIDA");
    }
    
    // Caso avança para EM_EXTRACAO (agora)
    $caso->update(['status' => 'EM_EXTRACAO']);
    
    // Criar registro de extração (Fase 1)
    $extracao = Extracao::create([
        'caso_id' => $caso->id,
        'fase' => 'EXTRACAO',        // Inicia em Fase 1
        'status' => 'EM_PROGRESSO',
        'data_inicio' => now(),
        'tecnico_id' => auth()->id(),
    ]);
    
    event(new ExtracaoIniciada($extracao));
    return $extracao;
}

public function finalizarFase(Extracao $extracao, array $resultado): void
{
    $fase_atual = $extracao->fase;
    
    // Validar resultado
    $this->validarResultadoFase($fase_atual, $resultado);
    
    // Salvar resultado
    $extracao->resultado()->create([
        'fase' => $fase_atual,
        'dados' => $resultado,
        'data_conclusao' => now(),
    ]);
    
    // Próxima fase (sequencial)
    $proxima_fase = $this->getProximaFase($fase_atual);
    
    if ($proxima_fase) {
        // Ainda há fases: transição manual, não automática (MVP)
        $extracao->update([
            'fase' => $proxima_fase,
            'status' => 'AGUARDANDO_VALIDACAO',
        ]);
        
        event(new FaseFinalizadaAguardandoValidacao($extracao));
    } else {
        // Todas as 3 fases concluídas
        $extracao->update(['status' => 'COMPLETO']);
        $caso->update(['status' => 'EXTRACAO_CONCLUIDA']);
        
        event(new ExtracacaoCompletaAguardandoValidacao($extracao));
    }
}

public function validarFase(Extracao $extracao, Usuario $validador): void
{
    // Apenas supervisor ou médico pode validar
    if ($extracao->fase === 'SEQUENCIAMENTO') {
        if (!$validador->can('validar.laudo')) {
            throw new PermissaoException("Apenas médicos podem validar sequenciamento");
        }
    } else {
        if (!$validador->can('validar.extracao')) {
            throw new PermissaoException("Apenas supervisores podem validar extração");
        }
    }
    
    $extracao->update([
        'status' => 'VALIDADO',
        'validador_id' => $validador->id,
        'data_validacao' => now(),
    ]);
    
    event(new FaseValidada($extracao));
}
```

---

## 🔬 FASE 1: EXTRAÇÃO

### Objetivo
Isolar ADN puro da amostra biológica (sangue, saliva, tecido, etc).

### Entrada
- Amostra bruta (material biológico)
- Kit de extração (reagentes, equipamentos)
- Protocolo de extração (padrão do lab)

### Processo

```
1. Preparar amostra (limpar, medir volume)
2. Aplicar reagentes de lise (quebram células)
3. Separar ADN de resíduos celulares (centrifugação)
4. Purificar ADN (remover proteínas, sais)
5. Quantificar ADN (medir concentração)
6. Validar qualidade (razão 260/280 nm)
7. Armazenar em tubo apropriado (-20°C ou -80°C)
```

### Saída & Validação

```
Resultado esperado:
├─ Concentração ADN: 50-500 ng/µL (nanogramas/microlitro)
├─ Qualidade (A260/A280): 1.7-1.9 (ideal)
├─ Volume disponível: ≥ 50 µL
├─ Nota do técnico: observações sobre amostra
└─ Foto/registro: comprovante do tubo

Validação (Supervisor):
├─ Verificar concentração está na faixa
├─ Confirmar qualidade aceitável
├─ Aprovar ou solicitar reextração
└─ Assinar resultado
```

### Status de Fase 1

```
EM_PROGRESSO       Técnico está executando extração
CONCLUIDO          Técnico terminou, aguardando validação
VALIDADO           Supervisor aprovou resultado
FALHOU             Amostra insuficiente ou degradada
REEXTRAINDO        Nova tentativa em andamento
```

### Validações da Fase 1

```
✓ Amostra presente e em bom estado
✓ Concentração ADN dentro da faixa (50-500 ng/µL)
✓ Qualidade (A260/A280) > 1.7
✓ Volume suficiente (≥ 50 µL)
✓ Tubo de armazenamento apropriado
✓ Registros de temperatura mantidos
✗ Material insuficiente → solicitar nova coleta
✗ ADN degradado → nova coleta ou reextração
```

### Falhas Comuns & Ações

```
Falha: "Concentração baixa (< 30 ng/µL)"
└─ Ação: Reextrair do mesmo tubo ou solicitar nova amostra

Falha: "ADN degradado (muitos fragmentos pequenos)"
└─ Ação: Solicitar nova amostra (original estava degradada)

Falha: "Contaminação (muitas proteínas, A260/A280 < 1.5)"
└─ Ação: Refazer extração com protocolo de limpeza extra

Falha: "Volume insuficiente"
└─ Ação: Solicitar nova coleta (amostra não era adequada)
```

---

## 🧬 FASE 2: AMPLIFICAÇÃO

### Objetivo
Fazer cópias de regiões específicas do ADN (marcadores genéticos) via PCR.

### Entrada
- ADN puro (resultado da Fase 1)
- Primers (sondas de DNA que marcam regiões)
- Reagentes PCR (Taq polimerase, dNTPs, buffer)
- Equipamento: Termociclador

### Processo

```
1. Preparar mix PCR (combinar ADN + primers + reagentes)
2. Programar ciclos de temperatura:
   - Desnaturação (94-95°C): separar fitas de ADN
   - Annealing (55-65°C): primers se ligam às regiões-alvo
   - Extensão (72°C): Taq polimerase copia a sequência
   - Repetir 25-35 ciclos (cada ciclo duplica a quantidade)
3. Arrefecer e verificar produto PCR (agarose gel)
4. Quantificar produto amplificado
5. Armazenar a -20°C
```

### Saída & Validação

```
Resultado esperado:
├─ Banda no gel (confirmação de amplificação)
├─ Tamanho correto para cada marcador (ex: 100-200 bp)
├─ Intensidade da banda (não muito fraca, não muito forte)
├─ Produto em quantidade suficiente para sequenciar
└─ Sem contaminação ou bandas espúrias

Validação (Supervisor):
├─ Visualizar gel: banda presente e tamanho correto
├─ Confirmar quantidade adequada
├─ Aprovar ou solicitar re-PCR
└─ Assinar resultado
```

### Status de Fase 2

```
EM_PROGRESSO       Técnico está executando PCR
CONCLUIDO          PCR terminou, aguardando validação
VALIDADO           Supervisor aprovou gel/resultado
FALHOU             PCR não amplificou ou amplificação fraca
REEXECUTANDO       Novo ciclo PCR em andamento
```

### Validações da Fase 2

```
✓ ADN molde de qualidade (da Fase 1)
✓ Primers específicos para marcadores requeridos
✓ Banda visível no gel (amplificação bem-sucedida)
✓ Tamanho da banda correto (dentro de ±5 bp de esperado)
✓ Intensidade adequada (não muito fraca)
✓ Sem bandas múltiplas não-específicas
✓ Sem contaminação (agarose gel limpo)
✗ Amplificação fraca → re-PCR com primers ajustados
✗ Sem banda → re-PCR ou nova extração se ADN inicial era fraco
✗ Bandas múltiplas → refazer com ajuste de temperatura
```

### Falhas Comuns & Ações

```
Falha: "Sem amplificação (nenhuma banda no gel)"
└─ Ação: Verificar ADN molde (Fase 1), re-PCR se ADN OK

Falha: "Amplificação fraca (banda muito leve)"
└─ Ação: Re-PCR com mais ciclos (aumentar de 30 para 35 ciclos)

Falha: "Bandas múltiplas / inespecíficas"
└─ Ação: Aumentar temperatura annealing (reduz non-specific binding)

Falha: "Contaminação no gel"
└─ Ação: Refazer reagentes e equipamento esterilizado
```

---

## 🧪 FASE 3: SEQUENCIAMENTO

### Objetivo
Determinar a sequência exata de bases (A, T, G, C) e gerar perfil de alelos.

### Entrada
- ADN amplificado (resultado da Fase 2)
- Sondas fluorescentes (marcam cada base com cor)
- Equipamento: Sequenciador (ABI, Illumina, etc)

### Processo

```
1. Preparar amostra PCR para sequenciador
2. Carregar no sequenciador (placa de 96 poços)
3. Executar protocolo de sequenciamento:
   - Separação por tamanho (eletroforese capilar)
   - Leitura de fluorescência (uma base por vez)
   - Geração de eletroferograma (gráfico de picos)
4. Analisar resultado:
   - Picos altos = bases bem lidas
   - Picos baixos / ruído = baixa qualidade
5. Chamar alelos (interpreter faz leitura: "13,15" para marcador D8S1179)
6. Gerar relatório de alelos
```

### Saída & Validação

```
Resultado esperado:
├─ Eletroferograma com picos claros para cada alelo
├─ Qualidade de leitura > 95% (Q > 25)
├─ Alelos chamados para todos os marcadores (15-20 marcadores STR)
├─ Perfil genético completo (ex: D8S1179: 13,15 | D21S11: 29,32 | ...)
├─ Confirmação: alelos repetíveis (replicata)
└─ Sem ambiguidades ou artefatos

Validação (Médico/Chefe Lab):
├─ Revisar eletroferograma: qualidade de picos
├─ Confirmar chamadas de alelos (corretas e claras)
├─ Comparar com replicata (se disponível): match perfeito
├─ Aprovar perfil ou solicitar re-sequenciamento
└─ Assinar validação (prepara para análise/laudo)
```

### Status de Fase 3

```
EM_PROGRESSO       Sequenciador está executando
CONCLUIDO          Sequenciamento terminou, awaiting validation
VALIDADO           Médico aprovou perfil genético
FALHOU             Sequência de baixa qualidade ou ambígua
RESEQUENCIANDO     Nova corrida de sequenciamento
```

### Validações da Fase 3

```
✓ ADN amplificado de qualidade (da Fase 2)
✓ Eletroferograma com picos claros (não muito ruído)
✓ Qualidade de leitura ≥ 95% (Q ≥ 25)
✓ Alelos presentes para todos os marcadores obrigatórios
✓ Alelos dentro de range esperado para população
✓ Replicata (se existe): match 100% com primeira amostra
✓ Sem sinais de mistura (dois perfis misturados)
✗ Qualidade baixa (< 90%) → re-sequenciar
✗ Alelos ambíguos → re-amplificar e re-sequenciar
✗ Possível mistura → investigar coleta
✗ Falha replicata → re-sequenciar ambas
```

### Falhas Comuns & Ações

```
Falha: "Qualidade de sequência baixa (muita linha de base de ruído)"
└─ Ação: Re-amplificar e re-sequenciar

Falha: "Alguns alelos não aparecem (dropout parcial)"
└─ Ação: Re-amplificar com mais DNA molde

Falha: "Picos múltiplos no mesmo locus (possível mistura genética)"
└─ Ação: Investigar coleta (mistura de sangue de 2 pessoas?) ou artefato

Falha: "Alelo fora da faixa esperada (impossível para população)"
└─ Ação: Verificar calibração do sequenciador, re-sequenciar

Falha: "Replicata não confere (diferença em um alelo)"
└─ Ação: Re-amplificar e re-sequenciar ambas as amostras
```

---

## 📊 Banco de Dados

### Tabela: tb_extracao

```sql
CREATE TABLE extracos (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    caso_id BIGINT NOT NULL,
    
    -- Fases
    fase ENUM('EXTRACAO', 'AMPLIFICACAO', 'SEQUENCIAMENTO') NOT NULL,
    status ENUM('EM_PROGRESSO', 'CONCLUIDO', 'VALIDADO', 'FALHOU', 'REEXECUTANDO')
           DEFAULT 'EM_PROGRESSO',
    
    -- Responsáveis
    tecnico_id BIGINT,                              -- FK para usuarios
    validador_id BIGINT,                            -- FK para usuarios (supervisor/médico)
    
    -- Datas
    data_inicio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_conclusao_fase TIMESTAMP NULL,
    data_validacao TIMESTAMP NULL,
    
    -- Observações
    observacoes_tecnico TEXT,
    observacoes_validador TEXT,
    motivo_falha VARCHAR(255),                      -- Se status = FALHOU
    
    -- Rastreamento
    numero_tentativa INT DEFAULT 1,                 -- 1, 2, 3... se houver reexecução
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY(caso_id) REFERENCES casos(id),
    FOREIGN KEY(tecnico_id) REFERENCES usuarios(id),
    FOREIGN KEY(validador_id) REFERENCES usuarios(id),
    INDEX(caso_id),
    INDEX(fase),
    INDEX(status),
    INDEX(data_inicio)
);
```

### Tabela: tb_extracao_resultado

```sql
CREATE TABLE extracao_resultados (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    extracao_id BIGINT NOT NULL,
    fase VARCHAR(50) NOT NULL,                      -- EXTRACAO, AMPLIFICACAO, SEQUENCIAMENTO
    
    -- Fase 1: EXTRACAO
    concentracao_ng_ul DECIMAL(8,2),               -- nanogramas/microlitro
    qualidade_a260_a280 DECIMAL(4,2),              -- razão
    volume_ul INT,                                  -- microlitro
    
    -- Fase 2: AMPLIFICACAO
    banda_presente BOOLEAN,
    tamanho_bp INT,                                 -- base pairs
    intensidade VARCHAR(20),                        -- FORTE, MEDIA, FRACA
    
    -- Fase 3: SEQUENCIAMENTO
    qualidade_sequencia DECIMAL(5,2),              -- 0-100%
    eletroferograma_url VARCHAR(255),              -- link para arquivo
    
    -- Alelos (JSON ou relacionamento N:N)
    alelos JSON,                                    -- ex: {"D8S1179": "13,15", "D21S11": "29,32", ...}
    
    data_resultado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY(extracao_id) REFERENCES extracos(id),
    INDEX(extracao_id),
    INDEX(fase)
);
```

### Tabela: tb_alelos

```sql
CREATE TABLE alelos (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    extracao_id BIGINT NOT NULL,
    marcador VARCHAR(50) NOT NULL,                 -- D8S1179, D21S11, etc
    alelo_1 VARCHAR(10),                           -- primeiro alelo (ex: "13")
    alelo_2 VARCHAR(10),                           -- segundo alelo (ex: "15")
    homozigoto BOOLEAN,                            -- true se alelo_1 == alelo_2
    
    FOREIGN KEY(extracao_id) REFERENCES extracos(id),
    UNIQUE KEY (extracao_id, marcador),
    INDEX(marcador)
);
```

### Tabela: tb_mapa_extampli (Extração × Amplificação × Sequenciamento)

```sql
CREATE TABLE mapa_extampli (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    extracao_id BIGINT NOT NULL,
    
    -- Rastreamento de todas 3 fases para 1 caso
    fase_extracao_id BIGINT,                       -- FK tb_extracao (EXTRACAO)
    fase_amplificacao_id BIGINT,                   -- FK tb_extracao (AMPLIFICACAO)
    fase_sequenciamento_id BIGINT,                 -- FK tb_extracao (SEQUENCIAMENTO)
    
    -- Status agregado
    status_geral ENUM('EM_PROGRESSO', 'COMPLETO', 'FALHOU'),
    percentual_conclusao INT DEFAULT 0,            -- 0, 33, 66, 100
    
    -- Datas
    data_inicio TIMESTAMP,
    data_finalizacao TIMESTAMP NULL,
    dias_duracao INT,
    
    -- Lote
    lote_numero INT,                               -- para agrupar várias extrações
    data_lote TIMESTAMP,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY(extracao_id) REFERENCES casos(id),
    FOREIGN KEY(fase_extracao_id) REFERENCES extracos(id),
    FOREIGN KEY(fase_amplificacao_id) REFERENCES extracos(id),
    FOREIGN KEY(fase_sequenciamento_id) REFERENCES extracos(id),
    INDEX(status_geral),
    INDEX(data_lote)
);
```

---

## 🔐 Validadores & Responsáveis

### Fase 1 (Extração)

- **Responsável**: Técnico de Lab
- **Validador**: Supervisor de Lab
- **Permissão necessária**: `iniciar.extracao`, `concluir.fase1`
- **Validador pode**: `validar.extracao`

### Fase 2 (Amplificação)

- **Responsável**: Técnico de Lab
- **Validador**: Supervisor de Lab
- **Permissão necessária**: `iniciar.amplificacao`, `concluir.fase2`
- **Validador pode**: `validar.amplificacao`

### Fase 3 (Sequenciamento)

- **Responsável**: Técnico de Lab (roda equipamento)
- **Validador**: Médico / Chefe de Lab
- **Permissão necessária**: `iniciar.sequenciamento`, `concluir.fase3`
- **Validador pode**: `validar.laudo`, `chamar.alelos`

---

## 🔄 Transições Sequenciais (MVP: Manuais)

```
Caso em AMOSTRA_RECEBIDA
    ↓ (usuário clica "Iniciar Extração")
Fase 1: EXTRACAO — EM_PROGRESSO
    ↓ (técnico conclui, clica "Finalizar Fase 1")
Fase 1: EXTRACAO — CONCLUIDO (aguardando supervisor)
    ↓ (supervisor revisa, clica "Validar")
Fase 1: EXTRACAO — VALIDADO
    ↓ (usuário clica "Avançar para Amplificação" — MANUAL)
Fase 2: AMPLIFICACAO — EM_PROGRESSO
    ↓ (técnico conclui)
Fase 2: AMPLIFICACAO — CONCLUIDO (aguardando supervisor)
    ↓ (supervisor valida)
Fase 2: AMPLIFICACAO — VALIDADO
    ↓ (usuário clica "Avançar para Sequenciamento" — MANUAL)
Fase 3: SEQUENCIAMENTO — EM_PROGRESSO
    ↓ (técnico + sequenciador executa)
Fase 3: SEQUENCIAMENTO — CONCLUIDO (aguardando médico)
    ↓ (médico revisa eletroferograma + alelos)
Fase 3: SEQUENCIAMENTO — VALIDADO
    ↓ (sistema detecta todas 3 fases = VALIDADO)
Caso em EXTRACAO_CONCLUIDA
    ↓ (próximo: caso avança para EM_ANALISE)
```

**Future (Fase 2+)**:
- Automação: `VALIDADO fase N` → auto-dispara `EM_PROGRESSO fase N+1`
- Cron job: monitora fase 1,2,3 e cobra conclusão se > 2 dias

---

## ✅ Validações Completas por Fase

### Antes de Iniciar Fase 1
```
✓ Caso status = AMOSTRA_RECEBIDA
✓ Amostra registrada e armazenada
✓ Técnico existe e está ativo
✓ Nenhuma extração em andamento para este caso
```

### Fase 1: Antes de Finalizar
```
✓ Concentração ADN medida (ng/µL) e registrada
✓ Qualidade A260/A280 calculada e dentro da faixa
✓ Volume suficiente (≥ 50 µL)
✓ Técnico preencheu observações (obrigatório se concentração < 100)
✓ Foto/evidência de tubo pode ser anexada
```

### Fase 1: Validação pelo Supervisor
```
✓ Concentração: 50-500 ng/µL
✓ Qualidade: A260/A280 ≥ 1.7
✓ Volume: ≥ 50 µL
✓ Aprovado ou Rejeitado (com motivo)
✓ Assinatura digital (se sistema de assinatura)
```

### Fase 2: Antes de Finalizar
```
✓ Gel de agarose executado
✓ Foto do gel anexada ao resultado
✓ Banda(s) visualizada(s) no tamanho esperado
✓ Intensidade registrada (FORTE/MEDIA/FRACA)
✓ Volume de produto PCR suficiente para sequenciar
```

### Fase 2: Validação pelo Supervisor
```
✓ Banda presente no tamanho esperado (±5 bp)
✓ Sem bandas múltiplas inespecíficas
✓ Intensidade adequada (não muito fraca)
✓ Gel limpo (sem contaminação)
✓ Aprovado ou Rejeitado
```

### Fase 3: Antes de Finalizar
```
✓ Sequenciador completou corrida
✓ Eletroferograma gerado e visível
✓ Alelos chamados para todos os marcadores
✓ Qualidade de sequência registrada (%)
✓ Replicata (se existe): comparada com primeira amostra
```

### Fase 3: Validação pelo Médico
```
✓ Eletroferograma: qualidade de picos ≥ 95%
✓ Sem ruído excessivo
✓ Alelos claros e únicos para cada marcador
✓ Alelos dentro do range esperado para população
✓ Replicata: match 100% (se existe)
✓ Sem sinais de mistura genética
✓ Aprovado ou Rejeitado (com motivo)
```

---

## 🚫 Falhas & Recuperação

### Falha em Fase 1

```
Cenário: Concentração ADN é 20 ng/µL (abaixo de 50)

Opção 1: Reextrair
└─ Criar nova Extracao com numero_tentativa = 2
└─ Usar mesmo tubo, executar extração novamente
└─ Se sucesso: validar e avançar
└─ Se falhar novamente: motivo_falha = "Material insuficiente", solicitar nova coleta

Opção 2: Solicitar Nova Coleta
└─ Caso volta para COLETA_AGENDADA
└─ Histórico: "Extração falhou, nova coleta necessária"
└─ Coletador agenda nova coleta
```

### Falha em Fase 2

```
Cenário: PCR não amplificou (nenhuma banda no gel)

Opção 1: Re-PCR (mesmo ADN)
└─ Criar nova Extracao fase=AMPLIFICACAO, numero_tentativa = 2
└─ Usar ADN da Fase 1 anterior
└─ Se sucesso: validar e avançar
└─ Se falhar 3x: motivo_falha = "ADN molde insuficiente", voltar para Fase 1

Opção 2: Refazer Fase 1
└─ Fase 1 anterior volta para REEXTRAINDO
└─ Técnico executa extração novamente
└─ Se ADN extraído melhor: voltar para Fase 2 novo
```

### Falha em Fase 3

```
Cenário: Qualidade de sequência é 85% (abaixo de 95%)

Opção 1: Re-sequenciar
└─ Criar nova Extracao fase=SEQUENCIAMENTO, numero_tentativa = 2
└─ Usar ADN amplificado anterior (Fase 2)
└─ Se sucesso: validar
└─ Se falhar 2x: voltar para Fase 2 (re-amplificar)

Opção 2: Refazer Amplificação
└─ Fase 2 anterior volta para REEXECUTANDO
└─ Técnico executa novo PCR
└─ Se produto melhor: voltar para Fase 3 novo
```

---

## 📈 Relatórios Disponíveis

### Relatório 1: Status de Extrações (Dia)

```
Filtros: data, tecnico_id, fase

Colunas:
├─ Caso: processo_id, juiz
├─ Fase: EXTRACAO/AMPLIFICACAO/SEQUENCIAMENTO
├─ Status: EM_PROGRESSO/CONCLUIDO/VALIDADO/FALHOU
├─ Técnico: nome
├─ Duração (horas)
├─ Tentativa: 1, 2, 3...
└─ Próximo passo

Agregações:
├─ Total por fase
├─ Taxa de sucesso por fase (%)
├─ Tempo médio por fase
└─ Gargalos identificados
```

### Relatório 2: Extrações em Atraso

```
Filtros: data_inicio_antes_de, fase

Colunas:
├─ Caso: processo_id, data_finalizacao_esperada
├─ Fase: fase atual
├─ Dias em atraso
├─ Responsável/Validador
├─ Última ação: quando
└─ Motivo potencial

Alertas:
├─ Casos > 5 dias na mesma fase
├─ Validações pendentes > 2 dias
└─ Tentativas falhadas > 2 vezes
```

### Relatório 3: Performance por Técnico

```
Filtros: data_inicio, data_fim, tecnico_id

Colunas:
├─ Técnico: nome, especialidade
├─ Quantidade de extrações/amplificações completadas
├─ Taxa de sucesso (1ª tentativa %)
├─ Tempo médio por caso
├─ Retrabalho (% que precisaram reexecução)
├─ Qualidade média (se fase 3: qualidade sequência)
└─ Score geral

Ordenação: por taxa sucesso (desc)
```

---

## 🔍 Queries Comuns (Repository)

### ExtracaoRepository

```php
// Buscar
public function findById(int $id): ?Extracao
public function findByCaso(Caso $caso): Collection
public function findByFase(string $fase): Collection

// Listar
public function findEmProgresso(): Collection
public function findAguardandoValidacao(): Collection
public function findFalhadas(): Collection

// Busca avançada
public function search(array $filtros): Collection
  // Filtros: caso_id, tecnico_id, validador_id, fase, status, data_inicio_de, data_ate

// Durações & métricas
public function diasDecorridos(Extracao $extracao): int
public function tempoMedioPorFase(string $fase): float
public function taxaSucessoPorFase(string $fase): float
public function proximaFase(Extracao $extracao): string

// Criar/atualizar
public function create(array $dados): Extracao
public function update(Extracao $extracao, array $dados): Extracao
public function marcarFalha(Extracao $extracao, string $motivo): void
public function marcarValidada(Extracao $extracao, Usuario $validador): void
```

### AleloRepository

```php
// Buscar
public function findByExtracao(Extracao $extracao): Collection
public function findByMarcador(string $marcador): Collection

// Busca por perfil (matching genético — para análise forense)
public function findMatch(Collection $alelos): Collection
  // Retorna perfis que batem com os alelos passados

// Criar
public function create(Extracao $extracao, array $alelos): Collection
```

---

## 📧 Notificações & Eventos

| Evento | Destinatário | Conteúdo |
|--------|-------------|----------|
| **Fase Concluída** | Validador | "Fase 1 (Extração) concluída — aguardando validação: caso #123" |
| **Fase Validada** | Técnico (Fase 2) | "Fase 1 validada — inicie Amplificação: caso #123" |
| **Fase Falhou** | Gestor + Técnico | "Fase 2 falhou — motivo: Amplificação fraca. Reinicie?" |
| **Todas 3 Fases OK** | Médico | "Extração completa — alelos prontos para análise: caso #123" |
| **Replicata Divergiu** | Médico | "AVISO: Replicata não confere — revisar qualidade" |

---

## 🎯 Exemplo: Fluxo Completo de Extração

```
2026-10-16 08:00
└─ Caso estado: AMOSTRA_RECEBIDA
└─ Técnico Pedro inicia extração (clica "Iniciar Extração Fase 1")

2026-10-17 09:00
└─ Fase 1 concluída por Pedro
└─ Resultado: Concentração 250 ng/µL, Qualidade 1.8, Volume 100 µL
└─ Status: CONCLUIDO (aguardando validação)

2026-10-17 10:00
└─ Supervisor Silva revisa resultado
└─ Aprova: Concentração OK, qualidade OK, volume OK
└─ Clica "Validar Fase 1"
└─ Status: VALIDADO
└─ Notificação para Pedro: "Fase 1 validada — pronto para Amplificação"

2026-10-17 11:00
└─ Pedro clica "Avançar para Fase 2: Amplificação"
└─ Fase 2 inicia (EM_PROGRESSO)

2026-10-17 14:30
└─ PCR termina, Pedro visualiza gel
└─ Foto do gel: banda clara em 150 bp (esperado: 145-155 bp)
└─ Intensidade: FORTE
└─ Conclusão Fase 2: CONCLUIDO

2026-10-17 15:00
└─ Supervisor Silva revisa gel
└─ Aprova: Banda em tamanho correto, sem bandas espúrias, intensidade boa
└─ Clica "Validar Fase 2"
└─ Status: VALIDADO

2026-10-17 15:30
└─ Pedro clica "Avançar para Fase 3: Sequenciamento"
└─ Fase 3 inicia (EM_PROGRESSO)

2026-10-17 19:00
└─ Sequenciador completa corrida
└─ Eletroferograma gerado
└─ Sistema chama alelos automaticamente:
   D8S1179: 13,15
   D21S11: 29,32
   D7S820: 7,10
   ... (18 marcadores total)
└─ Qualidade: 97%
└─ Replicata (amostra duplicada): Checa contra replicata
   └─ Resultado: 100% match ✓
└─ Status: CONCLUIDO

2026-10-17 20:00
└─ Médica Dra. Ana revisa eletroferograma
└─ Analisa: Picos claros, qualidade 97%, alelos bem definidos
└─ Replicata: confere perfeito
└─ Aprova: "Perfil genético validado, pronto para análise e laudo"
└─ Clica "Validar Fase 3"
└─ Status: VALIDADO

2026-10-17 20:05
└─ Sistema detecta: Fases 1, 2, 3 = VALIDADO ✓
└─ Caso status muda para: EXTRACAO_CONCLUIDA
└─ Caso avança para: EM_ANALISE (próximo: emissão de laudo)
└─ Notificação para Dra. Ana: "Extração finalizada — inicie análise/comparação genética"
└─ Histórico: "EXTRACAO_CONCLUIDA — alelos: D8S1179: 13,15 | D21S11: 29,32 | ..."
```

---

## ⚠️ Casos Especiais

### 1. Mistura Genética Detectada

Se na Fase 3, há picos múltiplos sugestivos de 2 pessoas:
- Marcar resultado: `tipo_resultado = "MISTURA_GENETICA"`
- Notificar médico: "Possível mistura — revisar coleta"
- Caso: voltar a COLETA_AGENDADA (nova coleta necessária)
- Log: registrar investigação

### 2. Replicata Diverge

Se replicata (amostra duplicada) não bate com original:
- Motivos: erro técnico, contaminação, degradação seletiva
- Ação: Re-amplificar e re-sequenciar ambas
- Se concordância continua baixa: marcar resultado como "INCONCLUSIVO"
- Médico decide: nova coleta ou análise como está (em pior cenário)

### 3. Amostra Degradada (Detectada em Fase 1)

Se ADN está muito fragmentado ou degradado:
- A260/A280 < 1.5 ou muitos pequenos fragmentos
- Opção 1: Tentar reextração (pode melhorar)
- Opção 2: Solicitar nova coleta (original estava ruim)
- Caso: volta para COLETA_AGENDADA

### 4. Projeto de Pesquisa / Controle Positivo

Casos especiais (não pacientes reais):
- Usar como "controle positivo" (amostra de qualidade conhecida)
- Registrar em histórico: "Controle Positivo — não afeta caso real"
- Pode ser reutilizado para validar protocolos

---

## 📞 Próximos Documentos (Fase 3)

- **REGRAS-NEGOCIO-SCEI.md** — Módulo laboratório (exames, procedimentos, laudos)
- **DECISOES.md** — Log de decisões arquiteturais
- Fase 4: Laravel scaffolding + migrations

