<?php
/**
 * Authentication Controller
 */

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    $error = '';

    if (empty($email) || empty($password)) {
        $error = 'Email e senha são obrigatórios';
    } else {
        $stmt = $pdo->prepare('SELECT id, email, password_hash, name FROM users WHERE email = ? AND active = TRUE');
        $stmt->execute([$email]);
        $user = $stmt->fetch();

        if ($user && password_verify($password, $user['password_hash'])) {
            // Login successful
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['user_email'] = $user['email'];
            $_SESSION['user_name'] = $user['name'];

            // Update last login
            $pdo->prepare('UPDATE users SET last_login = NOW() WHERE id = ?')
                ->execute([$user['id']]);

            header("Location: {$base}?page=comunicacoes");
            exit;
        } else {
            $error = 'Email ou senha incorretos';
        }
    }
}

// Show login form
require __DIR__ . '/../views/login.php';
