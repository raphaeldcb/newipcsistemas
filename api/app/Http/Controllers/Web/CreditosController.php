<?php
namespace App\Http\Controllers\Web;
use App\Http\Controllers\Controller;
use App\Models\Credito;

class CreditosController extends Controller {
    public function index() {
        $creditos = Credito::paginate(15);
        return view('creditos.index', compact('creditos'));
    }
}
