<?php
namespace App\Http\Controllers\Web;
use App\Http\Controllers\Controller;

class ExtracoesController extends Controller {
    public function index() {
        return view('extracos.index', ['items' => []]);
    }
}
