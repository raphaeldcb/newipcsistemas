#!/usr/bin/env python3
"""Gerar Eloquent Models + Repositories"""

from pathlib import Path

tables = {
    'tb_uf': {
        'model': 'UF',
        'table': 'tb_uf',
        'key': 'uf_sigla',
        'relations': [],
    },
    'tb_comarca': {
        'model': 'Comarca',
        'table': 'tb_comarca',
        'key': 'com_cod',
        'relations': [
            ('belongsTo', 'UF', 'uf_sigla', 'uf_sigla'),
        ],
    },
    'tb_varas': {
        'model': 'Vara',
        'table': 'tb_varas',
        'key': 'var_cod',
        'relations': [
            ('belongsTo', 'Comarca', 'com_cod', 'com_cod'),
        ],
    },
    'tb_juiz': {
        'model': 'Juiz',
        'table': 'tb_juiz',
        'key': 'jui_cod',
        'relations': [],
    },
    'tb_pessoas': {
        'model': 'Pessoa',
        'table': 'tb_pessoas',
        'key': 'pes_cod',
        'relations': [],
    },
    'tb_enderecos': {
        'model': 'Endereco',
        'table': 'tb_enderecos',
        'key': 'end_cod',
        'relations': [],
    },
    'tb_casos': {
        'model': 'Caso',
        'table': 'tb_casos',
        'key': 'cas_contr',
        'relations': [
            ('hasMany', 'Historico', 'pro_cod', 'pro_cod'),
            ('hasMany', 'Credito', 'pro_cod', 'pro_cod'),
        ],
    },
    'tb_historico': {
        'model': 'Historico',
        'table': 'tb_historico',
        'key': 'his_contr',
        'relations': [
            ('belongsTo', 'Caso', 'pro_cod', 'pro_cod'),
        ],
    },
    'tb_creditos': {
        'model': 'Credito',
        'table': 'tb_creditos',
        'key': 'id_credito',
        'relations': [
            ('hasMany', 'Parcela', 'pro_cod', 'pro_cod'),
        ],
    },
    'tb_parcelas': {
        'model': 'Parcela',
        'table': 'tb_parcelas',
        'key': 'controle',
        'relations': [
            ('belongsTo', 'Credito', 'pro_cod', 'pro_cod'),
        ],
    },
    'tb_kits': {
        'model': 'Kit',
        'table': 'tb_kits',
        'key': 'kit_cod',
        'relations': [],
    },
    'tb_coleta_adicional': {
        'model': 'ColetaAdicional',
        'table': 'tb_coleta_adicional',
        'key': 'coa_id',
        'relations': [],
    },
    'tb_extracao': {
        'model': 'Extracao',
        'table': 'tb_extracao',
        'key': 'ext_cod',
        'relations': [
            ('hasMany', 'ExtracacaoCaso', 'ext_cod', 'ext_cod'),
        ],
    },
    'tb_extracao_casos': {
        'model': 'ExtracacaoCaso',
        'table': 'tb_extracao_casos',
        'key': 'extc_cod',
        'relations': [
            ('belongsTo', 'Extracao', 'ext_cod', 'ext_cod'),
        ],
    },
    'tb_alelos': {
        'model': 'Alelo',
        'table': 'tb_alelos',
        'key': 'cod_ale',
        'relations': [],
    },
}

def generate_model(model_name, table_name, key_name, relations):
    """Gerar Model Eloquent"""

    relations_code = ""
    for rel_type, rel_model, fk, pk in relations:
        if rel_type == 'hasMany':
            relations_code += f"""
    public function {rel_model.lower()}s()
    {{
        return $this->hasMany({rel_model}::class, '{fk}', '{pk}');
    }}
"""
        elif rel_type == 'belongsTo':
            relations_code += f"""
    public function {rel_model.lower()}()
    {{
        return $this->belongsTo({rel_model}::class, '{fk}', '{pk}');
    }}
"""

    code = f'''<?php

namespace App\\Models;

class {model_name} extends BaseModel
{{
    protected $table = '{table_name}';
    protected $primaryKey = '{key_name}';
    protected $guarded = [];
{relations_code}
}}
'''
    return code

def generate_repository(model_name):
    """Gerar Repository"""
    code = f'''<?php

namespace App\\Repositories;

use App\\Models\\{model_name};

class {model_name}Repository extends BaseRepository
{{
    public function __construct({model_name} $model)
    {{
        parent::__construct($model);
    }}
}}
'''
    return code

# Gerar arquivos
print("Gerando Models e Repositories...\n")

for table_name, config in tables.items():
    model_name = config['model']

    # Model
    model_code = generate_model(
        model_name,
        config['table'],
        config['key'],
        config['relations']
    )
    model_file = Path(f"api/app/Models/{model_name}.php")
    model_file.write_text(model_code)

    # Repository
    repo_code = generate_repository(model_name)
    repo_file = Path(f"api/app/Repositories/{model_name}Repository.php")
    repo_file.write_text(repo_code)

    print(f"✅ {model_name:25} → Model + Repository")

print("\n✅ 15 Models + 15 Repositories criados!")
