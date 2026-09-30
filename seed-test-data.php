<?php
/**
 * Seed Test Data
 * Populates database with test communications for extraction testing
 */

require_once __DIR__ . '/config/config.php';

try {
    $pdo = new PDO(
        'mysql:host=' . $config['db']['host'] . ';dbname=' . $config['db']['database'] . ';charset=' . $config['db']['charset'],
        $config['db']['username'],
        $config['db']['password'],
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
    echo "✅ Connected to database\n";
} catch (PDOException $e) {
    echo "❌ Database error: " . $e->getMessage() . "\n";
    exit(1);
}

// Test data - realistic judicial communications
$test_communications = [
    [
        'subject' => 'Perícia Contábil - Processo 0123456-78.2024.8.26.0100',
        'from_name' => 'Tribunal de Justiça de São Paulo',
        'from_address' => 'protocolo@tjsp.jus.br',
        'body_preview' => 'Solicitamos perícia contábil de urgência para análise de bens no processo de divórcio. A vara responsável é a 2ª Vara de Família e Sucessões. Prazo de 30 dias.',
        'received_datetime' => date('Y-m-d H:i:s', strtotime('-5 days')),
    ],
    [
        'subject' => 'Edital de Citação - Var. Cível - Comarca de Campinas',
        'from_name' => 'Tribunal de Justiça',
        'from_address' => 'edital@tjsp.jus.br',
        'body_preview' => 'EDITAL DE CITAÇÃO. Ação ordinária de cobrança contra pessoa física. Vara Cível de Campinas. CNJ: 0234567-89.2024.8.26.0200. Prazo de comparecimento: 15 dias.',
        'received_datetime' => date('Y-m-d H:i:s', strtotime('-3 days')),
    ],
    [
        'subject' => 'Intimação - Recurso de Apelação',
        'from_name' => 'TJMG - Tribunal de Justiça de Minas Gerais',
        'from_address' => 'protocolo@tjmg.jus.br',
        'body_preview' => 'Intimação para apresentação de contraminuta no prazo de 15 dias úteis. Apelação cível nº 0345678-90.2024.8.13.0100. Comarca: Belo Horizonte.',
        'received_datetime' => date('Y-m-d H:i:s', strtotime('-7 days')),
    ],
    [
        'subject' => 'Perícia de Engenharia - Vistoria de Imóvel',
        'from_name' => 'Poder Judiciário - Justiça Estadual',
        'from_address' => 'peritagem@tribunal.jus.br',
        'body_preview' => 'Você foi designado como perito judicial para realização de vistoria técnica de imóvel residencial. Endereço: Rua das Flores, 123. Comarca: São Paulo. Processo nº 0456789-01.2024.8.26.0100.',
        'received_datetime' => date('Y-m-d H:i:s', strtotime('-10 days')),
    ],
    [
        'subject' => 'Parecer Jurídico - Assessoria Administrativo',
        'from_name' => 'Procuradoria Geral da Fazenda',
        'from_address' => 'parecer@pgfn.gov.br',
        'body_preview' => 'Solicitamos parecer jurídico sobre questão tributária relacionada a débito fiscal. Processo administrativo nº 567890. Comarca: Brasília. Prazo de resposta: 30 dias.',
        'received_datetime' => date('Y-m-d H:i:s', strtotime('-2 days')),
    ],
    [
        'subject' => 'Citação - Ação Trabalhista',
        'from_name' => 'Tribunal Regional do Trabalho',
        'from_address' => 'citacao@trt.jus.br',
        'body_preview' => 'Citação em ação trabalhista. Reclamante vs Empresa XYZ. Vara do Trabalho de São Paulo. Processo nº 0678901-23.2024.5.15.0100. Comparecimento obrigatório em 30 dias.',
        'received_datetime' => date('Y-m-d H:i:s', strtotime('-4 days')),
    ],
];

echo "\n📝 Seeding test communications...\n";
echo "==================================\n\n";

foreach ($test_communications as $i => $comm) {
    $stmt = $pdo->prepare(
        'INSERT INTO communications (subject, from_name, from_address, body_preview, received_datetime, status, message_id)
         VALUES (?, ?, ?, ?, ?, ?, ?)'
    );

    $message_id = 'test-' . $i . '-' . time() . '@example.com';
    $status = $stmt->execute([
        $comm['subject'],
        $comm['from_name'],
        $comm['from_address'],
        $comm['body_preview'],
        $comm['received_datetime'],
        'new',
        $message_id,
    ]);

    if ($status) {
        $id = $pdo->lastInsertId();
        echo "✅ Communication #$id created\n";
        echo "   From: " . $comm['from_name'] . "\n";
        echo "   Subject: " . substr($comm['subject'], 0, 70) . "...\n";
        echo "   Status: new (ready for extraction)\n\n";
    } else {
        echo "❌ Failed to create communication\n";
    }
}

// Get statistics
$total_result = $pdo->query('SELECT COUNT(*) as total FROM communications')->fetch();

echo "\n✅ Test data seeding complete!\n";
echo "Total communications: " . $total_result['total'] . "\n";

echo "\n🚀 Next steps:\n";
echo "1. Start PHP server: C:\\wamp64\\bin\\php\\php8.2.18\\php.exe -S localhost:8000 -t html\n";
echo "2. Login: admin@ipcms.com.br / admin123\n";
echo "3. Go to Comunicações\n";
echo "4. Click '🔍 Extrair' on any communication\n";
echo "5. Watch extraction results appear!\n";
