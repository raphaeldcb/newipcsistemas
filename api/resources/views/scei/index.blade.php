@extends('layouts.app')

@section('title', 'SCEI — Laboratório')
@section('page-title', 'SCEI — Laboratório Integrado')

@section('content')
<div class="card">
  <div class="card-header">
    🔬 Exames Laboratoriais (SCEI)
    <a href="{{ route('sceis.create') }}" class="btn btn-primary" style="float:right;">+ Novo Exame</a>
  </div>

  <div class="card-body" style="padding: 15px;">
    <form method="GET" action="{{ route('sceis.index') }}" style="margin-bottom: 20px;">
      <div style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr auto; gap: 10px; margin-bottom: 15px;">
        <input type="text" name="search" placeholder="Buscar por tipo exame..." value="{{ request('search') }}" style="padding: 8px;">
        <select name="fase" style="padding: 8px;">
          <option value="">-- Todas as fases --</option>
          <option value="1" @if(request('fase') == 1) selected @endif>Pendente</option>
          <option value="2" @if(request('fase') == 2) selected @endif>Amostra Recebida</option>
          <option value="3" @if(request('fase') == 3) selected @endif>Em Análise</option>
          <option value="4" @if(request('fase') == 4) selected @endif>Resultado Liberado</option>
          <option value="5" @if(request('fase') == 5) selected @endif>Laudo Emitido</option>
          <option value="6" @if(request('fase') == 6) selected @endif>Laudo Finalizado</option>
          <option value="7" @if(request('fase') == 7) selected @endif>Cancelado</option>
        </select>
        <select name="caso_id" style="padding: 8px;">
          <option value="">-- Todos os casos --</option>
          @foreach($casos as $caso)
            <option value="{{ $caso->id }}" @if(request('caso_id') == $caso->id) selected @endif>Caso {{ $caso->numero ?? $caso->id }}</option>
          @endforeach
        </select>
        <select name="laboratorio_id" style="padding: 8px;">
          <option value="">-- Todos os labs --</option>
          @foreach($laboratorios as $lab)
            <option value="{{ $lab->id }}" @if(request('laboratorio_id') == $lab->id) selected @endif>{{ $lab->name }}</option>
          @endforeach
        </select>
        <button type="submit" class="btn btn-secondary">🔍 Filtrar</button>
      </div>
    </form>
  </div>

  <table class="table">
    <thead>
      <tr>
        <th>Tipo Exame</th>
        <th>Resultado</th>
        <th>Fase</th>
        <th>Data Exame</th>
        <th>Laboratório</th>
        <th>Caso</th>
        <th>Valor</th>
        <th>Ações</th>
      </tr>
    </thead>
    <tbody>
      @forelse($sceis as $scei)
        <tr>
          <td><a href="{{ route('sceis.show', $scei) }}">{{ $scei->exame_tipo }}</a></td>
          <td>{{ $scei->resultado ?? '—' }}</td>
          <td>
            <span class="badge badge-{{ $scei->scei_fase == 7 ? 'danger' : ($scei->scei_fase >= 4 ? 'success' : 'warning') }}">
              {{ $scei->getFaseLabel() }}
            </span>
            <div style="font-size: 10px; margin-top: 5px;">
              <div style="background: #e9ecef; height: 4px; border-radius: 2px; overflow: hidden;">
                <div style="background: #28a745; height: 100%; width: {{ $scei->getProgresso() }}%; transition: width 0.3s;"></div>
              </div>
              {{ $scei->getProgresso() }}%
            </div>
          </td>
          <td>{{ $scei->data_exame?->format('d/m/Y H:i') ?? '—' }}</td>
          <td>{{ $scei->laboratorio?->name ?? '—' }}</td>
          <td>{{ $scei->caso?->numero ?? '—' }}</td>
          <td>{{ $scei->valor_exame ? 'R$ ' . number_format($scei->valor_exame, 2, ',', '.') : '—' }}</td>
          <td>
            <a href="{{ route('sceis.show', $scei) }}" class="btn btn-info btn-sm">Ver</a>
            <a href="{{ route('sceis.edit', $scei) }}" class="btn btn-secondary btn-sm">Editar</a>
            <form action="{{ route('sceis.destroy', $scei) }}" method="POST" style="display:inline;">
              @csrf @method('DELETE')
              <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Confirmar deletar este exame?')">Deletar</button>
            </form>
          </td>
        </tr>
      @empty
        <tr><td colspan="8" style="text-align:center; padding:20px;">Nenhum exame registrado</td></tr>
      @endforelse
    </tbody>
  </table>
  {{ $sceis->links() }}
</div>
@endsection
