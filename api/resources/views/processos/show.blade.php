@extends('layouts.app')
@section('title', 'Processo #' . $processo->pro_cod)
@section('content')
<div class="container mt-5">
  <h2>Processo #{{ $processo->pro_cod }}</h2>
  
  <div class="card mt-4">
    <div class="card-header">
      <h5>Dados do Processo</h5>
    </div>
    <div class="card-body">
      <p><strong>Número:</strong> {{ $processo->pro_nperc }}</p>
      <p><strong>Tipo:</strong> {{ $processo->pro_tipo }}</p>
      <p><strong>Autora:</strong> {{ $processo->pro_auto }}</p>
      <p><strong>Data Cadastro:</strong> {{ $processo->pro_dcad }}</p>
    </div>
  </div>

  <div class="card mt-4">
    <div class="card-header">
      <h5>Histórico</h5>
    </div>
    <div class="card-body">
      @if($historicos->count())
        <table class="table table-sm">
          <thead>
            <tr><th>Data</th><th>Item</th><th>Documento</th><th>Observação</th></tr>
          </thead>
          <tbody>
            @foreach($historicos as $h)
              <tr>
                <td>{{ $h->his_data }}</td>
                <td>{{ $h->ite_cod }}</td>
                <td>{{ $h->his_doc }}</td>
                <td>{{ $h->his_obs }}</td>
              </tr>
            @endforeach
          </tbody>
        </table>
      @else
        <p class="text-muted">Nenhum histórico registrado</p>
      @endif
    </div>
  </div>
</div>
@endsection
