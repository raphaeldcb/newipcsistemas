<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreCasoRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check();
    }

    public function rules(): array
    {
        return [
            'pro_numero' => 'required|string|max:30|unique:tb_casos,pro_numero',
            'jui_cod' => 'required|integer|exists:tb_juiz,jui_cod',
            'var_cod' => 'required|integer|exists:tb_varas,var_cod',
            'uf_sigla' => 'required|string|max:2|exists:tb_uf,uf_sigla',
            'com_cod' => 'required|integer|exists:tb_comarca,com_cod',
            'data_ajuizamento' => 'required|date',
            'responsavel_id' => 'nullable|integer',
            'coletador_id' => 'nullable|integer',
            'medico_id' => 'nullable|integer',
            'observacoes' => 'nullable|string|max:500',
        ];
    }

    public function messages(): array
    {
        return [
            'pro_numero.required' => 'Número do processo é obrigatório',
            'pro_numero.unique' => 'Processo já existe no sistema',
            'jui_cod.required' => 'Juiz é obrigatório',
            'jui_cod.exists' => 'Juiz selecionado não existe',
            'data_ajuizamento.required' => 'Data de ajuizamento é obrigatória',
            'data_ajuizamento.date' => 'Data deve ser válida',
        ];
    }
}
