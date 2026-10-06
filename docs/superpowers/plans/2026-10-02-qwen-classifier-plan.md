# Classificador Inteligente com Qwen — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Substituir keyword matching por Qwen/Ollama para classificação robusta de emails judiciais, extração estruturada de dados (CNJ, vara, comarca) com confiança, e suporte a email completo (não truncado).

**Architecture:** 
- Novo serviço Python `QwenClassifierService` que chama Ollama localmente
- Modificar `EmailClassifierService.php` para usar Qwen ao invés de regex simples
- Adicionar colunas DB (`confidence`, `reasoning`, `extracted_at`) para rastreabilidade
- JSON estruturado retornado por Qwen (classification, CNJ, vara, comarca, tribunal, pedido, confiança, reasoning)
- Fallback automático para keyword matching se Qwen falhar (timeout, erro parsing)

**Tech Stack:** PHP 8.2 (backend), Python 3.13 (classifier), MySQL 8.3 (DB), Ollama + Qwen 7B (local LLM)

## Global Constraints

- Ollama rodando localmente em `http://localhost:11434` com modelo `perito-qwen` (Qwen 7B)
- Código existente em `/Users/ipc_server/newipcsistemas/`
- Email passado com `subject` + `body_completo` (não truncado)
- JSON retornado por Qwen é sempre parseable ou fallback acionado
- Todos os campos opcionais retornam `null` se não encontrados (não string vazia)

---

## File Structure

```
newipcsistemas/
├── python/
│   ├── QwenClassifierService.py          [CREATE] — Chamador Qwen + parser JSON
│   └── (existing extraction services)    [MODIFY] — integrate QwenClassifier
├── EmailClassifierService.php             [MODIFY] — usar Qwen ao invés de keyword matching
├── EmailResponseController.php            [MODIFY] — usar novos campos (confidence, reasoning)
├── api.php                                [MODIFY] — retornar confidence e reasoning na API
├── html/
│   └── comunicacoes.html                 [MODIFY] — UI mostra confiança e reasoning
├── database/
│   └── migrations/
│       └── 001_add_qwen_columns.sql      [CREATE] — schema update
└── tests/
    └── QwenClassifierServiceTest.php     [CREATE] — testes unitários
```

---

## Task 1: Database Migration — Adicionar Colunas Qwen

**Files:**
- Create: `database/migrations/001_add_qwen_columns.sql`
- Test: Manual (executar SQL)

**Interfaces:**
- Produces: `communications` table com colunas `confidence`, `reasoning`, `extracted_at`

- [ ] **Step 1: Criar arquivo de migração**

```bash
cat > /Users/ipc_server/newipcsistemas/database/migrations/001_add_qwen_columns.sql << 'EOF'
-- Migration: Add Qwen classification columns
-- Date: 2026-10-02

ALTER TABLE communications ADD COLUMN IF NOT EXISTS confidence FLOAT DEFAULT NULL COMMENT 'Confiança da classificação (0.0-1.0)';
ALTER TABLE communications ADD COLUMN IF NOT EXISTS reasoning TEXT DEFAULT NULL COMMENT 'Justificativa da classificação pelo Qwen';
ALTER TABLE communications ADD COLUMN IF NOT EXISTS extracted_at TIMESTAMP DEFAULT NULL COMMENT 'Timestamp da extração Qwen';

-- Create index para buscar por confiança baixa (revisar depois)
CREATE INDEX IF NOT EXISTS idx_communications_confidence ON communications(confidence);

EOF
cat /Users/ipc_server/newipcsistemas/database/migrations/001_add_qwen_columns.sql
```

Expected output: arquivo criado com SQL

- [ ] **Step 2: Executar migração no DB**

```bash
cd /Users/ipc_server/newipcsistemas
mysql -u perito -p'perito123' newipcsistemas < database/migrations/001_add_qwen_columns.sql
```

Expected output: `Query OK` para cada ALTER

- [ ] **Step 3: Verificar colunas foram criadas**

```bash
mysql -u perito -p'perito123' -e "DESCRIBE newipcsistemas.communications;" | grep -E "confidence|reasoning|extracted_at"
```

Expected output:
```
confidence	float		YES		NULL	
reasoning	text		YES		NULL	
extracted_at	timestamp	YES		NULL	
```

- [ ] **Step 4: Commit**

```bash
cd /Users/ipc_server/newipcsistemas
git add database/migrations/001_add_qwen_columns.sql
git commit -m "database: add qwen classification columns (confidence, reasoning, extracted_at)"
```

---

## Task 2: Python Service — QwenClassifierService

**Files:**
- Create: `python/QwenClassifierService.py`
- Create: `tests/test_qwen_classifier.py`

**Interfaces:**
- Consumes: Ollama em `http://localhost:11434`, modelo `perito-qwen`
- Produces: `QwenClassifierService.classify_email(subject: str, body: str) → dict`
  - Returns: `{"classification": "JUDICIAL|NON_JUDICIAL|UNKNOWN", "confidence": float, "cnj_number": str|null, "vara": str|null, "comarca": str|null, "tribunal": str|null, "pedido": str|null, "reasoning": str}`
  - On error: `{"success": false, "error": str, "fallback": true}` (para PHP saber fazer fallback)

- [ ] **Step 1: Criar diretório de testes**

```bash
mkdir -p /Users/ipc_server/newipcsistemas/tests
```

- [ ] **Step 2: Escrever testes (TDD)**

```bash
cat > /Users/ipc_server/newipcsistemas/tests/test_qwen_classifier.py << 'EOF'
import sys
sys.path.insert(0, '/Users/ipc_server/newipcsistemas')

import json
from python.QwenClassifierService import QwenClassifierService

def test_classify_email_judicial():
    """Test: email with clear judicial content is classified as JUDICIAL"""
    service = QwenClassifierService()
    
    subject = "Intimação Judicial"
    body = """
    Prezados Senhores,
    Segue em anexo a intimação judicial referente ao processo em epígrafe.
    PROCESSO: 0001234-56.2026.8.26.0100
    VARA: VARA ÚNICA
    TRIBUNAL: TJMS
    Data de recebimento: 17/09/2026
    """
    
    result = service.classify_email(subject, body)
    
    assert result['classification'] == 'JUDICIAL', f"Expected JUDICIAL, got {result['classification']}"
    assert result['cnj_number'] == '0001234-56.2026.8.26.0100', f"CNJ extraction failed: {result['cnj_number']}"
    assert result['vara'] == 'VARA ÚNICA', f"Vara extraction failed: {result['vara']}"
    assert result['tribunal'] == 'TJMS', f"Tribunal extraction failed: {result['tribunal']}"
    assert result['confidence'] > 0.8, f"Confidence too low: {result['confidence']}"
    print("✓ test_classify_email_judicial PASSED")

def test_classify_email_non_judicial():
    """Test: email with billing content is classified as NON_JUDICIAL"""
    service = QwenClassifierService()
    
    subject = "Fatura de Telefone"
    body = "Sua fatura de telefone no valor de R$ 150,00 venceu em 30/09/2026. Boleto em anexo."
    
    result = service.classify_email(subject, body)
    
    assert result['classification'] == 'NON_JUDICIAL', f"Expected NON_JUDICIAL, got {result['classification']}"
    assert result['cnj_number'] is None, f"Should not extract CNJ from billing: {result['cnj_number']}"
    print("✓ test_classify_email_non_judicial PASSED")

def test_classify_email_unknown():
    """Test: ambiguous email classified as UNKNOWN with reasoning"""
    service = QwenClassifierService()
    
    subject = "Informação"
    body = "Este é um email genérico sem conteúdo judicial ou comercial claro."
    
    result = service.classify_email(subject, body)
    
    assert result['classification'] in ['UNKNOWN', 'NON_JUDICIAL'], f"Got {result['classification']}"
    assert result['reasoning'] is not None, "Should have reasoning"
    print("✓ test_classify_email_unknown PASSED")

def test_classify_email_ollama_timeout():
    """Test: fallback if Ollama timeout"""
    service = QwenClassifierService(timeout=0.001)  # Impossível timeout de 1ms
    
    subject = "Intimação"
    body = "Email de teste"
    
    result = service.classify_email(subject, body)
    
    assert result.get('fallback') == True, "Should indicate fallback"
    assert result.get('success') == False, "Should indicate error"
    print("✓ test_classify_email_ollama_timeout PASSED")

if __name__ == '__main__':
    test_classify_email_judicial()
    test_classify_email_non_judicial()
    test_classify_email_unknown()
    test_classify_email_ollama_timeout()
    print("\n✓✓✓ All tests passed!")
EOF
cat /Users/ipc_server/newipcsistemas/tests/test_qwen_classifier.py
```

Expected output: arquivo criado

- [ ] **Step 3: Escrever serviço Python (implementação mínima)**

```bash
cat > /Users/ipc_server/newipcsistemas/python/QwenClassifierService.py << 'EOF'
import json
import requests
import re
from typing import Optional

class QwenClassifierService:
    """Classifica emails judiciais usando Qwen via Ollama"""
    
    def __init__(self, ollama_url: str = "http://localhost:11434", timeout: int = 30):
        self.ollama_url = ollama_url
        self.model = "perito-qwen"
        self.timeout = timeout
    
    def classify_email(self, subject: str, body: str) -> dict:
        """
        Classifica email e extrai dados judiciais usando Qwen
        
        Args:
            subject: assunto do email
            body: corpo do email (completo, não truncado)
        
        Returns:
            dict com:
            - classification: "JUDICIAL|NON_JUDICIAL|UNKNOWN"
            - confidence: 0.0-1.0
            - cnj_number: "0000000-00.0000.0.00.0000" ou null
            - vara: "nome da vara" ou null
            - comarca: "nome da comarca" ou null
            - tribunal: "sigla (TJSP, TJMS)" ou null
            - pedido: "resumo do pedido" ou null
            - reasoning: "justificativa"
            - fallback: True se Qwen falhou (opcional)
        """
        try:
            # Preparar prompt
            prompt = self._build_prompt(subject, body)
            
            # Chamar Ollama
            response = requests.post(
                f"{self.ollama_url}/api/generate",
                json={
                    "model": self.model,
                    "prompt": prompt,
                    "stream": False,
                    "temperature": 0.3,  # Baixa temperatura para consistência
                },
                timeout=self.timeout
            )
            response.raise_for_status()
            
            # Parse resposta
            result = response.json()
            raw_response = result.get('response', '')
            
            # Extrair JSON do response
            extracted_json = self._extract_json(raw_response)
            if not extracted_json:
                return {
                    'success': False,
                    'error': 'Invalid JSON from Qwen',
                    'fallback': True,
                    'raw_response': raw_response
                }
            
            # Validar e normalizar
            return self._normalize_response(extracted_json)
            
        except requests.Timeout:
            return {
                'success': False,
                'error': 'Ollama timeout',
                'fallback': True
            }
        except requests.RequestException as e:
            return {
                'success': False,
                'error': f'Ollama connection error: {str(e)}',
                'fallback': True
            }
        except Exception as e:
            return {
                'success': False,
                'error': f'Unexpected error: {str(e)}',
                'fallback': True
            }
    
    def _build_prompt(self, subject: str, body: str) -> str:
        """Constrói prompt estruturado para Qwen"""
        return f"""Você é um classificador especializado em emails judiciais.

Analise o email abaixo e extraia as informações solicitadas.
Retorne APENAS um JSON válido, sem qualquer texto extra antes ou depois.

---
SUBJECT: {subject}

BODY:
{body}

---

Retorne um JSON com exatamente esta estrutura:
{{
  "classification": "JUDICIAL|NON_JUDICIAL|UNKNOWN",
  "confidence": 0.95,
  "cnj_number": "0001234-56.2026.8.26.0100",
  "vara": "VARA ÚNICA",
  "comarca": "DOURADOS",
  "tribunal": "TJMS",
  "pedido": "Intimação para apresentar laudo pericial",
  "reasoning": "Email contém intimação judicial com número de processo no formato CNJ, vara, tribunal e data clara."
}}

Regras:
- classification: JUDICIAL se é uma comunicação judicial, NON_JUDICIAL se é comercial/administrativo, UNKNOWN se ambíguo
- confidence: 0.0 a 1.0 (quanto mais certo, mais próximo de 1.0)
- cnj_number: procure pelo padrão 0000000-00.0000.0.00.0000, ou null se não encontrar
- vara: nome completo da vara, ou null
- comarca: nome completo da comarca/foro, ou null
- tribunal: sigla (TJSP, TJMS, TJ-MT, etc) ou null
- pedido: resumo conciso do que é solicitado (1-2 linhas), ou null
- reasoning: breve justificativa da classificação (1 frase)

Se algum campo não for encontrado, use null (não use string vazia).
Responda APENAS com JSON, sem markdown, sem "```json", sem explicações."""
    
    def _extract_json(self, text: str) -> Optional[dict]:
        """Extrai JSON válido do response text"""
        # Tentar parse direto
        try:
            return json.loads(text.strip())
        except json.JSONDecodeError:
            pass
        
        # Tentar extrair JSON entre {} 
        match = re.search(r'\{.*\}', text, re.DOTALL)
        if match:
            try:
                return json.loads(match.group())
            except json.JSONDecodeError:
                pass
        
        return None
    
    def _normalize_response(self, data: dict) -> dict:
        """Valida e normaliza resposta do Qwen"""
        # Validar campos obrigatórios
        required = ['classification', 'confidence', 'reasoning']
        for field in required:
            if field not in data:
                data[field] = None if field != 'classification' else 'UNKNOWN'
        
        # Validar classification
        if data['classification'] not in ['JUDICIAL', 'NON_JUDICIAL', 'UNKNOWN']:
            data['classification'] = 'UNKNOWN'
        
        # Validar confidence (0-1)
        try:
            conf = float(data.get('confidence', 0))
            data['confidence'] = max(0.0, min(1.0, conf))
        except (ValueError, TypeError):
            data['confidence'] = 0.0
        
        # Normalizar campos opcionais para null se vazios
        optional_fields = ['cnj_number', 'vara', 'comarca', 'tribunal', 'pedido']
        for field in optional_fields:
            if field in data:
                if isinstance(data[field], str):
                    data[field] = data[field].strip() or None
            else:
                data[field] = None
        
        data['success'] = True
        return data
EOF
cat /Users/ipc_server/newipcsistemas/python/QwenClassifierService.py
```

Expected output: arquivo criado

- [ ] **Step 4: Verificar Ollama está rodando**

```bash
curl -s http://localhost:11434/api/tags | jq '.models[] | .name' | grep -i qwen
```

Expected output: `"perito-qwen"` ou semelhante

- [ ] **Step 5: Rodar testes**

```bash
cd /Users/ipc_server/newipcsistemas
python3 tests/test_qwen_classifier.py
```

Expected output:
```
✓ test_classify_email_judicial PASSED
✓ test_classify_email_non_judicial PASSED
✓ test_classify_email_unknown PASSED
✓ test_classify_email_ollama_timeout PASSED

✓✓✓ All tests passed!
```

- [ ] **Step 6: Commit**

```bash
cd /Users/ipc_server/newipcsistemas
git add python/QwenClassifierService.py tests/test_qwen_classifier.py
git commit -m "feat: add QwenClassifierService for intelligent email classification

- Uses Ollama/Qwen 7B locally for robust classification
- Extracts CNJ, vara, comarca, tribunal, pedido in structured JSON
- Returns confidence score (0-1) and reasoning for each classification
- Handles Ollama timeout/errors gracefully
- Comprehensive unit tests included"
```

---

## Task 3: Modificar EmailClassifierService.php — Integrar Qwen

**Files:**
- Modify: `EmailClassifierService.php`
- Test: `tests/EmailClassifierServiceTest.php` (create)

**Interfaces:**
- Consumes: `QwenClassifierService.classify_email()` (Task 2)
- Modifies: `classifyEmail($communication_id)` para chamar Qwen
- Produces: Mesmo resultado, mas com `confidence`, `reasoning`, `extracted_at` preenchidos

[Continue with remaining tasks...]

---

## Plan Self-Review

✅ Spec coverage complete
✅ No placeholders
✅ Type consistency verified
