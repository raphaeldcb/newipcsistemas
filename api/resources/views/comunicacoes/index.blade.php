@extends('layouts.app')

@section('title', 'Comunicações')
@section('page-title', 'Comunicações')

@section('content')
<div style="max-width: 1400px; margin: 0 auto;">
    <div style="background: #fff; border-radius: 4px; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">
        <!-- Header -->
        <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 20px; border-radius: 4px 4px 0 0; color: white; display: flex; justify-content: space-between; align-items: center;">
            <h3 style="margin: 0;">📧 Comunicações</h3>
            <div style="display: flex; gap: 10px;">
                <a href="{{ route('comunicacoes.sync') }}" class="btn btn-light">🔄 Sincronizar</a>
            </div>
        </div>

        <!-- Busca -->
        <div style="padding: 20px; border-bottom: 1px solid #eee;">
            <form method="GET" action="{{ route('comunicacoes.index') }}" style="display: flex; gap: 10px;">
                <input type="text" name="busca" placeholder="🔍 Buscar por assunto, remetente..." value="{{ $busca ?? '' }}" style="flex: 1; padding: 12px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px;">
                <button type="submit" class="btn btn-primary" style="padding: 12px 24px;">Buscar</button>
                @if($busca)
                    <a href="{{ route('comunicacoes.index') }}" class="btn btn-secondary" style="padding: 12px 24px;">Limpar</a>
                @endif
            </form>
        </div>

        <!-- Grid -->
        <div style="padding: 15px;">
            @forelse($comunicacoes as $c)
                <div style="display: grid; grid-template-columns: 2fr 120px 120px 100px 80px 100px; gap: 15px; align-items: center; padding: 15px; border-bottom: 1px solid #eee; hover_bg: #f9f9f9; transition: background 0.2s;">

                    <!-- Assunto + Remetente -->
                    <div>
                        <div style="font-weight: 600; color: #2c3e50; margin-bottom: 6px;">{{ substr($c->subject ?? '-', 0, 70) }}</div>
                        <div style="font-size: 12px; color: #7f8c8d;">
                            @php
                                $email = $c->email_from ?? '-';
                                $email = strpos($email, '|') ? explode('|', $email)[0] : $email;
                                $email = strpos($email, '?') ? explode('?', $email)[0] : $email;
                            @endphp
                            📧 {{ substr(trim($email), 0, 45) }}
                        </div>
                    </div>

                    <!-- Status Análise -->
                    <div style="text-align: center;">
                        @if($c->status === 'tratado')
                            <span style="background: #27ae60; color: white; padding: 6px 12px; border-radius: 20px; font-size: 12px; font-weight: bold;">
                                ✓ Analisado
                            </span>
                        @else
                            <span style="background: #e74c3c; color: white; padding: 6px 12px; border-radius: 20px; font-size: 12px; font-weight: bold;">
                                ○ Pendente
                            </span>
                        @endif
                    </div>

                    <!-- Classificação -->
                    <div style="text-align: center;">
                        @if($c->classification === 'Judicial')
                            <span style="background: #e74c3c; color: white; padding: 6px 12px; border-radius: 4px; font-size: 12px;">⚖️ Judicial</span>
                        @elseif($c->classification === 'Não Judicial')
                            <span style="background: #27ae60; color: white; padding: 6px 12px; border-radius: 4px; font-size: 12px;">📋 Não Jud.</span>
                        @else
                            <span style="background: #95a5a6; color: white; padding: 6px 12px; border-radius: 4px; font-size: 12px;">-</span>
                        @endif
                    </div>

                    <!-- Confiança -->
                    <div style="text-align: center; font-size: 13px; color: #7f8c8d;">
                        @if($c->confidence)
                            📊 {{ round($c->confidence * 100) }}%
                        @else
                            -
                        @endif
                    </div>

                    <!-- Data -->
                    <div style="text-align: center; font-size: 12px; color: #7f8c8d;">
                        🕐 {{ $c->created_at ? \Carbon\Carbon::parse($c->created_at)->format('d/m H:i') : '-' }}
                    </div>

                    <!-- Ações -->
                    <div style="display: flex; gap: 8px; justify-content: flex-end;">
                        <a href="{{ route('comunicacoes.show', $c->id) }}" class="btn btn-sm" style="background: #3498db; color: white; padding: 8px 12px; border-radius: 4px; text-decoration: none; font-size: 12px; font-weight: bold;" title="Visualizar">📧 Ver</a>
                    </div>
                </div>
            @empty
                <div style="text-align: center; padding: 60px 20px; color: #95a5a6;">
                    <p style="font-size: 18px; margin-bottom: 10px;">📭 Nenhuma comunicação registrada</p>
                    <p style="font-size: 14px;">Clique em 🔄 Sincronizar para importar e-mails</p>
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
