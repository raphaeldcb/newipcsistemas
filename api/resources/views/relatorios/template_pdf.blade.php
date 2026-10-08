<!-- Template para referência de PDF -->
<!-- Os PDFs são gerados via TCPDF no RelatorioService -->

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>{{ $titulo ?? 'Relatório' }}</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            color: #333;
            line-height: 1.6;
        }

        .header {
            background-color: #1f2937;
            color: white;
            padding: 20px;
            text-align: center;
            margin-bottom: 20px;
        }

        .header h1 {
            font-size: 24px;
            margin-bottom: 5px;
        }

        .header p {
            font-size: 12px;
            opacity: 0.9;
        }

        .section {
            margin-bottom: 20px;
        }

        .section h2 {
            font-size: 16px;
            color: #1f2937;
            border-bottom: 2px solid #3b82f6;
            padding-bottom: 8px;
            margin-bottom: 12px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 12px;
        }

        th {
            background-color: #f3f4f6;
            color: #1f2937;
            padding: 10px;
            text-align: left;
            font-weight: bold;
            border-bottom: 1px solid #d1d5db;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid #e5e7eb;
        }

        tr:hover {
            background-color: #f9fafb;
        }

        .summary-box {
            background-color: #eff6ff;
            border-left: 4px solid #3b82f6;
            padding: 12px;
            margin-bottom: 12px;
        }

        .summary-box strong {
            color: #1f2937;
        }

        .footer {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #d1d5db;
            font-size: 12px;
            color: #6b7280;
            text-align: center;
        }

        .badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: bold;
        }

        .badge-judicial {
            background-color: #dbeafe;
            color: #0c4a6e;
        }

        .badge-non-judicial {
            background-color: #fef3c7;
            color: #92400e;
        }

        .page-break {
            page-break-after: always;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>{{ $titulo ?? 'Relatório' }}</h1>
        <p>Gerado em: {{ $data_geracao ?? now()->format('d/m/Y H:i:s') }}</p>
    </div>

    <!-- Espaço reservado para conteúdo dinâmico -->
    <div class="section">
        <h2>Resumo</h2>
        <div class="summary-box">
            <p>Este é um template de referência. Os relatórios são gerados dinamicamente via TCPDF.</p>
        </div>
    </div>

    <div class="footer">
        <p>© {{ now()->year }} Sistema IPC Unificado. Todos os direitos reservados.</p>
    </div>
</body>
</html>
