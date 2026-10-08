@extends('layouts.app')
@section('title', 'Kits')
@section('content')
<div class="container mt-5">
  <h2>Kits</h2>
  <table class="table table-bordered">
    <thead class="table-dark">
      <tr><th>Código</th><th>Número</th><th>Status</th></tr>
    </thead>
    <tbody>
      @forelse($kits as $k)
        <tr><td>{{ $k->kit_cod }}</td><td>{{ $k->kit_num }}</td><td>{{ $k->kit_status }}</td></tr>
      @empty
        <tr><td colspan="3" class="text-center">Nenhum registro</td></tr>
      @endforelse
    </tbody>
  </table>
</div>
@endsection
