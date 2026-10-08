<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Comunicacao;
use App\Models\Caso;
use App\Models\Pessoa;
use App\Models\Kit;
use App\Models\Extracao;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class AdminController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('admin'); // Será criado próximo
    }

    /**
     * Dashboard Admin — Exibe estatísticas gerais
     */
    public function index()
    {
        $stats = [
            'comunicacoes' => Comunicacao::count(),
            'casos' => Caso::count(),
            'pessoas' => Pessoa::count(),
            'kits' => Kit::count(),
            'extracos' => Extracao::count(),
            'usuarios' => DB::table('users')->count(),
        ];

        return view('admin.dashboard', compact('stats'));
    }

    /**
     * Menu de Testes — Exibe opções para gerar/limpar dados
     */
    public function menu_testes()
    {
        return view('admin.menu_testes');
    }

    /**
     * Gera Dados de Teste — Cria registros fictícios em todas as tabelas
     */
    public function gerar_dados_teste(Request $request)
    {
        try {
            DB::beginTransaction();

            // Gerar 5 Pessoas (clientes/réus)
            $pessoas = [];
            for ($i = 1; $i <= 5; $i++) {
                $pessoa = Pessoa::create([
                    'nome' => "Pessoa Teste #{$i}",
                    'cpf' => fake()->cpf(false),
                    'email' => fake()->unique()->safeEmail(),
                    'telefone' => fake()->phoneNumber(),
                    'data_nascimento' => fake()->dateOfBirth(),
                    'tipo' => fake()->randomElement(['fisica', 'juridica']),
                    'status' => 'ativo',
                ]);
                $pessoas[] = $pessoa;
            }

            // Gerar 3 Casos
            $casos = [];
            for ($i = 1; $i <= 3; $i++) {
                $caso = Caso::create([
                    'numero' => sprintf('%07d', rand(1000000, 9999999)),
                    'vara' => "Vara #{$i}",
                    'comarca' => fake()->city(),
                    'tipo' => fake()->randomElement(['acao_alimentos', 'acao_cobranca', 'acao_indenizacao']),
                    'status' => fake()->randomElement(['aberto', 'em_andamento', 'finalizado']),
                    'descricao' => fake()->sentence(10),
                    'data_abertura' => fake()->dateTime(),
                ]);
                $casos[] = $caso;
            }

            // Gerar 10 Comunicações
            for ($i = 1; $i <= 10; $i++) {
                $caso = $casos[rand(0, count($casos) - 1)];
                Comunicacao::create([
                    'caso_id' => $caso->id,
                    'de' => $pessoas[rand(0, count($pessoas) - 1)]->email,
                    'para' => $pessoas[rand(0, count($pessoas) - 1)]->email,
                    'assunto' => fake()->sentence(5),
                    'corpo' => fake()->paragraph(3),
                    'tipo' => fake()->randomElement(['email', 'carta', 'oficio']),
                    'status' => fake()->randomElement(['rascunho', 'enviado', 'recebido']),
                    'data_envio' => fake()->dateTime(),
                    'classificacao' => fake()->randomElement(['urgente', 'normal', 'informativo']),
                ]);
            }

            // Gerar 2 Kits
            for ($i = 1; $i <= 2; $i++) {
                Kit::create([
                    'nome' => "Kit Teste #{$i}",
                    'descricao' => fake()->sentence(5),
                    'tipo' => fake()->randomElement(['acao_alimentos', 'extracao_dna']),
                    'status' => 'ativo',
                ]);
            }

            // Gerar 5 Extrações
            for ($i = 1; $i <= 5; $i++) {
                Extracao::create([
                    'caso_id' => $casos[rand(0, count($casos) - 1)]->id,
                    'numero' => sprintf('EXT-%07d', rand(1000000, 9999999)),
                    'tipo' => fake()->randomElement(['dna', 'documentos', 'financeira']),
                    'status' => fake()->randomElement(['pendente', 'processando', 'concluida']),
                    'data_solicitacao' => fake()->dateTime(),
                ]);
            }

            DB::commit();

            return redirect()->route('admin.menu_testes')
                ->with('success', 'Dados de teste gerados com sucesso! (5 pessoas, 3 casos, 10 comunicações, 2 kits, 5 extrações)');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors(['error' => 'Erro ao gerar dados de teste: ' . $e->getMessage()]);
        }
    }

    /**
     * Limpa Dados de Teste — Remove todos os registros (exceto usuários admin)
     */
    public function limpar_dados_teste(Request $request)
    {
        try {
            DB::beginTransaction();

            // Truncar tabelas em ordem (respeitar foreign keys)
            DB::table('comunicacao_respostas')->truncate();
            DB::table('comunicacao_attachments')->truncate();
            DB::table('comunicacoes')->truncate();
            DB::table('extracacoes_caso')->truncate();
            DB::table('extracos')->truncate();
            DB::table('kits')->truncate();
            DB::table('casos')->truncate();
            DB::table('historicos')->truncate();
            DB::table('parcelas')->truncate();
            DB::table('creditos')->truncate();
            DB::table('coletas_adicionais')->truncate();
            DB::table('alelos')->truncate();
            DB::table('enderecos')->truncate();
            DB::table('pessoas')->truncate();

            DB::commit();

            return redirect()->route('admin.menu_testes')
                ->with('success', 'Todos os dados de teste foram removidos com sucesso!');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors(['error' => 'Erro ao limpar dados de teste: ' . $e->getMessage()]);
        }
    }
}
