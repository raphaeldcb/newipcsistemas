<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Enums\SceiFase;

class SceiResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        $fase = SceiFase::from($this->scei_fase);

        return [
            'id' => $this->scei_cod,
            'caso_id' => $this->caso_id,
            'tipo_exame' => $this->tipo_exame,
            'fase_atual' => $fase->value,
            'fase_label' => $fase->label(),
            'data_coleta' => $this->data_coleta,
            'responsavel_id' => $this->responsavel_id,
            'valor_exame' => $this->valor_exame,
            'data_analise' => $this->data_analise,
            'resultado_valor' => $this->resultado_valor,
            'resultado_referencia' => $this->resultado_referencia,
            'resultado_unidade' => $this->resultado_unidade,
            'data_liberacao' => $this->data_liberacao,
            'data_laudo' => $this->data_laudo,
            'status_laudo' => $this->status_laudo,
            'observacoes' => $this->observacoes,
            'criado_em' => $this->created_at,
            'atualizado_em' => $this->updated_at,
            'progresso' => [
                'fase_completa' => $fase->value >= 6,
                'percentual' => ($fase->value / 6) * 100,
            ],
        ];
    }
}
