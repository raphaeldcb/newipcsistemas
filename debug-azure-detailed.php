<?php
/**
 * Debug detalhado para erros do Azure
 * Mostra exatamente qual é a resposta do servidor
 */

require_once __DIR__ . '/config/load-env.php';
$config = require_once __DIR__ . '/config/config.php';

echo "═══════════════════════════════════════════════════════\n";
echo "DEBUG DETALHADO - AZURE CLIENT CREDENTIALS FLOW\n";
echo "═══════════════════════════════════════════════════════\n\n";

// Verificar credenciais
if (empty($config['microsoft']['client_id']) || empty($config['microsoft']['client_secret']) || empty($config['microsoft']['tenant_id'])) {
    die("❌ Credenciais incompletas no .env.local\n");
}

$client_id = $config['microsoft']['client_id'];
$client_secret = $config['microsoft']['client_secret'];
$tenant_id = $config['microsoft']['tenant_id'];

$token_url = "https://login.microsoftonline.com/{$tenant_id}/oauth2/v2.0/token";

echo "Parâmetros da Requisição:\n";
echo "─────────────────────────\n";
echo "  URL: {$token_url}\n";
echo "  Client ID: " . substr($client_id, 0, 10) . "...\n";
echo "  Tenant ID: {$tenant_id}\n";
echo "  Grant Type: client_credentials\n\n";

$params = [
    'client_id' => $client_id,
    'client_secret' => $client_secret,
    'grant_type' => 'client_credentials',
    'scope' => 'https://graph.microsoft.com/.default',
];

echo "Enviando requisição...\n\n";

$ch = curl_init($token_url);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($params));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
// Disable SSL verification for Windows development
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt($ch, CURLOPT_VERBOSE, false);

$response = curl_exec($ch);
$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$error = curl_error($ch);
curl_close($ch);

echo "Resposta do Azure:\n";
echo "─────────────────\n";
echo "  HTTP Code: {$http_code}\n";

if ($error) {
    echo "  cURL Error: {$error}\n\n";
    echo "❌ ERRO DE CONECTIVIDADE\n";
    echo "Possíveis causas:\n";
    echo "  - Firewall/Proxy bloqueando acesso a Azure\n";
    echo "  - Problema de DNS\n";
    echo "  - SSL Certificate issue\n";
    exit(1);
}

echo "\nResposta Raw:\n";
echo "──────────────\n";
echo $response . "\n\n";

$decoded = json_decode($response, true);

if ($http_code === 200) {
    echo "✅ SUCESSO!\n";
    echo "Token obtido: " . substr($decoded['access_token'], 0, 30) . "...\n";
} else {
    echo "❌ ERRO HTTP {$http_code}\n\n";

    if (isset($decoded['error'])) {
        echo "Erro: " . $decoded['error'] . "\n";
        echo "Descrição: " . ($decoded['error_description'] ?? 'N/A') . "\n";
        echo "URI: " . ($decoded['error_uri'] ?? 'N/A') . "\n\n";

        // Diagnóstico por tipo de erro
        switch ($decoded['error']) {
            case 'invalid_client':
                echo "💡 Client ID ou Secret inválido\n";
                echo "   Ações:\n";
                echo "   1. Verifique .env.local\n";
                echo "   2. Copie valores novamente do Azure Portal\n";
                echo "   3. Certifique-se de não ter espaços extras\n";
                break;

            case 'unauthorized_client':
                echo "💡 Cliente não autorizado\n";
                echo "   Ações:\n";
                echo "   1. Verifique se o App foi registrado no Azure\n";
                echo "   2. Verifique o Tenant ID\n";
                echo "   3. Certifique-se de estar no tenant correto\n";
                break;

            case 'invalid_grant':
                echo "💡 Grant inválido\n";
                echo "   Ações:\n";
                echo "   1. Verifique se as permissões 'Mail.Read' e 'Mail.ReadWrite' estão ativas\n";
                echo "   2. Verifique se Admin Consent foi dado\n";
                echo "   3. Tente renovar o Client Secret no Azure Portal\n";
                break;

            case 'AADSTS65001':
                echo "💡 User or admin consent not provided\n";
                echo "   Ações:\n";
                echo "   1. Vá para Azure Portal > Seu App > API permissions\n";
                echo "   2. Clique em 'Grant admin consent for [Tenant]'\n";
                echo "   3. Aguarde alguns minutos e tente novamente\n";
                break;

            default:
                echo "💡 Erro desconhecido\n";
                echo "   Verifique a documentação do erro acima\n";
                break;
        }
    } else {
        echo "Resposta não é JSON válido\n";
        echo "Verifique se está acessando o endpoint correto\n";
    }
}

echo "\n═══════════════════════════════════════════════════════\n";
?>
