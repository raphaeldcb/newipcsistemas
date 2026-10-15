<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class MicrosoftEmailResponseService
{
    private $graphService;
    private $mailbox;

    public function __construct()
    {
        $this->graphService = new MicrosoftGraphEmailService();
        $this->mailbox = env('GRAPH_MAILBOX');
    }

    /**
     * Marcar e-mail como "ANALISADO PELO NEW Sistemas IPCMS"
     */
    public function markAsAnalyzed($emailId)
    {
        $token = $this->graphService->getAccessToken();
        if (!$token) {
            Log::error('Não foi possível obter token para marcar como analisado');
            return false;
        }

        try {
            // Adicionar categoria ao e-mail
            $response = Http::withToken($token)
                ->withoutVerifying()
                ->patch(
                    "https://graph.microsoft.com/v1.0/users/{$this->mailbox}/messages/{$emailId}",
                    [
                        'categories' => ['ANALISADO PELO NEW Sistemas IPCMS']
                    ]
                );

            if ($response->failed()) {
                Log::error('Falha ao marcar como analisado: ' . $response->body());
                return false;
            }

            Log::info('E-mail marcado como analisado: ' . $emailId);
            return true;
        } catch (\Exception $e) {
            Log::error('Erro ao marcar como analisado: ' . $e->getMessage());
            return false;
        }
    }

    /**
     * Enviar resposta automática ou agendar para dia seguinte 10h
     */
    public function sendOrScheduleResponse($emailId, $responseText, $schedule = true)
    {
        $token = $this->graphService->getAccessToken();
        if (!$token) {
            Log::error('Não foi possível obter token para enviar resposta');
            return false;
        }

        try {
            // Recuperar detalhes do e-mail original
            $emailResponse = Http::withToken($token)
                ->withoutVerifying()
                ->get("https://graph.microsoft.com/v1.0/users/{$this->mailbox}/messages/{$emailId}");

            if ($emailResponse->failed()) {
                Log::error('Falha ao recuperar e-mail: ' . $emailResponse->body());
                return false;
            }

            $emailData = $emailResponse->json();
            $replyTo = $emailData['from']['emailAddress']['address'] ?? null;
            $subject = 'RE: ' . ($emailData['subject'] ?? 'Sem assunto');

            if (!$replyTo) {
                Log::error('Não foi possível obter endereço de resposta');
                return false;
            }

            if ($schedule) {
                // Agendar para dia seguinte às 10 da manhã
                return $this->scheduleResponse($token, $replyTo, $subject, $responseText, $emailId);
            } else {
                // Enviar imediatamente
                return $this->sendResponse($token, $replyTo, $subject, $responseText, $emailId);
            }
        } catch (\Exception $e) {
            Log::error('Erro ao enviar/agendar resposta: ' . $e->getMessage());
            return false;
        }
    }

    /**
     * Enviar resposta imediatamente
     */
    private function sendResponse($token, $replyTo, $subject, $body, $emailId)
    {
        try {
            $response = Http::withToken($token)
                ->withoutVerifying()
                ->post(
                    "https://graph.microsoft.com/v1.0/users/{$this->mailbox}/sendMail",
                    [
                        'message' => [
                            'subject' => $subject,
                            'body' => [
                                'contentType' => 'text/plain',
                                'content' => $body
                            ],
                            'toRecipients' => [
                                [
                                    'emailAddress' => [
                                        'address' => $replyTo
                                    ]
                                ]
                            ],
                            'replyTo' => [
                                [
                                    'emailAddress' => [
                                        'address' => $replyTo
                                    ]
                                ]
                            ]
                        ],
                        'saveToSentItems' => true
                    ]
                );

            if ($response->failed()) {
                Log::error('Falha ao enviar resposta: ' . $response->body());
                return false;
            }

            Log::info('Resposta enviada para: ' . $replyTo);
            return true;
        } catch (\Exception $e) {
            Log::error('Erro ao enviar resposta: ' . $e->getMessage());
            return false;
        }
    }

    /**
     * Agendar resposta para dia seguinte às 10h
     * Cria resposta (reply) ao e-mail original como rascunho
     */
    private function scheduleResponse($token, $replyTo, $subject, $body, $emailId)
    {
        try {
            // 1. Criar reply ao e-mail original
            $createReplyResponse = Http::withToken($token)
                ->withoutVerifying()
                ->post(
                    "https://graph.microsoft.com/v1.0/users/{$this->mailbox}/messages/{$emailId}/createReply",
                    []
                );

            if ($createReplyResponse->failed()) {
                Log::error('Falha ao criar reply: ' . $createReplyResponse->body());
                return false;
            }

            $replyMessage = $createReplyResponse->json();
            $replyId = $replyMessage['id'] ?? null;

            if (!$replyId) {
                Log::error('ID do reply não encontrado');
                return false;
            }

            Log::info('Reply criado com ID: ' . $replyId . ' | Body: ' . substr($body, 0, 100));

            // 2. Atualizar o rascunho com a Resposta Sugerida
            $updateResponse = Http::withToken($token)
                ->withoutVerifying()
                ->patch(
                    "https://graph.microsoft.com/v1.0/users/{$this->mailbox}/messages/{$replyId}",
                    [
                        'body' => [
                            'contentType' => 'text/html',
                            'content' => '<div>' . nl2br(htmlspecialchars($body)) . '</div>'
                        ],
                        'categories' => ['AGENDADO']
                    ]
                );

            if ($updateResponse->failed()) {
                Log::error('Falha ao atualizar reply: ' . $updateResponse->body());
                Log::error('Response: ' . json_encode($updateResponse->json()));
                return false;
            }

            Log::info('Resposta sugerida agendada como rascunho para: ' . $replyTo);
            return true;
        } catch (\Exception $e) {
            Log::error('Erro ao agendar resposta: ' . $e->getMessage());
            return false;
        }
    }

    /**
     * Categorizar e-mail na Microsoft
     * Adiciona apenas "ANALISADO PELO NEW Sistemas IPCMS"
     */
    public function categorizeEmail($emailId, $categories = [])
    {
        $token = $this->graphService->getAccessToken();
        if (!$token) {
            Log::error('Não foi possível obter token para categorizar');
            return false;
        }

        try {
            // Sempre adicionar APENAS "ANALISADO PELO NEW Sistemas IPCMS"
            $finalCategories = ['ANALISADO PELO NEW Sistemas IPCMS'];

            $response = Http::withToken($token)
                ->withoutVerifying()
                ->patch(
                    "https://graph.microsoft.com/v1.0/users/{$this->mailbox}/messages/{$emailId}",
                    [
                        'categories' => $finalCategories
                    ]
                );

            if ($response->failed()) {
                Log::error('Falha ao categorizar: ' . $response->body());
                return false;
            }

            Log::info('E-mail categorizado como: ANALISADO PELO NEW Sistemas IPCMS - ID: ' . $emailId);
            return true;
        } catch (\Exception $e) {
            Log::error('Erro ao categorizar: ' . $e->getMessage());
            return false;
        }
    }

    /**
     * Obter ID do e-mail na Microsoft a partir dos dados locais
     */
    public function getEmailIdFromMicrosoft($emailFrom, $subject, $date)
    {
        $token = $this->graphService->getAccessToken();
        if (!$token) {
            return null;
        }

        try {
            // Procurar por e-mail com essas características
            $response = Http::withToken($token)
                ->withoutVerifying()
                ->get(
                    "https://graph.microsoft.com/v1.0/users/{$this->mailbox}/mailFolders/inbox/messages",
                    [
                        '$filter' => "from/emailAddress/address eq '{$emailFrom}' and subject eq '{$subject}'",
                        '$top' => '1'
                    ]
                );

            if ($response->failed() || empty($response->json()['value'])) {
                return null;
            }

            return $response->json()['value'][0]['id'] ?? null;
        } catch (\Exception $e) {
            Log::error('Erro ao obter ID do e-mail: ' . $e->getMessage());
            return null;
        }
    }
}
