@extends('layouts.app')
@section('title', 'Processos')
@section('content')
<div class="container mt-5">
  <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
    <h2>Processos</h2>
    <a href="{{ route('processos.create') }}" class="btn btn-primary">+ Novo Processo</a>
  </div>

  <table class="table table-bordered">
    <thead class="table-dark">
      <tr><th>Código</th><th>Número</th><th>Tipo</th><th>Autora</th><th>Data Cadastro</th><th>Ações</th></tr>
    </thead>
    <tbody>
      @forelse($processos as $p)
        <tr>
          <td>{{ $p->pro_cod }}</td>
          <td>{{ $p->pro_nperc }}</td>
          <td>{{ $p->pro_tipo }}</td>
          <td>{{ $p->pro_auto }}</td>
          <td>{{ $p->pro_dcad }}</td>
          <td>
            <a href="{{ route('processos.show', $p->pro_cod) }}" class="btn btn-sm btn-info">👁️ Ver</a>
            <a href="{{ route('processos.edit', $p->pro_cod) }}" class="btn btn-sm btn-warning">✏️ Editar</a>
            <form action="{{ route('processos.destroy', $p->pro_cod) }}" method="POST" style="display: inline;">
              @csrf
              @method('DELETE')
              <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Deletar este processo?')">🗑️ Deletar</button>
            </form>
          </td>
        </tr>
      @empty
        <tr><td colspan="6" class="text-center">Nenhum processo</td></tr>
      @endforelse
    </tbody>
  </table>
  {{ $processos->links() }}
</div>
@endsection
