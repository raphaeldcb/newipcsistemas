<?php
/**
 * OAuth Controller
 * Handles Microsoft OAuth flow
 */

require_once __DIR__ . '/../services/MicrosoftGraphService.php';

class OAuthController
{
    private $pdo;
    private $config;
    private $graph;

    public function __construct($pdo, $config)
    {
        $this->pdo = $pdo;
        $this->config = $config;

        try {
            $this->graph = new MicrosoftGraphService($config, $pdo);
        } catch (Exception $e) {
            throw new Exception('Microsoft Graph not configured: ' . $e->getMessage());
        }
    }

    /**
     * Get authorization URL (redirect user to Microsoft login)
     */
    public function getAuthorizationUrl()
    {
        return $this->graph->getAuthorizationUrl();
    }

    /**
     * Handle OAuth callback from Microsoft
     * Exchange authorization code for access token
     */
    public function handleCallback()
    {
        // Check for errors from Microsoft
        if (!empty($_GET['error'])) {
            return [
                'success' => false,
                'error' => $_GET['error_description'] ?? $_GET['error'],
            ];
        }

        // Check for authorization code
        $code = $_GET['code'] ?? null;
        if (!$code) {
            return [
                'success' => false,
                'error' => 'No authorization code received',
            ];
        }

        try {
            // Exchange code for access token
            $token_response = $this->graph->getAccessToken($code);

            if (!isset($token_response['access_token'])) {
                throw new Exception('No access token in response');
            }

            // Store tokens in session
            $_SESSION['microsoft_access_token'] = $token_response['access_token'];
            $_SESSION['microsoft_token_type'] = $token_response['token_type'] ?? 'Bearer';
            $_SESSION['microsoft_expires_in'] = $token_response['expires_in'] ?? 3600;
            $_SESSION['microsoft_token_expires_at'] = time() + ($token_response['expires_in'] ?? 3600);

            // Store refresh token if provided (for offline access)
            if (!empty($token_response['refresh_token'])) {
                $_SESSION['microsoft_refresh_token'] = $token_response['refresh_token'];
            }

            // Mark as Microsoft authenticated
            $_SESSION['microsoft_authenticated'] = true;
            $_SESSION['microsoft_auth_time'] = time();

            // Log the authentication
            if (isset($_SESSION['user_id'])) {
                $this->logAuthentication($_SESSION['user_id'], 'oauth_success');
            }

            return [
                'success' => true,
                'message' => 'Successfully authenticated with Microsoft',
                'redirect' => '/comunicacoes',
            ];

        } catch (Exception $e) {
            error_log('OAuth callback error: ' . $e->getMessage());

            if (isset($_SESSION['user_id'])) {
                $this->logAuthentication($_SESSION['user_id'], 'oauth_failed', $e->getMessage());
            }

            return [
                'success' => false,
                'error' => 'Failed to authenticate: ' . $e->getMessage(),
            ];
        }
    }

    /**
     * Check if Microsoft token is valid
     */
    public function isTokenValid()
    {
        if (!isset($_SESSION['microsoft_token_expires_at'])) {
            return false;
        }

        return time() < $_SESSION['microsoft_token_expires_at'];
    }

    /**
     * Get valid access token (refresh if necessary)
     */
    public function getValidAccessToken()
    {
        // If token is still valid, return it
        if ($this->isTokenValid()) {
            return $_SESSION['microsoft_access_token'];
        }

        // Try to refresh token
        if (!empty($_SESSION['microsoft_refresh_token'])) {
            try {
                $token_response = $this->graph->refreshAccessToken($_SESSION['microsoft_refresh_token']);

                if (!isset($token_response['access_token'])) {
                    throw new Exception('No access token in refresh response');
                }

                // Update session with new tokens
                $_SESSION['microsoft_access_token'] = $token_response['access_token'];
                $_SESSION['microsoft_expires_in'] = $token_response['expires_in'] ?? 3600;
                $_SESSION['microsoft_token_expires_at'] = time() + ($token_response['expires_in'] ?? 3600);

                // Update refresh token if provided
                if (!empty($token_response['refresh_token'])) {
                    $_SESSION['microsoft_refresh_token'] = $token_response['refresh_token'];
                }

                return $_SESSION['microsoft_access_token'];

            } catch (Exception $e) {
                error_log('Token refresh failed: ' . $e->getMessage());
                // If refresh fails, token is invalid
                return null;
            }
        }

        return null;
    }

    /**
     * Disconnect Microsoft account
     */
    public function disconnect()
    {
        unset($_SESSION['microsoft_access_token']);
        unset($_SESSION['microsoft_refresh_token']);
        unset($_SESSION['microsoft_token_type']);
        unset($_SESSION['microsoft_expires_in']);
        unset($_SESSION['microsoft_token_expires_at']);
        unset($_SESSION['microsoft_authenticated']);
        unset($_SESSION['microsoft_auth_time']);

        if (isset($_SESSION['user_id'])) {
            $this->logAuthentication($_SESSION['user_id'], 'microsoft_disconnected');
        }

        return ['success' => true, 'message' => 'Disconnected from Microsoft'];
    }

    /**
     * Get Microsoft account info
     */
    public function getAccountInfo()
    {
        if (!$this->isTokenValid()) {
            return null;
        }

        return [
            'authenticated' => $_SESSION['microsoft_authenticated'] ?? false,
            'mailbox' => $this->config['microsoft']['mailbox'] ?? null,
            'auth_time' => $_SESSION['microsoft_auth_time'] ?? null,
            'token_expires_at' => $_SESSION['microsoft_token_expires_at'] ?? null,
            'time_until_expiry' => ($_SESSION['microsoft_token_expires_at'] ?? 0) - time(),
        ];
    }

    /**
     * Log authentication event
     */
    private function logAuthentication($user_id, $action, $details = null)
    {
        try {
            $this->pdo->prepare(
                'INSERT INTO processing_log (action, details, user_id, ip_address, created_at)
                 VALUES (?, ?, ?, ?, NOW())'
            )->execute([
                $action,
                $details ? json_encode(['details' => $details]) : null,
                $user_id,
                $_SERVER['REMOTE_ADDR'] ?? null,
            ]);
        } catch (Exception $e) {
            error_log('Failed to log authentication: ' . $e->getMessage());
        }
    }
}
