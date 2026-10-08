<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Http\Requests\KitRequest;
use App\Models\Kit;

class KitsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $query = Kit::query();
        if (request('search')) {
            $search = request('search');
            $query->where('kit_num', 'like', "%$search%")
                  ->orWhere('kit_rastrear', 'like', "%$search%");
        }
        if (request('status')) {
            $query->where('kit_status', request('status'));
        }
        $kits = $query->paginate(15);
        return view('kits.index', compact('kits'));
    }

    public function create()
    {
        return view('kits.create');
    }

    public function store(KitRequest $request)
    {
        $kit = Kit::create($request->validated());
        return redirect()->route('kits.show', $kit)
                       ->with('success', 'Kit criado com sucesso');
    }

    public function show(Kit $kit)
    {
        return view('kits.show', compact('kit'));
    }

    public function edit(Kit $kit)
    {
        return view('kits.edit', compact('kit'));
    }

    public function update(KitRequest $request, Kit $kit)
    {
        $kit->update($request->validated());
        return redirect()->route('kits.show', $kit)
                       ->with('success', 'Kit atualizado com sucesso');
    }

    public function destroy(Kit $kit)
    {
        $kit->delete();
        return redirect()->route('kits.index')
                       ->with('success', 'Kit deletado com sucesso');
    }
}
