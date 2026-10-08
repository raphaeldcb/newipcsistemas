@extends('layouts.app')

@section('title', 'Editar Pessoa')
@section('page-title', 'Editar Pessoa')

@section('content')
<div class="card">
    <div class="card-header">👥 Editar Pessoa</div>
    <form action="{{ route('pessoas.update', $pessoa) }}" method="POST">
        @csrf
        @method('PATCH')
        @include('pessoas._form')
        <div style="margin-top: 20px;">
            <button type="submit" class="btn btn-primary">Atualizar</button>
            <a href="{{ route('pessoas.show', $pessoa) }}" class="btn btn-secondary">Cancelar</a>
        </div>
    </form>
</div>
@endsection
