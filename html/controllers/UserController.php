<?php
/**
 * User Management Controller
 */

class UserController
{
    private $pdo;

    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }

    /**
     * List all users
     */
    public function listUsers()
    {
        $stmt = $this->pdo->query('SELECT id, email, role, created_at FROM users ORDER BY email');
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    /**
     * Get single user
     */
    public function getUser($id)
    {
        $stmt = $this->pdo->prepare('SELECT * FROM users WHERE id = ?');
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    /**
     * Create new user
     */
    public function createUser($email, $password, $role = 'user')
    {
        try {
            $password_hash = password_hash($password, PASSWORD_BCRYPT);
            $stmt = $this->pdo->prepare('
                INSERT INTO users (email, password_hash, name, role, created_at)
                VALUES (?, ?, ?, ?, NOW())
            ');
            $stmt->execute([$email, $password_hash, '', $role]);
            return ['success' => true, 'message' => 'Usuário criado com sucesso'];
        } catch (Exception $e) {
            return ['success' => false, 'error' => $e->getMessage()];
        }
    }

    /**
     * Update user
     */
    public function updateUser($id, $email, $role = 'user')
    {
        try {
            $stmt = $this->pdo->prepare('
                UPDATE users
                SET email = ?, role = ?
                WHERE id = ?
            ');
            $stmt->execute([$email, $role, $id]);
            return ['success' => true, 'message' => 'Usuário atualizado com sucesso'];
        } catch (Exception $e) {
            return ['success' => false, 'error' => $e->getMessage()];
        }
    }

    /**
     * Update password
     */
    public function updatePassword($id, $password)
    {
        try {
            $password_hash = password_hash($password, PASSWORD_BCRYPT);
            $stmt = $this->pdo->prepare('
                UPDATE users
                SET password_hash = ?
                WHERE id = ?
            ');
            $stmt->execute([$password_hash, $id]);
            return ['success' => true, 'message' => 'Senha atualizada com sucesso'];
        } catch (Exception $e) {
            return ['success' => false, 'error' => $e->getMessage()];
        }
    }

    /**
     * Delete user
     */
    public function deleteUser($id)
    {
        try {
            // Prevent deleting the last admin
            $admins = $this->pdo->query('SELECT COUNT(*) as count FROM users WHERE is_admin = 1')->fetch();
            if ($admins['count'] <= 1) {
                $user = $this->getUser($id);
                if ($user['is_admin']) {
                    return ['success' => false, 'error' => 'Não é possível deletar o último admin'];
                }
            }

            $stmt = $this->pdo->prepare('DELETE FROM users WHERE id = ?');
            $stmt->execute([$id]);
            return ['success' => true, 'message' => 'Usuário deletado com sucesso'];
        } catch (Exception $e) {
            return ['success' => false, 'error' => $e->getMessage()];
        }
    }
}
