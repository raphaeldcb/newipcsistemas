<div class="form-group">
    <label for="nome">Nome:</label>
    <input type="text" id="nome" name="nome" value="{{ old('nome', $pessoa->nome ?? '') }}" required class="form-control">
    @error('nome') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
    <label for="tipo">Tipo:</label>
    <select id="tipo" name="tipo" required class="form-control">
        <option value="">-- Selecione --</option>
        <option value="FISICA" @if(old('tipo', $pessoa->tipo ?? null) == 'FISICA') selected @endif>Pessoa Física</option>
        <option value="JURIDICA" @if(old('tipo', $pessoa->tipo ?? null) == 'JURIDICA') selected @endif>Pessoa Jurídica</option>
    </select>
    @error('tipo') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
    <label for="documento">CPF/CNPJ:</label>
    <input type="text" id="documento" name="documento" value="{{ old('documento', $pessoa->documento ?? '') }}" class="form-control">
    @error('documento') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="{{ old('email', $pessoa->email ?? '') }}" class="form-control">
    @error('email') <span class="error">{{ $message }}</span> @enderror
</div>

<div class="form-group">
    <label for="telefone">Telefone:</label>
    <input type="text" id="telefone" name="telefone" value="{{ old('telefone', $pessoa->telefone ?? '') }}" class="form-control">
    @error('telefone') <span class="error">{{ $message }}</span> @enderror
</div>
