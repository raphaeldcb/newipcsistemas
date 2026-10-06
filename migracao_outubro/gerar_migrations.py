#!/usr/bin/env python3
"""Converter estrutura_mysql.sql → Laravel migrations com Schema Builder"""

import re
from pathlib import Path

sql_file = Path("banco/mysql/estrutura_mysql.sql").read_text(encoding='utf-8')

# Tabelas prioritárias
priority_tables = [
    'tb_uf', 'tb_comarca', 'tb_varas', 'tb_juiz',
    'tb_pessoas', 'tb_enderecos', 'tb_casos', 'tb_historico',
    'tb_creditos', 'tb_parcelas', 'tb_kits', 'tb_coleta_adicional',
    'tb_extracao', 'tb_extracao_casos', 'tb_alelos'
]

TYPE_MAP = {
    'INT': 'integer',
    'SMALLINT': 'smallInteger',
    'BIGINT': 'bigInteger',
    'DECIMAL': 'decimal',
    'NUMERIC': 'decimal',
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

def extract_table(table_name):
    """Extrair definição de uma tabela do SQL"""
    pattern = rf'CREATE TABLE\s+`?{table_name}`?\s*\((.*?)\)\s*ENGINE'
    match = re.search(pattern, sql_file, re.DOTALL | re.IGNORECASE)
    if not match:
        return None
    return match.group(1)

def parse_columns(table_def):
    """Parse colunas da definição CREATE TABLE"""
    lines = table_def.split('\n')
    columns = []
    primary_keys = []

    for line in lines:
        line = line.strip().rstrip(',')
        if not line or line.startswith('--'):
            continue
        if line.upper().startswith('PRIMARY KEY'):
            match = re.search(r'PRIMARY KEY\s*\((.*?)\)', line, re.IGNORECASE)
            if match:
                pk = match.group(1).replace('`', '').split(',')
                primary_keys = [p.strip() for p in pk]
            continue
        if line.upper().startswith('FOREIGN KEY') or line.upper().startswith('KEY'):
            continue

        parts = line.split()
        if len(parts) >= 2:
            col_name = parts[0].strip('`')
            col_type = parts[1].upper()

            col_info = {
                'name': col_name,
                'type': col_type,
                'nullable': 'NOT NULL' not in line.upper(),
                'auto_inc': 'AUTO_INCREMENT' in line.upper(),
                'size': None,
            }

            if '(' in col_type:
                size_match = re.search(r'\(([0-9,]+)\)', col_type)
                if size_match:
                    col_info['size'] = size_match.group(1)
                    col_info['type'] = col_type.split('(')[0]

            columns.append(col_info)

    return columns, primary_keys

def generate_migration_code(table_name, columns, primary_keys):
    """Gerar código da migration Laravel"""
    lines = [
        "<?php",
        "",
        "use Illuminate\\Database\\Migrations\\Migration;",
        "use Illuminate\\Database\\Schema\\Blueprint;",
        "use Illuminate\\Support\\Facades\\Schema;",
        "",
        "return new class extends Migration",
        "{",
        "    public function up(): void",
        "    {",
        f"        Schema::create('{table_name}', function (Blueprint $table) {{",
    ]

    for col in columns:
        if col['auto_inc'] and len(primary_keys) == 1:
            lines.append(f"            $table->id('{col['name']}');")
        else:
            laravel_type = TYPE_MAP.get(col['type'], 'string')
            stmt = f"            $table->{laravel_type}('{col['name']}'"

            if laravel_type == 'decimal' and col['size']:
                parts = col['size'].split(',')
                stmt = f"            $table->{laravel_type}('{col['name']}', {parts[0]}, {parts[1] if len(parts) > 1 else '0'}"
            elif laravel_type in ['string', 'char'] and col['size']:
                stmt += f", {col['size']}"

            stmt += ")"
            if col['nullable']:
                stmt += "->nullable()"
            if col['auto_inc'] and len(primary_keys) > 1:
                stmt += "->autoIncrement()"
            stmt += ";"
            lines.append(stmt)

    if len(primary_keys) > 1:
        pk_str = "', '".join(primary_keys)
        lines.append(f"            $table->primary(['{pk_str}']);")

    lines.extend([
        "",
        "            $table->softDeletes();",
        "            $table->timestamps();",
        "        });",
        "    }",
        "",
        "    public function down(): void",
        "    {",
        f"        Schema::dropIfExists('{table_name}');",
        "    }",
        "}",
        "",
    ])

    return "\n".join(lines)

# Gerar migrations
print("Convertendo estrutura_mysql.sql...\n")
for table_name in priority_tables:
    table_def = extract_table(table_name)
    if not table_def:
        print(f"❌ {table_name}")
        continue

    columns, pk = parse_columns(table_def)
    if not columns:
        print(f"⚠️  {table_name}")
        continue

    migration_code = generate_migration_code(table_name, columns, pk)
    output_file = Path(f"/tmp/{table_name}_migration.php")
    output_file.write_text(migration_code)

    print(f"✅ {table_name} ({len(columns)} cols, PK: {pk or 'auto'})")

print("\n✅ Migrations prontas em /tmp/")
