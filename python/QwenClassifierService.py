"""
QwenClassifierService - Email Classification via Ollama/Qwen

Classifies emails as JUDICIAL/NON_JUDICIAL/UNKNOWN and extracts:
- CNJ process number
- Court (vara) information
- Region (comarca)
- Tribunal identifier (TJMS, TJSP, etc.)
- Request summary (pedido)
"""

import json
import re
import requests
from typing import Dict, Optional, Any
import logging

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class QwenClassifierService:
    """Email classifier using Ollama/Qwen model."""

    def __init__(
        self,
        ollama_base_url: str = "http://localhost:11434",
        model: str = "qwen3:14b",
        timeout: int = 30,
        temperature: float = 0.3,
    ):
        """
        Initialize the Qwen classifier service.

        Args:
            ollama_base_url: Base URL for Ollama API
            model: Model name to use (e.g., 'qwen3:14b', 'perito-qwen')
            timeout: Request timeout in seconds
            temperature: Model temperature (0.0-1.0, lower = more consistent)
        """
        self.base_url = ollama_base_url
        self.model = model
        self.timeout = timeout
        self.temperature = temperature
        self.generate_url = f"{self.base_url}/api/generate"

        # CNJ process number pattern: 0000000-00.0000.0.00.0000
        self.cnj_pattern = re.compile(r"\d{7}-\d{2}\.\d{4}\.\d{1}\.\d{2}\.\d{4}")

    def _build_prompt(self, subject: str, body: str) -> str:
        """Build the prompt for email classification."""
        return f"""Analyze this email and classify it. Return ONLY valid JSON, no markdown, no extra text.

Subject: {subject}

Body:
{body}

Respond with valid JSON exactly like this (adjust values based on email content):
{{
  "classification": "JUDICIAL|NON_JUDICIAL|UNKNOWN",
  "confidence": 0.95,
  "cnj_number": "0001234-56.2026.8.26.0100" or null,
  "vara": "VARA description or null",
  "comarca": "COMARCA name or null",
  "tribunal": "TJMS|TJSP|TJRJ|etc or null",
  "pedido": "Brief request summary or null",
  "reasoning": "Explanation of classification"
}}"""

    def _extract_json_from_response(self, text: str) -> Dict[str, Any]:
        """Extract JSON from model response, handling potential markdown wrapping."""
        # First try direct JSON parsing
        try:
            return json.loads(text.strip())
        except json.JSONDecodeError:
            pass

        # Try to extract JSON from markdown code block
        json_match = re.search(r"```(?:json)?\s*(\{.*?\})\s*```", text, re.DOTALL)
        if json_match:
            try:
                return json.loads(json_match.group(1))
            except json.JSONDecodeError:
                pass

        # Try to find JSON object in text
        json_match = re.search(r"\{.*\}", text, re.DOTALL)
        if json_match:
            try:
                return json.loads(json_match.group(0))
            except json.JSONDecodeError:
                pass

        raise ValueError(f"Could not extract valid JSON from response: {text[:200]}")

    def _normalize_response(self, data: Dict[str, Any]) -> Dict[str, Any]:
        """Normalize and validate response data."""
        # Ensure required fields exist
        normalized = {
            "classification": data.get("classification", "UNKNOWN"),
            "confidence": float(data.get("confidence", 0.0)),
            "cnj_number": data.get("cnj_number") or None,
            "vara": data.get("vara") or None,
            "comarca": data.get("comarca") or None,
            "tribunal": data.get("tribunal") or None,
            "pedido": data.get("pedido") or None,
            "reasoning": data.get("reasoning", ""),
            "success": True,
        }

        # Validate classification
        if normalized["classification"] not in ["JUDICIAL", "NON_JUDICIAL", "UNKNOWN"]:
            normalized["classification"] = "UNKNOWN"

        # Validate confidence is between 0 and 1
        if not 0 <= normalized["confidence"] <= 1:
            normalized["confidence"] = 0.0

        # Validate CNJ format if present
        if normalized["cnj_number"]:
            if not self.cnj_pattern.match(normalized["cnj_number"]):
                logger.warning(
                    f"Invalid CNJ format: {normalized['cnj_number']}, setting to None"
                )
                normalized["cnj_number"] = None

        return normalized

    def classify_email(self, subject: str, body: str) -> Dict[str, Any]:
        """
        Classify an email as JUDICIAL/NON_JUDICIAL/UNKNOWN.

        Args:
            subject: Email subject line
            body: Email body text

        Returns:
            Dictionary with classification result containing:
            - classification: JUDICIAL|NON_JUDICIAL|UNKNOWN
            - confidence: float 0-1
            - cnj_number: Process number or null
            - vara: Court information or null
            - comarca: Region or null
            - tribunal: Tribunal identifier or null
            - pedido: Request summary or null
            - reasoning: Brief explanation
            - success: Boolean indicating success
            - error: Error message (on failure)
            - fallback: Boolean indicating fallback mode (on failure)
        """
        try:
            # Build the prompt
            prompt = self._build_prompt(subject, body)

            # Call Ollama API
            payload = {
                "model": self.model,
                "prompt": prompt,
                "stream": False,
                "temperature": self.temperature,
            }

            logger.info(f"Calling Ollama with model: {self.model}")
            response = requests.post(
                self.generate_url,
                json=payload,
                timeout=self.timeout,
            )

            response.raise_for_status()

            # Parse response
            result = response.json()
            response_text = result.get("response", "")

            if not response_text:
                raise ValueError("Empty response from Ollama")

            logger.debug(f"Raw Ollama response: {response_text[:200]}")

            # Extract JSON from response
            classified = self._extract_json_from_response(response_text)

            # Normalize and validate
            normalized = self._normalize_response(classified)

            logger.info(
                f"Classification: {normalized['classification']} "
                f"(confidence: {normalized['confidence']:.2f})"
            )

            return normalized

        except requests.Timeout:
            logger.error("Ollama request timeout")
            return {
                "success": False,
                "error": "Ollama request timeout",
                "fallback": True,
                "classification": "UNKNOWN",
                "confidence": 0.0,
            }
        except requests.ConnectionError as e:
            logger.error(f"Ollama connection error: {e}")
            return {
                "success": False,
                "error": f"Connection error: {str(e)}",
                "fallback": True,
                "classification": "UNKNOWN",
                "confidence": 0.0,
            }
        except ValueError as e:
            logger.error(f"JSON extraction error: {e}")
            return {
                "success": False,
                "error": f"Invalid response format: {str(e)}",
                "fallback": True,
                "classification": "UNKNOWN",
                "confidence": 0.0,
            }
        except Exception as e:
            logger.error(f"Unexpected error: {e}")
            return {
                "success": False,
                "error": f"Unexpected error: {str(e)}",
                "fallback": True,
                "classification": "UNKNOWN",
                "confidence": 0.0,
            }
