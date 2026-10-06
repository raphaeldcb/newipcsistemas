# Novos Sistemas IPC — Sistema de Gestão Integrado

Aplicação Laravel unificada para gestão de perícias judiciais com integração Microsoft 365, classificação por IA (Ollama/Qwen), e rastreamento de processos.

**Status**: 🚀 Em desenvolvimento (Etapa 2/8 — Unificação)  
**Versão**: 2.0.0-alpha  
**Licença**: Proprietary

---

## 📋 Requisitos

### Obrigatório
- **PHP 8.3+** (não 8.2)
- **MySQL 8.3**
- **Composer** (>=2.0)
- **Node.js 18+** (opcional, para Vite)

### Opcional
- **Python 3.13+** (para Ollama/Qwen classification)
- **Redis** (para cache e filas)
- **Ollama** (para classificação de e-mails)

### Plataformas Suportadas

**macOS**:
```bash
/bin/bash -c "$(curl -fsSL https://php.new/install/mac/8.5)"
```

**Windows** (PowerShell):
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://php.new/install/windows/8.5'))
```

**Linux** (Ubuntu/Debian):
```bash
sudo apt update && sudo apt install php8.3 mysql-server composer nodejs npm
```

**Wampserver** (Windows + Apache):
- Atualizar para versão com PHP 8.3
- MySQL 8.3 incluído
- Apache 2.4+

---

## 🚀 Instalação Rápida

### 1. Clonar Repositório

```bash
git clone https://github.com/raphaeldcb/newipcsistemas.git
cd newipcsistemas
git checkout unificacao  # Branch de desenvolvimento
```

### 2. Configurar Ambiente

```bash
# Copiar template
cp api/.env.example .env

# Editar .env com suas credenciais
# - DB_HOST, DB_DATABASE, DB_USERNAME, DB_PASSWORD
# - GRAPH_CLIENT_ID, GRAPH_CLIENT_SECRET, GRAPH_TENANT_ID (Microsoft)
# - OLLAMA_HOST (localhost:11434)
nano .env
```

### 3. Instalar Dependências

```bash
composer install
npm install
```

### 4. Preparar Banco de Dados

```bash
# Backup dos bancos antigos
bash backup-bancos.sh

# Migrations (NÃO use migrate:fresh)
php artisan migrate

# Seed de administrador
php artisan db:seed --class=AdminSeeder
```

### 5. Iniciar Aplicação

```bash
# Terminal 1: Laravel server
php artisan serve
# http://localhost:8000

# Terminal 2: Vite (assets)
npm run dev

# Terminal 3: Ollama (se usar classificação)
ollama serve  # ou gerenciador do seu SO
```

---

## 🔧 Configuração Microsoft Graph

**Necessário para sincronizar e-mails**.

### 1. Registrar App no Azure

1. [Azure Portal](https://portal.azure.com) → App registrations
2. New registration
   - Nome: "Novos Sistemas IPC"
   - Supported account types: "Accounts in this organizational directory only"
3. Register

### 2. Copiar Credenciais

- **Client ID** (Application ID) → `GRAPH_CLIENT_ID` em `.env`
- **Tenant ID** (Directory ID) → `GRAPH_TENANT_ID` em `.env`
- **Client Secret**:
  - Certificates & secrets → New client secret
  - Copie o valor (aparece uma vez)
  - Coloque em `GRAPH_CLIENT_SECRET` em `.env`

### 3. Configurar Permissões

1. API permissions → Add a permission
2. Microsoft Graph → Application permissions
   - `Mail.Read`
   - `Mail.ReadWrite`
   - `Files.Read.All`
3. Grant admin consent

### 4. Redirect URI

1. Autenticação → Redirect URIs
   - Adicione: `http://localhost:8000/auth/microsoft/callback` (desenvolvimento)
   - Adicione: `https://seu-dominio.com/auth/microsoft/callback` (produção)

---

## 🐍 Configuração Ollama (Opcional)

Para classificação automática de e-mails por IA.

### 1. Instalar Ollama

[ollama.ai](https://ollama.ai) → Download para seu SO

### 2. Puxar Modelo

```bash
ollama pull qwen:7b
# ou, se tiver modelo customizado:
ollama pull perito-qwen
```

### 3. Configurar em .env

```
OLLAMA_HOST=http://localhost:11434
OLLAMA_MODEL=qwen:7b
OLLAMA_TIMEOUT=30
```

### 4. Verificar

```bash
curl http://localhost:11434/api/tags
```

Se Ollama não estiver disponível, o sistema usa fallback por palavras-chave.

---

## 📊 Estrutura do Projeto

```
newipcsistemas/
├── api/                      ← Aplicação Laravel (raiz após unificação)
│   ├── app/Models            ← Eloquent models
│   ├── app/Http/Controllers  ← Controllers API + Web
│   ├── app/Services          ← Lógica de negócio
│   ├── app/Repositories      ← Acesso a dados
│   ├── database/migrations   ← Schema (NÃO use migrate:fresh)
│   ├── resources/views       ← Templates Blade
│   ├── routes/web.php        ← Rotas web (autenticação, dashboard)
│   ├── routes/api.php        ← Rotas API v1
│   └── composer.json         ← Dependências
├── python/                   ← Serviço de classificação
│   ├── QwenClassifierService.py
│   └── requirements.txt
├── docs/                     ← Documentação
│   ├── ARQUITETURA.md        ← Stack e padrões
│   ├── DECISOES.md           ← Decisões arquiteturais (ADRs)
│   ├── PROGRESSO.md          ← Estado da unificação
│   └── REGRAS-NEGOCIO-*.md   ← Regras por módulo
├── banco/                    ← Scripts de migração de bancos
├── _antigo/                  ← App antigo (temporário)
└── CLAUDE.md, README.md      ← Documentação

```

---

## 📧 Funcionalidades Atuais

| Módulo | Status | Descrição |
|---|---|---|
| **Auth** | ✅ Pronto | Login local + Microsoft OAuth |
| **Dashboard** | ✅ Pronto | Menu unificado |
| **Comunicações** | ⏳ Portando | Sincronização e classificação de e-mails |
| **Casos** | ✅ API | State machine (10 estados) |
| **Pessoas** | ✅ API | Gestão de pessoas, contatos |
| **Kits** | ✅ API | Rastreamento de coletas |
| **Extrações** | ✅ API | 3 fases de análise ADN |
| **SCEI** | ✅ API | Laboratório integrado |
| **Créditos** | ✅ API | Cálculo 5-fator + parcelamento |
| **Alelos** | ✅ API | Marcadores genéticos |
| **Relatórios** | ✅ API | PDF/Excel |
| **Admin** | ✅ API | Usuários, auditoria, parâmetros |

---

## 🧪 Testes

```bash
# Rodar suite completa
composer test

# Teste específico
php artisan test tests/Feature/Api/ComunicacoesTest.php

# Com cobertura
php artisan test --coverage

# Smoke test (rotas principais)
php artisan test tests/Feature/SmokeTest.php
```

**Banco de testes**: `sgbd_scpg_test` (automático, migrations por teste)

---

## 🚀 Deployment

### Produção (Linux + Nginx)

```bash
# Build
npm run build
composer install --no-dev

# Variáveis
cat > .env.production << EOF
APP_ENV=production
APP_DEBUG=false
DB_HOST=db.production.com
GRAPH_CLIENT_ID=...
# ... demais variáveis
EOF

# Migrations
php artisan migrate --force

# Cache
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Nginx rewrite (Laravel 11)
# Reescrever requisições para public/index.php
```

### Nginx Config (exemplo)

```nginx
server {
    listen 443 ssl http2;
    server_name api.ipcms.com.br;

    root /var/www/newipcsistemas/public;
    index index.php;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        fastcgi_pass unix:/var/run/php-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
    }

    ssl_certificate /etc/letsencrypt/live/api.ipcms.com.br/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/api.ipcms.com.br/privkey.pem;
}
```

---

## 🐛 Troubleshooting

### "PHP version must be ^8.3"

```bash
php --version  # Deve mostrar >= 8.3
# Se for 8.2, atualizar:
# - macOS: brew upgrade php
# - Windows: Wampserver com PHP 8.3
# - Linux: sudo apt install php8.3-*
```

### "SQLSTATE[HY000]: General error: 1030 Got error..."

Banco `sgbd_scpg` não existe ou sem permissão. Criar:

```sql
CREATE DATABASE sgbd_scpg
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;
GRANT ALL ON sgbd_scpg.* TO 'seu_usuario'@'localhost';
```

### "Ollama connection refused"

Ollama não está rodando. Iniciar:

```bash
ollama serve
```

Se não tiver modelo, o sistema usa fallback automático (sem erro).

### "Redirect URI mismatch" (Microsoft)

Verificar em Azure Portal → Autenticação → Redirect URIs:
- Desenvolvimento: `http://localhost:8000/auth/microsoft/callback`
- Produção: seu domínio com HTTPS

---

## 📚 Documentação Completa

Para detalhes, ver:
- **docs/ARQUITETURA.md** — Stack, padrões, decisões
- **docs/DECISOES.md** — ADRs (migrations, soft deletes, etc.)
- **docs/REGRAS-NEGOCIO-*.md** — Regras por domínio
- **docs/banco/CONVERSAO-FIREBIRD-MYSQL.md** — Migração Firebird
- **docs/PROGRESSO.md** — Etapas de unificação
- **CLAUDE.md** — Instruções para IA/agentes

---

## 🔐 Segurança

- ✅ Senhas: bcrypt (Laravel padrão)
- ✅ API: Sanctum JWT + HTTPS (produção)
- ✅ LGPD: soft deletes, auditoria, event sourcing
- ✅ Validação: Form Requests, rate limiting
- ⚠️ NUNCA commitar `.env`, credenciais, dados reais

---

## 📞 Suporte

- **Issues**: [GitHub](https://github.com/raphaeldcb/newipcsistemas/issues)
- **Documentação**: Ver `docs/` deste repositório
- **Email**: admin@ipcms.com.br

---

**Última atualização**: 2026-10-06  
**Versão**: 2.0.0-alpha  
**Desenvolvedor**: IPC MS Perícias LTDA
