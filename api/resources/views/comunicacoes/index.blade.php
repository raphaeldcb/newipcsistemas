@extends('layouts.app')
@section('title', 'Comunicações')
@section('content')
<div class="container mt-5">
  <h2>Comunicações</h2>
  <table class="table table-bordered">
    <thead class="table-dark">
      <tr><th>De</th><th>Para</th><th>Assunto</th><th>Classificação</th></tr>
    </thead>
    <tbody>
      @forelse($comunicacoes as $c)
        <tr><td>{{ $c->email_from }}</td><td>{{ $c->email_to }}</td><td>{{ $c->subject }}</td><td>{{ $c->classification }}</td></tr>
      @empty
        <tr><td colspan="4" class="text-center">Nenhum registro</td></tr>
      @endforelse
    </tbody>
  </table>
</div>
@endsection
