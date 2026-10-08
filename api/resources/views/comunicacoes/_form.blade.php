<div class="form-group">
  <label>De:</label>
  <input type="email" name="email_from" value="{{ old('email_from', $comunicacao->email_from ?? '') }}" required>
  @error('email_from') <span class="error">{{ $message }}</span> @enderror
</div>
<div class="form-group">
  <label>Para:</label>
  <input type="email" name="email_to" value="{{ old('email_to', $comunicacao->email_to ?? '') }}" required>
  @error('email_to') <span class="error">{{ $message }}</span> @enderror
</div>
<div class="form-group">
  <label>Assunto:</label>
  <input type="text" name="subject" value="{{ old('subject', $comunicacao->subject ?? '') }}" required>
  @error('subject') <span class="error">{{ $message }}</span> @enderror
</div>
<div class="form-group">
  <label>Corpo:</label>
  <textarea name="body" required>{{ old('body', $comunicacao->body ?? '') }}</textarea>
  @error('body') <span class="error">{{ $message }}</span> @enderror
</div>
<div class="form-group">
  <label>Caso (opcional):</label>
  <select name="caso_id">
    <option>-- Sem caso --</option>
    @foreach(\App\Models\Caso::all() as $caso)
      <option value="{{ $caso->id }}" @if(old('caso_id', $comunicacao->caso_id ?? null) == $caso->id) selected @endif>{{ $caso->numero }}</option>
    @endforeach
  </select>
</div>
