<?php

namespace App\Services;

use App\Models\Caso;
use App\Models\Historico;
use App\Models\Credito;
use App\Models\Parcela;
use App\Enums\CasoStatus;
use App\Repositories\CasoRepository;
use Illuminate\Support\Facades\DB;
use Exception;

class CasoService extends BaseService
{
    public function __construct(CasoRepository $repository)
    {
        parent::__construct($repository);
    }

    public function transicionar(Caso $caso, int $novoStatus, string $motivo = null): bool
    {
        DB::beginTransaction();
        try {
            $statusAtual = CasoStatus::from($caso->cas_status);
            $statusNovo = CasoStatus::from($novoStatus);

            // Validar transição
            if (!$statusAtual->canTransitionTo($statusNovo)) {
                throw new Exception("Transição inválida de {$statusAtual->label()} para {$statusNovo->label()}");
            }

            // Validações específicas por transição
            $this->validarTransicao($caso, $statusNovo);

            // Atualizar status
            $caso->cas_status = $novoStatus;
            $caso->save();

            // Registrar histórico
            Historico::create([
                'pro_cod' => $caso->pro_cod,
                'his_status_anterior' => $statusAtual->value,
                'his_status_novo' => $statusNovo->value,
                'his_motivo' => $motivo,
                'his_usuario' => auth()->user()->email ?? 'sistema',
                'his_data' => now(),
            ]);

            // Executar ações pós-transição
            $this->executarAcoesPosTransicao($caso, $statusNovo);

            DB::commit();
            return true;
        } catch (Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }

    protected function validarTransicao(Caso $caso, CasoStatus $statusNovo): void
    {
        switch ($statusNovo) {
            case CasoStatus::COLETA_AGENDADA:
                if (!$caso->responsavel_id || !$caso->coletador_id) {
                    throw new Exception("Caso deve ter responsável e coletador designados");
                }
                break;

            case CasoStatus::EXTRACAO_CONCLUIDA:
                if (!$caso->has('alelos') || $caso->alelos->count() === 0) {
                    throw new Exception("Extração deve ter alelos documentados");
                }
                break;

            case CasoStatus::LAUDO_EMITIDO:
                if (!$caso->medico_id) {
                    throw new Exception("Caso deve ter médico designado");
                }
                break;

            case CasoStatus::CASO_FINALIZADO:
                // Gerar créditos automaticamente
                $this->gerarCreditos($caso);
                break;
        }
    }

    protected function executarAcoesPosTransicao(Caso $caso, CasoStatus $statusNovo): void
    {
        switch ($statusNovo) {
            case CasoStatus::CASO_FINALIZADO:
                // Disparar event para notificações
                // event(new CasoFinalizado($caso));
                break;

            case CasoStatus::CANCELADO:
                // Cancelar créditos associados
                $caso->creditos()->update(['cre_status' => 'cancelado']);
                break;
        }
    }

    protected function gerarCreditos(Caso $caso): void
    {
        $valorBase = $this->calcularValorBase($caso);

        // Criar crédito principal
        $credito = Credito::create([
            'pro_cod' => $caso->pro_cod,
            'cre_vlr' => $valorBase,
            'cre_status' => 'pendente',
            'cre_data' => now(),
        ]);

        // Gerar parcelas (3x por padrão)
        $valorParcela = $valorBase / 3;
        for ($i = 1; $i <= 3; $i++) {
            Parcela::create([
                'pro_cod' => $caso->pro_cod,
                'par_nparc' => $i,
                'par_vlr' => $valorParcela,
                'par_data' => now()->addDays($i * 10),
                'par_sit' => 1, // PENDENTE
            ]);
        }
    }

    protected function calcularValorBase(Caso $caso): float
    {
        // TODO: Implementar 5-factor calculation da REGRAS-NEGOCIO-CREDITOS.md
        // BASE × FATOR_TIPO × FATOR_JUIZ × FATOR_VARA × FATOR_CATEGORIA
        return 1000.00; // Default placeholder
    }
}
