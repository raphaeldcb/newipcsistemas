<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreKitRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check();
    }

    public function rules(): array
    {
        return [
            'kit_numero' => 'required|string|max:50|unique:tb_kits,kit_numero',
            'kit_descricao' => 'nullable|string|max:200',
            'kit_tipo' => 'required|string|max:30|in:Coleta,Extração,Amplificação',
            'kit_local' => 'nullable|string|max:50',
            'coletador_id' => 'nullable|integer',
            'data_criacao' => 'required|date',
            'data_vencimento' => 'nullable|date|after:data_criacao',
            'observacoes' => 'nullable|string|max:500',
        ];
    }

    public function messages(): array
    {
        return [
            'kit_numero.required' => 'Número do kit é obrigatório',
            'kit_numero.unique' => 'Kit com este número já existe',
            'kit_tipo.required' => 'Tipo de kit é obrigatório',
            'kit_tipo.in' => 'Tipo deve ser: Coleta, Extração ou Amplificação',
            'data_vencimento.after' => 'Data de vencimento deve ser após data de criação',
        ];
    }
}
