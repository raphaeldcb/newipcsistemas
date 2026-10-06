<?php

namespace App\Services;

use App\Models\Extracao;
use App\Enums\ExtracacaoFase;
use App\Events\ExtracacaoFaseAvancada;
use App\Repositories\ExtracaoRepository;
use Illuminate\Support\Facades\DB;
use Exception;

class ExtracacaoService extends BaseService
{
    public function __construct(ExtracaoRepository $repository)
    {
        parent::__construct($repository);
    }

    public function registrarFase(Extracao $extracao, int $novaFase, ?array $resultado = null, ?string $motivo = null): bool
    {
        DB::beginTransaction();
        try {
            $faseAnterior = ExtracacaoFase::from($extracao->ext_fase);
            $faseNova = ExtracacaoFase::from($novaFase);

            // Validar transição
            if (!$faseAnterior->canTransitionTo($faseNova)) {
                throw new Exception("Transição inválida de {$faseAnterior->label()} para {$faseNova->label()}");
            }

            // Validações específicas por fase
            $this->validarFase($extracao, $faseNova, $resultado);

            // Atualizar fase
            $extracao->ext_fase = $novaFase;

            // Registrar resultados se fornecidos
            if ($resultado) {
                $this->registrarResultadoFase($extracao, $faseAnterior, $resultado);
            }

            // Registrar falha se necessário
            if ($faseNova === ExtracacaoFase::FALHA) {
                $extracao->motivo_falha = $motivo;
            }

            $extracao->save();

            // Disparar evento
            event(new ExtracacaoFaseAvancada($extracao, $faseAnterior, $faseNova, $resultado, $motivo));

            DB::commit();
            return true;
        } catch (Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }

    protected function validarFase(Extracao $extracao, ExtracacaoFase $fase, ?array $resultado = null): void
    {
        // Validações específicas de resultado por fase
        if ($fase === ExtracacaoFase::EXTRACAO_CONCLUIDA) {
            if (!$resultado || !isset($resultado['concentracao'], $resultado['qualidade'])) {
                throw new Exception("Fase 1 (Extração) requer concentração e qualidade de DNA");
            }

            $concentracao = (float) $resultado['concentracao'];
            $qualidade = (float) $resultado['qualidade'];

            // Validar concentração: 50-500 ng/µL
            if ($concentracao < 50 || $concentracao > 500) {
                throw new Exception("Concentração deve estar entre 50-500 ng/µL, obtido: {$concentracao}");
            }

            // Validar qualidade: A260/A280 ≥ 1.7
            if ($qualidade < 1.7) {
                throw new Exception("Qualidade (A260/A280) deve ser ≥ 1.7, obtido: {$qualidade}");
            }
        }

        if ($fase === ExtracacaoFase::AMPLIFICACAO_CONCLUIDA) {
            if (!$resultado || !isset($resultado['valor1'])) {
                throw new Exception("Fase 2 (Amplificação) requer validação de banda");
            }
            // Validar banda presente e tamanho correto ±5 bp
        }

        if ($fase === ExtracacaoFase::SEQUENCIAMENTO_CONCLUIDO) {
            if (!$resultado || !isset($resultado['qualidade'])) {
                throw new Exception("Fase 3 (Sequenciamento) requer qualidade mínima ≥ 95%");
            }

            $qualidade = (float) $resultado['qualidade'];
            if ($qualidade < 95) {
                throw new Exception("Qualidade do sequenciamento deve ser ≥ 95%, obtido: {$qualidade}%");
            }
        }
    }

    protected function registrarResultadoFase(Extracao $extracao, ExtracacaoFase $faseAnterior, array $resultado): void
    {
        switch ($faseAnterior) {
            case ExtracacaoFase::EXTRACAO_CONCLUIDA:
                $extracao->concentracao_dna = $resultado['concentracao'] ?? null;
                $extracao->qualidade_dna = $resultado['qualidade'] ?? null;
                $extracao->data_extracao = now();
                break;

            case ExtracacaoFase::AMPLIFICACAO_CONCLUIDA:
                $extracao->data_amplificacao = now();
                $extracao->resultado_amplificacao = json_encode($resultado);
                break;

            case ExtracacaoFase::SEQUENCIAMENTO_CONCLUIDO:
                $extracao->data_sequenciamento = now();
                $extracao->resultado_sequenciamento = json_encode($resultado);
                break;
        }
    }

    public function obterProgresso(Extracao $extracao): array
    {
        $fase = ExtracacaoFase::from($extracao->ext_fase);

        return [
            'fase_atual' => $fase->value,
            'fase_label' => $fase->label(),
            'fase_numero' => $fase->fase(),
            'percentual_completo' => ($fase->fase() / 3) * 100,
            'fases_completas' => [
                'fase_1_extracao' => $fase->fase() >= 1,
                'fase_2_amplificacao' => $fase->fase() >= 2,
                'fase_3_sequenciamento' => $fase->fase() === 3,
            ],
            'datas' => [
                'data_coleta' => $extracao->data_coleta,
                'data_extracao' => $extracao->data_extracao,
                'data_amplificacao' => $extracao->data_amplificacao,
                'data_sequenciamento' => $extracao->data_sequenciamento,
            ],
        ];
    }

    public function contarPorFase(): array
    {
        $contagens = [];
        foreach (ExtracacaoFase::cases() as $fase) {
            $contagens[] = [
                'fase_id' => $fase->value,
                'fase_label' => $fase->label(),
                'quantidade' => Extracao::where('ext_fase', $fase->value)->count(),
            ];
        }
        return $contagens;
    }

    public function obterEmProgresso(): array
    {
        return Extracao::whereIn('ext_fase', [
            ExtracacaoFase::EXTRACAO_INICIADA->value,
            ExtracacaoFase::AMPLIFICACAO_INICIADA->value,
            ExtracacaoFase::SEQUENCIAMENTO_INICIADO->value,
        ])->get()->toArray();
    }
}
