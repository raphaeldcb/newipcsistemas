# -*- coding: utf-8 -*-
"""
Exporta os DADOS das tabelas TB_* do Firebird 2.5 para arquivos .sql do MySQL 8.3
(banco sgbd_scpg, criado com estrutura_mysql.sql).

 - Cada arquivo tem no maximo CHUNK_ROWS registros (padrao 500.000):
       tb_processo_001.sql, tb_processo_002.sql, ...
 - Os arquivos saem em UTF-8 (a conversao de WIN1252 para UTF-8 e feita aqui).
 - Gera tambem:
       00_importar_tudo.sql      -> executa todos os arquivos na ordem certa
       99_auto_increment.sql     -> ajusta os AUTO_INCREMENT conforme os generators do Firebird
       contagem_firebird.txt     -> tabela;qtd  (para conferir com conferencia_mysql.sql)

Requisitos:  pip install fdb   (e fbclient.dll do Firebird 2.5 com a mesma
             arquitetura 32/64 bits do Python)

Uso:         python exportar_dados_firebird.py
Importar:    cd <pasta de saida>
             mysql -u root -p --default-character-set=utf8mb4 < 00_importar_tudo.sql
"""
import os
import struct
import sys
import datetime
from decimal import Decimal

import fdb

# ----------------------------- CONFIGURACAO ---------------------------------
DB_PATH   = r'C:\SCPG\Base\SGBD_SCPG.fdb'   # ou 'servidor:C:\caminho\banco.fdb'
DB_USER   = 'SYSDBA'
DB_PASS   = 'masterkey'
FB_CLIENT = r''           # caminho completo do fbclient.dll, se o Python nao o encontrar. Ex.:
                          # r'C:\Program Files (x86)\Firebird\Firebird_2_5\bin\fbclient.dll'
DB_CHARSET = 'WIN1252'    # charset em que os textos foram gravados (se aparecer erro de
                          # decodificacao ou acento errado, tente 'ISO8859_1')
OUT_DIR   = r'C:\SCPG\export_mysql'
CHUNK_ROWS = 500_000      # maximo de registros por arquivo
BATCH_ROWS = 1000         # registros por comando INSERT
MYSQL_DB  = 'sgbd_scpg'
# ---------------------------------------------------------------------------

# generator do Firebird -> tabela MySQL (coluna AUTO_INCREMENT)
GENERATORS = {
    'GEN_PESSOAS_COD': 'tb_pessoas', 'GEN_TB_ALELOS_ID': 'tb_alelos',
    'GEN_TB_ALELOS_TMP_ID': 'tb_alelos_tmp', 'GEN_TB_AUDITORIA_ID': 'tb_auditoria',
    'GEN_TB_COLETA_ADICIONAL_ID': 'tb_coleta_adicional', 'GEN_TB_CREDITOS_ID': 'tb_creditos',
    'GEN_TB_ENDERECOS_ID': 'tb_enderecos', 'GEN_TB_EXTRACAO_ID': 'tb_extracao',
    'GEN_TB_EXTRACAO_CASOS_ID': 'tb_extracao_casos', 'GEN_TB_HISTORICO_ID': 'tb_historico',
    'GEN_TB_IMPRESSOES_ID': 'tb_impressoes', 'GEN_TB_KITS_ID': 'tb_kits',
    'GEN_TB_PARCELAS_ID': 'tb_parcelas', 'GEN_TB_PESQUISA_ID': 'tb_pesquisa',
    'GEN_TB_PROCED_CARGA_ID': 'tb_procedimentos_carga',
    'GEN_TB_PROCED_RESULTADO_ID': 'tb_procedimentos_resultado',
}

HEADER = (
    "SET NAMES utf8mb4;\n"
    "USE {db};\n"
    "SET @old_sql_mode = @@SESSION.sql_mode;\n"
    "SET SESSION sql_mode = CONCAT_WS(',', @@SESSION.sql_mode, 'NO_BACKSLASH_ESCAPES', 'NO_AUTO_VALUE_ON_ZERO');\n"
    "SET FOREIGN_KEY_CHECKS = 0;\n"
    "SET UNIQUE_CHECKS = 0;\n"
    "SET AUTOCOMMIT = 0;\n"
)
FOOTER = (
    "COMMIT;\n"
    "SET SESSION sql_mode = @old_sql_mode;\n"
    "SET UNIQUE_CHECKS = 1;\n"
    "SET FOREIGN_KEY_CHECKS = 1;\n"
    "SET AUTOCOMMIT = 1;\n"
)


def sql_value(v):
    """Converte um valor Python (vindo do Firebird) em literal MySQL.
    Strings: apenas ' e duplicada (o cabecalho liga NO_BACKSLASH_ESCAPES)."""
    if v is None:
        return 'NULL'
    if isinstance(v, bool):
        return '1' if v else '0'
    if isinstance(v, int):
        return str(v)
    if isinstance(v, Decimal):
        return format(v, 'f')
    if isinstance(v, float):
        return repr(v)
    if isinstance(v, datetime.datetime):
        return "'" + v.strftime('%Y-%m-%d %H:%M:%S') + "'"
    if isinstance(v, datetime.date):
        return "'" + v.strftime('%Y-%m-%d') + "'"
    if isinstance(v, datetime.time):
        return "'" + v.strftime('%H:%M:%S') + "'"
    if isinstance(v, (bytes, bytearray)):
        return "0x" + bytes(v).hex() if v else "''"
    return "'" + str(v).replace('\x00', '').replace("'", "''") + "'"


class ChunkWriter:
    """Grava os registros de uma tabela em arquivos de ate CHUNK_ROWS linhas."""

    def __init__(self, table, columns, out_dir):
        self.table, self.out_dir = table, out_dir
        self.prefix = f"INSERT INTO {table} ({', '.join(columns)}) VALUES\n"
        self.part = 0
        self.rows_in_file = 0
        self.total = 0
        self.f = None
        self.files = []
        self.batch = []

    def _open(self):
        self.part += 1
        name = f"{self.table}_{self.part:03d}.sql"
        self.files.append(name)
        self.f = open(os.path.join(self.out_dir, name), 'w', encoding='utf-8', newline='\n')
        self.f.write(HEADER.format(db=MYSQL_DB))
        self.rows_in_file = 0

    def _close(self):
        self._flush()
        if self.f:
            self.f.write(FOOTER)
            self.f.close()
            self.f = None

    def _flush(self):
        if self.batch:
            self.f.write(self.prefix + ",\n".join(self.batch) + ";\n")
            self.batch = []

    def add(self, row):
        if self.f is None:
            self._open()
        self.batch.append('(' + ','.join(sql_value(v) for v in row) + ')')
        self.rows_in_file += 1
        self.total += 1
        if self.rows_in_file >= CHUNK_ROWS:
            self._close()                     # arquivo cheio: o proximo registro abre outro
        elif len(self.batch) >= BATCH_ROWS:
            self._flush()

    def finish(self):
        self._close()


def main():
    os.makedirs(OUT_DIR, exist_ok=True)
    kw = {}
    if FB_CLIENT:
        dll = FB_CLIENT
        if os.path.isdir(dll):                      # aceita a pasta do bin ou o caminho do arquivo
            dll = os.path.join(dll, 'fbclient.dll')
        if not os.path.isfile(dll):
            sys.exit(f"fbclient.dll nao encontrado em: {dll}")
        if struct.calcsize('P') * 8 == 64 and '(x86)' in dll:
            print("AVISO: Python de 64 bits e DLL provavelmente de 32 bits (Program Files (x86)). "
                  "Se der erro ao carregar, use o cliente 64 bits do Firebird ou um Python 32 bits.")
        kw = {'fb_library_name': dll}
    con = fdb.connect(dsn=DB_PATH, user=DB_USER, password=DB_PASS, charset=DB_CHARSET, **kw)

    cur = con.cursor()
    cur.execute("SELECT TRIM(RDB$RELATION_NAME) FROM RDB$RELATIONS "
                "WHERE COALESCE(RDB$SYSTEM_FLAG, 0) = 0 AND RDB$VIEW_BLR IS NULL "
                "AND RDB$RELATION_NAME STARTING WITH 'TB_' ORDER BY 1")
    tables = [r[0].strip() for r in cur.fetchall()]
    print(f"{len(tables)} tabelas TB_* encontradas")

    all_files, counts = [], []
    for t in tables:
        cur = con.cursor()
        cur.execute(f'SELECT * FROM "{t}"')
        cols = [d[0].strip().lower() for d in cur.description]
        w = ChunkWriter(t.lower(), cols, OUT_DIR)
        while True:
            rows = cur.fetchmany(5000)
            if not rows:
                break
            for r in rows:
                w.add(r)
        w.finish()
        all_files += w.files
        counts.append((t.lower(), w.total))
        print(f"  {t.lower():<32} {w.total:>10} registros  ->  {len(w.files)} arquivo(s)")

    # AUTO_INCREMENT conforme os generators
    lines = [f"SET NAMES utf8mb4;\nUSE {MYSQL_DB};"]
    for gen, tab in GENERATORS.items():
        try:
            c = con.cursor()
            c.execute(f"SELECT GEN_ID({gen}, 0) FROM RDB$DATABASE")
            lines.append(f"ALTER TABLE {tab} AUTO_INCREMENT = {int(c.fetchone()[0]) + 1};")
        except Exception as e:                       # generator inexistente
            print(f"  aviso: generator {gen} ignorado ({e})")
    with open(os.path.join(OUT_DIR, '99_auto_increment.sql'), 'w', encoding='utf-8', newline='\n') as f:
        f.write("\n".join(lines) + "\n")

    with open(os.path.join(OUT_DIR, '00_importar_tudo.sql'), 'w', encoding='utf-8', newline='\n') as f:
        for name in all_files + ['99_auto_increment.sql']:
            f.write(f"SOURCE {name};\n")

    with open(os.path.join(OUT_DIR, 'contagem_firebird.txt'), 'w', encoding='utf-8', newline='\n') as f:
        for t, n in counts:
            f.write(f"{t};{n}\n")

    con.close()
    print(f"\nConcluido: {sum(n for _, n in counts)} registros em {len(all_files)} arquivo(s) -> {OUT_DIR}")


if __name__ == '__main__':
    main()
