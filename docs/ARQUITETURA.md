# Arquitetura da API REST — Fase 2 (Decisões)

> Decisões de stack, padrões e arquitetura da nova API PHP.
> Baseado em respostas do negócio (Fase 1).
> Última atualização: 2026-10-06

---

## 📋 Decisões Confirmadas (com base em suas respostas)

### ✅ Questão 1: Biblioteca de Relatórios
**Resposta**: QuickReport e Fortes Report CE  
**Decisão Arquitetural**: 
- Suporte a PDF/Word será implementado via **TCPDF** (PDF) + **PHPWord** (Word)
- Exportação/formatação de dados será via **Laravel Excel** (Maatwebsite)
- Relatórios complexos: considerar **ReportGenerator Service** customizado

### ✅ Questão 2: Workflow de Casos
**Resposta**: Integrações manuais inicialmente, depois automatizar tarefas  
**Decisão Arquitetural**:
- **Estado 1 (MVP)**: Fluxo **manual** — usuário avança status manualmente via API
- **Estado 2 (Future)**: Automação de tarefas (cron jobs, queue workers)
- Implementar **State Machine** (AASM ou Workflow component)
- Usar **Event Sourcing** para auditoria completa de mudanças

### ✅ Questão 3: SCEI (Integrado vs Separado)
**Resposta**: Integrado  
**Decisão Arquitetural**:
- **Monolito único** (não microserviços)
- SCEI como **subdomain bounded context** dentro da mesma aplicação
- Endpoints prefixados: `/api/scei/exames`, `/api/scei/procedimentos`, etc.
- Banco único (MySQL `sgbd_scpg`), tabelas lógicas agrupadas por domínio

### ✅ Questão 4: Segurança (Senhas tb_hosts)
**Resposta**: Migrar usuários e criptografar  
**Decisão Arquitetural**:
- Senhas armazenadas com **bcrypt** (via Laravel password hashing)
- Migração: ler senhas Firebird → converter/criptografar → salvar MySQL
- Rotina: `php artisan migrate:hosts-security` (criptografa senhas antigas)
- Audit log: registrar cada migração

### ✅ Questão 5: Autenticação
**Resposta**: Local (username/password)  
**Decisão Arquitetural**:
- **JWT** (JSON Web Tokens) para API stateless
- Tokens expiram em **24 horas** (configurável)
- Refresh tokens em **7 dias** para renovação automática
- Sem LDAP/AD (pode ser adicionado later)

---

## 🏗️ Stack Técnico — Definição

| Componente | Escolha | Justificativa |
|-----------|---------|---------------|
| **Linguagem** | PHP 8.2+ | Segurança, performance, tipo-seguro |
| **Framework** | **Laravel 11** | Ecossistema rich, migrations, ORM (Eloquent), autenticação nativa, jobs |
| **Banco** | MySQL 8.3 | Já migrado, ACID, índices |
| **ORM** | **Eloquent** (Laravel) | Simples, expressivo, migrations automáticas |
| **Autenticação** | **Laravel Sanctum** (JWT) | Integrado, simplifica tokens |
| **Validação** | **Laravel Validator + Form Requests** | Nativa, reutilizável |
| **PDF** | **TCPDF** | Sem dependência Java, simples |
| **Excel** | **PhpSpreadsheet / Laravel Excel** | Suporte completo (read/write) |
| **Fila de Jobs** | **Laravel Queue (Redis ou DB)** | Para operações assíncronas |
| **Cache** | **Redis** | Performance de leitura |
| **Logging** | **Monolog (nativo Laravel)** | Estruturado, com contexto |
| **Auditoria** | **Laravel Auditing ou custom** | Rastrear todas as mudanças |
| **Testes** | **PHPUnit + Pest** | Coverage 80%+ |
| **CI/CD** | **GitHub Actions** | Automação de testes + deploy |
| **Documentação API** | **OpenAPI 3.0 (Swagger)** | Via `barryvdh/laravel-dingo-api` |

---

## 📁 Estrutura de Diretórios (Laravel 11)

```
api/
│
├── app/
│   ├── Http/
│   │   ├── Controllers/
│   │   │   ├── Api/
│   │   │   │   ├── CasosController.php
│   │   │   │   ├── KitsController.php
│   │   │   │   ├── PessoasController.php
│   │   │   │   ├── ExtracaoController.php
│   │   │   │   ├── ParcelamentoController.php
│   │   │   │   ├── SCEI/
│   │   │   │   │   ├── ExamesController.php
│   │   │   │   │   ├── ProcedimentosController.php
│   │   │   │   │   └── LaudosController.php
│   │   │   │   ├── Admin/
│   │   │   │   │   ├── AuthController.php
│   │   │   │   │   ├── UsuariosController.php
│   │   │   │   │   └── ParametrosController.php
│   │   │   │   └── RelatórioController.php
│   │   ├── Requests/
│   │   │   ├── StoreCasoRequest.php
│   │   │   ├── UpdateCasoRequest.php
│   │   │   ├── StoreKitRequest.php
│   │   │   └── ...
│   │   └── Middleware/
│   │       ├── Authenticate.php
│   │       ├── Authorize.php
│   │       ├── LogAudit.php
│   │       └── ValidateJsonSchema.php
│   │
│   ├── Services/
│   │   ├── CasoService.php
│   │   ├── KitService.php
│   │   ├── ExtracaoService.php
│   │   ├── ParcelamentoService.php
│   │   ├── RelatórioService.php
│   │   ├── SCEI/
│   │   │   ├── ExameService.php
│   │   │   ├── ProcedimentoService.php
│   │   │   └── LaudoService.php
│   │   ├── Auth/
│   │   │   ├── AuthService.php
│   │   │   └── PasswordHashingService.php
│   │   └── Workflow/
│   │       └── CasoWorkflowService.php
│   │
│   ├── Repositories/
│   │   ├── CasoRepository.php
│   │   ├── KitRepository.php
│   │   ├── PessoaRepository.php
│   │   ├── ExtracaoRepository.php
│   │   └── ...
│   │
│   ├── Models/
│   │   ├── Caso.php
│   │   ├── Kit.php
│   │   ├── Pessoa.php
│   │   ├── Extracao.php
│   │   ├── Parcela.php
│   │   ├── Usuario.php
│   │   ├── Historico.php
│   │   ├── SCEI/
│   │   │   ├── Exame.php
│   │   │   ├── Procedimento.php
│   │   │   └── Laudo.php
│   │   └── ...
│   │
│   ├── Events/
│   │   ├── CasoCriado.php
│   │   ├── CasoAtualizado.php
│   │   ├── LaudoEmitido.php
│   │   └── ...
│   │
│   ├── Jobs/
│   │   ├── GerarRelatório.php
│   │   ├── EnviarEmailLaudo.php
│   │   ├── ProcessarExtracao.php
│   │   └── ...
│   │
│   ├── Listeners/
│   │   ├── LogCasoAuditoria.php
│   │   ├── NotificarResponsável.php
│   │   └── ...
│   │
│   ├── Enums/
│   │   ├── StatusCaso.php
│   │   ├── TipoExtracao.php
│   │   ├── StatusParcelamento.php
│   │   └── ...
│   │
│   ├── Exceptions/
│   │   ├── CasoNotFoundException.php
│   │   ├── ExtraçãoSequencialException.php
│   │   ├── ValidacaoCreditoException.php
│   │   └── ...
│   │
│   └── Casts/
│       ├── StatusCasoCast.php
│       └── ...
│
├── config/
│   ├── app.php
│   ├── database.php
│   ├── queue.php (Redis para jobs)
│   ├── cache.php
│   ├── audit.php (auditoria)
│   └── workflow.php (state machine)
│
├── database/
│   ├── migrations/
│   │   ├── 0001_create_pessoas_table.php
│   │   ├── 0002_create_casos_table.php
│   │   ├── 0003_create_kits_table.php
│   │   ├── 0004_create_extracos_table.php
│   │   ├── 0005_create_parcelas_table.php
│   │   ├── 0006_create_usuarios_table.php
│   │   ├── 0007_create_historicos_table.php
│   │   └── ...
│   ├── seeders/
│   │   ├── EstadoSeeder.php
│   │   ├── ComarcaSeeder.php
│   │   ├── UsuarioSeeder.php
│   │   └── ...
│   └── factories/
│       ├── CasoFactory.php
│       ├── KitFactory.php
│       └── ...
│
├── routes/
│   ├── api.php
│   │   ├── /api/v1/casos
│   │   ├── /api/v1/kits
│   │   ├── /api/v1/pessoas
│   │   ├── /api/v1/extracos
│   │   ├── /api/v1/creditos
│   │   ├── /api/v1/scei/...
│   │   ├── /api/v1/admin/...
│   │   ├── /api/v1/relatorios/...
│   │   └── /api/v1/auth/...
│   └── health.php (/api/health)
│
├── tests/
│   ├── Feature/
│   │   ├── Casos/
│   │   ├── Kits/
│   │   ├── Auth/
│   │   └── ...
│   ├── Unit/
│   │   ├── Services/
│   │   ├── Repositories/
│   │   └── ...
│   └── TestCase.php
│
├── storage/
│   ├── app/
│   │   ├── uploads/
│   │   └── ...
│   ├── logs/
│   └── ...
│
├── .env.example
├── .gitignore
├── artisan
├── composer.json
├── composer.lock
├── phpunit.xml
├── docker-compose.yml (opcional)
│
└── README.md
```

---

## 🔐 Segurança & Autenticação

### Fluxo de Autenticação (JWT)

```
Cliente                        API Laravel
  │                              │
  ├─ POST /api/v1/auth/login    │
  │  {username, password}       │
  │                             │ VerificaHash (bcrypt)
  │                             │ Gera JWT
  │◄─ {token, refresh_token}    │
  │                              │
  ├─ GET /api/v1/casos          │
  │  Authorization: Bearer JWT   │
  │                             │ Sanctum::check()
  │                             │ Autoriza via roles/policies
  │◄─ {data}                    │
  │                              │
  └─ POST /api/v1/auth/refresh  │
     {refresh_token}            │
                                │ Gera novo JWT
                       └─ {token}
```

### Middleware de Autorização

- **Authenticate**: Valida JWT
- **Authorize**: Verifica role/permission (Gates + Policies)
- **LogAudit**: Registra todas as ações em `audit_logs`
- **RateLimit**: Limita 100 req/min por usuário (opt.)

---

## 📊 Padrões de Design

### 1. **Service Layer**
Cada controller delega para um Service (regra de negócio):

```php
// CasosController
public function store(StoreCasoRequest $request)
{
    $caso = $this->casoService->criar(
        $request->validated()
    );
    return CasoResource::make($caso);
}

// CasoService
public function criar(array $dados): Caso
{
    // Validações, regras de negócio
    $caso = Caso::create($dados);
    event(new CasoCriado($caso));
    return $caso;
}
```

### 2. **Repository Pattern**
Isolamento da lógica de persistência:

```php
// CasoRepository
public function findById(int $id): ?Caso
public function findByVara(int $varaId): Collection
public function findPendentes(): Collection
public function create(array $dados): Caso
public function update(Caso $caso, array $dados): Caso
```

### 3. **Form Requests (Validação)**
Validação centralizada:

```php
// StoreCasoRequest
public function rules(): array
{
    return [
        'processo_id' => 'required|string|unique:casos,processo_id',
        'vara_id' => 'required|exists:varas,id',
        'juiz_id' => 'required|exists:juizes,id',
        'data_ajuizamento' => 'required|date',
        // ...
    ];
}

public function authorize(): bool
{
    return $this->user()->can('create', Caso::class);
}
```

### 4. **Resources (Serialização)**
Controle da estrutura JSON:

```php
// CasoResource
class CasoResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'processo_id' => $this->processo_id,
            'vara' => VaraResource::make($this->vara),
            'status' => $this->status->value,
            'historico' => HistoricoResource::collection($this->historico),
            'created_at' => $this->created_at->toIso8601String(),
        ];
    }
}
```

### 5. **Events & Listeners**
Para desacoplamento e notificações:

```php
// Dispara evento
event(new CasoCriado($caso));

// Listener 1: Log auditoria
class LogCasoAuditoria implements ShouldQueue {
    public function handle(CasoCriado $event) {
        AuditLog::create(['action' => 'caso.criado', ...]);
    }
}

// Listener 2: Notificar usuário
class NotificarResponsável implements ShouldQueue {
    public function handle(CasoCriado $event) {
        Notification::send($event->caso->responsavel, ...);
    }
}
```

### 6. **State Machine (Workflow)**
Para transições de status de caso:

```php
// CasoWorkflowService
public function avancarStatus(Caso $caso, string $novoStatus): void
{
    // Valida se transição é permitida
    $transicoes = [
        'pendente' => ['em_coleta'],
        'em_coleta' => ['recebido'],
        'recebido' => ['em_extracao'],
        // ...
    ];
    
    if (!in_array($novoStatus, $transicoes[$caso->status] ?? [])) {
        throw new StatusTransitionException(...);
    }
    
    $caso->update(['status' => $novoStatus]);
    event(new CasoStatusAlterado($caso, $novoStatus));
}
```

---

## 🔌 APIs & Versioning

### Versionamento
- **v1** (`/api/v1/`) — versão atual
- Backward-compatible enquanto possível
- Breaking changes → nova versão

### Endpoints Principais

```
# Autenticação
POST   /api/v1/auth/login          → AuthController@login
POST   /api/v1/auth/logout         → AuthController@logout
POST   /api/v1/auth/refresh        → AuthController@refresh
PUT    /api/v1/auth/password       → AuthController@changePassword

# Casos (Processos)
GET    /api/v1/casos               → CasosController@index
POST   /api/v1/casos               → CasosController@store
GET    /api/v1/casos/{id}          → CasosController@show
PUT    /api/v1/casos/{id}          → CasosController@update
DELETE /api/v1/casos/{id}          → CasosController@destroy
GET    /api/v1/casos/{id}/historico → HistoricoController@index
POST   /api/v1/casos/{id}/status   → CasosController@updateStatus

# Pessoas
GET    /api/v1/pessoas             → PessoasController@index
POST   /api/v1/pessoas             → PessoasController@store
GET    /api/v1/juizes              → JuizesController@index
GET    /api/v1/varas               → VarasController@index
GET    /api/v1/comarcas            → ComarcasController@index
GET    /api/v1/estados             → EstadosController@index

# Kits
GET    /api/v1/kits                → KitsController@index
POST   /api/v1/kits                → KitsController@store
GET    /api/v1/kits/{id}           → KitsController@show
PUT    /api/v1/kits/{id}/status    → KitsController@updateStatus

# Extrações
GET    /api/v1/extracos            → ExtracaoController@index
POST   /api/v1/extracos            → ExtracaoController@store
GET    /api/v1/extracos/{id}/casos → ExtracaoCasoController@index
POST   /api/v1/extracos/{id}/casos → ExtracaoCasoController@attach

# Créditos
GET    /api/v1/creditos            → CreditoController@index
POST   /api/v1/creditos/gerar      → CreditoService::gerarPorJuiz

# SCEI (Laboratório)
GET    /api/v1/scei/exames         → ExamesController@index
POST   /api/v1/scei/procedimentos  → ProcedimentosController@store
GET    /api/v1/scei/laudos/{id}    → LaudosController@show

# Relatórios
POST   /api/v1/relatorios/gerar    → RelatorioController@gerar

# Admin
GET    /api/v1/admin/usuarios      → UsuariosController@index
GET    /api/v1/admin/auditoria     → AuditoriaController@index

# Health check
GET    /api/health                 → HealthController@check
```

---

## 💾 Banco de Dados

### Estratégia de Migrations
- 1 migration por tabela
- Nomes sequenciais: `0001_create_*`, `0002_create_*`, etc.
- Suportar rollback via `php artisan migrate:rollback`

### Relationships (Eloquent)

```php
// Caso.php
class Caso extends Model
{
    public function vara() { return $this->belongsTo(Vara::class); }
    public function juiz() { return $this->belongsTo(Juiz::class); }
    public function pessoas() { return $this->belongsToMany(Pessoa::class); }
    public function historico() { return $this->hasMany(Historico::class); }
    public function extracos() { return $this->belongsToMany(Extracao::class, 'extracao_casos'); }
    public function kits() { return $this->hasMany(Kit::class); }
    public function parcelas() { return $this->hasMany(Parcela::class); }
}

// Pessoa.php
class Pessoa extends Model
{
    public function casos() { return $this->belongsToMany(Caso::class); }
    public function enderecos() { return $this->hasMany(Endereco::class); }
}
```

### Softdeletes & Timestamps
- Todas as tabelas com `soft_delete()` (não apagar, marcar como deletado)
- Todas com `timestamps()` (`created_at`, `updated_at`)

---

## 🧪 Testes

### Estrutura
```
tests/
├── Feature/
│   ├── Auth/
│   │   ├── LoginTest.php
│   │   └── LogoutTest.php
│   ├── Casos/
│   │   ├── CreateCasoTest.php
│   │   ├── UpdateCasoTest.php
│   │   └── WorkflowTest.php
│   └── ...
└── Unit/
    ├── Services/
    │   ├── CasoServiceTest.php
    │   └── ...
    └── ...
```

### Requisitos
- **Coverage mínima**: 80%
- **Testes de integração**: com banco de teste (in-memory SQLite)
- **CI/CD**: GitHub Actions roda testes antes de merge

---

## 📝 Documentação da API

### Formato: OpenAPI 3.0 (Swagger)
- Gerado automaticamente via **L5-Swagger**
- Acessível em `/api/documentation`
- Exemplos de request/response incluídos

---

## 🚀 Deployment

### Docker (Recomendado)

```dockerfile
# Dockerfile
FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    mysql-client \
    redis \
    composer

WORKDIR /app
COPY . .
RUN composer install --no-dev --optimize-autoloader

EXPOSE 8000
CMD ["php", "artisan", "serve", "--host=0.0.0.0"]
```

### docker-compose.yml

```yaml
services:
  app:
    build: .
    ports:
      - "8000:8000"
  mysql:
    image: mysql:8.3
    environment:
      MYSQL_DATABASE: sgbd_scpg
      MYSQL_ROOT_PASSWORD: root
    volumes:
      - mysql_data:/var/lib/mysql
  redis:
    image: redis:7
    ports:
      - "6379:6379"

volumes:
  mysql_data:
```

---

## ⚙️ Comandos Essenciais

```bash
# Setup inicial
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate
php artisan seed

# Desenvolvimento
php artisan serve                    # Roda servidor local
php artisan tinker                   # Shell interativo
php artisan queue:work               # Processa jobs em background

# Testes
php artisan test                     # Roda suite de testes
php artisan test --coverage          # Com coverage report

# Deploy
php artisan migrate --force          # Aplica migrations em production
php artisan cache:clear             # Limpa caches
php artisan config:cache            # Cache de config

# Auditoria/Logs
php artisan audit:list              # Lista logs de auditoria
```

---

## 📋 Checklist: Próximos Passos

- [ ] Validar stack com time (Laravel 11, Sanctum, TCPDF, PhpSpreadsheet)
- [ ] Criar repositório Git (se ainda não existe)
- [ ] Setup ambiente local (Docker ou manual)
- [ ] Gerar migrations do banco (via MySQL schema)
- [ ] Começar Fase 3 — Regras de Negócio detalhadas

---

## 📞 Dúvidas sobre Arquitetura?

Consulte:
- **docs/MAPA-DELPHI-PHP.md** — para mapeamento de forms → endpoints
- **docs/INVENTARIO.md** — para detalhes de cada componente legado
- **docs/REGRAS-NEGOCIO-*.md** — (será criado na Fase 3) para regras específicas

