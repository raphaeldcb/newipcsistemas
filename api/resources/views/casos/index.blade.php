@extends('layouts.app')
@section('title', 'Casos')
@section('content')
<div class="container mt-5">
  <h2>Casos</h2>
  <table class="table table-bordered">
    <thead class="table-dark">
      <tr><th>Código</th><th>Descrição</th><th>Valor</th></tr>
    </thead>
    <tbody>
      @forelse($casos as $c)
        <tr><td>{{ $c->cas_codigo }}</td><td>{{ $c->cas_desc }}</td><td>{{ $c->cas_vlr }}</td></tr>
      @empty
        <tr><td colspan="3" class="text-center">Nenhum registro</td></tr>
      @endforelse
    </tbody>
  </table>
</div>
@endsection
