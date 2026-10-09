@extends('layouts.app')
@section('title', 'Comunicações')

@push('styles')
<style>
  .pagination {
    display: flex;
    gap: 5px;
    flex-wrap: wrap;
    justify-content: center;
  }
  .pagination li {
    list-style: none;
  }
  .pagination a, .pagination span {
    padding: 8px 12px;
    border-radius: 4px;
    text-decoration: none;
    font-size: 12px;
    font-weight: 600;
    border: 1px solid #ddd;
    color: #333;
    transition: all 0.2s;
  }
  .pagination a:hover {
    background: #3498db;
    color: white;
    border-color: #3498db;
  }
  .pagination .active span {
    background: #3498db;
    color: white;
    border-color: #3498db;
  }
  .pagination .disabled span {
    color: #ccc;
    cursor: not-allowed;
  }
</style>
@endpush

@section('content')
<div style="max-width: 1200px; margin: 0 auto; padding: 20px;">
  <!-- Header -->
  <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px;">
    <div>
      <h1 style="margin: 0; color: #2c3e50; font-size: 28px;">📧 Comunicações</h1>
      <p style="margin: 5px 0 0 0; color: #7f8c8d;">{{ $comunicacoes->total() }} comunicações no sistema</p>
    </div>
    <a href="{{ route('comunicacoes.create') }}" style="background: #3498db; color: white; padding: 12px 24px; border-radius: 4px; text-decoration: none; font-weight: 600;">+ Nova Comunicação</a>
  </div>

  <!-- Filtros -->
  <div style="background: white; border-radius: 8px; padding: 20px; margin-bottom: 30px; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">
    <form method="GET" action="{{ route('comunicacoes.index') }}" style="display: flex; gap: 15px; flex-wrap: wrap; align-items: flex-end;">
      <div style="flex: 1; min-width: 250px;">
        <label style="display: block; font-weight: 600; color: #333; margin-bottom: 6px; font-size: 12px;">🔍 Buscar</label>
        <input type="text" name="busca" value="{{ $busca ?? '' }}" placeholder="Assunto, de ou para..." style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px;">
      </div>
      <div style="min-width: 200px;">
        <label style="display: block; font-weight: 600; color: #333; margin-bottom: 6px; font-size: 12px;">📋 Ordenar</label>
        <select name="filtro" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px;">
          <option value="data" {{ $filtro === 'data' ? 'selected' : '' }}>Mais recentes</option>
          <option value="assunto" {{ $filtro === 'assunto' ? 'selected' : '' }}>Assunto</option>
          <option value="id" {{ $filtro === 'id' ? 'selected' : '' }}>ID</option>
        </select>
      </div>
      <button type="submit" style="background: #3498db; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; font-weight: 600;">Buscar</button>
      @if($busca)
        <a href="{{ route('comunicacoes.index') }}" style="background: #95a5a6; color: white; padding: 10px 20px; border-radius: 4px; text-decoration: none; font-weight: 600;">Limpar</a>
      @endif
    </form>
  </div>

  <!-- Lista de Comunicações em Grid -->
  @if($comunicacoes->count())
    <div style="background: white; border-radius: 8px; overflow: hidden; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">
      <div style="display: grid; grid-template-columns: 60px 1fr 1fr 80px 90px 100px; gap: 0; border-bottom: 2px solid #3498db;">
        <div style="padding: 12px 15px; font-weight: 600; color: white; background: #3498db; text-align: center; font-size: 12px;">ID</div>
        <div style="padding: 12px 15px; font-weight: 600; color: white; background: #3498db; font-size: 12px;">Assunto</div>
        <div style="padding: 12px 15px; font-weight: 600; color: white; background: #3498db; font-size: 12px;">De/Para</div>
        <div style="padding: 12px 15px; font-weight: 600; color: white; background: #3498db; font-size: 12px;">Status</div>
        <div style="padding: 12px 15px; font-weight: 600; color: white; background: #3498db; text-align: center; font-size: 12px;">Data</div>
        <div style="padding: 12px 15px; font-weight: 600; color: white; background: #3498db; text-align: center; font-size: 12px;">Ações</div>
      </div>

      @foreach($comunicacoes as $c)
        <div style="display: grid; grid-template-columns: 60px 1fr 1fr 80px 90px 100px; gap: 0; border-bottom: 1px solid #ecf0f1; align-items: center;">
          <div style="padding: 12px 15px; text-align: center; color: #7f8c8d; font-weight: 600; font-size: 12px;">{{ $c->id }}</div>

          <div style="padding: 12px 15px;">
            <p style="margin: 0 0 3px 0; font-weight: 600; color: #2c3e50; font-size: 13px;">{{ $c->subject ?? '-' }}</p>
            <span style="background: #e8f4f8; color: #3498db; padding: 2px 6px; border-radius: 3px; font-size: 10px; font-weight: 600;">{{ $c->classification ?? '-' }}</span>
          </div>

          <div style="padding: 12px 15px; font-size: 12px; color: #555; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
            <strong>De:</strong> {{ $c->email_from ?? '-' }}<br><span style="font-size: 11px;"><strong>Para:</strong> {{ $c->email_to ?? '-' }}</span>
          </div>

          <div style="padding: 12px 15px; font-size: 12px; color: #555; text-align: center;">
            <span style="background: #d4edda; color: #155724; padding: 2px 6px; border-radius: 3px; font-size: 11px;">Enviado</span>
          </div>

          <div style="padding: 12px 15px; text-align: center; font-size: 12px; color: #7f8c8d;">
            {{ $c->created_at ? \Carbon\Carbon::parse($c->created_at)->format('d/m/Y') : '-' }}
          </div>

          <div style="padding: 12px 15px; display: flex; gap: 5px; justify-content: center;">
            <a href="{{ route('comunicacoes.show', $c->id) }}" style="width: 32px; height: 32px; display: inline-flex; align-items: center; justify-content: center; background: #3498db; color: white; border-radius: 4px; text-decoration: none; font-size: 14px; line-height: 1; transition: all 0.2s;" title="Visualizar">📁</a>
            <a href="{{ route('comunicacoes.edit', $c->id) }}" style="width: 32px; height: 32px; display: inline-flex; align-items: center; justify-content: center; background: #3498db; color: white; border-radius: 4px; text-decoration: none; font-size: 14px; line-height: 1; transition: all 0.2s;" title="Editar">📄</a>
            <form action="{{ route('comunicacoes.destroy', $c->id) }}" method="POST" style="display: inline;">
              @csrf
              @method('DELETE')
              <button type="submit" style="width: 32px; height: 32px; display: inline-flex; align-items: center; justify-content: center; background: #e74c3c; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; line-height: 1; transition: all 0.2s;" title="Deletar" onclick="return confirm('Deletar comunicação #{{ $c->id }}?')">🗑</button>
            </form>
          </div>
        </div>
      @endforeach
    </div>

    <!-- Paginação -->
    <div style="display: flex; flex-direction: column; align-items: center; margin-top: 40px; gap: 20px;">
      <div style="color: #7f8c8d; font-size: 12px;">
        Mostrando {{ $comunicacoes->firstItem() }} a {{ $comunicacoes->lastItem() }} de {{ $comunicacoes->total() }} comunicações
      </div>
      <div style="display: flex; justify-content: center; flex-wrap: wrap; gap: 5px;">
        {{ $comunicacoes->appends(request()->query())->links('pagination::bootstrap-4') }}
      </div>
    </div>
  @else
    <div style="background: white; border-radius: 8px; padding: 60px 20px; text-align: center; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">
      <p style="color: #7f8c8d; font-size: 16px; margin: 0;">Nenhuma comunicação encontrada</p>
      <p style="color: #95a5a6; font-size: 13px; margin: 10px 0 0 0;">Clique em "+ Nova Comunicação" para criar uma</p>
    </div>
  @endif
</div>
@endsection
