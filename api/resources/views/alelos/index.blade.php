@extends('layouts.app')
@section('title', 'Alelos')
@section('content')
<div class="container mt-5">
  <h2>Alelos</h2>
  <table class="table table-bordered">
    <thead class="table-dark">
      <tr><th>Código</th><th>Nome 1</th><th>Nome 2</th><th>Alelo 1</th><th>Alelo 2</th></tr>
    </thead>
    <tbody>
      @forelse($alelos as $a)
        <tr><td>{{ $a->cod_ale }}</td><td>{{ $a->nm1_ale }}</td><td>{{ $a->nm2_ale }}</td><td>{{ $a->al1_ale }}</td><td>{{ $a->al2_ale }}</td></tr>
      @empty
        <tr><td colspan="5" class="text-center">Nenhum registro</td></tr>
      @endforelse
    </tbody>
  </table>
</div>
@endsection
