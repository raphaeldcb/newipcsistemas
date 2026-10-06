<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Comunicacao;

class ComunicacoesController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $comunicacoes = Comunicacao::paginate(15);
        return view('comunicacoes.index', compact('comunicacoes'));
    }

    public function show(Comunicacao $comunicacao)
    {
        $comunicacao->load('responses', 'attachments', 'logs');
        return view('comunicacoes.show', compact('comunicacao'));
    }
}
