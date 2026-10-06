<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StorePessoaRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check();
    }

    public function rules(): array
    {
        return [
            'pes_nome' => 'required|string|max:60|min:3',
            'pes_iniciais' => 'nullable|string|max:10',
            'pes_tdoc' => 'nullable|string|max:30|in:CPF,RG,CNH,Passaporte',
            'pes_ndoc' => 'nullable|string|max:200|unique:tb_pessoas,pes_ndoc',
            'pes_sexo' => 'nullable|in:M,F',
            'pes_dtnas' => 'nullable|date|before:today',
            'pes_lcnas' => 'nullable|string|max:50',
            'pro_cod' => 'nullable|integer',
        ];
    }

    public function messages(): array
    {
        return [
            'pes_nome.required' => 'Nome da pessoa é obrigatório',
            'pes_nome.min' => 'Nome deve ter pelo menos 3 caracteres',
            'pes_ndoc.unique' => 'Documento já existe no sistema',
            'pes_dtnas.before' => 'Data de nascimento deve ser anterior a hoje',
        ];
    }
}
