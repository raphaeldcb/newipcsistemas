@extends('layouts.app')

@section('title', 'Novo Exame SCEI')
@section('page-title', 'Novo Exame SCEI')

@section('content')
<div class="card">
  <div class="card-header">
    ➕ Novo Exame Laboratorial (SCEI)
  </div>

  <form action="{{ route('sceis.store') }}" method="POST">
    @csrf
    <div style="padding: 20px;">
      @include('scei._form')
    </div>
    <div style="padding: 20px; border-top: 1px solid #ddd;">
      <button type="submit" class="btn btn-primary">💾 Salvar Exame</button>
      <a href="{{ route('sceis.index') }}" class="btn btn-secondary">❌ Cancelar</a>
    </div>
  </form>
</div>
@endsection
