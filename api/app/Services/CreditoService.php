<?php

namespace App\Services;

use App\Models\Credito;
use App\Models\Parcela;
use App\Models\Caso;
use App\Enums\CreditoStatus;
use App\Repositories\CreditoRepository;
use App\Repositories\ParcelaRepository;
use Illuminate\Support\Facades\DB;
use Exception;

class CreditoService extends BaseService
{
    public function __construct(
        CreditoRepository $repository,
        private ParcelaRepository $parcelaRepository,
        private CreditoCalculador $calculador
    ) {
        parent::__construct($repository);
    }

    public function gerarCreditoComParcelas(Caso $caso): Credito
    {
        DB::beginTransaction();
        try {
            // Calcular valor
            $valor = $this->calculador->calcular($caso);

            // Criar crédito
            $credito = $this->repository->create([
                'caso_id' => $caso->cas_contr,
                'cre_vlr' => $valor,
                'cre_status' => CreditoStatus::PENDENTE->value,
                'data_geracao' => now(),
            ]);

            // Criar 3 parcelas
            $this->criarParcelas($credito, $valor);

            DB::commit();
            return $credito;
        } catch (Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }

    public function criarParcelas(Credito $credito, float $valorTotal, int $numParcelas = 3): void
    {
        $parcelas = $this->calculador->calcularParcelas($valorTotal, $numParcelas);

        foreach ($parcelas as $parcela) {
            $this->parcelaRepository->create([
                'id_credito' => $credito->id_credito,
                'par_nparc' => $parcela['numero'],
                'par_vlr' => $parcela['valor'],
                'par_data_vencimento' => $parcela['data_vencimento'],
                'par_status' => 'aberta',
                'par_data_criacao' => now(),
            ]);
        }
    }

    public function registrarPagamento(Credito $credito, float $valor, ?string $motivo = null): void
    {
        DB::beginTransaction();
        try {
            // Atualizar status do crédito
            $creditoAtualizado = $this->repository->findById($credito->id_credito);

            if ($creditoAtualizado->cre_vlr_pago + $valor >= $creditoAtualizado->cre_vlr) {
                $creditoAtualizado->cre_status = CreditoStatus::PAGO->value;
                $creditoAtualizado->data_pagamento = now();
            } elseif ($valor > 0) {
                $creditoAtualizado->cre_status = CreditoStatus::PARCIALMENTE_PAGO->value;
            }

            $creditoAtualizado->cre_vlr_pago = $creditoAtualizado->cre_vlr_pago + $valor;
            $this->repository->update($creditoAtualizado);

            DB::commit();
        } catch (Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }

    public function cancelarCredito(Credito $credito, ?string $motivo = null): void
    {
        DB::beginTransaction();
        try {
            $credito->cre_status = CreditoStatus::CANCELADO->value;
            $credito->motivo_cancelamento = $motivo;
            $credito->data_cancelamento = now();

            $this->repository->update($credito);

            // Cancelar parcelas também
            Parcela::where('id_credito', $credito->id_credito)->update([
                'par_status' => 'cancelada',
            ]);

            DB::commit();
        } catch (Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }

    public function reverterCredito(Credito $credito, ?string $motivo = null): void
    {
        DB::beginTransaction();
        try {
            $credito->cre_status = CreditoStatus::REVERTIDO->value;
            $credito->motivo_reversao = $motivo;
            $credito->data_reversao = now();
            $credito->cre_vlr_pago = 0;

            $this->repository->update($credito);

            // Reverter parcelas também
            Parcela::where('id_credito', $credito->id_credito)->update([
                'par_status' => 'aberta',
                'par_data_pagamento' => null,
            ]);

            DB::commit();
        } catch (Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }

    public function obterPendentes(int $dias = 30): array
    {
        return Credito::where('cre_status', '!=', CreditoStatus::PAGO->value)
            ->where('cre_status', '!=', CreditoStatus::CANCELADO->value)
            ->where('data_geracao', '>=', now()->subDays($dias))
            ->with('caso')
            ->get()
            ->toArray();
    }

    public function obterAtrasadas(): array
    {
        return Parcela::where('par_status', 'aberta')
            ->where('par_data_vencimento', '<', now())
            ->with('credito')
            ->get()
            ->toArray();
    }

    public function obterTabelaFatores(): array
    {
        return $this->calculador->obterTabelaFatores();
    }

    public function simularCalculo(Caso $caso): array
    {
        $valorBase = $this->calculador->obterValorBase();
        $valorFinal = $this->calculador->calcular($caso);
        $multiplicador = $valorFinal / $valorBase;

        return [
            'valor_base' => $valorBase,
            'valor_final' => $valorFinal,
            'multiplicador' => round($multiplicador, 4),
            'tabelas' => $this->calculador->obterTabelaFatores(),
        ];
    }
}
