<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Comunicacao;
use App\Models\ComunicacaoResposta;
use App\Services\ClassificacaoService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class ComunicacoesController extends Controller
{
    protected ClassificacaoService $classificacao;

    public function __construct(ClassificacaoService $classificacao)
    {
        $this->classificacao = $classificacao;
        $this->middleware('auth:sanctum');
    }

    /**
     * Lista de comunicações com paginação e filtros
     */
    public function index(Request $request)
    {
        $query = Comunicacao::query()
            ->with('caso', 'responses', 'attachments')
            ->latest('received_at');

        // Filtros
        if ($request->has('classification')) {
            $query->where('classification', $request->classification);
        }

        if ($request->has('caso_id')) {
            $query->where('caso_id', $request->caso_id);
        }

        if ($request->has('sync_status')) {
            $query->where('sync_status', $request->sync_status);
        }

        if ($request->has('search')) {
            $search = "%{$request->search}%";
            $query->where(function ($q) use ($search) {
                $q->where('subject', 'like', $search)
                  ->orWhere('email_from', 'like', $search)
                  ->orWhere('email_to', 'like', $search);
            });
        }

        $perPage = $request->input('per_page', 15);
        $comunicacoes = $query->paginate($perPage);

        return response()->json([
            'data' => $comunicacoes->items(),
            'pagination' => [
                'total' => $comunicacoes->total(),
                'count' => $comunicacoes->count(),
                'per_page' => $comunicacoes->perPage(),
                'current_page' => $comunicacoes->currentPage(),
                'last_page' => $comunicacoes->lastPage(),
            ],
        ]);
    }

    /**
     * Criar comunicação manualmente
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'caso_id' => 'nullable|exists:tb_casos,cod_caso',
            'email_from' => 'required|email',
            'email_to' => 'required|email',
            'subject' => 'required|string|max:255',
            'body' => 'required|string',
        ]);

        $comunicacao = Comunicacao::create($validated);

        // Classificar automaticamente
        $this->classificarComunicacao($comunicacao);

        return response()->json([
            'message' => 'Comunicação criada com sucesso',
            'data' => $comunicacao->load('responses', 'attachments'),
        ], 201);
    }

    /**
     * Detalhe de comunicação
     */
    public function show(Comunicacao $comunicacao)
    {
        return response()->json([
            'data' => $comunicacao->load('caso', 'responses', 'attachments', 'logs'),
        ]);
    }

    /**
     * Atualizar comunicação
     */
    public function update(Request $request, Comunicacao $comunicacao)
    {
        $validated = $request->validate([
            'classification' => 'nullable|in:JUDICIAL,NON_JUDICIAL,UNKNOWN',
            'caso_id' => 'nullable|exists:tb_casos,cod_caso',
        ]);

        $comunicacao->update($validated);

        return response()->json([
            'message' => 'Comunicação atualizada',
            'data' => $comunicacao,
        ]);
    }

    /**
     * Deletar comunicação (soft delete)
     */
    public function destroy(Comunicacao $comunicacao)
    {
        $comunicacao->delete();

        return response()->json(['message' => 'Comunicação deletada'], 204);
    }

    /**
     * Classificar comunicação com Ollama/Qwen
     */
    public function classificar(Request $request, Comunicacao $comunicacao)
    {
        $resultado = $this->classificacao->classificar($comunicacao->subject, $comunicacao->body);

        $comunicacao->update([
            'classification' => $resultado['classification'],
            'confidence' => $resultado['confidence'],
            'reasoning' => $resultado['reasoning'],
            'extracted_fields' => $resultado['extracted_fields'] ?? [],
            'classified_at' => now(),
        ]);

        return response()->json([
            'message' => 'Comunicação classificada',
            'data' => $comunicacao,
        ]);
    }

    /**
     * Enviar resposta a comunicação
     */
    public function responder(Request $request, Comunicacao $comunicacao)
    {
        $validated = $request->validate([
            'template_id' => 'nullable|exists:response_templates,id',
            'subject' => 'required|string|max:255',
            'body' => 'required|string',
        ]);

        $resposta = $comunicacao->responses()->create([
            'template_id' => $validated['template_id'] ?? null,
            'subject' => $validated['subject'],
            'body' => $validated['body'],
            'status' => 'DRAFT',
        ]);

        return response()->json([
            'message' => 'Resposta criada',
            'data' => $resposta,
        ], 201);
    }

    /**
     * Listar anexos de comunicação
     */
    public function attachments(Comunicacao $comunicacao)
    {
        return response()->json([
            'data' => $comunicacao->attachments()->get(),
        ]);
    }

    /**
     * Sincronizar e-mails (Microsoft Graph) - STUB para Etapa 4
     * Implementação completa em Etapa 5
     */
    public function sincronizar(Request $request)
    {
        Log::info('Sincronizar comunicações (stub)');

        return response()->json([
            'message' => 'Sincronização iniciada (implementação pendente)',
            'items_synced' => 0,
        ]);
    }

    /**
     * Helper: classificar comunicação
     */
    protected function classificarComunicacao(Comunicacao $comunicacao)
    {
        try {
            $resultado = $this->classificacao->classificar($comunicacao->subject, $comunicacao->body);

            $comunicacao->update([
                'classification' => $resultado['classification'],
                'confidence' => $resultado['confidence'],
                'reasoning' => $resultado['reasoning'],
                'extracted_fields' => $resultado['extracted_fields'] ?? [],
                'classified_at' => now(),
            ]);
        } catch (\Exception $e) {
            Log::warning('Classificação falhou', ['error' => $e->getMessage()]);
        }
    }
}
