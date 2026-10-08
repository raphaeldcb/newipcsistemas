<div class="form-group">
  <label>Tipo de Exame:</label>
  <input type="text" name="exame_tipo" value="{{ old('exame_tipo', $scei->exame_tipo ?? '') }}" required maxlength="100" placeholder="Ex: HIV, Hepatite, TB, Dengue, Malária">
  @error('exame_tipo') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Data do Exame:</label>
  <input type="datetime-local" name="data_exame" value="{{ old('data_exame', $scei?->data_exame?->format('Y-m-d\TH:i') ?? '') }}" required>
  @error('data_exame') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Fase:</label>
  <select name="scei_fase" required>
    <option value="">-- Selecione uma fase --</option>
    @foreach($fases as $id => $label)
      <option value="{{ $id }}" @if(old('scei_fase', $scei->scei_fase ?? 1) == $id) selected @endif>{{ $label }}</option>
    @endforeach
  </select>
  @error('scei_fase') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Resultado:</label>
  <input type="text" name="resultado" value="{{ old('resultado', $scei->resultado ?? '') }}" maxlength="255" placeholder="Ex: Positivo, Negativo, Inconclusivo">
  @error('resultado') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>ID da Amostra:</label>
  <input type="number" name="amostra_id" value="{{ old('amostra_id', $scei->amostra_id ?? '') }}" min="1">
  @error('amostra_id') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Data de Coleta:</label>
  <input type="date" name="data_coleta" value="{{ old('data_coleta', $scei?->data_coleta?->format('Y-m-d') ?? '') }}">
  @error('data_coleta') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Laboratório:</label>
  <select name="laboratorio_id">
    <option value="">-- Sem laboratório --</option>
    @foreach($laboratorios as $lab)
      <option value="{{ $lab->id }}" @if(old('laboratorio_id', $scei->laboratorio_id ?? null) == $lab->id) selected @endif>{{ $lab->name }}</option>
    @endforeach
  </select>
  @error('laboratorio_id') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Caso:</label>
  <select name="caso_id">
    <option value="">-- Sem caso --</option>
    @foreach($casos as $caso)
      <option value="{{ $caso->id }}" @if(old('caso_id', $scei->caso_id ?? null) == $caso->id) selected @endif>{{ $caso->numero ?? $caso->id }}</option>
    @endforeach
  </select>
  @error('caso_id') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Valor do Exame (R$):</label>
  <input type="number" name="valor_exame" value="{{ old('valor_exame', $scei->valor_exame ?? '') }}" step="0.01" min="0">
  @error('valor_exame') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Valor do Resultado:</label>
  <input type="text" name="resultado_valor" value="{{ old('resultado_valor', $scei->resultado_valor ?? '') }}" maxlength="100" placeholder="Ex: Negativo, CD4: 500">
  @error('resultado_valor') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Referência do Resultado:</label>
  <input type="text" name="resultado_referencia" value="{{ old('resultado_referencia', $scei->resultado_referencia ?? '') }}" maxlength="100" placeholder="Ex: Não reator">
  @error('resultado_referencia') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Unidade do Resultado:</label>
  <input type="text" name="resultado_unidade" value="{{ old('resultado_unidade', $scei->resultado_unidade ?? '') }}" maxlength="20" placeholder="Ex: U/mL, células/mL">
  @error('resultado_unidade') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Observações:</label>
  <textarea name="observacoes" maxlength="500">{{ old('observacoes', $scei->observacoes ?? '') }}</textarea>
  @error('observacoes') <span class="error">{{ $message }}</span> @enderror
</div>
