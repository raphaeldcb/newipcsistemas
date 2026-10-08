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
        <div class="card">
            <h3 style="font-size: 16px; font-weight: 600; color: #333; margin: 0 0 15px 0;">💰 Créditos</h3>
            <p style="color: #666; margin: 0 0 15px 0; font-size: 13px;">Faturamento de créditos</p>
            <form method="GET" action="{{ route('relatorios.creditos.excel') }}">
                <div class="form-group" style="margin-bottom: 10px;">
                    <select name="caso_id" required style="padding: 8px; font-size: 13px;">
                        <option value="">-- Selecione --</option>
                        @foreach($casos as $caso)
                            <option value="{{ $caso->cas_contr }}">{{ $caso->pro_numero }}</option>
                        @endforeach
                    </select>
                </div>
                <button type="submit" class="btn" style="width: 100%; margin: 0; padding: 8px; background: #f39c12; color: white;">
                    Exportar Excel
                </button>
            </form>
        </div>

        <!-- Relatório de Extrações -->
        <div class="card">
            <h3 style="font-size: 16px; font-weight: 600; color: #333; margin: 0 0 15px 0;">🧬 Extrações DNA</h3>
            <p style="color: #666; margin: 0 0 15px 0; font-size: 13px;">Resultados de extrações</p>
            <form method="GET" action="{{ route('relatorios.extracao.pdf') }}">
                <div class="form-group" style="margin-bottom: 10px;">
                    <input type="text" name="extracao_id" placeholder="ID da Extração" required style="padding: 8px; font-size: 13px;">
                </div>
                <div style="display: flex; gap: 10px;">
                    <button type="submit" formaction="{{ route('relatorios.extracao.pdf') }}" class="btn btn-primary" style="flex: 1; margin: 0; padding: 8px;">
                        PDF
                    </button>
                    <button type="submit" formaction="{{ route('relatorios.extracao.excel') }}" class="btn" style="flex: 1; margin: 0; padding: 8px; background: #f39c12; color: white;">
                        Excel
                    </button>
                </div>
            </form>
        </div>

        <!-- Relatório de Auditoria -->
        <div class="card">
            <h3 style="font-size: 16px; font-weight: 600; color: #333; margin: 0 0 15px 0;">🔐 Auditoria</h3>
            <p style="color: #666; margin: 0 0 15px 0; font-size: 13px;">Histórico de mudanças</p>
            <form method="GET" action="{{ route('relatorios.auditoria.excel') }}">
                <div class="form-group" style="margin-bottom: 10px;">
                    <select name="caso_id" required style="padding: 8px; font-size: 13px;">
                        <option value="">-- Selecione --</option>
                        @foreach($casos as $caso)
                            <option value="{{ $caso->cas_contr }}">{{ $caso->pro_numero }}</option>
                        @endforeach
                    </select>
                </div>
                <button type="submit" class="btn" style="width: 100%; margin: 0; padding: 8px; background: #f39c12; color: white;">
                    Exportar Excel
                </button>
            </form>
        </div>
    </div>

    <!-- Aviso de Segurança -->
    <div class="alert alert-warning">
        <strong>Nota:</strong> Os arquivos gerados contêm dados sensíveis. Mantenha-os seguros e siga as políticas de segurança da empresa.
    </div>
</div>
@endsection
