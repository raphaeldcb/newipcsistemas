<?php
/**
 * Microsoft Token Refresh Service
 * Automatically refreshes Microsoft Graph access tokens before expiration
 */

class MicrosoftTokenService {
    private $pdo;
    private $config;

    public function __construct($pdo, $config) {
        $this->pdo = $pdo;
        $this->config = $config;
    }

    /**
     * Get valid access token, refresh if needed
     */
    public function getValidAccessToken() {
        // Get user's current token from session/database
        $userId = $_SESSION['user_id'] ?? null;
        if (!$userId) return null;

        $stmt = $this->pdo->prepare(
            "SELECT access_token, refresh_token, token_expires_at FROM users WHERE id = ?"
        );
        $stmt->execute([$userId]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$user) return null;

        // Check if token expired (or expires in next 5 minutes)
        $expiresAt = strtotime($user['token_expires_at']);
        $now = time();
        $buffer = 5 * 60; // 5 minutes buffer

        if ($now + $buffer > $expiresAt && $user['refresh_token']) {
            // Token expired or about to expire - refresh it
            $this->refreshAccessToken($userId, $user['refresh_token']);
            
            // Get the new token
            $stmt = $this->pdo->prepare(
                "SELECT access_token FROM users WHERE id = ?"
            );
            $stmt->execute([$userId]);
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            return $result['access_token'] ?? null;
        }

        return $user['access_token'];
    }

    /**
     * Refresh access token using refresh token
     */
    private function refreshAccessToken($userId, $refreshToken) {
        $clientId = $this->config['microsoft']['client_id'];
        $clientSecret = $this->config['microsoft']['client_secret'];
        $tokenEndpoint = 'https://login.microsoftonline.com/common/oauth2/v2.0/token';

        $data = [
            'client_id' => $clientId,
            'client_secret' => $clientSecret,
            'refresh_token' => $refreshToken,
            'grant_type' => 'refresh_token',
            'scope' => 'mail.read mail.send offline_access'
        ];

        $ch = curl_init($tokenEndpoint);
        curl_setopt_array($ch, [
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_POST => true,
            CURLOPT_POSTFIELDS => http_build_query($data),
            CURLOPT_HTTPHEADER => ['Content-Type: application/x-www-form-urlencoded']
        ]);

        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        if ($httpCode === 200) {
            $tokenData = json_decode($response, true);
            
            // Update token in database
            $expiresIn = $tokenData['expires_in'] ?? 3600;
            $newExpiresAt = date('Y-m-d H:i:s', time() + $expiresIn);
            
            $stmt = $this->pdo->prepare(
                "UPDATE users SET access_token = ?, refresh_token = ?, token_expires_at = ? WHERE id = ?"
            );
            $stmt->execute([
                $tokenData['access_token'],
                $tokenData['refresh_token'] ?? $refreshToken,
                $newExpiresAt,
                $userId
            ]);
            
            return true;
        }

        return false;
    }
}
