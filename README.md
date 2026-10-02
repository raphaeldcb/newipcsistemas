# Novos Sistemas IPC

Sistema de gestão de perícias judiciais com integração Microsoft 365 e processamento automático de comunicações.

**Status**: 🚀 Em Desenvolvimento (Fase 1 - Comunicações)

---

## 🤖 AI-Powered Email Classification (v2.0)

### Overview
Emails are now classified using **Qwen 7B** AI model via Ollama (running locally on port 11434).

### How It Works
1. User clicks Extract on an email in Comunicações
2. System sends subject + full body to Python service
3. Qwen analyzes and returns:
   - Classification (JUDICIAL / NON_JUDICIAL / UNKNOWN)
   - Confidence score (0.0-1.0)
   - Extracted fields: CNJ #, Vara, Comarca, Tribunal, Pedido summary
   - Reasoning for the classification
4. Database stores all results + confidence + timestamp
5. UI shows classification with confidence badge

### Confidence Interpretation
- **0.9-1.0**: Very confident, likely accurate
- **0.7-0.9**: Confident, occasional review recommended
- **0.5-0.7**: Moderate, review recommended
- **< 0.5**: Low confidence, manual review recommended

### Fallback Strategy
If Ollama/Qwen unavailable:
- System falls back to keyword matching (original method)
- Classification still works with lower confidence
- No user intervention needed

### Troubleshooting

**Q: Emails not classified as JUDICIAL?**
A:
1. Check Ollama running: `curl http://localhost:11434/api/tags`
2. Verify model: should see `perito-qwen`
3. Ensure email body is complete (not truncated in DB)
4. Run manual test: `python3 tests/test_qwen_classifier.py`

**Q: Classification taking too long?**
A: Qwen timeout is 30s. If Ollama is slow:
1. Free up system RAM
2. Check Ollama logs: `tail -f ~/.ollama/ollama.log`
3. Reduce concurrent extractions

**Q: JSON parsing error from Qwen?**
A: This triggers fallback automatically, but:
1. Check Qwen prompt in `QwenClassifierService.py`
2. Verify Ollama response manually
3. Check Ollama logs

### Configuration

**Qwen Model:**
- Model: `perito-qwen` (based on Qwen 7B)
- Port: 11434 (Ollama)
- Timeout: 30 seconds
- Temperature: 0.3 (low = consistent)

**Database Fields:**
- `confidence`: float (0.0-1.0)
- `reasoning`: text (brief explanation)
- `extracted_at`: timestamp (when classification ran)
- `full_body`: longtext (complete email body)

---

## 📋 Requisitos

- **Wampserver 3.3.5** (Apache 2.4.59 + PHP 8.2.18 + MySQL 8.3.0)
- **Python 3.13.3**
- **Node.js 22.16.0** (opcional)

Ou em máquina com:
- PHP 8.2.18
- MySQL 8.3.0
- Python 3.13.3

---

## 🚀 Instalação Rápida (Wampserver)

### 1. Clone o Repositório

```bash
cd C:\wamp64\www  # ou seu diretório www
git clone https://github.com/raphaeldcb/newipcsistemas.git
cd newipcsistemas
```

### 2. Configurar PHP (Wampserver)

```bash
# Copie o template de configuração
cp config/config.example.php config/config.php

# Edite config.php com suas credenciais Microsoft:
# - GRAPH_CLIENT_ID
# - GRAPH_CLIENT_SECRET  
# - GRAPH_TENANT_ID
# - GRAPH_MAILBOX
notepad config/config.php
```

### 3. Criar Banco MySQL

```bash
# Abra MySQL command line (Wampserver)
# Ou via terminal:
mysql -u root -p < database/install.sql

# Se solicitada senha, deixe em branco (padrão Wampserver)
mysql -u root < database/install.sql
```

### 4. Iniciar Wampserver

- Clique no ícone Wampserver → All Services Online
- Verifique MySQL e Apache (devem estar verde)

### 5. Acessar Sistema

```
http://localhost/newipcsistemas
```

**Login Padrão**:
- Email: `admin@ipcms.com.br`
- Senha: `admin123`

---

## 🔧 Configuração Microsoft Graph

### 1. Crie App no Azure

1. Vá para [Azure Portal](https://portal.azure.com)
2. App registrations → New registration
3. Nome: "Novos Sistemas IPC"
4. Supported account types: "Accounts in this organizational directory only"
5. Clique em Register

### 2. Copie Credenciais

- **Client ID**: Copie de "Application (client) ID"
- **Tenant ID**: Copie de "Directory (tenant) ID"  
- **Client Secret**: 
  - Vá em Certificates & secrets
  - New client secret
  - Copie o valor (só aparece uma vez!)

### 3. Configure Permissões

1. API permissions
2. Add a permission → Microsoft Graph
3. Application permissions (não delegated):
   - `Mail.Read`
   - `Mail.ReadWrite`
   - `Files.Read.All`
4. Grant admin consent

### 4. Atualize config.php

```php
'microsoft' => [
    'client_id' => 'SEU_CLIENT_ID',
    'client_secret' => 'SEU_CLIENT_SECRET',
    'tenant_id' => 'SEU_TENANT_ID',
    'mailbox' => 'seu@email.com',
    'redirect_uri' => 'http://localhost/newipcsistemas/auth/callback',
],
```

---

## 📧 Funcionalidades (Fase 1 - Comunicações)

- ✅ Interface de login
- ✅ Dashboard com menu
- ✅ Tela de Comunicações (visualização)
- ⏳ Sincronização Microsoft Graph
- ⏳ Extração automática de informações
- ⏳ Classificação de mensagens
- ⏳ Template de respostas automáticas
- ⏳ Painel administrativo

---

## 🐍 Serviço Python

### Instalação

```bash
# Certifique-se que Python 3.13 está instalado
python --version

# Instale dependências
pip install -r python/requirements.txt
```

### Executar Sincronização

```bash
python python/email_processor.py
```

### Daemon (Executar em Background)

**Windows**:
```bash
# Via Task Scheduler
# - Crie nova tarefa
# - Ação: C:\Python313\python.exe
# - Argumentos: C:\wamp64\www\newipcsistemas\python\email_processor.py
```

**Linux/Mac**:
```bash
# Via cron
crontab -e

# Adicione linha para executar a cada 5 minutos:
*/5 * * * * /usr/bin/python3 /path/to/newipcsistemas/python/email_processor.py >> /path/to/newipcsistemas/logs/cron.log 2>&1
```

---

## 📁 Estrutura do Projeto

```
newipcsistemas/
├── config/
│   ├── config.example.php    # Template (copie para config.php)
│   └── config.php            # Configuração local (gitignored)
├── database/
│   └── install.sql           # Schema MySQL
├── html/
│   ├── views/                # Arquivos HTML/PHP das telas
│   ├── controllers/          # Lógica de requisições
│   └── models/               # Modelos de dados (em desenvolvimento)
├── python/
│   ├── email_processor.py    # Sincronização e processamento
│   └── requirements.txt      # Dependências Python
├── logs/                     # Arquivos de log
│── public/                   # Arquivos estáticos (CSS, JS, imagens)
├── index.php                 # Entry point da aplicação
├── .gitignore               # Ignora credenciais e temporários
└── README.md                 # Este arquivo
```

---

## 🗄️ Banco de Dados

### Tabelas Principais

| Tabela | Descrição |
|--------|-----------|
| `users` | Usuários do sistema |
| `communications` | Emails sincronizados |
| `communication_attachments` | Anexos de emails |
| `response_templates` | Templates de respostas automáticas |
| `sync_control` | Controle de sincronização |
| `processing_log` | Auditoria de processamentos |

### Acessar MySQL

```bash
mysql -u root newipcsistemas

# Alguns comandos úteis:
SHOW TABLES;
SELECT COUNT(*) FROM communications;
SELECT * FROM users;
```

---

## 🐛 Troubleshooting

### "Access denied for user 'root'"
```bash
# MySQL padrão Wampserver não tem senha
mysql -u root newipcsistemas

# Se tiver senha:
mysql -u root -pSEUHA newipcsistemas
```

### "Table doesn't exist"
```bash
# Reimporte o SQL:
mysql -u root < database/install.sql
```

### "PHP parse error"
- Verifique que PHP 8.2.18+ está ativo (Wampserver)
- Verifique sintaxe do config.php

### "Página em branco"
```bash
# Ative exibição de erros em config/config.example.php:
'app' => [
    'debug' => true,  // Deve ser true em desenvolvimento
],
```

---

## 📝 Desenvolvendo

### Adicionar Nova Página

1. Crie em `html/views/minha_pagina.php`
2. Adicione rota em `index.php`
3. Adicione menu em dashboard.php/comunicacoes.php

### Adicionar Modelo de Dados

1. Crie classe em `html/models/MeuModelo.php`
2. Herde de base Model (em desenvolvimento)
3. Use em controllers

### Modificar Schema SQL

1. Edite `database/install.sql`
2. Exporte dados atuais (backup)
3. Reimporte schema
4. Reinsira dados

---

## 📊 Próximos Passos

1. **Implementar Microsoft Graph OAuth**
2. **Sincronizar emails em tempo real**
3. **Extrair informações (vara, processo, pedido)**
4. **Classificação automática de mensagens**
5. **Painel administrativo de configurações**
6. **Templates de resposta automática**
7. **Relatórios e estatísticas**
8. **Deploy em produção**

---

## 🔐 Segurança

### NÃO fazer commit:
- `config/config.php` (use apenas .example)
- Tokens ou credenciais
- Senhas do banco

### Configurações Sensíveis:
- Armazenadas em `config.php` (gitignored)
- Nunca log de secrets
- Validação de todas as entradas
- Proteção CSRF em formulários

---

## 📞 Suporte

- **Issues**: GitHub
- **Email**: admin@ipcms.com.br

---

**Última atualização**: 29/09/2026  
**Versão**: 1.0.0-alpha  
**Desenvolvedor**: IPC MS Perícias LTDA
