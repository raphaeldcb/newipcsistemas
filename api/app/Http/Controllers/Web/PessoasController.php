<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Http\Requests\PessoaRequest;
use App\Models\Pessoa;

class PessoasController extends Controller
{

    public function index()
    {
        $query = Pessoa::query();

        if (request('search')) {
            $search = request('search');
            $query->where('nome', 'like', "%$search%")
                  ->orWhere('documento', 'like', "%$search%");
        }

        if (request('tipo')) {
            $query->where('tipo', request('tipo'));
        }

        $pessoas = $query->paginate(15);
        return view('pessoas.index', compact('pessoas'));
    }

    public function create()
    {
        return view('pessoas.create');
    }

    public function store(PessoaRequest $request)
    {
        $pessoa = Pessoa::create($request->validated());
        return redirect()->route('pessoas.show', $pessoa)
                       ->with('success', 'Pessoa criada com sucesso');
    }

    public function show(Pessoa $pessoa)
    {
        $pessoa->load('casos', 'enderecos');
        return view('pessoas.show', compact('pessoa'));
    }

    public function edit(Pessoa $pessoa)
    {
        return view('pessoas.edit', compact('pessoa'));
    }

    public function update(PessoaRequest $request, Pessoa $pessoa)
    {
        $pessoa->update($request->validated());
        return redirect()->route('pessoas.show', $pessoa)
                       ->with('success', 'Pessoa atualizada com sucesso');
    }

    public function destroy(Pessoa $pessoa)
    {
        $pessoa->delete();
        return redirect()->route('pessoas.index')
                       ->with('success', 'Pessoa deletada com sucesso');
    }
}
