<?php

namespace App\Http\Controllers\Api;

use App\Models\Pessoa;
use App\Repositories\PessoaRepository;
use Illuminate\Http\Request;

class PessoasController
{
    private PessoaRepository $repository;

    public function __construct(PessoaRepository $repository)
    {
        $this->repository = $repository;
    }

    public function index()
    {
        return response()->json($this->repository->paginate());
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'pes_nome' => 'required|string|max:60',
            'pes_iniciais' => 'nullable|string|max:10',
            'pes_tdoc' => 'nullable|string|max:30',
            'pes_ndoc' => 'nullable|string|max:200',
            'pes_sexo' => 'nullable|in:M,F',
            'pes_dtnas' => 'nullable|date',
        ]);

        $pessoa = $this->repository->create($validated);
        return response()->json($pessoa, 201);
    }

    public function show(Pessoa $pessoa)
    {
        return response()->json($pessoa);
    }

    public function update(Request $request, Pessoa $pessoa)
    {
        $validated = $request->validate([
            'pes_nome' => 'string|max:60',
            'pes_iniciais' => 'nullable|string|max:10',
            'pes_tdoc' => 'nullable|string|max:30',
            'pes_ndoc' => 'nullable|string|max:200',
            'pes_sexo' => 'nullable|in:M,F',
            'pes_dtnas' => 'nullable|date',
        ]);

        $this->repository->update($pessoa, $validated);
        return response()->json($pessoa);
    }

    public function destroy(Pessoa $pessoa)
    {
        $this->repository->delete($pessoa);
        return response()->json(null, 204);
    }
}
