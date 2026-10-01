<?php
/**
 * Auto-authenticate with Microsoft if not already authenticated
 * Call this after user login
 */

session_start();

// If user is logged in but not authenticated with Microsoft
if (isset($_SESSION['user_id']) && !isset($_SESSION['microsoft_access_token'])) {
    // Redirect to Microsoft authentication
    header('Location: /newipcsistemas/index.php?page=auth/microsoft');
    exit;
}

// If already authenticated, redirect to communications
if (isset($_SESSION['microsoft_access_token'])) {
    header('Location: /newipcsistemas/index.php?page=comunicacoes');
    exit;
}

// If not logged in at all, redirect to login
header('Location: /newipcsistemas/index.php?page=login');
exit;
