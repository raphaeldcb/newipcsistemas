<?php

namespace App\Http\Controllers\Api;

use App\Models\Caso;
use App\Repositories\CasoRepository;
use Illuminate\Http\Request;

class CasosController
{
    private CasoRepository $repository;

    public function __construct(CasoRepository $repository)
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
            'cas_contr' => 'required|integer',
            'pro_numero' => 'nullable|string|max:30',
            'cas_status' => 'nullable|integer'
        ]);

        $record = $this->repository->create($validated);
        return response()->json($record, 201);
    }

    public function show(Caso $record)
    {
        return response()->json($record);
    }

    public function update(Request $request, Caso $record)
    {
        $validated = $request->validate([
            'cas_contr' => 'required|integer',
            'pro_numero' => 'nullable|string|max:30',
            'cas_status' => 'nullable|integer'
        ]);

        $this->repository->update($record, $validated);
        return response()->json($record);
    }

    public function destroy(Caso $record)
    {
        $this->repository->delete($record);
        return response()->json(null, 204);
    }
}
