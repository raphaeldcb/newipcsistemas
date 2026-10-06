<?php

namespace App\Services;

use App\Models\Alelo;
use App\Models\Extracao;
use App\Repositories\AleloRepository;
use Illuminate\Support\Facades\DB;
use Exception;

class AleloService extends BaseService
{
    public function __construct(AleloRepository $repository)
    {
        parent::__construct($repository);
    }

    public function registrarAlelos(int $extracaoId, array $alelos): array
    {
        DB::beginTransaction();
        try {
            $alelosCriados = [];

            foreach ($alelos as $alelo) {
                $data = [
                    'extracao_id' => $extracaoId,
                    'tipo_alelo' => $alelo['tipo_alelo'],
                    'marcador' => $alelo['marcador'],
                    'alelo1' => $alelo['alelo1'],
                    'alelo2' => $alelo['alelo2'] ?? null,
                    'frequencia_alelo1' => $alelo['frequencia_alelo1'] ?? null,
                    'frequencia_alelo2' => $alelo['frequencia_alelo2'] ?? null,
                    'observacoes' => $alelo['observacoes'] ?? null,
                ];

                $this->validarAlelo($data);
                $alelosCriados[] = $this->repository->create($data);
            }

            DB::commit();
            return $alelosCriados;
        } catch (Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }

    protected function validarAlelo(array $alelo): void
    {
        // Validar tipo de alelo
        if (!in_array($alelo['tipo_alelo'], ['STR', 'SNP', 'mtDNA', 'Y-STR', 'AMELOGENINA'])) {
            throw new Exception("Tipo de alelo inválido: {$alelo['tipo_alelo']}");
        }

        // Validar alelo1 não vazio
        if (empty($alelo['alelo1'])) {
            throw new Exception("Alelo 1 é obrigatório");
        }

        // Validar frequências entre 0 e 1
        if ($alelo['frequencia_alelo1'] && ($alelo['frequencia_alelo1'] < 0 || $alelo['frequencia_alelo1'] > 1)) {
            throw new Exception("Frequência do alelo 1 deve estar entre 0 e 1");
        }

        if ($alelo['frequencia_alelo2'] && ($alelo['frequencia_alelo2'] < 0 || $alelo['frequencia_alelo2'] > 1)) {
            throw new Exception("Frequência do alelo 2 deve estar entre 0 e 1");
        }
    }

    public function compararAlelos(int $extracaoId1, int $extracaoId2): array
    {
        $alelos1 = Alelo::where('extracao_id', $extracaoId1)->get();
        $alelos2 = Alelo::where('extracao_id', $extracaoId2)->get();

        if ($alelos1->isEmpty() || $alelos2->isEmpty()) {
            throw new Exception("Uma ou ambas extrações não possuem alelos registrados");
        }

        $comparacao = [
            'extracao_1' => $extracaoId1,
            'extracao_2' => $extracaoId2,
            'total_marcadores' => $alelos1->count(),
            'matches' => 0,
            'detalhes' => [],
        ];

        foreach ($alelos1 as $alelo1) {
            $alelo2 = $alelos2->where('marcador', $alelo1->marcador)->first();

            if (!$alelo2) {
                $comparacao['detalhes'][] = [
                    'marcador' => $alelo1->marcador,
                    'resultado' => 'marcador_ausente_extracao_2',
                    'alelos_1' => $alelo1->alelo1 . ($alelo1->alelo2 ? '/' . $alelo1->alelo2 : ''),
                ];
                continue;
            }

            $match = $this->verificarMatch($alelo1, $alelo2);

            if ($match) {
                $comparacao['matches']++;
            }

            $comparacao['detalhes'][] = [
                'marcador' => $alelo1->marcador,
                'resultado' => $match ? 'match' : 'mismatch',
                'alelos_1' => $alelo1->alelo1 . ($alelo1->alelo2 ? '/' . $alelo1->alelo2 : ''),
                'alelos_2' => $alelo2->alelo1 . ($alelo2->alelo2 ? '/' . $alelo2->alelo2 : ''),
            ];
        }

        $comparacao['percentual_match'] = round(
            ($comparacao['matches'] / $comparacao['total_marcadores']) * 100,
            2
        );

        return $comparacao;
    }

    protected function verificarMatch(Alelo $alelo1, Alelo $alelo2): bool
    {
        // Verificar se os alelos são iguais (considerando ordem)
        $genótipo1 = [$alelo1->alelo1, $alelo1->alelo2];
        $genótipo2 = [$alelo2->alelo1, $alelo2->alelo2];

        sort($genótipo1);
        sort($genótipo2);

        return $genótipo1 === $genótipo2;
    }

    public function obterPorExtracao(int $extracaoId)
    {
        return Alelo::where('extracao_id', $extracaoId)->get();
    }

    public function obterPorMarcador(string $marcador)
    {
        return Alelo::where('marcador', $marcador)->get();
    }

    public function contagemPorTipo(): array
    {
        return Alelo::selectRaw('tipo_alelo, COUNT(*) as quantidade')
            ->groupBy('tipo_alelo')
            ->get()
            ->map(fn($row) => [
                'tipo' => $row->tipo_alelo,
                'quantidade' => $row->quantidade,
            ])
            ->toArray();
    }

    public function obterMarcadoresUnicos(): array
    {
        return Alelo::selectRaw('DISTINCT marcador')
            ->orderBy('marcador')
            ->pluck('marcador')
            ->toArray();
    }

    public function calcularFrequenciaAleloPopulacao(string $marcador, string $alelo): float
    {
        $alelos = Alelo::where('marcador', $marcador)->get();

        if ($alelos->isEmpty()) {
            return 0;
        }

        $ocorrencias = 0;
        $totalAloselos = 0;

        foreach ($alelos as $a) {
            if ($a->alelo1 === $alelo) $ocorrencias++;
            $totalAloselos++;

            if ($a->alelo2) {
                $totalAloselos++;
                if ($a->alelo2 === $alelo) $ocorrencias++;
            }
        }

        return $totalAloselos > 0 ? round($ocorrencias / $totalAloselos, 4) : 0;
    }
}
