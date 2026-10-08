@extends('layouts.app')

@section('title', 'Dashboard')
@section('page-title', 'Dashboard')

@section('content')
<h2 class="mb-4">Módulos</h2>

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px;">
    <!-- Processos -->
    <a href="{{ route('processos.index') }}" style="text-decoration: none; color: inherit;">
      <div class="card" style="cursor: pointer; transition: all 0.3s;">
        <div style="font-size: 40px; margin-bottom: 10px;">⚖️</div>
        <h5>Processos</h5>
        <p style="color: #7f8c8d; font-size: 14px;">Cadastros e histórico</p>
      </div>
    </a>

    <!-- Comunicações -->
    <a href="{{ route('comunicacoes.index') }}" style="text-decoration: none; color: inherit;">
      <div class="card" style="cursor: pointer; transition: all 0.3s;">
        <div style="font-size: 40px; margin-bottom: 10px;">📧</div>
        <h5>Comunicações</h5>
        <p style="color: #7f8c8d; font-size: 14px;">Emails e mensagens</p>
      </div>
    </a>

    <!-- Casos -->
    <a href="{{ route('casos.index') }}" style="text-decoration: none; color: inherit;">
      <div class="card" style="cursor: pointer; transition: all 0.3s;">
        <div style="font-size: 40px; margin-bottom: 10px;">📋</div>
        <h5>Casos</h5>
        <p style="color: #7f8c8d; font-size: 14px;">Tipos de casos</p>
      </div>
    </a>

    <!-- Pessoas -->
    <a href="{{ route('pessoas.index') }}" style="text-decoration: none; color: inherit;">
      <div class="card" style="cursor: pointer; transition: all 0.3s;">
        <div style="font-size: 40px; margin-bottom: 10px;">👥</div>
        <h5>Pessoas</h5>
        <p style="color: #7f8c8d; font-size: 14px;">Cadastro de pessoas</p>
      </div>
    </a>

    <!-- Kits -->
    <a href="{{ route('kits.index') }}" style="text-decoration: none; color: inherit;">
      <div class="card" style="cursor: pointer; transition: all 0.3s;">
        <div style="font-size: 40px; margin-bottom: 10px;">📦</div>
        <h5>Kits</h5>
        <p style="color: #7f8c8d; font-size: 14px;">Kits de coleta</p>
      </div>
    </a>

    <!-- Alelos -->
    <a href="{{ route('alelos.index') }}" style="text-decoration: none; color: inherit;">
      <div class="card" style="cursor: pointer; transition: all 0.3s;">
        <div style="font-size: 40px; margin-bottom: 10px;">🧬</div>
        <h5>Alelos</h5>
        <p style="color: #7f8c8d; font-size: 14px;">Dados genéticos</p>
      </div>
    </a>

    <!-- Créditos -->
    <a href="{{ route('creditos.index') }}" style="text-decoration: none; color: inherit;">
      <div class="card" style="cursor: pointer; transition: all 0.3s;">
        <div style="font-size: 40px; margin-bottom: 10px;">💰</div>
        <h5>Créditos</h5>
        <p style="color: #7f8c8d; font-size: 14px;">Créditos de faturamento</p>
      </div>
    </a>

    <!-- Extrações -->
    <a href="{{ route('extracos.index') }}" style="text-decoration: none; color: inherit;">
      <div class="card" style="cursor: pointer; transition: all 0.3s;">
        <div style="font-size: 40px; margin-bottom: 10px;">🧪</div>
        <h5>Extrações</h5>
        <p style="color: #7f8c8d; font-size: 14px;">Extrações de DNA</p>
      </div>
    </a>

    <!-- SCEI -->
    <a href="{{ route('sceis.index') }}" style="text-decoration: none; color: inherit;">
      <div class="card" style="cursor: pointer; transition: all 0.3s;">
        <div style="font-size: 40px; margin-bottom: 10px;">🏥</div>
        <h5>SCEI</h5>
        <p style="color: #7f8c8d; font-size: 14px;">Laboratório</p>
      </div>
    </a>

    <!-- Relatórios -->
    <a href="{{ route('relatorios.index') }}" style="text-decoration: none; color: inherit;">
      <div class="card" style="cursor: pointer; transition: all 0.3s;">
        <div style="font-size: 40px; margin-bottom: 10px;">📊</div>
        <h5>Relatórios</h5>
        <p style="color: #7f8c8d; font-size: 14px;">Análises e dados</p>
      </div>
    </a>
</div>
@endsection
