<?php

namespace App\Http\Controllers\Api;

use App\Models\Extracao;
use App\Http\Requests\StoreExtracacaoRequest;
use App\Http\Requests\RegistrarFaseExtracacaoRequest;
use App\Http\Resources\ExtracacaoResource;
use App\Repositories\ExtracaoRepository;
use App\Services\ExtracacaoService;
use App\Enums\ExtracacaoFase;
use Illuminate\Http\Request;

class ExtracoesController
{
    public function __construct(
        private ExtracaoRepository $repository,
        private ExtracacaoService $service
    ) {
    }

    public function index()
    {
        return response()->json([
            'data' => ExtracacaoResource::collection($this->repository->paginate()),
        ]);
    }

    public function store(StoreExtracacaoRequest $request)
    {
        $data = $request->validated();
        $data['ext_fase'] = ExtracacaoFase::PENDENTE->value;

        $extracao = $this->repository->create($data);

        return response()->json(
            new ExtracacaoResource($extracao),
            201
        );
    }

    public function show(Extracao $extracao)
    {
        return response()->json(new ExtracacaoResource($extracao));
    }

    public function destroy(Extracao $extracao)
    {
        $this->repository->delete($extracao);

        return response()->json(null, 204);
    }

    // Registrar Fase (avançar progressão)
    public function registrarFase(RegistrarFaseExtracacaoRequest $request, Extracao $extracao)
    {
        try {
            $this->service->registrarFase(
                $extracao,
                $request->input('nova_fase'),
                $request->input('resultado_fase_anterior'),
                $request->input('motivo_falha')
            );

            return response()->json([
                'message' => 'Fase registrada com sucesso',
                'data' => new ExtracacaoResource($extracao->fresh()),
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Erro ao registrar fase',
                'error' => $e->getMessage(),
            ], 422);
        }
    }

    // Obter Progresso
    public function progresso(Extracao $extracao)
    {
        return response()->json([
            'extracao_id' => $extracao->ext_cod,
            'progresso' => $this->service->obterProgresso($extracao),
        ]);
    }

    // Transições Válidas
    public function transicoesValidas(Extracao $extracao)
    {
        $faseAtual = ExtracacaoFase::from($extracao->ext_fase);
        $transicoesPossiveis = [];

        foreach (ExtracacaoFase::cases() as $fase) {
            if ($faseAtual->canTransitionTo($fase)) {
                $transicoesPossiveis[] = [
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
            'transicoes_possiveis' => $transicoesPossiveis,
        ]);
    }

    // Dashboard: Contagem por Fase
    public function contagemPorFase()
    {
        $contagem = $this->service->contarPorFase();

        return response()->json([
            'total_extracos' => Extracao::count(),
            'por_fase' => $contagem,
        ]);
    }

    // Dashboard: Em Progresso
    public function emProgresso()
    {
        $emProgresso = $this->service->obterEmProgresso();

        return response()->json([
            'quantidade_em_progresso' => count($emProgresso),
            'data' => ExtracacaoResource::collection(collect($emProgresso)),
        ]);
    }

    // Filtrar por Caso
    public function porCaso(Request $request)
    {
        $request->validate(['caso_id' => 'required|integer']);

        $extracos = Extracao::where('caso_id', $request->input('caso_id'))
            ->get();

        return response()->json([
            'caso_id' => $request->input('caso_id'),
            'quantidade' => $extracos->count(),
            'data' => ExtracacaoResource::collection($extracos),
        ]);
    }
}
