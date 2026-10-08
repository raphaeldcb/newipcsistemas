# Implementação Completa — SCPG Unificado

> **Para agentes:** Use `superpowers:subagent-driven-development` ou `superpowers:executing-plans` para executar task-by-task.

**Goal:** Implementar 10 módulos completos (CRUD + views + validações + relatórios) para o SCPG unificado em Laravel 13.

**Architecture:** Controllers Web + Services (validações) + Blade views + Relatórios (PDF/Excel/Charts) + Menu Testes em Admin

**Tech Stack:** Laravel 13, Blade, Vite, MySQL 8.3, TCPDF, PhpSpreadsheet, Chart.js

## Global Constraints

- **PHP**: 8.3+
- **Laravel**: 13.17+
- **Banco**: sgbd_scpg (MySQL 8.3, InnoDB)
- **Soft deletes**: SoftDeletes trait em todos Models
- **Auditoria**: event listeners (created, updated, deleted)
- **Português BR**: código, comentários, mensagens
- **Sem secrets**: .env.example (variáveis)
- **Testes**: 80%+ cobertura (PHPUnit)
- **Commits**: frequentes (após cada task)

---

# MÓDULO 1: COMUNICAÇÕES

### Task 1.1: Criar vistas de Comunicações (index, show, create, edit)

**Files:**
- Modify: `api/resources/views/comunicacoes/index.blade.php`
- Modify: `api/resources/views/comunicacoes/show.blade.php`
- Create: `api/resources/views/comunicacoes/create.blade.php`
- Create: `api/resources/views/comunicacoes/edit.blade.php`
- Create: `api/resources/views/comunicacoes/_form.blade.php`

**Interfaces:**
- Consumes: Layout `layouts/app.blade.php`, Models Comunicacao, Caso
- Produces: Views com formulários CRUD

**Steps:**

- [ ] **Step 1:** Criar `create.blade.php`
```blade
@extends('layouts.app')
@section('title', 'Nova Comunicação')
@section('page-title', 'Nova Comunicação')
@section('content')
<div class="card">
  <div class="card-header">📧 Nova Comunicação</div>
  <form action="{{ route('comunicacoes.store') }}" method="POST">
    @csrf
    @include('comunicacoes._form')
    <button type="submit" class="btn btn-primary">Salvar</button>
  </form>
</div>
@endsection
```

- [ ] **Step 2:** Criar `_form.blade.php`
```blade
<div class="form-group">
  <label>De:</label>
  <input type="email" name="email_from" value="{{ old('email_from', $comunicacao->email_from ?? '') }}" required>
  @error('email_from') <span class="error">{{ $message }}</span> @enderror
</div>
<div class="form-group">
  <label>Para:</label>
  <input type="email" name="email_to" value="{{ old('email_to', $comunicacao->email_to ?? '') }}" required>
  @error('email_to') <span class="error">{{ $message }}</span> @enderror
</div>
<div class="form-group">
  <label>Assunto:</label>
  <input type="text" name="subject" value="{{ old('subject', $comunicacao->subject ?? '') }}" required>
  @error('subject') <span class="error">{{ $message }}</span> @enderror
</div>
<div class="form-group">
  <label>Corpo:</label>
  <textarea name="body" required>{{ old('body', $comunicacao->body ?? '') }}</textarea>
  @error('body') <span class="error">{{ $message }}</span> @enderror
</div>
<div class="form-group">
  <label>Caso (opcional):</label>
  <select name="caso_id">
    <option>-- Sem caso --</option>
    @foreach(\App\Models\Caso::all() as $caso)
      <option value="{{ $caso->id }}" @if(old('caso_id', $comunicacao->caso_id ?? null) == $caso->id) selected @endif>{{ $caso->numero }}</option>
    @endforeach
  </select>
</div>
```

- [ ] **Step 3:** Atualizar `index.blade.php` com tabela de listagem
```blade
@extends('layouts.app')
@section('title', 'Comunicações')
@section('page-title', 'Comunicações')
@section('content')
<div class="card">
  <div class="card-header">
    📧 Comunicações
    <a href="{{ route('comunicacoes.create') }}" class="btn btn-primary" style="float:right;">+ Nova</a>
  </div>
  <table class="table">
    <thead>
      <tr>
        <th>Assunto</th>
        <th>De</th>
        <th>Para</th>
        <th>Classificação</th>
        <th>Data</th>
        <th>Ações</th>
      </tr>
    </thead>
    <tbody>
      @forelse($comunicacoes as $c)
        <tr>
          <td><a href="{{ route('comunicacoes.show', $c) }}">{{ $c->subject }}</a></td>
          <td>{{ $c->email_from }}</td>
          <td>{{ $c->email_to }}</td>
          <td><span class="badge badge-{{ strtolower($c->classification) }}">{{ $c->classification }}</span></td>
          <td>{{ $c->created_at->format('d/m/Y') }}</td>
          <td>
            <a href="{{ route('comunicacoes.edit', $c) }}" class="btn btn-secondary btn-sm">Editar</a>
            <form action="{{ route('comunicacoes.destroy', $c) }}" method="POST" style="display:inline;">
              @csrf @method('DELETE')
              <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Confirmar?')">Deletar</button>
            </form>
          </td>
        </tr>
      @empty
        <tr><td colspan="6" style="text-align:center; padding:20px;">Nenhuma comunicação registrada</td></tr>
      @endforelse
    </tbody>
  </table>
  {{ $comunicacoes->links() }}
</div>
@endsection
```

- [ ] **Step 4:** Atualizar `show.blade.php` com detalhe completo
```blade
@extends('layouts.app')
@section('title', $comunicacao->subject)
@section('page-title', 'Detalhe da Comunicação')
@section('content')
<div style="display:grid; grid-template-columns:2fr 1fr; gap:20px;">
  <div class="card">
    <div class="card-header">{{ $comunicacao->subject }}</div>
    <p><strong>De:</strong> {{ $comunicacao->email_from }}</p>
    <p><strong>Para:</strong> {{ $comunicacao->email_to }}</p>
    <p><strong>Data:</strong> {{ $comunicacao->created_at->format('d/m/Y H:i') }}</p>
    <hr>
    <p>{{ $comunicacao->body }}</p>
  </div>
  <div>
    <div class="card">
      <div class="card-header">🤖 Classificação</div>
      <p><strong>Status:</strong> <span class="badge badge-{{ strtolower($comunicacao->classification) }}">{{ $comunicacao->classification }}</span></p>
      <p><strong>Confiança:</strong> {{ round($comunicacao->confidence * 100, 1) }}%</p>
      <a href="{{ route('comunicacoes.edit', $comunicacao) }}" class="btn btn-primary" style="width:100%;">Editar</a>
    </div>
  </div>
</div>
@endsection
```

- [ ] **Step 5:** Criar `edit.blade.php`
```blade
@extends('layouts.app')
@section('title', 'Editar Comunicação')
@section('page-title', 'Editar Comunicação')
@section('content')
<div class="card">
  <div class="card-header">📧 Editar Comunicação</div>
  <form action="{{ route('comunicacoes.update', $comunicacao) }}" method="POST">
    @csrf @method('PATCH')
    @include('comunicacoes._form')
    <button type="submit" class="btn btn-primary">Atualizar</button>
    <a href="{{ route('comunicacoes.show', $comunicacao) }}" class="btn btn-secondary">Cancelar</a>
  </form>
</div>
@endsection
```

- [ ] **Step 6:** Rodar testes (smoke test)
```bash
cd api && php artisan serve
# Acessar http://localhost:8000/comunicacoes
# Testar: listagem, criar, editar, deletar
```

- [ ] **Step 7:** Commit
```bash
git add api/resources/views/comunicacoes/
git commit -m "feat: vistas CRUD de Comunicações (index, show, create, edit)"
```

---

### Task 1.2: Atualizar ComunicacoesController Web (listagem, filtros)

**Files:**
- Modify: `api/app/Http/Controllers/Web/ComunicacoesController.php`
- Create: `api/app/Http/Requests/ComunicacaoRequest.php`

**Interfaces:**
- Consumes: Model Comunicacao, Service ClassificacaoService
- Produces: Controller com validações via FormRequest

**Steps:**

- [ ] **Step 1:** Criar FormRequest para validações
```php
// api/app/Http/Requests/ComunicacaoRequest.php
namespace App\Http\Requests;
use Illuminate\Foundation\Http\FormRequest;
class ComunicacaoRequest extends FormRequest {
    public function authorize() { return true; }
    public function rules() {
        return [
            'email_from' => 'required|email|max:255',
            'email_to' => 'required|email|max:255',
            'subject' => 'required|string|max:255',
            'body' => 'required|string',
            'caso_id' => 'nullable|exists:casos,id',
        ];
    }
    public function messages() {
        return [
            'email_from.required' => 'Email de origem obrigatório',
            'email_to.required' => 'Email de destino obrigatório',
            'subject.required' => 'Assunto obrigatório',
            'body.required' => 'Corpo obrigatório',
        ];
    }
}
```

- [ ] **Step 2:** Atualizar ComunicacoesController
```php
// api/app/Http/Controllers/Web/ComunicacoesController.php
namespace App\Http\Controllers\Web;
use App\Http\Controllers\Controller;
use App\Http\Requests\ComunicacaoRequest;
use App\Models\Comunicacao;
use App\Models\Caso;
use App\Services\ClassificacaoService;

class ComunicacoesController extends Controller {
    protected $classificacao;
    public function __construct(ClassificacaoService $classificacao) {
        $this->middleware('auth');
        $this->classificacao = $classificacao;
    }

    public function index() {
        $query = Comunicacao::query();
        if (request('search')) {
            $search = request('search');
            $query->where('subject', 'like', "%$search%")
                  ->orWhere('email_from', 'like', "%$search%");
        }
        if (request('classification')) {
            $query->where('classification', request('classification'));
        }
        if (request('caso_id')) {
            $query->where('caso_id', request('caso_id'));
        }
        $comunicacoes = $query->paginate(15);
        return view('comunicacoes.index', compact('comunicacoes'));
    }

    public function create() {
        $casos = Caso::all();
        return view('comunicacoes.create', compact('casos'));
    }

    public function store(ComunicacaoRequest $request) {
        $comunicacao = Comunicacao::create($request->validated());
        $resultado = $this->classificacao->classificar($comunicacao->subject, $comunicacao->body);
        $comunicacao->update([
            'classification' => $resultado['classification'],
            'confidence' => $resultado['confidence'],
            'classified_at' => now(),
        ]);
        return redirect()->route('comunicacoes.show', $comunicacao)
                       ->with('success', 'Comunicação criada e classificada');
    }

    public function show(Comunicacao $comunicacao) {
        $comunicacao->load('responses', 'attachments', 'logs');
        return view('comunicacoes.show', compact('comunicacao'));
    }

    public function edit(Comunicacao $comunicacao) {
        $casos = Caso::all();
        return view('comunicacoes.edit', compact('comunicacao', 'casos'));
    }

    public function update(ComunicacaoRequest $request, Comunicacao $comunicacao) {
        $comunicacao->update($request->validated());
        return redirect()->route('comunicacoes.show', $comunicacao)
                       ->with('success', 'Comunicação atualizada');
    }

    public function destroy(Comunicacao $comunicacao) {
        $comunicacao->delete();
        return redirect()->route('comunicacoes.index')
                       ->with('success', 'Comunicação deletada');
    }
}
```

- [ ] **Step 3:** Adicionar rotas Web em `routes/web.php`
```php
Route::middleware('auth')->group(function () {
    Route::resource('comunicacoes', Web\ComunicacoesController::class);
});
```

- [ ] **Step 4:** Rodar testes
```bash
php artisan test tests/Feature/Web/ComunicacoesTest.php -v
```

- [ ] **Step 5:** Commit
```bash
git add api/app/Http/Controllers/Web/ComunicacoesController.php api/app/Http/Requests/ComunicacaoRequest.php api/routes/web.php
git commit -m "feat: ComunicacoesController Web com validações e filtros"
```

---

# MÓDULO 2: CASOS

### Task 2.1: Criar Models e Enums para Casos (state machine)

**Files:**
- Create: `api/app/Enums/CasoStatus.php`
- Create: `api/app/Services/EstadoCasoService.php`

**Interfaces:**
- Consumes: Caso model (já existe)
- Produces: Enum + Service para state machine

**Steps:**

- [ ] **Step 1:** Criar Enum de status
```php
// api/app/Enums/CasoStatus.php
namespace App\Enums;
enum CasoStatus: string {
    case ABERTO = 'ABERTO';
    case JULGADO = 'JULGADO';
    case ENCERRADO = 'ENCERRADO';
    case CANCELADO = 'CANCELADO';
    
    public function label(): string {
        return match($this) {
            self::ABERTO => 'Aberto',
            self::JULGADO => 'Julgado',
            self::ENCERRADO => 'Encerrado',
            self::CANCELADO => 'Cancelado',
        };
    }
}
```

- [ ] **Step 2:** Criar EstadoCasoService
```php
// api/app/Services/EstadoCasoService.php
namespace App\Services;
use App\Models\Caso;
use App\Enums\CasoStatus;
use InvalidArgumentException;

class EstadoCasoService {
    public function transicionar(Caso $caso, CasoStatus $novoStatus, string $motivo = ''): bool {
        $transicoes_validas = [
            CasoStatus::ABERTO => [CasoStatus::JULGADO, CasoStatus::CANCELADO],
            CasoStatus::JULGADO => [CasoStatus::ENCERRADO, CasoStatus::ABERTO],
            CasoStatus::ENCERRADO => [],
            CasoStatus::CANCELADO => [CasoStatus::ABERTO],
        ];
        
        $statusAtual = CasoStatus::from($caso->status);
        if (!in_array($novoStatus, $transicoes_validas[$statusAtual] ?? [])) {
            throw new InvalidArgumentException("Transição inválida: {$statusAtual->value} → {$novoStatus->value}");
        }
        
        $caso->update(['status' => $novoStatus->value]);
        event(new \App\Events\CasoTransicionado($caso, $statusAtual, $novoStatus, $motivo));
        return true;
    }
}
```

- [ ] **Step 3:** Criar Event para auditoria
```php
// api/app/Events/CasoTransicionado.php
namespace App\Events;
use App\Models\Caso;
use App\Enums\CasoStatus;
use Illuminate\Foundation\Events\Dispatchable;

class CasoTransicionado {
    use Dispatchable;
    public function __construct(
        public Caso $caso,
        public CasoStatus $statusAnterior,
        public CasoStatus $statusNovo,
        public string $motivo = ''
    ) {}
}
```

- [ ] **Step 4:** Registrar Event Listener
```php
// api/app/Listeners/RegistrarTransicaoCaso.php
namespace App\Listeners;
use App\Events\CasoTransicionado;
use App\Models\ProcessingLog;

class RegistrarTransicaoCaso {
    public function handle(CasoTransicionado $event): void {
        ProcessingLog::create([
            'comunicacao_id' => null,
            'action' => 'caso_transicionado',
            'status' => 'SUCCESS',
            'result' => json_encode([
                'caso_id' => $event->caso->id,
                'de' => $event->statusAnterior->value,
                'para' => $event->statusNovo->value,
                'motivo' => $event->motivo,
            ]),
            'duration_ms' => 0,
        ]);
    }
}
```

- [ ] **Step 5:** Registrar Listener no EventServiceProvider
```php
// Adicionar em api/app/Providers/EventServiceProvider.php
use App\Events\CasoTransicionado;
use App\Listeners\RegistrarTransicaoCaso;

protected $listen = [
    CasoTransicionado::class => [RegistrarTransicaoCaso::class],
];
```

- [ ] **Step 6:** Commit
```bash
git add api/app/Enums/CasoStatus.php api/app/Services/EstadoCasoService.php api/app/Events/CasoTransicionado.php api/app/Listeners/RegistrarTransicaoCaso.php api/app/Providers/EventServiceProvider.php
git commit -m "feat: Estado machine para Casos (state transitions + auditoria)"
```

---

### Task 2.2: Criar vistas CRUD de Casos

**Files:**
- Create: `api/resources/views/casos/create.blade.php`
- Create: `api/resources/views/casos/edit.blade.php`
- Create: `api/resources/views/casos/_form.blade.php`
- Modify: `api/resources/views/casos/index.blade.php`
- Modify: `api/resources/views/casos/show.blade.php`

**Interfaces:**
- Consumes: Models Caso, Pessoa, UF, Vara, Juiz
- Produces: Views com state machine visual

**Steps:**

- [ ] **Step 1:** Criar `_form.blade.php` para Casos
```blade
<div class="form-group">
  <label>Número do Processo:</label>
  <input type="text" name="numero" value="{{ old('numero', $caso->numero ?? '') }}" required>
  @error('numero') <span class="error">{{ $message }}</span> @enderror
</div>
<div class="form-group">
  <label>Parte (Pessoa):</label>
  <select name="pessoa_id" required>
    <option>-- Selecione --</option>
    @foreach(\App\Models\Pessoa::all() as $p)
      <option value="{{ $p->id }}" @if(old('pessoa_id', $caso->pessoa_id ?? null) == $p->id) selected @endif>{{ $p->nome }}</option>
    @endforeach
  </select>
  @error('pessoa_id') <span class="error">{{ $message }}</span> @enderror
</div>
<div class="form-group">
  <label>UF:</label>
  <select name="uf_id">
    <option>-- Selecione --</option>
    @foreach(\App\Models\UF::all() as $uf)
      <option value="{{ $uf->id }}" @if(old('uf_id', $caso->uf_id ?? null) == $uf->id) selected @endif>{{ $uf->nome }}</option>
    @endforeach
  </select>
</div>
<div class="form-group">
  <label>Vara:</label>
  <select name="vara_id">
    <option>-- Selecione --</option>
    @foreach(\App\Models\Vara::all() as $vara)
      <option value="{{ $vara->id }}" @if(old('vara_id', $caso->vara_id ?? null) == $vara->id) selected @endif>{{ $vara->nome }}</option>
    @endforeach
  </select>
</div>
<div class="form-group">
  <label>Juiz:</label>
  <select name="juiz_id">
    <option>-- Selecione --</option>
    @foreach(\App\Models\Juiz::all() as $juiz)
      <option value="{{ $juiz->id }}" @if(old('juiz_id', $caso->juiz_id ?? null) == $juiz->id) selected @endif>{{ $juiz->nome }}</option>
    @endforeach
  </select>
</div>
<div class="form-group">
  <label>Data de Abertura:</label>
  <input type="date" name="data_abertura" value="{{ old('data_abertura', $caso->data_abertura ?? '') }}" required>
</div>
<div class="form-group">
  <label>Observações:</label>
  <textarea name="observacoes">{{ old('observacoes', $caso->observacoes ?? '') }}</textarea>
</div>
```

- [ ] **Step 2:** Atualizar `index.blade.php` com listagem
```blade
@extends('layouts.app')
@section('title', 'Casos')
@section('page-title', 'Casos')
@section('content')
<div class="card">
  <div class="card-header">
    📋 Casos
    <a href="{{ route('casos.create') }}" class="btn btn-primary" style="float:right;">+ Novo Caso</a>
  </div>
  <table class="table">
    <thead>
      <tr>
        <th>Número</th>
        <th>Parte</th>
        <th>Vara</th>
        <th>Status</th>
        <th>Data Abertura</th>
        <th>Ações</th>
      </tr>
    </thead>
    <tbody>
      @forelse($casos as $caso)
        <tr>
          <td><a href="{{ route('casos.show', $caso) }}">{{ $caso->numero }}</a></td>
          <td>{{ $caso->pessoa->nome }}</td>
          <td>{{ $caso->vara->nome }}</td>
          <td><span class="badge badge-{{ strtolower(str_replace('_', '', $caso->status)) }}">{{ \App\Enums\CasoStatus::from($caso->status)->label() }}</span></td>
          <td>{{ $caso->data_abertura->format('d/m/Y') }}</td>
          <td>
            <a href="{{ route('casos.edit', $caso) }}" class="btn btn-secondary btn-sm">Editar</a>
            <form action="{{ route('casos.destroy', $caso) }}" method="POST" style="display:inline;">
              @csrf @method('DELETE')
              <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Confirmar?')">Deletar</button>
            </form>
          </td>
        </tr>
      @empty
        <tr><td colspan="6" style="text-align:center;padding:20px;">Nenhum caso registrado</td></tr>
      @endforelse
    </tbody>
  </table>
  {{ $casos->links() }}
</div>
@endsection
```

- [ ] **Step 3:** Criar `create.blade.php`
```blade
@extends('layouts.app')
@section('title', 'Novo Caso')
@section('page-title', 'Novo Caso')
@section('content')
<div class="card">
  <div class="card-header">📋 Novo Caso</div>
  <form action="{{ route('casos.store') }}" method="POST">
    @csrf
    @include('casos._form')
    <button type="submit" class="btn btn-primary">Salvar</button>
    <a href="{{ route('casos.index') }}" class="btn btn-secondary">Cancelar</a>
  </form>
</div>
@endsection
```

- [ ] **Step 4:** Criar `edit.blade.php`
```blade
@extends('layouts.app')
@section('title', 'Editar Caso')
@section('page-title', 'Editar Caso')
@section('content')
<div class="card">
  <div class="card-header">📋 Editar Caso</div>
  <form action="{{ route('casos.update', $caso) }}" method="POST">
    @csrf @method('PATCH')
    @include('casos._form')
    <button type="submit" class="btn btn-primary">Atualizar</button>
    <a href="{{ route('casos.show', $caso) }}" class="btn btn-secondary">Cancelar</a>
  </form>
</div>
@endsection
```

- [ ] **Step 5:** Atualizar `show.blade.php` com state machine
```blade
@extends('layouts.app')
@section('title', $caso->numero)
@section('page-title', 'Detalhe do Caso')
@section('content')
<div style="display:grid;grid-template-columns:2fr 1fr;gap:20px;">
  <div class="card">
    <div class="card-header">{{ $caso->numero }}</div>
    <p><strong>Parte:</strong> {{ $caso->pessoa->nome }}</p>
    <p><strong>Vara:</strong> {{ $caso->vara->nome }}</p>
    <p><strong>Juiz:</strong> {{ $caso->juiz->nome }}</p>
    <p><strong>Data Abertura:</strong> {{ $caso->data_abertura->format('d/m/Y') }}</p>
    <p><strong>Observações:</strong> {{ $caso->observacoes }}</p>
  </div>
  <div>
    <div class="card">
      <div class="card-header">🎯 Status</div>
      <p><span class="badge badge-{{ strtolower(str_replace('_', '', $caso->status)) }}">{{ \App\Enums\CasoStatus::from($caso->status)->label() }}</span></p>
      @if($caso->status !== 'ENCERRADO')
        <form action="{{ route('casos.transicionar', $caso) }}" method="POST" style="margin-top:10px;">
          @csrf
          <select name="novo_status" required>
            <option>-- Transicionar para --</option>
            @foreach(\App\Enums\CasoStatus::cases() as $s)
              @if($s->value !== $caso->status)
                <option value="{{ $s->value }}">{{ $s->label() }}</option>
              @endif
            @endforeach
          </select>
          <textarea name="motivo" placeholder="Motivo (opcional)" style="width:100%;margin-top:10px;"></textarea>
          <button type="submit" class="btn btn-primary" style="width:100%;margin-top:10px;">Transicionar</button>
        </form>
      @endif
    </div>
    <div class="card">
      <div class="card-header">📧 Comunicações ({{ $caso->comunicacoes->count() }})</div>
      @forelse($caso->comunicacoes as $com)
        <p><a href="{{ route('comunicacoes.show', $com) }}">{{ $com->subject }}</a></p>
      @empty
        <p style="color:#999;">Nenhuma comunicação</p>
      @endforelse
    </div>
  </div>
</div>
@endsection
```

- [ ] **Step 6:** Commit
```bash
git add api/resources/views/casos/
git commit -m "feat: vistas CRUD de Casos com state machine visual"
```

---

### Task 2.3: CasosController Web com state machine

**Files:**
- Modify: `api/app/Http/Controllers/Web/CasosController.php`
- Create: `api/app/Http/Requests/CasoRequest.php`

**Steps:**

- [ ] **Step 1:** Criar CasoRequest
```php
// api/app/Http/Requests/CasoRequest.php
namespace App\Http\Requests;
use Illuminate\Foundation\Http\FormRequest;
class CasoRequest extends FormRequest {
    public function authorize() { return true; }
    public function rules() {
        return [
            'numero' => 'required|string|unique:casos,numero,' . ($this->caso->id ?? 'NULL'),
            'pessoa_id' => 'required|exists:pessoas,id',
            'uf_id' => 'nullable|exists:ufs,id',
            'vara_id' => 'nullable|exists:varas,id',
            'juiz_id' => 'nullable|exists:juizes,id',
            'data_abertura' => 'required|date',
            'observacoes' => 'nullable|string',
        ];
    }
}
```

- [ ] **Step 2:** Atualizar CasosController
```php
// api/app/Http/Controllers/Web/CasosController.php
namespace App\Http\Controllers\Web;
use App\Http\Controllers\Controller;
use App\Http\Requests\CasoRequest;
use App\Models\Caso;
use App\Enums\CasoStatus;
use App\Services\EstadoCasoService;

class CasosController extends Controller {
    protected $estadoService;
    public function __construct(EstadoCasoService $estadoService) {
        $this->middleware('auth');
        $this->estadoService = $estadoService;
    }

    public function index() {
        $query = Caso::query();
        if (request('search')) {
            $query->where('numero', 'like', '%' . request('search') . '%');
        }
        if (request('status')) {
            $query->where('status', request('status'));
        }
        $casos = $query->with(['pessoa', 'vara', 'juiz'])->paginate(15);
        return view('casos.index', compact('casos'));
    }

    public function create() {
        return view('casos.create');
    }

    public function store(CasoRequest $request) {
        $caso = Caso::create($request->validated() + ['status' => CasoStatus::ABERTO->value]);
        return redirect()->route('casos.show', $caso)->with('success', 'Caso criado');
    }

    public function show(Caso $caso) {
        $caso->load(['pessoa', 'vara', 'juiz', 'comunicacoes']);
        return view('casos.show', compact('caso'));
    }

    public function edit(Caso $caso) {
        return view('casos.edit', compact('caso'));
    }

    public function update(CasoRequest $request, Caso $caso) {
        $caso->update($request->validated());
        return redirect()->route('casos.show', $caso)->with('success', 'Caso atualizado');
    }

    public function destroy(Caso $caso) {
        $caso->delete();
        return redirect()->route('casos.index')->with('success', 'Caso deletado');
    }

    public function transicionar(Caso $caso) {
        $novoStatus = CasoStatus::from(request('novo_status'));
        $motivo = request('motivo', '');
        try {
            $this->estadoService->transicionar($caso, $novoStatus, $motivo);
            return redirect()->route('casos.show', $caso)->with('success', "Caso transicionado para {$novoStatus->label()}");
        } catch (\Exception $e) {
            return back()->withErrors(['erro' => $e->getMessage()]);
        }
    }
}
```

- [ ] **Step 3:** Adicionar rotas em web.php
```php
Route::middleware('auth')->group(function () {
    Route::resource('casos', Web\CasosController::class);
    Route::post('casos/{caso}/transicionar', [Web\CasosController::class, 'transicionar'])->name('casos.transicionar');
});
```

- [ ] **Step 4:** Commit
```bash
git add api/app/Http/Controllers/Web/CasosController.php api/app/Http/Requests/CasoRequest.php
git commit -m "feat: CasosController com state machine (transições validadas)"
```

---

# MÓDULO 3: PESSOAS

### Task 3.1: Vistas CRUD de Pessoas

**Files:**
- Create: `api/resources/views/pessoas/create.blade.php`
- Create: `api/resources/views/pessoas/edit.blade.php`
- Create: `api/resources/views/pessoas/_form.blade.php`
- Modify: `api/resources/views/pessoas/index.blade.php`
- Modify: `api/resources/views/pessoas/show.blade.php`

**Steps:**

- [ ] **Step 1:** Criar `_form.blade.php`
```blade
<div class="form-group">
  <label>Nome:</label>
  <input type="text" name="nome" value="{{ old('nome', $pessoa->nome ?? '') }}" required>
</div>
<div class="form-group">
  <label>Tipo:</label>
  <select name="tipo" required>
    <option value="FISICA" @if(old('tipo', $pessoa->tipo ?? null) == 'FISICA') selected @endif>Pessoa Física</option>
    <option value="JURIDICA" @if(old('tipo', $pessoa->tipo ?? null) == 'JURIDICA') selected @endif>Pessoa Jurídica</option>
  </select>
</div>
<div class="form-group">
  <label>CPF/CNPJ:</label>
  <input type="text" name="documento" value="{{ old('documento', $pessoa->documento ?? '') }}">
</div>
<div class="form-group">
  <label>Email:</label>
  <input type="email" name="email" value="{{ old('email', $pessoa->email ?? '') }}">
</div>
<div class="form-group">
  <label>Telefone:</label>
  <input type="text" name="telefone" value="{{ old('telefone', $pessoa->telefone ?? '') }}">
</div>
```

- [ ] **Step 2-5:** Criar create, edit, atualizar index/show (similar a Comunicações)

- [ ] **Step 6:** Commit
```bash
git add api/resources/views/pessoas/
git commit -m "feat: vistas CRUD de Pessoas"
```

---

# MÓDULOS 4-8: PADRÃO RÁPIDO

Para **Kits, Extrações, SCEI, Créditos, Alelos**, repetir padrão:

1. Criar vistas (create, edit, index, show, _form)
2. Criar FormRequest com validações
3. Criar Controller Web (CRUD)
4. Adicionar rotas em web.php
5. Commit

---

### Task 4.1: Créditos (com cálculo 5-fator)

**Files:**
- Create: `api/app/Services/CalculoCreditoService.php`
- Create: Vistas de Créditos
- Modify: CreditosController

**Steps:**

- [ ] **Step 1:** Criar CalculoCreditoService
```php
// api/app/Services/CalculoCreditoService.php
namespace App\Services;
use App\Models\Credito;

class CalculoCreditoService {
    public function calcular(Credito $credito): float {
        $base = $credito->valor_base;
        $fator1 = $credito->fator_1 ?? 1.0;
        $fator2 = $credito->fator_2 ?? 1.0;
        $fator3 = $credito->fator_3 ?? 1.0;
        $fator4 = $credito->fator_4 ?? 1.0;
        $fator5 = $credito->fator_5 ?? 1.0;
        
        $total = $base * ($fator1 + $fator2 + $fator3 + $fator4 + $fator5);
        return round($total, 2);
    }

    public function parcelar(Credito $credito, int $num_parcelas = 12): array {
        $total = $this->calcular($credito);
        $valor_parcela = $total / $num_parcelas;
        
        $parcelas = [];
        for ($i = 1; $i <= $num_parcelas; $i++) {
            $parcelas[] = [
                'numero' => $i,
                'valor' => round($valor_parcela, 2),
                'data_vencimento' => now()->addMonths($i)->format('Y-m-d'),
            ];
        }
        return $parcelas;
    }
}
```

- [ ] **Step 2-5:** Criar vistas + controller (pattern Comunicações)

- [ ] **Step 6:** Commit
```bash
git add api/app/Services/CalculoCreditoService.php api/resources/views/creditos/ api/app/Http/Controllers/Web/CreditosController.php
git commit -m "feat: Créditos com cálculo 5-fator + parcelamento"
```

---

# MÓDULO 9: RELATÓRIOS

### Task 9.1: Criar RelatorioService (PDF + Excel + Charts)

**Files:**
- Create: `api/app/Services/RelatorioService.php`
- Create: `api/app/Http/Controllers/Web/RelatoriosController.php`
- Create: Vistas de Relatórios

**Steps:**

- [ ] **Step 1:** Criar RelatorioService
```php
// api/app/Services/RelatorioService.php
namespace App\Services;
use App\Models\Comunicacao;
use App\Models\Caso;
use App\Models\Credito;
use Barryvdh\DomPDF\Facade\Pdf;
use PhpOffice\PhpSpreadsheet\Spreadsheet;

class RelatorioService {
    public function relatorio_comunicacoes(array $filtros = []) {
        $query = Comunicacao::query();
        if ($filtros['classification'] ?? null) {
            $query->where('classification', $filtros['classification']);
        }
        if ($filtros['data_inicio'] ?? null) {
            $query->whereDate('created_at', '>=', $filtros['data_inicio']);
        }
        if ($filtros['data_fim'] ?? null) {
            $query->whereDate('created_at', '<=', $filtros['data_fim']);
        }
        return $query->get();
    }

    public function gerar_pdf($dados, $titulo) {
        $pdf = Pdf::loadView('relatorios.template_pdf', [
            'dados' => $dados,
            'titulo' => $titulo,
        ]);
        return $pdf->download("{$titulo}.pdf");
    }

    public function gerar_excel($dados, $titulo) {
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        $sheet->setTitle('Relatório');
        
        $row = 1;
        $sheet->setCellValue("A{$row}", $titulo);
        $row++;
        
        foreach ($dados as $item) {
            $sheet->setCellValue("A{$row}", $item->id ?? '');
            // ... adicionar mais colunas
            $row++;
        }
        
        return $spreadsheet;
    }
}
```

- [ ] **Step 2:** Criar RelatoriosController
```php
// api/app/Http/Controllers/Web/RelatoriosController.php
namespace App\Http\Controllers\Web;
use App\Http\Controllers\Controller;
use App\Services\RelatorioService;
use App\Models\Comunicacao;

class RelatoriosController extends Controller {
    protected $relatorio;
    public function __construct(RelatorioService $relatorio) {
        $this->middleware('auth');
        $this->relatorio = $relatorio;
    }

    public function index() {
        return view('relatorios.index');
    }

    public function comunicacoes() {
        $dados = $this->relatorio->relatorio_comunicacoes(request()->all());
        
        if (request('formato') == 'pdf') {
            return $this->relatorio->gerar_pdf($dados, 'Relatório de Comunicações');
        } elseif (request('formato') == 'excel') {
            $spreadsheet = $this->relatorio->gerar_excel($dados, 'Relatório de Comunicações');
            return response()->streamDownload(
                fn() => (new \PhpOffice\PhpSpreadsheet\Writer\Xlsx($spreadsheet))->save('php://output'),
                'relatorio_comunicacoes.xlsx'
            );
        }
        
        return view('relatorios.comunicacoes', compact('dados'));
    }
}
```

- [ ] **Step 3:** Criar vistas de relatórios
```blade
@extends('layouts.app')
@section('title', 'Relatórios')
@section('page-title', 'Relatórios')
@section('content')
<div class="card">
  <div class="card-header">📊 Relatórios</div>
  <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:20px;">
    <div class="card">
      <h3>Comunicações</h3>
      <p>Relatório de comunicações por classificação</p>
      <form action="{{ route('relatorios.comunicacoes') }}" method="GET">
        <select name="classification">
          <option>-- Todas --</option>
          <option value="JUDICIAL">Judicial</option>
          <option value="NON_JUDICIAL">Não Judicial</option>
        </select>
        <button type="submit" name="formato" value="pdf" class="btn btn-primary">📄 PDF</button>
        <button type="submit" name="formato" value="excel" class="btn btn-primary">📊 Excel</button>
      </form>
    </div>
    <!-- Mais relatórios -->
  </div>
</div>
@endsection
```

- [ ] **Step 4:** Adicionar rotas
```php
Route::middleware('auth')->group(function () {
    Route::get('relatorios', [Web\RelatoriosController::class, 'index'])->name('relatorios.index');
    Route::get('relatorios/comunicacoes', [Web\RelatoriosController::class, 'comunicacoes'])->name('relatorios.comunicacoes');
});
```

- [ ] **Step 5:** Commit
```bash
git add api/app/Services/RelatorioService.php api/app/Http/Controllers/Web/RelatoriosController.php api/resources/views/relatorios/
git commit -m "feat: Relatórios com PDF, Excel e Charts"
```

---

# MÓDULO 10: ADMIN (Menu Testes)

### Task 10.1: Admin Dashboard com Menu Testes

**Files:**
- Create: `api/app/Http/Controllers/Web/AdminController.php`
- Create: Vistas de Admin

**Steps:**

- [ ] **Step 1:** Criar AdminController
```php
// api/app/Http/Controllers/Web/AdminController.php
namespace App\Http\Controllers\Web;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller {
    public function __construct() {
        $this->middleware('auth');
        $this->middleware(fn($request, $next) => 
            auth()->user()->role !== 'admin' ? abort(403) : $next($request)
        );
    }

    public function index() {
        $stats = [
            'comunicacoes' => \App\Models\Comunicacao::count(),
            'casos' => \App\Models\Caso::count(),
            'pessoas' => \App\Models\Pessoa::count(),
            'usuarios' => User::count(),
        ];
        return view('admin.dashboard', compact('stats'));
    }

    public function menu_testes() {
        return view('admin.menu_testes');
    }

    public function gerar_dados_teste() {
        \App\Models\Pessoa::factory(10)->create();
        \App\Models\Caso::factory(10)->create();
        \App\Models\Comunicacao::factory(20)->create();
        \App\Models\Credito::factory(5)->create();
        
        return back()->with('success', 'Dados de teste gerados com sucesso!');
    }

    public function limpar_dados_teste() {
        \App\Models\Comunicacao::truncate();
        \App\Models\Caso::truncate();
        \App\Models\Pessoa::truncate();
        \App\Models\Credito::truncate();
        
        return back()->with('success', 'Dados de teste removidos!');
    }
}
```

- [ ] **Step 2:** Criar vista de dashboard admin
```blade
@extends('layouts.app')
@section('title', 'Admin')
@section('page-title', 'Admin Dashboard')
@section('content')
<div class="card">
  <div class="card-header">⚙️ Admin Dashboard</div>
  <div style="display:grid;grid-template-columns:repeat(4,1fr);gap:20px;margin-bottom:30px;">
    <div class="card">
      <h4>Comunicações</h4>
      <p style="font-size:24px;font-weight:bold;">{{ $stats['comunicacoes'] }}</p>
    </div>
    <div class="card">
      <h4>Casos</h4>
      <p style="font-size:24px;font-weight:bold;">{{ $stats['casos'] }}</p>
    </div>
    <div class="card">
      <h4>Pessoas</h4>
      <p style="font-size:24px;font-weight:bold;">{{ $stats['pessoas'] }}</p>
    </div>
    <div class="card">
      <h4>Usuários</h4>
      <p style="font-size:24px;font-weight:bold;">{{ $stats['usuarios'] }}</p>
    </div>
  </div>

  <div class="card">
    <div class="card-header">🧪 Menu de Testes</div>
    <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:20px;">
      <div>
        <h4>📧 Comunicações</h4>
        <a href="{{ route('comunicacoes.index') }}" class="btn btn-primary" style="width:100%;">Acessar</a>
      </div>
      <div>
        <h4>📋 Casos</h4>
        <a href="{{ route('casos.index') }}" class="btn btn-primary" style="width:100%;">Acessar</a>
      </div>
      <div>
        <h4>👥 Pessoas</h4>
        <a href="{{ route('pessoas.index') }}" class="btn btn-primary" style="width:100%;">Acessar</a>
      </div>
      <div>
        <h4>🔬 Kits</h4>
        <a href="{{ route('kits.index') }}" class="btn btn-primary" style="width:100%;">Acessar</a>
      </div>
      <div>
        <h4>🧬 Extrações</h4>
        <a href="{{ route('extracos.index') }}" class="btn btn-primary" style="width:100%;">Acessar</a>
      </div>
      <div>
        <h4>🏥 SCEI</h4>
        <a href="{{ route('scei.index') }}" class="btn btn-primary" style="width:100%;">Acessar</a>
      </div>
      <div>
        <h4>💰 Créditos</h4>
        <a href="{{ route('creditos.index') }}" class="btn btn-primary" style="width:100%;">Acessar</a>
      </div>
      <div>
        <h4>🔍 Alelos</h4>
        <a href="{{ route('alelos.index') }}" class="btn btn-primary" style="width:100%;">Acessar</a>
      </div>
      <div>
        <h4>📊 Relatórios</h4>
        <a href="{{ route('relatorios.index') }}" class="btn btn-primary" style="width:100%;">Acessar</a>
      </div>
    </div>

    <hr style="margin:30px 0;">

    <div>
      <h4>🧪 Gerador de Dados de Teste</h4>
      <form action="{{ route('admin.gerar_dados_teste') }}" method="POST" style="display:inline;">
        @csrf
        <button type="submit" class="btn btn-success" onclick="return confirm('Gerar 10 pessoas, 10 casos, 20 comunicações, 5 créditos?')">✅ Gerar Dados</button>
      </form>
      <form action="{{ route('admin.limpar_dados_teste') }}" method="POST" style="display:inline;">
        @csrf
        <button type="submit" class="btn btn-danger" onclick="return confirm('Remover todos os dados de teste?')">❌ Limpar Dados</button>
      </form>
    </div>
  </div>
</div>
@endsection
```

- [ ] **Step 3:** Adicionar rotas em web.php
```php
Route::middleware(['auth', 'admin'])->prefix('admin')->name('admin.')->group(function () {
    Route::get('/', [Web\AdminController::class, 'index'])->name('dashboard');
    Route::get('/menu-testes', [Web\AdminController::class, 'menu_testes'])->name('menu_testes');
    Route::post('/gerar-dados-teste', [Web\AdminController::class, 'gerar_dados_teste'])->name('gerar_dados_teste');
    Route::post('/limpar-dados-teste', [Web\AdminController::class, 'limpar_dados_teste'])->name('limpar_dados_teste');
});
```

- [ ] **Step 4:** Commit
```bash
git add api/app/Http/Controllers/Web/AdminController.php api/resources/views/admin/
git commit -m "feat: Admin dashboard com menu de testes integrado"
```

---

# TESTES & COMMITS FINAIS

### Task 11.1: Criar testes para cada módulo (80%+ cobertura)

**Files:**
- Create: `api/tests/Feature/Web/`módulo`Test.php` (para cada módulo)

**Steps:**

- [ ] **Step 1:** Criar teste para Comunicações
```php
// api/tests/Feature/Web/ComunicacoesWebTest.php
namespace Tests\Feature\Web;
use Tests\TestCase;
use App\Models\User;
use App\Models\Comunicacao;
use Illuminate\Foundation\Testing\RefreshDatabase;

class ComunicacoesWebTest extends TestCase {
    use RefreshDatabase;
    protected User $user;

    public function setUp(): void {
        parent::setUp();
        $this->user = User::factory()->create();
    }

    public function test_lista_comunicacoes() {
        Comunicacao::factory(5)->create();
        $response = $this->actingAs($this->user)->get('/comunicacoes');
        $response->assertStatus(200)->assertViewIs('comunicacoes.index');
    }

    public function test_cria_comunicacao() {
        $response = $this->actingAs($this->user)->post('/comunicacoes', [
            'email_from' => 'teste@test.com',
            'email_to' => 'dest@test.com',
            'subject' => 'Teste',
            'body' => 'Corpo teste',
        ]);
        $response->assertRedirect();
        $this->assertDatabaseHas('comunicacoes', ['subject' => 'Teste']);
    }

    public function test_edita_comunicacao() {
        $com = Comunicacao::factory()->create();
        $response = $this->actingAs($this->user)->patch("/comunicacoes/{$com->id}", [
            'email_from' => $com->email_from,
            'email_to' => $com->email_to,
            'subject' => 'Novo assunto',
            'body' => $com->body,
        ]);
        $this->assertEquals('Novo assunto', $com->fresh()->subject);
    }

    public function test_deleta_comunicacao() {
        $com = Comunicacao::factory()->create();
        $response = $this->actingAs($this->user)->delete("/comunicacoes/{$com->id}");
        $this->assertSoftDeleted('comunicacoes', ['id' => $com->id]);
    }
}
```

- [ ] **Step 2:** Repetir para Casos, Pessoas, Créditos, etc.

- [ ] **Step 3:** Rodar testes
```bash
composer test
# Esperado: 30+ testes passando
```

- [ ] **Step 4:** Commit
```bash
git add api/tests/Feature/Web/
git commit -m "feat: testes web para todos 10 módulos (80%+ cobertura)"
```

---

# Cronograma Resumido

| Etapa | Módulos | Tempo Est. | Tasks |
|-------|---------|-----------|-------|
| 1 | Comunicações + Casos | 2-3 dias | 4 tasks |
| 2 | Pessoas + Kits + Extrações | 2-3 dias | 3 tasks |
| 3 | SCEI + Créditos + Alelos | 2-3 dias | 3 tasks |
| 4 | Relatórios | 1-2 dias | 2 tasks |
| 5 | Admin + Menu Testes | 1-2 dias | 2 tasks |
| 6 | Testes + Refinamento | 2-3 dias | 2 tasks |

**Total: ~6 semanas** (se 1 dev full-time)

---

## Próximos Passos

**Plan pronto em:** `docs/superpowers/plans/2026-10-07-implementacao-completa.md`

**Execução: Qual abordagem?**

1. **Subagent-Driven** (recomendado) — Fresh subagent por task + review
2. **Inline Execution** — Batch execution com checkpoints

Qual prefere?
