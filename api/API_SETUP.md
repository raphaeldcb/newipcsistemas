# SCPG API — Setup & Documentation

## Estrutura de Projeto

```
api/
├── app/
│   ├── Models/                     # Eloquent Models (15 models base)
│   │   ├── BaseModel.php          # Base com SoftDeletes
│   │   ├── UF.php, Comarca.php, ... (14 models mais)
│   │
│   ├── Repositories/              # Repository Pattern
│   │   ├── BaseRepository.php     # CRUD base
│   │   └── *Repository.php        # (15 repositories)
│   │
│   ├── Services/                  # Business Logic
│   │   ├── BaseService.php
│   │   ├── CasoService.php        # Workflow de casos (complex)
│   │   └── ...
│   │
│   ├── Http/Controllers/Api/
│   │   ├── AuthController.php     # Sanctum JWT
│   │   ├── PessoasController.php  # Fatia 1
│   │   ├── UFController.php, ...  # (5 controllers mais)
│   │
│   ├── Enums/
│   │   └── CasoStatus.php         # Workflow states + validations
│   │
│   └── ...
│
├── database/
│   ├── migrations/                # 15 migrations + Sanctum
│   └── factories/                 # (para testes)
│
├── routes/
│   └── api.php                    # /api/v1/* endpoints
│
├── tests/
│   ├── Feature/                   # API endpoint tests
│   └── Unit/                      # Service/Repository tests
│
└── .env                           # MySQL 8.3 config (local)
```

## Endpoints Principais

### Authentication
```
POST   /api/v1/auth/login           (public)
POST   /api/v1/auth/logout          (protected)
POST   /api/v1/auth/refresh         (protected)
GET    /api/v1/auth/me              (protected)
```

### Foundational Data
```
GET    /api/v1/ufs
POST   /api/v1/ufs
GET    /api/v1/ufs/{id}
PUT    /api/v1/ufs/{id}
DELETE /api/v1/ufs/{id}

# Similar para: comarcas, varas, juizes
```

### Core Entities
```
GET    /api/v1/pessoas
POST   /api/v1/pessoas
GET    /api/v1/pessoas/{id}
PUT    /api/v1/pessoas/{id}
DELETE /api/v1/pessoas/{id}

# Similar para: casos, creditos
```

## Exemplo de Requisição

```bash
# 1. Login
curl -X POST http://localhost:8000/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "usuario@example.com",
    "password": "senha123"
  }'

# Resposta:
{
  "token": "1|aBcDeF...",
  "user": { "id": 1, "email": "..." }
}

# 2. Usar token (adicionar header Authorization)
curl -X GET http://localhost:8000/api/v1/pessoas \
  -H "Authorization: Bearer 1|aBcDeF..."

# Resposta:
{
  "data": [...],
  "links": {...},
  "meta": {...}
}
```

## Modelos Relacionais

### Relacionamentos Implementados
- `Caso` hasMany `Historico` (auditoria)
- `Caso` hasMany `Credito` (créditos gerados)
- `Credito` hasMany `Parcela` (parcelamento)
- `Comarca` belongsTo `UF` (estado)
- `Vara` belongsTo `Comarca` (comarca)
- `Extracao` hasMany `ExtracacaoCaso` (casos por extração)

### Soft Deletes
Todas as 15 tabelas têm `deleted_at` para LGPD compliance:
```php
// Soft delete (preserva dados)
$pessoa->delete();

// Recuperar deleted
$pessoa->restore();

// Permanently delete
$pessoa->forceDelete();

// Incluir deleted em queries
$pessoas = Pessoa::withTrashed()->get();
```

## CasoService — Workflow de Estados

10 estados com validações por estado:

```php
// Transicionar
$service = app(CasoService::class);
$service->transicionar($caso, CasoStatus::COLETA_AGENDADA->value, 'Agendado para 10/10');

// Estados:
// PENDENTE → COLETA_AGENDADA → COLETA_REALIZADA → AMOSTRA_RECEBIDA
// → EM_EXTRACAO → EXTRACAO_CONCLUIDA → EM_ANALISE → LAUDO_EMITIDO
// → CASO_FINALIZADO (gera créditos automaticamente)
// OU CANCELADO (em qualquer ponto)
```

## Testes

```bash
# Rodar tests
php artisan test

# Com coverage
php artisan test --coverage

# Feature tests específicos
php artisan test tests/Feature/Api/PessoasControllerTest.php
```

## Deploy Local

```bash
# 1. Instalar dependências
composer install

# 2. Configurar .env (MySQL local)
cp .env.example .env
# Editar: DB_HOST=127.0.0.1, DB_DATABASE=sgbd_scpg, DB_USERNAME=root

# 3. Gerar chave da app
php artisan key:generate

# 4. Rodar migrations
php artisan migrate

# 5. Rodar servidor local
php artisan serve
# Acessar: http://localhost:8000/api/docs

# 6. (Opcional) Gerar dados de teste
php artisan tinker
# > \App\Models\Pessoa::factory(50)->create();
```

## Stack Confirmada

- **Framework**: Laravel 11
- **Auth**: Sanctum JWT (24h access, 7d refresh)
- **ORM**: Eloquent
- **Database**: MySQL 8.3 (schema: sgbd_scpg)
- **Pattern**: Service → Repository → Model
- **Testing**: PHPUnit + Pest (80% coverage target)
- **Audit**: Soft deletes + Historico table

## Próximas Fases

- [ ] Fatia 1 (Pessoas) — Controllers, Services, Repositories completos com testes
- [ ] Fatia 2 (Casos) — State machine, events, validações
- [ ] Fatia 3 (Kits) — Rastreamento de coletas
- [ ] Fatia 4 (Extrações) — 3 fases sequenciais
- [ ] Fatia 5 (SCEI) — Laboratório integrado
- [ ] Fatia 6 (Créditos) — 5-factor calculation
- [ ] Fatia 7 (Alelos) — Genética
- [ ] Fatia 8 (Relatórios) — PDF/Excel generation
- [ ] Fatia 9 (Admin) — Users, auditoria

---

**Status**: Fase 4 — 50% completo (Models + Repositories base, Auth setup)  
**Próximo**: Testes unitários + Feature tests para Fatia 1 (Pessoas)
