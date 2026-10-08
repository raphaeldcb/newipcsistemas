@extends('layouts.app')

@section('title', $pessoa->nome)
@section('page-title', 'Detalhe da Pessoa')

@section('content')
<div style="display: grid; grid-template-columns: 2fr 1fr; gap: 20px;">
    <!-- Dados Pessoais -->
    <div class="card">
        <div class="card-header">👥 Informações Pessoais</div>
        <table style="width: 100%; margin-top: 15px;">
            <tr>
                <td style="font-weight: 600; padding: 10px 0; width: 30%;">Nome:</td>
                <td style="padding: 10px 0;">{{ $pessoa->nome }}</td>
            </tr>
            <tr style="border-top: 1px solid #eee;">
                <td style="font-weight: 600; padding: 10px 0;">Documento:</td>
                <td style="padding: 10px 0;">{{ $pessoa->documento ?? '-' }}</td>
            </tr>
            <tr style="border-top: 1px solid #eee;">
                <td style="font-weight: 600; padding: 10px 0;">Tipo:</td>
                <td style="padding: 10px 0;">
                    <span class="badge badge-{{ $pessoa->tipo == 'FISICA' ? 'info' : 'warning' }}">
                        {{ $pessoa->tipo == 'FISICA' ? 'Pessoa Física' : 'Pessoa Jurídica' }}
                    </span>
                </td>
            </tr>
            <tr style="border-top: 1px solid #eee;">
                <td style="font-weight: 600; padding: 10px 0;">Email:</td>
                <td style="padding: 10px 0;">{{ $pessoa->email ?? '-' }}</td>
            </tr>
            <tr style="border-top: 1px solid #eee;">
                <td style="font-weight: 600; padding: 10px 0;">Telefone:</td>
                <td style="padding: 10px 0;">{{ $pessoa->telefone ?? '-' }}</td>
            </tr>
            <tr style="border-top: 1px solid #eee;">
                <td style="font-weight: 600; padding: 10px 0;">Data Cadastro:</td>
                <td style="padding: 10px 0;">{{ $pessoa->created_at->format('d/m/Y H:i') }}</td>
            </tr>
            @if($pessoa->updated_at !== $pessoa->created_at)
                <tr style="border-top: 1px solid #eee;">
                    <td style="font-weight: 600; padding: 10px 0;">Última Atualização:</td>
                    <td style="padding: 10px 0;">{{ $pessoa->updated_at->format('d/m/Y H:i') }}</td>
                </tr>
            @endif
        </table>
    </div>

    <!-- Sidebar -->
    <div>
        <!-- Ações -->
        <div class="card">
            <div class="card-header" style="margin-bottom: 15px;">⚙️ Ações</div>
            <a href="{{ route('pessoas.edit', $pessoa) }}" class="btn btn-primary" style="width: 100%; margin-bottom: 10px; display: block; text-align: center;">Editar</a>
            <form action="{{ route('pessoas.destroy', $pessoa) }}" method="POST">
                @csrf
                @method('DELETE')
                <button type="submit" class="btn btn-danger" style="width: 100%;" onclick="return confirm('Tem certeza que deseja deletar esta pessoa?')">Deletar</button>
            </form>
        </div>

        <!-- Casos Relacionados -->
        <div class="card">
            <div class="card-header" style="margin-bottom: 15px;">📋 Casos ({{ $pessoa->casos->count() }})</div>
            @forelse($pessoa->casos as $caso)
                <p style="margin: 5px 0;"><a href="{{ route('casos.show', $caso) }}">{{ $caso->numero }}</a></p>
            @empty
                <p style="color: #95a5a6; font-size: 14px;">Nenhum caso</p>
            @endforelse
        </div>

        <!-- Endereços -->
        <div class="card">
            <div class="card-header" style="margin-bottom: 15px;">📍 Endereços ({{ $pessoa->enderecos->count() }})</div>
            @forelse($pessoa->enderecos as $endereco)
                <p style="margin: 5px 0; font-size: 13px;">{{ $endereco->logradouro }}, {{ $endereco->numero }}<br>{{ $endereco->cidade ?? '' }} - {{ $endereco->uf ?? '' }}</p>
            @empty
                <p style="color: #95a5a6; font-size: 14px;">Nenhum endereço</p>
            @endforelse
        </div>
    </div>
</div>
@endsection
