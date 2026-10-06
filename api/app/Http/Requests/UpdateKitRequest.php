<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateKitRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check();
    }

    public function rules(): array
    {
        return [
            'kit_numero' => 'string|max:50|unique:tb_kits,kit_numero,' . $this->kit->kit_cod,
            'kit_descricao' => 'nullable|string|max:200',
            'kit_tipo' => 'string|max:30|in:Coleta,Extração,Amplificação',
            'kit_local' => 'nullable|string|max:50',
            'coletador_id' => 'nullable|integer',
            'data_vencimento' => 'nullable|date',
            'observacoes' => 'nullable|string|max:500',
        ];
    }
}
