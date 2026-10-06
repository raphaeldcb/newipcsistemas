#!/usr/bin/env python3
"""Gerar Controllers para Models"""

from pathlib import Path

controllers = {
    'UFController': {
        'model': 'UF',
        'repository': 'UFRepository',
        'fields': [
            ('uf_sigla', 'required|string|max:2'),
            ('uf_desc', 'nullable|string|max:20'),
        ],
    },
    'ComarcasController': {
        'model': 'Comarca',
        'repository': 'ComarcaRepository',
        'fields': [
            ('uf_sigla', 'required|string|max:2'),
            ('com_cod', 'required|integer'),
            ('com_desc', 'nullable|string|max:40'),
            ('com_sigla', 'nullable|string|max:2'),
        ],
    },
    'VarasController': {
        'model': 'Vara',
        'repository': 'VaraRepository',
        'fields': [
            ('uf_sigla', 'required|string|max:2'),
            ('com_cod', 'required|integer'),
            ('var_cod', 'required|integer'),
            ('var_desc', 'nullable|string|max:60'),
        ],
    },
    'JuizesController': {
        'model': 'Juiz',
        'repository': 'JuizRepository',
        'fields': [
            ('jui_cod', 'required|integer'),
            ('jui_nome', 'nullable|string|max:60'),
            ('jui_oab', 'nullable|string|max:20'),
        ],
    },
    'CasosController': {
        'model': 'Caso',
        'repository': 'CasoRepository',
        'fields': [
            ('cas_contr', 'required|integer'),
            ('pro_numero', 'nullable|string|max:30'),
            ('cas_status', 'nullable|integer'),
        ],
    },
    'CreditosController': {
        'model': 'Credito',
        'repository': 'CreditoRepository',
        'fields': [
            ('id_credito', 'required|integer'),
            ('pro_cod', 'nullable|integer'),
            ('cre_vlr', 'nullable|decimal:14,2'),
        ],
    },
}

def generate_controller(name, model_name, repository_name, fields):
    """Gerar Controller básico"""

    # Validações
    validation_rules = []
    for field, rule in fields:
        validation_rules.append(f"'{field}' => '{rule}'")
    validation_code = ',\n            '.join(validation_rules)

    code = f'''<?php

namespace App\\Http\\Controllers\\Api;

use App\\Models\\{model_name};
use App\\Repositories\\{repository_name};
use Illuminate\\Http\\Request;

class {name}
{{
    private {repository_name} $repository;

    public function __construct({repository_name} $repository)
    {{
        $this->repository = $repository;
    }}

    public function index()
    {{
        return response()->json($this->repository->paginate());
    }}

    public function store(Request $request)
    {{
        $validated = $request->validate([
            {validation_code}
        ]);

        $record = $this->repository->create($validated);
        return response()->json($record, 201);
    }}

    public function show({model_name} $record)
    {{
        return response()->json($record);
    }}

    public function update(Request $request, {model_name} $record)
    {{
        $validated = $request->validate([
            {validation_code}
        ]);

        $this->repository->update($record, $validated);
        return response()->json($record);
    }}

    public function destroy({model_name} $record)
    {{
        $this->repository->delete($record);
        return response()->json(null, 204);
    }}
}}
'''
    return code

# Gerar controllers
print("Gerando Controllers...\n")

for name, config in controllers.items():
    code = generate_controller(
        name,
        config['model'],
        config['repository'],
        config['fields']
    )

    file_path = Path(f"api/app/Http/Controllers/Api/{name}.php")
    file_path.write_text(code)
    print(f"✅ {name}")

print("\n✅ 6 Controllers gerados!")
