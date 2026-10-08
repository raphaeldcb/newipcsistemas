@extends('layouts.app')

@section('title', 'Comunicações')
@section('page-title', 'Comunicações')

@section('content')
<div class="card">
  <div class="card-header">
    📧 Comunicações
    <a href="{{ route('comunicacoes.create') }}" class="btn btn-primary" style="float:right;">+ Nova</a>
  </div>
  <table class="table">
    <thead>
      <tr>
        <th>Assunto</th>
        <th>De</th>
        <th>Para</th>
        <th>Classificação</th>
        <th>Data</th>
        <th>Ações</th>
      </tr>
    </thead>
    <tbody>
      @forelse($comunicacoes as $c)
        <tr>
          <td><a href="{{ route('comunicacoes.show', $c) }}">{{ $c->subject }}</a></td>
          <td>{{ $c->email_from }}</td>
          <td>{{ $c->email_to }}</td>
          <td><span class="badge badge-{{ strtolower($c->classification) }}">{{ $c->classification }}</span></td>
          <td>{{ $c->created_at->format('d/m/Y') }}</td>
          <td>
            <a href="{{ route('comunicacoes.edit', $c) }}" class="btn btn-secondary btn-sm">Editar</a>
            <form action="{{ route('comunicacoes.destroy', $c) }}" method="POST" style="display:inline;">
              @csrf @method('DELETE')
              <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Confirmar?')">Deletar</button>
            </form>
          </td>
        </tr>
      @empty
        <tr><td colspan="6" style="text-align:center; padding:20px;">Nenhuma comunicação registrada</td></tr>
      @endforelse
    </tbody>
  </table>
  {{ $comunicacoes->links() }}
</div>
@endsection
