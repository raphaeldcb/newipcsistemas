@extends('layouts.app')

@section('page-title', 'Relatório de Comunicações')

@section('content')
<div style="max-width: 1200px; margin: 0 auto;">
    <!-- Cabeçalho -->
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px;">
        <div>
            <h2 style="font-size: 24px; font-weight: 600; margin: 0 0 8px 0; color: #333;">Relatório de Comunicações</h2>
            <p style="color: #666; margin: 0;">Análise das comunicações classificadas</p>
        </div>
        <a href="{{ route('relatorios.index') }}" class="btn btn-secondary">
            ← Voltar
        </a>
    </div>

    <!-- Filtros -->
    <div class="card" style="margin-bottom: 20px;">
        <div class="card-header">Filtros</div>
        <form method="GET" style="display: flex; gap: 15px; flex-wrap: wrap; align-items: flex-end;">
            <div style="flex: 1; min-width: 200px;">
                <label class="form-group" style="margin: 0;">
                    <div style="font-weight: 500; margin-bottom: 5px;">Data Início</div>
                    <input type="date" name="data_inicio" value="{{ $dataInicio?->format('Y-m-d') }}" style="padding: 8px; font-size: 13px;">
                </label>
            </div>
            <div style="flex: 1; min-width: 200px;">
                <label class="form-group" style="margin: 0;">
                    <div style="font-weight: 500; margin-bottom: 5px;">Data Fim</div>
                    <input type="date" name="data_fim" value="{{ $dataFim?->format('Y-m-d') }}" style="padding: 8px; font-size: 13px;">
                </label>
            </div>
            <div style="display: flex; gap: 10px;">
                <button type="submit" class="btn btn-primary" style="padding: 10px 20px; margin: 0;">
                    Filtrar
                </button>
                <a href="{{ route('relatorios.comunicacoes') }}" class="btn btn-secondary" style="padding: 10px 20px; margin: 0; text-decoration: none;">
                    Limpar
                </a>
            </div>
        </form>
    </div>

    <!-- Resumo -->
    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px; margin-bottom: 20px;">
        <div class="card">
            <p style="color: #666; margin: 0 0 8px 0; font-size: 12px;">Total de Comunicações</p>
            <p style="font-size: 28px; font-weight: bold; color: #3498db; margin: 0;">{{ $dados['resumo']['total_comunicacoes'] }}</p>
        </div>
        <div class="card">
            <p style="color: #666; margin: 0 0 8px 0; font-size: 12px;">Alta Confiança (≥80%)</p>
            <p style="font-size: 28px; font-weight: bold; color: #27ae60; margin: 0;">{{ $dados['resumo']['alta_confianca'] }}</p>
        </div>
        <div class="card">
            <p style="color: #666; margin: 0 0 8px 0; font-size: 12px;">Confiança Média</p>
            <p style="font-size: 28px; font-weight: bold; color: #8e44ad; margin: 0;">{{ number_format($dados['resumo']['confianca_media'], 2, ',', '.') }}</p>
        </div>
        <div class="card">
            <p style="color: #666; margin: 0 0 8px 0; font-size: 12px;">Gerado em</p>
            <p style="font-size: 12px; color: #333; margin: 0; font-family: monospace;">{{ $dados['data_geracao'] }}</p>
        </div>
    </div>

    <!-- Por Classificação -->
    <div class="card" style="margin-bottom: 20px;">
        <div class="card-header">Por Classificação</div>
        <div style="overflow-x: auto;">
            <table class="table" style="font-size: 13px;">
                <thead>
                    <tr>
                        <th>Classificação</th>
                        <th style="text-align: center;">Quantidade</th>
                        <th style="text-align: center;">Percentual</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($dados['resumo']['por_classificacao'] as $item)
                        <tr>
                            <td>
                                <span class="badge" style="background-color: {{ $item['classificacao'] === 'JUDICIAL' ? '#d1ecf1' : '#fff3cd' }}; color: {{ $item['classificacao'] === 'JUDICIAL' ? '#0c5460' : '#856404' }};">
                                    {{ $item['classificacao'] }}
                                </span>
                            </td>
                            <td style="text-align: center; font-weight: bold;">{{ $item['quantidade'] }}</td>
                            <td style="text-align: center;">{{ number_format($item['percentual'], 1, ',', '.') }}%</td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="3" style="text-align: center; padding: 20px;">
                                Nenhuma comunicação encontrada
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>

    <!-- Exportar -->
    <div class="card" style="margin-bottom: 20px;">
        <div class="card-header">Exportar Relatório</div>
        <div style="display: flex; gap: 10px;">
            <form method="GET" action="{{ route('relatorios.comunicacoes.pdf') }}" style="display: inline;">
                @foreach(request()->query() as $key => $value)
                    <input type="hidden" name="{{ $key }}" value="{{ $value }}">
                @endforeach
                <button type="submit" class="btn" style="background: #e74c3c; color: white; padding: 10px 20px; margin: 0;">
                    📄 PDF
                </button>
            </form>
            <form method="GET" action="{{ route('relatorios.comunicacoes.excel') }}" style="display: inline;">
                @foreach(request()->query() as $key => $value)
                    <input type="hidden" name="{{ $key }}" value="{{ $value }}">
                @endforeach
                <button type="submit" class="btn" style="background: #27ae60; color: white; padding: 10px 20px; margin: 0;">
                    📊 Excel
                </button>
            </form>
        </div>
    </div>

    <!-- Tabela de Detalhes -->
    @if(!empty($dados['detalhes']))
    <div class="card">
        <div class="card-header">Detalhes das Comunicações</div>
        <div style="overflow-x: auto;">
            <table class="table" style="font-size: 12px;">
                <thead>
                    <tr>
                        <th>De</th>
                        <th>Assunto</th>
                        <th style="text-align: center;">Classificação</th>
                        <th style="text-align: center;">Confiança</th>
                        <th style="text-align: center;">Data</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($dados['detalhes'] as $item)
                        <tr>
                            <td style="max-width: 150px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;" title="{{ $item['de'] }}">{{ $item['de'] }}</td>
                            <td style="max-width: 250px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;" title="{{ $item['assunto'] }}">{{ $item['assunto'] }}</td>
                            <td style="text-align: center;">
                                <span class="badge" style="background-color: {{ $item['classificacao'] === 'JUDICIAL' ? '#d1ecf1' : '#fff3cd' }}; color: {{ $item['classificacao'] === 'JUDICIAL' ? '#0c5460' : '#856404' }};">
                                    {{ substr($item['classificacao'], 0, 3) }}
                                </span>
                            </td>
                            <td style="text-align: center;">{{ number_format($item['confianca'], 2, ',', '.') }}</td>
                            <td style="text-align: center; white-space: nowrap;">{{ $item['data_recebimento'] }}</td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="5" style="text-align: center; padding: 20px;">
                                Nenhuma comunicação encontrada
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
    @endif
</div>
@endsection
