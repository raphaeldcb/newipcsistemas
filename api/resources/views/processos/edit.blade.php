@extends('layouts.app')
@section('title', 'Editar Processo')
@section('content')
<div class="container mt-5" style="max-width: 600px;">
  <h2>Editar Processo #{{ $processo->pro_cod }}</h2>
  
  <form action="{{ route('processos.update', $processo->pro_cod) }}" method="POST" class="card p-4 mt-4">
    @csrf
    @method('PUT')
    
    <div class="mb-3">
      <label class="form-label">Número do Processo</label>
      <input type="text" name="pro_nperc" class="form-control" value="{{ $processo->pro_nperc }}" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Tipo</label>
      <input type="number" name="pro_tipo" class="form-control" value="{{ $processo->pro_tipo }}">
    </div>

    <div class="mb-3">
      <label class="form-label">Autora</label>
      <input type="text" name="pro_auto" class="form-control" value="{{ $processo->pro_auto }}">
    </div>

    <div class="mb-3">
      <label class="form-label">UF</label>
      <input type="text" name="uf_sigla" class="form-control" maxlength="2" value="{{ $processo->uf_sigla }}">
    </div>

    <div class="mb-3">
      <label class="form-label">Código do Caso</label>
      <input type="text" name="cas_codigo" class="form-control" maxlength="6" value="{{ $processo->cas_codigo }}">
    </div>

    <div class="mb-3">
      <label class="form-label">Data Cadastro</label>
      <input type="date" name="pro_dcad" class="form-control" value="{{ $processo->pro_dcad }}">
    </div>

    <div class="mb-3">
      <label class="form-label">Data Recebimento</label>
      <input type="date" name="pro_drec" class="form-control" value="{{ $processo->pro_drec }}">
    </div>

    <div class="d-flex gap-2">
      <button type="submit" class="btn btn-primary">Salvar</button>
      <a href="{{ route('processos.show', $processo->pro_cod) }}" class="btn btn-secondary">Cancelar</a>
    </div>
  </form>
</div>
@endsection
