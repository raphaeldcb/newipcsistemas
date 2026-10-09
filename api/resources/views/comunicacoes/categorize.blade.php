@extends('layouts.app')

@section('title', 'Categorizar Comunicação')
@section('page-title', 'Categorizar Comunicação')

@section('content')
<div class="card">
    <div class="card-header">
        Categorizar: {{ $comunicacao->subject }}
    </div>

    <div class="card-body">
        <form action="{{ route('comunicacoes.store-category', $comunicacao->id) }}" method="POST">
            @csrf

            <div class="form-group">
                <label for="classification">Categoria:</label>
                <select name="classification" id="classification" class="form-control" required>
                    <option value="">-- Selecione --</option>
                    <option value="Dúvida" {{ $comunicacao->classification === 'Dúvida' ? 'selected' : '' }}>Dúvida</option>
                    <option value="Reclamação" {{ $comunicacao->classification === 'Reclamação' ? 'selected' : '' }}>Reclamação</option>
                    <option value="Sugestão" {{ $comunicacao->classification === 'Sugestão' ? 'selected' : '' }}>Sugestão</option>
                    <option value="Solicitação" {{ $comunicacao->classification === 'Solicitação' ? 'selected' : '' }}>Solicitação</option>
                    <option value="Informação" {{ $comunicacao->classification === 'Informação' ? 'selected' : '' }}>Informação</option>
                    <option value="Outro" {{ $comunicacao->classification === 'Outro' ? 'selected' : '' }}>Outro</option>
                </select>
            </div>

            <div class="form-group">
                <label for="body">Conteúdo do E-mail:</label>
                <textarea class="form-control" id="body" rows="6" readonly>{{ $comunicacao->body }}</textarea>
            </div>

            <div class="form-group">
                <label for="suggested_response">Resposta Sugerida:</label>
                <textarea class="form-control" id="suggested_response" rows="4" readonly>{{ $comunicacao->suggested_response }}</textarea>
            </div>

            <button type="submit" class="btn btn-primary">Salvar Categoria</button>
            <a href="{{ route('comunicacoes.index') }}" class="btn btn-secondary">Cancelar</a>
        </form>
    </div>
</div>
@endsection
