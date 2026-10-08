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

        $user = \App\Models\Host::where('hos_usua', $credentials['hos_usua'])->first();

        if ($user && $user->hos_senha === $credentials['hos_senha']) {
            dd([
                'usuário encontrado' => $user->hos_usua,
                'senha match' => $user->hos_senha === $credentials['hos_senha'],
                'autenticado' => Auth::check(),
                'tentando login' => Auth::login($user),
                'autenticado após login' => Auth::check(),
            ]);
        }

        \Log::warning('Falha de login para: ' . $credentials['hos_usua']);
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
