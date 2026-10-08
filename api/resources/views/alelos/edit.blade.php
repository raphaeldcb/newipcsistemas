@extends('layouts.app')

@section('title', 'Editar Alelo')
@section('page-title', 'Editar Alelo')

@section('content')
<div class="card">
  <div class="card-header">🧬 Editar Alelo #{{ $alelo->cod_ale }}</div>
  <form action="{{ route('alelos.update', $alelo) }}" method="POST">
    @csrf
    @method('PUT')
    @include('alelos._form')
    <div style="padding: 20px; display: flex; gap: 10px;">
      <button type="submit" class="btn btn-primary">Salvar Alterações</button>
      <a href="{{ route('alelos.show', $alelo) }}" class="btn btn-secondary">Cancelar</a>
    </div>
  </form>
</div>
@endsection
