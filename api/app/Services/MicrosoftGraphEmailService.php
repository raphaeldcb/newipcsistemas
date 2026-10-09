<?php

namespace App\Services;

use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Http;

class MicrosoftGraphEmailService {
    private $clientId;
    private $clientSecret;
    private $tenantId;
    private $mailbox;
    private $redirectUri;
    private $accessToken;

    public function __construct() {
        $this->clientId = env('GRAPH_CLIENT_ID');
        $this->clientSecret = env('GRAPH_CLIENT_SECRET');
        $this->tenantId = env('GRAPH_TENANT_ID');
        $this->mailbox = env('GRAPH_MAILBOX');
        $this->redirectUri = env('GRAPH_REDIRECT_URI');
    }

    public function getAccessToken() {
        try {
            $response = Http::withoutVerifying()
                ->asForm()
                ->post("https://login.microsoftonline.com/{$this->tenantId}/oauth2/v2.0/token", [
                    'client_id' => $this->clientId,
                    'client_secret' => $this->clientSecret,
                    'scope' => 'https://graph.microsoft.com/.default',
                    'grant_type' => 'client_credentials',
                ]);

            if ($response->failed()) {
                Log::error('Falha ao obter token: HTTP ' . $response->status() . ' - ' . $response->body());
                return null;
            }

            return $response->json('access_token');
        } catch (\Exception $e) {
            Log::error('Erro ao obter token: ' . $e->getMessage());
            return null;
        }
    }

    public function getUnreadEmails($limit = 10) {
        $token = $this->getAccessToken();
        if (!$token) {
            Log::warning('Não foi possível obter token do Microsoft Graph');
            return [];
        }

        try {
            $response = Http::withToken($token)
                ->get("https://graph.microsoft.com/v1.0/users/{$this->mailbox}/mailFolders/inbox/messages", [
                    '$filter' => 'isRead eq false',
                    '$top' => $limit,
                    '$orderby' => 'receivedDateTime desc',
                ]);

            if ($response->failed()) {
                Log::error('Falha ao buscar e-mails: ' . $response->body());
                return [];
            }

            $messages = [];
            foreach ($response->json('value', []) as $email) {
                $messages[] = [
                    'id' => $email['id'],
                    'from' => $email['from']['emailAddress']['address'] ?? '',
                    'to' => $email['toRecipients'][0]['emailAddress']['address'] ?? '',
                    'subject' => $email['subject'] ?? '',
                    'body' => $email['bodyPreview'] ?? '',
                    'received_at' => $email['receivedDateTime'] ?? '',
                ];
            }

            return $messages;
        } catch (\Exception $e) {
            Log::error('Erro ao buscar e-mails: ' . $e->getMessage());
            return [];
        }
    }

    public function markAsRead($emailId) {
        $token = $this->getAccessToken();
        if (!$token) return false;

        try {
            $response = Http::withToken($token)
                ->patch("https://graph.microsoft.com/v1.0/users/{$this->mailbox}/messages/{$emailId}", [
                    'isRead' => true,
                ]);

            return !$response->failed();
        } catch (\Exception $e) {
            Log::error('Erro ao marcar como lido: ' . $e->getMessage());
            return false;
        }
    }

    public function sendReply($toEmail, $subject, $body) {
        $token = $this->getAccessToken();
        if (!$token) return false;

        try {
            $response = Http::withToken($token)
                ->post("https://graph.microsoft.com/v1.0/users/{$this->mailbox}/sendMail", [
                    'message' => [
                        'subject' => "Re: " . $subject,
                        'body' => [
                            'contentType' => 'text',
                            'content' => $body,
                        ],
                        'toRecipients' => [
                            [
                                'emailAddress' => [
                                    'address' => $toEmail,
                                ],
                            ],
                        ],
                    ],
                    'saveToSentItems' => true,
                ]);

            return !$response->failed();
        } catch (\Exception $e) {
            Log::error('Erro ao enviar resposta: ' . $e->getMessage());
            return false;
        }
    }

    public function moveToFolder($emailId, $folderName) {
        $token = $this->getAccessToken();
        if (!$token) return false;

        try {
            // Buscar ID da pasta
            $foldersResponse = Http::withToken($token)
                ->get("https://graph.microsoft.com/v1.0/users/{$this->mailbox}/mailFolders", [
                    '$filter' => "displayName eq '{$folderName}'",
                ]);

            $folders = $foldersResponse->json('value', []);
            if (empty($folders)) {
                // Criar pasta se não existir
                $createResponse = Http::withToken($token)
                    ->post("https://graph.microsoft.com/v1.0/users/{$this->mailbox}/mailFolders", [
                        'displayName' => $folderName,
                    ]);

                if ($createResponse->failed()) return false;
                $folderId = $createResponse->json('id');
            } else {
                $folderId = $folders[0]['id'];
            }

            // Mover e-mail
            $response = Http::withToken($token)
                ->post("https://graph.microsoft.com/v1.0/users/{$this->mailbox}/messages/{$emailId}/move", [
                    'destinationId' => $folderId,
                ]);

            return !$response->failed();
        } catch (\Exception $e) {
            Log::error('Erro ao mover e-mail: ' . $e->getMessage());
            return false;
        }
    }
}
