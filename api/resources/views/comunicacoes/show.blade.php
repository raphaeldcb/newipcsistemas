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
        <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 15px; font-size: 13px; color: #7f8c8d;">
            <div><strong>De:</strong> {{ substr($comunicacao->email_from ?? '-', 0, 40) }}</div>
            <div><strong>Para:</strong> {{ substr($comunicacao->email_to ?? '-', 0, 40) }}</div>
            <div><strong>Data:</strong> {{ $comunicacao->created_at ? \Carbon\Carbon::parse($comunicacao->created_at)->format('d/m/Y H:i') : '-' }}</div>
        </div>
    </div>

    <!-- Email Body -->
    <div style="background: #f9f9f9; padding: 20px; border: 1px solid #ddd; border-radius: 4px; margin-bottom: 20px; min-height: 300px; font-size: 14px; line-height: 1.8; white-space: pre-wrap; word-wrap: break-word;">{{ $comunicacao->body ?? '(sem conteúdo)' }}</div>

    <!-- ========== BOTÕES PRINCIPAIS ========== -->
    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 30px;">

        <!-- BOTÃO 1: Marcar como Tratado (Local Only) -->
        <div style="background: linear-gradient(135deg, #e3f2fd 0%, #bbdefb 100%); padding: 20px; border: 2px solid #2196F3; border-radius: 4px;">
            <h4 style="margin: 0 0 10px 0; color: #1565c0;">✅ MARCAR COMO TRATADO</h4>
            <p style="margin: 0 0 15px 0; font-size: 12px; color: #555;">Apenas no sistema (sem ação na Microsoft)</p>

            @if($comunicacao->status === 'tratado')
                <div style="background: #4caf50; color: white; padding: 12px; border-radius: 4px; text-align: center; font-weight: bold;">
                    ✓ Já marcado como TRATADO
                </div>
            @else
                <form method="POST" action="{{ route('comunicacoes.mark-treated', $comunicacao->id) }}">
                    @csrf
                    <button type="submit" style="width: 100%; padding: 12px; background: #2196F3; color: white; border: none; border-radius: 4px; font-weight: bold; cursor: pointer; font-size: 14px;">
                        ✅ Marcar TRATADO
                    </button>
                </form>
            @endif
        </div>

        <!-- BOTÃO 2: Sinalizar na Microsoft -->
        <div style="background: linear-gradient(135deg, #fff3e0 0%, #ffe0b2 100%); padding: 20px; border: 2px solid #ff9800; border-radius: 4px;">
            <h4 style="margin: 0 0 10px 0; color: #e65100;">📧 SINALIZAR NA MICROSOFT</h4>
            <p style="margin: 0 0 15px 0; font-size: 12px; color: #555;">Marca "ANALISADO" + agenda resposta amanhã 10:00</p>

            <form method="POST" action="{{ route('comunicacoes.mark-reviewed', $comunicacao->id) }}">
                @csrf
                <button type="submit" style="width: 100%; padding: 12px; background: #ff9800; color: white; border: none; border-radius: 4px; font-weight: bold; cursor: pointer; font-size: 14px;">
                    🚩 SINALIZAR & AGENDAR
                </button>
            </form>
        </div>
    </div>

    <!-- ========== DADOS E RESPOSTAS ========== -->
    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">

        <!-- Classificação -->
        <div style="background: #fff; padding: 15px; border: 1px solid #ddd; border-radius: 4px;">
            <h5 style="margin-top: 0;">⚖️ Tipo de E-mail</h5>
            @if($comunicacao->classification && in_array($comunicacao->classification, ['Judicial', 'Não Judicial']))
                <span style="background: {{ $comunicacao->classification === 'Judicial' ? '#e74c3c' : '#27ae60' }}; color: white; padding: 6px 12px; display: inline-block; border-radius: 3px; margin-bottom: 10px;">{{ $comunicacao->classification }}</span>
                <form method="POST" action="{{ route('comunicacoes.update-classification', $comunicacao->id) }}" style="display: flex; gap: 8px; margin-top: 10px;">
                    @csrf
                    <select name="tipo" style="flex: 1; padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
                        <option value="judicial" {{ $comunicacao->classification === 'Judicial' ? 'selected' : '' }}>⚖️ Judicial</option>
                        <option value="nao_judicial" {{ $comunicacao->classification === 'Não Judicial' ? 'selected' : '' }}>📋 Não Judicial</option>
                    </select>
                    <button type="submit" class="btn btn-sm btn-primary">Alterar</button>
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

        <!-- Processo CNJ (se houver) -->
        @if($comunicacao->numero_processo)
        <div style="background: #e3f2fd; padding: 15px; border: 1px solid #90caf9; border-radius: 4px;">
            <h5 style="margin-top: 0;">📋 Processo CNJ</h5>
            <p style="margin: 5px 0; font-size: 13px; line-height: 1.8;">
                <strong>Número:</strong> {{ $comunicacao->numero_processo }}<br>
                @if($comunicacao->estado)<strong>Estado:</strong> {{ $comunicacao->estado }}<br>@endif
                @if($comunicacao->comarca)<strong>Comarca:</strong> {{ $comunicacao->comarca }}<br>@endif
                @if($comunicacao->vara)<strong>Vara:</strong> {{ $comunicacao->vara }}@endif
            </p>
        </div>
        @endif

        <!-- Resposta Sugerida -->
        @if($comunicacao->suggested_response)
        <div style="background: #fffbea; padding: 15px; border: 1px solid #f9e79f; border-radius: 4px;">
            <h5 style="margin-top: 0;">💡 Resposta Sugerida</h5>
            <div style="background: white; padding: 10px; border-radius: 3px; max-height: 150px; overflow-y: auto; font-size: 13px; line-height: 1.6; white-space: pre-wrap;">{{ $comunicacao->suggested_response }}</div>
        </div>
        @endif

        <!-- Resposta Enviada -->
        @if($comunicacao->final_response)
        <div style="background: #d4edda; padding: 15px; border: 1px solid #c3e6cb; border-radius: 4px;">
            <h5 style="margin-top: 0;">✅ Resposta Enviada</h5>
            <div style="background: white; padding: 10px; border-radius: 3px; max-height: 150px; overflow-y: auto; font-size: 13px; line-height: 1.6; white-space: pre-wrap;">{{ $comunicacao->final_response }}</div>
            @if($comunicacao->response_sent_at)
            <p style="margin: 10px 0 0 0; font-size: 11px; color: #155724;">Enviado: {{ \Carbon\Carbon::parse($comunicacao->response_sent_at)->format('d/m/Y H:i') }}</p>
            @endif
        </div>
        @endif
    </div>
</div>

@endif
@endsection
