<?php
namespace App\Http\Controllers\Web;
use App\Http\Controllers\Controller;
use App\Models\Comunicacao;

class ComunicacoesController extends Controller {
    public function index() {
        $comunicacoes = Comunicacao::paginate(15);
        return view('comunicacoes.index', compact('comunicacoes'));
    }
}
