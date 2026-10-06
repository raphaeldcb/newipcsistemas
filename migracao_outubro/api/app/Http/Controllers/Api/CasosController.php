<?php

namespace App\Http\Controllers\Api;

use App\Models\Caso;
use App\Http\Requests\StoreCasoRequest;
use App\Http\Requests\UpdateCasoRequest;
use App\Http\Resources\CasoResource;
use App\Repositories\CasoRepository;
use App\Services\CasoService;
use App\Enums\CasoStatus;
use Illuminate\Http\Request;

class CasosController
{
    public function __construct(
        private CasoRepository $repository,
        private CasoService $service
    ) {
    }

    public function index()
    {
        return response()->json([
            'data' => CasoResource::collection($this->repository->paginate()),
        ]);
    }

    public function store(StoreCasoRequest $request)
    {
        $data = $request->validated();
        $data['cas_status'] = CasoStatus::PENDENTE->value;

        $caso = $this->repository->create($data);

        return response()->json(
            new CasoResource($caso),
            201
        );
    }

    public function show(Caso $caso)
    {
        return response()->json(new CasoResource($caso));
    }

    public function update(UpdateCasoRequest $request, Caso $caso)
    {
        $this->repository->update($caso, $request->validated());

        return response()->json(new CasoResource($caso->fresh()));
    }

    public function destroy(Caso $caso)
    {
        $this->repository->delete($caso);

        return response()->json(null, 204);
    }

    // Transição de Estado (State Machine)
    public function transicionar(Request $request, Caso $caso)
    {
        $request->validate([
            'novo_status' => 'required|integer',
            'motivo' => 'nullable|string|max:500',
        ]);

        try {
            $this->service->transicionar(
                $caso,
                $request->input('novo_status'),
                $request->input('motivo')
            );

            return response()->json([
                'message' => 'Caso transicionado com sucesso',
                'data' => new CasoResource($caso->fresh()),
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Erro na transição',
                'error' => $e->getMessage(),
            ], 422);
        }
    }

    // Listar Histórico
    public function historico(Caso $caso)
    {
        $historico = $caso->historicos()
            ->orderBy('his_data', 'desc')
            ->paginate(20);

        return response()->json([
            'data' => $historico->items(),
            'links' => $historico->getUrlRange(1, $historico->lastPage()),
            'meta' => [
                'total' => $historico->total(),
                'per_page' => $historico->perPage(),
                'current_page' => $historico->currentPage(),
            ],
        ]);
    }

    // Estados Válidos para Transição
    public function estadosValidos(Caso $caso)
    {
        $statusAtual = CasoStatus::from($caso->cas_status);
        $estadosPossiveis = [];

        foreach (CasoStatus::cases() as $status) {
            if ($statusAtual->canTransitionTo($status)) {
                $estadosPossiveis[] = [
                    'id' => $status->value,
                    'label' => $status->label(),
                ];
            }
        }

        return response()->json([
            'estado_atual' => [
                'id' => $statusAtual->value,
                'label' => $statusAtual->label(),
            ],
            'estados_possiveis' => $estadosPossiveis,
        ]);
    }
}
