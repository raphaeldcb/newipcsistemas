<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class AleloResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->cod_ale,
            'extracao_id' => $this->extracao_id,
            'tipo_alelo' => $this->tipo_alelo,
            'marcador' => $this->marcador,
            'alelo1' => $this->alelo1,
            'alelo2' => $this->alelo2,
            'genótipo' => $this->alelo1 . ($this->alelo2 ? '/' . $this->alelo2 : ''),
            'frequencia_alelo1' => $this->frequencia_alelo1,
            'frequencia_alelo2' => $this->frequencia_alelo2,
            'homozigoto' => $this->alelo1 === $this->alelo2,
            'observacoes' => $this->observacoes,
            'criado_em' => $this->created_at,
            'atualizado_em' => $this->updated_at,
        ];
    }
}
