<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login — Novos Sistemas IPC</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .login-container {
            background: white;
            border-radius: 8px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            width: 100%;
            max-width: 400px;
            padding: 40px;
        }
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .login-header h1 {
            font-size: 28px;
            color: #2c3e50;
            margin-bottom: 5px;
        }
        .login-header p {
            color: #7f8c8d;
            font-size: 14px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2c3e50;
        }
        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            transition: all 0.3s;
        }
        .form-group input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102,126,234,0.1);
        }
        .btn-login {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
        }
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102,126,234,0.4);
        }
        .btn-microsoft {
            width: 100%;
            padding: 12px;
            background: #0078d4;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: block;
            text-align: center;
            transition: all 0.3s;
            margin-top: 15px;
        }
        .btn-microsoft:hover {
            background: #005a9e;
        }
        .login-divider {
            text-align: center;
            margin: 20px 0;
            color: #bbb;
            font-size: 14px;
        }
        .login-divider:before {
            content: '';
            display: inline-block;
            width: 30%;
            height: 1px;
            background: #ddd;
            margin-right: 10px;
            vertical-align: middle;
        }
        .login-divider:after {
            content: '';
            display: inline-block;
            width: 30%;
            height: 1px;
            background: #ddd;
            margin-left: 10px;
            vertical-align: middle;
        }
        .alert {
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 4px;
            background: #f8d7da;
            color: #721c24;
            border-left: 4px solid #dc3545;
        }
        @media (max-width: 480px) {
            .login-container {
                padding: 25px;
            }
            .login-header h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <h1>🏛️ IPC</h1>
            <p>Sistemas de Gestão Integrado</p>
        </div>

        @if($errors->any())
            <div class="alert">
                {{ $errors->first() }}
            </div>
        @endif

        <form id="loginForm">
            @csrf
            <div class="form-group">
                <label for="hos_usua">Usuário</label>
                <input type="text" id="hos_usua" name="hos_usua" autocomplete="username" required autofocus>
            </div>
            <div class="form-group">
                <label for="hos_senha">Senha</label>
                <input type="password" id="hos_senha" name="hos_senha" autocomplete="current-password" required>
            </div>
            <button type="submit" class="btn-login">Entrar</button>
        </form>

        <script>
            document.getElementById('loginForm').addEventListener('submit', async (e) => {
                e.preventDefault();
                console.log('Form submitted');

                const formData = new FormData(document.getElementById('loginForm'));
                console.log('FormData ready');

                try {
                    console.log('Enviando POST para:', '{{ route("login") }}');
                    const response = await fetch('{{ route("login") }}', {
                        method: 'POST',
                        body: formData
                    });

                    console.log('Response status:', response.status);
                    const data = await response.json();
                    console.log('Response data:', data);

                    if (data.status === 'ok') {
                        console.log('Login ok, redirecionando');
                        window.location.href = data.redirect;
                    } else {
                        alert(data.message);
                    }
                } catch (error) {
                    console.error('Erro:', error);
                    alert('Erro ao fazer login: ' + error.message);
                }
            });
        </script>

        <div class="login-divider">ou</div>

        <a href="{{ route('auth.microsoft') }}" class="btn-microsoft">
            🔐 Entrar com Microsoft
        </a>
    </div>
</body>
</html>
