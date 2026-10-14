@extends('layouts.app')

@section('title', isset($comunicacao) ? ($comunicacao->subject ?? 'E-mail') : 'E-mail')
@section('page-title', 'Detalhes do E-mail')

@section('content')
@if(!isset($comunicacao) || !$comunicacao)
    <div class="alert alert-danger">
        <h4>❌ E-mail não encontrado</h4>
        <a href="{{ route('comunicacoes.index') }}" class="btn btn-secondary">← Voltar</a>
    </div>
@else

<div style="max-width: 1400px; margin: 0 auto;">
    <a href="{{ route('comunicacoes.index') }}" class="btn btn-secondary" style="margin-bottom: 15px;">← Voltar para lista</a>

    <!-- Grid: Email Body + Sidebar -->
    <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 20px;">

        <!-- COLUNA 1: Email Body -->
        <div>
            <!-- Header -->
            <div style="background: #fff; padding: 20px; border: 1px solid #ddd; border-radius: 4px; margin-bottom: 20px;">
                <div style="display: flex; justify-content: space-between; align-items: start; margin-bottom: 15px;">
                    <div>
                        <h3 style="margin: 0 0 8px 0; word-wrap: break-word;">{{ $comunicacao->subject ?? '(sem assunto)' }}</h3>
                        <p style="margin: 0; font-size: 13px; color: #7f8c8d;">
                            <strong>De:</strong> {{ $comunicacao->email_from ?? '-' }}<br>
                            <strong>Para:</strong> {{ $comunicacao->email_to ?? '-' }}<br>
                            <strong>Data:</strong> {{ $comunicacao->created_at ? \Carbon\Carbon::parse($comunicacao->created_at)->format('d/m/Y H:i') : '-' }}
                        </p>
                    </div>
                    <div style="text-align: right;">
                        <span style="font-size: 24px;">📧</span>
                    </div>
                </div>
            </div>

            <!-- Email Body -->
            <div style="background: #f9f9f9; padding: 20px; border: 1px solid #ddd; border-radius: 4px; min-height: 300px; font-size: 14px; line-height: 1.8; word-wrap: break-word; white-space: pre-wrap;">{{ $comunicacao->body ?? '(sem conteúdo)' }}</div>
        </div>

        <!-- COLUNA 2: Sidebar Actions -->
        <div>
            <!-- Status: Revisado/Não Revisado -->
            <div style="background: #fff; padding: 15px; border: 1px solid #ddd; border-radius: 4px; margin-bottom: 15px;">
                <h5 style="margin-top: 0;">✅ Status</h5>
                <div style="display: flex; gap: 8px; flex-wrap: wrap;">
                    @if($comunicacao->status === 'revisado')
                        <span class="badge" style="background: #27ae60; color: white; padding: 8px 12px;">✓ Revisado</span>
                        <form method="POST" action="#" style="display: inline;">
                            @csrf
                            <button type="submit" class="btn btn-sm btn-outline-secondary">Marcar Não Revisado</button>
                        </form>
                    @else
                        <span class="badge" style="background: #e74c3c; color: white; padding: 8px 12px;">○ Não Revisado</span>
                        <form method="POST" action="#" style="display: inline;">
                            @csrf
                            <button type="submit" class="btn btn-sm btn-success">🚩 Sinalizar Revisado</button>
                        </form>
                    @endif
                </div>
            </div>

            <!-- Classificação: Judicial / Não Judicial -->
            <div style="background: #fff; padding: 15px; border: 1px solid #ddd; border-radius: 4px; margin-bottom: 15px;">
                <h5 style="margin-top: 0;">⚖️ Tipo</h5>
                <form method="POST" action="#" style="display: flex; gap: 8px;">
                    @csrf
                    <select name="tipo" style="flex: 1; padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
                        <option value="">-- Selecione --</option>
                        <option value="judicial" {{ $comunicacao->classification === 'Judicial' ? 'selected' : '' }}>⚖️ Judicial</option>
                        <option value="nao_judicial" {{ $comunicacao->classification === 'Não Judicial' ? 'selected' : '' }}>📋 Não Judicial</option>
                    </select>
                    <button type="submit" class="btn btn-primary" style="padding: 8px 12px;">Classificar</button>
                </form>
                @if($comunicacao->classification)
                    <p style="margin-top: 10px; font-size: 12px; color: #7f8c8d;">
                        Classificado como: <strong>{{ $comunicacao->classification }}</strong>
                    </p>
                @endif
            </div>

            <!-- Resposta Sugerida -->
            @if($comunicacao->suggested_response)
            <div style="background: #fffbea; padding: 15px; border: 1px solid #f9e79f; border-radius: 4px; margin-bottom: 15px;">
                <h5 style="margin-top: 0;">💡 Resposta Sugerida</h5>
                <p style="margin: 10px 0; font-size: 13px; line-height: 1.6;">{{ $comunicacao->suggested_response }}</p>
            </div>
            @endif

            <!-- Resposta Enviada -->
            @if($comunicacao->final_response)
            <div style="background: #d4edda; padding: 15px; border: 1px solid #c3e6cb; border-radius: 4px; margin-bottom: 15px;">
                <h5 style="margin-top: 0;">✅ Resposta Enviada</h5>
                <p style="margin: 10px 0; font-size: 13px; line-height: 1.6;">{{ $comunicacao->final_response }}</p>
                @if($comunicacao->response_sent_at)
                <p style="margin: 5px 0; font-size: 11px; color: #155724;">
                    Enviado em: {{ \Carbon\Carbon::parse($comunicacao->response_sent_at)->format('d/m/Y H:i') }}
                </p>
                @endif
            </div>
            @endif

            <!-- Ações -->
            <div style="background: #fff; padding: 15px; border: 1px solid #ddd; border-radius: 4px;">
                <h5 style="margin-top: 0;">⚡ Ações</h5>
                <div style="display: flex; flex-direction: column; gap: 8px;">
                    <a href="{{ route('comunicacoes.index') }}" class="btn btn-outline-secondary" style="text-align: center;">← Voltar para Lista</a>
                    <button class="btn btn-primary" style="width: 100%;">💬 Responder</button>
                </div>
            </div>
        </div>
    </div>
</div>

@endif
@endsection
