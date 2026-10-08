<?php
namespace App\Http\Controllers\Web;
use App\Http\Controllers\Controller;
use App\Models\Processo;
use App\Models\Historico;
use App\Models\Pessoa;
use App\Models\Caso;
use App\Models\Item;
use Illuminate\Http\Request;

class ProcessosController extends Controller {
    public function index(Request $request) {
        $busca = $request->input('busca');
        $filtro = $request->input('filtro', 'data');

        $query = Processo::query();

        if ($busca) {
            $query->where(function($q) use ($busca) {
                $q->where('pro_nperc', 'like', "%$busca%")
                  ->orWhere('pro_auto', 'like', "%$busca%")
                  ->orWhere('cas_codigo', 'like', "%$busca%");
            });
        }

        if ($filtro === 'data') {
            $query->orderByDesc('pro_drec');
        } elseif ($filtro === 'numero') {
            $query->orderBy('pro_nperc');
        } else {
            $query->orderByDesc('pro_cod');
        }

        $processos = $query->paginate(15);

        return view('processos.index', compact('processos', 'busca', 'filtro'));
    }

    public function create() {
        return view('processos.create');
    }

    public function store(Request $request) {
        $processo = Processo::create($request->all());
        return redirect()->route('processos.show', $processo->pro_cod)->with('success', 'Processo criado!');
    }

    public function show(Processo $processo) {
        $historicos = Historico::where('pro_cod', $processo->pro_cod)->with('item')->get();
        $pessoas = Pessoa::where('pro_cod', $processo->pro_cod)->get();
        $caso = Caso::where('cas_codigo', $processo->cas_codigo)->first();
        $items = Item::all();
        return view('processos.show', compact('processo', 'historicos', 'pessoas', 'caso', 'items'));
    }

    public function edit(Processo $processo) {
        return view('processos.edit', compact('processo'));
    }

    public function update(Request $request, Processo $processo) {
        $processo->update($request->all());
        return redirect()->route('processos.show', $processo->pro_cod)->with('success', 'Processo atualizado!');
    }

    public function destroy(Processo $processo) {
        $processo->delete();
        return redirect()->route('processos.index')->with('success', 'Processo deletado!');
    }

    // Pessoas
    public function storePessoa(Request $request, Processo $processo) {
        Pessoa::create([
            'pro_cod' => $processo->pro_cod,
            'pes_nome' => $request->input('pes_nome'),
            'pes_iniciais' => $request->input('pes_iniciais'),
            'pes_sit' => $request->input('pes_sit'),
            'pes_dtnas' => $request->input('pes_dtnas'),
            'pes_lcnas' => $request->input('pes_lcnas'),
            'pes_sexo' => $request->input('pes_sexo'),
            'pes_tdoc' => $request->input('pes_tdoc'),
            'pes_ndoc' => $request->input('pes_ndoc'),
        ]);
        return redirect()->route('processos.show', $processo->pro_cod)->with('success', 'Pessoa adicionada!');
    }

    public function destroyPessoa(Processo $processo, $pes_cod) {
        Pessoa::where('pro_cod', $processo->pro_cod)->where('pes_cod', $pes_cod)->delete();
        return redirect()->route('processos.show', $processo->pro_cod)->with('success', 'Pessoa removida!');
    }

    // Históricos
    public function storeHistorico(Request $request, Processo $processo) {
        Historico::create([
            'pro_cod' => $processo->pro_cod,
            'ite_cod' => $request->input('ite_cod'),
            'his_data' => $request->input('his_data'),
            'his_doc' => $request->input('his_doc'),
            'his_obs' => $request->input('his_obs'),
        ]);
        return redirect()->route('processos.show', $processo->pro_cod)->with('success', 'Histórico adicionado!');
    }

    public function updateHistorico(Request $request, Processo $processo, $his_contr) {
        Historico::where('pro_cod', $processo->pro_cod)->where('his_contr', $his_contr)->update([
            'ite_cod' => $request->input('ite_cod'),
            'his_data' => $request->input('his_data'),
            'his_doc' => $request->input('his_doc'),
            'his_obs' => $request->input('his_obs'),
        ]);
        return redirect()->route('processos.show', $processo->pro_cod)->with('success', 'Histórico atualizado!');
    }

    public function destroyHistorico(Processo $processo, $his_contr) {
        Historico::where('pro_cod', $processo->pro_cod)->where('his_contr', $his_contr)->delete();
        return redirect()->route('processos.show', $processo->pro_cod)->with('success', 'Histórico removido!');
    }
}
