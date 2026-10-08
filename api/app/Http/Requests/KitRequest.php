<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class KitRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'kit_num' => 'required|integer|unique:tb_kits,kit_num,' . ($this->kit->kit_cod ?? 'NULL'),
            'kit_status' => 'required|in:P,A,X',
            'col_cod' => 'nullable|integer',
            'kit_tip' => 'nullable|integer',
            'kit_denv' => 'nullable|date',
            'kit_dret' => 'nullable|date',
            'kit_cexa' => 'nullable|integer',
            'kit_rastrear' => 'nullable|string|max:20',
        ];
    }

    public function messages()
    {
        return [
            'kit_num.required' => 'Número do kit obrigatório',
            'kit_num.integer' => 'Número do kit deve ser inteiro',
            'kit_num.unique' => 'Este número de kit já existe',
            'kit_status.required' => 'Status obrigatório',
            'kit_status.in' => 'Status inválido',
            'kit_denv.date' => 'Data de envio deve ser uma data válida',
            'kit_dret.date' => 'Data de retorno deve ser uma data válida',
        ];
    }
}
