# 🧪 Guia de Testes - Windows + Wampserver

## 📋 Quick Start (5 minutos)

### 1. Clone o Projeto
```powershell
cd C:\wamp64\www
git clone https://github.com/raphaeldcb/newipcsistemas.git
cd newipcsistemas
```

### 2. Configure Credenciais
```powershell
copy .env.example .env.local
notepad .env.local
```

**Preencha com seus valores do Azure Portal:**
```env
GRAPH_CLIENT_ID=seu_client_id_aqui
GRAPH_CLIENT_SECRET=seu_client_secret_aqui
GRAPH_TENANT_ID=seu_tenant_id_aqui
GRAPH_MAILBOX=seu_email@dominio.com
DB_HOST=localhost
DB_USERNAME=root
DB_PASSWORD=
DB_DATABASE=novos_sistemas_ipc
```

### 3. Crie o Banco de Dados
```powershell
# Abra PowerShell como Admin
mysql -u root < database/install.sql
```

Ou abra MySQL Workbench e execute:
```sql
CREATE DATABASE novos_sistemas_ipc;
USE novos_sistemas_ipc;
-- Execute o conteúdo de database/install.sql
```

### 4. Teste Credenciais (CRUCIAL)
```powershell
php test-credentials.php
```

**Esperado:**
```
✅ TODAS AS CREDENCIAIS ESTÃO CONFIGURADAS
Auto-conexão deve funcionar!
```

**Se não passar:** Verifique .env.local

---

## 🧪 Testes Disponíveis

### Teste 1: Credenciais Carregadas
```powershell
php test-credentials.php
```
✅ Verifica se .env.local está sendo carregado

### Teste 2: Token Microsoft
```powershell
php debug-auto-connect.php
```
✅ Testa conexão com Azure e obtenção de token

### Teste 3: Lógica da Tela
```powershell
php test-communications-logic.php
```
✅ Simula o que acontece na tela de comunicações

### Teste 4: Dados de Teste
```powershell
php seed-test-data.php
```
✅ Insere 6 emails de teste no banco

---

## 🌐 Testes na Tela (Navegador)

### 1. Inicie Wampserver
- Clique no ícone Wampserver
- "All Services Online" (deve ficar verde)

### 2. Acesse o Sistema
```
http://localhost/newipcsistemas
```

### 3. Faça Login
```
Email: admin@ipcms.com.br
Senha: admin123
```

### 4. Teste a Tela de Comunicações
```
http://localhost/newipcsistemas/index.php?page=comunicacoes
```

**Deve exibir:**
- ✅ Status de conexão (conectado ou desconectado)
- ✅ Botão "Sincronizar"
- ✅ Lista vazia (antes de sincronizar)

### 5. Teste o Debug Mode
```
http://localhost/newipcsistemas/index.php?page=comunicacoes-debug
```

**Deve exibir:**
- ✅ Debug Log com sequência de inicialização
- ✅ Status de auto-conexão (sucesso ou erro)
- ✅ Configurações carregadas

---

## 🔍 Troubleshooting

### ❌ "TODAS AS CREDENCIAIS ESTÃO CONFIGURADAS" falha

**Verificar:**
1. `.env.local` existe? `dir .env.local`
2. Está preenchido? `type .env.local`
3. Load-env.php está funcionando?
   ```powershell
   php -r "require 'config/load-env.php'; echo getenv('GRAPH_CLIENT_ID');"
   ```

### ❌ "Token response received" falha

**Verificar:**
1. Credenciais no Azure estão corretas?
2. App tem permissões "Mail.Read" e "Mail.ReadWrite"?
3. Admin consent foi dado?

### ❌ Banco de dados não conecta

**Verificar:**
1. MySQL está rodando?
   ```powershell
   mysql -u root -e "SELECT 1;"
   ```
2. Banco foi criado?
   ```powershell
   mysql -u root -e "SHOW DATABASES;" | findstr novos_sistemas_ipc
   ```

### ❌ Login não funciona

**Reset da senha:**
```powershell
php fix-password-hash.php
```

---

## ✅ Checklist de Testes

### Pré-testes
- [ ] .env.local criado com credenciais
- [ ] MySQL rodando
- [ ] Banco de dados criado
- [ ] Wampserver iniciado

### Testes de CLI
- [ ] `php test-credentials.php` ✓
- [ ] `php debug-auto-connect.php` ✓
- [ ] `php test-communications-logic.php` ✓
- [ ] `php seed-test-data.php` ✓

### Testes na Tela
- [ ] Login funciona
- [ ] Dashboard aparece
- [ ] Comunicações carrega
- [ ] Debug mode mostra logs
- [ ] Botão "Sincronizar" aparece (mas desabilitado sem conexão)

### Testes de Funcionalidade
- [ ] Auto-conexão funciona (debug mode verde)
- [ ] Botão sincronizar fica ativo
- [ ] Emails são listados (após sincronizar)
- [ ] Botão "Extrair" funciona
- [ ] Status muda para "processando"

---

## 📝 Logs

**Se algo falhar, verifique os logs:**

```powershell
# Ver logs PHP (se rodar via php -S)
# Aparecerão no terminal

# Ver logs do sistema
type logs\python_service.log
type logs\processing.log
```

---

## 🎯 Próximo Passo

Após passar em todos os testes:
1. Conecte ao Microsoft 365 (botão na tela)
2. Sincronize emails reais
3. Teste extração de informações
4. Verifique que dados são salvos no banco

---

**Última atualização**: 2026-09-30  
**Para**: Testes no Windows + Wampserver
