#!/bin/bash

# Test Extraction Service Integration
# Validates Python service, PHP controller, and API endpoints

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "🧪 Testing Extraction Service Integration"
echo "=========================================="

# 1. Check Python installation
echo ""
echo "1️⃣  Checking Python..."
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 not found"
    exit 1
fi
PYTHON_VERSION=$(python3 --version 2>&1)
echo "✅ $PYTHON_VERSION"

# 2. Check requirements
echo ""
echo "2️⃣  Checking Python dependencies..."
if ! python3 -c "import requests" 2>/dev/null; then
    echo "⚠️  Missing requests module, installing..."
    pip install requests>=2.31.0
fi
echo "✅ Dependencies OK"

# 3. Test Ollama connection
echo ""
echo "3️⃣  Checking Ollama connection..."
if curl -s http://localhost:11434/api/tags > /dev/null 2>&1; then
    echo "✅ Ollama is running"
    MODELS=$(curl -s http://localhost:11434/api/tags | python3 -c "import sys, json; data=json.load(sys.stdin); print(', '.join([m['name'] for m in data.get('models', [])]) if data.get('models') else 'No models')")
    echo "   Models available: $MODELS"
else
    echo "❌ Ollama not accessible at localhost:11434"
    echo "   Start Ollama with: ollama serve"
    exit 1
fi

# 4. Check for qwen model
echo ""
echo "4️⃣  Checking for Qwen model..."
if curl -s http://localhost:11434/api/tags | grep -q "qwen"; then
    echo "✅ Qwen model found"
else
    echo "⚠️  Qwen not found, pulling qwen:7b..."
    echo "   Run: ollama pull qwen:7b"
    exit 1
fi

# 5. Test extraction service directly
echo ""
echo "5️⃣  Testing extraction_service.py directly..."
TEST_EMAIL='{
  "id": 1,
  "subject": "Perícia Contábil - Processo 0123456-78.2024.8.26.0100",
  "from_name": "Tribunal de Justiça",
  "from_address": "protocolo@tjsp.jus.br",
  "body_preview": "Solicitamos perícia contábil de urgência para análise de bens no processo de divórcio.",
  "received_datetime": "2024-09-29T10:00:00"
}'

EXTRACTION_RESULT=$(echo "$TEST_EMAIL" | python3 python/extraction_service.py extract http://localhost:11434 qwen:7b 2>/dev/null)

if echo "$EXTRACTION_RESULT" | python3 -c "import sys, json; json.load(sys.stdin); print('OK')" 2>/dev/null; then
    echo "✅ Extraction service works"
    echo "   Result:"
    echo "$EXTRACTION_RESULT" | python3 -m json.tool 2>/dev/null | sed 's/^/      /'
else
    echo "❌ Extraction service error"
    echo "   Output: $EXTRACTION_RESULT"
    exit 1
fi

# 6. Check config.php
echo ""
echo "6️⃣  Checking configuration..."
if [ ! -f "config/config.php" ]; then
    echo "⚠️  config/config.php not found"
    echo "   Copy from config/config.example.php:"
    echo "   cp config/config.example.php config/config.php"
    echo "   Then configure your database credentials"
    exit 1
fi
echo "✅ Config file exists"

# 7. Check PHP
echo ""
echo "7️⃣  Checking PHP..."
if ! command -v php &> /dev/null; then
    echo "❌ PHP not found"
    exit 1
fi
PHP_VERSION=$(php --version | head -n 1)
echo "✅ $PHP_VERSION"

# 8. Test API endpoint (if server is running)
echo ""
echo "8️⃣  Testing API endpoints..."
if curl -s http://localhost/api.php 2>/dev/null | grep -q "Not authenticated"; then
    echo "✅ API server is responding"
else
    echo "⚠️  API server not accessible at localhost"
    echo "   Make sure the PHP server is running on port 80"
    echo "   Or test with: php -S localhost:8000"
fi

echo ""
echo "✅ All checks passed!"
echo ""
echo "📋 Next steps:"
echo "1. Start Ollama: ollama serve"
echo "2. Start PHP server: php -S localhost:8000 -t html"
echo "3. Login at http://localhost:8000/"
echo "4. Connect to Microsoft 365"
echo "5. Sync emails"
echo "6. Click 'Extrair' on any communication"
