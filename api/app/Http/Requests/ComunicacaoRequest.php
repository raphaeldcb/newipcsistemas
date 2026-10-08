<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ComunicacaoRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'email_from' => 'required|email|max:255',
            'email_to' => 'required|email|max:255',
            'subject' => 'required|string|max:255',
            'body' => 'required|string',
            'caso_id' => 'nullable|exists:casos,id',
        ];
    }

    public function messages()
    {
        return [
            'email_from.required' => 'Email de origem obrigatório',
            'email_to.required' => 'Email de destino obrigatório',
            'subject.required' => 'Assunto obrigatório',
            'body.required' => 'Corpo obrigatório',
        ];
    }
}
