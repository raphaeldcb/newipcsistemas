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

        $host = \App\Models\Host::where('hos_usua', $credentials['hos_usua'])->first();

        if ($host && $host->hos_senha === $credentials['hos_senha']) {
            // Sincronizar com tabela users
            $user = \App\Models\User::updateOrCreate(
                ['email' => $host->hos_usua],
                [
                    'name' => $host->hos_nome ?? $host->hos_usua,
                    'email' => $host->hos_usua,
                    'password' => bcrypt($host->hos_senha),
                ]
            );

            Auth::login($user);
            $request->session()->regenerate();

            return response()->view('redirect', ['url' => '/dashboard'], 200)
                ->header('Content-Type', 'text/html; charset=utf-8');
        }

        return back()->withErrors(['hos_usua' => 'Usuário ou senha incorretos'])->onlyInput('hos_usua');
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('/');
    }
}
