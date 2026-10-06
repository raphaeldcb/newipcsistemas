<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PessoaResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->pes_cod,
            'nome' => $this->pes_nome,
            'iniciais' => $this->pes_iniciais,
            'tipo_documento' => $this->pes_tdoc,
            'numero_documento' => $this->pes_ndoc,
            'sexo' => $this->pes_sexo,
            'data_nascimento' => $this->pes_dtnas,
            'local_nascimento' => $this->pes_lcnas,
            'status' => $this->pes_sit,
            'processo_id' => $this->pro_cod,
            'criado_em' => $this->created_at,
            'atualizado_em' => $this->updated_at,
            'deletado_em' => $this->deleted_at,
        ];
    }
}
