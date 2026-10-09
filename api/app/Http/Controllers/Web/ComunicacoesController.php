<?php
namespace App\Http\Controllers\Web;
use App\Http\Controllers\Controller;
use App\Models\Comunicacao;
use Illuminate\Http\Request;

class ComunicacoesController extends Controller {
    public function index(Request $request) {
        $busca = $request->input('busca');
        $filtro = $request->input('filtro', 'data');

        $query = Comunicacao::query();

        if ($busca) {
            $query->where(function($q) use ($busca) {
                $q->where('subject', 'like', "%$busca%")
                  ->orWhere('email_from', 'like', "%$busca%")
                  ->orWhere('email_to', 'like', "%$busca%");
            });
        }

        if ($filtro === 'data') {
            $query->orderByDesc('created_at');
        } elseif ($filtro === 'assunto') {
            $query->orderBy('subject');
        } else {
            $query->orderByDesc('id');
        }

        $comunicacoes = $query->paginate(15);

        return view('comunicacoes.index', compact('comunicacoes', 'busca', 'filtro'));
    }

    public function create() {
        return view('comunicacoes.create');
    }

    public function store(Request $request) {
        $comunicacao = Comunicacao::create($request->all());
        return redirect()->route('comunicacoes.show', $comunicacao->id)->with('success', 'Comunicação criada!');
    }

    public function show(Comunicacao $comunicacao) {
        return view('comunicacoes.show', compact('comunicacao'));
    }

    public function edit(Comunicacao $comunicacao) {
        return view('comunicacoes.edit', compact('comunicacao'));
    }

    public function update(Request $request, Comunicacao $comunicacao) {
        $comunicacao->update($request->all());
        return redirect()->route('comunicacoes.show', $comunicacao->id)->with('success', 'Comunicação atualizada!');
    }

    public function destroy(Comunicacao $comunicacao) {
        $comunicacao->delete();
        return redirect()->route('comunicacoes.index')->with('success', 'Comunicação deletada!');
    }
}
