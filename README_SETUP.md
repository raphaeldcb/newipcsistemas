# Novos Sistemas IPC — Setup Completo

## 📦 Stack

- PHP 8.2.18
- MySQL 8.3.0
- Python 3.13.3
- Microsoft Graph API
- Ollama + Qwen 7B

## 🚀 Instalação Rápida

### 1. Clone o repositório
```bash
git clone https://github.com/raphaeldcb/newipcsistemas.git
cd newipcsistemas
```

### 2. Configure o banco de dados
```bash
mysql -u root -p < database/install.sql
cp config/config.example.php config/config.php

# Edite config.php com suas credenciais
```

### 3. Instale dependências Python
```bash
pip install requests>=2.31.0
```

### 4. Configure Ollama
```bash
# Instale Ollama (https://ollama.ai)
ollama pull qwen:7b
ollama serve  # Terminal separado
```

### 5. Inicie o servidor
```bash
php -S localhost:8000 -t html
# Abra http://localhost:8000
```

## 🧪 Testar Integração

```bash
./test-extraction.sh
```

## 📋 Próximas Features

- [ ] Batch extraction automática
- [ ] Auto-respostas de emails
- [ ] Webhook para integração com PJe
- [ ] Export PDF de comunicações
- [ ] Classificação automática por área
- [ ] Notificações em tempo real

## 🔗 Links Importantes

- Microsoft Graph: https://graph.microsoft.com
- Azure AD: https://portal.azure.com
- Ollama: https://ollama.ai
- GitHub: https://github.com/raphaeldcb/newipcsistemas
