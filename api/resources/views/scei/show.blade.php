@extends('layouts.app')

@section('title', 'Exame SCEI #' . $scei->scei_cod)
@section('page-title', 'Detalhes do Exame SCEI #' . $scei->scei_cod)

@section('content')
<div class="card">
  <div class="card-header">
    🔬 Exame SCEI — {{ $scei->exame_tipo }}
    <div style="float: right;">
      <a href="{{ route('sceis.edit', $scei) }}" class="btn btn-secondary btn-sm">✏️ Editar</a>
      <form action="{{ route('sceis.destroy', $scei) }}" method="POST" style="display:inline;">
        @csrf @method('DELETE')
        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Confirmar deletar este exame?')">🗑️ Deletar</button>
      </form>
    </div>
  </div>

  <div style="padding: 20px;">
    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 30px; margin-bottom: 30px;">
      <!-- Coluna 1: Informações Básicas -->
      <div>
        <h5 style="margin-bottom: 15px; border-bottom: 2px solid #007bff; padding-bottom: 10px;">📋 Informações Básicas</h5>
        <div style="margin-bottom: 12px;">
          <strong>ID:</strong> {{ $scei->scei_cod }}
        </div>
        <div style="margin-bottom: 12px;">
          <strong>Tipo de Exame:</strong> {{ $scei->exame_tipo }}
        </div>
        <div style="margin-bottom: 12px;">
          <strong>Data do Exame:</strong>
          {{ $scei->data_exame?->format('d/m/Y \à\s H:i') ?? '—' }}
        </div>
        <div style="margin-bottom: 12px;">
          <strong>Data de Coleta:</strong>
          {{ $scei->data_coleta?->format('d/m/Y') ?? '—' }}
        </div>
        <div style="margin-bottom: 12px;">
          <strong>ID da Amostra:</strong> {{ $scei->amostra_id ?? '—' }}
        </div>
        <div style="margin-bottom: 12px;">
          <strong>Valor do Exame:</strong>
          {{ $scei->valor_exame ? 'R$ ' . number_format($scei->valor_exame, 2, ',', '.') : '—' }}
        </div>
      </div>

      <!-- Coluna 2: Status e Fase -->
      <div>
        <h5 style="margin-bottom: 15px; border-bottom: 2px solid #28a745; padding-bottom: 10px;">📊 Status e Fase</h5>
        <div style="margin-bottom: 12px;">
          <strong>Fase Atual:</strong>
          <span class="badge badge-{{ $scei->scei_fase == 7 ? 'danger' : ($scei->scei_fase >= 4 ? 'success' : 'warning') }}" style="font-size: 14px; padding: 8px 12px;">
            {{ $scei->getFaseLabel() }}
          </span>
        </div>
        <div style="margin-bottom: 12px;">
          <strong>Progresso:</strong>
          <div style="background: #e9ecef; height: 25px; border-radius: 4px; overflow: hidden; margin-top: 8px;">
            <div style="background: linear-gradient(90deg, #28a745, #20c997); height: 100%; width: {{ $scei->getProgresso() }}%; display: flex; align-items: center; justify-content: center; color: white; font-weight: bold; transition: width 0.3s;">
              {{ $scei->getProgresso() }}%
            </div>
          </div>
        </div>
        <div style="margin-bottom: 12px;">
          <strong>Laboratório:</strong> {{ $scei->laboratorio?->name ?? '—' }}
        </div>
        <div style="margin-bottom: 12px;">
          <strong>Responsável:</strong> {{ $scei->responsavel?->name ?? '—' }}
        </div>
        <div style="margin-bottom: 12px;">
          <strong>Caso:</strong>
          @if($scei->caso)
            <a href="{{ route('casos.show', $scei->caso) }}">Caso {{ $scei->caso->numero }}</a>
          @else
            —
          @endif
        </div>
      </div>
    </div>

    <!-- Resultado -->
    <div style="margin-bottom: 30px;">
      <h5 style="margin-bottom: 15px; border-bottom: 2px solid #fd7e14; padding-bottom: 10px;">🧪 Resultado</h5>
      <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 20px;">
        <div>
          <strong>Resultado:</strong>
          <p style="margin-top: 8px; padding: 10px; background: #f8f9fa; border-radius: 4px;">{{ $scei->resultado ?? '—' }}</p>
        </div>
        <div>
          <strong>Valor do Resultado:</strong>
          <p style="margin-top: 8px; padding: 10px; background: #f8f9fa; border-radius: 4px;">{{ $scei->resultado_valor ?? '—' }}</p>
        </div>
        <div>
          <strong>Referência:</strong>
          <p style="margin-top: 8px; padding: 10px; background: #f8f9fa; border-radius: 4px;">{{ $scei->resultado_referencia ?? '—' }}</p>
        </div>
      </div>
      <div style="margin-top: 15px;">
        <strong>Unidade:</strong> {{ $scei->resultado_unidade ?? '—' }}
      </div>
    </div>

    <!-- Datas Importantes -->
    <div style="margin-bottom: 30px;">
      <h5 style="margin-bottom: 15px; border-bottom: 2px solid #6c757d; padding-bottom: 10px;">⏰ Datas Importantes</h5>
      <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
        <div>
          <strong>Data de Recebimento:</strong>
          <p>{{ $scei->data_recebimento?->format('d/m/Y H:i') ?? '—' }}</p>
        </div>
        <div>
          <strong>Data de Análise:</strong>
          <p>{{ $scei->data_analise?->format('d/m/Y H:i') ?? '—' }}</p>
        </div>
        <div>
          <strong>Data de Liberação:</strong>
          <p>{{ $scei->data_liberacao?->format('d/m/Y H:i') ?? '—' }}</p>
        </div>
        <div>
          <strong>Data do Laudo:</strong>
          <p>{{ $scei->data_laudo?->format('d/m/Y') ?? '—' }}</p>
        </div>
      </div>
    </div>

    <!-- Observações -->
    @if($scei->observacoes)
      <div style="margin-bottom: 30px;">
        <h5 style="margin-bottom: 15px; border-bottom: 2px solid #17a2b8; padding-bottom: 10px;">📝 Observações</h5>
        <div style="padding: 15px; background: #e7f3ff; border-left: 4px solid #17a2b8; border-radius: 4px;">
          {{ $scei->observacoes }}
        </div>
      </div>
    @endif

    <!-- Motivo de Cancelamento -->
    @if($scei->motivo_cancelamento)
      <div style="margin-bottom: 30px;">
        <h5 style="margin-bottom: 15px; border-bottom: 2px solid #dc3545; padding-bottom: 10px;">⛔ Motivo do Cancelamento</h5>
        <div style="padding: 15px; background: #ffe5e5; border-left: 4px solid #dc3545; border-radius: 4px;">
          {{ $scei->motivo_cancelamento }}
        </div>
      </div>
    @endif

    <!-- Auditoria -->
    <div style="margin-top: 30px; padding-top: 20px; border-top: 1px solid #ddd;">
      <h5 style="margin-bottom: 15px;">🔐 Auditoria</h5>
      <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; font-size: 12px; color: #666;">
        <div>
          <strong>Criado em:</strong> {{ $scei->created_at?->format('d/m/Y H:i') }}
        </div>
        <div>
          <strong>Atualizado em:</strong> {{ $scei->updated_at?->format('d/m/Y H:i') }}
        </div>
        @if($scei->deleted_at)
          <div>
            <strong>Deletado em:</strong> {{ $scei->deleted_at?->format('d/m/Y H:i') }}
          </div>
        @endif
      </div>
    </div>
  </div>

  <div style="padding: 15px; border-top: 1px solid #ddd; background: #f8f9fa;">
    <a href="{{ route('sceis.index') }}" class="btn btn-secondary">← Voltar à Lista</a>
  </div>
</div>
@endsection
