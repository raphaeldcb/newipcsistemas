@extends('layouts.app')

@section('content')
<div class="container mx-auto px-4 py-8">
    <!-- Cabeçalho -->
    <div class="mb-8">
        <div class="flex items-center justify-between mb-4">
            <div>
                <h1 class="text-3xl font-bold text-gray-900 dark:text-white mb-2">Relatório de Comunicações</h1>
                <p class="text-gray-600 dark:text-gray-400">Análise das comunicações classificadas</p>
            </div>
            <a href="{{ route('relatorios.index') }}" class="bg-gray-500 hover:bg-gray-600 text-white px-4 py-2 rounded">
                Voltar
            </a>
        </div>
    </div>

    <!-- Filtros -->
    <div class="bg-white dark:bg-gray-800 rounded-lg shadow-md p-6 mb-6">
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Filtros</h3>
        <form method="GET" class="flex gap-4 flex-wrap">
            <div class="flex-1 min-w-64">
                <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">Data Início</label>
                <input type="date" name="data_inicio" value="{{ $dataInicio?->format('Y-m-d') }}" class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded bg-white dark:bg-gray-700 text-gray-900 dark:text-white text-sm">
            </div>
            <div class="flex-1 min-w-64">
                <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">Data Fim</label>
                <input type="date" name="data_fim" value="{{ $dataFim?->format('Y-m-d') }}" class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded bg-white dark:bg-gray-700 text-gray-900 dark:text-white text-sm">
            </div>
            <div class="flex items-end gap-2">
                <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded text-sm font-medium">
                    Filtrar
                </button>
                <a href="{{ route('relatorios.comunicacoes') }}" class="bg-gray-400 hover:bg-gray-500 text-white px-4 py-2 rounded text-sm font-medium">
                    Limpar
                </a>
            </div>
        </form>
    </div>

    <!-- Resumo -->
    <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
        <div class="bg-white dark:bg-gray-800 rounded-lg shadow-md p-6">
            <p class="text-sm text-gray-600 dark:text-gray-400 mb-1">Total de Comunicações</p>
            <p class="text-3xl font-bold text-blue-600">{{ $dados['resumo']['total_comunicacoes'] }}</p>
        </div>
        <div class="bg-white dark:bg-gray-800 rounded-lg shadow-md p-6">
            <p class="text-sm text-gray-600 dark:text-gray-400 mb-1">Alta Confiança (≥80%)</p>
            <p class="text-3xl font-bold text-green-600">{{ $dados['resumo']['alta_confianca'] }}</p>
        </div>
        <div class="bg-white dark:bg-gray-800 rounded-lg shadow-md p-6">
            <p class="text-sm text-gray-600 dark:text-gray-400 mb-1">Confiança Média</p>
            <p class="text-3xl font-bold text-purple-600">{{ number_format($dados['resumo']['confianca_media'], 2, ',', '.') }}</p>
        </div>
        <div class="bg-white dark:bg-gray-800 rounded-lg shadow-md p-6">
            <p class="text-sm text-gray-600 dark:text-gray-400 mb-1">Gerado em</p>
            <p class="text-sm text-gray-900 dark:text-white font-mono">{{ $dados['data_geracao'] }}</p>
        </div>
    </div>

    <!-- Por Classificação -->
    <div class="bg-white dark:bg-gray-800 rounded-lg shadow-md p-6 mb-6">
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Por Classificação</h3>
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead class="bg-gray-100 dark:bg-gray-700">
                    <tr>
                        <th class="px-4 py-2 text-left text-gray-900 dark:text-white font-semibold">Classificação</th>
                        <th class="px-4 py-2 text-center text-gray-900 dark:text-white font-semibold">Quantidade</th>
                        <th class="px-4 py-2 text-center text-gray-900 dark:text-white font-semibold">Percentual</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($dados['resumo']['por_classificacao'] as $item)
                        <tr class="border-t border-gray-200 dark:border-gray-700">
                            <td class="px-4 py-3 text-gray-900 dark:text-white">
                                <span class="inline-block px-3 py-1 rounded text-xs font-semibold"
                                    style="background-color: {{ $item['classificacao'] === 'JUDICIAL' ? '#dbeafe' : '#fef3c7' }}; color: {{ $item['classificacao'] === 'JUDICIAL' ? '#0c4a6e' : '#92400e' }};">
                                    {{ $item['classificacao'] }}
                                </span>
                            </td>
                            <td class="px-4 py-3 text-center text-gray-900 dark:text-white font-semibold">{{ $item['quantidade'] }}</td>
                            <td class="px-4 py-3 text-center text-gray-900 dark:text-white">{{ number_format($item['percentual'], 1, ',', '.') }}%</td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="3" class="px-4 py-4 text-center text-gray-500 dark:text-gray-400">
                                Nenhuma comunicação encontrada
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>

    <!-- Exportar -->
    <div class="bg-white dark:bg-gray-800 rounded-lg shadow-md p-6 mb-6">
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Exportar Relatório</h3>
        <div class="flex gap-4">
            <form method="GET" action="{{ route('relatorios.comunicacoes.pdf') }}" class="inline">
                @foreach(request()->query() as $key => $value)
                    <input type="hidden" name="{{ $key }}" value="{{ $value }}">
                @endforeach
                <button type="submit" class="bg-red-500 hover:bg-red-600 text-white px-6 py-2 rounded font-medium flex items-center gap-2">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"><path d="M8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z"></path></svg>
                    PDF
                </button>
            </form>
            <form method="GET" action="{{ route('relatorios.comunicacoes.excel') }}" class="inline">
                @foreach(request()->query() as $key => $value)
                    <input type="hidden" name="{{ $key }}" value="{{ $value }}">
                @endforeach
                <button type="submit" class="bg-green-500 hover:bg-green-600 text-white px-6 py-2 rounded font-medium flex items-center gap-2">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M3 17a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm3.293-7.707a1 1 0 011.414 0L9 10.586V3a1 1 0 112 0v7.586l1.293-1.293a1 1 0 111.414 1.414l-3 3a1 1 0 01-1.414 0l-3-3a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                    Excel
                </button>
            </form>
        </div>
    </div>

    <!-- Tabela de Detalhes -->
    @if(!empty($dados['detalhes']))
    <div class="bg-white dark:bg-gray-800 rounded-lg shadow-md p-6 overflow-x-auto">
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Detalhes das Comunicações</h3>
        <table class="w-full text-xs md:text-sm">
            <thead class="bg-gray-100 dark:bg-gray-700 sticky top-0">
                <tr>
                    <th class="px-3 py-2 text-left text-gray-900 dark:text-white font-semibold">De</th>
                    <th class="px-3 py-2 text-left text-gray-900 dark:text-white font-semibold">Assunto</th>
                    <th class="px-3 py-2 text-center text-gray-900 dark:text-white font-semibold">Classificação</th>
                    <th class="px-3 py-2 text-center text-gray-900 dark:text-white font-semibold">Confiança</th>
                    <th class="px-3 py-2 text-center text-gray-900 dark:text-white font-semibold">Data</th>
                </tr>
            </thead>
            <tbody>
                @forelse($dados['detalhes'] as $item)
                    <tr class="border-t border-gray-200 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-700">
                        <td class="px-3 py-2 text-gray-900 dark:text-white truncate" title="{{ $item['de'] }}">{{ $item['de'] }}</td>
                        <td class="px-3 py-2 text-gray-900 dark:text-white truncate" title="{{ $item['assunto'] }}">{{ $item['assunto'] }}</td>
                        <td class="px-3 py-2 text-center">
                            <span class="inline-block px-2 py-1 rounded text-xs font-semibold"
                                style="background-color: {{ $item['classificacao'] === 'JUDICIAL' ? '#dbeafe' : '#fef3c7' }}; color: {{ $item['classificacao'] === 'JUDICIAL' ? '#0c4a6e' : '#92400e' }};">
                                {{ substr($item['classificacao'], 0, 3) }}
                            </span>
                        </td>
                        <td class="px-3 py-2 text-center text-gray-900 dark:text-white">
                            {{ number_format($item['confianca'], 2, ',', '.') }}
                        </td>
                        <td class="px-3 py-2 text-center text-gray-900 dark:text-white whitespace-nowrap">{{ $item['data_recebimento'] }}</td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="5" class="px-4 py-4 text-center text-gray-500 dark:text-gray-400">
                            Nenhuma comunicação encontrada
                        </td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>
    @endif
</div>
@endsection
