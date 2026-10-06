<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Enums\CreditoStatus;

class CreditoResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        $status = CreditoStatus::from($this->cre_status);
        $saldo = $this->cre_vlr - ($this->cre_vlr_pago ?? 0);

        return [
            'id' => $this->id_credito,
            'caso_id' => $this->caso_id,
            'valor_total' => (float) $this->cre_vlr,
            'valor_pago' => (float) ($this->cre_vlr_pago ?? 0),
            'saldo' => (float) $saldo,
            'percentual_pago' => $this->cre_vlr > 0 ? round(($this->cre_vlr_pago ?? 0) / $this->cre_vlr * 100, 2) : 0,
            'status' => $status->value,
            'status_label' => $status->label(),
            'data_geracao' => $this->data_geracao,
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
