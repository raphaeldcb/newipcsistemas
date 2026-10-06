<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Pessoa;

class PessoasController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $pessoas = Pessoa::paginate(15);
        return view('pessoas.index', compact('pessoas'));
    }

    public function show(Pessoa $pessoa)
    {
        $pessoa->load('casos', 'enderecos');
        return view('pessoas.show', compact('pessoa'));
    }
}
