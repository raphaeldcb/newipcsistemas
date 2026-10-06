<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Enums\ExtracacaoFase;

class ExtracacaoResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        $fase = ExtracacaoFase::from($this->ext_fase);

        return [
            'id' => $this->ext_cod,
            'caso_id' => $this->caso_id,
            'amostra_tipo' => $this->amostra_tipo,
            'volume_inicial' => $this->volume_inicial,
            'unidade_volume' => $this->unidade_volume,
            'fase_atual' => $fase->value,
            'fase_label' => $fase->label(),
            'fase_numero' => $fase->fase(),
            'data_coleta' => $this->data_coleta,
            'responsavel_extracao_id' => $this->responsavel_extracao_id,
            'data_extracao' => $this->data_extracao,
            'concentracao_dna' => $this->concentracao_dna,
            'qualidade_dna' => $this->qualidade_dna,
            'observacoes' => $this->observacoes,
            'criado_em' => $this->created_at,
            'atualizado_em' => $this->updated_at,
            'progresso' => [
                'fase_1_completa' => $fase->fase() >= 1,
                'fase_2_completa' => $fase->fase() >= 2,
                'fase_3_completa' => $fase->fase() === 3,
                'percentual' => ($fase->fase() / 3) * 100,
            ],
        ];
    }
}
