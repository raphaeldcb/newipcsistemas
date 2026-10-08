# Task 5.1 — Extrações Web CRUD com 3 Fases

## Status: ✅ Completo

### Resumo Executivo

Task 5.1 implementa o CRUD web completo para o módulo **Extrações** com fluxo de 3 fases: Quantificação, Qualificação, Interpretação. O padrão segue a estrutura estabelecida em Comunicações, com Controller + FormRequest + Views + Routes.

---

## Implementação

### 1. Modelo & Banco de Dados

**Arquivo**: `/api/app/Models/Extracao.php`

- ✅ Model atualizado com fillable para novos campos
- ✅ Soft deletes habilitados
- ✅ Timestamps (created_at, updated_at, deleted_at)
- ✅ Relação `extracacaocasos()` mantida

**Campos Adicionados** (Migration `2026_10_08_023242_*`):
- `amostra_id` (unsigned bigInteger, nullable)
- `fase` (enum: QUANTIFICACAO, QUALIFICACAO, INTERPRETACAO)
- `status` (string, default: PENDENTE)
- `resultado` (text, nullable)
- `data_fase` (dateTime, nullable)
- `observacoes` (text, nullable)

### 2. Enum — Fases

**Arquivo**: `/api/app/Enums/ExtracacaoFaseWeb.php`

Define as 3 fases do fluxo de extração:
- `QUANTIFICACAO` (1º) — Medição de material genético
- `QUALIFICACAO` (2º) — Avaliação de qualidade
- `INTERPRETACAO` (3º) — Análise e relatório

Métodos:
- `label()` — retorna descrição em português
- `ordem()` — sequência lógica das fases
- `all()` — lista todas as fases

### 3. Validação

**Arquivo**: `/api/app/Http/Requests/ExtracacaoRequest.php`

Regras de validação:
- `amostra_id`: nullable, integer, existe em tabela amostras
- `fase`: required, in: [QUANTIFICACAO, QUALIFICACAO, INTERPRETACAO]
- `status`: required, string, max 50 chars
- `resultado`: nullable, string
- `data_fase`: nullable, datetime format Y-m-d H:i
- `observacoes`: nullable, string

Mensagens de erro localizadas em português.

### 4. Controller Web

**Arquivo**: `/api/app/Http/Controllers/Web/ExtracoesController.php`

Implements full CRUD:
- `index()` — Lista com filtros (search, fase, status) + paginação 15 itens
- `create()` — Form novo com dropdown de fases
- `store()` — Salva via FormRequest validado
- `show()` — Detalhes completos com histórico de datas
- `edit()` — Preenchido com dados existentes
- `update()` — Atualiza via PATCH
- `destroy()` — Soft delete com confirmação

Middleware: `auth` (protegido)

### 5. Views (Blade Templates)

**Diretório**: `/api/resources/views/extracos/`

#### `index.blade.php`
- Tabela com colunas: ID, ID Amostra, Fase, Status, Data, Ações
- Filtros: busca por amostra, dropdown de fases, status text
- Botão "+ Nova" linking to create
- Badge badges para fase (info) e status (warning/success)
- Paginação automática

#### `create.blade.php`
- Form post to `extracos.store`
- Reutiliza `_form.blade.php`
- Botões: Salvar / Cancelar

#### `edit.blade.php`
- Form PATCH to `extracos.update`
- Reutiliza `_form.blade.php`
- Mostra ID da extração (#ext_cod)
- Botões: Atualizar / Cancelar

#### `show.blade.php`
- Exibição formatada com detail-rows
- Mostra: ID, amostra_id, fase, status, resultado, observacoes, timestamps
- Botões: Editar / Deletar / Voltar
- CSS inline para layout responsivo

#### `_form.blade.php`
- Componente reutilizável (create + edit)
- Campos: amostra_id, fase (dropdown), status, resultado, data_fase, observacoes
- Validação: exibe `@error` messages inline
- `old()` helper para repopular após validação

### 6. Routing

**Arquivo**: `/api/routes/web.php`

```php
Route::resource('extracos', WebExtracoesController::class);
```

Gera 7 rotas automáticas:
- GET    /extracos              → index
- GET    /extracos/create       → create
- POST   /extracos              → store
- GET    /extracos/{extracao}   → show
- GET    /extracos/{extracao}/edit → edit
- PATCH  /extracos/{extracao}   → update
- DELETE /extracos/{extracao}   → destroy

Middleware: `auth` (applied to authenticated routes group)

---

## Arquitetura

### Padrão MVC

```
Request
  ↓
Route → ExtracoesController (middleware auth)
  ↓
FormRequest (ExtracacaoRequest) — validação
  ↓
Model (Extracao) — DB + relações
  ↓
View (Blade template) — HTML renderizado
```

### Fluxo de Dados

1. **Criar**: form create → POST store → validação → create model → redirect show
2. **Ler**: GET show → load with relationships → render view
3. **Listar**: GET index → query builder + filters → paginate → render view
4. **Atualizar**: form edit → PATCH update → validação → update model → redirect show
5. **Deletar**: form → DELETE destroy → soft delete → redirect index

### Soft Deletes

Extrações deletadas via `destroy()` marcam `deleted_at` sem remover da BD. Queries automáticas excludem registros deletados (adicionado scope padrão do Eloquent).

---

## Campos da Extração

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|------------|-----------|
| ext_cod | ID | Sim | Chave primária |
| amostra_id | BigInt | Não | ID da amostra (referência) |
| fase | Enum | Sim | QUANTIFICACAO \| QUALIFICACAO \| INTERPRETACAO |
| status | String(50) | Sim | Estado: PENDENTE, PROCESSANDO, CONCLUÍDO, ERRO |
| resultado | Text | Não | JSON ou texto com resultado da fase |
| data_fase | DateTime | Não | Timestamp início/fim da fase |
| observacoes | Text | Não | Anotações livre |
| created_at | DateTime | Auto | Criação |
| updated_at | DateTime | Auto | Última edição |
| deleted_at | DateTime | Auto | Soft delete (NULL = ativo) |

---

## Conformidade

✅ **Português do Brasil**: Rótulos, placeholders, mensagens  
✅ **Padrão Laravel 13**: FormRequest, Resource Controller, Soft Deletes, Route::resource  
✅ **Validação**: Field-level via Request, renderização de erros no template  
✅ **Auth**: Middleware `auth` aplicado  
✅ **DB**: Migrations versionadas, reversíveis  
✅ **Views**: Blade, reutilização via componentes (_form)  
✅ **Paginação**: 15 itens/página  

---

## Próximos Passos

1. **Testes**: PHPUnit CRUD feature tests (create, update, delete)
2. **API**: ExtracoesController (API) com JSON responses
3. **Permissões**: Policy para autorizar ações (user_id, ownership)
4. **Auditoria**: Log de mudanças (who, when, what)
5. **Relatorios**: PDF/Excel de extrações por período/fase

---

## Checklist Implementação

- ✅ Migration com 6 novos campos
- ✅ Enum ExtracacaoFaseWeb (3 fases)
- ✅ FormRequest com validação
- ✅ Controller ExtracoesController (CRUD completo)
- ✅ Views: index, create, edit, show, _form
- ✅ Routes: resource routes + auth middleware
- ✅ Model: fillable, casts, relações
- ✅ Soft deletes: trashed() pronto
- ✅ Filtros: search, fase, status
- ✅ Paginação: 15 itens
- ✅ I18n: Português do Brasil

---

**Implementado em**: 2026-10-08  
**Responsável**: Claude Haiku 4.5  
**Branch**: main
