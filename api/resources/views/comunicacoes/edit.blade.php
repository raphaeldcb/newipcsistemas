@extends('layouts.app')

@section('title', 'Editar Comunicação')
@section('page-title', 'Editar Comunicação')

@section('content')
<div class="card">
  <div class="card-header">📧 Editar Comunicação</div>
  <form action="{{ route('comunicacoes.update', $comunicacao) }}" method="POST">
    @csrf @method('PATCH')
    @include('comunicacoes._form')
    <button type="submit" class="btn btn-primary">Atualizar</button>
    <a href="{{ route('comunicacoes.show', $comunicacao) }}" class="btn btn-secondary">Cancelar</a>
  </form>
</div>
@endsection
