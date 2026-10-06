<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateCasoRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check();
    }

    public function rules(): array
    {
        return [
            'pro_numero' => 'string|max:30|unique:tb_casos,pro_numero,' . $this->caso->cas_contr,
            'jui_cod' => 'integer|exists:tb_juiz,jui_cod',
            'var_cod' => 'integer|exists:tb_varas,var_cod',
            'responsavel_id' => 'nullable|integer',
            'coletador_id' => 'nullable|integer',
            'medico_id' => 'nullable|integer',
            'observacoes' => 'nullable|string|max:500',
        ];
    }
}
