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
        'client_id' => getenv('GRAPH_CLIENT_ID') ?: '',
        'client_secret' => getenv('GRAPH_CLIENT_SECRET') ?: '', // DO NOT COMMIT SECRETS
        'tenant_id' => getenv('GRAPH_TENANT_ID') ?: '',
        'mailbox' => getenv('GRAPH_MAILBOX') ?: 'financeiro@ipcms.com.br',
        'redirect_uri' => getenv('GRAPH_REDIRECT_URI') ?: 'http://localhost:8000/index.php?page=auth/callback',
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
