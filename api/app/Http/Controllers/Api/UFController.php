<?php

namespace App\Http\Controllers\Api;

use App\Models\UF;
use App\Repositories\UFRepository;
use Illuminate\Http\Request;

class UFController
{
    private UFRepository $repository;

    public function __construct(UFRepository $repository)
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
            'uf_desc' => 'nullable|string|max:20'
        ]);

        $record = $this->repository->create($validated);
        return response()->json($record, 201);
    }

    public function show(UF $record)
    {
        return response()->json($record);
    }

    public function update(Request $request, UF $record)
    {
        $validated = $request->validate([
            'uf_sigla' => 'required|string|max:2',
            'uf_desc' => 'nullable|string|max:20'
        ]);

        $this->repository->update($record, $validated);
        return response()->json($record);
    }

    public function destroy(UF $record)
    {
        $this->repository->delete($record);
        return response()->json(null, 204);
    }
}
