@extends('layouts.app')
@section('title', 'Novo Processo')
@section('content')
<div class="container mt-5" style="max-width: 600px;">
  <h2>Novo Processo</h2>
  
  <form action="{{ route('processos.store') }}" method="POST" class="card p-4 mt-4">
    @csrf
    
    <div class="mb-3">
      <label class="form-label">Número do Processo</label>
      <input type="text" name="pro_nperc" class="form-control" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Tipo do Processo</label>
      <select name="pro_tipo" class="form-control">
        <option value="">-- Selecione --</option>
        <option value="1">Judicial</option>
        <option value="2">ExtraJudicial</option>
        <option value="3">Ministério Público</option>
        <option value="4">Defensoria Pública</option>
        <option value="5">Delegacia de Polícia</option>
        <option value="6">Justiça Comunitária</option>
        <option value="7">Conselho Tutelar</option>
        <option value="8">Promotoria de Justiça</option>
        <option value="9">Paternidade Responsável</option>
        <option value="10">Núcleo de Prática Forense</option>
        <option value="11">Direção do Foro</option>
        <option value="12">Autoridade Solicitante</option>
      </select>
    </div>

    <div class="mb-3">
      <label class="form-label">Autora</label>
      <input type="text" name="pro_auto" class="form-control">
    </div>

    <div class="mb-3">
      <label class="form-label">UF</label>
      <input type="text" name="uf_sigla" class="form-control" maxlength="2">
    </div>

    <div class="mb-3">
      <label class="form-label">Código do Caso</label>
      <input type="text" name="cas_codigo" class="form-control" maxlength="6">
    </div>

    <div class="mb-3">
      <label class="form-label">Data Coleta</label>
      <input type="date" name="pro_dcole" class="form-control">
    </div>

    <div class="mb-3">
      <label class="form-label">Data Recebimento</label>
      <input type="date" name="pro_drec" class="form-control">
    </div>

    <div class="mb-3">
      <label class="form-label">Data Resultado</label>
      <input type="date" name="pro_dresu" class="form-control">
    </div>

    <div class="d-flex gap-2">
      <button type="submit" class="btn btn-primary">Criar Processo</button>
      <a href="{{ route('processos.index') }}" class="btn btn-secondary">Cancelar</a>
    </div>
  </form>
</div>
@endsection
