<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Caso;

class CasosController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $casos = Caso::paginate(15);
        return view('casos.index', compact('casos'));
    }

    public function show(Caso $caso)
    {
        $caso->load('pessoas', 'comunicacoes', 'creditos');
        return view('casos.show', compact('caso'));
    }
}
