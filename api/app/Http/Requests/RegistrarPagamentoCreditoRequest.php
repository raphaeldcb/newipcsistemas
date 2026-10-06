<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RegistrarPagamentoCreditoRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check();
    }

    public function rules(): array
    {
        return [
            'valor' => 'required|numeric|min:0.01',
            'data_pagamento' => 'nullable|date',
            'forma_pagamento' => 'nullable|string|max:50|in:Dinheiro,Cheque,TED,Débito,Crédito',
            'motivo' => 'nullable|string|max:500',
        ];
    }

    public function messages(): array
    {
        return [
            'valor.required' => 'Valor é obrigatório',
            'valor.min' => 'Valor deve ser maior que zero',
        ];
    }
}
