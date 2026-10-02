<?php
/**
 * Debug Email Classifier
 * Test with the judicial email that didn't classify correctly
 */

require_once __DIR__ . '/config/load-env.php';
$config = require_once __DIR__ . '/config/config.php';
require_once __DIR__ . '/html/services/EmailClassifierService.php';

$pdo = new PDO(
    'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['database'] . ';charset=' . $config['db']['charset'],
    $config['db']['username'],
    $config['db']['password'],
    [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
);

echo "=== DEBUG EMAIL CLASSIFIER ===\n\n";

// Test email content
$email_content = <<<'TEXT'
Prezados Senhores,

Segue em anexo a intimação judicial referente ao processo em epígrafe.

PROCESSO: 0001234-56.2026.8.26.0100
VARA: VARA ÚNICA
TRIBUNAL: TJMS

Data de recebimento: 17/09/2026

Atenciosamente,
Sistema de Comunicações Judiciais
TEXT;

$classifier = new EmailClassifierService($pdo);

echo "📧 EMAIL CONTENT:\n";
echo "─────────────────────────────────────\n";
echo $email_content . "\n\n";

echo "🔍 CLASSIFICATION TEST:\n";
echo "─────────────────────────────────────\n";

// Test judicial classification
echo "1️⃣ Is Judicial?\n";
$is_judicial = $classifier->classifyAsJudicial($email_content);
echo "   Result: " . ($is_judicial ? "✅ YES" : "❌ NO") . "\n\n";

// Test CNJ extraction
echo "2️⃣ CNJ Number Extraction:\n";
$reflection = new ReflectionClass($classifier);
$method = $reflection->getMethod('extractCNJNumber');
$method->setAccessible(true);
$cnj = $method->invoke($classifier, $email_content);
echo "   Found: " . ($cnj ? "✅ " . $cnj : "❌ NOT FOUND") . "\n";
echo "   Expected: 0001234-56.2026.8.26.0100\n\n";

// Test VARA extraction
echo "3️⃣ VARA Extraction:\n";
$method = $reflection->getMethod('extractVara');
$method->setAccessible(true);
$vara = $method->invoke($classifier, $email_content);
echo "   Found: " . ($vara ? "✅ " . $vara : "❌ NOT FOUND") . "\n";
echo "   Expected: VARA ÚNICA\n\n";

// Test COMARCA extraction
echo "4️⃣ COMARCA Extraction:\n";
$method = $reflection->getMethod('extractComarca');
$method->setAccessible(true);
$comarca = $method->invoke($classifier, $email_content);
echo "   Found: " . ($comarca ? "✅ " . $comarca : "❌ NOT FOUND") . "\n\n";

// Keyword analysis
echo "5️⃣ KEYWORD ANALYSIS:\n";
echo "   Judicial Keywords Found:\n";
$keywords = ['intimação', 'judicial', 'processo', 'vara', 'tribunal', 'tjms'];
foreach ($keywords as $kw) {
    $found = stripos($email_content, $kw) !== false;
    echo "   - " . str_pad($kw, 15) . ": " . ($found ? "✅" : "❌") . "\n";
}

echo "\n6️⃣ FINAL CLASSIFICATION:\n";
echo "   Classification: " . ($is_judicial ? "JUDICIAL ✅" : "NOT CLASSIFIED ❌") . "\n";
echo "   CNJ:   " . ($cnj ?: "MISSING") . "\n";
echo "   Vara:  " . ($vara ?: "MISSING") . "\n";
echo "   Comarca: " . ($comarca ?: "MISSING") . "\n";

?>
