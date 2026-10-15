@extends('layouts.app')

@section('title', 'Documentos - Processo ' . ($processo->pro_nperc ?? $processo->pro_cod))
@section('page-title', 'Documentos do Processo')

@section('content')
<div style="max-width: 1200px; margin: 0 auto; padding: 20px;">
    <a href="{{ route('processos.show', $processo->pro_cod) }}" class="btn btn-secondary" style="margin-bottom: 15px;">← Voltar</a>

    <!-- Header -->
    <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 20px; border-radius: 4px; color: white; margin-bottom: 20px;">
        <h3 style="margin: 0;">📄 Documentos Gerados</h3>
        <p style="margin: 5px 0 0 0; font-size: 14px; opacity: 0.9;">
            Processo: <strong>{{ $processo->pro_nperc ?? '-' }}</strong>
        </p>
    </div>

    <!-- Formulário Gerar Documento -->
    <div style="background: #fff; padding: 20px; border: 1px solid #ddd; border-radius: 4px; margin-bottom: 20px;">
        <h5 style="margin-top: 0;">➕ Gerar Novo Documento</h5>

        <form action="{{ route('processos.gerar-documento', $processo->pro_cod) }}" method="POST" style="display: flex; gap: 10px; flex-wrap: wrap;">
            @csrf

            <div style="flex: 0 0 auto;">
                <label style="display: block; font-size: 12px; color: #666; margin-bottom: 5px;">Tipo de Item</label>
                <select name="tipo_item" id="tipo_item" style="padding: 10px; border: 1px solid #ddd; border-radius: 4px; min-width: 150px;">
                    <option value="L">📋 Laudo</option>
                    <option value="F">📊 Folha Resultado</option>
                    <option value="A">✍️ Autorização Coleta</option>
                    <option value="R">🧾 Recibo</option>
                    <option value="E">📮 Termo Entrega</option>
                </select>
            </div>

            <div style="flex: 1; min-width: 200px;">
                <label style="display: block; font-size: 12px; color: #666; margin-bottom: 5px;">Template (opcional)</label>
                <select name="template" id="template" style="padding: 10px; border: 1px solid #ddd; border-radius: 4px; width: 100%;">
                    <option value="">-- Modelo padrão --</option>
                </select>
            </div>

            <div style="flex: 0 0 auto; display: flex; align-items: flex-end;">
                <button type="submit" class="btn btn-primary" style="padding: 10px 20px; background: #667eea; color: white; border: none; border-radius: 4px; cursor: pointer; font-weight: bold;">
                    🎯 Gerar
                </button>
            </div>
        </form>
    </div>

    <!-- Lista de Documentos -->
    @if(!empty($documentos))
        <div style="background: #fff; border: 1px solid #ddd; border-radius: 4px; overflow: hidden;">
            <table style="width: 100%; border-collapse: collapse;">
                <thead>
                    <tr style="background: #f5f5f5; border-bottom: 2px solid #ddd;">
                        <th style="padding: 12px; text-align: left; font-weight: bold;">📄 Documento</th>
                        <th style="padding: 12px; text-align: left; font-weight: bold;">📊 Tipo</th>
                        <th style="padding: 12px; text-align: left; font-weight: bold;">💾 Tamanho</th>
                        <th style="padding: 12px; text-align: left; font-weight: bold;">🕐 Criado em</th>
                        <th style="padding: 12px; text-align: center; font-weight: bold;">⚙️ Ações</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($documentos as $doc)
                        <tr style="border-bottom: 1px solid #eee; hover: background-color: #f9f9f9;">
                            <td style="padding: 12px; word-break: break-word;">
                                <strong>{{ $doc['nome'] }}</strong>
                            </td>
                            <td style="padding: 12px;">
                                @if($doc['tipo_item'] == 'L')
                                    <span style="background: #e74c3c; color: white; padding: 4px 8px; border-radius: 3px; font-size: 12px;">📋 Laudo</span>
                                @elseif($doc['tipo_item'] == 'F')
                                    <span style="background: #3498db; color: white; padding: 4px 8px; border-radius: 3px; font-size: 12px;">📊 Folha</span>
                                @elseif($doc['tipo_item'] == 'A')
                                    <span style="background: #27ae60; color: white; padding: 4px 8px; border-radius: 3px; font-size: 12px;">✍️ Autorizacao</span>
                                @else
                                    <span style="background: #95a5a6; color: white; padding: 4px 8px; border-radius: 3px; font-size: 12px;">{{ $doc['tipo_item'] }}</span>
                                @endif
                            </td>
                            <td style="padding: 12px;">
                                {{ round($doc['tamanho'] / 1024, 1) }} KB
                            </td>
                            <td style="padding: 12px;">
                                {{ \Carbon\Carbon::createFromTimestamp($doc['criado_em'])->format('d/m/Y H:i') }}
                            </td>
                            <td style="padding: 12px; text-align: center;">
                                <a href="{{ asset('storage/documents/generated/' . $doc['nome']) }}"
                                   class="btn btn-sm"
                                   style="background: #27ae60; color: white; padding: 6px 12px; border-radius: 3px; text-decoration: none; font-size: 12px; display: inline-block;"
                                   download>
                                    ⬇️ Download
                                </a>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    @else
        <div style="background: #fff; padding: 40px; border: 1px solid #ddd; border-radius: 4px; text-align: center; color: #7f8c8d;">
            <p style="font-size: 16px; margin: 0;">📭 Nenhum documento gerado ainda</p>
            <p style="font-size: 13px; margin: 10px 0 0 0;">Use o formulário acima para gerar seu primeiro documento</p>
        </div>
    @endif
</div>

<!-- Script para carregar templates dinamicamente -->
<script>
document.getElementById('tipo_item').addEventListener('change', function() {
    const tipoItem = this.value;
    const templateSelect = document.getElementById('template');

    // Limpar opções anteriores
    templateSelect.innerHTML = '<option value="">-- Modelo padrão --</option>';

    // Buscar templates via AJAX
    fetch(`{{ route('processos.listar-templates') }}?tipo_item=${tipoItem}`)
        .then(response => response.json())
        .then(data => {
            if (data.templates && data.templates.length > 0) {
                data.templates.forEach(template => {
                    const option = document.createElement('option');
                    option.value = template;
                    option.textContent = template;
                    templateSelect.appendChild(option);
                });
            }
        })
        .catch(error => console.error('Erro:', error));
});

// Carregar templates ao abrir a página
document.getElementById('tipo_item').dispatchEvent(new Event('change'));
</script>
@endsection
