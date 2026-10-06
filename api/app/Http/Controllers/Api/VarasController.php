<?php

namespace App\Http\Controllers\Api;

use App\Models\Vara;
use App\Repositories\VaraRepository;
use Illuminate\Http\Request;

class VarasController
{
    private VaraRepository $repository;

    public function __construct(VaraRepository $repository)
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
            'var_cod' => 'required|integer',
            'var_desc' => 'nullable|string|max:60'
        ]);

        $record = $this->repository->create($validated);
        return response()->json($record, 201);
    }

    public function show(Vara $record)
    {
        return response()->json($record);
    }

    public function update(Request $request, Vara $record)
    {
        $validated = $request->validate([
            'uf_sigla' => 'required|string|max:2',
            'com_cod' => 'required|integer',
            'var_cod' => 'required|integer',
            'var_desc' => 'nullable|string|max:60'
        ]);

        $this->repository->update($record, $validated);
        return response()->json($record);
    }

    public function destroy(Vara $record)
    {
        $this->repository->delete($record);
        return response()->json(null, 204);
    }
}
