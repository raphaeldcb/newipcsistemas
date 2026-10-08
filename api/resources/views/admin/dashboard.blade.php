@extends('layouts.app')

@section('title', 'Admin Dashboard')
@section('page-title', 'Admin Dashboard')

@section('content')
<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; margin-bottom: 30px;">
    <!-- Card: Comunicações -->
    <div class="card">
        <div style="display: flex; justify-content: space-between; align-items: start;">
            <div>
                <p style="color: #7f8c8d; font-size: 14px; margin-bottom: 5px;">Comunicações</p>
                <p style="font-size: 32px; font-weight: 700; color: #3498db;">{{ $stats['comunicacoes'] }}</p>
                <p style="color: #95a5a6; font-size: 12px; margin-top: 10px;">Total</p>
            </div>
            <div style="font-size: 40px;">📧</div>
        </div>
    </div>

    <!-- Card: Casos -->
    <div class="card">
        <div style="display: flex; justify-content: space-between; align-items: start;">
            <div>
                <p style="color: #7f8c8d; font-size: 14px; margin-bottom: 5px;">Casos</p>
                <p style="font-size: 32px; font-weight: 700; color: #2ecc71;">{{ $stats['casos'] }}</p>
                <p style="color: #95a5a6; font-size: 12px; margin-top: 10px;">Registrados</p>
            </div>
            <div style="font-size: 40px;">📋</div>
        </div>
    </div>

    <!-- Card: Pessoas -->
    <div class="card">
        <div style="display: flex; justify-content: space-between; align-items: start;">
            <div>
                <p style="color: #7f8c8d; font-size: 14px; margin-bottom: 5px;">Pessoas</p>
                <p style="font-size: 32px; font-weight: 700; color: #9b59b6;">{{ $stats['pessoas'] }}</p>
                <p style="color: #95a5a6; font-size: 12px; margin-top: 10px;">Cadastradas</p>
            </div>
            <div style="font-size: 40px;">👥</div>
        </div>
    </div>

    <!-- Card: Kits -->
    <div class="card">
        <div style="display: flex; justify-content: space-between; align-items: start;">
            <div>
                <p style="color: #7f8c8d; font-size: 14px; margin-bottom: 5px;">Kits</p>
                <p style="font-size: 32px; font-weight: 700; color: #e67e22;">{{ $stats['kits'] }}</p>
                <p style="color: #95a5a6; font-size: 12px; margin-top: 10px;">Disponíveis</p>
            </div>
            <div style="font-size: 40px;">🔬</div>
        </div>
    </div>

    <!-- Card: Extrações -->
    <div class="card">
        <div style="display: flex; justify-content: space-between; align-items: start;">
            <div>
                <p style="color: #7f8c8d; font-size: 14px; margin-bottom: 5px;">Extrações</p>
                <p style="font-size: 32px; font-weight: 700; color: #16a085;">{{ $stats['extracos'] }}</p>
                <p style="color: #95a5a6; font-size: 12px; margin-top: 10px;">Processadas</p>
            </div>
            <div style="font-size: 40px;">🧬</div>
        </div>
    </div>

    <!-- Card: Usuários -->
    <div class="card">
        <div style="display: flex; justify-content: space-between; align-items: start;">
            <div>
                <p style="color: #7f8c8d; font-size: 14px; margin-bottom: 5px;">Usuários</p>
                <p style="font-size: 32px; font-weight: 700; color: #8e44ad;">{{ $stats['usuarios'] }}</p>
                <p style="color: #95a5a6; font-size: 12px; margin-top: 10px;">Cadastrados</p>
            </div>
            <div style="font-size: 40px;">👤</div>
        </div>
    </div>
</div>

<!-- Menu de Testes -->
<div class="card">
    <div class="card-header">
        ⚙️ Ações Admin
    </div>
    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px;">
        <a href="{{ route('admin.menu_testes') }}" class="btn btn-primary" style="text-align: center; padding: 15px;">
            🧪 Gerenciador de Testes
        </a>
        <a href="javascript:void(0)" class="btn btn-secondary" style="text-align: center; padding: 15px;">
            🔒 Gerenciar Usuários
        </a>
        <a href="javascript:void(0)" class="btn btn-secondary" style="text-align: center; padding: 15px;">
            📊 Relatórios
        </a>
        <a href="javascript:void(0)" class="btn btn-secondary" style="text-align: center; padding: 15px;">
            🔧 Configurações
        </a>
    </div>
</div>

<!-- Logs Recentes -->
<div class="card">
    <div class="card-header">
        📝 Logs Recentes
    </div>
    <p style="color: #95a5a6; font-size: 14px; text-align: center; padding: 30px 0;">
        Sistema de logs em desenvolvimento
    </p>
</div>
@endsection
