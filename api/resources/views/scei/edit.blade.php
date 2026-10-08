@extends('layouts.app')

@section('title', 'Editar Exame SCEI')
@section('page-title', 'Editar Exame SCEI #' . $scei->scei_cod)

@section('content')
<div class="card">
  <div class="card-header">
    ✏️ Editar Exame Laboratorial
  </div>

  <form action="{{ route('sceis.update', $scei) }}" method="POST">
    @csrf
    @method('PUT')
    <div style="padding: 20px;">
      @include('scei._form')
    </div>
    <div style="padding: 20px; border-top: 1px solid #ddd;">
      <button type="submit" class="btn btn-primary">💾 Atualizar Exame</button>
      <a href="{{ route('sceis.show', $scei) }}" class="btn btn-secondary">❌ Cancelar</a>
    </div>
  </form>
</div>
@endsection
