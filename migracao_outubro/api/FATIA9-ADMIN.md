# Fatia 9: Admin — User Management & Audit Logging

## Overview

Fatia 9 implementa **Admin** — gerenciamento de usuários com 5 roles (Admin, Perito, Supervisor, Analista, Assistente) e auditoria completa de todas as ações.

## Componentes

#### 1. Enum: RoleUsuario
- 5 roles: ADMIN, PERITO, SUPERVISOR, ANALISTA, ASSISTENTE
- Permissões por role (wildcard * para admin)
- Labels e labels de permissão

#### 2. Controller: UsuariosController
- CRUD (index, store, show, update, destroy)
- `alterarSenha()` — change password com validação
- `ativos()` — count ativo/inativo
- `porRole()` — distribuição por role
- `ultimoAcesso()` — last login tracking

#### 3. Controller: AuditoriaController
- `index()` — listar com filtros (usuario, acao, tipo_entidade, data)
- `show()` — detalhe de uma ação
- `porUsuario()` — ações de um usuário
- `resumoDiario()` — contagem de ações por data
- `entidadesModificadas()` — quais modelos foram alterados
- `ultimas()` — últimas N ações (painel)

#### 4. Routes (16 endpoints)
- Usuários: CRUD + alterar-senha + ativos + por-role + ultimo-acesso
- Auditoria: index + show + por-usuario + resumo-diario + entidades + ultimas

## API Endpoints

```
GET/POST /api/v1/usuarios           (CRUD)
GET/PUT  /api/v1/usuarios/{id}
DELETE   /api/v1/usuarios/{id}
POST     /api/v1/usuarios/{id}/alterar-senha
GET      /api/v1/usuarios/ativos
GET      /api/v1/usuarios/por-role
GET      /api/v1/usuarios/{id}/ultimo-acesso

GET      /api/v1/auditoria          (listar com filtros)
GET      /api/v1/auditoria/{id}
POST     /api/v1/auditoria/por-usuario
POST     /api/v1/auditoria/resumo-diario
GET      /api/v1/auditoria/entidades-modificadas
GET      /api/v1/auditoria/ultimas/{limit}
```

---

**Status**: ✅ Completo (10 endpoints Admin + 6 endpoints Auditoria)
