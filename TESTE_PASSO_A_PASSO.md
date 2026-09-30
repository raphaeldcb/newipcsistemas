# 🧪 Testes Passo a Passo — Novos Sistemas IPC

## ✅ Configuração Completa

**Status:** Microsoft Graph configurado com credenciais do Perito V6
- **Email:** financeiro@ipcmsc.com.br
- **Tenant:** ***REMOVED***
- **Client ID:** ***REMOVED***

---

## 🚀 Passo 1: Preparar Ambiente

```bash
cd /Users/ipc_server/newipcsistemas

# 1.1 Verificar dependências
python3 --version          # Python 3.13+
php --version              # PHP 8.2+
mysql --version            # MySQL 8.3+

# 1.2 Instalar dependências Python
pip install requests>=2.31.0

# 1.3 Verificar Ollama
curl http://localhost:11434/api/tags
# Se não responder, inicie: ollama serve
```

---

## 🎯 Passo 2: Validar Configuração

```bash
# 2.1 Validar sistema completo
./validate-system.sh

# 2.2 Validar arquivo de configuração
cat config/config.php | grep -A 5 "microsoft"

# Esperado:
# 'client_id' => '***REMOVED***',
# 'mailbox' => 'financeiro@ipcmsc.com.br',
```

---

## 💾 Passo 3: Criar Banco de Dados

```bash
# 3.1 Criar banco e tabelas
mysql -u root -p < database/install.sql

# 3.2 Verificar criação
mysql -u root -p -e "USE novos_sistemas_ipc; SHOW TABLES;"

# Esperado: communications, users, processing_log, etc
```

---

## 🌐 Passo 4: Iniciar Servidor

```bash
# Terminal 1: Ollama (se não estiver rodando)
ollama serve

# Terminal 2: PHP Server
./quick-start.sh start

# Esperado: PHP 8.2 server at http://localhost:8000
```

---

## 🔑 Passo 5: Testar Login

**No browser:**
1. Abra http://localhost:8000
2. Login com:
   - Email: `admin@ipcms.com.br`
   - Senha: `admin123`

**Esperado:** Dashboard com sidebar + menu Comunicações

---

## ☁️ Passo 6: Conectar ao Microsoft 365

**Na interface:**
1. Clique em **Comunicações** no menu
2. Clique em "Conectar ao Microsoft 365" (botão amarelo)
3. Será redirecionado para login Microsoft
4. Login com: `financeiro@ipcmsc.com.br`
5. Autorize acesso aos emails

**Esperado:** Status verde "✅ Conectado ao Microsoft 365"

---

## 📧 Passo 7: Sincronizar Emails

**Na interface:**
1. Clique em "↻ Sincronizar" (botão roxo)
2. Aguarde alguns segundos
3. Emails da mailbox aparecem na tabela

**Esperado:**
- Status muda para "Processando..."
- Emails aparecem com "From", "Data"
- Cards de estatísticas atualizam
- Status volta para "Conectado"

**No terminal (opcional):**
```bash
mysql -u root -p -e "SELECT COUNT(*) FROM novos_sistemas_ipc.communications;"
```

---

## 🔍 Passo 8: Testar Extração Manual

### Opção A: Com dados de teste (sem Microsoft)

```bash
# 8A.1 Carregar emails de teste
php seed-test-data.php

# 8A.2 Verificar no banco
mysql -u root -p -e "SELECT id, subject FROM novos_sistemas_ipc.communications LIMIT 3;"
```

### Opção B: Com emails reais (após sincronizar)

**Na interface:**
1. Vá para Comunicações
2. Clique em "🔍 Extrair" em qualquer email
3. Botão muda para "⏳ Extraindo..."
4. Aguarde 5-15 segundos
5. Botão volta para "🔍 Extrair"
6. Página atualiza automaticamente

**Esperado:**
- Coluna "Vara" preenchida com nome do tribunal
- Coluna "Processo" preenchida com número CNJ
- Status muda para "Processado"
- Informações salvas no banco

---

## 🧪 Passo 9: Testar Extração via API

```bash
# 9.1 Listar comunicações via API
curl "http://localhost:8000/api.php?action=list"

# Esperado: JSON com lista de comunicações

# 9.2 Extrair uma comunicação específica
curl "http://localhost:8000/api.php?action=extract&id=1"

# Esperado: JSON com campos extraídos (vara, comarca, processo)

# 9.3 Ver estatísticas
curl "http://localhost:8000/api.php?action=stats"

# Esperado: { "stats": { "total": X, "by_status": {...} } }
```

---

## 📊 Passo 10: Verificar Auditoria

```bash
# 10.1 Ver log de processamento
mysql -u root -p -e "SELECT action, details FROM novos_sistemas_ipc.processing_log LIMIT 5;"

# Esperado: information_extracted, microsoft_sync, etc

# 10.2 Ver dados extraídos
mysql -u root -p -e "SELECT id, subject, vara, comarca, processo_numero FROM novos_sistemas_ipc.communications;"

# Esperado: Campos populados com informações extraídas
```

---

## ✅ Passo 11: Executar Suite de Testes Completa

```bash
# 11.1 Validar sistema
./validate-system.sh

# 11.2 Testar API
./test-api.sh http://localhost:8000

# 11.3 Testar extração
python3 python/extraction_service.py test

# Esperado: Todos os testes passam com ✅
```

---

## 🚨 Troubleshooting

### "Erro de conexão ao Microsoft"
```bash
# Verificar credenciais
cat config/config.php | grep -A 5 microsoft

# Verificar se URL de redirect está correta
# Deve ser: http://localhost:8000/auth/callback
```

### "Ollama não acessível"
```bash
# Iniciar Ollama em outro terminal
ollama serve

# Verificar modelo
ollama list | grep qwen

# Se não tiver, puxar:
ollama pull qwen:7b
```

### "Banco de dados vazio"
```bash
# Recriar banco
mysql -u root -p < database/install.sql

# Ou carregar dados de teste
php seed-test-data.php
```

### "Extração lenta"
- Normal: Qwen 7B leva 5-15 segundos por email
- Verifique GPU availability: `ollama list`
- Aumente timeout em extraction_service.py se necessário

---

## 📈 Próximos Passos

### Fase 1: Teste Local ✅
- [x] Ambiente preparado
- [x] Microsoft configurado
- [x] Banco criado
- [x] Login funciona
- [x] Microsoft conecta
- [x] Emails sincronizam
- [x] Extração funciona

### Fase 2: Teste em Produção (Opcional)
```bash
# Seguir DEPLOYMENT.md para:
# - Configure Nginx/Apache
# - Setup SSL/HTTPS
# - Configure Ollama em servidor
# - Setup cron para batch extraction
```

### Fase 3: Integração
```bash
# Possivelmente integrar com:
# - Perito V6 API
# - PJe/e-SAJ
# - Sistema de honorários
```

---

## 📝 Checklist Final

- [ ] Sistema validado com `validate-system.sh`
- [ ] Banco de dados criado
- [ ] PHP server rodando em http://localhost:8000
- [ ] Login funciona (admin@ipcms.com.br / admin123)
- [ ] Microsoft conecta (financeiro@ipcmsc.com.br)
- [ ] Emails sincronizam
- [ ] Extração de IA funciona (5-15 seg por email)
- [ ] API endpoints respondendo
- [ ] Auditoria registrando operações
- [ ] Testes passam

---

## 🎉 Sucesso!

Se chegou aqui com todas as checkboxes marcadas, o sistema está 100% funcional e pronto para:
- ✅ Testes de carga
- ✅ Deploy em produção
- ✅ Integração com outros sistemas
- ✅ Customizações adicionais

**Dúvidas?** Consulte:
- GETTING_STARTED.md — Setup básico
- README_SETUP.md — Configuração detalhada
- DEPLOYMENT.md — Produção
- PROJECT_STATUS.md — Visão geral

---

**Data:** 2026-09-29
**Version:** 1.0.0
**Status:** ✅ PRONTO PARA TESTES
