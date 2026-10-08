<?php
namespace App\Http\Controllers\Web;
use App\Http\Controllers\Controller;

class SceisController extends Controller {
    public function index() {
        return view('sceis.index', ['items' => []]);
    }
}
