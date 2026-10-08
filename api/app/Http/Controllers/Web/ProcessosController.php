<?php
namespace App\Http\Controllers\Web;
use App\Http\Controllers\Controller;
use App\Models\Processo;
use App\Models\Historico;

class ProcessosController extends Controller {
    public function index() {
        $processos = Processo::paginate(15);
        return view('processos.index', compact('processos'));
    }

    public function show(Processo $processo) {
        $historicos = Historico::where('pro_cod', $processo->pro_cod)->get();
        return view('processos.show', compact('processo', 'historicos'));
    }
}
