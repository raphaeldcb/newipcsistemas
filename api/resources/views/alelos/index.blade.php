@extends('layouts.app')

@section('title', 'Alelos')
@section('page-title', 'Alelos')

@section('content')
<div class="card">
  <div class="card-header">
    <h2>🧬 Alelos</h2>
    <a href="{{ route('alelos.create') }}" class="btn btn-primary">+ Novo Alelo</a>
  </div>

  <div class="filters" style="margin: 15px; display: flex; gap: 10px; flex-wrap: wrap;">
    <form method="GET" action="{{ route('alelos.index') }}" style="display: flex; gap: 10px; flex-wrap: wrap;">
      <input type="text" name="search" placeholder="Buscar por marcador, tipo ou genótipo..." value="{{ request('search') }}" style="flex: 1; min-width: 200px;">
      <select name="tipo_alelo">
        <option value="">-- Todos os tipos --</option>
        @foreach(['STR', 'SNP', 'mtDNA', 'Y-STR', 'AMELOGENINA'] as $tipo)
          <option value="{{ $tipo }}" @if(request('tipo_alelo') == $tipo) selected @endif>{{ $tipo }}</option>
        @endforeach
      </select>
      <button type="submit" class="btn btn-secondary">Filtrar</button>
      <a href="{{ route('alelos.index') }}" class="btn btn-secondary">Limpar</a>
    </form>
  </div>

  @if($alelos->count())
    <table class="table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Marcador</th>
          <th>Tipo</th>
          <th>Genótipo</th>
          <th>Data Análise</th>
          <th>Status</th>
          <th>Ações</th>
        </tr>
      </thead>
      <tbody>
        @foreach($alelos as $alelo)
          <tr>
            <td>#{{ $alelo->cod_ale }}</td>
            <td>{{ $alelo->marcador }}</td>
            <td><span class="badge">{{ $alelo->tipo_alelo }}</span></td>
            <td>{{ $alelo->genótipo ?: '—' }}</td>
            <td>{{ $alelo->data_analise ? $alelo->data_analise->format('d/m/Y H:i') : '—' }}</td>
            <td>
              @if($alelo->deleted_at)
                <span class="badge badge-danger">Deletado</span>
              @else
                <span class="badge badge-success">Ativo</span>
              @endif
            </td>
            <td>
              <a href="{{ route('alelos.show', $alelo) }}" class="btn btn-sm btn-info">Ver</a>
              <a href="{{ route('alelos.edit', $alelo) }}" class="btn btn-sm btn-warning">Editar</a>
              <form action="{{ route('alelos.destroy', $alelo) }}" method="POST" style="display: inline;">
                @csrf
                @method('DELETE')
                <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Tem certeza?')">Deletar</button>
              </form>
            </td>
          </tr>
        @endforeach
      </tbody>
    </table>

    {{ $alelos->links() }}
  @else
    <p style="padding: 20px; text-align: center;">Nenhum alelo encontrado.</p>
  @endif
</div>
@endsection
