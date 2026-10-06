<?php

namespace App\Http\Controllers\Api;

use App\Models\Juiz;
use App\Repositories\JuizRepository;
use Illuminate\Http\Request;

class JuizesController
{
    private JuizRepository $repository;

    public function __construct(JuizRepository $repository)
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
            'jui_cod' => 'required|integer',
            'jui_nome' => 'nullable|string|max:60',
            'jui_oab' => 'nullable|string|max:20'
        ]);

        $record = $this->repository->create($validated);
        return response()->json($record, 201);
    }

    public function show(Juiz $record)
    {
        return response()->json($record);
    }

    public function update(Request $request, Juiz $record)
    {
        $validated = $request->validate([
            'jui_cod' => 'required|integer',
            'jui_nome' => 'nullable|string|max:60',
            'jui_oab' => 'nullable|string|max:20'
        ]);

        $this->repository->update($record, $validated);
        return response()->json($record);
    }

    public function destroy(Juiz $record)
    {
        $this->repository->delete($record);
        return response()->json(null, 204);
    }
}
