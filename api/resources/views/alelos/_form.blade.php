<div class="form-group">
  <label>Extração:</label>
  <select name="extracao_id" required>
    <option value="">-- Selecione uma extração --</option>
    @foreach($extracos as $extracao)
      <option value="{{ $extracao->ext_cod }}" @if(old('extracao_id', $alelo->extracao_id ?? null) == $extracao->ext_cod) selected @endif>
        Extração #{{ $extracao->ext_cod }} ({{ $extracao->status }})
      </option>
    @endforeach
  </select>
  @error('extracao_id') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Tipo de Alelo:</label>
  <select name="tipo_alelo" required>
    <option value="">-- Selecione um tipo --</option>
    @foreach($tipos_alelo as $tipo)
      <option value="{{ $tipo }}" @if(old('tipo_alelo', $alelo->tipo_alelo ?? null) == $tipo) selected @endif>{{ $tipo }}</option>
    @endforeach
  </select>
  @error('tipo_alelo') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Marcador:</label>
  <input type="text" name="marcador" value="{{ old('marcador', $alelo->marcador ?? '') }}" required maxlength="100" placeholder="Ex: D8S1179, D21S11">
  @error('marcador') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-row">
  <div class="form-group" style="flex: 1;">
    <label>Alelo 1:</label>
    <input type="text" name="alelo1" value="{{ old('alelo1', $alelo->alelo1 ?? '') }}" required maxlength="50" placeholder="Ex: 13">
    @error('alelo1') <span class="error">{{ $message }}</span> @enderror
  </div>

  <div class="form-group" style="flex: 1;">
    <label>Alelo 2:</label>
    <input type="text" name="alelo2" value="{{ old('alelo2', $alelo->alelo2 ?? '') }}" maxlength="50" placeholder="Ex: 15">
    @error('alelo2') <span class="error">{{ $message }}</span> @enderror
  </div>
</div>

<div class="form-group">
  <label>Genótipo:</label>
  <input type="text" name="genótipo" value="{{ old('genótipo', $alelo->genótipo ?? '') }}" maxlength="100" placeholder="Ex: 13/15 (gerado automaticamente)">
  @error('genótipo') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-row">
  <div class="form-group" style="flex: 1;">
    <label>Frequência Alelo 1:</label>
    <input type="number" name="frequencia_alelo1" value="{{ old('frequencia_alelo1', $alelo->frequencia_alelo1 ?? '') }}" step="0.0001" min="0" max="1" placeholder="0.0000 a 1.0000">
    @error('frequencia_alelo1') <span class="error">{{ $message }}</span> @enderror
  </div>

  <div class="form-group" style="flex: 1;">
    <label>Frequência Alelo 2:</label>
    <input type="number" name="frequencia_alelo2" value="{{ old('frequencia_alelo2', $alelo->frequencia_alelo2 ?? '') }}" step="0.0001" min="0" max="1" placeholder="0.0000 a 1.0000">
    @error('frequencia_alelo2') <span class="error">{{ $message }}</span> @enderror
  </div>
</div>

<div class="form-group">
  <label>Data de Análise:</label>
  <input type="datetime-local" name="data_analise" value="{{ old('data_analise', $alelo->data_analise ? $alelo->data_analise->format('Y-m-d\TH:i') : '') }}">
  @error('data_analise') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Observações:</label>
  <textarea name="observacoes" maxlength="1000" style="height: 100px;">{{ old('observacoes', $alelo->observacoes ?? '') }}</textarea>
  @error('observacoes') <span class="error">{{ $message }}</span> @enderror
</div>
