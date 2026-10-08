<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreCreditoRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check();
    }

    public function rules(): array
    {
        return [
            'caso_id' => 'required|integer|exists:tb_casos,cas_contr',
            'valor_base' => 'nullable|numeric|min:1|max:999999.99',
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
            'caso_id.required' => 'Caso é obrigatório',
            'caso_id.exists' => 'Caso não encontrado',
            'valor_base.min' => 'Valor base deve ser maior que zero',
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

    /**
     * Get the validated input
     */
    public function validated($key = null, $default = null)
    {
        $data = parent::validated($key, $default);

        if (is_array($data)) {
            // Set defaults if not provided
            $data['valor_base'] = $data['valor_base'] ?? 1000.00;
            $data['fator_1'] = $data['fator_1'] ?? 1.0;
            $data['fator_2'] = $data['fator_2'] ?? 1.0;
            $data['fator_3'] = $data['fator_3'] ?? 1.0;
            $data['fator_4'] = $data['fator_4'] ?? 1.0;
            $data['fator_5'] = $data['fator_5'] ?? 1.0;
            $data['num_parcelas'] = $data['num_parcelas'] ?? 3;
        }

        return $data;
    }
}
