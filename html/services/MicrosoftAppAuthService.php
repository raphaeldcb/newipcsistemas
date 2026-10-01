<?php
/**
 * Microsoft Graph App-Only Authentication
 * Uses app credentials (client_id + client_secret) instead of user login
 * No user interaction needed - automatic token acquisition
 */

class MicrosoftAppAuthService {
    private $config;

    public function __construct($config) {
        $this->config = $config;
    }

    /**
     * Get access token using app credentials (no user login needed)
     */
    public function getAccessToken() {
        $clientId = $this->config['microsoft']['client_id'];
        $clientSecret = $this->config['microsoft']['client_secret'];
        $tenantId = $this->config['microsoft']['tenant_id'];

        if (!$clientId || !$clientSecret || !$tenantId) {
            return null;
        }

        $tokenEndpoint = "https://login.microsoftonline.com/{$tenantId}/oauth2/v2.0/token";

        $data = [
            'client_id' => $clientId,
            'client_secret' => $clientSecret,
            'scope' => 'https://graph.microsoft.com/.default',
            'grant_type' => 'client_credentials'
        ];

        $ch = curl_init($tokenEndpoint);
        curl_setopt_array($ch, [
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_POST => true,
            CURLOPT_POSTFIELDS => http_build_query($data),
            CURLOPT_HTTPHEADER => ['Content-Type: application/x-www-form-urlencoded'],
            CURLOPT_TIMEOUT => 10,
            CURLOPT_SSL_VERIFYPEER => false,
            CURLOPT_SSL_VERIFYHOST => false
        ]);

        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $curlError = curl_error($ch);
        curl_close($ch);

        // Debug info
        error_log("App-Only Auth: HTTP $httpCode, Error: $curlError");
        error_log("Response: " . substr($response, 0, 200));

        if ($httpCode === 200) {
            $tokenData = json_decode($response, true);
            if (isset($tokenData['access_token'])) {
                $_SESSION['microsoft_access_token'] = $tokenData['access_token'];
                $_SESSION['microsoft_token_expires_at'] = time() + ($tokenData['expires_in'] ?? 3600);
                return $tokenData['access_token'];
            } else {
                error_log("No access_token in response: " . json_encode($tokenData));
            }
        } else {
            error_log("Auth failed with HTTP $httpCode: " . $response);
        }

        return null;
    }

    /**
     * Get valid token (cached or new)
     */
    public function getValidToken() {
        // Check if we have a cached token that hasn't expired
        if (!empty($_SESSION['microsoft_access_token']) && 
            (!empty($_SESSION['microsoft_token_expires_at']) && time() < $_SESSION['microsoft_token_expires_at'])) {
            return $_SESSION['microsoft_access_token'];
        }

        // Get a new token
        return $this->getAccessToken();
    }
}
