#!/bin/bash

# Quick Start Script
# Sets up and runs Novos Sistemas IPC locally

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "🚀 Novos Sistemas IPC — Quick Start"
echo "===================================="

# Check PHP
if ! command -v php &> /dev/null; then
    echo "❌ PHP not found. Install with: brew install php"
    exit 1
fi

# Check config
if [ ! -f "config/config.php" ]; then
    echo ""
    echo "⚠️  config/config.php not found"
    echo ""
    echo "📝 Setup steps:"
    echo "1. Copy config template:"
    echo "   cp config/config.example.php config/config.php"
    echo ""
    echo "2. Edit config.php:"
    echo "   nano config/config.php"
    echo ""
    echo "   Required fields:"
    echo "   - db.host: localhost"
    echo "   - db.username: root"
    echo "   - db.password: your_password"
    echo "   - microsoft.client_id: (from Azure AD)"
    echo "   - microsoft.client_secret: (from Azure AD)"
    echo "   - microsoft.tenant_id: (from Azure AD)"
    echo ""
    echo "3. Create database:"
    echo "   mysql -u root -p < database/install.sql"
    echo ""
    echo "4. Then run: $0 start"
    exit 1
fi

# Parse command
COMMAND="${1:-start}"

case "$COMMAND" in
    start)
        echo ""
        echo "✅ Starting Novos Sistemas IPC..."
        echo ""

        # Check database
        echo "📋 Checking database connection..."
        php -r "
        \$config = require 'config/config.php';
        try {
            \$pdo = new PDO(
                'mysql:host=' . \$config['db']['host'] . ';dbname=' . \$config['db']['database'],
                \$config['db']['username'],
                \$config['db']['password']
            );
            \$count = \$pdo->query('SELECT COUNT(*) FROM communications')->fetchColumn();
            echo \"✅ Database OK (\" . \$count . \" communications)\\n\";
        } catch (Exception \$e) {
            echo \"❌ Database error: \" . \$e->getMessage() . \"\\n\";
            exit(1);
        }
        "

        # Start PHP server
        echo ""
        echo "🌐 Starting PHP server on http://localhost:8000"
        echo "   Press Ctrl+C to stop"
        echo ""
        echo "📖 Login with:"
        echo "   Email: admin@ipcms.com.br"
        echo "   Password: admin123"
        echo ""
        echo "🧪 For testing without Microsoft:"
        echo "   php seed-test-data.php"
        echo ""
        echo "🔗 API test:"
        echo "   ./test-api.sh"
        echo ""

        php -S localhost:8000 -t html
        ;;

    seed)
        echo ""
        echo "🌱 Seeding test data..."
        php seed-test-data.php
        ;;

    test)
        echo ""
        echo "🧪 Running tests..."
        ./test-extraction.sh
        echo ""
        ./test-api.sh http://localhost:8000
        ;;

    extract)
        echo ""
        echo "🔍 Testing extraction service..."
        python3 python/extraction_service.py test
        ;;

    *)
        echo "Usage: $0 {start|seed|test|extract}"
        echo ""
        echo "Commands:"
        echo "  start    - Start PHP server and database check"
        echo "  seed     - Seed test communications into database"
        echo "  test     - Run all validation tests"
        echo "  extract  - Test extraction service with Qwen"
        exit 1
        ;;
esac
