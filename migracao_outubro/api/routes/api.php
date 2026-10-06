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
use App\Http\Controllers\Api\SceisController;
use App\Http\Controllers\Api\CreditosController;
use App\Http\Controllers\Api\AlelosController;
use App\Http\Controllers\Api\RelatoriosController;
use App\Http\Controllers\Api\UsuariosController;
use App\Http\Controllers\Api\AuditoriaController;

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

        // Créditos com métodos especializados
        Route::group(['prefix' => 'creditos/{credito}'], function () {
            Route::post('/registrar-pagamento', [CreditosController::class, 'registrarPagamento'])->name('creditos.registrar-pagamento');
            Route::post('/cancelar', [CreditosController::class, 'cancelar'])->name('creditos.cancelar');
            Route::post('/reverter', [CreditosController::class, 'reverter'])->name('creditos.reverter');
            Route::get('/parcelas', [CreditosController::class, 'parcelas'])->name('creditos.parcelas');
        });
        Route::post('/creditos/simular', [CreditosController::class, 'simular']);
        Route::get('/creditos/pendentes', [CreditosController::class, 'pendentes']);
        Route::get('/creditos/atrasadas', [CreditosController::class, 'atrasadas']);
        Route::get('/creditos/tabela-fatores', [CreditosController::class, 'tabelaFatores']);
        Route::post('/creditos/por-caso', [CreditosController::class, 'porCaso']);

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

        // SCEI (Laboratório integrado)
        Route::apiResource('sceis', SceisController::class);
        Route::group(['prefix' => 'sceis/{scei}'], function () {
            Route::post('/registrar-fase', [SceisController::class, 'registrarFase'])->name('sceis.registrar-fase');
            Route::get('/estados-validos', [SceisController::class, 'estadosValidos'])->name('sceis.estados-validos');
        });
        Route::post('/sceis/por-caso', [SceisController::class, 'porCaso']);
        Route::get('/sceis/contagem-por-fase', [SceisController::class, 'contagemPorFase']);
        Route::get('/sceis/em-analise', [SceisController::class, 'emAnalise']);

        // Alelos (Marcadores genéticos)
        Route::apiResource('alelos', AlelosController::class);
        Route::post('/alelos/registrar-batch', [AlelosController::class, 'registrarBatch']);
        Route::post('/alelos/comparar-extracos', [AlelosController::class, 'compararExtracos']);
        Route::post('/alelos/por-extracao', [AlelosController::class, 'porExtracao']);
        Route::post('/alelos/por-marcador', [AlelosController::class, 'porMarcador']);
        Route::get('/alelos/contagem-por-tipo', [AlelosController::class, 'contagemPorTipo']);
        Route::get('/alelos/marcadores-unicos', [AlelosController::class, 'marcadoresUnicos']);
        Route::post('/alelos/frequencia-populacao', [AlelosController::class, 'frequenciaPopulacao']);

        // Relatórios
        Route::get('/relatorios/tipos', [RelatoriosController::class, 'listarTipos']);
        Route::post('/relatorios/caso-completo', [RelatoriosController::class, 'casosCompletosPDF']);
        Route::post('/relatorios/extracao', [RelatoriosController::class, 'extracao']);
        Route::post('/relatorios/comparacao-alelos', [RelatoriosController::class, 'comparacaoAlelos']);
        Route::post('/relatorios/creditos-faturamento', [RelatoriosController::class, 'creditosFaturamento']);
        Route::get('/relatorios/kits', [RelatoriosController::class, 'kits']);
        Route::post('/relatorios/auditoria', [RelatoriosController::class, 'auditoria']);

        // Admin (Usuários)
        Route::apiResource('usuarios', UsuariosController::class);
        Route::post('/usuarios/{usuario}/alterar-senha', [UsuariosController::class, 'alterarSenha']);
        Route::get('/usuarios/ativos', [UsuariosController::class, 'ativos']);
        Route::get('/usuarios/por-role', [UsuariosController::class, 'porRole']);
        Route::get('/usuarios/{usuario}/ultimo-acesso', [UsuariosController::class, 'ultimoAcesso']);

        // Auditoria
        Route::get('/auditoria', [AuditoriaController::class, 'index']);
        Route::get('/auditoria/{auditoria}', [AuditoriaController::class, 'show']);
        Route::post('/auditoria/por-usuario', [AuditoriaController::class, 'porUsuario']);
        Route::post('/auditoria/resumo-diario', [AuditoriaController::class, 'resumoDiario']);
        Route::get('/auditoria/entidades-modificadas', [AuditoriaController::class, 'entidadesModificadas']);
        Route::get('/auditoria/ultimas/{limit?}', [AuditoriaController::class, 'ultimas']);

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
