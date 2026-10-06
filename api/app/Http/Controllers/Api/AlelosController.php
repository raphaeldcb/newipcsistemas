<?php

namespace App\Http\Controllers\Api;

use App\Models\Alelo;
use App\Http\Requests\StoreAleloRequest;
use App\Http\Resources\AleloResource;
use App\Repositories\AleloRepository;
use App\Services\AleloService;
use Illuminate\Http\Request;

class AlelosController
{
    public function __construct(
        private AleloRepository $repository,
        private AleloService $service
    ) {
    }

    public function index()
    {
        return response()->json([
            'data' => AleloResource::collection($this->repository->paginate()),
        ]);
    }

    public function store(StoreAleloRequest $request)
    {
        try {
            $alelos = $this->service->registrarAlelos(
                $request->input('extracao_id'),
                [$request->validated()]
            );

            return response()->json([
                'message' => '1 alelo registrado',
                'data' => AleloResource::collection($alelos),
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Erro ao registrar alelo',
                'error' => $e->getMessage(),
            ], 422);
        }
    }

    public function show(Alelo $alelo)
    {
        return response()->json(new AleloResource($alelo));
    }

    public function destroy(Alelo $alelo)
    {
        $this->repository->delete($alelo);

        return response()->json(null, 204);
    }

    // Registrar batch de alelos
    public function registrarBatch(Request $request)
    {
        $request->validate([
            'extracao_id' => 'required|integer|exists:tb_extracao,ext_cod',
            'alelos' => 'required|array|min:1',
        ]);

        try {
            $alelos = $this->service->registrarAlelos(
                $request->input('extracao_id'),
                $request->input('alelos')
            );

            return response()->json([
                'message' => count($alelos) . ' alelo(s) registrado(s)',
                'data' => AleloResource::collection($alelos),
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Erro ao registrar alelos',
                'error' => $e->getMessage(),
            ], 422);
        }
    }

    // Comparar alelos entre 2 extrações
    public function compararExtracos(Request $request)
    {
        $request->validate([
            'extracao_id_1' => 'required|integer|exists:tb_extracao,ext_cod',
            'extracao_id_2' => 'required|integer|exists:tb_extracao,ext_cod',
        ]);

        try {
            $comparacao = $this->service->compararAlelos(
                $request->input('extracao_id_1'),
                $request->input('extracao_id_2')
            );

            return response()->json($comparacao);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Erro ao comparar extrações',
                'error' => $e->getMessage(),
            ], 422);
        }
    }

    // Alelos de uma extração
    public function porExtracao(Request $request)
    {
        $request->validate(['extracao_id' => 'required|integer|exists:tb_extracao,ext_cod']);

        $alelos = $this->service->obterPorExtracao($request->input('extracao_id'));

        return response()->json([
            'extracao_id' => $request->input('extracao_id'),
            'quantidade_marcadores' => $alelos->count(),
            'data' => AleloResource::collection($alelos),
        ]);
    }

    // Alelos de um marcador
    public function porMarcador(Request $request)
    {
        $request->validate(['marcador' => 'required|string|max:50']);

        $alelos = $this->service->obterPorMarcador($request->input('marcador'));

        return response()->json([
            'marcador' => $request->input('marcador'),
            'quantidade_registros' => $alelos->count(),
            'data' => AleloResource::collection($alelos),
        ]);
    }

    // Contagem por tipo
    public function contagemPorTipo()
    {
        $contagem = $this->service->contagemPorTipo();

        return response()->json([
            'total_alelos' => Alelo::count(),
            'por_tipo' => $contagem,
        ]);
    }

    // Marcadores únicos
    public function marcadoresUnicos()
    {
        $marcadores = $this->service->obterMarcadoresUnicos();

        return response()->json([
            'quantidade_marcadores' => count($marcadores),
            'marcadores' => $marcadores,
        ]);
    }

    // Frequência de alelo na população
    public function frequenciaPopulacao(Request $request)
    {
        $request->validate([
            'marcador' => 'required|string|max:50',
            'alelo' => 'required|string|max:20',
        ]);

        $frequencia = $this->service->calcularFrequenciaAleloPopulacao(
            $request->input('marcador'),
            $request->input('alelo')
        );

        return response()->json([
            'marcador' => $request->input('marcador'),
            'alelo' => $request->input('alelo'),
            'frequencia_populacional' => $frequencia,
        ]);
    }
}
