@extends('layouts.app')

@section('title', 'Pessoas')
@section('page-title', 'Pessoas')

@section('content')
<div class="card">
    <div class="card-header">
        👥 Lista de Pessoas
        <a href="javascript:void(0)" class="btn btn-primary" style="float: right;">+ Nova Pessoa</a>
    </div>

    <div style="margin-bottom: 20px;">
        <input type="text" placeholder="Buscar por nome ou CPF..." style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px;">
    </div>

    <table class="table">
        <thead>
            <tr>
                <th>Nome</th>
                <th>CPF</th>
                <th>Tipo</th>
                <th>Contato</th>
                <th>Data Cadastro</th>
                <th>Ação</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="6" style="text-align: center; padding: 30px; color: #95a5a6;">Nenhuma pessoa registrada</td>
            </tr>
        </tbody>
    </table>
</div>
@endsection
