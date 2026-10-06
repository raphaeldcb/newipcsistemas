<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class ClassificacaoService
{
    protected $ollama_host;
    protected $ollama_model;
    protected $timeout;

    public function __construct()
    {
        $this->ollama_host = config('services.ollama.host', 'http://localhost:11434');
        $this->ollama_model = config('services.ollama.model', 'qwen:7b');
        $this->timeout = config('services.ollama.timeout', 30);
    }

    /**
     * Classificar e-mail usando Ollama/Qwen
     */
    public function classificar(string $subject, string $body): array
    {
        try {
            $prompt = $this->buildPrompt($subject, $body);

            $startTime = microtime(true);

            $response = Http::timeout($this->timeout)
                ->post("{$this->ollama_host}/api/generate", [
                    'model' => $this->ollama_model,
                    'prompt' => $prompt,
                    'stream' => false,
                ])
                ->json();

            $duration = (microtime(true) - $startTime) * 1000;

            if (!isset($response['response'])) {
                return $this->fallback();
            }

            $result = $this->parseResponse($response['response']);
            $result['duration_ms'] = (int) $duration;
            $result['method'] = 'ollama';

            return $result;
        } catch (\Exception $e) {
            Log::warning('Ollama classification failed', [
                'error' => $e->getMessage(),
                'subject' => $subject,
            ]);

            return $this->fallback();
        }
    }

    /**
     * Build prompt para Ollama
     */
    protected function buildPrompt(string $subject, string $body): string
    {
        return <<<PROMPT
Você é um classificador de e-mails jurídicos. Classifique o e-mail abaixo como JUDICIAL, NON_JUDICIAL ou UNKNOWN.

Responda APENAS em JSON com a estrutura:
{
  "classification": "JUDICIAL|NON_JUDICIAL|UNKNOWN",
  "confidence": 0.0-1.0,
  "reasoning": "breve explicação",
  "cnj": "número CNJ se encontrado, ou null",
  "vara": "vara se mencionada, ou null",
  "comarca": "comarca se mencionada, ou null"
}

Assunto: {$subject}

Corpo:
{$body}

Classificação:
PROMPT;
    }

    /**
     * Parse resposta do Ollama
     */
    protected function parseResponse(string $response): array
    {
        try {
            // Extrair JSON da resposta
            if (preg_match('/\{.*\}/s', $response, $matches)) {
                $data = json_decode($matches[0], true);

                return [
                    'classification' => $data['classification'] ?? 'UNKNOWN',
                    'confidence' => floatval($data['confidence'] ?? 0.5),
                    'reasoning' => $data['reasoning'] ?? '',
                    'extracted_fields' => [
                        'cnj' => $data['cnj'] ?? null,
                        'vara' => $data['vara'] ?? null,
                        'comarca' => $data['comarca'] ?? null,
                    ],
                ];
            }
        } catch (\Exception $e) {
            Log::warning('Failed to parse Ollama response', ['error' => $e->getMessage()]);
        }

        return $this->fallback();
    }

    /**
     * Fallback: classificação por palavras-chave
     */
    public function fallback(string $subject = '', string $body = ''): array
    {
        $text = strtoupper("{$subject} {$body}");

        $judicial_keywords = [
            'PROCESSO', 'CASO', 'VARA', 'TRIBUNAL',
            'AGRAVO', 'APELAÇÃO', 'SENTENÇA', 'DECISÃO',
            'RECURSO', 'PETIÇÃO', 'CONTESTAÇÃO', 'PARECER',
            'AUDIÊNCIA', 'MANDADO', 'INQUERITO', 'DENÚNCIA',
        ];

        $score = 0;
        foreach ($judicial_keywords as $keyword) {
            if (strpos($text, $keyword) !== false) {
                $score++;
            }
        }

        $confidence = min($score / 3, 1.0);
        $classification = $score >= 2 ? 'JUDICIAL' : 'NON_JUDICIAL';

        return [
            'classification' => $classification,
            'confidence' => $confidence,
            'reasoning' => 'Classificação por palavras-chave (fallback)',
            'extracted_fields' => [],
            'method' => 'keyword_matching',
        ];
    }
}
