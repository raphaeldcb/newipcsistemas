# 🔧 Troubleshooting - PHPWord IOFactory Not Found

## ❌ Erro

```
Class "PhpOffice\PhpWord\IOFactory" not found

PHP 8.3.6
Laravel 13.35.0
```

**Localização:** `app\Services\DocumentGenerationService.php:47`

---

## 🔍 Causa Raiz

O **autoloader do Composer** não foi reconstruído após a adição do package `phpoffice/phpword`.

Isso ocorre quando:
- Você adiciona `phpoffice/phpword` ao `composer.json`
- Executa `composer install` mas o autoloader fica desatualizado
- Laravel tenta carregar a classe mas não a encontra

---

## ✅ Solução

### Opção 1: Reconstruir Autoloader (RÁPIDO)

```bash
cd api
composer dump-autoload -o
```

**O que faz:**
- `-o`: Otimizado (cria arquivo único de autoload)
- Indexa todas as 7947+ classes do projeto
- Deve ser feito em segundos

**Resultado esperado:**
```
Generated optimized autoload files containing 7947 classes
```

### Opção 2: Update Completo

```bash
cd api
composer update phpoffice/phpword --no-dev
```

### Opção 3: Clean Install (Nuclear)

```bash
cd api
rm -rf vendor/
rm composer.lock
composer install
```

---

## 🧪 Validação

Após a solução, teste:

```bash
php -r "
require 'vendor/autoload.php';
use PhpOffice\PhpWord\IOFactory;
echo class_exists('PhpOffice\PhpWord\IOFactory') ? '✅ OK' : '❌ Erro';
"
```

**Resultado esperado:** `✅ OK`

---

## 🚀 Depois da Solução

1. **Reinicie o servidor Laravel:**
   ```bash
   php artisan serve
   ```

2. **Acesse a página de geração de documentos**

3. **Teste a geração:**
   - Vá para um processo
   - Clique em "📄 Documentos"
   - Selecione um template
   - Clique em "✨ Gerar Documento Word"

4. **Esperado:** Arquivo `.docx` gerado com sucesso

---

## 📋 Quando Isso Acontece

O autoloader é **reconstruído automaticamente** em:
- ✅ `composer install`
- ✅ `composer update`
- ✅ `composer require <package>`
- ✅ `composer dump-autoload`

Mas às vezes Laravel não detecta a mudança, então é necessário:
1. Limpar cache: `php artisan cache:clear`
2. Reconstruir: `composer dump-autoload -o`
3. Reiniciar servidor

---

## 🐛 Debug

Se ainda der erro depois da solução:

### Verificar se arquivo existe
```bash
ls vendor/phpoffice/phpword/src/PhpWord/IOFactory.php
# Deve retornar o caminho do arquivo
```

### Verificar autoloader gerado
```bash
ls vendor/autoload.php
# Deve existir
```

### Testar direto
```bash
cd api && php << 'EOF'
require 'vendor/autoload.php';
use PhpOffice\PhpWord\PhpWord;
use PhpOffice\PhpWord\IOFactory;

$phpWord = new PhpWord();
$section = $phpWord->addSection();
$section->addText('Teste');

$writer = IOFactory::createWriter($phpWord, 'Word2007');
$writer->save('/tmp/teste.docx');
echo "✅ Funcionou!";
EOF
```

---

## 💡 Dicas

1. **Sempre usar `composer dump-autoload -o`** após adicionar packages manualmente
2. **Limpar cache Laravel** se mudar autoloader: `php artisan optimize:clear`
3. **Não deletar `vendor/autoload.php`** - é crítico!
4. **Manter `composer.lock` sincronizado** com repositório

---

## 📞 Se Persistir

1. Verifique PHP version: `php -v` (deve ser 8.3+)
2. Verifique Laravel version: `php artisan --version`
3. Verifique permissões: `ls -la vendor/`
4. Limpe tudo:
   ```bash
   composer clear-cache
   composer dump-autoload -o
   php artisan optimize:clear
   ```

---

**Criado:** 2026-10-14  
**Status:** Resolvido ✅  
**Próxima Verificação:** Se erro persistir após solução

