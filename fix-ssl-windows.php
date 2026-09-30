<?php
/**
 * Fix para SSL Certificate problem no Windows
 * Solução: desabilitar verificação SSL para desenvolvimento
 * (Em produção, configure certificados corretamente)
 */

echo "═══════════════════════════════════════════════════════\n";
echo "FIX - SSL Certificate Problem no Windows\n";
echo "═══════════════════════════════════════════════════════\n\n";

$php_ini_path = php_ini_loaded_file();
echo "PHP.INI detectado: {$php_ini_path}\n\n";

// Verificar se já está configurado
$php_ini_content = file_get_contents($php_ini_path);

if (strpos($php_ini_content, 'openssl.cafile') !== false) {
    echo "⚠️  openssl.cafile já está configurado\n";
    echo "Se o erro persiste, tente a solução alternativa abaixo\n\n";
} else {
    echo "openssl.cafile não está configurado\n";
    echo "Solução 1: Configurar certificados (recomendado em produção)\n\n";
}

echo "═══════════════════════════════════════════════════════\n";
echo "SOLUÇÃO IMEDIATA PARA TESTES (Desenvolvimento)\n";
echo "═══════════════════════════════════════════════════════\n\n";

echo "Edite html/services/MicrosoftGraphService.php\n\n";

echo "ENCONTRE estas linhas:\n";
echo "────────────────────\n";
echo "  curl_setopt(\$ch, CURLOPT_SSL_VERIFYPEER, true);\n\n";

echo "SUBSTITUA por:\n";
echo "──────────────\n";
echo "  curl_setopt(\$ch, CURLOPT_SSL_VERIFYPEER, false);\n";
echo "  curl_setopt(\$ch, CURLOPT_SSL_VERIFYHOST, 0);\n\n";

echo "⚠️  AVISO:\n";
echo "Esta solução desabilita verificação SSL. Use APENAS em:\n";
echo "  ✓ Desenvolvimento local\n";
echo "  ✓ Testes\n";
echo "❌ NUNCA em produção!\n\n";

echo "═══════════════════════════════════════════════════════\n";
echo "SOLUÇÃO PERMANENTE (Produção)\n";
echo "═══════════════════════════════════════════════════════\n\n";

echo "1. Baixe cacert.pem em: https://curl.haxx.se/ca/cacert.pem\n\n";

echo "2. Coloque em: C:\\php\\extras\\ssl\\cacert.pem\n\n";

echo "3. Edite php.ini e adicione:\n";
echo "   [openssl]\n";
echo "   openssl.cafile = \"C:\\php\\extras\\ssl\\cacert.pem\"\n\n";

echo "4. Reinicie Apache/PHP\n\n";

echo "═══════════════════════════════════════════════════════\n";
echo "Para TESTES RÁPIDOS, use a Solução Imediata acima\n";
echo "═══════════════════════════════════════════════════════\n";
?>
