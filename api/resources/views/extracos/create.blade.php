@extends('layouts.app')

@section('title', 'Nova Extração')
@section('page-title', 'Nova Extração')

@section('content')
<div class="card">
  <div class="card-header">
    🧬 Nova Extração
  </div>
  <form action="{{ route('extracos.store') }}" method="POST">
    @csrf
    <div class="card-body">
      @include('extracos._form')
    </div>
    <div class="card-footer">
      <button type="submit" class="btn btn-primary">Salvar</button>
      <a href="{{ route('extracos.index') }}" class="btn btn-secondary">Cancelar</a>
    </div>
  </form>
</div>
@endsection
