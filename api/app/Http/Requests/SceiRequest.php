<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SceiRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'amostra_id' => 'nullable|integer',
            'exame_tipo' => 'required|string|max:100',
            'resultado' => 'nullable|string|max:255',
            'data_exame' => 'required|date_format:Y-m-d H:i',
            'laboratorio_id' => 'nullable|integer|exists:users,id',
            'caso_id' => 'nullable|integer|exists:tb_casos,id',
            'scei_fase' => 'required|integer|between:1,7',
            'valor_exame' => 'nullable|numeric|min:0',
            'data_coleta' => 'nullable|date_format:Y-m-d',
            'responsavel_id' => 'nullable|integer|exists:users,id',
            'resultado_valor' => 'nullable|string|max:100',
            'resultado_referencia' => 'nullable|string|max:100',
            'resultado_unidade' => 'nullable|string|max:20',
            'observacoes' => 'nullable|string|max:500',
        ];
    }

    public function messages(): array
    {
        return [
            'exame_tipo.required' => 'Tipo de exame é obrigatório',
            'data_exame.required' => 'Data do exame é obrigatória',
            'scei_fase.required' => 'Fase é obrigatória',
            'laboratorio_id.exists' => 'Laboratório selecionado não existe',
            'caso_id.exists' => 'Caso selecionado não existe',
        ];
    }
}
