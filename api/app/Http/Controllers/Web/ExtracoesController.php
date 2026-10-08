<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Http\Requests\ExtracacaoRequest;
use App\Models\Extracao;
use App\Enums\ExtracacaoFaseWeb;

class ExtracoesController extends Controller
{

    public function index()
    {
        $query = Extracao::query();

        if (request('search')) {
            $search = request('search');
            $query->where('amostra_id', 'like', "%$search%")
                  ->orWhere('observacoes', 'like', "%$search%");
        }

        if (request('fase')) {
            $query->where('fase', request('fase'));
        }

        if (request('status')) {
            $query->where('status', request('status'));
        }

        $extracos = $query->paginate(15);
        $fases = ExtracacaoFaseWeb::all();

        return view('extracos.index', compact('extracos', 'fases'));
    }

    public function create()
    {
        $fases = ExtracacaoFaseWeb::all();
        return view('extracos.create', compact('fases'));
    }

    public function store(ExtracacaoRequest $request)
    {
        $extracao = Extracao::create($request->validated());

        return redirect()->route('extracos.show', $extracao)
                       ->with('success', 'Extração criada com sucesso');
    }

    public function show(Extracao $extracao)
    {
        return view('extracos.show', compact('extracao'));
    }

    public function edit(Extracao $extracao)
    {
        $fases = ExtracacaoFaseWeb::all();
        return view('extracos.edit', compact('extracao', 'fases'));
    }

    public function update(ExtracacaoRequest $request, Extracao $extracao)
    {
        $extracao->update($request->validated());

        return redirect()->route('extracos.show', $extracao)
                       ->with('success', 'Extração atualizada com sucesso');
    }

    public function destroy(Extracao $extracao)
    {
        $extracao->delete();

        return redirect()->route('extracos.index')
                       ->with('success', 'Extração deletada com sucesso');
    }
}
