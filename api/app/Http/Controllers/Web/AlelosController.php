<?php
namespace App\Http\Controllers\Web;
use App\Http\Controllers\Controller;
use App\Models\Alelo;

class AlelosController extends Controller {
    public function index() {
        $alelos = Alelo::paginate(15);
        return view('alelos.index', compact('alelos'));
    }
}
