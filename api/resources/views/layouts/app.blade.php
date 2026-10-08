<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title') — Novos Sistemas IPC</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            background: #f5f5f5;
            color: #333;
        }
        .container-main {
            display: flex;
            min-height: 100vh;
        }
        .sidebar {
            width: 260px;
            background: #2c3e50;
            color: white;
            padding: 20px 0;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
            position: fixed;
            height: 100vh;
            overflow-y: auto;
        }
        .sidebar-header {
            padding: 20px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            margin-bottom: 20px;
            text-align: center;
        }
        .sidebar-header h1 {
            font-size: 18px;
            font-weight: 600;
        }
        .sidebar-menu {
            list-style: none;
        }
        .sidebar-menu li {
            margin: 5px 0;
        }
        .sidebar-menu a {
            display: block;
            padding: 12px 20px;
            color: rgba(255,255,255,0.8);
            text-decoration: none;
            transition: all 0.2s;
            border-left: 3px solid transparent;
        }
        .sidebar-menu a:hover,
        .sidebar-menu a.active {
            background: rgba(255,255,255,0.1);
            color: white;
            border-left-color: #3498db;
        }
        .main-content {
            margin-left: 260px;
            flex: 1;
            display: flex;
            flex-direction: column;
        }
        .navbar {
            background: white;
            border-bottom: 1px solid #ddd;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        .navbar-user {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .navbar-user-menu {
            position: relative;
        }
        .navbar-user-menu a {
            color: #333;
            text-decoration: none;
        }
        .content {
            padding: 30px;
            flex: 1;
        }
        .card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            padding: 20px;
            margin-bottom: 20px;
        }
        .card-header {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 20px;
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
        }
        .btn {
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
            display: inline-block;
            transition: all 0.2s;
        }
        .btn-primary {
            background: #3498db;
            color: white;
        }
        .btn-primary:hover {
            background: #2980b9;
        }
        .btn-danger {
            background: #e74c3c;
            color: white;
        }
        .btn-danger:hover {
            background: #c0392b;
        }
        .btn-secondary {
            background: #95a5a6;
            color: white;
        }
        .btn-secondary:hover {
            background: #7f8c8d;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        .table th,
        .table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        .table th {
            background: #f9f9f9;
            font-weight: 600;
        }
        .table tr:hover {
            background: #f9f9f9;
        }
        .badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 600;
        }
        .badge-success {
            background: #d4edda;
            color: #155724;
        }
        .badge-warning {
            background: #fff3cd;
            color: #856404;
        }
        .badge-danger {
            background: #f8d7da;
            color: #721c24;
        }
        .badge-info {
            background: #d1ecf1;
            color: #0c5460;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }
        .form-group input,
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            font-family: inherit;
        }
        .form-group textarea {
            resize: vertical;
            min-height: 100px;
        }
        .alert {
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 4px;
            border-left: 4px solid;
        }
        .alert-success {
            background: #d4edda;
            color: #155724;
            border-color: #28a745;
        }
        .alert-danger {
            background: #f8d7da;
            color: #721c24;
            border-color: #dc3545;
        }
        .alert-warning {
            background: #fff3cd;
            color: #856404;
            border-color: #ffc107;
        }
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: static;
            }
            .main-content {
                margin-left: 0;
            }
            .content {
                padding: 15px;
            }
        }
    </style>
    @stack('styles')
</head>
<body>
    <div class="container-main">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="sidebar-header">
                <h1>IPC</h1>
                <p style="font-size: 12px; margin-top: 5px;">Sistemas</p>
            </div>
            <ul class="sidebar-menu">
                <li><a href="{{ route('dashboard') }}" class="@if(Route::currentRouteName() === 'dashboard') active @endif">📊 Dashboard</a></li>
                <li><a href="{{ route('comunicacoes.index') }}" class="@if(str_contains(Route::currentRouteName(), 'comunicacoes')) active @endif">📧 Comunicações</a></li>
                <li><a href="{{ route('casos.index') }}" class="@if(str_contains(Route::currentRouteName(), 'casos')) active @endif">📋 Casos</a></li>
                <li><a href="{{ route('pessoas.index') }}" class="@if(str_contains(Route::currentRouteName(), 'pessoas')) active @endif">👥 Pessoas</a></li>
                <li><a href="javascript:void(0)" class="@if(str_contains(Route::currentRouteName(), 'kits')) active @endif">🔬 Kits</a></li>
                <li><a href="javascript:void(0)" class="@if(str_contains(Route::currentRouteName(), 'extracos')) active @endif">🧬 Extrações</a></li>
                <li><a href="javascript:void(0)" class="@if(str_contains(Route::currentRouteName(), 'sceis')) active @endif">🏥 SCEI</a></li>
                <li><a href="javascript:void(0)" class="@if(str_contains(Route::currentRouteName(), 'creditos')) active @endif">💰 Créditos</a></li>
                <li><a href="javascript:void(0)" class="@if(str_contains(Route::currentRouteName(), 'alelos')) active @endif">🔍 Alelos</a></li>
                <li><a href="{{ route('relatorios.index') }}" class="@if(str_contains(Route::currentRouteName(), 'relatorios')) active @endif">📄 Relatórios</a></li>
                @if(auth()->user() && auth()->user()->role === 'admin')
                <li style="margin-top: 20px; padding-top: 20px; border-top: 1px solid rgba(255,255,255,0.1);">
                    <a href="{{ route('admin.index') }}" class="@if(str_contains(Route::currentRouteName(), 'admin')) active @endif">⚙️ Admin</a>
                </li>
                @endif
            </ul>
        </aside>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Navbar -->
            <nav class="navbar">
                <div>
                    <h2 style="font-size: 20px;">@yield('page-title', 'Dashboard')</h2>
                </div>
                <div class="navbar-user">
                    <span>{{ auth()->user()->name ?? 'Usuário' }}</span>
                    <form action="{{ route('logout') }}" method="POST" style="margin: 0;">
                        @csrf
                        <button type="submit" class="btn btn-secondary" style="padding: 8px 12px;">Logout</button>
                    </form>
                </div>
            </nav>

            <!-- Content -->
            <div class="content">
                @if($errors->any())
                    <div class="alert alert-danger">
                        <strong>Erros:</strong>
                        <ul style="margin-top: 10px;">
                            @foreach($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                @if(session('success'))
                    <div class="alert alert-success">{{ session('success') }}</div>
                @endif

                @yield('content')
            </div>
        </div>
    </div>

    @stack('scripts')
</body>
</html>
