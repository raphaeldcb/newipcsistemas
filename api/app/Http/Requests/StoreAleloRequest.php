<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreAleloRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check();
    }

    public function rules(): array
    {
        return [
            'extracao_id' => 'required|integer|exists:tb_extracao,ext_cod',
            'tipo_alelo' => 'required|string|max:20|in:STR,SNP,mtDNA,Y-STR,AMELOGENINA',
            'marcador' => 'required|string|max:50',
            'alelo1' => 'required|string|max:20',
            'alelo2' => 'nullable|string|max:20',
            'frequencia_alelo1' => 'nullable|numeric|min:0|max:1',
            'frequencia_alelo2' => 'nullable|numeric|min:0|max:1',
            'observacoes' => 'nullable|string|max:500',
        ];
    }

    public function messages(): array
    {
        return [
            'extracao_id.required' => 'Extração é obrigatória',
            'extracao_id.exists' => 'Extração não encontrada',
            'tipo_alelo.required' => 'Tipo de alelo é obrigatório',
            'marcador.required' => 'Marcador é obrigatório',
            'alelo1.required' => 'Alelo 1 é obrigatório',
        ];
    }
}
