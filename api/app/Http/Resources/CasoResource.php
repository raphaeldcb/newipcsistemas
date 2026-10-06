<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Enums\CasoStatus;

class CasoResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        $status = CasoStatus::from($this->cas_status);

        return [
            'id' => $this->cas_contr,
            'processo_id' => $this->pro_numero,
            'status' => $status->value,
            'status_label' => $status->label(),
            'juiz_id' => $this->jui_cod,
            'vara_id' => $this->var_cod,
            'uf_sigla' => $this->uf_sigla,
            'comarca_id' => $this->com_cod,
            'responsavel_id' => $this->responsavel_id,
            'coletador_id' => $this->coletador_id,
            'medico_id' => $this->medico_id,
            'data_ajuizamento' => $this->data_ajuizamento,
            'observacoes' => $this->observacoes,
            'criado_em' => $this->created_at,
            'atualizado_em' => $this->updated_at,
            'deletado_em' => $this->deleted_at,
            'historico_url' => route('api.casos.historico', ['caso' => $this->cas_contr]) ?? null,
        ];
    }
}
