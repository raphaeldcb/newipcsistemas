<?php
/**
 * Load environment variables from .env or .env.local
 * Call this before requiring config.php
 */

$env_files = [
    dirname(__DIR__) . '/.env.local',
    dirname(__DIR__) . '/.env',
];

foreach ($env_files as $file) {
    if (file_exists($file)) {
        $lines = file($file, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        foreach ($lines as $line) {
            // Skip comments
            if (strpos($line, '#') === 0) {
                continue;
            }

            // Parse KEY=VALUE
            if (strpos($line, '=') !== false) {
                list($key, $value) = explode('=', $line, 2);
                $key = trim($key);
                $value = trim($value);

                // Remove quotes if present
                if ((strpos($value, '"') === 0 && strrpos($value, '"') === strlen($value) - 1) ||
                    (strpos($value, "'") === 0 && strrpos($value, "'") === strlen($value) - 1)) {
                    $value = substr($value, 1, -1);
                }

                // Set environment variable
                putenv("$key=$value");
                $_ENV[$key] = $value;
            }
        }
        break; // Use first file found
    }
}
