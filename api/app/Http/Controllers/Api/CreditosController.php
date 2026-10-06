<?php

namespace App\Http\Controllers\Api;

use App\Models\Credito;
use App\Models\Caso;
use App\Http\Requests\RegistrarPagamentoCreditoRequest;
use App\Http\Resources\CreditoResource;
use App\Repositories\CreditoRepository;
use App\Services\CreditoService;
use Illuminate\Http\Request;

class CreditosController
{
    public function __construct(
        private CreditoRepository $repository,
        private CreditoService $service
    ) {
    }

    public function index()
    {
        return response()->json([
            'data' => CreditoResource::collection($this->repository->paginate()),
        ]);
    }

    public function show(Credito $credito)
    {
        return response()->json(new CreditoResource($credito));
    }

    // Registrar Pagamento
    public function registrarPagamento(RegistrarPagamentoCreditoRequest $request, Credito $credito)
    {
        try {
            $this->service->registrarPagamento(
                $credito,
                $request->input('valor'),
                $request->input('motivo')
            );

            return response()->json([
                'message' => 'Pagamento registrado com sucesso',
                'data' => new CreditoResource($credito->fresh()),
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Erro ao registrar pagamento',
                'error' => $e->getMessage(),
            ], 422);
        }
    }

    // Cancelar Crédito
    public function cancelar(Request $request, Credito $credito)
    {
        $request->validate(['motivo' => 'nullable|string|max:500']);

        try {
            $this->service->cancelarCredito($credito, $request->input('motivo'));

            return response()->json([
                'message' => 'Crédito cancelado',
                'data' => new CreditoResource($credito->fresh()),
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Erro ao cancelar crédito',
                'error' => $e->getMessage(),
            ], 422);
        }
    }

    // Reverter Crédito
    public function reverter(Request $request, Credito $credito)
    {
        $request->validate(['motivo' => 'nullable|string|max:500']);

        try {
            $this->service->reverterCredito($credito, $request->input('motivo'));

            return response()->json([
                'message' => 'Crédito revertido',
                'data' => new CreditoResource($credito->fresh()),
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Erro ao reverter crédito',
                'error' => $e->getMessage(),
            ], 422);
        }
    }

    // Listar Parcelas
    public function parcelas(Credito $credito)
    {
        $parcelas = $credito->parcelas()->orderBy('par_nparc')->get();

        return response()->json([
            'credito_id' => $credito->id_credito,
            'quantidade_parcelas' => $parcelas->count(),
            'data' => $parcelas->map(fn($p) => [
                'numero' => $p->par_nparc,
                'valor' => (float) $p->par_vlr,
                'data_vencimento' => $p->par_data_vencimento,
                'status' => $p->par_status,
                'data_pagamento' => $p->par_data_pagamento,
            ]),
        ]);
    }

    // Simulação de Cálculo
    public function simular(Request $request)
    {
        $request->validate(['caso_id' => 'required|integer|exists:tb_casos,cas_contr']);

        $caso = Caso::findOrFail($request->input('caso_id'));
        $simulacao = $this->service->simularCalculo($caso);

        return response()->json([
            'caso_id' => $caso->cas_contr,
            'simulacao' => $simulacao,
        ]);
    }

    // Pendentes (últimos 30 dias)
    public function pendentes()
    {
        $pendentes = $this->service->obterPendentes(30);
        $totalPendente = collect($pendentes)->sum('cre_vlr');

        return response()->json([
            'total_registros' => count($pendentes),
            'total_valor_pendente' => (float) $totalPendente,
            'data' => CreditoResource::collection(collect($pendentes)),
        ]);
    }

    // Atrasadas
    public function atrasadas()
    {
        $atrasadas = $this->service->obterAtrasadas();

        return response()->json([
            'total_parcelas_atrasadas' => count($atrasadas),
            'data' => $atrasadas,
        ]);
    }

    // Tabela de Fatores
    public function tabelaFatores()
    {
        $tabelas = $this->service->obterTabelaFatores();

        return response()->json([
            'valor_base' => 1000.00,
            'tabelas' => $tabelas,
        ]);
    }

    // Por Caso
    public function porCaso(Request $request)
    {
        $request->validate(['caso_id' => 'required|integer']);

        $creditos = Credito::where('caso_id', $request->input('caso_id'))
            ->get();

        $totalValor = $creditos->sum('cre_vlr');
        $totalPago = $creditos->sum('cre_vlr_pago');

        return response()->json([
            'caso_id' => $request->input('caso_id'),
            'quantidade_creditos' => $creditos->count(),
            'valor_total' => (float) $totalValor,
            'valor_pago' => (float) $totalPago,
            'saldo' => (float) ($totalValor - $totalPago),
            'data' => CreditoResource::collection($creditos),
        ]);
    }
}
