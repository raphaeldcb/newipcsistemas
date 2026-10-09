@extends('layouts.app')

@section('title', isset($comunicacao) ? ($comunicacao->subject ?? 'Comunicação') : 'Comunicação')
@section('page-title', 'Detalhe da Comunicação')

@section('content')
@if(!isset($comunicacao))
    <div class="alert alert-danger">
        <h4>❌ Erro: Comunicação não encontrada</h4>
        <p>A variável $comunicacao não foi passada pelo controller.</p>
        <a href="{{ route('comunicacoes.index') }}" class="btn btn-secondary">← Voltar para lista</a>
    </div>
@else
<div style="max-width: 1200px; margin: 0 auto;">
    <a href="{{ route('comunicacoes.index') }}" class="btn btn-secondary" style="margin-bottom: 20px;">← Voltar</a>

    <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 20px;">
        <!-- Email Body -->
        <div class="card">
            <div class="card-header">
                📧 Comunicação #{{ $comunicacao->id }}
            </div>
            <div style="margin-bottom: 15px; padding: 15px; border-bottom: 1px solid #eee;">
                <p style="margin: 8px 0;"><strong>Assunto:</strong> {{ $comunicacao->subject ?? '-' }}</p>
                <p style="margin: 8px 0;"><strong>De:</strong> {{ $comunicacao->email_from ?? '-' }}</p>
                <p style="margin: 8px 0;"><strong>Para:</strong> {{ $comunicacao->email_to ?? '-' }}</p>
                <p style="margin: 8px 0;"><strong>Data:</strong> {{ $comunicacao->created_at ? \Carbon\Carbon::parse($comunicacao->created_at)->format('d/m/Y H:i') : '-' }}</p>
            </div>
            <div style="background: #f9f9f9; padding: 15px; border-radius: 4px; border-left: 3px solid #3498db; min-height: 200px; font-size: 14px; line-height: 1.6;">
                {{ $comunicacao->body ?? 'Sem conteúdo' }}
            </div>
        </div>

        <!-- Sidebar: Informações & Ações -->
        <div>
            <!-- Classificação -->
            <div class="card">
                <div class="card-header" style="margin-bottom: 15px;">🤖 Classificação</div>
                <p style="margin-bottom: 10px;">
                    <strong>Categoria:</strong> <span class="badge badge-info">{{ $comunicacao->classification ?? 'Não classificado' }}</span>
                </p>
                @if($comunicacao->confidence)
                <p style="margin-bottom: 10px;">
                    <strong>Confiança:</strong> <span style="font-weight: 600; color: #f39c12;">{{ round($comunicacao->confidence * 100) }}%</span>
                </p>
                @endif
            </div>

            <!-- Resposta Sugerida -->
            @if($comunicacao->suggested_response)
            <div class="card">
                <div class="card-header" style="margin-bottom: 15px;">💡 Resposta Sugerida</div>
                <div style="background: #f0f8ff; padding: 12px; border-radius: 4px; font-size: 13px; line-height: 1.6; margin-bottom: 15px;">
                    {{ $comunicacao->suggested_response }}
                </div>
            </div>
            @endif

            <!-- Resposta Final -->
            @if($comunicacao->final_response)
            <div class="card">
                <div class="card-header" style="margin-bottom: 15px;">✅ Resposta Enviada</div>
                <div style="background: #d4edda; padding: 12px; border-radius: 4px; font-size: 13px; line-height: 1.6;">
                    {{ $comunicacao->final_response }}
                </div>
                @if($comunicacao->response_sent_at)
                <p style="margin-top: 10px; font-size: 12px; color: #666;">
                    Enviado em: {{ \Carbon\Carbon::parse($comunicacao->response_sent_at)->format('d/m/Y H:i') }}
                </p>
                @endif
            </div>
            @else
            <div class="card">
                <div class="card-header" style="margin-bottom: 15px;">💬 Responder</div>
                <form method="POST" action="#" style="display: none;">
                    @csrf
                    <textarea name="response" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; min-height: 100px; margin-bottom: 10px;" placeholder="Sua resposta..."></textarea>
                    <button type="submit" class="btn btn-primary" style="width: 100%;">Enviar Resposta</button>
                </form>
                <p style="color: #95a5a6; font-size: 13px;">Responda usando o campo de categorização acima.</p>
            </div>
            @endif
        </div>
    </div>
</div>
@endif
@endsection
