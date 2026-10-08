@extends('layouts.app')

@section('title', 'Kits')
@section('page-title', 'Kits')

@section('content')
<div class="card">
  <div class="card-header">
    🔬 Kits
    <a href="{{ route('kits.create') }}" class="btn btn-primary" style="float:right;">+ Novo Kit</a>
  </div>

  <div style="margin-bottom: 15px; padding: 15px;">
    <form action="{{ route('kits.index') }}" method="GET" style="display: flex; gap: 10px; align-items: center;">
      <input type="text" name="search" placeholder="Buscar por número ou rastreamento" value="{{ request('search') }}" style="flex: 1; padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
      <select name="status" style="padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
        <option value="">-- Todos os status --</option>
        <option value="P" @if(request('status') == 'P') selected @endif>Preparado</option>
        <option value="A" @if(request('status') == 'A') selected @endif>Em Análise</option>
        <option value="X" @if(request('status') == 'X') selected @endif>Processado</option>
      </select>
      <button type="submit" class="btn btn-primary">🔍 Buscar</button>
    </form>
  </div>

  <table class="table">
    <thead>
      <tr>
        <th>Número</th>
        <th>Status</th>
        <th>Rastreamento</th>
        <th>Data Envio</th>
        <th>Data Retorno</th>
        <th>Ações</th>
      </tr>
    </thead>
    <tbody>
      @forelse($kits as $kit)
        <tr>
          <td><a href="{{ route('kits.show', $kit) }}">{{ $kit->kit_num }}</a></td>
          <td>
            <span class="badge badge-{{ $kit->kit_status == 'P' ? 'info' : ($kit->kit_status == 'A' ? 'warning' : 'success') }}">
              {{ $kit->kit_status == 'P' ? 'Preparado' : ($kit->kit_status == 'A' ? 'Em Análise' : 'Processado') }}
            </span>
          </td>
          <td>{{ $kit->kit_rastrear ?? '--' }}</td>
          <td>{{ $kit->kit_denv ? $kit->kit_denv->format('d/m/Y') : '--' }}</td>
          <td>{{ $kit->kit_dret ? $kit->kit_dret->format('d/m/Y') : '--' }}</td>
          <td>
            <a href="{{ route('kits.edit', $kit) }}" class="btn btn-secondary btn-sm">Editar</a>
            <form action="{{ route('kits.destroy', $kit) }}" method="POST" style="display:inline;">
              @csrf @method('DELETE')
              <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Confirmar deletar?')">Deletar</button>
            </form>
          </td>
        </tr>
      @empty
        <tr><td colspan="6" style="text-align:center; padding:20px;">Nenhum kit registrado</td></tr>
      @endforelse
    </tbody>
  </table>
  {{ $kits->links() }}
</div>
@endsection
