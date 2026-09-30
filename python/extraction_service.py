#!/usr/bin/env python3
"""
Email Extraction Service
Extracts key information from emails using local LLM (Qwen via Ollama)
"""

import json
import sys
import logging
import requests
from typing import Dict, Optional
from datetime import datetime

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger('ExtractionService')


class OllamaExtractor:
    """Use Ollama/Qwen to extract information from emails"""

    def __init__(self, ollama_url: str = 'http://localhost:11434', model: str = 'qwen:7b'):
        self.ollama_url = ollama_url
        self.model = model
        self.endpoint = f"{ollama_url}/api/generate"

        logger.info(f"Initialized OllamaExtractor with model {model} at {ollama_url}")

    def extract_from_email(self, email_data: Dict) -> Dict:
        """
        Extract structured information from email using Qwen

        Returns:
            {
                'vara': 'Vara de Família',
                'comarca': 'São Paulo',
                'processo': '0123456-78.2024.8.26.0100',
                'pedido': 'Perícia contábil no processo de divórcio',
                'classification': 'judicial',
                'confidence': 0.85,
                'extracted_fields': {...}
            }
        """
        try:
            # Build email summary for extraction
            email_text = self._build_email_text(email_data)

            # Create extraction prompt
            prompt = self._create_extraction_prompt(email_text)

            # Call Qwen via Ollama
            response = self._call_ollama(prompt)

            # Parse response
            extracted = self._parse_extraction_response(response)

            # Add metadata
            extracted['email_id'] = email_data.get('id')
            extracted['extracted_at'] = datetime.now().isoformat()

            logger.info(f"Successfully extracted info from email {email_data.get('id')}")
            return extracted

        except Exception as e:
            logger.error(f"Error extracting from email: {e}")
            return {
                'error': str(e),
                'email_id': email_data.get('id'),
                'extracted_at': datetime.now().isoformat(),
            }

    def _build_email_text(self, email_data: Dict) -> str:
        """Build text representation of email for extraction"""
        parts = []

        if email_data.get('subject'):
            parts.append(f"Subject: {email_data['subject']}")

        if email_data.get('from_name'):
            parts.append(f"From: {email_data['from_name']} ({email_data.get('from_address', '')})")

        if email_data.get('received_datetime'):
            parts.append(f"Date: {email_data['received_datetime']}")

        if email_data.get('body_preview'):
            parts.append(f"Body:\n{email_data['body_preview']}")

        return '\n'.join(parts)

    def _create_extraction_prompt(self, email_text: str) -> str:
        """Create extraction prompt for Qwen"""
        return f"""Analyze this email and extract key legal information.

Email:
---
{email_text}
---

Extract and respond with valid JSON only (no markdown, no explanations):
{{
    "vara": "Court/Vara name (e.g., 'Vara de Família', '2ª Vara Cível') or null if not found",
    "comarca": "Region/Comarca (e.g., 'São Paulo', 'Campinas') or null",
    "processo": "Legal process number (CNJ format: 0000000-00.0000.0.00.0000) or null",
    "pedido": "Brief summary of the legal request/petition in Portuguese (1-2 sentences) or null",
    "classification": "Type: 'judicial', 'administrative', 'tribunal', 'unknown'",
    "confidence": 0.0 to 1.0 (0.0 = guessing, 1.0 = certain),
    "has_legal_content": true/false
}}

Rules:
- vara: Exact court name only
- comarca: Region/city only
- processo: CNJ format only (numbers with dots)
- pedido: Extract the actual request from email
- Respond ONLY with valid JSON, no other text
- If field not found, use null
- confidence: 0.9+ if confident, 0.5-0.9 if partial, <0.5 if uncertain"""

    def _call_ollama(self, prompt: str) -> str:
        """Call Ollama API for extraction"""
        payload = {
            'model': self.model,
            'prompt': prompt,
            'stream': False,
            'temperature': 0.3,  # Lower temperature for consistent extraction
        }

        try:
            response = requests.post(
                self.endpoint,
                json=payload,
                timeout=60
            )
            response.raise_for_status()

            result = response.json()
            return result.get('response', '')

        except requests.exceptions.ConnectionError:
            raise Exception(f"Cannot connect to Ollama at {self.ollama_url}. Is it running?")
        except Exception as e:
            raise Exception(f"Ollama API error: {e}")

    def _parse_extraction_response(self, response: str) -> Dict:
        """Parse JSON response from Qwen"""
        try:
            # Try to extract JSON from response (in case there's extra text)
            import re
            json_match = re.search(r'\{.*\}', response, re.DOTALL)

            if not json_match:
                raise ValueError("No JSON found in response")

            json_str = json_match.group(0)
            parsed = json.loads(json_str)

            # Validate structure
            required_fields = ['vara', 'comarca', 'processo', 'pedido', 'classification', 'confidence']
            for field in required_fields:
                if field not in parsed:
                    parsed[field] = None

            return parsed

        except json.JSONDecodeError as e:
            logger.error(f"Failed to parse JSON response: {response}")
            raise Exception(f"Invalid JSON in extraction response: {e}")


def extract_email(email_id: int, email_data: Dict, config: Dict) -> Dict:
    """
    Main extraction function

    Args:
        email_id: Email ID in database
        email_data: Email content {id, subject, from_name, from_address, body_preview, received_datetime}
        config: Configuration with ollama_url and model

    Returns:
        Extraction result
    """
    try:
        ollama_url = config.get('ollama_url', 'http://localhost:11434')
        model = config.get('model', 'qwen:7b')

        extractor = OllamaExtractor(ollama_url, model)
        result = extractor.extract_from_email(email_data)

        return {
            'success': 'error' not in result,
            'email_id': email_id,
            'extraction': result,
        }

    except Exception as e:
        logger.error(f"Extraction failed for email {email_id}: {e}")
        return {
            'success': False,
            'email_id': email_id,
            'error': str(e),
        }


def batch_extract(email_list: list, config: Dict) -> list:
    """
    Extract information from multiple emails

    Args:
        email_list: List of {id, subject, from_name, from_address, body_preview, received_datetime}
        config: Configuration

    Returns:
        List of extraction results
    """
    results = []

    logger.info(f"Starting batch extraction of {len(email_list)} emails")

    for i, email in enumerate(email_list, 1):
        logger.info(f"Extracting email {i}/{len(email_list)} (ID: {email.get('id')})")

        result = extract_email(email.get('id'), email, config)
        results.append(result)

    logger.info(f"Batch extraction completed: {len(results)} emails processed")

    return results


def main():
    """CLI entry point"""
    if len(sys.argv) < 2:
        print(json.dumps({
            'success': False,
            'error': 'Usage: extraction_service.py <action> [arguments]'
        }))
        sys.exit(1)

    action = sys.argv[1]

    try:
        if action == 'test':
            # Test connection to Ollama
            extractor = OllamaExtractor()
            test_email = {
                'id': 'test-001',
                'subject': 'Perícia Contábil - Processo 0123456-78.2024.8.26.0100',
                'from_name': 'Tribunal de Justiça',
                'from_address': 'protocolo@tjsp.jus.br',
                'body_preview': 'Solicitamos perícia contábil de urgência para análise de bens no processo de divórcio',
                'received_datetime': '2024-09-29T10:00:00',
            }

            result = extractor.extract_from_email(test_email)
            print(json.dumps(result, indent=2, ensure_ascii=False))

        elif action == 'extract':
            # Extract single email (expects JSON on stdin)
            email_data = json.loads(sys.stdin.read())
            email_id = email_data.get('id')

            config = {
                'ollama_url': sys.argv[2] if len(sys.argv) > 2 else 'http://localhost:11434',
                'model': sys.argv[3] if len(sys.argv) > 3 else 'qwen:7b',
            }

            result = extract_email(email_id, email_data, config)
            print(json.dumps(result, ensure_ascii=False))

        else:
            print(json.dumps({
                'success': False,
                'error': f'Unknown action: {action}'
            }))
            sys.exit(1)

    except Exception as e:
        logger.error(f"Error: {e}")
        print(json.dumps({
            'success': False,
            'error': str(e)
        }))
        sys.exit(1)


if __name__ == '__main__':
    main()
