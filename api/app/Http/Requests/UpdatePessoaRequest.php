<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdatePessoaRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check();
    }

    public function rules(): array
    {
        return [
            'pes_nome' => 'string|max:60|min:3',
            'pes_iniciais' => 'nullable|string|max:10',
            'pes_tdoc' => 'nullable|string|max:30|in:CPF,RG,CNH,Passaporte',
            'pes_ndoc' => 'nullable|string|max:200|unique:tb_pessoas,pes_ndoc,' . $this->pessoa->pes_cod,
            'pes_sexo' => 'nullable|in:M,F',
            'pes_dtnas' => 'nullable|date|before:today',
            'pes_lcnas' => 'nullable|string|max:50',
        ];
    }
}
