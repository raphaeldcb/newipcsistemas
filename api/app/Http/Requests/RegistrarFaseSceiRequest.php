<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RegistrarFaseSceiRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check();
    }

    public function rules(): array
    {
        return [
            'nova_fase' => 'required|integer',
            'resultado' => 'nullable|array',
            'resultado.valor' => 'nullable|string|max:100',
            'resultado.referencia' => 'nullable|string|max:100',
            'resultado.unidade' => 'nullable|string|max:20',
            'responsavel_id' => 'nullable|integer',
            'observacoes' => 'nullable|string|max:500',
            'motivo_cancelamento' => 'nullable|string|max:500',
        ];
    }
}
