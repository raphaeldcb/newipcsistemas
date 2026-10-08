@extends('layouts.app')

@section('title', 'Alelo #' . $alelo->cod_ale)
@section('page-title', 'Alelo #' . $alelo->cod_ale)

@section('content')
<div class="card">
  <div class="card-header">
    <h2>🧬 Alelo #{{ $alelo->cod_ale }}</h2>
    <div style="display: flex; gap: 10px;">
      <a href="{{ route('alelos.edit', $alelo) }}" class="btn btn-warning">Editar</a>
      <form action="{{ route('alelos.destroy', $alelo) }}" method="POST" style="display: inline;">
        @csrf
        @method('DELETE')
        <button type="submit" class="btn btn-danger" onclick="return confirm('Tem certeza?')">Deletar</button>
      </form>
      <a href="{{ route('alelos.index') }}" class="btn btn-secondary">Voltar</a>
    </div>
  </div>

  <div style="padding: 20px;">
    <div class="detail-row">
      <strong>Extração:</strong>
      @if($alelo->extracao)
        <a href="{{ route('casos.show', $alelo->extracao->caso_id) }}">
          #{{ $alelo->extracao->ext_cod }} ({{ $alelo->extracao->status }})
        </a>
      @else
        <span>—</span>
      @endif
    </div>

    <div class="detail-row">
      <strong>Marcador:</strong>
      <span>{{ $alelo->marcador }}</span>
    </div>

    <div class="detail-row">
      <strong>Tipo de Alelo:</strong>
      <span class="badge">{{ $alelo->tipo_alelo }}</span>
    </div>

    <div class="detail-row">
      <strong>Alelo 1:</strong>
      <span>{{ $alelo->alelo1 }}</span>
    </div>

    <div class="detail-row">
      <strong>Alelo 2:</strong>
      <span>{{ $alelo->alelo2 ?: '—' }}</span>
    </div>

    <div class="detail-row">
      <strong>Genótipo:</strong>
      <span>{{ $alelo->genótipo ?: '—' }}</span>
    </div>

    <div class="detail-row">
      <strong>Frequência Alelo 1:</strong>
      <span>{{ $alelo->frequencia_alelo1 ? number_format($alelo->frequencia_alelo1, 4) : '—' }}</span>
    </div>

    <div class="detail-row">
      <strong>Frequência Alelo 2:</strong>
      <span>{{ $alelo->frequencia_alelo2 ? number_format($alelo->frequencia_alelo2, 4) : '—' }}</span>
    </div>

    <div class="detail-row">
      <strong>Data de Análise:</strong>
      <span>{{ $alelo->data_analise ? $alelo->data_analise->format('d/m/Y H:i') : '—' }}</span>
    </div>

    @if($alelo->observacoes)
      <div class="detail-row">
        <strong>Observações:</strong>
        <p style="white-space: pre-wrap;">{{ $alelo->observacoes }}</p>
      </div>
    @endif

    <div class="detail-row">
      <strong>Criado em:</strong>
      <span>{{ $alelo->created_at->format('d/m/Y H:i') }}</span>
    </div>

    <div class="detail-row">
      <strong>Atualizado em:</strong>
      <span>{{ $alelo->updated_at->format('d/m/Y H:i') }}</span>
    </div>

    @if($alelo->deleted_at)
      <div class="detail-row" style="background-color: #fee; padding: 10px; border-radius: 4px;">
        <strong>Deletado em:</strong>
        <span>{{ $alelo->deleted_at->format('d/m/Y H:i') }}</span>
      </div>
    @endif
  </div>
</div>

<style>
.detail-row {
  display: flex;
  gap: 15px;
  padding: 10px 0;
  border-bottom: 1px solid #eee;
  align-items: start;
}

.detail-row strong {
  min-width: 200px;
  font-weight: 600;
}

.detail-row p {
  margin: 0;
}

.badge {
  display: inline-block;
  background-color: #007bff;
  color: white;
  padding: 4px 8px;
  border-radius: 4px;
  font-size: 12px;
}

.badge-success {
  background-color: #28a745;
}

.badge-danger {
  background-color: #dc3545;
}
</style>
@endsection
