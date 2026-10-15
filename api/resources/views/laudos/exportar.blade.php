@extends('layouts.app')

@section('content')
<div class="container mx-auto px-4 py-6">
    <!-- Cabeçalho -->
    <div class="mb-6">
        <h1 class="text-3xl font-bold text-gray-800 mb-2">Exportação de Laudos</h1>
        <p class="text-gray-600">Processo: <strong>{{ $processo->pro_nperc }}</strong></p>
    </div>

    @if ($errors->any())
    <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-6">
        <p class="font-bold">Erros encontrados:</p>
        <ul class="mt-2 ml-4 list-disc">
            @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
    @endif

    @if (session('success'))
    <div class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-6">
        {{ session('success') }}
    </div>
    @endif

    @if (session('error'))
    <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-6">
        {{ session('error') }}
    </div>
    @endif

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <!-- Coluna 1: Gerar Excel -->
        <div class="lg:col-span-2">
            <div class="bg-white rounded-lg shadow-md p-6">
                <h2 class="text-xl font-bold text-gray-800 mb-4">📊 Gerar Laudo em Excel</h2>

                <form action="{{ route('laudos.exportar', $processo) }}" method="POST" class="space-y-4">
                    @csrf

                    <!-- Tipo de Laudo -->
                    <div>
                        <label for="tipo_laudo" class="block text-sm font-medium text-gray-700 mb-2">
                            Tipo de Laudo
                        </label>
                        <select id="tipo_laudo" name="tipo_laudo" required class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                            <option value="">-- Selecionar tipo --</option>
                            <option value="DNA">🧬 Análise DNA</option>
                            <option value="HIV">⚕️ Análise HIV</option>
                            <option value="PATERNITY">👨‍👧 Paternidade</option>
                            <option value="SCEI">💊 SCEI</option>
                            <option value="GENERICO">📋 Genérico</option>
                        </select>
                        @error('tipo_laudo')
                        <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                        @enderror
                    </div>

                    <!-- Upload CSV (opcional) -->
                    <div>
                        <label for="csv_file" class="block text-sm font-medium text-gray-700 mb-2">
                            Importar Dados CSV (opcional)
                        </label>
                        <input type="file" id="csv_file" name="csv_file" accept=".csv,.txt" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                        <p class="text-gray-500 text-xs mt-1">Formatos: CSV, TXT (máx. 5 MB)</p>
                    </div>

                    <!-- Preview dos dados (preenchido após importar CSV) -->
                    <div id="preview-dados" class="hidden">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Preview dos Dados</label>
                        <div id="preview-conteudo" class="bg-gray-100 p-4 rounded-lg max-h-64 overflow-y-auto text-xs">
                            <!-- Preenchido via JavaScript -->
                        </div>
                    </div>

                    <!-- Campo JSON (oculto) com dados do CSV -->
                    <input type="hidden" id="dados_json" name="dados_json">

                    <!-- Botões -->
                    <div class="flex gap-3 pt-4">
                        <button type="button" id="btn-importar-csv" class="px-4 py-2 bg-gray-600 text-white rounded-lg hover:bg-gray-700 transition">
                            📂 Importar CSV
                        </button>
                        <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition flex-1">
                            ✨ Gerar Laudo Excel
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Coluna 2: Informações Rápidas -->
        <div>
            <div class="bg-white rounded-lg shadow-md p-6 space-y-4">
                <h3 class="font-bold text-gray-800">ℹ️ Informações do Processo</h3>

                <div class="text-sm space-y-3">
                    <div>
                        <p class="text-gray-600">Processo:</p>
                        <p class="font-semibold">{{ $processo->pro_nperc }}</p>
                    </div>

                    <div>
                        <p class="text-gray-600">Data Coleta:</p>
                        <p class="font-semibold">{{ $processo->pro_dcole?->format('d/m/Y') ?? 'N/A' }}</p>
                    </div>

                    <div>
                        <p class="text-gray-600">Data Resultado:</p>
                        <p class="font-semibold">{{ $processo->pro_dresu?->format('d/m/Y') ?? 'N/A' }}</p>
                    </div>

                    <div>
                        <p class="text-gray-600">Probabilidade:</p>
                        <p class="font-semibold">{{ $processo->pro_prob ?? 'N/A' }}%</p>
                    </div>

                    <div class="pt-2 border-t">
                        <a href="{{ route('processos.show', $processo) }}" class="text-blue-600 hover:underline text-sm">
                            ← Voltar ao Processo
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Exportações Realizadas -->
    <div class="mt-8 bg-white rounded-lg shadow-md p-6">
        <h2 class="text-xl font-bold text-gray-800 mb-4">📥 Laudos Exportados</h2>

        @if (count($exportacoes) > 0)
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead class="bg-gray-100 border-b">
                    <tr>
                        <th class="text-left px-4 py-2">Tipo</th>
                        <th class="text-left px-4 py-2">Arquivo</th>
                        <th class="text-left px-4 py-2">Data Exportação</th>
                        <th class="text-left px-4 py-2">Status</th>
                        <th class="text-right px-4 py-2">Ações</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($exportacoes as $exp)
                    <tr class="border-b hover:bg-gray-50">
                        <td class="px-4 py-2">
                            <span class="inline-block px-3 py-1 bg-blue-100 text-blue-800 rounded-full text-xs font-semibold">
                                {{ $exp['exp_tipo'] }}
                            </span>
                        </td>
                        <td class="px-4 py-2">
                            <code class="bg-gray-100 px-2 py-1 rounded text-xs">{{ $exp['exp_arquivo'] }}</code>
                        </td>
                        <td class="px-4 py-2">
                            {{ \Carbon\Carbon::parse($exp['exp_data'])->format('d/m/Y H:i') }}
                        </td>
                        <td class="px-4 py-2">
                            @if ($exp['exp_status'] === 'processado')
                            <span class="text-green-600 font-semibold">✓ Sucesso</span>
                            @elseif ($exp['exp_status'] === 'erro')
                            <span class="text-red-600 font-semibold">✗ Erro</span>
                            @else
                            <span class="text-yellow-600 font-semibold">⏳ Pendente</span>
                            @endif
                        </td>
                        <td class="px-4 py-2 text-right">
                            @if ($exp['exp_status'] === 'processado')
                            <a href="{{ route('laudos.download', [$processo, $exp['exp_arquivo']]) }}" class="text-blue-600 hover:underline mr-3">
                                ⬇️ Download
                            </a>
                            @endif
                            <form action="{{ route('laudos.deletar', [$processo, $exp['exp_cod']]) }}" method="POST" style="display:inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="text-red-600 hover:underline" onclick="return confirm('Confirmar deleção?')">
                                    🗑️ Deletar
                                </button>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        @else
        <p class="text-gray-500 text-center py-8">Nenhum laudo foi exportado ainda.</p>
        @endif
    </div>
</div>

<script>
document.getElementById('btn-importar-csv').addEventListener('click', function() {
    const fileInput = document.getElementById('csv_file');
    if (!fileInput.files.length) {
        alert('Por favor, selecione um arquivo CSV');
        return;
    }

    const formData = new FormData();
    formData.append('csv_file', fileInput.files[0]);

    fetch('{{ route("laudos.importar-csv", $processo) }}', {
        method: 'POST',
        headers: {
            'X-CSRF-TOKEN': document.querySelector('[name="csrf-token"]').content
        },
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Preencher preview
            const preview = document.getElementById('preview-conteudo');
            const html = data.dados.map((row, idx) => {
                const cols = Object.entries(row)
                    .map(([k, v]) => `<strong>${k}:</strong> ${v}`)
                    .join(' | ');
                return `<div class="py-1 border-b">Linha ${idx + 1}: ${cols}</div>`;
            }).join('');

            preview.innerHTML = html;
            document.getElementById('preview-dados').classList.remove('hidden');

            // Salvar JSON
            document.getElementById('dados_json').value = JSON.stringify(data.dados);

            alert(`✓ ${data.contador} linhas importadas com sucesso!`);
        } else {
            alert('Erro: ' + data.error);
        }
    })
    .catch(error => {
        console.error('Erro:', error);
        alert('Erro ao importar CSV');
    });
});
</script>
@endsection
