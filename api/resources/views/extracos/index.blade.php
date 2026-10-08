@extends('layouts.app')

@section('title', 'Extrações')
@section('page-title', 'Extrações')

@section('content')
<div class="card">
  <div class="card-header">
    🧬 Extrações
    <a href="{{ route('extracos.create') }}" class="btn btn-primary" style="float:right;">+ Nova</a>
  </div>

  <div class="card-body">
    <form method="GET" action="{{ route('extracos.index') }}" style="margin-bottom: 20px;">
      <div class="form-row">
        <input type="text" name="search" placeholder="Buscar por ID Amostra..." value="{{ request('search') }}" style="padding: 5px; width: 250px;">
        <select name="fase" style="padding: 5px; margin-left: 10px;">
          <option>-- Todas as fases --</option>
          @foreach($fases as $fase)
            <option value="{{ $fase->value }}" @if(request('fase') == $fase->value) selected @endif>{{ $fase->label() }}</option>
          @endforeach
        </select>
        <input type="text" name="status" placeholder="Status..." value="{{ request('status') }}" style="padding: 5px; margin-left: 10px; width: 150px;">
        <button type="submit" class="btn btn-secondary" style="margin-left: 10px;">Filtrar</button>
        <a href="{{ route('extracos.index') }}" class="btn btn-secondary" style="margin-left: 5px;">Limpar</a>
      </div>
    </form>
  </div>

  <table class="table">
    <thead>
      <tr>
        <th>ID</th>
        <th>ID Amostra</th>
        <th>Fase</th>
        <th>Status</th>
        <th>Data da Fase</th>
        <th>Ações</th>
      </tr>
    </thead>
    <tbody>
      @forelse($extracos as $extracao)
        <tr>
          <td><a href="{{ route('extracos.show', $extracao) }}">{{ $extracao->ext_cod }}</a></td>
          <td>{{ $extracao->amostra_id ?? '--' }}</td>
          <td><span class="badge badge-info">{{ $extracao->fase }}</span></td>
          <td><span class="badge badge-{{ strtolower($extracao->status) == 'pendente' ? 'warning' : 'success' }}">{{ $extracao->status }}</span></td>
          <td>{{ $extracao->data_fase ? $extracao->data_fase->format('d/m/Y H:i') : '--' }}</td>
          <td>
            <a href="{{ route('extracos.edit', $extracao) }}" class="btn btn-secondary btn-sm">Editar</a>
            <form action="{{ route('extracos.destroy', $extracao) }}" method="POST" style="display:inline;">
              @csrf @method('DELETE')
              <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Confirmar exclusão?')">Deletar</button>
            </form>
          </td>
        </tr>
      @empty
        <tr><td colspan="6" style="text-align:center; padding:20px;">Nenhuma extração registrada</td></tr>
      @endforelse
    </tbody>
  </table>
  {{ $extracos->links() }}
</div>
@endsection
