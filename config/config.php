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

    // Microsoft Graph API - Configured from Perito V6
    'microsoft' => [
        'client_id' => '***REMOVED***',
        'client_secret' => '***REMOVED***',
        'tenant_id' => '***REMOVED***',
        'mailbox' => 'financeiro@ipcmsc.com.br',
        'redirect_uri' => 'http://localhost:8000/auth/callback',
    ],

    // Python Service & Extraction
    'python' => [
        'path' => '/usr/bin/python3',
        'script_dir' => dirname(__DIR__) . '/python',
        'log_file' => dirname(__DIR__) . '/logs/python_service.log',
        'ollama_url' => 'http://localhost:11434',
        'ollama_model' => 'qwen:7b',
    ],
];
