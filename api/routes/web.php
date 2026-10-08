<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Web\DashboardController;
use App\Http\Controllers\Web\AdminController;
use App\Http\Controllers\Web\ComunicacoesController as WebComunicacoesController;
use App\Http\Controllers\Web\CasosController as WebCasosController;
use App\Http\Controllers\Web\PessoasController as WebPessoasController;
use App\Http\Controllers\Web\KitsController as WebKitsController;
use App\Http\Controllers\Web\ExtracoesController as WebExtracoesController;
use App\Http\Controllers\Web\SceisController as WebSceisController;
use App\Http\Controllers\Web\AlelosController as WebAlelosController;
use App\Http\Controllers\Web\RelatoriosController as WebRelatoriosController;
use App\Http\Controllers\Auth\LoginController;

// Redirect root to dashboard or login
Route::get('/', function () {
    return auth()->check() ? redirect()->route('dashboard') : redirect()->route('login');
});


Route::middleware('web')->group(function () {
    // Auth Routes
    Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login')->middleware('guest');
    Route::post('/login', [LoginController::class, 'login'])->name('login')->middleware('guest');
    Route::post('/logout', [LoginController::class, 'logout'])->name('logout')->middleware('auth');

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

        // Extrações
        Route::resource('extracos', WebExtracoesController::class);

        // Alelos
        Route::resource('alelos', WebAlelosController::class);

        // SCEI — Laboratório
        Route::resource('sceis', WebSceisController::class);

        // Relatórios
        Route::prefix('relatorios')->name('relatorios.')->group(function () {
            Route::get('/', [WebRelatoriosController::class, 'index'])->name('index');
            Route::get('/comunicacoes', [WebRelatoriosController::class, 'comunicacoes'])->name('comunicacoes');
            Route::get('/comunicacoes/pdf', [WebRelatoriosController::class, 'comunicacoesPDF'])->name('comunicacoes.pdf');
            Route::get('/comunicacoes/excel', [WebRelatoriosController::class, 'comunicacoesExcel'])->name('comunicacoes.excel');
            Route::get('/caso/pdf', [WebRelatoriosController::class, 'casoPDF'])->name('caso.pdf');
            Route::get('/caso/excel', [WebRelatoriosController::class, 'casoExcel'])->name('caso.excel');
            Route::get('/extracao/pdf', [WebRelatoriosController::class, 'extracaoPDF'])->name('extracao.pdf');
            Route::get('/extracao/excel', [WebRelatoriosController::class, 'extracaoExcel'])->name('extracao.excel');
            Route::get('/creditos/excel', [WebRelatoriosController::class, 'creditosExcel'])->name('creditos.excel');
            Route::get('/auditoria/excel', [WebRelatoriosController::class, 'auditoriaExcel'])->name('auditoria.excel');
        });

        // Admin
        Route::prefix('admin')->name('admin.')->group(function () {
            Route::get('/', [AdminController::class, 'index'])->name('index');
            Route::get('/menu-testes', [AdminController::class, 'menu_testes'])->name('menu_testes');
            Route::post('/gerar-dados-teste', [AdminController::class, 'gerar_dados_teste'])->name('gerar_dados_teste');
            Route::post('/limpar-dados-teste', [AdminController::class, 'limpar_dados_teste'])->name('limpar_dados_teste');
        });
    });
});
