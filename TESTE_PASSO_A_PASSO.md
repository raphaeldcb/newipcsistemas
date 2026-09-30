# 🧪 Testes Passo a Passo — Novos Sistemas IPC

## ✅ Configuração Completa

**Status:** Microsoft Graph configurado com credenciais do Perito V6
- **Email:** financeiro@ipcms.com.br
- **Tenant:** ***REMOVED***
- **Client ID:** ***REMOVED***

---

## 🚀 Passo 1: Preparar Ambiente

```bash
cd C:\wamp64\www\newipcsistemas

# 1.1 Verificar dependências
C:\wamp64\bin\php\php8.2.18\php.exe --version              # PHP 8.2+
mysql --version            # MySQL 8.3+

# 1.2 Verificar Ollama
curl.exe http://localhost:11434/api/tags
# Se não responder, inicie: ollama serve
```

---

## 🎯 Passo 2: Validar Configuração

```bash
# 2.1 Validar arquivo de configuração
type config\config.php | findstr microsoft

# Esperado:
# 'client_id' => '***REMOVED***',
# 'mailbox' => 'financeiro@ipcms.com.br',
```

---

## 💾 Passo 3: Criar Banco de Dados

```bash
# 3.1 Criar banco e tabelas
mysql -u ***REMOVED*** -p***REMOVED*** -h localhost < database\install.sql

# 3.2 Verificar criação
mysql -u ***REMOVED*** -p***REMOVED*** -e "USE ***REMOVED***; SHOW TABLES;"

# Esperado: communications, users, processing_log, etc
```

---

## 🌐 Passo 4: Iniciar Servidor

```bash
# Terminal 1: Ollama (se não estiver rodando)
ollama serve

# Terminal 2: PHP Server
cd C:\wamp64\www\newipcsistemas
C:\wamp64\bin\php\php8.2.18\php.exe -S localhost:8000 -t html

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
4. Login com: `financeiro@ipcms.com.br`
5. Autorize acesso aos emails

**Esperado:**
- ✅ Status muda para **"✅ Conectado ao Microsoft 365"** (verde)
- ✅ Email aparece: "financeiro@ipcms.com.br"

---

## 📧 Passo 7: Sincronizar Emails

**Na interface:**
1. Clique em "↻ Sincronizar" (botão roxo)
2. Aguarde alguns segundos
3. Emails da mailbox aparecem na tabela

**Esperado:**
- ✅ "From" mostra remetentes reais
- ✅ "Data" mostra datas reais
- ✅ Cards de estatísticas atualizam
- ✅ Status volta para "Conectado"

---

## 🔍 Passo 8: Testar Extração Manual

### Opção A: Com dados de teste (sem Microsoft)

```bash
# 8A.1 Carregar emails de teste
C:\wamp64\bin\php\php8.2.18\php.exe seed-test-data.php

# 8A.2 Verificar no banco
mysql -u ***REMOVED*** -p***REMOVED*** -e "SELECT id, subject FROM ***REMOVED***.communications LIMIT 3;"
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
mysql -u ***REMOVED*** -p***REMOVED*** -e "SELECT action, details FROM ***REMOVED***.processing_log LIMIT 5;"

# Esperado:
# | action                | details                              |
# |-----------------------|--------------------------------------|
# | information_extracted | {"vara": "2ª Vara...", ...}         |
# | microsoft_sync        | {"messages_synced": 42, ...}        |
# | login                 | {"user_id": 1, ...}                 |

# 10.2 Ver dados extraídos
mysql -u ***REMOVED*** -p***REMOVED*** -e "SELECT id, subject, vara, comarca, processo_numero FROM ***REMOVED***.communications;"

# Esperado: Campos populados com informações extraídas
```

---

## ✅ Checklist Final

- [ ] Sistema validado
- [ ] Banco de dados criado
- [ ] PHP server rodando em http://localhost:8000
- [ ] Login funciona (admin@ipcms.com.br / admin123)
- [ ] Microsoft conecta (financeiro@ipcms.com.br)
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

---

**Data:** 2026-09-29
**Version:** 1.0.0
**Status:** ✅ PRONTO PARA TESTES
