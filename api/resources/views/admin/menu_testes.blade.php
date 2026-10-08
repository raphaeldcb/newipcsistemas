@extends('layouts.app')

@section('title', 'Menu de Testes')
@section('page-title', 'Menu de Testes')

@section('content')
<div class="card">
    <div class="card-header">
        🧪 Gerenciador de Dados de Teste
    </div>
    <p style="color: #7f8c8d; font-size: 14px; margin-bottom: 20px;">
        Use as ferramentas abaixo para gerar ou limpar dados de teste da aplicação.
        Essas ações afetam APENAS dados de teste e não devem ser usadas em produção.
    </p>

    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px;">
        <!-- Gerar Dados de Teste -->
        <div class="card" style="background: #f0f8ff; border-left: 4px solid #3498db;">
            <div style="margin-bottom: 15px;">
                <h3 style="font-size: 18px; margin-bottom: 10px;">✨ Gerar Dados de Teste</h3>
                <p style="color: #7f8c8d; font-size: 13px; margin-bottom: 15px;">
                    Cria registros fictícios em todas as tabelas principais:
                </p>
                <ul style="color: #7f8c8d; font-size: 13px; padding-left: 20px; margin-bottom: 15px;">
                    <li>5 Pessoas (clientes/réus)</li>
                    <li>3 Casos</li>
                    <li>10 Comunicações</li>
                    <li>2 Kits</li>
                    <li>5 Extrações</li>
                </ul>
            </div>
            <form action="{{ route('admin.gerar_dados_teste') }}" method="POST" style="display: inline;">
                @csrf
                <button type="submit" class="btn btn-primary" style="width: 100%; text-align: center;">
                    Gerar Dados
                </button>
            </form>
        </div>

        <!-- Limpar Dados de Teste -->
        <div class="card" style="background: #ffe8e8; border-left: 4px solid #e74c3c;">
            <div style="margin-bottom: 15px;">
                <h3 style="font-size: 18px; margin-bottom: 10px;">🗑️ Limpar Dados de Teste</h3>
                <p style="color: #7f8c8d; font-size: 13px; margin-bottom: 15px;">
                    Remove TODOS os registros de teste das tabelas:
                </p>
                <ul style="color: #7f8c8d; font-size: 13px; padding-left: 20px; margin-bottom: 15px;">
                    <li>Pessoas</li>
                    <li>Casos</li>
                    <li>Comunicações</li>
                    <li>Kits, Extrações e relacionados</li>
                    <li>Créditos e históricos</li>
                </ul>
            </div>
            <form action="{{ route('admin.limpar_dados_teste') }}" method="POST" onsubmit="return confirm('⚠️ AVISO: Isso removerá TODOS os dados de teste. Você tem certeza?');">
                @csrf
                <button type="submit" class="btn btn-danger" style="width: 100%; text-align: center;">
                    Limpar Dados
                </button>
            </form>
        </div>
    </div>
</div>

<!-- Informações Adicionais -->
<div class="card">
    <div class="card-header">
        ℹ️ Informações
    </div>
    <div style="color: #555; font-size: 14px; line-height: 1.6;">
        <p style="margin-bottom: 10px;">
            <strong>⚠️ Aviso:</strong> Essas ferramentas foram desenvolvidas para facilitar testes e desenvolvimento.
        </p>
        <p style="margin-bottom: 10px;">
            <strong>Dados Gerados:</strong> Todos os dados criados são fictícios e aleatórios (nomes, CPFs, emails, etc).
        </p>
        <p style="margin-bottom: 10px;">
            <strong>Segurança:</strong> Essas rotas estão protegidas e apenas administradores com autenticação podem acessá-las.
        </p>
        <p>
            <strong>Próximos Passos:</strong> Implemente validação adicional de permissões, auditoria de ações admin, e limite de uso em desenvolvimento.
        </p>
    </div>
</div>

<!-- Voltar ao Dashboard -->
<div style="text-align: center; margin-top: 20px;">
    <a href="{{ route('admin.index') }}" class="btn btn-secondary">← Voltar ao Dashboard Admin</a>
</div>
@endsection
