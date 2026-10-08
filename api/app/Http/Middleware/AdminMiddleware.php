<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class AdminMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        // Verificar se o usuário está autenticado e é admin
        if (!auth()->check() || auth()->user()->role !== 'admin') {
            return redirect('/dashboard')
                ->with('error', 'Você não tem permissão para acessar esta área.');
        }

        return $next($request);
    }
}
