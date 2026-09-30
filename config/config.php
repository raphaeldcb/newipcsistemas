<?php
/**
 * Configuration - Novos Sistemas IPC
 * DO NOT COMMIT THIS FILE - Contains secrets
 */

return [
    // Database - HostGator Cloud
    'db' => [
        'host' => 'localhost',
        'port' => 3306,
        'username' => '***REMOVED***',
        'password' => '***REMOVED***',
        'database' => '***REMOVED***',
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

    // Microsoft Graph API - Configure with environment variables or .env file
    'microsoft' => [
        'client_id' => getenv('GRAPH_CLIENT_ID') ?: '***REMOVED***',
        'client_secret' => getenv('GRAPH_CLIENT_SECRET') ?: '***REMOVED***', // From Perito v6
        'tenant_id' => getenv('GRAPH_TENANT_ID') ?: '***REMOVED***',
        'mailbox' => getenv('GRAPH_MAILBOX') ?: 'financeiro@ipcms.com.br',
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
