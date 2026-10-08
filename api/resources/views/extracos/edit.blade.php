@extends('layouts.app')

@section('title', 'Editar Extração')
@section('page-title', 'Editar Extração')

@section('content')
<div class="card">
  <div class="card-header">
    🧬 Editar Extração #{{ $extracao->ext_cod }}
  </div>
  <form action="{{ route('extracos.update', $extracao) }}" method="POST">
    @csrf
    @method('PATCH')
    <div class="card-body">
      @include('extracos._form')
    </div>
    <div class="card-footer">
      <button type="submit" class="btn btn-primary">Atualizar</button>
      <a href="{{ route('extracos.show', $extracao) }}" class="btn btn-secondary">Cancelar</a>
    </div>
  </form>
</div>
@endsection
