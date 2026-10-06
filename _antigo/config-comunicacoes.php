<?php
/**
 * Configuration - Novos Sistemas IPC
 * DO NOT COMMIT THIS FILE - Contains secrets
 */

return [
    // Database - Load from environment
    'db' => [
        'host' => getenv('DB_HOST') ?: 'localhost',
        'port' => getenv('DB_PORT') ?: 3306,
        'username' => getenv('DB_USERNAME') ?: 'root',
        'password' => getenv('DB_PASSWORD') ?: '',
        'database' => getenv('DB_DATABASE') ?: 'novos_sistemas_ipc',
        'charset' => 'utf8mb4',
    ],

    // Application
    'app' => [
        'name' => 'Novos Sistemas IPC',
        'version' => '1.0.0',
        'environment' => 'development',
        'debug' => true,
    ],

    // Session
    'session' => [
        'name' => 'NOVOS_SISTEMAS_SESSION',
        'lifetime' => 3600,
        'secure' => false,
    ],

    // Microsoft Graph API - Load from environment variables (.env or .env.local)
    'microsoft' => [
        'client_id' => getenv('GRAPH_CLIENT_ID') ?: '',
        'client_secret' => getenv('GRAPH_CLIENT_SECRET') ?: '',
        'tenant_id' => getenv('GRAPH_TENANT_ID') ?: '',
        'mailbox' => getenv('GRAPH_MAILBOX') ?: '',
        'redirect_uri' => getenv('GRAPH_REDIRECT_URI') ?: 'http://localhost:8000/index.php?page=auth/callback',
    ],

    // Python Service & Extraction
    'python' => [
        'path' => 'C:\\Python313\\python.exe',
        'script_dir' => dirname(__DIR__) . '/python',
        'log_file' => dirname(__DIR__) . '/logs/python_service.log',
        'ollama_url' => 'http://localhost:11434',
        'ollama_model' => 'qwen:7b',
    ],
];
