@extends('layouts.app')

@section('title', 'Comunicações')
@section('page-title', 'Comunicações')

@section('content')
<div class="card">
    <div class="card-header">
        📧 Lista de Comunicações
        <a href="{{ route('comunicacoes.sync') }}" class="btn btn-success" style="float: right; margin-left: 10px;">🔄 Sincronizar</a>
        <a href="javascript:void(0)" class="btn btn-primary" style="float: right;">+ Nova</a>
    </div>

    <div style="margin-bottom: 20px; padding: 15px;">
        <form method="GET" action="{{ route('comunicacoes.index') }}" style="display: flex; gap: 10px;">
            <input type="text" name="busca" placeholder="Buscar por assunto, remetente..." value="{{ $busca ?? '' }}" style="flex: 1; padding: 10px; border: 1px solid #ddd; border-radius: 4px;">
            <button type="submit" class="btn btn-primary">Buscar</button>
            @if($busca)
                <a href="{{ route('comunicacoes.index') }}" class="btn btn-secondary">Limpar</a>
            @endif
        </form>
    </div>

    <div style="padding: 15px;">
        @forelse($comunicacoes as $c)
            <div style="display: grid; grid-template-columns: 1fr 150px 100px 100px 80px; gap: 15px; align-items: center; padding: 12px; border-bottom: 1px solid #eee;">
                <!-- Assunto + Remetente -->
                <div>
                    <div style="font-weight: 600; color: #2c3e50;">{{ substr($c->subject ?? '-', 0, 60) }}</div>
                    <div style="font-size: 12px; color: #7f8c8d; margin-top: 4px;">
                        @php
                            $email = $c->email_from ?? '-';
                            // Limpar caracteres feios
                            $email = strpos($email, '|') ? explode('|', $email)[0] : $email;
                            $email = strpos($email, '?') ? explode('?', $email)[0] : $email;
                        @endphp
                        {{ substr(trim($email), 0, 40) }}
                    </div>
                </div>
                <!-- Classificação -->
                <div style="text-align: center;">
                    <span class="badge badge-info">{{ $c->classification ?? 'Outro' }}</span>
                </div>
                <!-- Confiança -->
                <div style="text-align: center; font-size: 13px;">
                    @if($c->confidence)
                        {{ round($c->confidence * 100) }}%
                    @else
                        -
                    @endif
                </div>
                <!-- Data -->
                <div style="text-align: center; font-size: 12px; color: #7f8c8d;">
                    {{ $c->created_at ? \Carbon\Carbon::parse($c->created_at)->format('d/m H:i') : '-' }}
                </div>
                <!-- Ações -->
                <div style="display: flex; gap: 5px; justify-content: flex-end;">
                    <a href="{{ route('comunicacoes.show', $c->id) }}" class="btn btn-sm btn-info" title="Visualizar">📧</a>
                    <a href="{{ route('comunicacoes.categorize', $c->id) }}" class="btn btn-sm btn-secondary" title="Categorizar">🏷️</a>
                </div>
            </div>
        @empty
            <div style="text-align: center; padding: 40px; color: #95a5a6;">
                <p>📭 Nenhuma comunicação registrada</p>
                <p style="font-size: 12px;">Clique em 🔄 Sincronizar para importar e-mails</p>
            </div>
        @endforelse
    </div>

    @if($comunicacoes && $comunicacoes->hasPages())
        <div style="padding: 15px; display: flex; justify-content: space-between; align-items: center; border-top: 1px solid #ddd;">
            <div style="font-size: 12px; color: #7f8c8d;">
                Showing {{ $comunicacoes->firstItem() }} to {{ $comunicacoes->lastItem() }} of {{ $comunicacoes->total() }} results
            </div>

            <div style="display: flex; gap: 5px;">
                @if($comunicacoes->onFirstPage())
                    <button class="btn btn-sm btn-secondary" disabled>← Previous</button>
                @else
                    <a href="{{ $comunicacoes->appends(request()->query())->previousPageUrl() }}" class="btn btn-sm btn-primary">← Previous</a>
                @endif

                <div style="display: flex; gap: 3px; align-items: center;">
                    @foreach($comunicacoes->getUrlRange(1, $comunicacoes->lastPage()) as $page => $url)
                        @if($page == $comunicacoes->currentPage())
                            <button class="btn btn-sm btn-primary" disabled>{{ $page }}</button>
                        @else
                            <a href="{{ $url }}&{{ http_build_query(request()->query()) }}" class="btn btn-sm btn-outline-primary">{{ $page }}</a>
                        @endif
                    @endforeach
                </div>

                @if($comunicacoes->hasMorePages())
                    <a href="{{ $comunicacoes->appends(request()->query())->nextPageUrl() }}" class="btn btn-sm btn-primary">Next →</a>
                @else
                    <button class="btn btn-sm btn-secondary" disabled>Next →</button>
                @endif
            </div>
        </div>
    @endif
</div>
@endsection
