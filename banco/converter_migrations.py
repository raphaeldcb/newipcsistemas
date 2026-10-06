#!/usr/bin/env python3
"""
Converter: estrutura_mysql.sql → Laravel migrations
"""

import re
import sys
from pathlib import Path
from datetime import datetime, timedelta

# Ler estrutura_mysql.sql
mysql_file = Path("banco/mysql/estrutura_mysql.sql").read_text(encoding='utf-8')

# Expressão regular para extrair CREATE TABLE
table_pattern = r'CREATE TABLE `?(\w+)`?\s*\((.*?)\)\s*ENGINE'
matches = re.findall(table_pattern, mysql_file, re.DOTALL)

print(f"✅ Encontradas {len(matches)} tabelas")

# Tabelas prioritárias (na ordem de dependência)
priority_tables = [
    'tb_uf',
    'tb_comarca',
    'tb_varas',
    'tb_juiz',
    'tb_pessoas',
    'tb_enderecos',
    'tb_casos',
    'tb_historico',
    'tb_creditos',
    'tb_parcelas',
    'tb_kits',
    'tb_coleta_adicional',
    'tb_extracao',
    'tb_alelos',
    'tb_parametro',
]

# Mapa de tipos MySQL → Laravel Schema
type_map = {
    'INT': 'integer',
    'SMALLINT': 'smallInteger',
    'BIGINT': 'bigInteger',
    'DECIMAL': 'decimal',
    'VARCHAR': 'string',
    'CHAR': 'char',
    'TEXT': 'text',
    'LONGTEXT': 'longText',
    'LONGBLOB': 'longBinary',
    'BLOB': 'binary',
    'DATE': 'date',
    'TIME': 'time',
    'DATETIME': 'dateTime',
    'TIMESTAMP': 'timestamp',
}

def parse_column(col_def):
    """Parse coluna MySQL para Laravel"""
    col_def = col_def.strip()
    if not col_def or col_def.startswith('PRIMARY') or col_def.startswith('FOREIGN'):
        return None

    parts = col_def.split()
    if len(parts) < 2:
        return None

    name = parts[0].strip('`')
    type_str = parts[1].upper()

    # Extrair tamanho de VARCHAR, DECIMAL, etc.
    size = None
    if '(' in type_str:
        size = type_str.split('(')[1].rstrip(')')
        type_str = type_str.split('(')[0]

    # Mapa Laravel
    laravel_type = type_map.get(type_str, 'string')

    # Atributos
    nullable = 'NOT NULL' not in col_def.upper()
    auto_inc = 'AUTO_INCREMENT' in col_def.upper()
    default = None
    if 'DEFAULT' in col_def.upper():
        match = re.search(r'DEFAULT\s+([^\s,]+)', col_def, re.IGNORECASE)
        if match:
            default = match.group(1)

    return {
        'name': name,
        'type': laravel_type,
        'size': size,
        'nullable': nullable,
        'auto_inc': auto_inc,
        'default': default,
    }

def generate_migration(table_name, columns):
    """Gerar migration Laravel para uma tabela"""

    # Filtrar colunas válidas
    valid_cols = [parse_column(c) for c in columns]
    valid_cols = [c for c in valid_cols if c]

    # Cabeçalho
    migration = f"""<?php

use Illuminate\\Database\\Migrations\\Migration;
use Illuminate\\Database\\Schema\\Blueprint;
use Illuminate\\Support\\Facades\\Schema;

return new class extends Migration
{{
    public function up(): void
    {{
        Schema::create('{table_name}', function (Blueprint $table) {{
"""

    # Colunas
    for col in valid_cols:
        col_code = f"            $table->{col['type']}('{col['name']}')"

        if col['size']:
            col_code = f"            $table->{col['type']}('{col['name']}', {col['size']})"

        if col['auto_inc']:
            col_code = f"            $table->id('{col['name']}')  // AUTO_INCREMENT"

        if col['nullable'] and not col['auto_inc']:
            col_code += "->nullable()"

        if col['default']:
            col_code += f"->default({col['default']})"

        col_code += ";"
        migration += col_code + "\n"

    # Soft deletes + timestamps
    migration += """
            $table->softDeletes();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('{table_name}');
    }
}}
""".format(table_name=table_name)

    return migration

# Gerar migrações
for table_name, col_str in matches:
    if table_name in priority_tables:
        columns = [c.strip() for c in col_str.split(',')]
        migration_code = generate_migration(table_name, columns)
        print(f"✅ {table_name}")
        # print(migration_code[:200] + "...")  # Preview

print("\n✅ Script de conversão completo")
print("Próximo: preencher migrations manualmente com detalhes precisos")
