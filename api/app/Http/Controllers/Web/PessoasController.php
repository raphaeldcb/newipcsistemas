<?php
namespace App\Http\Controllers\Web;
use App\Http\Controllers\Controller;
use App\Models\Pessoa;

class PessoasController extends Controller {
    public function index() {
        $pessoas = Pessoa::paginate(15);
        return view('pessoas.index', compact('pessoas'));
    }
}
