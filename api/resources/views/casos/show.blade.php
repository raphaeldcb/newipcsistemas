@extends('layouts.app')

@section('title', 'Caso')
@section('page-title', 'Detalhe do Caso')

@section('content')
<div style="display: grid; grid-template-columns: 2fr 1fr; gap: 20px;">
    <!-- Dados do Caso -->
    <div class="card">
        <div class="card-header">📋 Informações do Caso</div>
        <table style="width: 100%; margin-top: 15px;">
            <tr>
                <td style="font-weight: 600; padding: 10px 0;">Número:</td>
                <td style="padding: 10px 0;">[Número do processo]</td>
            </tr>
            <tr style="border-top: 1px solid #eee;">
                <td style="font-weight: 600; padding: 10px 0;">Parte:</td>
                <td style="padding: 10px 0;">[Nome da parte]</td>
            </tr>
            <tr style="border-top: 1px solid #eee;">
                <td style="font-weight: 600; padding: 10px 0;">Vara:</td>
                <td style="padding: 10px 0;">[Vara]</td>
            </tr>
            <tr style="border-top: 1px solid #eee;">
                <td style="font-weight: 600; padding: 10px 0;">Comarca:</td>
                <td style="padding: 10px 0;">[Comarca]</td>
            </tr>
            <tr style="border-top: 1px solid #eee;">
                <td style="font-weight: 600; padding: 10px 0;">Juiz:</td>
                <td style="padding: 10px 0;">[Nome do juiz]</td>
            </tr>
            <tr style="border-top: 1px solid #eee;">
                <td style="font-weight: 600; padding: 10px 0;">Data Abertura:</td>
                <td style="padding: 10px 0;">[Data]</td>
            </tr>
        </table>
    </div>

    <!-- Sidebar -->
    <div>
        <!-- Status -->
        <div class="card">
            <div class="card-header" style="margin-bottom: 15px;">🎯 Status</div>
            <p style="margin-bottom: 15px;">
                <span class="badge badge-info">ABERTO</span>
            </p>
            <button class="btn btn-secondary" style="width: 100%;">Transicionar</button>
        </div>

        <!-- Comunicações Relacionadas -->
        <div class="card">
            <div class="card-header" style="margin-bottom: 15px;">📧 Comunicações</div>
            <p style="color: #95a5a6; font-size: 14px;">0 comunicações</p>
        </div>

        <!-- Créditos -->
        <div class="card">
            <div class="card-header" style="margin-bottom: 15px;">💰 Créditos</div>
            <p style="color: #95a5a6; font-size: 14px;">Nenhum crédito</p>
        </div>
    </div>
</div>
@endsection
