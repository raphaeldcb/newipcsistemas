@extends('layouts.app')
@section('title', 'Processos')
@section('content')
<div class="container mt-5">
  <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px;">
    <div>
      <h2 style="margin-bottom: 5px;">⚖️ Processos</h2>
      <p style="color: #7f8c8d; font-size: 14px;">{{ $processos->total() }} processos no sistema</p>
    </div>
    <a href="{{ route('processos.create') }}" class="btn btn-primary" style="padding: 12px 20px; font-size: 16px;">+ Novo Processo</a>
  </div>

  <!-- Filtros e Busca -->
  <div class="card" style="margin-bottom: 30px;">
    <div style="padding: 20px;">
      <form method="GET" action="{{ route('processos.index') }}" style="display: flex; gap: 15px; align-items: flex-end; flex-wrap: wrap;">
        <div style="flex: 1; min-width: 250px;">
          <label style="display: block; font-weight: 600; margin-bottom: 8px; color: #333;">🔍 Buscar por:</label>
          <input type="text" name="busca" value="{{ $busca ?? '' }}" placeholder="Número, Autora ou Caso..."
                 style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px;">
        </div>
        <div style="min-width: 200px;">
          <label style="display: block; font-weight: 600; margin-bottom: 8px; color: #333;">📋 Ordenar por:</label>
          <select name="filtro" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px;">
            <option value="data" {{ $filtro === 'data' ? 'selected' : '' }}>Mais recentes</option>
            <option value="numero" {{ $filtro === 'numero' ? 'selected' : '' }}>Número do Processo</option>
            <option value="id" {{ $filtro === 'id' ? 'selected' : '' }}>ID Cadastro</option>
          </select>
        </div>
        <button type="submit" class="btn btn-primary" style="padding: 10px 20px;">Buscar</button>
        @if($busca)
          <a href="{{ route('processos.index') }}" class="btn btn-secondary" style="padding: 10px 20px;">Limpar</a>
        @endif
      </form>
    </div>
  </div>

  <!-- Tabela -->
  <div style="overflow-x: auto;">
    <table class="table" style="background: white; border-radius: 8px; overflow: hidden;">
      <thead>
        <tr style="background: #34495e; color: white;">
          <th style="padding: 15px; text-align: left;">Código</th>
          <th style="padding: 15px; text-align: left;">📋 Número</th>
          <th style="padding: 15px; text-align: left;">Tipo</th>
          <th style="padding: 15px; text-align: left;">👤 Autora</th>
          <th style="padding: 15px; text-align: left;">📅 Data Cadastro</th>
          <th style="padding: 15px; text-align: center;">⚙️ Ações</th>
        </tr>
      </thead>
      <tbody>
        @forelse($processos as $p)
          <tr style="border-bottom: 1px solid #ecf0f1; transition: background 0.2s;">
            <td style="padding: 12px 15px;"><strong>#{{ $p->pro_cod }}</strong></td>
            <td style="padding: 12px 15px;">{{ $p->pro_nperc ?? '-' }}</td>
            <td style="padding: 12px 15px;"><span style="background: #e8f4f8; padding: 4px 8px; border-radius: 4px;">{{ $p->pro_tipo ?? '-' }}</span></td>
            <td style="padding: 12px 15px;">{{ $p->pro_auto ?? '-' }}</td>
            <td style="padding: 12px 15px;">
              @if($p->pro_dcad)
                {{ \Carbon\Carbon::parse($p->pro_dcad)->format('d/m/Y') }}
              @else
                -
              @endif
            </td>
            <td style="padding: 12px 15px; text-align: center;">
              <a href="{{ route('processos.show', $p->pro_cod) }}" class="btn btn-sm" style="background: #3498db; color: white; padding: 6px 12px; margin-right: 5px; border-radius: 4px; text-decoration: none;">👁️</a>
              <a href="{{ route('processos.edit', $p->pro_cod) }}" class="btn btn-sm" style="background: #f39c12; color: white; padding: 6px 12px; margin-right: 5px; border-radius: 4px; text-decoration: none;">✏️</a>
              <form action="{{ route('processos.destroy', $p->pro_cod) }}" method="POST" style="display: inline;">
                @csrf
                @method('DELETE')
                <button type="submit" class="btn btn-sm" style="background: #e74c3c; color: white; padding: 6px 12px; border-radius: 4px; border: none; cursor: pointer;" onclick="return confirm('Deletar processo #{{ $p->pro_cod }}?')">🗑️</button>
              </form>
            </td>
          </tr>
        @empty
          <tr>
            <td colspan="6" style="padding: 30px; text-align: center; color: #7f8c8d;">
              <p style="font-size: 16px;">Nenhum processo encontrado</p>
              <p style="font-size: 12px; margin-top: 5px;">Clique em "+ Novo Processo" para criar um</p>
            </td>
          </tr>
        @endforelse
      </tbody>
    </table>
  </div>

  <!-- Paginação -->
  <div style="margin-top: 30px;">
    {{ $processos->appends(request()->query())->links() }}
  </div>
</div>
@endsection
