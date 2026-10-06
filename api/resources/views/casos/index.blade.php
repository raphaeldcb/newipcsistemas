@extends('layouts.app')

@section('title', 'Casos')
@section('page-title', 'Casos')

@section('content')
<div class="card">
    <div class="card-header">
        📋 Lista de Casos
        <a href="javascript:void(0)" class="btn btn-primary" style="float: right;">+ Novo Caso</a>
    </div>

    <div style="margin-bottom: 20px;">
        <input type="text" placeholder="Buscar por número do processo, parte..." style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px;">
    </div>

    <table class="table">
        <thead>
            <tr>
                <th>Número</th>
                <th>Parte</th>
                <th>Vara</th>
                <th>Status</th>
                <th>Data Abertura</th>
                <th>Ação</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="6" style="text-align: center; padding: 30px; color: #95a5a6;">Nenhum caso registrado</td>
            </tr>
        </tbody>
    </table>
</div>
@endsection
