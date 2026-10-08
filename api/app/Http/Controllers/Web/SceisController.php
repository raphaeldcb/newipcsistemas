<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Http\Requests\SceiRequest;
use App\Models\Scei;
use App\Models\Caso;
use App\Models\User;
use Carbon\Carbon;

class SceisController extends Controller
{

    public function index()
    {
        $query = Scei::query();

        if (request('search')) {
            $search = request('search');
            $query->where('exame_tipo', 'like', "%$search%")
                  ->orWhere('resultado', 'like', "%$search%");
        }

        if (request('fase')) {
            $query->where('scei_fase', request('fase'));
        }

        if (request('caso_id')) {
            $query->where('caso_id', request('caso_id'));
        }

        if (request('laboratorio_id')) {
            $query->where('laboratorio_id', request('laboratorio_id'));
        }

        $sceis = $query->paginate(15);
        $casos = Caso::all();
        $laboratorios = User::all();

        return view('scei.index', compact('sceis', 'casos', 'laboratorios'));
    }

    public function create()
    {
        $casos = Caso::all();
        $laboratorios = User::all();
        $fases = [
            1 => 'Pendente',
            2 => 'Amostra Recebida',
            3 => 'Em Análise',
            4 => 'Resultado Liberado',
            5 => 'Laudo Emitido',
            6 => 'Laudo Finalizado',
            7 => 'Cancelado',
        ];

        return view('scei.create', compact('casos', 'laboratorios', 'fases'));
    }

    public function store(SceiRequest $request)
    {
        $data = $request->validated();
        $data['data_exame'] = \Carbon\Carbon::createFromFormat('Y-m-d H:i', $data['data_exame']);

        $scei = Scei::create($data);

        return redirect()->route('sceis.show', $scei)
                       ->with('success', 'Exame SCEI criado com sucesso');
    }

    public function show(Scei $scei)
    {
        $scei->load('caso', 'laboratorio', 'responsavel');

        return view('scei.show', compact('scei'));
    }

    public function edit(Scei $scei)
    {
        $casos = Caso::all();
        $laboratorios = User::all();
        $fases = [
            1 => 'Pendente',
            2 => 'Amostra Recebida',
            3 => 'Em Análise',
            4 => 'Resultado Liberado',
            5 => 'Laudo Emitido',
            6 => 'Laudo Finalizado',
            7 => 'Cancelado',
        ];

        return view('scei.edit', compact('scei', 'casos', 'laboratorios', 'fases'));
    }

    public function update(SceiRequest $request, Scei $scei)
    {
        $data = $request->validated();

        if (isset($data['data_exame'])) {
            $data['data_exame'] = \Carbon\Carbon::createFromFormat('Y-m-d H:i', $data['data_exame']);
        }

        $scei->update($data);

        return redirect()->route('sceis.show', $scei)
                       ->with('success', 'Exame SCEI atualizado com sucesso');
    }

    public function destroy(Scei $scei)
    {
        $scei->delete();

        return redirect()->route('sceis.index')
                       ->with('success', 'Exame SCEI deletado com sucesso');
    }
}
