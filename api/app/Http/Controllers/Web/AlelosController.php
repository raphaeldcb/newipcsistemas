<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Http\Requests\WebAleloRequest;
use App\Models\Alelo;
use App\Models\Extracao;

class AlelosController extends Controller
{

    public function index()
    {
        $query = Alelo::query();

        if (request('search')) {
            $search = request('search');
            $query->where('marcador', 'like', "%$search%")
                  ->orWhere('tipo_alelo', 'like', "%$search%")
                  ->orWhere('genótipo', 'like', "%$search%");
        }

        if (request('tipo_alelo')) {
            $query->where('tipo_alelo', request('tipo_alelo'));
        }

        if (request('marcador')) {
            $query->where('marcador', request('marcador'));
        }

        if (request('extracao_id')) {
            $query->where('extracao_id', request('extracao_id'));
        }

        $alelos = $query->with('extracao')->paginate(15);

        return view('alelos.index', compact('alelos'));
    }

    public function create()
    {
        $extracos = Extracao::orderBy('ext_cod', 'desc')->get();
        $tipos_alelo = ['STR', 'SNP', 'mtDNA', 'Y-STR', 'AMELOGENINA'];

        return view('alelos.create', compact('extracos', 'tipos_alelo'));
    }

    public function store(WebAleloRequest $request)
    {
        $alelo = Alelo::create($request->validated());

        return redirect()->route('alelos.show', $alelo)
                       ->with('success', 'Alelo criado com sucesso');
    }

    public function show(Alelo $alelo)
    {
        $alelo->load('extracao');
        return view('alelos.show', compact('alelo'));
    }

    public function edit(Alelo $alelo)
    {
        $extracos = Extracao::orderBy('ext_cod', 'desc')->get();
        $tipos_alelo = ['STR', 'SNP', 'mtDNA', 'Y-STR', 'AMELOGENINA'];

        return view('alelos.edit', compact('alelo', 'extracos', 'tipos_alelo'));
    }

    public function update(WebAleloRequest $request, Alelo $alelo)
    {
        $alelo->update($request->validated());

        return redirect()->route('alelos.show', $alelo)
                       ->with('success', 'Alelo atualizado com sucesso');
    }

    public function destroy(Alelo $alelo)
    {
        $alelo->delete();

        return redirect()->route('alelos.index')
                       ->with('success', 'Alelo deletado com sucesso');
    }
}
