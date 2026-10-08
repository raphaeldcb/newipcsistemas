@extends('layouts.app')

@section('title', 'Nova Comunicação')
@section('page-title', 'Nova Comunicação')

@section('content')
<div class="card">
  <div class="card-header">📧 Nova Comunicação</div>
  <form action="{{ route('comunicacoes.store') }}" method="POST">
    @csrf
    @include('comunicacoes._form')
    <button type="submit" class="btn btn-primary">Salvar</button>
    <a href="{{ route('comunicacoes.index') }}" class="btn btn-secondary">Cancelar</a>
  </form>
</div>
@endsection
