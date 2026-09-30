#!/bin/bash

# Comprehensive System Validation
# Tests all components end-to-end

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

TESTS_PASSED=0
TESTS_FAILED=0

# Helper functions
test_pass() {
    echo -e "${GREEN}✅${NC} $1"
    ((TESTS_PASSED++))
}

test_fail() {
    echo -e "${RED}❌${NC} $1"
    ((TESTS_FAILED++))
}

test_warn() {
    echo -e "${YELLOW}⚠️${NC}  $1"
}

header() {
    echo ""
    echo -e "${BLUE}$1${NC}"
    echo "=================================="
}

# Start validation
echo -e "${BLUE}"
echo "🔍 Novos Sistemas IPC — System Validation"
echo "=========================================="
echo -e "${NC}"

# 1. Environment Checks
header "1. Environment Checks"

if command -v php &> /dev/null; then
    PHP_VERSION=$(php -v | head -1 | cut -d' ' -f2 | cut -d'.' -f1-2)
    test_pass "PHP installed ($PHP_VERSION)"
else
    test_fail "PHP not found"
fi

if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version 2>&1 | cut -d' ' -f2 | cut -d'.' -f1-2)
    test_pass "Python installed ($PYTHON_VERSION)"
else
    test_fail "Python3 not found"
fi

if command -v mysql &> /dev/null; then
    test_pass "MySQL client installed"
else
    test_fail "MySQL client not found"
fi

if command -v curl &> /dev/null; then
    test_pass "curl installed"
else
    test_fail "curl not found"
fi

# 2. File Structure
header "2. File Structure"

FILES=(
    "html/controllers/AuthController.php"
    "html/controllers/OAuthController.php"
    "html/controllers/CommunicacionsController.php"
    "html/controllers/ExtractionController.php"
    "html/services/MicrosoftGraphService.php"
    "html/models/Communication.php"
    "python/extraction_service.py"
    "database/install.sql"
    "config/config.example.php"
    "api.php"
    "index.php"
)

for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        test_pass "$file exists"
    else
        test_fail "$file missing"
    fi
done

# 3. Configuration
header "3. Configuration"

if [ -f "config/config.php" ]; then
    test_pass "config.php exists"

    # Check for required fields
    if grep -q "db.*host" config/config.php; then
        test_pass "Database host configured"
    else
        test_fail "Database host not configured"
    fi
else
    test_warn "config.php not found (template available in config/config.example.php)"
fi

# 4. Python Dependencies
header "4. Python Dependencies"

if python3 -c "import requests" 2>/dev/null; then
    test_pass "requests module available"
else
    test_fail "requests module missing (install: pip install requests)"
fi

if python3 -c "import json" 2>/dev/null; then
    test_pass "json module available"
else
    test_fail "json module missing"
fi

# 5. Ollama Connectivity
header "5. Ollama & AI Service"

if curl -s http://localhost:11434/api/tags > /dev/null 2>&1; then
    test_pass "Ollama accessible at localhost:11434"

    MODELS=$(curl -s http://localhost:11434/api/tags 2>/dev/null | python3 -c "import sys, json; data=json.load(sys.stdin); print(','.join([m['name'].split(':')[0] for m in data.get('models', [])]))" 2>/dev/null || echo "unknown")

    if echo "$MODELS" | grep "qwen" > /dev/null 2>&1; then
        test_pass "Qwen model available ($MODELS)"
    else
        test_fail "Qwen model not found (run: ollama pull qwen:7b)"
    fi
else
    test_fail "Ollama not accessible (start with: ollama serve)"
fi

# 6. Extraction Service Test
header "6. Extraction Service"

TEST_EMAIL='{
  "id": 1,
  "subject": "Test - Processo 0123456-78.2024.8.26.0100",
  "from_name": "Test Sender",
  "from_address": "test@example.com",
  "body_preview": "Test communication for extraction validation.",
  "received_datetime": "2024-09-29T10:00:00"
}'

if echo "$TEST_EMAIL" | python3 python/extraction_service.py extract 2>/dev/null | grep -q '"vara"'; then
    test_pass "Extraction service responds correctly"
else
    test_fail "Extraction service error (check Ollama is running)"
fi

# 7. Database Schema
header "7. Database Schema"

if [ -f "database/install.sql" ]; then
    test_pass "Schema file exists"

    if grep -q "CREATE TABLE.*communications" database/install.sql; then
        test_pass "Communications table defined"
    else
        test_fail "Communications table not defined"
    fi

    if grep -q "CREATE TABLE.*processing_log" database/install.sql; then
        test_pass "Processing log table defined"
    else
        test_fail "Processing log table not defined"
    fi
else
    test_fail "Schema file missing"
fi

# 8. Code Quality Checks
header "8. Code Quality"

# Check for common issues
if ! grep -r "eval(" html/ python/ --include="*.php" --include="*.py" 2>/dev/null; then
    test_pass "No eval() calls found"
else
    test_warn "eval() calls detected (security risk)"
fi

if ! grep -r "mysql_" html/ --include="*.php" 2>/dev/null; then
    test_pass "No deprecated mysql_* functions"
else
    test_warn "Deprecated mysql_* functions detected"
fi

if grep -q "prepared statements\|PDO\|mysqli" html/controllers/*.php; then
    test_pass "Using prepared statements (SQL injection safe)"
else
    test_warn "May not be using prepared statements consistently"
fi

# 9. Security Checks
header "9. Security Checks"

if [ -f ".gitignore" ]; then
    if grep -q "config.php\|\.env" .gitignore; then
        test_pass "Secrets are in .gitignore"
    else
        test_fail "config.php should be in .gitignore"
    fi
else
    test_warn ".gitignore not found"
fi

if [ -f "config/config.example.php" ]; then
    test_pass "Config template file exists"
else
    test_fail "Config template missing"
fi

# 10. Documentation
header "10. Documentation"

DOCS=(
    "GETTING_STARTED.md"
    "README_SETUP.md"
)

for doc in "${DOCS[@]}"; do
    if [ -f "$doc" ]; then
        test_pass "$doc exists"
    else
        test_fail "$doc missing"
    fi
done

# 11. Scripts & Tools
header "11. Scripts & Tools"

SCRIPTS=(
    "quick-start.sh"
    "test-extraction.sh"
    "test-api.sh"
    "seed-test-data.php"
)

for script in "${SCRIPTS[@]}"; do
    if [ -f "$script" ]; then
        if [[ "$script" == *.sh ]]; then
            if [ -x "$script" ]; then
                test_pass "$script exists and is executable"
            else
                test_fail "$script exists but not executable (run: chmod +x $script)"
            fi
        else
            test_pass "$script exists"
        fi
    else
        test_fail "$script missing"
    fi
done

# 12. Git Status
header "12. Git Status"

if [ -d ".git" ]; then
    test_pass "Git repository initialized"

    COMMIT_COUNT=$(git rev-list --count HEAD 2>/dev/null || echo "0")
    if [ "$COMMIT_COUNT" -gt 0 ]; then
        test_pass "Git history exists ($COMMIT_COUNT commits)"
    else
        test_fail "No commits found"
    fi

    if git status --porcelain | grep -q ""; then
        test_warn "Working directory has uncommitted changes"
    else
        test_pass "Working directory clean"
    fi
else
    test_fail "Not a git repository"
fi

# Final Report
echo ""
echo -e "${BLUE}════════════════════════════════════════════════${NC}"
echo -e "${GREEN}Passed: $TESTS_PASSED${NC} | ${RED}Failed: $TESTS_FAILED${NC}"
echo -e "${BLUE}════════════════════════════════════════════════${NC}"

if [ $TESTS_FAILED -eq 0 ]; then
    echo ""
    echo -e "${GREEN}✅ All validations passed!${NC}"
    echo ""
    echo "🚀 Ready to start:"
    echo "   ./quick-start.sh start"
    echo ""
    exit 0
else
    echo ""
    echo -e "${RED}❌ $TESTS_FAILED validation(s) failed${NC}"
    echo ""
    echo "📋 Fix issues above, then run:"
    echo "   ./validate-system.sh"
    echo ""
    exit 1
fi
