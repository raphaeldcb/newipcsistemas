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

    <table class="table">
        <thead>
            <tr>
                <th>Assunto</th>
                <th>Remetente</th>
                <th>Classificação</th>
                <th>Confiança</th>
                <th>Data</th>
                <th>Ação</th>
            </tr>
        </thead>
        <tbody>
            @forelse($comunicacoes as $c)
                <tr>
                    <td>{{ $c->subject ?? '-' }}</td>
                    <td>{{ $c->email_from ?? '-' }}</td>
                    <td><span class="badge badge-info">{{ $c->classification ?? '-' }}</span></td>
                    <td>{{ $c->confidence ?? '-' }}</td>
                    <td>{{ $c->created_at ? \Carbon\Carbon::parse($c->created_at)->format('d/m/Y H:i') : '-' }}</td>
                    <td style="display: flex; gap: 5px; flex-wrap: wrap;">
                        <a href="{{ route('comunicacoes.show', $c->id) }}" class="btn btn-sm btn-info" title="Visualizar e-mail">📧</a>
                        <a href="{{ route('comunicacoes.mark-read', $c->id) }}" class="btn btn-sm btn-warning" title="Marcar como Lido">✓</a>
                        <a href="{{ route('comunicacoes.categorize', $c->id) }}" class="btn btn-sm btn-secondary" title="Categorizar">🏷️</a>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="6" style="text-align: center; padding: 30px; color: #95a5a6;">Nenhuma comunicação registrada</td>
                </tr>
            @endforelse
        </tbody>
    </table>

    @if($comunicacoes && $comunicacoes->hasPages())
        <div style="padding: 15px; display: flex; justify-content: center;">
            {{ $comunicacoes->appends(request()->query())->links() }}
        </div>
    @endif
</div>
@endsection
