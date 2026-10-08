@extends('layouts.app')

@section('title', 'Editar Kit')
@section('page-title', 'Editar Kit')

@section('content')
<div class="card">
  <div class="card-header">🔬 Editar Kit</div>
  <form action="{{ route('kits.update', $kit) }}" method="POST">
    @csrf @method('PATCH')
    @include('kits._form')
    <button type="submit" class="btn btn-primary">Atualizar</button>
    <a href="{{ route('kits.show', $kit) }}" class="btn btn-secondary">Cancelar</a>
  </form>
</div>
@endsection
