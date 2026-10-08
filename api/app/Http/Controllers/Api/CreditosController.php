<?php

namespace App\Http\Controllers\Api;

use App\Models\Credito;
use App\Models\Caso;
use App\Http\Requests\RegistrarPagamentoCreditoRequest;
use App\Http\Requests\StoreCreditoRequest;
use App\Http\Requests\UpdateCreditoRequest;
use App\Http\Resources\CreditoResource;
use App\Repositories\CreditoRepository;
use App\Services\CreditoService;
use App\Services\CalculoCreditoService;
use Illuminate\Http\Request;

class CreditosController
{
    public function __construct(
        private CreditoRepository $repository,
        private CreditoService $service,
        private CalculoCreditoService $calculoService
    ) {
    }

    public function index()
    {
        return response()->json([
            'data' => CreditoResource::collection($this->repository->paginate()),
        ]);
    }

    public function store(StoreCreditoRequest $request)
    {
        try {
            $validated = $request->validated();
            $caso = Caso::findOrFail($validated['caso_id']);

            // Calculate credit with provided factors
            $calculo = $this->calculoService->calcular($caso, [
                'fator_1' => $validated['fator_1'] ?? null,
                'fator_2' => $validated['fator_2'] ?? null,
                'fator_3' => $validated['fator_3'] ?? null,
                'fator_4' => $validated['fator_4'] ?? null,
                'fator_5' => $validated['fator_5'] ?? null,
            ]);

            // Create credito
            $credito = $this->repository->create([
                'caso_id' => $validated['caso_id'],
                'valor_base' => $calculo['valor_base'],
                'fator_1' => $calculo['fator_1'],
                'fator_2' => $calculo['fator_2'],
                'fator_3' => $calculo['fator_3'],
                'fator_4' => $calculo['fator_4'],
                'fator_5' => $calculo['fator_5'],
                'valor_calculado' => $calculo['valor_calculado'],
                'num_parcelas' => $validated['num_parcelas'] ?? 3,
                'status' => 'pendente',
                'valor_pago' => 0,
            ]);

            // Create installments
            $this->service->criarParcelas($credito, $calculo['valor_calculado'], $validated['num_parcelas'] ?? 3);

            return response()->json([
                'message' => 'Crédito criado com sucesso',
                'data' => new CreditoResource($credito->fresh()),
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Erro ao criar crédito',
                'error' => $e->getMessage(),
            ], 422);
        }
    }

    public function show(Credito $credito)
    {
        return response()->json(new CreditoResource($credito));
    }

    public function update(UpdateCreditoRequest $request, Credito $credito)
    {
        try {
            $validated = $request->validated();

            // Recalculate if factors changed
            if (array_filter($validated, fn($v, $k) => str_starts_with($k, 'fator_'), ARRAY_FILTER_USE_BOTH)) {
                $caso = $credito->caso;
                $calculo = $this->calculoService->calcular($caso, [
                    'fator_1' => $validated['fator_1'] ?? null,
                    'fator_2' => $validated['fator_2'] ?? null,
                    'fator_3' => $validated['fator_3'] ?? null,
                    'fator_4' => $validated['fator_4'] ?? null,
                    'fator_5' => $validated['fator_5'] ?? null,
                ]);

                $credito->update([
                    'fator_1' => $calculo['fator_1'],
                    'fator_2' => $calculo['fator_2'],
                    'fator_3' => $calculo['fator_3'],
                    'fator_4' => $calculo['fator_4'],
                    'fator_5' => $calculo['fator_5'],
                    'valor_calculado' => $calculo['valor_calculado'],
                ]);
            }

            // Update num_parcelas if provided
            if (isset($validated['num_parcelas'])) {
                $credito->update(['num_parcelas' => $validated['num_parcelas']]);
            }

            return response()->json([
                'message' => 'Crédito atualizado com sucesso',
                'data' => new CreditoResource($credito->fresh()),
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Erro ao atualizar crédito',
                'error' => $e->getMessage(),
            ], 422);
        }
    }

    public function destroy(Credito $credito)
    {
        try {
            $credito->delete();
            return response()->json(['message' => 'Crédito deletado com sucesso']);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Erro ao deletar crédito',
                'error' => $e->getMessage(),
            ], 422);
        }
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
