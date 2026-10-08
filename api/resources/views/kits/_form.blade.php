<div class="form-group">
  <label>Número do Kit:</label>
  <input type="number" name="kit_num" value="{{ old('kit_num', $kit->kit_num ?? '') }}" required>
  @error('kit_num') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Status:</label>
  <select name="kit_status" required>
    <option value="">-- Selecione --</option>
    <option value="P" @if(old('kit_status', $kit->kit_status ?? null) == 'P') selected @endif>Preparado</option>
    <option value="A" @if(old('kit_status', $kit->kit_status ?? null) == 'A') selected @endif>Em Análise</option>
    <option value="X" @if(old('kit_status', $kit->kit_status ?? null) == 'X') selected @endif>Processado</option>
  </select>
  @error('kit_status') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Tipo de Kit (opcional):</label>
  <input type="number" name="kit_tip" value="{{ old('kit_tip', $kit->kit_tip ?? '') }}">
  @error('kit_tip') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Código de Coleta (opcional):</label>
  <input type="number" name="col_cod" value="{{ old('col_cod', $kit->col_cod ?? '') }}">
  @error('col_cod') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Data de Envio (opcional):</label>
  <input type="date" name="kit_denv" value="{{ old('kit_denv', $kit->kit_denv ?? '') }}">
  @error('kit_denv') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Data de Retorno (opcional):</label>
  <input type="date" name="kit_dret" value="{{ old('kit_dret', $kit->kit_dret ?? '') }}">
  @error('kit_dret') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Código de Exame (opcional):</label>
  <input type="number" name="kit_cexa" value="{{ old('kit_cexa', $kit->kit_cexa ?? '') }}">
  @error('kit_cexa') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
  <label>Número de Rastreamento (opcional):</label>
  <input type="text" name="kit_rastrear" value="{{ old('kit_rastrear', $kit->kit_rastrear ?? '') }}" maxlength="20">
  @error('kit_rastrear') <span class="error">{{ $message }}</span> @enderror
</div>
