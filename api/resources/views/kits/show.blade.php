@extends('layouts.app')

@section('title', 'Kit ' . $kit->kit_num)
@section('page-title', 'Detalhe do Kit')

@section('content')
<div style="display: grid; grid-template-columns: 2fr 1fr; gap: 20px;">
  <!-- Kit Details -->
  <div class="card">
    <div class="card-header">
      🔬 Kit #{{ $kit->kit_num }}
    </div>
    <div style="margin-bottom: 15px;">
      <p><strong>Número:</strong> {{ $kit->kit_num }}</p>
      <p><strong>Tipo:</strong> {{ $kit->kit_tip ?? '--' }}</p>
      <p><strong>Código de Coleta:</strong> {{ $kit->col_cod ?? '--' }}</p>
      <p><strong>Código de Exame:</strong> {{ $kit->kit_cexa ?? '--' }}</p>
      <p><strong>Rastreamento:</strong> {{ $kit->kit_rastrear ?? '--' }}</p>
    </div>
    <hr>
    <div style="margin-bottom: 15px;">
      <p><strong>Data de Envio:</strong> {{ $kit->kit_denv ? $kit->kit_denv->format('d/m/Y') : '--' }}</p>
      <p><strong>Data de Retorno:</strong> {{ $kit->kit_dret ? $kit->kit_dret->format('d/m/Y') : '--' }}</p>
    </div>
    <hr>
    <div style="margin-bottom: 15px;">
      <p><strong>Criado em:</strong> {{ $kit->created_at->format('d/m/Y H:i') }}</p>
      <p><strong>Atualizado em:</strong> {{ $kit->updated_at->format('d/m/Y H:i') }}</p>
    </div>
  </div>

  <!-- Sidebar: Actions -->
  <div>
    <!-- Status -->
    <div class="card">
      <div class="card-header" style="margin-bottom: 15px;">📊 Status</div>
      <p style="margin-bottom: 15px;">
        <span class="badge badge-{{ $kit->kit_status == 'P' ? 'info' : ($kit->kit_status == 'A' ? 'warning' : 'success') }}" style="font-size: 14px; padding: 8px 12px;">
          {{ $kit->kit_status == 'P' ? 'Preparado' : ($kit->kit_status == 'A' ? 'Em Análise' : 'Processado') }}
        </span>
      </p>
      <a href="{{ route('kits.edit', $kit) }}" class="btn btn-primary" style="width: 100%; margin-bottom: 10px;">✏️ Editar</a>
      <form action="{{ route('kits.destroy', $kit) }}" method="POST">
        @csrf @method('DELETE')
        <button type="submit" class="btn btn-danger" style="width: 100%;" onclick="return confirm('Confirmar deletar este kit?')">🗑️ Deletar</button>
      </form>
    </div>

    <!-- Navigation -->
    <div class="card">
      <div class="card-header">🔗 Navegação</div>
      <a href="{{ route('kits.index') }}" class="btn btn-secondary" style="width: 100%; margin-bottom: 10px;">← Voltar à lista</a>
    </div>
  </div>
</div>
@endsection
