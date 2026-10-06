@extends('layouts.app')

@section('title', 'Comunicação')
@section('page-title', 'Detalhe da Comunicação')

@section('content')
<div style="display: grid; grid-template-columns: 2fr 1fr; gap: 20px;">
    <!-- Email Body -->
    <div class="card">
        <div class="card-header">
            📧 Comunicação
        </div>
        <div style="margin-bottom: 15px;">
            <p><strong>Assunto:</strong> [Assunto do email]</p>
            <p><strong>De:</strong> [remetente@email.com]</p>
            <p><strong>Para:</strong> [destinatário@email.com]</p>
            <p><strong>Data:</strong> [data e hora]</p>
        </div>
        <div style="background: #f9f9f9; padding: 15px; border-radius: 4px; border-left: 3px solid #3498db; min-height: 200px;">
            <p>[Corpo do email será exibido aqui]</p>
        </div>
    </div>

    <!-- Sidebar: Informações & Ações -->
    <div>
        <!-- Classificação -->
        <div class="card">
            <div class="card-header" style="margin-bottom: 15px;">🤖 Classificação</div>
            <p style="margin-bottom: 10px;">
                <strong>Status:</strong> <span class="badge badge-warning">UNKNOWN</span>
            </p>
            <p style="margin-bottom: 10px;">
                <strong>Confiança:</strong> <span style="font-weight: 600; color: #f39c12;">0%</span>
            </p>
            <button class="btn btn-primary" style="width: 100%; margin-top: 10px;">🔄 Classificar</button>
        </div>

        <!-- Caso -->
        <div class="card">
            <div class="card-header" style="margin-bottom: 15px;">📋 Caso</div>
            <p style="margin-bottom: 15px;">
                <select style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px;">
                    <option>-- Selecione um caso --</option>
                </select>
            </p>
        </div>

        <!-- Respostas -->
        <div class="card">
            <div class="card-header" style="margin-bottom: 15px;">💬 Respostas</div>
            <button class="btn btn-primary" style="width: 100%;">+ Responder</button>
        </div>

        <!-- Anexos -->
        <div class="card">
            <div class="card-header" style="margin-bottom: 15px;">📎 Anexos</div>
            <p style="color: #95a5a6; font-size: 14px;">Nenhum anexo</p>
        </div>
    </div>
</div>
@endsection
