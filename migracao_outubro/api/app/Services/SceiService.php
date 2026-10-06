<?php

namespace App\Services;

use App\Models\Scei;
use App\Enums\SceiFase;
use App\Events\SceiFaseAvancada;
use App\Repositories\SceiRepository;
use Illuminate\Support\Facades\DB;
use Exception;

class SceiService extends BaseService
{
    public function __construct(SceiRepository $repository)
    {
        parent::__construct($repository);
    }

    public function criarBatch(int $casoId, array $exames, ?string $dataColeta = null, ?int $responsavelId = null, ?string $observacoes = null): array
    {
        $examsCriados = [];

        foreach ($exames as $exame) {
            $data = [
                'caso_id' => $casoId,
                'tipo_exame' => $exame['tipo_exame'],
                'scei_fase' => SceiFase::PENDENTE->value,
                'data_coleta' => $dataColeta,
                'responsavel_id' => $responsavelId,
                'observacoes' => $observacoes,
                'valor_exame' => $this->obterValorExame($exame['tipo_exame']),
            ];

            $examsCriados[] = $this->repository->create($data);
        }

        return $examsCriados;
    }

    public function registrarFase(Scei $scei, int $novaFase, ?array $resultado = null, ?string $motivo = null): bool
    {
        DB::beginTransaction();
        try {
            $faseAnterior = SceiFase::from($scei->scei_fase);
            $faseNova = SceiFase::from($novaFase);

            // Validar transição
            if (!$faseAnterior->canTransitionTo($faseNova)) {
                throw new Exception("Transição inválida de {$faseAnterior->label()} para {$faseNova->label()}");
            }

            // Validações específicas
            $this->validarFase($faseNova, $resultado);

            // Atualizar fase
            $scei->scei_fase = $novaFase;

            // Registrar datas e resultados por fase
            $this->registrarResultadoFase($scei, $faseNova, $resultado);

            // Se cancelado, registrar motivo
            if ($faseNova === SceiFase::CANCELADO) {
                $scei->motivo_cancelamento = $motivo;
            }

            $scei->save();

            // Disparar evento
            event(new SceiFaseAvancada($scei, $faseAnterior, $faseNova, $resultado, $motivo));

            DB::commit();
            return true;
        } catch (Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }

    protected function validarFase(SceiFase $fase, ?array $resultado = null): void
    {
        if ($fase === SceiFase::RESULTADO_LIBERADO) {
            if (!$resultado || !isset($resultado['valor'])) {
                throw new Exception("Resultado requer valor do exame");
            }
        }

        if ($fase === SceiFase::LAUDO_EMITIDO) {
            if (!$resultado || !isset($resultado['valor'], $resultado['referencia'])) {
                throw new Exception("Laudo requer valor e referência");
            }
        }
    }

    protected function registrarResultadoFase(Scei $scei, SceiFase $fase, ?array $resultado = null): void
    {
        match($fase) {
            SceiFase::AMOSTRA_RECEBIDA => $scei->data_recebimento = now(),
            SceiFase::EM_ANALISE => $scei->data_analise = now(),
            SceiFase::RESULTADO_LIBERADO => $this->registrarResultado($scei, $resultado),
            SceiFase::LAUDO_EMITIDO => $this->registrarLaudo($scei, $resultado),
            SceiFase::LAUDO_FINALIZADO => $scei->data_laudo = now(),
            default => null,
        };
    }

    protected function registrarResultado(Scei $scei, ?array $resultado): void
    {
        if (!$resultado) return;

        $scei->resultado_valor = $resultado['valor'] ?? null;
        $scei->resultado_referencia = $resultado['referencia'] ?? null;
        $scei->resultado_unidade = $resultado['unidade'] ?? null;
        $scei->data_liberacao = now();
    }

    protected function registrarLaudo(Scei $scei, ?array $resultado): void
    {
        if (!$resultado) return;

        $scei->resultado_valor = $resultado['valor'] ?? $scei->resultado_valor;
        $scei->resultado_referencia = $resultado['referencia'] ?? $scei->resultado_referencia;
        $scei->status_laudo = 'emitido';
        $scei->data_laudo = now();
    }

    protected function obterValorExame(string $tipo): float
    {
        $tabela = [
            'HIV' => 150.00,
            'Hepatite' => 120.00,
            'TB' => 100.00,
            'Dengue' => 80.00,
            'Malária' => 90.00,
            'Outro' => 50.00,
        ];

        return $tabela[$tipo] ?? 50.00;
    }

    public function obterPorCaso(int $casoId)
    {
        return Scei::where('caso_id', $casoId)->get();
    }

    public function contagemPorFase(): array
    {
        $contagens = [];
        foreach (SceiFase::cases() as $fase) {
            $contagens[] = [
                'fase_id' => $fase->value,
                'fase_label' => $fase->label(),
                'quantidade' => Scei::where('scei_fase', $fase->value)->count(),
            ];
        }
        return $contagens;
    }

    public function emAnalise(): array
    {
        return Scei::whereIn('scei_fase', [
            SceiFase::AMOSTRA_RECEBIDA->value,
            SceiFase::EM_ANALISE->value,
            SceiFase::RESULTADO_LIBERADO->value,
        ])->get()->toArray();
    }

    public function somaValoresExames(int $casoId): float
    {
        return Scei::where('caso_id', $casoId)->sum('valor_exame');
    }
}
