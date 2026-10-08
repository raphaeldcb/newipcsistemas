# Implementação Completa — SCPG Unificado

**Data**: 2026-10-07  
**Escopo**: 10 módulos + Relatórios + Menu Testes  
**Stack**: Laravel 13 + Blade + Vite + MySQL 8.3  
**Status**: Design aprovado → Pronto para plano de implementação

---

## 1. Visão Geral

Implementar telas web, CRUD completo, funcionalidades com regras de negócio, e relatórios para o SCPG unificado.

**Módulos**: Comunicações, Casos, Pessoas, Kits, Extrações, SCEI, Créditos, Alelos, Relatórios, Admin  
**Formatos**: Web (Blade), API REST (já existe), Relatórios (PDF + Excel + Charts)  
**Validações**: State machine, cálculos, soft deletes, auditoria

---

## 2. Arquitetura

### 2.1 Estrutura de Pastas

```
api/
├── app/
│   ├── Http/Controllers/Web/
│   │   ├── ComunicacoesController.php
│   │   ├── CasosController.php
│   │   ├── PessoasController.php
│   │   ├── KitsController.php
│   │   ├── ExtracaosController.php
│   │   ├── SceiController.php
│   │   ├── CreditosController.php
│   │   ├── AlelosController.php
│   │   ├── RelatoriosController.php
│   │   └── AdminController.php
│   ├── Services/
│   │   ├── ClassificacaoService.php (já existe)
│   │   ├── EstadoCasoService.php (state machine)
│   │   ├── CalculoCreditoService.php (5-fator)
│   │   ├── ExtracacaoService.php
│   │   ├── RelatorioService.php
│   │   └── AuditoriaService.php
│   ├── Repositories/
│   │   ├── CasoRepository.php
│   │   ├── PessoaRepository.php
│   │   └── ... (1 per módulo)
│   └── Enums/
│       ├── CasoStatus.php (ABERTO, JULGADO, ENCERRADO, etc.)
│       ├── CreditoStatus.php
│       ├── ExtracacaoFase.php
│       └── ...
├── resources/views/
│   ├── comunicacoes/ (index, show, create, edit, detalhe)
│   ├── casos/ (idem)
│   ├── pessoas/ (idem)
│   ├── kits/ (idem)
│   ├── extracos/ (idem)
│   ├── scei/ (idem)
│   ├── creditos/ (idem)
│   ├── alelos/ (idem)
│   ├── relatorios/ (lista, view, download)
│   ├── admin/ (dashboard, testes, usuários)
│   └── layouts/app.blade.php (menu unificado)
├── routes/
│   ├── web.php (10 módulos + admin)
│   └── api.php (já existe)
└── database/
    └── factories/ (seeders de teste para todos módulos)
```

### 2.2 Padrões

- **Controllers Web**: CRUD padrão (index, show, create, store, edit, update, destroy)
- **Services**: Lógica de validação, state machine, cálculos
- **Repositories**: Camada de dados (queries, filtros)
- **Soft Deletes**: Todos os modelos
- **Auditoria**: Event sourcing em mudanças críticas

---

## 3. Módulos & Funcionalidades

### 3.1 Comunicações
- **CRUD**: index, show, create, update, delete
- **Classificação**: Ollama/Qwen (já existe) + fallback
- **Respostas**: templates + agendamento
- **Filtros**: por classification, caso, data, remetente
- **Validações**: email válido, corpo não vazio

### 3.2 Casos
- **CRUD**: index, show, create, update, delete
- **State Machine**: ABERTO → JULGADO → ENCERRADO (transições validadas)
- **Partes**: relacionamentos com Pessoas
- **Comunicações**: link automático
- **Timeline**: histórico de mudanças

### 3.3 Pessoas
- **CRUD**: index, show, create, update, delete
- **Tipos**: Física / Jurídica
- **Endereços**: múltiplos (residencial, comercial, etc.)
- **Contatos**: phone, email
- **Documentos**: CPF/CNPJ, RG, etc.

### 3.4 Kits
- **CRUD**: index, show, create, update, delete
- **Composição**: itens do kit
- **Status**: PREPARADO, EM_ANALISE, PROCESSADO
- **Rastreamento**: lote, data envio

### 3.5 Extrações
- **CRUD**: index, show, create, update, delete
- **3 Fases**: Quantificação, Qualificação, Interpretação
- **Acompanhamento**: status por fase
- **Resultados**: upload de arquivos

### 3.6 SCEI
- **CRUD**: index, show, create, update, delete
- **Laboratório**: amostra, exame, resultado
- **Validações**: exame válido, resultado numérico

### 3.7 Créditos
- **CRUD**: index, show, create, update, delete
- **Cálculo 5-fator**: valor base × 5 componentes
- **Parcelamento**: schedule de pagamentos
- **Status**: PENDENTE, PAGO, VENCIDO, CANCELADO

### 3.8 Alelos
- **CRUD**: index, show, create, update, delete
- **Marcadores**: relacionamentos
- **Genótipo**: composição

### 3.9 Relatórios
- **Tipos**: Comunicações (por classificação), Casos (por status), Créditos (5-fator), Extrações (por fase)
- **Formatos**: PDF (TCPDF), Excel (PhpSpreadsheet), Dashboard (Chart.js)
- **Filtros**: data, status, pessoas, etc.
- **Agendamento**: download ou email

### 3.10 Admin
- **Dashboard**: KPIs, últimas entradas, alertas
- **Usuários**: CRUD (criar, editar, deletar, roles)
- **Menu Testes**: Links para testar cada módulo
- **Auditoria**: log de mudanças por usuário/data
- **Configurações**: sistema, email, etc.

---

## 4. Views & Templates

**Padrão por módulo** (exemplo Comunicações):
```
comunicacoes/
├── index.blade.php       (listagem com filtros)
├── show.blade.php        (detalhe completo)
├── create.blade.php      (formulário novo)
├── edit.blade.php        (formulário edição)
└── _form.blade.php       (form compartilhado create+edit)
```

**Componentes reutilizáveis**:
- Modals (delete, confirm)
- Filters (data range, status, search)
- Pagination
- Badges (status, classification)
- Buttons (CRUD)

---

## 5. Validações & Regras de Negócio

### 5.1 Casos (State Machine)
```
ABERTO → (juiz julga) → JULGADO → (encerramento) → ENCERRADO
        ↓ (cancelamento)
      CANCELADO
```

- Transições validadas no EstadoCasoService
- Auditoria de cada mudança
- Soft delete (não remove física)

### 5.2 Créditos (5-Fator)
```
Valor Final = Valor Base × (Fator1 + Fator2 + Fator3 + Fator4 + Fator5)
```

- Fatores são percentuais ou multiplicadores
- Cálculo em CalculoCreditoService
- Parcelamento automático

### 5.3 Soft Deletes & Auditoria
- Todos os modelos usam `SoftDeletes`
- Event listeners no Model: `created`, `updated`, `deleted`
- Auditoria em tb_auditoria com user_id, action, model, timestamp

---

## 6. Relatórios

### 6.1 PDF (TCPDF)
- Header: logo + data
- Body: tabela/gráficos
- Footer: página/total

### 6.2 Excel (PhpSpreadsheet)
- Abas por módulo
- Formatação (cores, borders)
- Charts inline

### 6.3 Dashboard (Chart.js/ECharts)
- Gráficos em tempo real
- Filtros interativos
- Export button (PDF/Excel)

---

## 7. Menu Testes (Admin)

**Layout**:
```
Admin > Menu Testes
├── Comunicações (link → /comunicacoes)
├── Casos (link → /casos)
├── Pessoas (link → /pessoas)
├── Kits, Extrações, SCEI, Créditos, Alelos (idem)
└── Gerador de dados (seed 100 registros de teste)
```

- Link direto para index de cada módulo
- Botão "Gerar Dados de Teste" → popula com Factory
- Logs de teste (criado X, atualizado Y, deletado Z)

---

## 8. Validações & Error Handling

- **Form Requests**: validação em nivel de Request (Laravel)
- **Service Layer**: validações de regra de negócio
- **API**: resposta 422 com erros detalhados
- **Web**: sessão flash com mensagens (success, error, warning)

---

## 9. Testing

- **Feature Tests**: 1 test per módulo (CRUD básico)
- **Unit Tests**: Services (state machine, cálculos)
- **Cobertura**: 80%+ por módulo

---

## 10. Cronograma Estimado

- **Semana 1**: Comunicações, Casos, Pessoas (CRUD + views)
- **Semana 2**: Kits, Extrações, SCEI (idem)
- **Semana 3**: Créditos (5-fator), Alelos (idem)
- **Semana 4**: Relatórios (PDF, Excel, Charts)
- **Semana 5**: Admin (dashboard, testes, usuários)
- **Semana 6**: Refinamento, testes, documentação

---

## Aprovações

- Design: ✅ Aprovado (2026-10-07)
- Próximo: Plano de implementação detalhado
