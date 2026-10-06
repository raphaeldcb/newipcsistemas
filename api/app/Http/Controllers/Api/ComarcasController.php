<?php

namespace App\Http\Controllers\Api;

use App\Models\Comarca;
use App\Repositories\ComarcaRepository;
use Illuminate\Http\Request;

class ComarcasController
{
    private ComarcaRepository $repository;

    public function __construct(ComarcaRepository $repository)
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
            'uf_sigla' => 'required|string|max:2',
            'com_cod' => 'required|integer',
            'com_desc' => 'nullable|string|max:40',
            'com_sigla' => 'nullable|string|max:2'
        ]);

        $record = $this->repository->create($validated);
        return response()->json($record, 201);
    }

    public function show(Comarca $record)
    {
        return response()->json($record);
    }

    public function update(Request $request, Comarca $record)
    {
        $validated = $request->validate([
            'uf_sigla' => 'required|string|max:2',
            'com_cod' => 'required|integer',
            'com_desc' => 'nullable|string|max:40',
            'com_sigla' => 'nullable|string|max:2'
        ]);

        $this->repository->update($record, $validated);
        return response()->json($record);
    }

    public function destroy(Comarca $record)
    {
        $this->repository->delete($record);
        return response()->json(null, 204);
    }
}
