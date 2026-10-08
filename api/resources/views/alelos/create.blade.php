@extends('layouts.app')

@section('title', 'Novo Alelo')
@section('page-title', 'Novo Alelo')

@section('content')
<div class="card">
  <div class="card-header">🧬 Novo Alelo</div>
  <form action="{{ route('alelos.store') }}" method="POST">
    @csrf
    @include('alelos._form')
    <div style="padding: 20px; display: flex; gap: 10px;">
      <button type="submit" class="btn btn-primary">Salvar</button>
      <a href="{{ route('alelos.index') }}" class="btn btn-secondary">Cancelar</a>
    </div>
  </form>
</div>
@endsection
