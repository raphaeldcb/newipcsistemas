<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ExtracacaoRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'amostra_id' => 'nullable|integer|exists:amostras,id',
            'fase' => 'required|in:QUANTIFICACAO,QUALIFICACAO,INTERPRETACAO',
            'status' => 'required|string|max:50',
            'resultado' => 'nullable|string',
            'data_fase' => 'nullable|date_format:Y-m-d H:i',
            'observacoes' => 'nullable|string',
        ];
    }

    public function messages()
    {
        return [
            'amostra_id.exists' => 'Amostra não encontrada',
            'fase.required' => 'Fase obrigatória',
            'fase.in' => 'Fase inválida',
            'status.required' => 'Status obrigatório',
            'data_fase.date_format' => 'Data da fase em formato inválido',
        ];
    }
}
