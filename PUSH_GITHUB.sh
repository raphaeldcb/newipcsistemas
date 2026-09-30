#!/bin/bash

# Push para GitHub
# Execute este script no seu terminal normal (não via SSH remoto)

echo "🚀 Enviando commits para GitHub..."
echo ""

cd "$(dirname "$0")" || exit 1

# Configurar remote se necessário
git remote set-url origin https://github.com/raphaeldcb/newipcsistemas.git

# Fazer push
echo "📤 Git Push..."
git push origin main -v

# Verificar resultado
if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Push bem-sucedido!"
    echo ""
    echo "📊 Verificar no GitHub:"
    echo "   https://github.com/raphaeldcb/newipcsistemas"
    echo ""
    echo "📋 Últimos commits:"
    git log --oneline -3
else
    echo ""
    echo "❌ Erro no push"
    echo ""
    echo "Se pedir credenciais, use:"
    echo "  - Username: seu usuário GitHub"
    echo "  - Password: seu Personal Access Token (não senha)"
    echo ""
    echo "Gerar token: https://github.com/settings/tokens"
fi
