# 🧪 Guia de Teste - Gerador de Laudos em Excel

## ✅ Checklist Pré-Teste

Antes de começar, execute:

```bash
cd api

# 1. Executar migration
php artisan migrate

# 2. Iniciar servidor
php artisan serve

# 3. Em outro terminal, se usando Vite:
npm run dev
```

---

## 📝 Teste 1: Página de Exportação

### ✓ Passos

1. Abra o navegador em `http://localhost:8000`
2. Faça login
3. Vá para **Processos** ou procure um processo específico
4. Clique em **📊 Laudos Excel** (novo botão na página do processo)

### ✓ Resultado Esperado

- ✅ Página carrega sem erros
- ✅ Seletor de tipo de laudo aparece
- ✅ Upload CSV opcional é visível
- ✅ Tabela de exportações vazia (primeiro acesso)

---

## 📝 Teste 2: Exportar Laudo SEM CSV

### ✓ Passos

1. Na página de exportação, selecione **Tipo de Laudo**: "🧬 Análise DNA"
2. Clique em **✨ Gerar Laudo Excel** (SEM fazer upload de CSV)
3. Aguarde

### ✓ Resultado Esperado

- ✅ Mensagem: "Laudo exportado com sucesso!"
- ✅ Novo arquivo aparece na tabela de "Laudos Exportados"
- ✅ Status: ✓ Sucesso
- ✅ Botão ⬇️ Download está disponível

### ✓ Validação do Arquivo

1. Faça download do arquivo
2. Abra em Excel/LibreOffice
3. Verifique:
   - ✅ Título "LAUDO DE ANÁLISE - DNA"
   - ✅ Dados do processo (número, código)
   - ✅ Informações de pessoas (se existirem)
   - ✅ Datas (coleta, resultado, atual)
   - ✅ Cabeçalhos em negrito

---

## 📝 Teste 3: Importar CSV e Exportar

### 📄 Preparar arquivo CSV

Crie um arquivo `alelos.csv`:

```csv
MARCADOR,ALELO_1,ALELO_2,FREQUENCIA
D5S818,11,13,0.156
D7S820,10,12,0.198
D8S1179,13,15,0.142
D13S317,9,11,0.089
D16S539,12,14,0.134
```

### ✓ Passos

1. Na página de exportação, selecione **Tipo de Laudo**: "🧬 Análise DNA"
2. Clique em **📂 Importar CSV**
3. Selecione o arquivo `alelos.csv`
4. Aguarde importação

### ✓ Resultado Esperado (Importação)

- ✅ Mensagem: "✓ 5 linhas importadas com sucesso!"
- ✅ Seção "Preview dos Dados" aparece
- ✅ Cada linha mostra os dados importados:
  ```
  Linha 1: marcador: D5S818 | alelo_1: 11 | alelo_2: 13 | frequencia: 0.156
  ...
  ```

### ✓ Passos (Continuar)

5. Clique em **✨ Gerar Laudo Excel**
6. Aguarde exportação

### ✓ Resultado Esperado (Exportação)

- ✅ Mensagem: "Laudo exportado com sucesso!"
- ✅ Novo arquivo na tabela
- ✅ Status: ✓ Sucesso

### ✓ Validação do Arquivo

1. Faça download
2. Abra em Excel
3. Verifique:
   - ✅ Cabeçalho (título, dados processo, pessoas)
   - ✅ Seção "ANÁLISE GENÉTICA"
   - ✅ Tabela com marcadores:
     ```
     Marcador | Alelo 1 | Alelo 2 | Genótipo | Frequência
     D5S818   | 11      | 13      | 11/13    | 0.156
     D7S820   | 10      | 12      | 10/12    | 0.198
     ...
     ```
   - ✅ Bordas nas células
   - ✅ Cabeçalhos em negrito

---

## 📝 Teste 4: Testar Outros Tipos de Laudo

### DNA (já testado acima)

### HIV

CSV esperado:
```csv
CARGA_VIRAL,CD4,STATUS
50000,450,Detectável
```

Resultado: Deve mostrar seção "ANÁLISE HIV" com os dados.

### PATERNITY

CSV esperado:
```csv
CONCLUSAO
POSITIVO - IDP > 99.99%
```

Resultado: Deve mostrar "ANÁLISE DE PATERNIDADE" com conclusão.

### SCEI

CSV esperado:
```csv
MEDICAMENTO,DOSE,FREQUENCIA
Efavirenz,600mg,Uma vez ao dia
Tenofovir,300mg,Uma vez ao dia
Lamivudina,300mg,Uma vez ao dia
```

Resultado: Deve mostrar tabela de medicamentos.

### GENERICO

Qualquer CSV com dados customizados.

---

## 📝 Teste 5: Download e Deletar

### ✓ Download

1. Clique em ⬇️ Download em uma exportação
2. Arquivo deve fazer download
3. Abra e valide conteúdo

### ✓ Deletar

1. Clique em 🗑️ Deletar em uma exportação
2. Confirme na caixa de diálogo
3. Arquivo deve desaparecer da tabela
4. Arquivo físico deve ser removido de `storage/laudo-exports/`

---

## 🐛 Testes de Erro

### Teste: Sem arquivo CSV + tipo genérico

Esperado: Deve gerar Excel vazio (só cabeçalho)

### Teste: CSV com dados inválidos

Esperado: Deve importar mesmo assim (sem validação de tipo)

### Teste: Upload CSV muito grande (>5MB)

Esperado: Erro "O arquivo não pode ter mais que 5MB"

---

## 🔍 Verificações Técnicas

### Database

```bash
# Verificar tabela criada
php artisan tinker
>>> App\Models\LaudoExportacao::all()
```

Deve retornar exportações criadas.

### Arquivos

```bash
# Verificar storage
ls -la storage/laudo-exports/
```

Deve conter arquivos `.xlsx` gerados.

### Logs

```bash
# Verificar logs
tail -f storage/logs/laravel.log
```

Deve haver entradas como:
```
[2026-10-14] Laudo exportado: LAUDO_DNA_12345_20261014120000.xlsx para processo 12345
```

---

## ✅ Checklist de Validação Final

- [ ] Página de exportação carrega
- [ ] Exportação SEM CSV funciona
- [ ] Arquivo Excel gerado tem formatação
- [ ] CSV é importado corretamente
- [ ] Dados importados aparecem no Excel
- [ ] Download funciona
- [ ] Deletar funciona
- [ ] Arquivo é removido após deletar
- [ ] Log registra operações
- [ ] Todos os tipos de laudo funcionam
- [ ] Mensagens de erro aparecem corretamente

---

## 🚀 Próximos Passos (Após Validação)

1. **Refinar templates Excel** - adicionar formatação de moeda, datas, etc
2. **Validação de CSV** - verificar coluna obrigatória, tipos de dados
3. **Fórmulas Excel** - adicionar cálculos automáticos (ex: genótipo = AL1/AL2)
4. **Múltiplos CSVs** - permitir fazer upload de várias abas
5. **Exportação PDF** - adicionar export para PDF
6. **Assinatura digital** - integrar com certificado digital
7. **Histórico** - manter registro de quem gerou quando

---

## 📞 Troubleshooting

### Erro: "Migration not found"
```bash
php artisan migrate:refresh
```

### Erro: "View not found: laudos.exportar"
Verifique se `resources/views/laudos/exportar.blade.php` existe.

### Erro: "Route not found"
Verifique se rotas foram adicionadas em `routes/web.php`

### Erro: "Storage permission denied"
```bash
chmod -R 775 storage/
```

---

**Data Criação**: 2026-10-14  
**Status**: 🟢 Pronto para teste  
**Próxima Etapa**: Feedback do usuário para refinamentos
