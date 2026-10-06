@extends('layouts.app')

@section('title', 'Dashboard')
@section('page-title', 'Dashboard')

@section('content')
<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; margin-bottom: 30px;">
    <!-- Card: Comunicações -->
    <div class="card">
        <div style="display: flex; justify-content: space-between; align-items: start;">
            <div>
                <p style="color: #7f8c8d; font-size: 14px; margin-bottom: 5px;">Comunicações</p>
                <p style="font-size: 32px; font-weight: 700; color: #3498db;">-</p>
                <p style="color: #95a5a6; font-size: 12px; margin-top: 10px;">Últimos 30 dias</p>
            </div>
            <div style="font-size: 40px;">📧</div>
        </div>
        <a href="{{ route('comunicacoes.index') }}" class="btn btn-primary" style="margin-top: 15px; width: 100%; text-align: center;">Ver</a>
    </div>

    <!-- Card: Casos -->
    <div class="card">
        <div style="display: flex; justify-content: space-between; align-items: start;">
            <div>
                <p style="color: #7f8c8d; font-size: 14px; margin-bottom: 5px;">Casos</p>
                <p style="font-size: 32px; font-weight: 700; color: #2ecc71;">-</p>
                <p style="color: #95a5a6; font-size: 12px; margin-top: 10px;">Em andamento</p>
            </div>
            <div style="font-size: 40px;">📋</div>
        </div>
        <a href="{{ route('casos.index') }}" class="btn btn-primary" style="margin-top: 15px; width: 100%; text-align: center;">Ver</a>
    </div>

    <!-- Card: Pessoas -->
    <div class="card">
        <div style="display: flex; justify-content: space-between; align-items: start;">
            <div>
                <p style="color: #7f8c8d; font-size: 14px; margin-bottom: 5px;">Pessoas</p>
                <p style="font-size: 32px; font-weight: 700; color: #9b59b6;">-</p>
                <p style="color: #95a5a6; font-size: 12px; margin-top: 10px;">Cadastradas</p>
            </div>
            <div style="font-size: 40px;">👥</div>
        </div>
        <a href="{{ route('pessoas.index') }}" class="btn btn-primary" style="margin-top: 15px; width: 100%; text-align: center;">Ver</a>
    </div>

    <!-- Card: Créditos -->
    <div class="card">
        <div style="display: flex; justify-content: space-between; align-items: start;">
            <div>
                <p style="color: #7f8c8d; font-size: 14px; margin-bottom: 5px;">Créditos</p>
                <p style="font-size: 32px; font-weight: 700; color: #e74c3c;">-</p>
                <p style="color: #95a5a6; font-size: 12px; margin-top: 10px;">Pendentes</p>
            </div>
            <div style="font-size: 40px;">💰</div>
        </div>
        <a href="javascript:void(0)" class="btn btn-primary" style="margin-top: 15px; width: 100%; text-align: center;">Ver</a>
    </div>
</div>

<!-- Últimas Comunicações -->
<div class="card">
    <div class="card-header">
        📧 Últimas Comunicações
        <a href="{{ route('comunicacoes.index') }}" style="float: right; font-size: 14px; text-decoration: none; color: #3498db;">Ver todas →</a>
    </div>
    <p style="color: #95a5a6; font-size: 14px; text-align: center; padding: 30px 0;">Nenhuma comunicação registrada</p>
</div>

<!-- Últimos Casos -->
<div class="card">
    <div class="card-header">
        📋 Últimos Casos
        <a href="{{ route('casos.index') }}" style="float: right; font-size: 14px; text-decoration: none; color: #3498db;">Ver todas →</a>
    </div>
    <p style="color: #95a5a6; font-size: 14px; text-align: center; padding: 30px 0;">Nenhum caso registrado</p>
</div>
@endsection
