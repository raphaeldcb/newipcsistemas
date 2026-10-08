<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class WebAleloRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check();
    }

    public function rules(): array
    {
        return [
            'extracao_id' => 'required|integer|exists:tb_extracao,ext_cod',
            'tipo_alelo' => 'required|string|max:50|in:STR,SNP,mtDNA,Y-STR,AMELOGENINA',
            'marcador' => 'required|string|max:100',
            'alelo1' => 'required|string|max:50',
            'alelo2' => 'nullable|string|max:50',
            'genótipo' => 'nullable|string|max:100',
            'frequencia_alelo1' => 'nullable|numeric|min:0|max:1',
            'frequencia_alelo2' => 'nullable|numeric|min:0|max:1',
            'observacoes' => 'nullable|string|max:1000',
            'data_analise' => 'nullable|date_format:Y-m-d H:i',
        ];
    }

    public function messages(): array
    {
        return [
            'extracao_id.required' => 'Extração é obrigatória',
            'extracao_id.exists' => 'Extração não encontrada',
            'tipo_alelo.required' => 'Tipo de alelo é obrigatório',
            'tipo_alelo.in' => 'Tipo de alelo inválido',
            'marcador.required' => 'Marcador é obrigatório',
            'alelo1.required' => 'Alelo 1 é obrigatório',
            'data_analise.date_format' => 'Data de análise deve estar no formato YYYY-MM-DD HH:mm',
        ];
    }

    protected function prepareForValidation(): void
    {
        // Compute genótipo from alelo1 and alelo2 if not provided
        if (!$this->genótipo && ($this->alelo1 || $this->alelo2)) {
            $alelo1 = $this->alelo1 ?? '';
            $alelo2 = $this->alelo2 ?? '';
            $genótipo = trim("$alelo1/$alelo2", '/');
            $this->merge(['genótipo' => $genótipo ?: null]);
        }
    }
}
