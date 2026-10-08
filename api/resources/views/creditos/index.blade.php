@extends('layouts.app')
@section('title', 'Créditos')
@section('content')
<div class="container mt-5">
  <h2>Créditos</h2>
  <table class="table table-bordered">
    <thead class="table-dark">
      <tr><th>ID</th><th>Juiz</th><th>Processo</th><th>Quantidade</th></tr>
    </thead>
    <tbody>
      @forelse($creditos as $cr)
        <tr><td>{{ $cr->id_credito }}</td><td>{{ $cr->jui_cod }}</td><td>{{ $cr->pro_cod }}</td><td>{{ $cr->cred_qdcre }}</td></tr>
      @empty
        <tr><td colspan="4" class="text-center">Nenhum registro</td></tr>
      @endforelse
    </tbody>
  </table>
</div>
@endsection
