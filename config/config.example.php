<?php
/**
 * Configuration Template
 * Copy to config.php and fill in your values
 */

return [
    // Database
    'db' => [
        'host' => 'localhost',
        'port' => 3306,
        'username' => 'root',
        'password' => '',
        'database' => 'novos_sistemas_ipc',
        'charset' => 'utf8mb4',
    ],

    // Application
    'app' => [
        'name' => 'Novos Sistemas IPC',
        'version' => '1.0.0',
        'environment' => 'development', // development, staging, production
        'debug' => true,
    ],

    // Session
    'session' => [
        'name' => 'NOVOS_SISTEMAS_SESSION',
        'lifetime' => 3600, // 1 hour
        'secure' => false, // set true in production with HTTPS
    ],

    // Microsoft Graph API
    'microsoft' => [
        'client_id' => 'YOUR_CLIENT_ID_HERE',
        'client_secret' => 'YOUR_CLIENT_SECRET_HERE',
        'tenant_id' => 'YOUR_TENANT_ID_HERE',
        'mailbox' => 'admin@ipcms.com.br',
        'redirect_uri' => 'http://localhost/auth/callback',
    ],

    // Python Service & Extraction
    'python' => [
        'path' => '/usr/bin/python3',
        'script_dir' => dirname(__DIR__) . '/python',
        'log_file' => dirname(__DIR__) . '/logs/python_service.log',

        // Ollama Configuration (for email extraction via Qwen)
        'ollama_url' => 'http://localhost:11434',
        'ollama_model' => 'qwen:7b',
    ],
];
