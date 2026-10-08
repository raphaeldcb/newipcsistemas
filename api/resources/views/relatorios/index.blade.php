@extends('layouts.app')

@section('page-title', 'Relatórios')

@section('content')
<div style="max-width: 1200px; margin: 0 auto;">
    <!-- Cabeçalho -->
    <div style="margin-bottom: 30px;">
        <h2 style="font-size: 24px; font-weight: 600; margin-bottom: 8px; color: #333;">Relatórios</h2>
        <p style="color: #666;">Gere e exporte relatórios em PDF ou Excel</p>
    </div>

    <!-- Grid de Relatórios -->
    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(350px, 1fr)); gap: 20px; margin-bottom: 30px;">
        <!-- Relatório de Comunicações -->
        <div class="card">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px;">
                <h3 style="font-size: 16px; font-weight: 600; color: #333; margin: 0;">📧 Comunicações</h3>
            </div>
            <p style="color: #666; margin: 10px 0;">Total: <strong>{{ $totalComunicacoes }}</strong> comunicações</p>
            <div style="margin: 15px 0; font-size: 13px; color: #666;">
                <p style="margin: 5px 0;">Judicial: {{ $comunicacoesJudicial }}</p>
                <p style="margin: 5px 0;">Não Judicial: {{ $comunicacoesNaoJudicial }}</p>
            </div>
            <div style="display: flex; gap: 10px;">
                <a href="{{ route('relatorios.comunicacoes') }}" class="btn btn-primary" style="flex: 1; text-align: center; margin: 0; padding: 10px;">
                    Visualizar
                </a>
            </div>
        </div>

        <!-- Relatório de Casos -->
        <div class="card">
            <h3 style="font-size: 16px; font-weight: 600; color: #333; margin: 0 0 15px 0;">📋 Casos Completos</h3>
            <p style="color: #666; margin: 0 0 15px 0; font-size: 13px;">Selecione um caso para gerar relatório</p>
            <form method="GET" action="{{ route('relatorios.caso.pdf') }}">
                <div class="form-group" style="margin-bottom: 10px;">
                    <select name="caso_id" required style="padding: 8px; font-size: 13px;">
                        <option value="">-- Selecione --</option>
                        @foreach($casos as $caso)
                            <option value="{{ $caso->cas_contr }}">{{ $caso->pro_numero }}</option>
                        @endforeach
                    </select>
                </div>
                <div style="display: flex; gap: 10px;">
                    <button type="submit" formaction="{{ route('relatorios.caso.pdf') }}" class="btn btn-primary" style="flex: 1; margin: 0; padding: 8px;">
                        PDF
                    </button>
                    <button type="submit" formaction="{{ route('relatorios.caso.excel') }}" class="btn" style="flex: 1; margin: 0; padding: 8px; background: #f39c12; color: white;">
                        Excel
                    </button>
                </div>
            </form>
        </div>

        <!-- Relatório de Créditos -->
        <div class="bg-white dark:bg-gray-800 rounded-lg shadow-md p-6">
            <div class="flex items-center justify-between mb-4">
                <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Créditos</h3>
                <svg class="w-8 h-8 text-red-500" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M8.16 5.314l4.897-1.596A1 1 0 0114.35 4.75h1.361a1 1 0 01.986 1.164l-.996 5.211a1 1 0 01-.98.825H8.75a1 1 0 01-1-1v-4.236a1 1 0 01.16-.686z"></path>
                    <path fill-rule="evenodd" d="M12.331 9.5a1 1 0 100 2H15a2 2 0 110 4H6a1 1 0 11 0-2h1a1 1 0 000-2H6a4 4 0 110-8h9.35a1 1 0 00.986-1.164l-.996-5.211A1 1 0 0014.35 1H12.989a1 1 0 00-.986 1.164l.996 5.211A1 1 0 0012.999 8.2h-.668z" clip-rule="evenodd"></path>
                </svg>
            </div>
            <p class="text-gray-600 dark:text-gray-400 mb-4">Faturamento de créditos</p>
            <form method="GET" action="{{ route('relatorios.creditos.excel') }}" class="space-y-2">
                <select name="caso_id" class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded bg-white dark:bg-gray-700 text-gray-900 dark:text-white text-sm">
                    <option value="">-- Selecione --</option>
                    @foreach($casos as $caso)
                        <option value="{{ $caso->cas_contr }}">{{ $caso->pro_numero }}</option>
                    @endforeach
                </select>
                <button type="submit" class="w-full bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-2 rounded text-sm font-medium">
                    Exportar Excel
                </button>
            </form>
        </div>

        <!-- Relatório de Extrações -->
        <div class="bg-white dark:bg-gray-800 rounded-lg shadow-md p-6">
            <div class="flex items-center justify-between mb-4">
                <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Extrações DNA</h3>
                <svg class="w-8 h-8 text-purple-500" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M12.316 3.051a1 1 0 01.633 1.265l-4 12a1 1 0 11-1.898-.632l4-12a1 1 0 011.265-.633zM5.707 6.293a1 1 0 010 1.414L3.414 10l2.293 2.293a1 1 0 11-1.414 1.414l-3-3a1 1 0 010-1.414l3-3a1 1 0 011.414 0zm8.586 0a1 1 0 011.414 0l3 3a1 1 0 010 1.414l-3 3a1 1 0 11-1.414-1.414L16.586 10l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                </svg>
            </div>
            <p class="text-gray-600 dark:text-gray-400 mb-4">Resultados de extrações</p>
            <form method="GET" action="{{ route('relatorios.extracao.pdf') }}" class="space-y-2">
                <input type="text" name="extracao_id" placeholder="ID da Extração" class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded bg-white dark:bg-gray-700 text-gray-900 dark:text-white text-sm">
                <div class="flex gap-2">
                    <button type="submit" formaction="{{ route('relatorios.extracao.pdf') }}" class="flex-1 bg-blue-500 hover:bg-blue-600 text-white px-3 py-2 rounded text-sm font-medium">
                        PDF
                    </button>
                    <button type="submit" formaction="{{ route('relatorios.extracao.excel') }}" class="flex-1 bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-2 rounded text-sm font-medium">
                        Excel
                    </button>
                </div>
            </form>
        </div>

        <!-- Relatório de Auditoria -->
        <div class="bg-white dark:bg-gray-800 rounded-lg shadow-md p-6">
            <div class="flex items-center justify-between mb-4">
                <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Auditoria</h3>
                <svg class="w-8 h-8 text-indigo-500" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M6.267 3.455a3.066 3.066 0 001.745-.723 3.066 3.066 0 013.976 0 3.066 3.066 0 001.745.723 3.066 3.066 0 012.812 3.062v6.218c0 1.081.592 2.057 1.461 2.585.9.545 1.731 1.232 2.398 2.031a6.19 6.19 0 01-2.53 4.027 4.929 4.929 0 01-7.006-4.884 4.926 4.926 0 01.856-3.088 6.19 6.19 0 01-2.53-4.027c.667-.799 1.498-1.486 2.398-2.031.87-.528 1.461-1.504 1.461-2.585V6.517a3.066 3.066 0 012.812-3.062zM9 12a1 1 0 100-2 1 1 0 000 2z" clip-rule="evenodd"></path>
                </svg>
            </div>
            <p class="text-gray-600 dark:text-gray-400 mb-4">Histórico de mudanças</p>
            <form method="GET" action="{{ route('relatorios.auditoria.excel') }}" class="space-y-2">
                <select name="caso_id" class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded bg-white dark:bg-gray-700 text-gray-900 dark:text-white text-sm">
                    <option value="">-- Selecione --</option>
                    @foreach($casos as $caso)
                        <option value="{{ $caso->cas_contr }}">{{ $caso->pro_numero }}</option>
                    @endforeach
                </select>
                <button type="submit" class="w-full bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-2 rounded text-sm font-medium">
                    Exportar Excel
                </button>
            </form>
        </div>
    </div>

    <!-- Aviso de Segurança -->
    <div class="mt-8 bg-yellow-50 dark:bg-yellow-900 border border-yellow-200 dark:border-yellow-700 rounded p-4">
        <p class="text-sm text-yellow-800 dark:text-yellow-100">
            <strong>Nota:</strong> Os arquivos gerados contêm dados sensíveis. Mantenha-os seguros e siga as políticas de segurança da empresa.
        </p>
    </div>
</div>
@endsection
