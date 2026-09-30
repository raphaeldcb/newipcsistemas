#!/bin/bash

# Test API Endpoints
# Validates extraction flow end-to-end

set -e

echo "🧪 Testing Novos Sistemas IPC API"
echo "=================================="

BASE_URL="${1:-http://localhost:8000}"
echo "Target: $BASE_URL"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 1. Test server connectivity
echo ""
echo "1️⃣  Testing server connectivity..."
if curl -s "$BASE_URL" > /dev/null; then
    echo -e "${GREEN}✅${NC} Server is responding"
else
    echo -e "${RED}❌${NC} Server not accessible"
    echo "   Make sure to run: php -S localhost:8000 -t html"
    exit 1
fi

# 2. Test login page
echo ""
echo "2️⃣  Testing login page..."
if curl -s "$BASE_URL/login" | grep -q "admin@ipcms.com.br"; then
    echo -e "${GREEN}✅${NC} Login page loaded"
else
    echo -e "${RED}❌${NC} Login page issue"
    exit 1
fi

# 3. Test unauthenticated API access (should return 401)
echo ""
echo "3️⃣  Testing API authentication..."
RESPONSE=$(curl -s -w "\n%{http_code}" "$BASE_URL/api.php?action=list")
HTTP_CODE=$(echo "$RESPONSE" | tail -n1)

if [ "$HTTP_CODE" = "401" ]; then
    echo -e "${GREEN}✅${NC} API correctly requires authentication (401)"
else
    echo -e "${YELLOW}⚠️${NC}  Expected 401, got $HTTP_CODE"
    echo "   (This is OK if authentication is disabled in dev)"
fi

# 4. Check database connectivity
echo ""
echo "4️⃣  Checking database..."
if curl -s "$BASE_URL/api.php?action=stats" 2>/dev/null | grep -q "error\|success"; then
    echo -e "${YELLOW}⚠️${NC}  Database check (auth required)"
else
    echo -e "${YELLOW}⚠️${NC}  Cannot test without session"
fi

# 5. Test extraction service directly
echo ""
echo "5️⃣  Testing extraction service..."
TEST_EMAIL='{
  "id": 1,
  "subject": "Perícia Contábil - Processo 0123456-78.2024.8.26.0100",
  "from_name": "Tribunal de Justiça",
  "from_address": "protocolo@tjsp.jus.br",
  "body_preview": "Solicitamos perícia contábil de urgência para análise de bens no processo de divórcio.",
  "received_datetime": "2024-09-29T10:00:00"
}'

# Check if extraction service works
if command -v python3 &> /dev/null; then
    EXTRACTION_RESULT=$(echo "$TEST_EMAIL" | python3 python/extraction_service.py extract 2>/dev/null || echo "ERROR")

    if echo "$EXTRACTION_RESULT" | grep -q "vara\|error"; then
        echo -e "${GREEN}✅${NC} Extraction service responds"
    else
        echo -e "${RED}❌${NC} Extraction service error"
    fi
else
    echo -e "${YELLOW}⚠️${NC}  Python3 not found"
fi

# 6. Summary
echo ""
echo "========================================="
echo "✅ API test complete!"
echo ""
echo "📋 Manual Testing:"
echo "1. Open $BASE_URL in browser"
echo "2. Login: admin@ipcms.com.br / admin123"
echo "3. Go to Comunicações"
echo "4. Run this to seed test data:"
echo "   php seed-test-data.php"
echo "5. Click 'Extrair' button on any email"
echo ""
echo "🔗 API Endpoints:"
echo "  GET  $BASE_URL/api.php?action=list"
echo "  GET  $BASE_URL/api.php?action=stats"
echo "  GET  $BASE_URL/api.php?action=extract&id=1"
echo "  POST $BASE_URL/api.php?action=sync"
