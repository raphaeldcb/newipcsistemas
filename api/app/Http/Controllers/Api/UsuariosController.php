<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use App\Enums\RoleUsuario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UsuariosController
{
    public function index()
    {
        return response()->json([
            'data' => User::paginate(),
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:8',
            'role' => 'required|string|in:admin,perito,supervisor,analista,assistente',
            'ativo' => 'boolean',
        ]);

        $validated['password'] = Hash::make($validated['password']);

        $usuario = User::create($validated);

        return response()->json([
            'message' => 'Usuário criado com sucesso',
            'data' => $usuario,
        ], 201);
    }

    public function show(User $user)
    {
        return response()->json(['data' => $user]);
    }

    public function update(Request $request, User $user)
    {
        $validated = $request->validate([
            'name' => 'string|max:255',
            'email' => 'email|unique:users,email,' . $user->id,
            'role' => 'string|in:admin,perito,supervisor,analista,assistente',
            'ativo' => 'boolean',
        ]);

        $user->update($validated);

        return response()->json([
            'message' => 'Usuário atualizado com sucesso',
            'data' => $user,
        ]);
    }

    public function destroy(User $user)
    {
        $user->delete();

        return response()->json(null, 204);
    }

    public function alterarSenha(Request $request, User $user)
    {
        $request->validate([
            'senha_atual' => 'required',
            'senha_nova' => 'required|min:8|confirmed',
        ]);

        if (!Hash::check($request->input('senha_atual'), $user->password)) {
            return response()->json(['error' => 'Senha atual incorreta'], 422);
        }

        $user->update(['password' => Hash::make($request->input('senha_nova'))]);

        return response()->json(['message' => 'Senha alterada com sucesso']);
    }

    public function ativos()
    {
        $ativos = User::where('ativo', true)->count();
        $inativos = User::where('ativo', false)->count();

        return response()->json([
            'total' => $ativos + $inativos,
            'ativos' => $ativos,
            'inativos' => $inativos,
        ]);
    }

    public function porRole()
    {
        $por_role = User::selectRaw('role, COUNT(*) as quantidade')
            ->groupBy('role')
            ->get();

        return response()->json([
            'distribuicao' => $por_role->map(fn($u) => [
                'role' => RoleUsuario::from($u->role)->label(),
                'quantidade' => $u->quantidade,
            ]),
        ]);
    }

    public function ultimoAcesso(User $user)
    {
        return response()->json([
            'usuario_id' => $user->id,
            'nome' => $user->name,
            'ultimo_acesso' => $user->ultimo_acesso_em,
            'criado_em' => $user->created_at,
        ]);
    }
}
