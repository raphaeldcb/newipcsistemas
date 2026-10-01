<?php
// Verificar se é admin
if (!isset($_SESSION['user_id']) || !($_SESSION['is_admin'] ?? false)) {
    header('Location: /newipcsistemas/index.php?page=login');
    exit;
}

require_once __DIR__ . '/../controllers/UserController.php';
global $pdo;
$userController = new UserController($pdo);
$users = $userController->listUsers();
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administração de Usuários - Novos Sistemas IPC</title>
    <link rel="icon" type="image/svg+xml" href="/newipcsistemas/html/favicon.svg">
    <style>
        :root {
            --color-primary: #132F4A;
            --color-primary-light: #1A4A6F;
            --bg-primary: #FFFFFF;
            --bg-secondary: #F9FAFB;
            --text-primary: #1F2937;
            --text-secondary: #6B7280;
            --border-color: #E5E7EB;
            --color-success: #10B981;
            --color-danger: #EF4444;
            --spacing-lg: 1.5rem;
            --spacing-md: 1rem;
            --radius-md: 8px;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background-color: var(--bg-secondary);
            color: var(--text-primary);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: var(--spacing-lg);
        }

        .header {
            background: linear-gradient(135deg, var(--color-primary) 0%, var(--color-primary-light) 100%);
            color: white;
            padding: var(--spacing-lg);
            border-radius: var(--radius-md);
            margin-bottom: var(--spacing-lg);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 { font-size: 24px; }

        .btn {
            padding: 10px 16px;
            border: none;
            border-radius: var(--radius-md);
            cursor: pointer;
            font-weight: 600;
            background: var(--color-primary);
            color: white;
            text-decoration: none;
            display: inline-block;
            transition: all 0.2s;
        }

        .btn:hover { transform: translateY(-2px); box-shadow: 0 4px 12px rgba(0,0,0,0.15); }

        .btn-danger { background: var(--color-danger); }

        .btn-success { background: var(--color-success); }

        .table-container {
            background: white;
            border-radius: var(--radius-md);
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: var(--bg-secondary);
            padding: 16px;
            text-align: left;
            font-weight: 600;
            border-bottom: 1px solid var(--border-color);
        }

        td {
            padding: 16px;
            border-bottom: 1px solid var(--border-color);
        }

        tr:last-child td { border-bottom: none; }

        .badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
        }

        .badge-admin { background: #DBEAFE; color: #1E40AF; }

        .badge-user { background: #ECFDF5; color: #065F46; }

        .actions {
            display: flex;
            gap: 8px;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            z-index: 1000;
            align-items: center;
            justify-content: center;
        }

        .modal.active { display: flex; }

        .modal-content {
            background: white;
            border-radius: var(--radius-md);
            padding: var(--spacing-lg);
            max-width: 500px;
            width: 90%;
            box-shadow: 0 20px 25px rgba(0,0,0,0.15);
        }

        .form-group {
            margin-bottom: var(--spacing-md);
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: var(--text-primary);
        }

        input, select {
            width: 100%;
            padding: 10px;
            border: 1px solid var(--border-color);
            border-radius: var(--radius-md);
            font-size: 14px;
        }

        input:focus, select:focus {
            outline: none;
            border-color: var(--color-primary);
            box-shadow: 0 0 0 3px rgba(19, 47, 74, 0.1);
        }

        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        input[type="checkbox"] { width: auto; }

        .modal-footer {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
            margin-top: var(--spacing-lg);
        }

        .back-link {
            color: var(--color-primary);
            text-decoration: none;
            font-weight: 600;
        }

        .back-link:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div>
                <h1>👥 Administração de Usuários</h1>
                <p style="opacity: 0.9; margin-top: 5px;">Manage system users and permissions</p>
            </div>
            <button class="btn btn-success" onclick="openCreateModal()">➕ Novo Usuário</button>
        </div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Email</th>
                        <th>Tipo</th>
                        <th>Data de Criação</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($users as $user): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($user['email']); ?></td>
                        <td>
                            <?php if ($user['is_admin']): ?>
                                <span class="badge badge-admin">👨‍💼 Admin</span>
                            <?php else: ?>
                                <span class="badge badge-user">👤 Usuário</span>
                            <?php endif; ?>
                        </td>
                        <td><?php echo date('d/m/Y H:i', strtotime($user['created_at'])); ?></td>
                        <td>
                            <div class="actions">
                                <button class="btn" onclick="openEditModal(<?php echo $user['id']; ?>, '<?php echo htmlspecialchars($user['email']); ?>', <?php echo $user['is_admin'] ? 'true' : 'false'; ?>)">✏️ Editar</button>
                                <button class="btn btn-danger" onclick="deleteUser(<?php echo $user['id']; ?>)">🗑️ Deletar</button>
                            </div>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>

        <div style="margin-top: var(--spacing-lg);">
            <a href="/newipcsistemas/index.php?page=comunicacoes" class="back-link">← Voltar</a>
        </div>
    </div>

    <!-- Modal para criar/editar -->
    <div id="userModal" class="modal">
        <div class="modal-content">
            <h2 id="modalTitle">Novo Usuário</h2>
            <form id="userForm" onsubmit="saveUser(event)">
                <input type="hidden" id="userId">

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" required>
                </div>

                <div class="form-group">
                    <label for="password">Senha</label>
                    <input type="password" id="password" required>
                    <small style="color: var(--text-secondary);">Deixe em branco para não alterar (apenas edição)</small>
                </div>

                <div class="form-group checkbox-group">
                    <input type="checkbox" id="isAdmin">
                    <label for="isAdmin" style="margin-bottom: 0;">É Administrador?</label>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn" onclick="closeModal()" style="background: var(--border-color); color: var(--text-primary);">Cancelar</button>
                    <button type="submit" class="btn btn-success">Salvar</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        function openCreateModal() {
            document.getElementById('modalTitle').textContent = 'Novo Usuário';
            document.getElementById('userForm').reset();
            document.getElementById('userId').value = '';
            document.getElementById('password').required = true;
            document.getElementById('userModal').classList.add('active');
        }

        function openEditModal(id, email, isAdmin) {
            document.getElementById('modalTitle').textContent = 'Editar Usuário';
            document.getElementById('userId').value = id;
            document.getElementById('email').value = email;
            document.getElementById('password').value = '';
            document.getElementById('password').required = false;
            document.getElementById('isAdmin').checked = isAdmin;
            document.getElementById('userModal').classList.add('active');
        }

        function closeModal() {
            document.getElementById('userModal').classList.remove('active');
        }

        function saveUser(e) {
            e.preventDefault();
            const id = document.getElementById('userId').value;
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            const isAdmin = document.getElementById('isAdmin').checked;

            const action = id ? 'update_user' : 'create_user';
            const params = new URLSearchParams();
            params.append('email', email);
            params.append('is_admin', isAdmin ? 1 : 0);
            if (password) params.append('password', password);
            if (id) params.append('id', id);

            fetch('/newipcsistemas/api.php?action=' + action, {
                method: 'POST',
                credentials: 'include',
                body: params
            })
                .then(r => r.json())
                .then(data => {
                    if (data.success) {
                        alert('✅ ' + data.message);
                        location.reload();
                    } else {
                        alert('❌ Erro: ' + (data.error || 'Desconhecido'));
                    }
                })
                .catch(err => alert('❌ Erro: ' + err));
        }

        function deleteUser(id) {
            if (!confirm('Tem certeza que deseja deletar este usuário?')) return;

            fetch('/newipcsistemas/api.php?action=delete_user', {
                method: 'POST',
                credentials: 'include',
                body: new URLSearchParams({ id })
            })
                .then(r => r.json())
                .then(data => {
                    if (data.success) {
                        alert('✅ ' + data.message);
                        location.reload();
                    } else {
                        alert('❌ Erro: ' + (data.error || 'Desconhecido'));
                    }
                })
                .catch(err => alert('❌ Erro: ' + err));
        }

        // Fechar modal ao clicar fora
        document.getElementById('userModal').addEventListener('click', function(e) {
            if (e.target === this) closeModal();
        });
    </script>
</body>
</html>
