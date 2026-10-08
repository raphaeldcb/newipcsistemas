@extends('layouts.app')
@section('title', 'Processos')
@section('content')
<div style="max-width: 1200px; margin: 0 auto; padding: 20px;">
  <!-- Header -->
  <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px;">
    <div>
      <h1 style="margin: 0; color: #2c3e50; font-size: 28px;">⚖️ Processos</h1>
      <p style="margin: 5px 0 0 0; color: #7f8c8d;">{{ $processos->total() }} processos no sistema</p>
    </div>
    <a href="{{ route('processos.create') }}" style="background: #27ae60; color: white; padding: 12px 24px; border-radius: 4px; text-decoration: none; font-weight: 600;">+ Novo Processo</a>
  </div>

  <!-- Filtros -->
  <div style="background: white; border-radius: 8px; padding: 20px; margin-bottom: 30px; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">
    <form method="GET" action="{{ route('processos.index') }}" style="display: flex; gap: 15px; flex-wrap: wrap; align-items: flex-end;">
      <div style="flex: 1; min-width: 250px;">
        <label style="display: block; font-weight: 600; color: #333; margin-bottom: 6px; font-size: 12px;">🔍 Buscar</label>
        <input type="text" name="busca" value="{{ $busca ?? '' }}" placeholder="Número, autora ou caso..." style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px;">
      </div>
      <div style="min-width: 200px;">
        <label style="display: block; font-weight: 600; color: #333; margin-bottom: 6px; font-size: 12px;">📋 Ordenar</label>
        <select name="filtro" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px;">
          <option value="data" {{ $filtro === 'data' ? 'selected' : '' }}>Mais recentes</option>
          <option value="numero" {{ $filtro === 'numero' ? 'selected' : '' }}>Número</option>
          <option value="id" {{ $filtro === 'id' ? 'selected' : '' }}>ID</option>
        </select>
      </div>
      <button type="submit" style="background: #3498db; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; font-weight: 600;">Buscar</button>
      @if($busca)
        <a href="{{ route('processos.index') }}" style="background: #95a5a6; color: white; padding: 10px 20px; border-radius: 4px; text-decoration: none; font-weight: 600;">Limpar</a>
      @endif
    </form>
  </div>

  <!-- Lista de Processos -->
  @if($processos->count())
    <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(350px, 1fr)); gap: 20px; margin-bottom: 30px;">
      @foreach($processos as $p)
        <a href="{{ route('processos.show', $p->pro_cod) }}" style="text-decoration: none; color: inherit;">
          <div style="background: white; border-radius: 8px; padding: 20px; box-shadow: 0 1px 3px rgba(0,0,0,0.1); transition: transform 0.2s, box-shadow 0.2s; cursor: pointer; border-left: 4px solid #3498db; display: flex; flex-direction: column; height: 100%;">
            <div style="margin-bottom: 12px;">
              <div style="display: flex; justify-content: space-between; align-items: start;">
                <div>
                  <p style="margin: 0; color: #7f8c8d; font-size: 12px; font-weight: 600;">PROCESSO #{{ $p->pro_cod }}</p>
                  <h3 style="margin: 4px 0 0 0; color: #2c3e50; font-size: 16px;">{{ $p->pro_nperc ?? '-' }}</h3>
                </div>
                <span style="background: #e8f4f8; color: #3498db; padding: 4px 8px; border-radius: 4px; font-size: 11px; font-weight: 600;">{{ $p->pro_tipo ? ['Judicial', 'ExtraJudicial', 'Min. Público', 'Def. Pública', 'Deleg. Polícia', 'Just. Comunitária', 'Cons. Tutelar', 'Prom. Justiça', 'Paternidade Resp.', 'Núcleo Prática', 'Dir. Foro', 'Aut. Solicitante'][$p->pro_tipo - 1] ?? 'N/A' : '-' }}</span>
              </div>
            </div>

            <div style="margin-bottom: 12px; flex: 1;">
              <p style="margin: 0 0 6px 0; color: #555; font-size: 13px;"><strong>Autora:</strong> {{ $p->pro_auto ?? '-' }}</p>
              <p style="margin: 0 0 6px 0; color: #555; font-size: 13px;"><strong>UF:</strong> {{ $p->uf_sigla ?? '-' }} | <strong>Caso:</strong> {{ $p->cas_codigo ?? '-' }}</p>
              <p style="margin: 0; color: #7f8c8d; font-size: 12px;">
                📅 {{ $p->pro_drec ? \Carbon\Carbon::parse($p->pro_drec)->format('d/m/Y') : 'Sem data' }}
              </p>
            </div>

            <div style="display: flex; gap: 8px; padding-top: 12px; border-top: 1px solid #ecf0f1; margin-top: auto;">
              <form action="{{ route('processos.destroy', $p->pro_cod) }}" method="POST" style="flex: 1;">
                @csrf
                @method('DELETE')
                <button type="submit" style="width: 100%; background: #e74c3c; color: white; border: none; padding: 8px; border-radius: 4px; cursor: pointer; font-size: 12px; font-weight: 600;" onclick="return confirm('Deletar processo #{{ $p->pro_cod }}?')">🗑️ Deletar</button>
              </form>
              <a href="{{ route('processos.edit', $p->pro_cod) }}" style="flex: 1; background: #f39c12; color: white; padding: 8px; border-radius: 4px; text-align: center; text-decoration: none; font-size: 12px; font-weight: 600;">✏️ Editar</a>
            </div>
          </div>
        </a>
      @endforeach
    </div>

    <!-- Paginação -->
    <div style="display: flex; justify-content: center; margin-top: 40px;">
      {{ $processos->appends(request()->query())->links() }}
    </div>
  @else
    <div style="background: white; border-radius: 8px; padding: 60px 20px; text-align: center; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">
      <p style="color: #7f8c8d; font-size: 16px; margin: 0;">Nenhum processo encontrado</p>
      <p style="color: #95a5a6; font-size: 13px; margin: 10px 0 0 0;">Clique em "+ Novo Processo" para criar um</p>
    </div>
  @endif
</div>
@endsection
