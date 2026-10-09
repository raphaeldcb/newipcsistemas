<?php

namespace App\Services;

use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Http;

class QwenClassificationService {
    private $ollamaUrl;
    private $model = 'qwen:7b';
    private $timeout = 30;

    public function __construct() {
        $this->ollamaUrl = env('OLLAMA_URL', 'http://localhost:11434');
    }

    public function classify($subject, $body) {
        try {
            $prompt = "Analise este e-mail e classifique em uma das categorias: Dúvida, Reclamação, Sugestão, Solicitação, Informação, Outro. Retorne APENAS a categoria.\n\nAssunto: $subject\nConteúdo: " . substr($body, 0, 500);

            $response = Http::timeout($this->timeout)
                ->post("{$this->ollamaUrl}/api/generate", [
                    'model' => $this->model,
                    'prompt' => $prompt,
                    'stream' => false,
                ]);

            if ($response->failed()) {
                Log::warning('Classificação falhou, usando padrão');
                return 'Outro';
            }

            $classification = trim($response->json('response', 'Outro'));
            return $classification;
        } catch (\Exception $e) {
            Log::error('Erro na classificação: ' . $e->getMessage());
            return 'Outro';
        }
    }

    public function generateResponse($subject, $body, $classification) {
        try {
            $prompt = "Baseado na seguinte classificação: $classification\n\nE-mail:\nAssunto: $subject\nConteúdo: " . substr($body, 0, 500) . "\n\nGere uma resposta profissional breve (máximo 3 linhas). Retorne APENAS a resposta.";

            $response = Http::timeout($this->timeout)
                ->post("{$this->ollamaUrl}/api/generate", [
                    'model' => $this->model,
                    'prompt' => $prompt,
                    'stream' => false,
                ]);

            if ($response->failed()) {
                return 'Obrigado pelo e-mail. Responderemos em breve.';
            }

            return trim($response->json('response', 'Obrigado pelo e-mail.'));
        } catch (\Exception $e) {
            Log::error('Erro ao gerar resposta: ' . $e->getMessage());
            return 'Obrigado pelo e-mail. Responderemos em breve.';
        }
    }
}
