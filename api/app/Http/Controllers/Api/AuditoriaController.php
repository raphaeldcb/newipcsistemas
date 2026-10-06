<?php

namespace App\Http\Controllers\Api;

use App\Models\AuditoriaLog;
use Illuminate\Http\Request;

class AuditoriaController
{
    public function index(Request $request)
    {
        $query = AuditoriaLog::query();

        if ($request->has('usuario_id')) {
            $query->where('usuario_id', $request->input('usuario_id'));
        }

        if ($request->has('acao')) {
            $query->where('acao', $request->input('acao'));
        }

        if ($request->has('tipo_entidade')) {
            $query->where('tipo_entidade', $request->input('tipo_entidade'));
        }

        if ($request->has('data_inicio')) {
            $query->whereDate('criado_em', '>=', $request->input('data_inicio'));
        }

        if ($request->has('data_fim')) {
            $query->whereDate('criado_em', '<=', $request->input('data_fim'));
        }

        return response()->json([
            'data' => $query->orderByDesc('criado_em')->paginate(),
        ]);
    }

    public function show(AuditoriaLog $auditoria)
    {
        return response()->json(['data' => $auditoria]);
    }

    public function porUsuario(Request $request)
    {
        $request->validate(['usuario_id' => 'required|integer']);

        $logs = AuditoriaLog::where('usuario_id', $request->input('usuario_id'))
            ->orderByDesc('criado_em')
            ->get();

        return response()->json([
            'usuario_id' => $request->input('usuario_id'),
            'total_acoes' => $logs->count(),
            'acoes' => $logs->map(fn($l) => [
                'id' => $l->id,
                'acao' => $l->acao,
                'tipo_entidade' => $l->tipo_entidade,
                'entidade_id' => $l->entidade_id,
                'dados_anterior' => $l->dados_anterior,
                'dados_novo' => $l->dados_novo,
                'criado_em' => $l->criado_em,
            ]),
        ]);
    }

    public function resumoDiario(Request $request)
    {
        $request->validate(['data' => 'required|date']);

        $logs = AuditoriaLog::whereDate('criado_em', $request->input('data'))
            ->selectRaw('acao, COUNT(*) as quantidade')
            ->groupBy('acao')
            ->get();

        return response()->json([
            'data' => $request->input('data'),
            'resumo' => $logs->map(fn($l) => [
                'acao' => $l->acao,
                'quantidade' => $l->quantidade,
            ]),
        ]);
    }

    public function entidadesModificadas(Request $request)
    {
        $logs = AuditoriaLog::selectRaw('tipo_entidade, COUNT(DISTINCT entidade_id) as quantidade')
            ->groupBy('tipo_entidade')
            ->get();

        return response()->json([
            'entidades_modificadas' => $logs,
        ]);
    }

    public function ultimas($limit = 50)
    {
        $logs = AuditoriaLog::orderByDesc('criado_em')
            ->limit($limit)
            ->get();

        return response()->json([
            'quantidade' => $logs->count(),
            'data' => $logs,
        ]);
    }
}
