<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\PessoasController;
use App\Http\Controllers\Api\UFController;
use App\Http\Controllers\Api\ComarcasController;
use App\Http\Controllers\Api\VarasController;
use App\Http\Controllers\Api\JuizesController;
use App\Http\Controllers\Api\CasosController;
use App\Http\Controllers\Api\KitsController;
use App\Http\Controllers\Api\CreditosController;

Route::prefix('v1')->group(function () {
    // Public endpoints
    Route::post('/auth/login', [AuthController::class, 'login']);
    Route::post('/auth/refresh', [AuthController::class, 'refresh']);

    // Protected endpoints
    Route::middleware('auth:sanctum')->group(function () {
        // Auth
        Route::post('/auth/logout', [AuthController::class, 'logout']);
        Route::get('/auth/me', [AuthController::class, 'me']);

        // Foundational (UF, Comarca, Varas, Juizes)
        Route::apiResource('ufs', UFController::class);
        Route::apiResource('comarcas', ComarcasController::class);
        Route::apiResource('varas', VarasController::class);
        Route::apiResource('juizes', JuizesController::class);

        // Core (Pessoas, Casos, Créditos)
        Route::apiResource('pessoas', PessoasController::class);
        Route::apiResource('casos', CasosController::class);

        // Casos com métodos especializados
        Route::group(['prefix' => 'casos/{caso}'], function () {
            Route::post('/transicionar', [CasosController::class, 'transicionar'])->name('casos.transicionar');
            Route::get('/historico', [CasosController::class, 'historico'])->name('casos.historico');
            Route::get('/estados-validos', [CasosController::class, 'estadosValidos'])->name('casos.estados-validos');
        });

        Route::apiResource('creditos', CreditosController::class);

        // Kits com rastreamento
        Route::apiResource('kits', KitsController::class);
        Route::group(['prefix' => 'kits/{kit}'], function () {
            Route::post('/rastrear', [KitsController::class, 'rastrear'])->name('kits.rastrear');
            Route::get('/rastreamento', [KitsController::class, 'rastreamento'])->name('kits.rastreamento');
            Route::get('/estados-validos', [KitsController::class, 'estadosValidos'])->name('kits.estados-validos');
        });
        Route::get('/kits/verificar-vencimentos', [KitsController::class, 'verificarVencimentos']);
        Route::post('/kits/por-local', [KitsController::class, 'porLocal']);
        Route::post('/kits/por-coletador', [KitsController::class, 'porColetador']);
        Route::get('/kits/contagem-por-status', [KitsController::class, 'contagemPorStatus']);

        // Health check
        Route::get('/health', function () {
            return response()->json([
                'status' => 'ok',
                'timestamp' => now(),
                'user' => auth()->user(),
            ]);
        });
    });
});

// API documentation
Route::get('/docs', function () {
    return response()->json([
        'api' => 'SCPG API v1',
        'version' => '1.0.0',
        'endpoints' => [
            'auth' => [
                'POST /api/v1/auth/login',
                'POST /api/v1/auth/logout',
                'POST /api/v1/auth/refresh',
                'GET /api/v1/auth/me',
            ],
            'foundational' => [
                'GET/POST /api/v1/ufs',
                'GET/POST /api/v1/comarcas',
                'GET/POST /api/v1/varas',
                'GET/POST /api/v1/juizes',
            ],
            'core' => [
                'GET/POST /api/v1/pessoas',
                'GET/POST /api/v1/casos',
                'GET/POST /api/v1/creditos',
            ],
        ],
    ]);
});
