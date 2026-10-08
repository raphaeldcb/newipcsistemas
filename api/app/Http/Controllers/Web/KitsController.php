<?php
namespace App\Http\Controllers\Web;
use App\Http\Controllers\Controller;
use App\Models\Kit;

class KitsController extends Controller {
    public function index() {
        $kits = Kit::paginate(15);
        return view('kits.index', compact('kits'));
    }
}
