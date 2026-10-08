@extends('layouts.app')
@section('title', 'Processos')
@section('content')
<div class="container mt-5">
  <h2>Processos</h2>
  <a href="#" class="btn btn-primary mb-3">+ Novo Processo</a>
  <table class="table table-bordered">
    <thead class="table-dark">
      <tr><th>Código</th><th>Número</th><th>Tipo</th><th>Autora</th><th>Data Cadastro</th><th>Ação</th></tr>
    </thead>
    <tbody>
      @forelse($processos as $p)
        <tr>
          <td>{{ $p->pro_cod }}</td>
          <td>{{ $p->pro_nperc }}</td>
          <td>{{ $p->pro_tipo }}</td>
          <td>{{ $p->pro_auto }}</td>
          <td>{{ $p->pro_dcad }}</td>
          <td><a href="{{ route('processos.show', $p->pro_cod) }}" class="btn btn-sm btn-info">Ver</a></td>
        </tr>
      @empty
        <tr><td colspan="6" class="text-center">Nenhum processo</td></tr>
      @endforelse
    </tbody>
  </table>
  {{ $processos->links() }}
</div>
@endsection
