@extends('layouts.app')

@section('title', 'Nova Pessoa')
@section('page-title', 'Nova Pessoa')

@section('content')
<div class="card">
    <div class="card-header">👥 Nova Pessoa</div>
    <form action="{{ route('pessoas.store') }}" method="POST">
        @csrf
        @include('pessoas._form')
        <div style="margin-top: 20px;">
            <button type="submit" class="btn btn-primary">Salvar</button>
            <a href="{{ route('pessoas.index') }}" class="btn btn-secondary">Cancelar</a>
        </div>
    </form>
</div>
@endsection
