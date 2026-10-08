@extends('layouts.app')
@section('title', 'Relatórios')
@section('content')
<div class="container mt-5">
  <h2>Relatórios</h2>
  <div class="row mt-4">
    <div class="col-md-6">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">Total de Casos</h5>
          <p class="card-text display-4">{{ $totalCasos ?? 0 }}</p>
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">Total de Comunicações</h5>
          <p class="card-text display-4">{{ $totalComunicacoes ?? 0 }}</p>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection
