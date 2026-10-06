@extends('layouts.app')

@section('title', 'Comunicações')
@section('page-title', 'Comunicações')

@section('content')
<div class="card">
    <div class="card-header">
        📧 Lista de Comunicações
        <a href="javascript:void(0)" class="btn btn-primary" style="float: right;">+ Nova</a>
    </div>

    <div style="margin-bottom: 20px;">
        <input type="text" placeholder="Buscar por assunto, remetente..." style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px;">
    </div>

    <table class="table">
        <thead>
            <tr>
                <th>Assunto</th>
                <th>Remetente</th>
                <th>Classificação</th>
                <th>Confiança</th>
                <th>Data</th>
                <th>Ação</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="6" style="text-align: center; padding: 30px; color: #95a5a6;">Nenhuma comunicação registrada</td>
            </tr>
        </tbody>
    </table>
</div>
@endsection
