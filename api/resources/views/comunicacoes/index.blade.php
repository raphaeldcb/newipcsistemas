@extends('layouts.app')

@section('title', 'Comunicações')
@section('page-title', 'Comunicações')

@section('content')
<div class="card">
    <div class="card-header">
        📧 Lista de Comunicações
        <a href="javascript:void(0)" class="btn btn-primary" style="float: right;">+ Nova</a>
    </div>

    <div style="margin-bottom: 20px; padding: 15px;">
        <form method="GET" action="{{ route('comunicacoes.index') }}">
            <input type="text" name="busca" placeholder="Buscar por assunto, remetente..." value="{{ $busca ?? '' }}" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px;">
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
                    <td>{{ $c->classification ?? '-' }}</td>
                    <td>{{ $c->confidence ?? '-' }}</td>
                    <td>{{ $c->created_at ? \Carbon\Carbon::parse($c->created_at)->format('d/m/Y H:i') : '-' }}</td>
                    <td>
                        <a href="{{ route('comunicacoes.show', $c->id) }}" class="btn btn-sm btn-info">Ver</a>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="6" style="text-align: center; padding: 30px; color: #95a5a6;">Nenhuma comunicação registrada</td>
                </tr>
            @endforelse
        </tbody>
    </table>

    @if($comunicacoes->hasPages())
        <div style="padding: 15px;">
            {{ $comunicacoes->appends(request()->query())->links() }}
        </div>
    @endif
</div>
@endsection
