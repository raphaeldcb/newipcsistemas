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

  <div class="card mt-4">
    <div class="card-header bg-primary text-white">
      <h5 class="mb-0">📋 Dados do Processo</h5>
    </div>
    <div class="card-body">
      <div class="row">
        <div class="col-md-6">
          <p><strong>Número:</strong> {{ $processo->pro_nperc }}</p>
          <p><strong>Tipo:</strong> {{ $processo->pro_tipo }}</p>
          <p><strong>Autora:</strong> {{ $processo->pro_auto }}</p>
        </div>
        <div class="col-md-6">
          <p><strong>Data Cadastro:</strong> {{ $processo->pro_dcad }}</p>
          <p><strong>Data Recebimento:</strong> {{ $processo->pro_drec }}</p>
          <p><strong>UF:</strong> {{ $processo->uf_sigla }} | <strong>Caso:</strong> {{ $processo->cas_codigo }}</p>
        </div>
      </div>
    </div>
  </div>

  <div class="card mt-4">
    <div class="card-header bg-info text-white">
      <h5 class="mb-0">👥 Pessoas Envolvidas</h5>
    </div>
    <div class="card-body">
      @if($pessoas->count())
        <table class="table table-sm">
          <thead class="table-light">
            <tr><th>Código</th><th>Nome</th><th>Iniciais</th><th>Situação</th><th>Data Nascimento</th></tr>
          </thead>
          <tbody>
            @foreach($pessoas as $pessoa)
              <tr>
                <td>{{ $pessoa->pes_cod }}</td>
                <td>{{ $pessoa->pes_nome }}</td>
                <td>{{ $pessoa->pes_iniciais }}</td>
                <td>{{ $pessoa->pes_sit }}</td>
                <td>{{ $pessoa->pes_dtnas }}</td>
              </tr>
            @endforeach
          </tbody>
        </table>
      @else
        <p class="text-muted">Nenhuma pessoa vinculada a este processo</p>
      @endif
    </div>
  </div>

  <div class="card mt-4">
    <div class="card-header bg-success text-white">
      <h5 class="mb-0">📜 Histórico do Processo</h5>
    </div>
    <div class="card-body">
      @if($historicos->count())
        <div class="table-responsive">
          <table class="table table-hover table-sm">
            <thead class="table-light">
              <tr><th>Data</th><th>Item (Código)</th><th>Documento</th><th>Observação</th></tr>
            </thead>
            <tbody>
              @foreach($historicos as $h)
                <tr>
                  <td><strong>{{ $h->his_data }}</strong></td>
                  <td><span class="badge bg-secondary">{{ $h->ite_cod }}</span></td>
                  <td>{{ $h->his_doc ?? '-' }}</td>
                  <td>{{ $h->his_obs ?? '-' }}</td>
                </tr>
              @endforeach
            </tbody>
          </table>
        </div>
      @else
        <p class="text-muted text-center">Nenhum histórico registrado para este processo</p>
      @endif
    </div>
  </div>
</div>
@endsection
