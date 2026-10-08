@extends('layouts.app')

@section('title', 'Pessoas')
@section('page-title', 'Pessoas')

@section('content')
<div class="card">
    <div class="card-header">
        👥 Lista de Pessoas
        <a href="{{ route('pessoas.create') }}" class="btn btn-primary" style="float: right;">+ Nova Pessoa</a>
    </div>

    <div style="margin-bottom: 20px; display: flex; gap: 10px;">
        <form action="{{ route('pessoas.index') }}" method="GET" style="flex: 1;">
            <input type="text" name="search" placeholder="Buscar por nome ou CPF..." value="{{ request('search') }}" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px;">
        </form>
        <select onchange="window.location.href='{{ route('pessoas.index') }}?tipo=' + this.value + '&search={{ request('search') }}'" style="padding: 10px; border: 1px solid #ddd; border-radius: 4px;">
            <option value="">-- Todos os tipos --</option>
            <option value="FISICA" @if(request('tipo') == 'FISICA') selected @endif>Física</option>
            <option value="JURIDICA" @if(request('tipo') == 'JURIDICA') selected @endif>Jurídica</option>
        </select>
    </div>

    <table class="table">
        <thead>
            <tr>
                <th>Nome</th>
                <th>Documento</th>
                <th>Tipo</th>
                <th>Email/Telefone</th>
                <th>Data Cadastro</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            @forelse($pessoas as $pessoa)
                <tr>
                    <td><a href="{{ route('pessoas.show', $pessoa) }}">{{ $pessoa->nome }}</a></td>
                    <td>{{ $pessoa->documento ?? '-' }}</td>
                    <td>
                        <span class="badge badge-{{ $pessoa->tipo == 'FISICA' ? 'info' : 'warning' }}">
                            {{ $pessoa->tipo == 'FISICA' ? 'Física' : 'Jurídica' }}
                        </span>
                    </td>
                    <td>
                        @if($pessoa->email)
                            <div>{{ $pessoa->email }}</div>
                        @endif
                        @if($pessoa->telefone)
                            <div>{{ $pessoa->telefone }}</div>
                        @endif
                        @if(!$pessoa->email && !$pessoa->telefone)
                            <span style="color: #95a5a6;">-</span>
                        @endif
                    </td>
                    <td>{{ $pessoa->created_at->format('d/m/Y') }}</td>
                    <td>
                        <a href="{{ route('pessoas.edit', $pessoa) }}" class="btn btn-secondary btn-sm">Editar</a>
                        <form action="{{ route('pessoas.destroy', $pessoa) }}" method="POST" style="display:inline;">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Tem certeza que deseja deletar esta pessoa?')">Deletar</button>
                        </form>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="6" style="text-align: center; padding: 30px; color: #95a5a6;">Nenhuma pessoa registrada</td>
                </tr>
            @endforelse
        </tbody>
    </table>

    @if($pessoas->hasPages())
        <div style="margin-top: 20px;">
            {{ $pessoas->links() }}
        </div>
    @endif
</div>
@endsection
