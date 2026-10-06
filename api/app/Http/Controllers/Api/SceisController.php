<?php

namespace App\Http\Controllers\Api;

use App\Models\Scei;
use App\Http\Requests\StoreSceiBatchRequest;
use App\Http\Requests\RegistrarFaseSceiRequest;
use App\Http\Resources\SceiResource;
use App\Repositories\SceiRepository;
use App\Services\SceiService;
use App\Enums\SceiFase;
use Illuminate\Http\Request;

class SceisController
{
    public function __construct(
        private SceiRepository $repository,
        private SceiService $service
    ) {
    }

    public function index()
    {
        return response()->json([
            'data' => SceiResource::collection($this->repository->paginate()),
        ]);
    }

    public function store(StoreSceiBatchRequest $request)
    {
        $data = $request->validated();

        $exames = $this->service->criarBatch(
            $data['caso_id'],
            $data['exames'],
            $data['data_coleta'],
            $data['responsavel_id'] ?? null,
            $data['observacoes'] ?? null
        );

        return response()->json([
            'message' => count($exames) . ' exame(s) criado(s)',
            'data' => SceiResource::collection($exames),
        ], 201);
    }

    public function show(Scei $scei)
    {
        return response()->json(new SceiResource($scei));
    }

    public function destroy(Scei $scei)
    {
        $this->repository->delete($scei);

        return response()->json(null, 204);
    }

    // Registrar Fase
    public function registrarFase(RegistrarFaseSceiRequest $request, Scei $scei)
    {
        try {
            $this->service->registrarFase(
                $scei,
                $request->input('nova_fase'),
                $request->input('resultado'),
                $request->input('motivo_cancelamento')
            );

            return response()->json([
                'message' => 'Fase registrada com sucesso',
                'data' => new SceiResource($scei->fresh()),
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Erro ao registrar fase',
                'error' => $e->getMessage(),
            ], 422);
        }
    }

    // Por Caso
    public function porCaso(Request $request)
    {
        $request->validate(['caso_id' => 'required|integer']);

        $exames = $this->service->obterPorCaso($request->input('caso_id'));

        return response()->json([
            'caso_id' => $request->input('caso_id'),
            'quantidade_exames' => count($exames),
            'valor_total' => $this->service->somaValoresExames($request->input('caso_id')),
            'data' => SceiResource::collection($exames),
        ]);
    }

    // Contagem por Fase
    public function contagemPorFase()
    {
        $contagem = $this->service->contagemPorFase();

        return response()->json([
            'total_exames' => Scei::count(),
            'por_fase' => $contagem,
        ]);
    }

    // Em Análise
    public function emAnalise()
    {
        $emAnalise = $this->service->emAnalise();

        return response()->json([
            'quantidade_em_analise' => count($emAnalise),
            'data' => SceiResource::collection(collect($emAnalise)),
        ]);
    }

    // Estados Válidos
    public function estadosValidos(Scei $scei)
    {
        $faseAtual = SceiFase::from($scei->scei_fase);
        $estadosPossiveis = [];

        foreach (SceiFase::cases() as $fase) {
            if ($faseAtual->canTransitionTo($fase)) {
                $estadosPossiveis[] = [
                    'fase_id' => $fase->value,
                    'fase_label' => $fase->label(),
                ];
            }
        }

        return response()->json([
            'fase_atual' => [
                'id' => $faseAtual->value,
                'label' => $faseAtual->label(),
            ],
            'estados_possiveis' => $estadosPossiveis,
        ]);
    }
}
