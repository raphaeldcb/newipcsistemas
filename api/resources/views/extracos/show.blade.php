@extends('layouts.app')

@section('title', 'Extração #' . $extracao->ext_cod)
@section('page-title', 'Extração #' . $extracao->ext_cod)

@section('content')
<div class="card">
  <div class="card-header">
    🧬 Extração #{{ $extracao->ext_cod }}
    <div style="float:right;">
      <a href="{{ route('extracos.edit', $extracao) }}" class="btn btn-secondary btn-sm">Editar</a>
      <form action="{{ route('extracos.destroy', $extracao) }}" method="POST" style="display:inline;">
        @csrf @method('DELETE')
        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Confirmar exclusão?')">Deletar</button>
      </form>
      <a href="{{ route('extracos.index') }}" class="btn btn-secondary btn-sm">Voltar</a>
    </div>
  </div>

  <div class="card-body">
    <div class="detail-row">
      <label>ID Extração:</label>
      <span>{{ $extracao->ext_cod }}</span>
    </div>

    <div class="detail-row">
      <label>ID Amostra:</label>
      <span>{{ $extracao->amostra_id ?? '--' }}</span>
    </div>

    <div class="detail-row">
      <label>Fase:</label>
      <span><strong>{{ $extracao->fase }}</strong></span>
    </div>

    <div class="detail-row">
      <label>Status:</label>
      <span><span class="badge badge-{{ strtolower($extracao->status) == 'pendente' ? 'warning' : 'success' }}">{{ $extracao->status }}</span></span>
    </div>

    <div class="detail-row">
      <label>Data da Fase:</label>
      <span>{{ $extracao->data_fase ? $extracao->data_fase->format('d/m/Y H:i:s') : '--' }}</span>
    </div>

    @if($extracao->resultado)
      <div class="detail-row">
        <label>Resultado:</label>
        <p style="white-space: pre-wrap;">{{ $extracao->resultado }}</p>
      </div>
    @endif

    @if($extracao->observacoes)
      <div class="detail-row">
        <label>Observações:</label>
        <p style="white-space: pre-wrap;">{{ $extracao->observacoes }}</p>
      </div>
    @endif

    <div class="detail-row">
      <label>Data de Criação:</label>
      <span>{{ $extracao->created_at->format('d/m/Y H:i:s') }}</span>
    </div>

    <div class="detail-row">
      <label>Última Atualização:</label>
      <span>{{ $extracao->updated_at->format('d/m/Y H:i:s') }}</span>
    </div>
  </div>
</div>

<style>
.detail-row {
  display: flex;
  padding: 10px 0;
  border-bottom: 1px solid #eee;
}

.detail-row label {
  font-weight: bold;
  width: 200px;
  margin-right: 20px;
}

.detail-row span,
.detail-row p {
  flex: 1;
  word-break: break-word;
}
</style>
@endsection
