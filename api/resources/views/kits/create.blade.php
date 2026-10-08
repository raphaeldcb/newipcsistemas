@extends('layouts.app')

@section('title', 'Novo Kit')
@section('page-title', 'Novo Kit')

@section('content')
<div class="card">
  <div class="card-header">🔬 Novo Kit</div>
  <form action="{{ route('kits.store') }}" method="POST">
    @csrf
    @include('kits._form')
    <button type="submit" class="btn btn-primary">Salvar</button>
    <a href="{{ route('kits.index') }}" class="btn btn-secondary">Cancelar</a>
  </form>
</div>
@endsection
