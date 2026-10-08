<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateCreditoRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check();
    }

    public function rules(): array
    {
        return [
            'fator_1' => 'nullable|numeric|min:0.1|max:3.0',
            'fator_2' => 'nullable|numeric|min:0.1|max:3.0',
            'fator_3' => 'nullable|numeric|min:0.1|max:3.0',
            'fator_4' => 'nullable|numeric|min:0.1|max:3.0',
            'fator_5' => 'nullable|numeric|min:0.1|max:3.0',
            'num_parcelas' => 'nullable|integer|min:1|max:12',
            'valor_calculado' => 'nullable|numeric|min:0.01',
        ];
    }

    public function messages(): array
    {
        return [
            'fator_1.min' => 'Fator 1 deve ser no mínimo 0.1',
            'fator_1.max' => 'Fator 1 deve ser no máximo 3.0',
            'fator_2.min' => 'Fator 2 deve ser no mínimo 0.1',
            'fator_2.max' => 'Fator 2 deve ser no máximo 3.0',
            'fator_3.min' => 'Fator 3 deve ser no mínimo 0.1',
            'fator_3.max' => 'Fator 3 deve ser no máximo 3.0',
            'fator_4.min' => 'Fator 4 deve ser no mínimo 0.1',
            'fator_4.max' => 'Fator 4 deve ser no máximo 3.0',
            'fator_5.min' => 'Fator 5 deve ser no mínimo 0.1',
            'fator_5.max' => 'Fator 5 deve ser no máximo 3.0',
            'num_parcelas.min' => 'Número de parcelas deve ser no mínimo 1',
            'num_parcelas.max' => 'Número de parcelas pode ser no máximo 12',
        ];
    }
}
