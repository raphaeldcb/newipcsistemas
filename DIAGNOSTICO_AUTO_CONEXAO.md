# 🔧 Diagnóstico: Auto-Conexão ao Microsoft 365

## Problema
Você está vendo a mensagem **"Não conectado ao Microsoft 365"** mesmo com credenciais configuradas?

## Solução Rápida

### 1. Acessar a Tela de Debug
```
http://localhost:8000/newipcsistemas/index.php?page=comunicacoes-debug
```

Ou clique no link **"Conectar →"** na tela de Comunicações.

### 2. Verificar os Logs
A tela exibirá um **debug log** com a sequência exata de inicialização:

```
✓ Microsoft credentials found in config
✓ OAuthController created
Microsoft authenticated from session: false
Attempting auto-connect with Client Credentials...
✓ MicrosoftGraphService created
✓ Token response received
✓✓✓ AUTO-CONNECT SUCCESSFUL - microsoft_authenticated set to true
```

## Possíveis Problemas

### ❌ "Token response missing access_token"
**Causa**: Credenciais inválidas ou aplicação sem permissões no Azure

**Solução**:
1. Verifique `.env.local` vs Azure Portal
2. Certifique-se que `GRAPH_CLIENT_ID`, `GRAPH_CLIENT_SECRET`, `GRAPH_TENANT_ID` estão corretos
3. No Azure Portal, vá em **API permissions** e adicione:
   - `Mail.Read`
   - `Mail.ReadWrite`
4. Clique em **"Grant admin consent"**

### ❌ "Failed to get client credentials token"
**Causa**: Erro na requisição HTTP ao Azure

**Solução**:
1. Verifique conectividade: `ping login.microsoftonline.com`
2. Verifique se está atrás de proxy/firewall
3. Verifique logs do PHP: `php -S localhost:8000 2>&1 | grep -i error`

### ❌ "MicrosoftGraphService created" mas depois erro
**Causa**: Aplicação não tem consentimento de admin

**Solução**:
1. Vá para Azure Portal → seu app → **API permissions**
2. Clique em **"Grant admin consent for [seu tenant]"** (botão azul)
3. Aguarde alguns segundos
4. Recarregue a página de debug

## ✅ Se o Debug Disser "AUTO-CONNECT SUCCESSFUL"

Então o problema está em **outro lugar**:

1. **Sessão não persiste**: Verifique se cookies estão ativados
2. **PHP recarrega a página**: Pode haver um erro silencioso
3. **Firewall do servidor**: Verifique logs em `/logs/`

### Debug Avançado

```bash
# Ver logs PHP
tail -f /var/log/apache2/error.log  # Linux/Mac
# ou
type "C:\wamp64\logs\apache_error.log"  # Windows

# Testar credenciais isoladamente
php debug-auto-connect.php

# Testar lógica da tela
php test-communications-logic.php
```

## 🧪 Testes Rápidos

### Teste 1: Credenciais
```bash
php test-credentials.php
```

**Esperado:**
```
✅ TODAS AS CREDENCIAIS ESTÃO CONFIGURADAS
```

### Teste 2: Auto-Connect
```bash
php debug-auto-connect.php
```

**Esperado:**
```
✓ Token obtido com sucesso!
✅ AUTO-CONNECT DEVE FUNCIONAR!
```

### Teste 3: Lógica da Tela
```bash
php test-communications-logic.php
```

**Esperado:**
```
✅ AUTO-CONNECT SUCESSO!
   A tela deve exibir 'Conectado ao Microsoft 365'
```

## 📋 Checklist

- [ ] `.env.local` existe com credenciais corretas
- [ ] `config/config.php` está carregando credenciais
- [ ] `config/load-env.php` está sendo executado
- [ ] Azure App tem permissões `Mail.Read` e `Mail.ReadWrite`
- [ ] Admin consent foi dado no Azure
- [ ] Teste com `php test-credentials.php` passou ✓
- [ ] Teste com `php debug-auto-connect.php` passou ✓
- [ ] Acessou `?page=comunicacoes-debug` e viu logs

## 📞 Se Nada Disso Funcionar

1. Envie o output de:
   ```bash
   php test-credentials.php
   php debug-auto-connect.php
   ```

2. Acesse `?page=comunicacoes-debug` e copie os **Debug Logs** (todos os trechos em verde/vermelho)

3. Verifique o arquivo de logs do PHP e da aplicação

---

**Última atualização**: 2026-09-30
**Versão**: 1.0.0-debug
