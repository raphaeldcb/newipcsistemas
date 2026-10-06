<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RegistrarFaseExtracacaoRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check();
    }

    public function rules(): array
    {
        return [
            'nova_fase' => 'required|integer',
            'resultado_fase_anterior' => 'nullable|array',
            'resultado_fase_anterior.concentracao' => 'nullable|numeric|min:0',
            'resultado_fase_anterior.qualidade' => 'nullable|numeric|min:0|max:100',
            'resultado_fase_anterior.valor1' => 'nullable|string|max:50',
            'resultado_fase_anterior.valor2' => 'nullable|string|max:50',
            'responsavel_id' => 'nullable|integer',
            'observacoes' => 'nullable|string|max:500',
            'motivo_falha' => 'nullable|string|max:500',
        ];
    }

    public function messages(): array
    {
        return [
            'nova_fase.required' => 'Nova fase é obrigatória',
            'concentracao.numeric' => 'Concentração deve ser um número',
            'qualidade.numeric' => 'Qualidade deve ser um número entre 0-100',
        ];
    }
}
