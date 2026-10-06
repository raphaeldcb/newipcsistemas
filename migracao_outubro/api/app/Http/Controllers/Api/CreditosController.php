<?php

namespace App\Http\Controllers\Api;

use App\Models\Credito;
use App\Repositories\CreditoRepository;
use Illuminate\Http\Request;

class CreditosController
{
    private CreditoRepository $repository;

    public function __construct(CreditoRepository $repository)
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
            'id_credito' => 'required|integer',
            'pro_cod' => 'nullable|integer',
            'cre_vlr' => 'nullable|decimal:14,2'
        ]);

        $record = $this->repository->create($validated);
        return response()->json($record, 201);
    }

    public function show(Credito $record)
    {
        return response()->json($record);
    }

    public function update(Request $request, Credito $record)
    {
        $validated = $request->validate([
            'id_credito' => 'required|integer',
            'pro_cod' => 'nullable|integer',
            'cre_vlr' => 'nullable|decimal:14,2'
        ]);

        $this->repository->update($record, $validated);
        return response()->json($record);
    }

    public function destroy(Credito $record)
    {
        $this->repository->delete($record);
        return response()->json(null, 204);
    }
}
