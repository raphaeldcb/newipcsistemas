<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Enums\CreditoStatus;

class CreditoResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        $status = CreditoStatus::from($this->status ?? $this->cre_status ?? 'pendente');
        $valorCalculado = $this->valor_calculado ?? $this->cre_vlr ?? 0;
        $valorPago = $this->valor_pago ?? $this->cre_vlr_pago ?? 0;
        $saldo = $valorCalculado - $valorPago;

        return [
            'id' => $this->id_credito,
            'caso_id' => $this->caso_id,
            'valor_base' => (float) ($this->valor_base ?? 1000.00),
            'fator_1' => (float) ($this->fator_1 ?? 1.0),
            'fator_2' => (float) ($this->fator_2 ?? 1.0),
            'fator_3' => (float) ($this->fator_3 ?? 1.0),
            'fator_4' => (float) ($this->fator_4 ?? 1.0),
            'fator_5' => (float) ($this->fator_5 ?? 1.0),
            'valor_calculado' => (float) $valorCalculado,
            'valor_pago' => (float) $valorPago,
            'saldo' => (float) $saldo,
            'percentual_pago' => $valorCalculado > 0 ? round(($valorPago / $valorCalculado) * 100, 2) : 0,
            'num_parcelas' => (int) ($this->num_parcelas ?? 3),
            'status' => $status->value,
            'status_label' => $status->label(),
            'data_geracao' => $this->data_geracao ?? $this->created_at,
            'data_pagamento' => $this->data_pagamento,
            'data_cancelamento' => $this->data_cancelamento,
            'data_reversao' => $this->data_reversao,
            'motivo_cancelamento' => $this->motivo_cancelamento,
            'motivo_reversao' => $this->motivo_reversao,
            'observacoes' => $this->observacoes,
            'criado_em' => $this->created_at,
            'atualizado_em' => $this->updated_at,
            'parcelas_url' => route('api.creditos.parcelas', ['credito' => $this->id_credito]) ?? null,
        ];
    }
}
