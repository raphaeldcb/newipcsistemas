# 🚀 COMECE AQUI — Guia Completo de Testes

**Status:** ✅ Sistema Pronto | 🟢 Configurado | 📊 Testável

---

## 🎯 Objetivo

Validar o **Novos Sistemas IPC** funcionando 100% localmente com:
- ✅ Login
- ✅ Microsoft Graph (financeiro@ipcms.com.br)
- ✅ Sincronização de emails
- ✅ Extração de IA (Qwen 7B)
- ✅ API REST
- ✅ Banco HostGator

---

## 📋 Pré-Requisitos

- [ ] PHP 8.2+
- [ ] MySQL 8.3+
- [ ] Python 3.13+
- [ ] Ollama + Qwen 7B
- [ ] 20-30 minutos livres

---

## 🔧 FASE 1: Iniciar Serviços (5 minutos)

### Terminal 1: Ollama

```bash
ollama serve
```

**Esperado:** 
```
Listening on 127.0.0.1:11434
```

### Terminal 2: PHP Server

```bash
cd C:\wamp64\www\newipcsistemas
C:\wamp64\bin\php\php8.2.18\php.exe -S localhost:8000 -t html
```

**Esperado:**
```
Development Server running at http://localhost:8000
```

---

## 🔑 FASE 2: Login (2 minutos)

### 2.1 Abrir Browser

```
http://localhost:8000
```

### 2.2 Fazer Login

**Credenciais:**
- Email: `admin@ipcms.com.br`
- Senha: `admin123`

**Esperado:**
- ✅ Redirecionado para dashboard
- ✅ Sidebar com menu
- ✅ Opção "Comunicações" visível
- ✅ Nome de usuário aparece no canto

---

## 📧 FASE 3: Testar sem Microsoft (5 minutos)

### 3.1 Carregar Dados de Teste

**Terminal 3:**
```bash
cd C:\wamp64\www\newipcsistemas
C:\wamp64\bin\php\php8.2.18\php.exe seed-test-data.php
```

**Esperado:**
```
✅ Communication #1 created
   From: Tribunal de Justiça de São Paulo
   Subject: Perícia Contábil - Processo 0123456-78.2024.8.26.0100
   Status: new (ready for extraction)

✅ Communication #2 created
...

✅ Test data seeding complete!
Total communications: 6
```

### 3.2 Ir para Comunicações

Na interface:
1. Clique em **"Comunicações"** no menu
2. Você verá **6 emails de teste**
3. Status: **Novas** (amarelo)
4. Botão **"🔍 Extrair"** disponível

---

## 🤖 FASE 4: Testar Extração de IA (10 minutos)

### 4.1 Extrair 1 Email

Na interface:
1. Clique em **"🔍 Extrair"** no primeiro email
2. Botão muda para **"⏳ Extraindo..."**
3. Aguarde **5-15 segundos** (Qwen processando)
4. Botão volta para **"✅"**
5. Página atualiza automaticamente

### 4.2 Verificar Resultado

**Esperado na tabela:**
- ✅ Coluna "Vara" preenchida (ex: "2ª Vara de Família")
- ✅ Coluna "Processo" preenchida (ex: "0123456-78.2024.8.26.0100")
- ✅ Status muda para **"Processado"** (verde)

### 4.3 Verificar no Banco

**Terminal:**
```bash
mysql -u ***REMOVED*** -p***REMOVED*** ***REMOVED*** -e "SELECT id, subject, vara, processo_numero FROM communications LIMIT 3;"
```

**Esperado:**
```
| id | subject                              | vara              | processo_numero           |
|----|--------------------------------------|-------------------|---------------------------|
| 1  | Perícia Contábil - Processo...      | 2ª Vara Familiar  | 0123456-78.2024.8.26.0100|
| 2  | Edital de Citação - Var. Cível...  | Vara Cível        | 0234567-89.2024.8.26.0200|
```

---

## ☁️ FASE 5: Testar Microsoft 365 (10 minutos)

### 5.1 Conectar ao Microsoft

Na interface (Comunicações):
1. Clique em **"Conectar ao Microsoft 365"** (botão amarelo)
2. Será redirecionado para Microsoft login
3. **Login:** financeiro@ipcms.com.br
4. **Autorizar** acesso aos emails

**Esperado:**
- ✅ Status muda para **"✅ Conectado ao Microsoft 365"** (verde)
- ✅ Email aparece: "financeiro@ipcms.com.br"

### 5.2 Sincronizar Emails

Na interface:
1. Clique em **"↻ Sincronizar"** (botão roxo)
2. Aguarde **2-5 segundos**
3. Emails reais aparecem na tabela

**Esperado:**
- ✅ "From" mostra remetentes reais
- ✅ "Data" mostra datas reais
- ✅ Cards de estatísticas atualizam

### 5.3 Extrair Emails Reais

1. Clique em **"🔍 Extrair"** em qualquer email real
2. Qwen processa a informação
3. Dados aparecem em "Vara" e "Processo"

---

## 🧪 FASE 6: Testar API (5 minutos)

### 6.1 Listar Comunicações

```bash
curl "http://localhost:8000/api.php?action=list"
```

**Esperado:** JSON com lista de emails

### 6.2 Obter Estatísticas

```bash
curl "http://localhost:8000/api.php?action=stats"
```

**Esperado:**
```json
{
  "success": true,
  "stats": {
    "total": 6,
    "by_status": {
      "new": 0,
      "processed": 6,
      "error": 0
    }
  }
}
```

### 6.3 Testar Extração via API

```bash
curl "http://localhost:8000/api.php?action=extract&id=1"
```

**Esperado:** JSON com campos extraídos

---

## ✅ CHECKLIST FINAL

- [ ] Sistema validado
- [ ] Ollama rodando (ollama serve)
- [ ] PHP server rodando (http://localhost:8000 ✅)
- [ ] Login funciona (admin@ipcms.com.br ✅)
- [ ] Dados de teste carregados (6 emails ✅)
- [ ] Extração de IA funciona (5-15 seg ✅)
- [ ] Microsoft conecta (financeiro@ipcms.com.br ✅)
- [ ] Emails sincronizam (↻ Sincronizar ✅)
- [ ] API endpoints respondendo ✅
- [ ] Auditoria registrando operações ✅
- [ ] Todos os testes passaram ✅

---

## 🚨 Troubleshooting

### "Erro ao conectar Microsoft"
```bash
# Verificar credenciais
type config\config.php | findstr microsoft

# Esperado:
# 'client_id' => '***REMOVED***'
# 'mailbox' => 'financeiro@ipcms.com.br'
```

### "Ollama não responde"
```bash
# Verificar se está rodando
curl.exe http://localhost:11434/api/tags

# Se não, iniciar:
ollama serve
```

### "Banco de dados vazio"
```bash
# Recarregar dados de teste
C:\wamp64\bin\php\php8.2.18\php.exe seed-test-data.php
```

### "Extração muito lenta"
- Normal: Qwen 7B leva 5-15 segundos
- Se > 30s: Verificar GPU com `ollama list`

---

## 📈 Próximos Passos (Opcional)

### Teste de Carga
```bash
# Extrair 10 emails em lote
curl "http://localhost:8000/api.php?action=extract_batch&status=new&limit=10"
```

### Teste de Persistência
```bash
# Reiniciar PHP server
# Verificar se dados continuam no banco
mysql -u ***REMOVED*** -p***REMOVED*** ***REMOVED*** -e "SELECT COUNT(*) FROM communications;"
```

### Deploy HostGator
Quando testes passarem:
1. Seguir DEPLOYMENT.md
2. Copiar para HostGator
3. Executar database/install.sql
4. Testar em produção

---

## 🎉 Sucesso!

Se chegou aqui com todas as checkboxes marcadas, o sistema está:
- ✅ **100% funcional** localmente
- ✅ **Pronto para produção** no HostGator
- ✅ **Documentado** completamente
- ✅ **Auditado** em todas as operações

---

**Tempo total estimado:** 30-40 minutos  
**Dificuldade:** Fácil (siga os passos)  
**Status:** 🟢 **PRONTO PARA TESTES**

---

**Gerado:** 2026-09-29  
**Versão:** 1.0.0  
**Guia:** COMECE_AQUI_TESTES.md
