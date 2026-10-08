@extends('layouts.app')
@section('title', 'Processo #' . $processo->pro_cod)
@section('content')
<div class="container mt-5">
  <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
    <h2>⚖️ Processo #{{ $processo->pro_cod }}</h2>
    <div style="gap: 10px; display: flex;">
      <a href="{{ route('processos.edit', $processo->pro_cod) }}" class="btn btn-warning" style="padding: 10px 15px;">✏️ Editar</a>
      <form action="{{ route('processos.destroy', $processo->pro_cod) }}" method="POST" style="display: inline;">
        @csrf
        @method('DELETE')
        <button type="submit" class="btn btn-danger" style="padding: 10px 15px;" onclick="return confirm('Deletar este processo?')">🗑️ Deletar</button>
      </form>
      <a href="{{ route('processos.index') }}" class="btn btn-secondary" style="padding: 10px 15px;">← Voltar</a>
    </div>
  </div>

  @if(session('success'))
    <div style="background: #d4edda; color: #155724; padding: 12px; border-radius: 4px; margin-bottom: 20px; border-left: 4px solid #28a745;">{{ session('success') }}</div>
  @endif

  <!-- Dados do Processo -->
  <div style="background: white; border-radius: 8px; padding: 20px; margin-bottom: 20px; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">
    <div style="border-bottom: 2px solid #3498db; padding-bottom: 15px; margin-bottom: 15px;">
      <h5 style="margin: 0; color: #3498db;">📋 Dados do Processo</h5>
    </div>
    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
      <div>
        <p style="margin: 0 0 10px 0;"><strong>Número:</strong> {{ $processo->pro_nperc ?? '-' }}</p>
        <p style="margin: 0 0 10px 0;"><strong>Tipo:</strong> <span style="background: #e8f4f8; padding: 4px 8px; border-radius: 4px;">{{ $processo->pro_tipo ? ['Judicial', 'ExtraJudicial', 'Ministério Público', 'Defensoria Pública', 'Delegacia de Polícia', 'Justiça Comunitária', 'Conselho Tutelar', 'Promotoria de Justiça', 'Paternidade Responsável', 'Núcleo de Prática Forense', 'Direção do Foro', 'Autoridade Solicitante'][$processo->pro_tipo - 1] ?? 'N/A' : '-' }}</span></p>
        <p style="margin: 0 0 10px 0;"><strong>Autora:</strong> {{ $processo->pro_auto ?? '-' }}</p>
        <p style="margin: 0;"><strong>UF:</strong> {{ $processo->uf_sigla ?? '-' }} | <strong>Caso:</strong> {{ $processo->cas_codigo ?? '-' }}</p>
      </div>
      <div>
        <p style="margin: 0 0 10px 0;"><strong>Data Coleta:</strong> {{ $processo->pro_dcole ? \Carbon\Carbon::parse($processo->pro_dcole)->format('d/m/Y') : '-' }}</p>
        <p style="margin: 0 0 10px 0;"><strong>Data Recebimento:</strong> {{ $processo->pro_drec ? \Carbon\Carbon::parse($processo->pro_drec)->format('d/m/Y') : '-' }}</p>
        <p style="margin: 0 0 10px 0;"><strong>Data Resultado:</strong> {{ $processo->pro_dresu ? \Carbon\Carbon::parse($processo->pro_dresu)->format('d/m/Y') : '-' }}</p>
        @if($caso)
          <p style="margin: 0; background: #fff3cd; padding: 8px; border-radius: 4px; border-left: 3px solid #ffc107;"><strong>Descrição do Caso:</strong> {{ $caso->cas_desc }}</p>
        @endif
      </div>
    </div>
  </div>

  <!-- Pessoas Envolvidas -->
  <div style="background: white; border-radius: 8px; padding: 20px; margin-bottom: 20px; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">
    <div style="border-bottom: 2px solid #27ae60; padding-bottom: 15px; margin-bottom: 15px; display: flex; justify-content: space-between; align-items: center;">
      <h5 style="margin: 0; color: #27ae60;">👥 Pessoas Envolvidas ({{ $pessoas->count() }})</h5>
      <button onclick="document.getElementById('form-pessoa').style.display = document.getElementById('form-pessoa').style.display === 'none' ? 'block' : 'none'" style="background: #27ae60; color: white; border: none; padding: 6px 12px; border-radius: 4px; cursor: pointer;">+ Adicionar</button>
    </div>

    <!-- Formulário Adicionar Pessoa -->
    <div id="form-pessoa" style="display: none; margin-bottom: 20px; padding: 15px; background: #f0f9f4; border-radius: 4px; border-left: 4px solid #27ae60;">
      <form action="{{ route('processos.pessoas.store', $processo->pro_cod) }}" method="POST">
        @csrf
        <div style="display: grid; grid-template-columns: 1fr 1fr 1fr auto; gap: 10px; align-items: flex-end;">
          <input type="text" name="pes_nome" placeholder="Nome da Pessoa" style="padding: 8px; border: 1px solid #ddd; border-radius: 4px;" required>
          <input type="text" name="pes_iniciais" placeholder="Iniciais" maxlength="10" style="padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
          <input type="date" name="pes_dtnas" style="padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
          <button type="submit" style="background: #27ae60; color: white; border: none; padding: 8px 15px; border-radius: 4px; cursor: pointer;">Salvar</button>
        </div>
      </form>
    </div>

    @if($pessoas->count())
      <div style="overflow-x: auto;">
        <table style="width: 100%; border-collapse: collapse;">
          <thead style="background: #ecf0f1;">
            <tr>
              <th style="padding: 12px; text-align: left; border-bottom: 1px solid #ddd;">Nome</th>
              <th style="padding: 12px; text-align: left; border-bottom: 1px solid #ddd;">Iniciais</th>
              <th style="padding: 12px; text-align: left; border-bottom: 1px solid #ddd;">Data Nasc.</th>
              <th style="padding: 12px; text-align: center; border-bottom: 1px solid #ddd;">Ação</th>
            </tr>
          </thead>
          <tbody>
            @foreach($pessoas as $pessoa)
              <tr style="border-bottom: 1px solid #ecf0f1; transition: background 0.2s;">
                <td style="padding: 12px;">{{ $pessoa->pes_nome }}</td>
                <td style="padding: 12px;">{{ $pessoa->pes_iniciais }}</td>
                <td style="padding: 12px;">{{ $pessoa->pes_dtnas ? \Carbon\Carbon::parse($pessoa->pes_dtnas)->format('d/m/Y') : '-' }}</td>
                <td style="padding: 12px; text-align: center;">
                  <form action="{{ route('processos.pessoas.destroy', [$processo->pro_cod, $pessoa->pes_cod]) }}" method="POST" style="display: inline;">
                    @csrf
                    @method('DELETE')
                    <button type="submit" style="background: #e74c3c; color: white; border: none; padding: 6px 10px; border-radius: 4px; cursor: pointer;" onclick="return confirm('Remover pessoa?')">🗑️ Remover</button>
                  </form>
                </td>
              </tr>
            @endforeach
          </tbody>
        </table>
      </div>
    @else
      <p style="color: #7f8c8d; text-align: center; padding: 20px 0;">Nenhuma pessoa vinculada</p>
    @endif
  </div>

  <!-- Histórico do Processo -->
  <div style="background: white; border-radius: 8px; padding: 20px; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">
    <div style="border-bottom: 2px solid #e74c3c; padding-bottom: 15px; margin-bottom: 15px; display: flex; justify-content: space-between; align-items: center;">
      <h5 style="margin: 0; color: #e74c3c;">📜 Histórico do Processo ({{ $historicos->count() }})</h5>
      <button onclick="document.getElementById('form-historico').style.display = document.getElementById('form-historico').style.display === 'none' ? 'block' : 'none'" style="background: #e74c3c; color: white; border: none; padding: 6px 12px; border-radius: 4px; cursor: pointer;">+ Adicionar</button>
    </div>

    <!-- Formulário Adicionar Histórico -->
    <div id="form-historico" style="display: none; margin-bottom: 20px; padding: 15px; background: #fef5f5; border-radius: 4px; border-left: 4px solid #e74c3c;">
      <form action="{{ route('processos.historicos.store', $processo->pro_cod) }}" method="POST">
        @csrf
        <div style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr auto; gap: 10px; align-items: flex-end;">
          <input type="date" name="his_data" style="padding: 8px; border: 1px solid #ddd; border-radius: 4px;" required>
          <select name="ite_cod" style="padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
            <option value="">-- Selecionar Item --</option>
            @foreach($items as $item)
              <option value="{{ $item->ite_cod }}">{{ $item->ite_desc }}</option>
            @endforeach
          </select>
          <input type="text" name="his_doc" placeholder="Documento" style="padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
          <input type="text" name="his_obs" placeholder="Observação" style="padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
          <button type="submit" style="background: #e74c3c; color: white; border: none; padding: 8px 15px; border-radius: 4px; cursor: pointer;">Salvar</button>
        </div>
      </form>
    </div>

    @if($historicos->count())
      <div style="overflow-x: auto;">
        <table style="width: 100%; border-collapse: collapse;">
          <thead style="background: #ecf0f1;">
            <tr>
              <th style="padding: 12px; text-align: left; border-bottom: 1px solid #ddd;">Data</th>
              <th style="padding: 12px; text-align: left; border-bottom: 1px solid #ddd;">Item</th>
              <th style="padding: 12px; text-align: left; border-bottom: 1px solid #ddd;">Documento</th>
              <th style="padding: 12px; text-align: left; border-bottom: 1px solid #ddd;">Observação</th>
              <th style="padding: 12px; text-align: center; border-bottom: 1px solid #ddd;">Ações</th>
            </tr>
          </thead>
          <tbody>
            @foreach($historicos as $h)
              <tr style="border-bottom: 1px solid #ecf0f1; transition: background 0.2s;">
                <td style="padding: 12px;"><strong>{{ $h->his_data ? \Carbon\Carbon::parse($h->his_data)->format('d/m/Y') : '-' }}</strong></td>
                <td style="padding: 12px;"><span style="background: #e8f4f8; padding: 4px 8px; border-radius: 4px;">{{ $h->ite_cod }}</span></td>
                <td style="padding: 12px;">{{ $h->his_doc ?? '-' }}</td>
                <td style="padding: 12px;">{{ $h->his_obs ?? '-' }}</td>
                <td style="padding: 12px; text-align: center;">
                  <form action="{{ route('processos.historicos.destroy', [$processo->pro_cod, $h->his_contr]) }}" method="POST" style="display: inline;">
                    @csrf
                    @method('DELETE')
                    <button type="submit" style="background: #e74c3c; color: white; border: none; padding: 6px 10px; border-radius: 4px; cursor: pointer;" onclick="return confirm('Deletar histórico?')">🗑️ Deletar</button>
                  </form>
                </td>
              </tr>
            @endforeach
          </tbody>
        </table>
      </div>
    @else
      <p style="color: #7f8c8d; text-align: center; padding: 20px 0;">Nenhum histórico registrado</p>
    @endif
  </div>
</div>
@endsection
