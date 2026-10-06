<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreSceiBatchRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check();
    }

    public function rules(): array
    {
        return [
            'caso_id' => 'required|integer|exists:tb_casos,cas_contr',
            'exames' => 'required|array|min:1',
            'exames.*.tipo_exame' => 'required|string|max:50|in:HIV,Hepatite,TB,Dengue,Malária,Outro',
            'data_coleta' => 'required|date',
            'responsavel_id' => 'nullable|integer',
            'observacoes' => 'nullable|string|max:500',
        ];
    }

    public function messages(): array
    {
        return [
            'caso_id.required' => 'Caso é obrigatório',
            'exames.required' => 'Pelo menos um exame é obrigatório',
            'tipo_exame.in' => 'Tipo de exame inválido',
            'data_coleta.required' => 'Data de coleta é obrigatória',
        ];
    }
}
