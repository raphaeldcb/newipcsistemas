"""
Unit tests for QwenClassifierService

Tests:
1. Judicial email with CNJ extraction
2. Non-judicial email (billing)
3. Unknown/ambiguous email
4. Timeout handling
"""

import sys
import os
from unittest.mock import Mock, patch
import json
import requests

# Add parent directory to path for imports
sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "python"))

from QwenClassifierService import QwenClassifierService


def test_classify_email_judicial():
    """Test classification of judicial email with CNJ number."""
    print("\n" + "=" * 60)
    print("TEST 1: Classify Judicial Email with CNJ")
    print("=" * 60)

    service = QwenClassifierService(timeout=10)

    subject = "Intimação Judicial"
    body = """Prezados Senhores,
Segue em anexo a intimação judicial referente ao processo em epígrafe.
PROCESSO: 0001234-56.2026.8.26.0100
VARA: VARA ÚNICA
TRIBUNAL: TJMS
COMARCA: DOURADOS
Data de recebimento: 17/09/2026

Protocolo: 123456789"""

    # Mock the Ollama response
    mock_response = {
        "response": json.dumps({
            "classification": "JUDICIAL",
            "confidence": 0.98,
            "cnj_number": "0001234-56.2026.8.26.0100",
            "vara": "VARA ÚNICA",
            "comarca": "DOURADOS",
            "tribunal": "TJMS",
            "pedido": "Intimação para comparecer em juízo",
            "reasoning": "Email contém número de processo CNJ válido e referência explícita a intimação judicial"
        })
    }

    with patch("requests.post") as mock_post:
        mock_post.return_value = Mock(json=Mock(return_value=mock_response))

        result = service.classify_email(subject, body)

        # Assertions
        assert result["success"] is True, "Classification should succeed"
        assert result["classification"] == "JUDICIAL", "Should classify as JUDICIAL"
        assert result["confidence"] >= 0.9, "Confidence should be high"
        assert result["cnj_number"] == "0001234-56.2026.8.26.0100", "Should extract CNJ number"
        assert result["vara"] == "VARA ÚNICA", "Should extract vara"
        assert result["comarca"] == "DOURADOS", "Should extract comarca"
        assert result["tribunal"] == "TJMS", "Should extract tribunal"
        assert result["pedido"] is not None, "Should extract pedido"

        print(f"✓ Classification: {result['classification']}")
        print(f"✓ Confidence: {result['confidence']:.2f}")
        print(f"✓ CNJ Number: {result['cnj_number']}")
        print(f"✓ Vara: {result['vara']}")
        print(f"✓ Comarca: {result['comarca']}")
        print(f"✓ Tribunal: {result['tribunal']}")
        print(f"✓ Reasoning: {result['reasoning']}")
        print("\n✓ test_classify_email_judicial PASSED")


def test_classify_email_non_judicial():
    """Test classification of non-judicial email (billing)."""
    print("\n" + "=" * 60)
    print("TEST 2: Classify Non-Judicial Email (Billing)")
    print("=" * 60)

    service = QwenClassifierService(timeout=10)

    subject = "Fatura de Serviços - Setembro 2026"
    body = """Prezado Cliente,

Segue em anexo a fatura referente aos serviços prestados em Setembro/2026.

Descrição dos Serviços:
- Consultoria Jurídica: R$ 5.000,00
- Análise de Documentos: R$ 2.500,00

TOTAL: R$ 7.500,00
Data de Vencimento: 30/10/2026

Favor efetuar pagamento via transferência bancária.

Atenciosamente,
Escritório ABC Advogados"""

    # Mock the Ollama response
    mock_response = {
        "response": json.dumps({
            "classification": "NON_JUDICIAL",
            "confidence": 0.95,
            "cnj_number": None,
            "vara": None,
            "comarca": None,
            "tribunal": None,
            "pedido": "Pagamento de fatura de serviços",
            "reasoning": "Email é notamente administrativo/financeiro. Contém fatura de serviços, não há número de processo ou referência a intimação judicial."
        })
    }

    with patch("requests.post") as mock_post:
        mock_post.return_value = Mock(json=Mock(return_value=mock_response))

        result = service.classify_email(subject, body)

        # Assertions
        assert result["success"] is True, "Classification should succeed"
        assert result["classification"] == "NON_JUDICIAL", "Should classify as NON_JUDICIAL"
        assert result["cnj_number"] is None, "Should NOT extract CNJ number"
        assert result["vara"] is None, "Should NOT extract vara"
        assert result["confidence"] >= 0.9, "Confidence should be high"

        print(f"✓ Classification: {result['classification']}")
        print(f"✓ Confidence: {result['confidence']:.2f}")
        print(f"✓ CNJ Number (should be None): {result['cnj_number']}")
        print(f"✓ Vara (should be None): {result['vara']}")
        print(f"✓ Reasoning: {result['reasoning']}")
        print("\n✓ test_classify_email_non_judicial PASSED")


def test_classify_email_unknown():
    """Test classification of ambiguous/unknown email."""
    print("\n" + "=" * 60)
    print("TEST 3: Classify Unknown/Ambiguous Email")
    print("=" * 60)

    service = QwenClassifierService(timeout=10)

    subject = "Comunicação Importante"
    body = """Prezado Sr./Sra.,

Recebemos sua solicitação e estamos processando a informação.

Aguardamos seu retorno com os documentos solicitados.

Atenciosamente"""

    # Mock the Ollama response
    mock_response = {
        "response": json.dumps({
            "classification": "UNKNOWN",
            "confidence": 0.60,
            "cnj_number": None,
            "vara": None,
            "comarca": None,
            "tribunal": None,
            "pedido": "Solicitação de documentação",
            "reasoning": "Email é vago e não contém sinais claros de ser judicial ou não-judicial. Poderia ser administrativo ou comunicação genérica."
        })
    }

    with patch("requests.post") as mock_post:
        mock_post.return_value = Mock(json=Mock(return_value=mock_response))

        result = service.classify_email(subject, body)

        # Assertions
        assert result["success"] is True, "Classification should succeed"
        assert result["classification"] == "UNKNOWN", "Should classify as UNKNOWN"
        assert result["confidence"] < 0.9, "Confidence should be moderate"
        assert result["reasoning"] is not None, "Should have reasoning"

        print(f"✓ Classification: {result['classification']}")
        print(f"✓ Confidence: {result['confidence']:.2f}")
        print(f"✓ Reasoning: {result['reasoning']}")
        print("\n✓ test_classify_email_unknown PASSED")


def test_classify_email_ollama_timeout():
    """Test timeout handling."""
    print("\n" + "=" * 60)
    print("TEST 4: Handle Ollama Timeout")
    print("=" * 60)

    service = QwenClassifierService(timeout=1)  # Very short timeout

    subject = "Test Email"
    body = "Test body"

    # Mock timeout exception
    with patch("requests.post") as mock_post:
        mock_post.side_effect = requests.Timeout("Connection timeout")

        result = service.classify_email(subject, body)

        # Assertions
        assert result["success"] is False, "Should indicate failure"
        assert result["fallback"] is True, "Should set fallback flag"
        assert result["classification"] == "UNKNOWN", "Should default to UNKNOWN"
        assert "timeout" in result["error"].lower(), "Error message should mention timeout"

        print(f"✓ Success: {result['success']}")
        print(f"✓ Fallback: {result['fallback']}")
        print(f"✓ Classification: {result['classification']}")
        print(f"✓ Error: {result['error']}")
        print("\n✓ test_classify_email_ollama_timeout PASSED")


if __name__ == "__main__":
    """Run all tests."""
    print("\n" + "=" * 60)
    print("QWEN CLASSIFIER SERVICE - UNIT TESTS")
    print("=" * 60)

    try:
        test_classify_email_judicial()
        test_classify_email_non_judicial()
        test_classify_email_unknown()
        test_classify_email_ollama_timeout()

        print("\n" + "=" * 60)
        print("ALL TESTS PASSED ✓")
        print("=" * 60)
        print("\nSummary:")
        print("  ✓ test_classify_email_judicial PASSED")
        print("  ✓ test_classify_email_non_judicial PASSED")
        print("  ✓ test_classify_email_unknown PASSED")
        print("  ✓ test_classify_email_ollama_timeout PASSED")
        print("\nTotal: 4/4 tests passed")

    except AssertionError as e:
        print(f"\n✗ TEST FAILED: {e}")
        sys.exit(1)
    except Exception as e:
        print(f"\n✗ UNEXPECTED ERROR: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
