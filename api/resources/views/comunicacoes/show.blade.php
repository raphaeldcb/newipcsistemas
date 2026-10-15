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

<div style="max-width: 1200px; margin: 0 auto; padding: 20px;">
    <a href="{{ route('comunicacoes.index') }}" class="btn btn-secondary" style="margin-bottom: 15px;">← Voltar para lista</a>

    <!-- Header com Assunto -->
    <div style="background: #fff; padding: 20px; border: 1px solid #ddd; border-radius: 4px; margin-bottom: 20px;">
        <h2 style="margin: 0 0 15px 0; word-wrap: break-word;">{{ $comunicacao->subject ?? '(sem assunto)' }}</h2>
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px; font-size: 13px; color: #7f8c8d;">
            <div><strong>De:</strong> {{ substr($comunicacao->email_from ?? '-', 0, 50) }}</div>
            <div><strong>Para:</strong> {{ substr($comunicacao->email_to ?? '-', 0, 50) }}</div>
            <div><strong>Data:</strong> {{ $comunicacao->created_at ? \Carbon\Carbon::parse($comunicacao->created_at)->format('d/m/Y H:i') : '-' }}</div>
            <div><strong>Status:</strong> <span class="badge" style="background: {{ $comunicacao->status === 'revisado' ? '#27ae60' : '#e74c3c' }}; color: white;">{{ ucfirst($comunicacao->status ?? 'pendente') }}</span></div>
        </div>
    </div>

    <!-- Email Body -->
    <div style="background: #f9f9f9; padding: 20px; border: 1px solid #ddd; border-radius: 4px; margin-bottom: 20px; min-height: 300px; font-size: 14px; line-height: 1.8; white-space: pre-wrap; word-wrap: break-word;">{{ $comunicacao->body ?? '(sem conteúdo)' }}</div>

    <!-- Sidebar Actions -->
    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">

        <!-- Status: Revisado -->
        <div style="background: #fff; padding: 15px; border: 1px solid #ddd; border-radius: 4px;">
            <h5 style="margin-top: 0;">✅ Status</h5>
            @if($comunicacao->status === 'revisado')
                <span class="badge" style="background: #27ae60; color: white; padding: 8px 12px; display: inline-block;">✓ Revisado</span>
            @else
                <form method="POST" action="{{ route('comunicacoes.mark-reviewed', $comunicacao->id) }}" style="display: inline;">
                    @csrf
                    <button type="submit" class="btn btn-sm btn-success">🚩 Sinalizar Revisado</button>
                </form>
            @endif
        </div>

        <!-- Classificação: Judicial / Não Judicial -->
        <div style="background: #fff; padding: 15px; border: 1px solid #ddd; border-radius: 4px;">
            <h5 style="margin-top: 0;">⚖️ Tipo</h5>
            @if($comunicacao->classification && in_array($comunicacao->classification, ['Judicial', 'Não Judicial']))
                <span class="badge" style="background: {{ $comunicacao->classification === 'Judicial' ? '#e74c3c' : '#27ae60' }}; color: white; padding: 8px 12px; display: inline-block;">
                    {{ $comunicacao->classification }}
                </span>
                <form method="POST" action="{{ route('comunicacoes.update-classification', $comunicacao->id) }}" style="display: inline; margin-left: 10px;">
                    @csrf
                    <select name="tipo" style="padding: 6px; border: 1px solid #ddd; border-radius: 4px;">
                        <option value="judicial" {{ $comunicacao->classification === 'Judicial' ? 'selected' : '' }}>⚖️ Judicial</option>
                        <option value="nao_judicial" {{ $comunicacao->classification === 'Não Judicial' ? 'selected' : '' }}>📋 Não Judicial</option>
                    </select>
                    <button type="submit" class="btn btn-sm btn-primary">Mudar</button>
                </form>
            @else
                <form method="POST" action="{{ route('comunicacoes.update-classification', $comunicacao->id) }}" style="display: flex; gap: 8px;">
                    @csrf
                    <select name="tipo" style="flex: 1; padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
                        <option value="">-- Selecione --</option>
                        <option value="judicial">⚖️ Judicial</option>
                        <option value="nao_judicial">📋 Não Judicial</option>
                    </select>
                    <button type="submit" class="btn btn-primary" style="padding: 8px 12px;">Classificar</button>
                </form>
            @endif
        </div>

        <!-- Resposta Sugerida -->
        @if($comunicacao->suggested_response)
        <div style="background: #fffbea; padding: 15px; border: 1px solid #f9e79f; border-radius: 4px;">
            <h5 style="margin-top: 0;">💡 Resposta Sugerida</h5>
            <p style="margin: 10px 0; font-size: 13px; line-height: 1.6; white-space: pre-wrap;">{{ $comunicacao->suggested_response }}</p>
        </div>
        @endif

        <!-- Resposta Enviada -->
        @if($comunicacao->final_response)
        <div style="background: #d4edda; padding: 15px; border: 1px solid #c3e6cb; border-radius: 4px;">
            <h5 style="margin-top: 0;">✅ Resposta Enviada</h5>
            <p style="margin: 10px 0; font-size: 13px; line-height: 1.6; white-space: pre-wrap;">{{ $comunicacao->final_response }}</p>
            @if($comunicacao->response_sent_at)
            <p style="margin: 5px 0; font-size: 11px; color: #155724;">
                Enviado em: {{ \Carbon\Carbon::parse($comunicacao->response_sent_at)->format('d/m/Y H:i') }}
            </p>
            @endif
        </div>
        @endif

        <!-- Dados do Processo -->
        @if($comunicacao->numero_processo)
        <div style="background: #e3f2fd; padding: 15px; border: 1px solid #90caf9; border-radius: 4px;">
            <h5 style="margin-top: 0;">📋 Processo</h5>
            <p style="margin: 5px 0; font-size: 13px;">
                <strong>Número:</strong> {{ $comunicacao->numero_processo }}<br>
                @if($comunicacao->estado)
                <strong>Estado:</strong> {{ $comunicacao->estado }}<br>
                @endif
                @if($comunicacao->comarca)
                <strong>Comarca:</strong> {{ $comunicacao->comarca }}<br>
                @endif
                @if($comunicacao->vara)
                <strong>Vara:</strong> {{ $comunicacao->vara }}
                @endif
            </p>
        </div>
        @endif
    </div>
</div>

@endif
@endsection
