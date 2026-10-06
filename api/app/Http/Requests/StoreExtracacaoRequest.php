<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreExtracacaoRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check();
    }

    public function rules(): array
    {
        return [
            'caso_id' => 'required|integer|exists:tb_casos,cas_contr',
            'amostra_tipo' => 'required|string|max:50|in:Sangue,Saliva,Tecido,Osso,Cabelo,Outro',
            'volume_inicial' => 'required|numeric|min:0.1|max:100',
            'unidade_volume' => 'required|string|max:5|in:mL,µL,mg',
            'data_coleta' => 'required|date|before_or_equal:today',
            'responsavel_extracao_id' => 'nullable|integer',
            'observacoes' => 'nullable|string|max:500',
        ];
    }

    public function messages(): array
    {
        return [
            'caso_id.required' => 'Caso é obrigatório',
            'amostra_tipo.required' => 'Tipo de amostra é obrigatório',
            'volume_inicial.required' => 'Volume inicial é obrigatório',
            'volume_inicial.min' => 'Volume deve ser maior que 0',
            'data_coleta.required' => 'Data de coleta é obrigatória',
        ];
    }
}
