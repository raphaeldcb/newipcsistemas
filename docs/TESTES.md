# Guia de Testes — Novos Sistemas IPC

## Rodar Testes

### Todos os testes
```bash
composer test
```

### Teste específico
```bash
php artisan test tests/Feature/Api/ComunicacoesTest.php
php artisan test tests/Unit/Services/ClassificacaoServiceTest.php
php artisan test tests/Feature/Web/RoutesTest.php --filter=pode_listar_comunicacoes
```

### Com cobertura (80%+)
```bash
php artisan test --coverage
```

### Sem cache (forçar rerun)
```bash
php artisan test --no-cache
```

## Estrutura de Testes

```
tests/
├── Feature/
│   ├── Api/
│   │   └── ComunicacoesTest.php       (CRUD + classificação)
│   └── Web/
│       └── RoutesTest.php             (Smoke tests de rotas)
└── Unit/
    ├── Models/
    │   └── ComunicacaoTest.php        (Relações, scopes, soft deletes)
    └── Services/
        └── ClassificacaoServiceTest.php (Fallback, parsing, keywords)
```

## O que está testado

### Feature Tests (API)
✅ Listar comunicações com paginação
✅ Criar comunicação (novos registros)
✅ Visualizar comunicação (detalhe)
✅ Atualizar comunicação (classification, caso_id)
✅ Deletar comunicação (soft delete)
✅ Classificar comunicação (chamar Ollama)
✅ Requer autenticação Sanctum
✅ Filtra por classification

### Feature Tests (Web)
✅ GET / redireciona para dashboard (autenticado) ou login
✅ GET /login disponível (guest)
✅ POST /logout limpa sessão
✅ /dashboard requer autenticação
✅ /comunicacoes, /casos, /pessoas requerem autenticação

### Unit Tests (Services)
✅ Fallback classifica texto judicial (múltiplos keywords)
✅ Fallback classifica texto não-judicial
✅ Retorna estrutura esperada (classification, confidence, reasoning)
✅ Confidence está entre 0 e 1
✅ Detecta múltiplas palavras-chave

### Unit Tests (Models)
✅ Criar Comunicacao
✅ Associar Caso (relacionamento)
✅ Scopes funcionam (judicial, highConfidence)
✅ Soft delete funciona
✅ Castings funcionam (float, json)

## Banco de Testes

**Configuração**: `phpunit.xml`
```xml
DB_CONNECTION=mysql
DB_DATABASE=sgbd_scpg_test
DB_HOST=127.0.0.1
DB_USERNAME=root
DB_PASSWORD=
```

**Preparar banco de testes**:
```bash
# Criar banco (via MySQL cliente)
mysql -u root -e "CREATE DATABASE sgbd_scpg_test CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;"

# Rodar migrations (automático na primeira execução de testes)
php artisan migrate --database=sqlite_testing
```

## Smoke Tests (Manual)

### 1. Login
```bash
curl -X POST http://localhost:8000/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"admin@ipcms.com.br","password":"admin123"}'
```

### 2. Listar Comunicações
```bash
curl -X GET http://localhost:8000/api/v1/comunicacoes \
  -H "Authorization: Bearer $TOKEN"
```

### 3. Criar Comunicação
```bash
curl -X POST http://localhost:8000/api/v1/comunicacoes \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "email_from": "teste@example.com",
    "email_to": "destino@example.com",
    "subject": "Assunto teste",
    "body": "Corpo do email"
  }'
```

### 4. Classificar Comunicação
```bash
curl -X POST http://localhost:8000/api/v1/comunicacoes/1/classificar \
  -H "Authorization: Bearer $TOKEN"
```

## Cobertura Esperada

**Meta**: 80%+ de cobertura

**Por módulo**:
- Models (Comunicacao, User, etc): 90%+
- Services (ClassificacaoService): 85%+
- Controllers (API, Web): 75%+
- Overall: 80%+

## CI/CD

Testes rodam automaticamente em GitHub Actions:
- No push para `unificacao` branch
- No pull request para `main`
- Antes de merge em main

**Arquivo**: `.github/workflows/tests.yml` (a implementar)

## Troubleshooting

### "SQLSTATE[HY000]: General error: 1030"
```
Banco sgbd_scpg_test não existe.
Criar: mysql -u root -e "CREATE DATABASE sgbd_scpg_test;"
```

### "Connection refused" (Ollama)
```
Ollama não está rodando (testes usam fallback automático).
Iniciar: ollama serve
```

### "Class 'User' not found"
```
Falta factory ou migration do User.
Rodar: php artisan migrate
```

## Próximos Passos

- ✅ Testes API Comunicações (CRUD + classificação)
- ✅ Testes Web (rotas + autenticação)
- ✅ Testes Services (fallback)
- ✅ Testes Models (relações, soft deletes)
- ⏳ Testes Casos (state machine, transições)
- ⏳ Testes Pessoas (CRUD)
- ⏳ Testes Créditos (cálculo 5-fator)
- ⏳ Testes Auth (login, token refresh)
- ⏳ Testes integrações (Graph API stub)
