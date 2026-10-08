@extends('layouts.app')
@section('title', 'Editar Processo')
@section('content')
<div class="container mt-5" style="max-width: 700px;">
  <div style="display: flex; align-items: center; margin-bottom: 30px;">
    <h2 style="margin: 0; flex: 1;">✏️ Editar Processo #{{ $processo->pro_cod }}</h2>
    <a href="{{ route('processos.show', $processo->pro_cod) }}" style="color: #7f8c8d; text-decoration: none;">← Voltar</a>
  </div>

  <form action="{{ route('processos.update', $processo->pro_cod) }}" method="POST" style="background: white; border-radius: 8px; padding: 30px; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">
    @csrf
    @method('PUT')

    <div style="margin-bottom: 20px;">
      <label style="display: block; font-weight: 600; color: #333; margin-bottom: 8px;">📋 Número do Processo</label>
      <input type="text" name="pro_nperc" value="{{ $processo->pro_nperc }}" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px;" required>
    </div>

    <div style="margin-bottom: 20px;">
      <label style="display: block; font-weight: 600; color: #333; margin-bottom: 8px;">📚 Tipo do Processo</label>
      <select name="pro_tipo" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px;">
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

    <div style="margin-bottom: 20px;">
      <label style="display: block; font-weight: 600; color: #333; margin-bottom: 8px;">👤 Autora</label>
      <input type="text" name="pro_auto" value="{{ $processo->pro_auto }}" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px;">
    </div>

    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px; margin-bottom: 20px;">
      <div>
        <label style="display: block; font-weight: 600; color: #333; margin-bottom: 8px;">🏛️ UF</label>
        <input type="text" name="uf_sigla" value="{{ $processo->uf_sigla }}" maxlength="2" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px;">
      </div>
      <div>
        <label style="display: block; font-weight: 600; color: #333; margin-bottom: 8px;">📂 Código do Caso</label>
        <input type="text" name="cas_codigo" value="{{ $processo->cas_codigo }}" maxlength="6" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px;">
      </div>
    </div>

    <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 15px; margin-bottom: 20px;">
      <div>
        <label style="display: block; font-weight: 600; color: #333; margin-bottom: 8px;">📅 Data Coleta</label>
        <input type="date" name="pro_dcole" value="{{ $processo->pro_dcole }}" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px;">
      </div>
      <div>
        <label style="display: block; font-weight: 600; color: #333; margin-bottom: 8px;">📥 Data Recebimento</label>
        <input type="date" name="pro_drec" value="{{ $processo->pro_drec }}" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px;">
      </div>
      <div>
        <label style="display: block; font-weight: 600; color: #333; margin-bottom: 8px;">✅ Data Resultado</label>
        <input type="date" name="pro_dresu" value="{{ $processo->pro_dresu }}" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px;">
      </div>
    </div>

    <div style="display: flex; gap: 10px; padding-top: 20px; border-top: 1px solid #ecf0f1;">
      <button type="submit" style="flex: 1; background: #3498db; color: white; border: none; padding: 12px; border-radius: 4px; font-weight: 600; cursor: pointer; font-size: 14px;">💾 Salvar Alterações</button>
      <a href="{{ route('processos.show', $processo->pro_cod) }}" style="flex: 1; background: #95a5a6; color: white; border: none; padding: 12px; border-radius: 4px; font-weight: 600; cursor: pointer; font-size: 14px; text-align: center; text-decoration: none;">✕ Cancelar</a>
    </div>
  </form>
</div>
@endsection
