<?php
/**
 * Microsoft Graph Service
 * Handles OAuth and API calls to Microsoft Graph
 */

class MicrosoftGraphService
{
    private $client_id;
    private $client_secret;
    private $tenant_id;
    private $mailbox;
    private $redirect_uri;
    private $pdo;

    private const AUTH_URL = 'https://login.microsoftonline.com/{tenant}/oauth2/v2.0/authorize';
    private const TOKEN_URL = 'https://login.microsoftonline.com/{tenant}/oauth2/v2.0/token';
    private const GRAPH_URL = 'https://graph.microsoft.com/v1.0';

    private const SCOPES = [
        'https://graph.microsoft.com/.default'
    ];

    public function __construct($config, $pdo)
    {
        $this->client_id = $config['microsoft']['client_id'] ?? null;
        $this->client_secret = $config['microsoft']['client_secret'] ?? null;
        $this->tenant_id = $config['microsoft']['tenant_id'] ?? null;
        $this->mailbox = $config['microsoft']['mailbox'] ?? null;
        $this->redirect_uri = $config['microsoft']['redirect_uri'] ?? null;
        $this->pdo = $pdo;

        if (!$this->client_id || !$this->client_secret || !$this->tenant_id) {
            throw new Exception('Microsoft Graph credentials not configured');
        }
    }

    /**
     * Get authorization URL for OAuth flow
     */
    public function getAuthorizationUrl()
    {
        $params = [
            'client_id' => $this->client_id,
            'response_type' => 'code',
            'scope' => implode(' ', self::SCOPES),
            'redirect_uri' => $this->redirect_uri,
            'response_mode' => 'query',
        ];

        $auth_url = str_replace('{tenant}', $this->tenant_id, self::AUTH_URL);
        return $auth_url . '?' . http_build_query($params);
    }

    /**
     * Exchange authorization code for access token
     */
    public function getAccessToken($code)
    {
        $token_url = str_replace('{tenant}', $this->tenant_id, self::TOKEN_URL);

        $params = [
            'client_id' => $this->client_id,
            'client_secret' => $this->client_secret,
            'code' => $code,
            'redirect_uri' => $this->redirect_uri,
            'grant_type' => 'authorization_code',
            'scope' => implode(' ', self::SCOPES),
        ];

        $ch = curl_init($token_url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($params));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);

        $response = curl_exec($ch);
        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        if ($http_code !== 200) {
            throw new Exception('Failed to get access token: ' . $response);
        }

        return json_decode($response, true);
    }

    /**
     * Get access token using Client Credentials flow (auto-connect without user interaction)
     */
    public function getClientCredentialsToken()
    {
        $token_url = str_replace('{tenant}', $this->tenant_id, self::TOKEN_URL);

        $params = [
            'client_id' => $this->client_id,
            'client_secret' => $this->client_secret,
            'grant_type' => 'client_credentials',
            'scope' => 'https://graph.microsoft.com/.default',
        ];

        $ch = curl_init($token_url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($params));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);

        $response = curl_exec($ch);
        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        if ($http_code !== 200) {
            throw new Exception('Failed to get client credentials token: ' . $response);
        }

        return json_decode($response, true);
    }

    /**
     * Get new access token using refresh token
     */
    public function refreshAccessToken($refresh_token)
    {
        $token_url = str_replace('{tenant}', $this->tenant_id, self::TOKEN_URL);

        $params = [
            'client_id' => $this->client_id,
            'client_secret' => $this->client_secret,
            'refresh_token' => $refresh_token,
            'grant_type' => 'refresh_token',
            'scope' => implode(' ', self::SCOPES),
        ];

        $ch = curl_init($token_url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($params));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);

        $response = curl_exec($ch);
        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        if ($http_code !== 200) {
            throw new Exception('Failed to refresh access token');
        }

        return json_decode($response, true);
    }

    /**
     * Sync messages from mailbox
     */
    public function syncMessages($access_token, $delta_token = null)
    {
        $endpoint = self::GRAPH_URL . '/me/mailFolders/inbox/messages/delta';

        $params = [
            '$select' => 'id,subject,from,toRecipients,ccRecipients,receivedDateTime,bodyPreview,hasAttachments,attachments',
            '$top' => 100,
        ];

        if ($delta_token) {
            $params['$deltatoken'] = $delta_token;
        }

        $url = $endpoint . '?' . http_build_query($params);

        $response = $this->makeGraphRequest($url, 'GET', $access_token);

        return $response;
    }

    /**
     * Get message attachments
     */
    public function getMessageAttachments($access_token, $message_id)
    {
        $endpoint = self::GRAPH_URL . '/me/messages/' . urlencode($message_id) . '/attachments';

        $response = $this->makeGraphRequest($endpoint, 'GET', $access_token);

        return $response['value'] ?? [];
    }

    /**
     * Download attachment content
     */
    public function downloadAttachment($access_token, $message_id, $attachment_id)
    {
        $endpoint = self::GRAPH_URL . '/me/messages/' . urlencode($message_id) . '/attachments/' . urlencode($attachment_id) . '/$value';

        return $this->makeGraphRequest($endpoint, 'GET', $access_token, true);
    }

    /**
     * Make API request to Microsoft Graph
     */
    private function makeGraphRequest($url, $method = 'GET', $access_token, $binary = false)
    {
        $ch = curl_init($url);

        $headers = [
            'Authorization: Bearer ' . $access_token,
            'Content-Type: application/json',
        ];

        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $method);

        if ($method === 'POST' || $method === 'PATCH') {
            curl_setopt($ch, CURLOPT_POST, 1);
        }

        $response = curl_exec($ch);
        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        if ($http_code >= 400) {
            throw new Exception("Graph API error (HTTP $http_code): " . $response);
        }

        if ($binary) {
            return $response;
        }

        return json_decode($response, true);
    }
}
