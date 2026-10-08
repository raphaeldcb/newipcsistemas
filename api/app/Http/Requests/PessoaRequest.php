<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PessoaRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        $pessoaId = $this->route('pessoa')?->pes_cod ?? null;
        $uniqueRule = $pessoaId ? "unique:tb_pessoas,documento,$pessoaId,pes_cod" : 'unique:tb_pessoas,documento';

        return [
            'nome' => 'required|string|max:255',
            'tipo' => 'required|in:FISICA,JURIDICA',
            'documento' => "nullable|string|max:20|$uniqueRule",
            'email' => 'nullable|email|max:255',
            'telefone' => 'nullable|string|max:20',
        ];
    }

    /**
     * Get custom messages for validation errors.
     */
    public function messages(): array
    {
        return [
            'nome.required' => 'Nome é obrigatório',
            'nome.max' => 'Nome não pode exceder 255 caracteres',
            'tipo.required' => 'Tipo de pessoa é obrigatório',
            'tipo.in' => 'Tipo deve ser Física ou Jurídica',
            'documento.unique' => 'Este documento já está registrado',
            'documento.max' => 'Documento não pode exceder 20 caracteres',
            'email.email' => 'Email inválido',
            'email.max' => 'Email não pode exceder 255 caracteres',
            'telefone.max' => 'Telefone não pode exceder 20 caracteres',
        ];
    }
}
