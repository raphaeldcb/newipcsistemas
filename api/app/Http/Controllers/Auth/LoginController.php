<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function showLoginForm()
    {
        return view('auth.login');
    }

    public function login(Request $request)
    {
        $credentials = $request->validate([
            'hos_usua' => 'required|string',
            'hos_senha' => 'required|string',
        ], [
            'hos_usua.required' => 'Usuário obrigatório',
            'hos_senha.required' => 'Senha obrigatória',
        ]);

        if (Auth::attempt(['hos_usua' => $credentials['hos_usua'], 'password' => $credentials['hos_senha']])) {
            $request->session()->regenerate();
            return redirect()->intended('dashboard');
        }

        return back()->withErrors([
            'hos_usua' => 'Usuário ou senha incorretos',
        ])->onlyInput('hos_usua');
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('/');
    }
}
