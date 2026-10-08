<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Web\DashboardController;
use App\Http\Controllers\Web\AdminController;
use App\Http\Controllers\Web\ComunicacoesController as WebComunicacoesController;
use App\Http\Controllers\Web\CasosController as WebCasosController;
use App\Http\Controllers\Web\PessoasController as WebPessoasController;
use App\Http\Controllers\Web\KitsController as WebKitsController;
use App\Http\Controllers\Web\SceisController as WebSceisController;

// Redirect root to dashboard or login
Route::get('/', function () {
    return auth()->check() ? redirect()->route('dashboard') : redirect()->route('login');
});

Route::middleware('web')->group(function () {
    // Auth Routes
    Route::get('/login', fn() => view('auth.login'))->name('login')->middleware('guest');
    Route::post('/login', function (\Illuminate\Http\Request $request) {
        // Stub: implementar autenticação real em Etapa 6
        return back()->withErrors(['email' => 'Credenciais inválidas']);
    })->middleware('guest');

    Route::post('/logout', function (\Illuminate\Http\Request $request) {
        auth()->logout();
        return redirect()->route('login');
    })->name('logout')->middleware('auth');

    // Microsoft OAuth (Stub)
    Route::get('/auth/microsoft', fn() => 'Redirect para Microsoft Auth')->name('auth.microsoft');
    Route::get('/auth/microsoft/callback', fn() => 'Microsoft Auth Callback')->name('auth.microsoft.callback');

    // Protected Routes
    Route::middleware('auth')->group(function () {
        // Dashboard
        Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

        // Comunicações
        Route::prefix('comunicacoes')->name('comunicacoes.')->group(function () {
            Route::get('/', [WebComunicacoesController::class, 'index'])->name('index');
            Route::get('/{comunicacao}', [WebComunicacoesController::class, 'show'])->name('show');
        });

        // Casos
        Route::prefix('casos')->name('casos.')->group(function () {
            Route::get('/', [WebCasosController::class, 'index'])->name('index');
            Route::get('/{caso}', [WebCasosController::class, 'show'])->name('show');
        });

        // Pessoas
        Route::resource('pessoas', WebPessoasController::class);

        // Kits
        Route::resource('kits', WebKitsController::class);

        // SCEI — Laboratório
        Route::resource('sceis', WebSceisController::class);

        // Admin
        Route::prefix('admin')->name('admin.')->group(function () {
            Route::get('/', [AdminController::class, 'index'])->name('index');
            Route::get('/menu-testes', [AdminController::class, 'menu_testes'])->name('menu_testes');
            Route::post('/gerar-dados-teste', [AdminController::class, 'gerar_dados_teste'])->name('gerar_dados_teste');
            Route::post('/limpar-dados-teste', [AdminController::class, 'limpar_dados_teste'])->name('limpar_dados_teste');
        });
    });
});
