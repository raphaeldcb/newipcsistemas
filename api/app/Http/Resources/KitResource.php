<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Enums\KitStatus;

class KitResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        $status = KitStatus::from($this->kit_status);

        return [
            'id' => $this->kit_cod,
            'numero' => $this->kit_numero,
            'descricao' => $this->kit_descricao,
            'tipo' => $this->kit_tipo,
            'status' => $status->value,
            'status_label' => $status->label(),
            'local' => $this->kit_local,
            'coletador_id' => $this->coletador_id,
            'data_criacao' => $this->data_criacao,
            'data_vencimento' => $this->data_vencimento,
            'observacoes' => $this->observacoes,
            'criado_em' => $this->created_at,
            'atualizado_em' => $this->updated_at,
            'deletado_em' => $this->deleted_at,
            'rastreamento_url' => route('api.kits.rastreamento', ['kit' => $this->kit_cod]) ?? null,
        ];
    }
}
