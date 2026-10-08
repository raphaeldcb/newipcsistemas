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
      <label class="form-label">Tipo do Processo</label>
      <select name="pro_tipo" class="form-control">
        <option value="">-- Selecione --</option>
        <option value="1" {{ $processo->pro_tipo == 1 ? 'selected' : '' }}>Judicial</option>
        <option value="2" {{ $processo->pro_tipo == 2 ? 'selected' : '' }}>ExtraJudicial</option>
        <option value="3" {{ $processo->pro_tipo == 3 ? 'selected' : '' }}>Ministério Público</option>
        <option value="4" {{ $processo->pro_tipo == 4 ? 'selected' : '' }}>Defensoria Pública</option>
        <option value="5" {{ $processo->pro_tipo == 5 ? 'selected' : '' }}>Delegacia de Polícia</option>
        <option value="6" {{ $processo->pro_tipo == 6 ? 'selected' : '' }}>Justiça Comunitária</option>
        <option value="7" {{ $processo->pro_tipo == 7 ? 'selected' : '' }}>Conselho Tutelar</option>
        <option value="8" {{ $processo->pro_tipo == 8 ? 'selected' : '' }}>Promotoria de Justiça</option>
        <option value="9" {{ $processo->pro_tipo == 9 ? 'selected' : '' }}>Paternidade Responsável</option>
        <option value="10" {{ $processo->pro_tipo == 10 ? 'selected' : '' }}>Núcleo de Prática Forense</option>
        <option value="11" {{ $processo->pro_tipo == 11 ? 'selected' : '' }}>Direção do Foro</option>
        <option value="12" {{ $processo->pro_tipo == 12 ? 'selected' : '' }}>Autoridade Solicitante</option>
      </select>
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
      <label class="form-label">Data Coleta</label>
      <input type="date" name="pro_dcole" class="form-control" value="{{ $processo->pro_dcole }}">
    </div>

    <div class="mb-3">
      <label class="form-label">Data Recebimento</label>
      <input type="date" name="pro_drec" class="form-control" value="{{ $processo->pro_drec }}">
    </div>

    <div class="mb-3">
      <label class="form-label">Data Resultado</label>
      <input type="date" name="pro_dresu" class="form-control" value="{{ $processo->pro_dresu }}">
    </div>

    <div class="d-flex gap-2">
      <button type="submit" class="btn btn-primary">Salvar</button>
      <a href="{{ route('processos.show', $processo->pro_cod) }}" class="btn btn-secondary">Cancelar</a>
    </div>
  </form>
</div>
@endsection
