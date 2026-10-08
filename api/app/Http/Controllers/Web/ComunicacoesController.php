<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Http\Requests\ComunicacaoRequest;
use App\Models\Comunicacao;
use App\Models\Caso;
use App\Services\ClassificacaoService;

class ComunicacoesController extends Controller
{
    protected $classificacao;


    public function index()
    {
        $query = Comunicacao::query();
        if (request('search')) {
            $search = request('search');
            $query->where('subject', 'like', "%$search%")
                  ->orWhere('email_from', 'like', "%$search%");
        }
        if (request('classification')) {
            $query->where('classification', request('classification'));
        }
        if (request('caso_id')) {
            $query->where('caso_id', request('caso_id'));
        }
        $comunicacoes = $query->paginate(15);
        return view('comunicacoes.index', compact('comunicacoes'));
    }

    public function create()
    {
        $casos = Caso::all();
        return view('comunicacoes.create', compact('casos'));
    }

    public function store(ComunicacaoRequest $request)
    {
        $comunicacao = Comunicacao::create($request->validated());
        $resultado = $this->classificacao->classificar($comunicacao->subject, $comunicacao->body);
        $comunicacao->update([
            'classification' => $resultado['classification'],
            'confidence' => $resultado['confidence'],
            'classified_at' => now(),
        ]);
        return redirect()->route('comunicacoes.show', $comunicacao)
                       ->with('success', 'Comunicação criada e classificada');
    }

    public function show(Comunicacao $comunicacao)
    {
        $comunicacao->load('responses', 'attachments', 'logs');
        return view('comunicacoes.show', compact('comunicacao'));
    }

    public function edit(Comunicacao $comunicacao)
    {
        $casos = Caso::all();
        return view('comunicacoes.edit', compact('comunicacao', 'casos'));
    }

    public function update(ComunicacaoRequest $request, Comunicacao $comunicacao)
    {
        $comunicacao->update($request->validated());
        return redirect()->route('comunicacoes.show', $comunicacao)
                       ->with('success', 'Comunicação atualizada');
    }

    public function destroy(Comunicacao $comunicacao)
    {
        $comunicacao->delete();
        return redirect()->route('comunicacoes.index')
                       ->with('success', 'Comunicação deletada');
    }
}
