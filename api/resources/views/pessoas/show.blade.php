@extends('layouts.app')

@section('title', 'Pessoa')
@section('page-title', 'Detalhe da Pessoa')

@section('content')
<div style="display: grid; grid-template-columns: 2fr 1fr; gap: 20px;">
    <!-- Dados Pessoais -->
    <div class="card">
        <div class="card-header">👥 Informações Pessoais</div>
        <table style="width: 100%; margin-top: 15px;">
            <tr>
                <td style="font-weight: 600; padding: 10px 0; width: 30%;">Nome:</td>
                <td style="padding: 10px 0;">[Nome completo]</td>
            </tr>
            <tr style="border-top: 1px solid #eee;">
                <td style="font-weight: 600; padding: 10px 0;">CPF:</td>
                <td style="padding: 10px 0;">[CPF]</td>
            </tr>
            <tr style="border-top: 1px solid #eee;">
                <td style="font-weight: 600; padding: 10px 0;">Tipo:</td>
                <td style="padding: 10px 0;">Física</td>
            </tr>
            <tr style="border-top: 1px solid #eee;">
                <td style="font-weight: 600; padding: 10px 0;">Email:</td>
                <td style="padding: 10px 0;">[email@exemplo.com]</td>
            </tr>
            <tr style="border-top: 1px solid #eee;">
                <td style="font-weight: 600; padding: 10px 0;">Telefone:</td>
                <td style="padding: 10px 0;">[Telefone]</td>
            </tr>
            <tr style="border-top: 1px solid #eee;">
                <td style="font-weight: 600; padding: 10px 0;">Data Cadastro:</td>
                <td style="padding: 10px 0;">[Data]</td>
            </tr>
        </table>
    </div>

    <!-- Sidebar -->
    <div>
        <!-- Ações -->
        <div class="card">
            <div class="card-header" style="margin-bottom: 15px;">⚙️ Ações</div>
            <button class="btn btn-primary" style="width: 100%; margin-bottom: 10px;">Editar</button>
            <button class="btn btn-danger" style="width: 100%;">Deletar</button>
        </div>

        <!-- Casos Relacionados -->
        <div class="card">
            <div class="card-header" style="margin-bottom: 15px;">📋 Casos</div>
            <p style="color: #95a5a6; font-size: 14px;">0 casos</p>
        </div>

        <!-- Endereços -->
        <div class="card">
            <div class="card-header" style="margin-bottom: 15px;">📍 Endereços</div>
            <p style="color: #95a5a6; font-size: 14px;">Nenhum endereço</p>
        </div>
    </div>
</div>
@endsection
