<div class="form-group">
  <label>ID Amostra:</label>
  <input type="number" name="amostra_id" value="{{ old('amostra_id', $extracao->amostra_id ?? '') }}">
  @error('amostra_id') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Fase:</label>
  <select name="fase" required>
    <option>-- Selecione uma fase --</option>
    @foreach($fases as $fase)
      <option value="{{ $fase->value }}" @if(old('fase', $extracao->fase ?? null) == $fase->value) selected @endif>{{ $fase->label() }}</option>
    @endforeach
  </select>
  @error('fase') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Status:</label>
  <input type="text" name="status" value="{{ old('status', $extracao->status ?? 'PENDENTE') }}" required maxlength="50">
  @error('status') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Resultado:</label>
  <textarea name="resultado">{{ old('resultado', $extracao->resultado ?? '') }}</textarea>
  @error('resultado') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Data da Fase:</label>
  <input type="datetime-local" name="data_fase" value="{{ old('data_fase', isset($extracao->data_fase) ? $extracao->data_fase->format('Y-m-d H:i') : '') }}">
  @error('data_fase') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Observações:</label>
  <textarea name="observacoes">{{ old('observacoes', $extracao->observacoes ?? '') }}</textarea>
  @error('observacoes') <span class="error">{{ $message }}</span> @enderror
</div>
