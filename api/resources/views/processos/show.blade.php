@extends('layouts.app')
@section('title', 'Processo #' . $processo->pro_cod)
@section('content')
<div class="container mt-5">
  <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
    <h2>Processo #{{ $processo->pro_cod }}</h2>
    <div>
      <a href="{{ route('processos.edit', $processo->pro_cod) }}" class="btn btn-warning">✏️ Editar</a>
      <form action="{{ route('processos.destroy', $processo->pro_cod) }}" method="POST" style="display: inline;">
        @csrf
        @method('DELETE')
        <button type="submit" class="btn btn-danger" onclick="return confirm('Deletar este processo?')">🗑️ Deletar</button>
      </form>
      <a href="{{ route('processos.index') }}" class="btn btn-secondary">← Voltar</a>
    </div>
  </div>

  @if(session('success'))
    <div class="alert alert-success">{{ session('success') }}</div>
  @endif

  <!-- Dados do Processo -->
  <div class="card mt-4">
    <div class="card-header bg-primary text-white">
      <h5 class="mb-0">📋 Dados do Processo</h5>
    </div>
    <div class="card-body">
      <div class="row">
        <div class="col-md-6">
          <p><strong>Número:</strong> {{ $processo->pro_nperc }}</p>
          <p><strong>Tipo:</strong> {{ $processo->pro_tipo ? ['Judicial', 'ExtraJudicial', 'Ministério Público', 'Defensoria Pública', 'Delegacia de Polícia', 'Justiça Comunitária', 'Conselho Tutelar', 'Promotoria de Justiça', 'Paternidade Responsável', 'Núcleo de Prática Forense', 'Direção do Foro', 'Autoridade Solicitante'][$processo->pro_tipo - 1] ?? 'N/A' : '-' }}</p>
          <p><strong>Autora:</strong> {{ $processo->pro_auto }}</p>
        </div>
        <div class="col-md-6">
          <p><strong>Data Coleta:</strong> {{ $processo->pro_dcole }}</p>
          <p><strong>Data Recebimento:</strong> {{ $processo->pro_drec }}</p>
          <p><strong>UF:</strong> {{ $processo->uf_sigla }} | <strong>Caso:</strong> {{ $processo->cas_codigo }}</p>
        </div>
      </div>
    </div>
  </div>

  <!-- Pessoas Envolvidas -->
  <div class="card mt-4">
    <div class="card-header bg-info text-white" style="display: flex; justify-content: space-between; align-items: center;">
      <h5 class="mb-0">👥 Pessoas Envolvidas</h5>
      <button class="btn btn-sm btn-light" onclick="document.getElementById('form-pessoa').style.display = document.getElementById('form-pessoa').style.display === 'none' ? 'block' : 'none'">+ Adicionar</button>
    </div>
    <div class="card-body">
      <!-- Formulário Adicionar Pessoa -->
      <div id="form-pessoa" style="display: none; margin-bottom: 20px; padding: 15px; background: #f9f9f9; border-radius: 4px;">
        <h6>Adicionar Nova Pessoa</h6>
        <form action="{{ route('processos.pessoas.store', $processo->pro_cod) }}" method="POST">
          @csrf
          <div class="row">
            <div class="col-md-6 mb-2">
              <input type="text" name="pes_nome" placeholder="Nome da Pessoa" class="form-control" required>
            </div>
            <div class="col-md-2 mb-2">
              <input type="text" name="pes_iniciais" placeholder="Iniciais" class="form-control" maxlength="10">
            </div>
            <div class="col-md-2 mb-2">
              <input type="number" name="pes_sit" placeholder="Situação" class="form-control">
            </div>
            <div class="col-md-2 mb-2">
              <button type="submit" class="btn btn-primary" style="width: 100%;">Salvar</button>
            </div>
          </div>
        </form>
      </div>

      @if($pessoas->count())
        <table class="table table-sm">
          <thead class="table-light">
            <tr><th>Código</th><th>Nome</th><th>Iniciais</th><th>Situação</th><th>Data Nascimento</th><th>Ação</th></tr>
          </thead>
          <tbody>
            @foreach($pessoas as $pessoa)
              <tr>
                <td>{{ $pessoa->pes_cod }}</td>
                <td>{{ $pessoa->pes_nome }}</td>
                <td>{{ $pessoa->pes_iniciais }}</td>
                <td>{{ $pessoa->pes_sit }}</td>
                <td>{{ $pessoa->pes_dtnas }}</td>
                <td>
                  <form action="{{ route('processos.pessoas.destroy', [$processo->pro_cod, $pessoa->pes_cod]) }}" method="POST" style="display: inline;">
                    @csrf
                    @method('DELETE')
                    <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Remover pessoa?')">🗑️</button>
                  </form>
                </td>
              </tr>
            @endforeach
          </tbody>
        </table>
      @else
        <p class="text-muted">Nenhuma pessoa vinculada</p>
      @endif
    </div>
  </div>

  <!-- Histórico do Processo -->
  <div class="card mt-4">
    <div class="card-header bg-success text-white" style="display: flex; justify-content: space-between; align-items: center;">
      <h5 class="mb-0">📜 Histórico do Processo</h5>
      <button class="btn btn-sm btn-light" onclick="document.getElementById('form-historico').style.display = document.getElementById('form-historico').style.display === 'none' ? 'block' : 'none'">+ Adicionar</button>
    </div>
    <div class="card-body">
      <!-- Formulário Adicionar Histórico -->
      <div id="form-historico" style="display: none; margin-bottom: 20px; padding: 15px; background: #f9f9f9; border-radius: 4px;">
        <h6>Adicionar Novo Histórico</h6>
        <form action="{{ route('processos.historicos.store', $processo->pro_cod) }}" method="POST">
          @csrf
          <div class="row">
            <div class="col-md-3 mb-2">
              <input type="date" name="his_data" class="form-control" required>
            </div>
            <div class="col-md-2 mb-2">
              <input type="number" name="ite_cod" placeholder="Item" class="form-control">
            </div>
            <div class="col-md-3 mb-2">
              <input type="text" name="his_doc" placeholder="Documento" class="form-control">
            </div>
            <div class="col-md-2 mb-2">
              <input type="text" name="his_obs" placeholder="Observação" class="form-control">
            </div>
            <div class="col-md-2 mb-2">
              <button type="submit" class="btn btn-primary" style="width: 100%;">Salvar</button>
            </div>
          </div>
        </form>
      </div>

      @if($historicos->count())
        <div class="table-responsive">
          <table class="table table-hover table-sm">
            <thead class="table-light">
              <tr><th>Data</th><th>Item</th><th>Documento</th><th>Observação</th><th>Ações</th></tr>
            </thead>
            <tbody>
              @foreach($historicos as $h)
                <tr>
                  <td><strong>{{ $h->his_data }}</strong></td>
                  <td><span class="badge bg-secondary">{{ $h->ite_cod }}</span></td>
                  <td>{{ $h->his_doc ?? '-' }}</td>
                  <td>{{ $h->his_obs ?? '-' }}</td>
                  <td>
                    <button type="button" class="btn btn-sm btn-warning" onclick="editHistorico({{ $h->his_contr }})">✏️</button>
                    <form action="{{ route('processos.historicos.destroy', [$processo->pro_cod, $h->his_contr]) }}" method="POST" style="display: inline;">
                      @csrf
                      @method('DELETE')
                      <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Deletar histórico?')">🗑️</button>
                    </form>
                  </td>
                </tr>
              @endforeach
            </tbody>
          </table>
        </div>
      @else
        <p class="text-muted text-center">Nenhum histórico registrado</p>
      @endif
    </div>
  </div>
</div>

<script>
function editHistorico(id) {
  alert('Edição de histórico - em desenvolvimento');
  // TODO: Implementar edição de histórico
}
</script>
@endsection
