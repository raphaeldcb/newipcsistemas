# Getting Started — Novos Sistemas IPC

## ⚡ 5-Minute Setup

### Prerequisites Check
```bash
# PHP 8.2+
php --version

# MySQL 8.0+
mysql --version

# Python 3.13+
python3 --version

# Ollama
curl http://localhost:11434/api/tags
```

### Step 1: Clone & Configure
```bash
git clone https://github.com/raphaeldcb/newipcsistemas.git
cd newipcsistemas

cp config/config.example.php config/config.php
# Edit config.php - change db credentials
```

### Step 2: Database
```bash
mysql -u root -p < database/install.sql
```

### Step 3: Ollama
```bash
# Terminal 1
ollama pull qwen:7b
ollama serve
```

### Step 4: Start Server
```bash
# Terminal 2
php -S localhost:8000 -t html
```

### Step 5: Access
- Open http://localhost:8000
- Login: `admin@ipcms.com.br` / `admin123`

## 🧪 Testing Without Microsoft

Don't have Microsoft 365 credentials? No problem!

```bash
# Seed test data
php seed-test-data.php

# This creates 6 realistic judicial communications
# All ready for extraction testing
```

Then navigate to **Comunicações** and click "🔍 Extrair" on any email.

## 📊 Test Workflows

### Workflow 1: Complete Setup Test
```bash
./test-extraction.sh
```

Validates:
- ✅ Python installed
- ✅ Ollama accessible
- ✅ Qwen model available
- ✅ Config file exists
- ✅ PHP installed

### Workflow 2: API Test
```bash
./test-api.sh http://localhost:8000
```

Validates:
- ✅ Server responding
- ✅ Login page loads
- ✅ Authentication required
- ✅ Extraction service works

### Workflow 3: Quick Start
```bash
./quick-start.sh start      # Start server
./quick-start.sh seed       # Seed test data
./quick-start.sh test       # Run all tests
./quick-start.sh extract    # Test AI extraction
```

## 🔄 Manual Test Flow

1. **Start Services**
   ```bash
   # Terminal 1: Ollama
   ollama serve
   
   # Terminal 2: PHP Server
   php -S localhost:8000 -t html
   ```

2. **Create Test Data**
   ```bash
   php seed-test-data.php
   ```

3. **Access System**
   - Go to http://localhost:8000
   - Login with admin@ipcms.com.br / admin123

4. **Navigate to Comunicações**
   - See 6 test communications (status: "new")
   - Each has realistic judicial content

5. **Click Extract Button**
   - Button becomes "⏳ Extraindo..."
   - Qwen processes the email
   - Extracted fields appear (vara, comarca, processo, etc)
   - Status changes to "processado"

6. **View Results**
   - Vara/Comarca columns now populated
   - Check database audit log

## 📁 File Structure

```
newipcsistemas/
├── html/
│   ├── controllers/          # PHP business logic
│   │   ├── AuthController.php
│   │   ├── OAuthController.php
│   │   ├── CommunicacionsController.php
│   │   └── ExtractionController.php
│   ├── views/               # PHP templates
│   │   ├── login.php
│   │   ├── dashboard.php
│   │   ├── comunicacoes.php
│   │   └── auth_*.php
│   ├── models/              # Data models
│   │   └── Communication.php
│   └── services/            # External API services
│       └── MicrosoftGraphService.php
│
├── python/
│   ├── extraction_service.py # Ollama/Qwen integration
│   ├── requirements.txt
│   └── email_processor.py
│
├── database/
│   └── install.sql          # Schema + test data
│
├── config/
│   └── config.example.php   # Configuration template
│
├── api.php                  # JSON API router
├── index.php                # Web router
│
├── quick-start.sh           # Unified startup
├── test-extraction.sh       # Validation tests
├── test-api.sh              # API tests
├── seed-test-data.php       # Test data
└── README_SETUP.md
```

## 🔧 Configuration

Edit `config/config.php`:

```php
// Database
'db' => [
    'host' => 'localhost',
    'username' => 'root',
    'password' => 'your_password',
    'database' => 'novos_sistemas_ipc',
],

// Ollama (local)
'python' => [
    'ollama_url' => 'http://localhost:11434',
    'ollama_model' => 'qwen:7b',
],

// Microsoft (optional - for real emails)
'microsoft' => [
    'client_id' => 'YOUR_CLIENT_ID',
    'client_secret' => 'YOUR_CLIENT_SECRET',
    'tenant_id' => 'YOUR_TENANT_ID',
],
```

## 🚨 Troubleshooting

### "Ollama not accessible"
```bash
# Check if Ollama is running
curl http://localhost:11434/api/tags

# Start Ollama
ollama serve
```

### "Qwen model not found"
```bash
# List available models
ollama list

# Pull Qwen
ollama pull qwen:7b
```

### "Database connection error"
```bash
# Test MySQL
mysql -u root -p -e "SELECT 1"

# Check credentials in config/config.php
# Recreate database
mysql -u root -p < database/install.sql
```

### "PHP 500 error"
- Check `error_log` output
- Ensure all files have correct permissions
- Verify config.php is readable

### "Extraction button not working"
- Ensure Python is installed: `python3 --version`
- Check Ollama is running: `curl http://localhost:11434/api/tags`
- Verify extraction service: `python3 python/extraction_service.py test`

## 📚 API Examples

### List Communications
```bash
curl -s "http://localhost:8000/api.php?action=list" | jq
```

### Get Statistics
```bash
curl -s "http://localhost:8000/api.php?action=stats" | jq
```

### Extract Single Communication
```bash
curl "http://localhost:8000/api.php?action=extract&id=1"
```

### Batch Extract (requires auth)
```bash
curl -b "cookie.txt" "http://localhost:8000/api.php?action=extract_batch&status=new&limit=10"
```

## 🎯 Next Steps

1. **Test extraction** with seed data ✅
2. **Configure Microsoft** credentials (optional)
3. **Sync real emails** from Microsoft 365
4. **Automate extraction** with batch process
5. **Monitor audit logs** for all operations

## 📖 Documentation

- [README_SETUP.md](README_SETUP.md) — Detailed setup
- [database/install.sql](database/install.sql) — Schema
- [config/config.example.php](config/config.example.php) — All config options

## 🤝 Support

For issues:
1. Run `./test-extraction.sh` to validate setup
2. Check logs in `error_log` and `logs/`
3. Verify database: `mysql -u root -p novos_sistemas_ipc`
4. Test extraction directly: `python3 python/extraction_service.py test`

---

**Ready to start?**

```bash
./quick-start.sh start
```

Then visit http://localhost:8000 🚀
