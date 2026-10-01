<?php
session_start();

$config = require_once __DIR__ . '/config/config.php';

// Database connection
try {
    $pdo = new PDO(
        'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['database'] . ';charset=' . $config['db']['charset'],
        $config['db']['username'],
        $config['db']['password'],
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
} catch (PDOException $e) {
    die('Database error: ' . $e->getMessage());
}

// Load services
require_once __DIR__ . '/html/services/MicrosoftAppAuthService.php';
require_once __DIR__ . '/html/services/MicrosoftGraphService.php';

echo "<h2>Testing Email Sync & Save</h2>";
echo "<pre>";

// 1. Get token
$appAuth = new MicrosoftAppAuthService($config);
$token = $appAuth->getValidToken();

if (!$token) {
    echo "❌ Failed to get token\n";
    exit;
}

echo "✅ Token obtained\n\n";

// 2. Get emails via GraphService
$graphService = new MicrosoftGraphService($config, $pdo);
$emails = $graphService->syncMessages($token);

echo "API Response:\n";
echo "- HTTP Code: (from syncMessages)\n";
echo "- Email count: " . (isset($emails['value']) ? count($emails['value']) : 0) . "\n";

if (!isset($emails['value'])) {
    echo "❌ No emails returned from API\n";
    echo "Response: " . json_encode($emails, JSON_PRETTY_PRINT) . "\n";
    exit;
}

echo "✅ Got " . count($emails['value']) . " emails from API\n\n";

// 3. Check current database
$stmt = $pdo->query("SELECT COUNT(*) as count FROM communications");
$result = $stmt->fetch();
$db_count_before = $result['count'];

echo "Database status BEFORE:\n";
echo "- Total communications: $db_count_before\n";
echo "- Table schema:\n";

$stmt = $pdo->query("DESCRIBE communications");
$columns = $stmt->fetchAll();
foreach ($columns as $col) {
    echo "  - " . $col['Field'] . " (" . $col['Type'] . ")\n";
}

echo "\n--- Attempting to save first email ---\n";

// 4. Try to save first email
if (!empty($emails['value'][0])) {
    $email = $emails['value'][0];
    
    echo "Email data:\n";
    echo "- ID: " . $email['id'] . "\n";
    echo "- Subject: " . $email['subject'] . "\n";
    echo "- From: " . ($email['from']['emailAddress']['address'] ?? 'N/A') . "\n";
    
    // Prepare data like CommunicationsController does
    $data = [
        'message_id' => $email['id'],
        'conversation_id' => $email['conversationId'] ?? null,
        'subject' => $email['subject'] ?? 'No Subject',
        'body_preview' => $email['bodyPreview'] ?? '',
        'from_address' => $email['from']['emailAddress']['address'] ?? null,
        'from_name' => $email['from']['emailAddress']['name'] ?? null,
        'received_datetime' => $email['receivedDateTime'] ?? null,
        'has_attachments' => $email['hasAttachments'] ?? false,
        'attachment_count' => count($email['attachments'] ?? []),
    ];
    
    echo "\nPrepared data:\n";
    echo json_encode($data, JSON_PRETTY_PRINT) . "\n\n";
    
    // Try to insert
    try {
        $sql = "INSERT INTO communications 
                (message_id, conversation_id, subject, body_preview, from_address, from_name, received_datetime, has_attachments, attachment_count) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            $data['message_id'],
            $data['conversation_id'],
            $data['subject'],
            $data['body_preview'],
            $data['from_address'],
            $data['from_name'],
            $data['received_datetime'],
            $data['has_attachments'],
            $data['attachment_count']
        ]);
        
        echo "✅ INSERT successful!\n";
    } catch (Exception $e) {
        echo "❌ INSERT failed: " . $e->getMessage() . "\n";
    }
}

// 5. Check after
$stmt = $pdo->query("SELECT COUNT(*) as count FROM communications");
$result = $stmt->fetch();
$db_count_after = $result['count'];

echo "\nDatabase status AFTER:\n";
echo "- Total communications: $db_count_after\n";
echo "- Inserted: " . ($db_count_after - $db_count_before) . " new\n";

// 6. List current emails
echo "\nCurrent emails in database:\n";
$stmt = $pdo->query("SELECT id, message_id, subject, from_address, created_at FROM communications ORDER BY created_at DESC LIMIT 5");
$comms = $stmt->fetchAll();
foreach ($comms as $comm) {
    echo "- [" . $comm['id'] . "] " . $comm['subject'] . " (from: " . $comm['from_address'] . ")\n";
}

echo "</pre>";
