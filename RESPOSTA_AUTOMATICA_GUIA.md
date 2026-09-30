# 📧 Guia de Resposta Automática e Categorização

## 🎯 O Que Foi Implementado

### 1️⃣ **Visualização de Email** 
- Modal interativo com detalhes completos do email
- Remetente, assunto, data, corpo completo
- Informações extraídas (vara, comarca, processo, classificação)

### 2️⃣ **Resposta Automática Pré-Preenchida**
Template padrão com texto conforme especificado:
```
Prezados,

Acusamos o recebimento de sua comunicação...
[completo com avisos de sistema e requisitos]
```

### 3️⃣ **Agendamento de Envio**
- Seleção de data/hora do envio
- Default: dia seguinte às 9:00 AM
- Envio via `financeiro@ipcms.com.br`
- Persistência em banco de dados

### 4️⃣ **Categorização no Outlook**
- Marca emails como "ANALISADO PELO NEW Sistemas IPCMS"
- Integrado com Microsoft Graph API
- Automático ao clicar "Mark as Analyzed"

---

## 📝 Arquivos Novos

| Arquivo | Propósito |
|---------|-----------|
| `EmailResponseController.php` | Lógica de agendamento e envio |
| `EmailCategorizationService.php` | Marca emails no Outlook |
| `email-detail-modal.php` | Interface da modal |
| `add_email_responses_table.sql` | Schema do banco |

---

## 🔧 Próximas Ações Necessárias

### 1. Executar Migração do Banco
```sql
-- Rode o SQL em seu MySQL:
mysql -u root novos_sistemas_ipc < database/migrations/add_email_responses_table.sql
```

### 2. Integrar Modal na Tela de Comunicações
No arquivo `html/views/comunicacoes.php`, adicione:

```php
// Perto do final, antes de </body>
<?php require_once __DIR__ . '/email-detail-modal.php'; ?>
```

E altere o botão "Extrair" para abrir a modal:
```php
<button class="btn-action" onclick="openEmailModal(<?php echo $comm['id']; ?>)">
    🔍 Extrair
</button>
```

### 3. Adicionar Endpoints na API
No arquivo `api.php`, adicione:

```php
// Antes do switch final:
case 'get_detail':
    require_once __DIR__ . '/html/controllers/CommunicationsController.php';
    $controller = new CommunicationsController($pdo, $config);
    $detail = $controller->getDetail($_GET['id'] ?? 0);
    header('Content-Type: application/json');
    echo json_encode($detail);
    break;

case 'mark_analyzed':
    require_once __DIR__ . '/html/services/EmailCategorizationService.php';
    $service = new EmailCategorizationService($config, $pdo);
    $token = $_SESSION['microsoft_access_token'] ?? null;
    $result = $service->markAsAnalyzed($_POST['id'] ?? 0, $token);
    header('Content-Type: application/json');
    echo json_encode($result);
    break;

case 'schedule_response':
    require_once __DIR__ . '/html/controllers/EmailResponseController.php';
    $controller = new EmailResponseController($pdo, $config);
    $result = $controller->scheduleResponse(
        $_POST['communication_id'] ?? 0,
        $_POST['to_email'] ?? '',
        $_POST['subject'] ?? '',
        $_POST['body'] ?? '',
        $_POST['scheduled_date'] ?? '',
        $_POST['scheduled_time'] ?? ''
    );
    header('Content-Type: application/json');
    echo json_encode($result);
    break;
```

### 4. Implementar Método getDetail em CommunicationsController

```php
public function getDetail($id)
{
    $stmt = $this->pdo->prepare('SELECT * FROM communications WHERE id = ?');
    $stmt->execute([$id]);
    $comm = $stmt->fetch();
    
    if (!$comm) {
        return ['success' => false, 'error' => 'Communication not found'];
    }
    
    return ['success' => true, 'communication' => $comm];
}
```

### 5. Configurar Cron Job para Enviar Respostas Agendadas

**Linux/Mac:**
```bash
# Adicione ao crontab (crontab -e):
*/15 * * * * /usr/bin/php /var/www/newipcsistemas/send-scheduled-responses.php
```

**Windows (Task Scheduler):**
```
Ação: C:\Python313\python.exe
Argumentos: C:\wamp64\www\newipcsistemas\send-scheduled-responses.php
Frequência: A cada 15 minutos
```

Crie o arquivo `send-scheduled-responses.php`:

```php
<?php
require_once __DIR__ . '/config/load-env.php';
$config = require_once __DIR__ . '/config/config.php';

try {
    $pdo = new PDO(
        'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['database'],
        $config['db']['username'],
        $config['db']['password']
    );
    
    require_once __DIR__ . '/html/controllers/EmailResponseController.php';
    
    // Get token from session/storage (implement accordingly)
    $token = getStoredAccessToken(); // You'll need to implement this
    
    $controller = new EmailResponseController($pdo, $config);
    $result = $controller->sendScheduledResponses($token);
    
    echo "Sent " . $result['sent_count'] . " responses\n";
} catch (Exception $e) {
    error_log('Error sending scheduled responses: ' . $e->getMessage());
}
?>
```

---

## 🧪 Fluxo Completo de Teste

### Passo 1: Obter Dados de Teste
```powershell
git pull origin main
php seed-test-data.php
```

### Passo 2: Executar Migração
```sql
mysql -u root novos_sistemas_ipc < database/migrations/add_email_responses_table.sql
```

### Passo 3: Integrar Modal
Adicione `email-detail-modal.php` em `comunicacoes.php`

### Passo 4: Testar na Tela
```
http://localhost/newipcsistemas/index.php?page=comunicacoes
```

Clique no botão "🔍 Extrair" → Deve abrir a modal com:
- ✅ Detalhes do email
- ✅ Informações extraídas
- ✅ Resposta pré-preenchida
- ✅ Opções de agendamento

### Passo 5: Marcar como Analisado
Clique "Mark as Analyzed" → Email deve ser:
- ✅ Marcado no banco como "processed"
- ✅ Categorizado no Outlook (se token disponível)

### Passo 6: Agendar Resposta
1. Ajuste a data/hora (default: amanhã 9:00)
2. Clique "Schedule Response"
3. Resposta fica na fila para envio

---

## 📊 Status das Features

| Feature | Status | Notas |
|---------|--------|-------|
| Modal de visualização | ✅ Implementado | Pronto para integração |
| Resposta automática | ✅ Implementado | Template fixo |
| Agendamento | ✅ Implementado | Banco pronto |
| Categorização Outlook | ✅ Implementado | Requer token |
| Envio automático | ⏳ Pronto | Falta cron job |
| API endpoints | ⏳ Pronto | Falta adicionar em api.php |

---

## 🔐 Considerações de Segurança

- ✅ Usar prepared statements (já implementado)
- ✅ Validar email_to antes de enviar
- ✅ Logar tentativas de agendamento
- ✅ Permitir apenas usuários autenticados

---

## 📞 Suporte

Se algo não funcionar, verifique:
1. Banco de dados migrado corretamente
2. Modal integrada no comunicacoes.php
3. Endpoints adicionados em api.php
4. Token Microsoft Graph válido em $_SESSION

---

**Versão**: 1.0.0  
**Data**: 2026-09-30  
**Status**: Ready for Integration
