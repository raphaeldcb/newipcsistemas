<?php
namespace App\Http\Controllers\Web;
use App\Http\Controllers\Controller;
use App\Models\Processo;
use App\Models\Historico;
use App\Models\Pessoa;
use Illuminate\Http\Request;

class ProcessosController extends Controller {
    public function index() {
        $processos = Processo::paginate(15);
        return view('processos.index', compact('processos'));
    }

    public function create() {
        return view('processos.create');
    }

    public function store(Request $request) {
        $processo = Processo::create($request->all());
        return redirect()->route('processos.show', $processo->pro_cod)->with('success', 'Processo criado!');
    }

    public function show(Processo $processo) {
        $historicos = Historico::where('pro_cod', $processo->pro_cod)->get();
        $pessoas = Pessoa::where('pro_cod', $processo->pro_cod)->get();
        return view('processos.show', compact('processo', 'historicos', 'pessoas'));
    }

    public function edit(Processo $processo) {
        return view('processos.edit', compact('processo'));
    }

    public function update(Request $request, Processo $processo) {
        $processo->update($request->all());
        return redirect()->route('processos.show', $processo->pro_cod)->with('success', 'Processo atualizado!');
    }

    public function destroy(Processo $processo) {
        $processo->delete();
        return redirect()->route('processos.index')->with('success', 'Processo deletado!');
    }
}
