<?php

namespace App\Http\Controllers\Api;

use App\Models\Kit;
use App\Http\Requests\StoreKitRequest;
use App\Http\Requests\UpdateKitRequest;
use App\Http\Resources\KitResource;
use App\Repositories\KitRepository;
use App\Services\KitService;
use App\Enums\KitStatus;
use Illuminate\Http\Request;

class KitsController
{
    public function __construct(
        private KitRepository $repository,
        private KitService $service
    ) {
    }

    public function index()
    {
        return response()->json([
            'data' => KitResource::collection($this->repository->paginate()),
        ]);
    }

    public function store(StoreKitRequest $request)
    {
        $data = $request->validated();
        $data['kit_status'] = KitStatus::DISPONIVEL->value;

        $kit = $this->repository->create($data);

        return response()->json(
            new KitResource($kit),
            201
        );
    }

    public function show(Kit $kit)
    {
        return response()->json(new KitResource($kit));
    }

    public function update(UpdateKitRequest $request, Kit $kit)
    {
        $this->repository->update($kit, $request->validated());

        return response()->json(new KitResource($kit->fresh()));
    }

    public function destroy(Kit $kit)
    {
        $this->repository->delete($kit);

        return response()->json(null, 204);
    }

    // Rastreamento de Kit
    public function rastrear(Request $request, Kit $kit)
    {
        $request->validate([
            'novo_status' => 'required|integer',
            'local' => 'nullable|string|max:50',
            'motivo' => 'nullable|string|max:500',
        ]);

        try {
            $this->service->rastrear(
                $kit,
                $request->input('novo_status'),
                $request->input('local'),
                $request->input('motivo')
            );

            return response()->json([
                'message' => 'Kit rastreado com sucesso',
                'data' => new KitResource($kit->fresh()),
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Erro ao rastrear kit',
                'error' => $e->getMessage(),
            ], 422);
        }
    }

    // Listar Rastreamento
    public function rastreamento(Kit $kit)
    {
        return response()->json([
            'kit_id' => $kit->kit_cod,
            'kit_numero' => $kit->kit_numero,
            'status_atual' => [
                'id' => $kit->kit_status,
                'label' => KitStatus::from($kit->kit_status)->label(),
            ],
            'local_atual' => $kit->kit_local,
            'coletador_responsavel' => $kit->coletador_id,
            'data_criacao' => $kit->data_criacao,
            'data_vencimento' => $kit->data_vencimento,
            'data_ultima_movimentacao' => $kit->updated_at,
            'dias_vencido' => $kit->data_vencimento ? $kit->data_vencimento->diffInDays(now()) : null,
        ]);
    }

    // Estados Válidos
    public function estadosValidos(Kit $kit)
    {
        $statusAtual = KitStatus::from($kit->kit_status);
        $estadosPossiveis = [];

        foreach (KitStatus::cases() as $status) {
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

    // Verificar Vencimentos
    public function verificarVencimentos()
    {
        $resultado = $this->service->verificarVencimento();

        return response()->json([
            'message' => $resultado['total_vencidos'] > 0
                ? "{$resultado['total_vencidos']} kits vencidos"
                : 'Nenhum kit vencido',
            'data' => $resultado,
        ]);
    }

    // Kits por Local
    public function porLocal(Request $request)
    {
        $request->validate(['local' => 'required|string|max:50']);

        $kits = $this->service->obterPorLocal($request->input('local'));

        return response()->json([
            'local' => $request->input('local'),
            'quantidade' => $kits->count(),
            'data' => KitResource::collection($kits),
        ]);
    }

    // Kits por Coletador
    public function porColetador(Request $request)
    {
        $request->validate(['coletador_id' => 'required|integer']);

        $kits = $this->service->obterPorColetador($request->input('coletador_id'));

        return response()->json([
            'coletador_id' => $request->input('coletador_id'),
            'quantidade_em_uso' => $kits->count(),
            'data' => KitResource::collection($kits),
        ]);
    }

    // Contagem por Status
    public function contagemPorStatus()
    {
        $contagem = $this->service->contagemPorStatus();

        return response()->json([
            'total_kits' => Kit::count(),
            'por_status' => $contagem,
        ]);
    }
}
