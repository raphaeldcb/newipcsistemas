# Conversão do banco: Firebird 2.5 → MySQL 8.3

Origem: Firebird WI-V2.5.9.27139, banco `SGBD_SCPG.fdb`, charset NONE (dados em WIN1252).
Destino: MySQL 8.3.0, schema `sgbd_scpg`, utf8mb4 / utf8mb4_0900_ai_ci, InnoDB.

## Inventário
- 59 tabelas `TB_*` (+ 5 tabelas `IBE$*` do IBExpert, opcionais)
- 8 views, 9 índices, 3 chaves estrangeiras
- 2 funções (sp_formata_data, sp_dia_semana), 1 procedure (bu_alelos)
- Triggers de negócio: nenhum além dos de geração de código (substituídos por AUTO_INCREMENT)

## Mapeamento de tipos
| Firebird | MySQL |
|---|---|
| INTEGER / SMALLINT | INT / SMALLINT |
| NUMERIC(p,s) / DECIMAL(p,s) | DECIMAL(p,s) (NUMERIC(18,0) → BIGINT) |
| DATE / TIME | DATE / TIME |
| TIMESTAMP | DATETIME |
| CHAR(n) / VARCHAR(n) | CHAR(n) / VARCHAR(n) (acima de 4000 → TEXT, limite de 65.535 bytes/linha) |
| BLOB SUB_TYPE 0 / TEXT | LONGBLOB / LONGTEXT |
| DEFAULT CURRENT_TIME / CURRENT_DATE | DEFAULT (CURRENT_TIME) / (CURRENT_DATE) |

## Generators → AUTO_INCREMENT
tb_alelos.cod_ale, tb_alelos_tmp.cod_tale, tb_auditoria.aud_contr, tb_coleta_adicional.coa_id,
tb_creditos.id_credito, tb_enderecos.end_cod, tb_extracao.ext_cod, tb_extracao_casos.extc_cod,
tb_historico.his_contr, tb_impressoes.imp_contr, tb_kits.kit_cod, tb_parcelas.controle (KEY extra),
tb_pesquisa.peq_cod, tb_pessoas.pes_cod (KEY extra), tb_procedimentos_carga.proc_cod,
tb_procedimentos_resultado.pror_cod.
Generators sem uso em trigger (não convertidos): GEN_TB_ALELOS_TIPOS_ID, GRID_LINHAS.
Em tb_pessoas e tb_parcelas a PK é composta e a coluna auto-incremento não é a primeira, por isso há um KEY próprio.

## Objetos programáveis
- `sp_formata_data(date)` → FUNCTION, retorna dd/mm/aaaa.
- `sp_dia_semana(date)` → FUNCTION. Firebird: 0 = domingo; MySQL DAYOFWEEK: 1 = domingo.
- `bu_alelos(v1, v2, marcador, OUT mensagem)` → PROCEDURE; insere em tb_contaalelo; a mensagem é sempre NULL (como no original).
- Triggers CHECK_1/2/3 do Firebird eram a implementação interna das FKs (recriadas como FKs).
- GRANTs do Firebird não têm equivalente (MySQL usa DEFINER).

## Views
vi_alelosencontrados, vi_busca_paciente, vi_status_casos, vi_dados_sense, vi_quantidade_kits,
vi_acordos, vi_alelo_limites, vi_valor_coletador.
- `vi_busca_paciente` converte o CPF para número (CAST AS SIGNED): zeros à esquerda se perdem, igual ao legado.
- `vi_valor_coletador`: as faixas do CASE deixam "buracos" para valores fracionários (ex.: 10,50; 350,50; 499,50) e valores ≥ 1000 caem em 120. Mantido igual ao legado; CONFIRMAR a regra com o negócio.

## Pontos de atenção para a aplicação
1. Código que fazia `select * from sp_formata_data(x)` / `sp_dia_semana(x)` deve virar `select sp_formata_data(x)`.
2. `bu_alelos` agora tem parâmetro OUT; não retorna linha.
3. Collation é case/accent-insensitive; MySQL 0900 é NO PAD (Firebird ignorava espaços finais em comparações).
4. Tabelas SEM chave primária (usar chave natural ou criar PK ao modelar a API):
   tb_alelos_frequencia, tb_alelos_resultados, tb_alelos_tipos, tb_contaalelo, tb_controle,
   tb_creditos_temporario, tb_dadosprocesso, tb_exames, tb_hosts, tb_mapa_extampli,
   tb_sequencial, tb_status_procedimento, tb_temp_credito, tb_temp_mec.
   (Serviços gerenciados com `sql_require_primary_key` exigirão PK.)
5. SEGURANÇA: tb_hosts guarda senha em texto (hos_senha VARCHAR(10)). A nova API deve usar hash (password_hash) e não migrar senhas em claro sem tratamento.
6. Dados pessoais sensíveis (pessoas, CPF, resultados): LGPD. Não enviar dados reais a ferramentas externas.

## Migração de dados
- Script: banco/migracao/exportar_dados_firebird.py (driver `fdb`).
- Cliente Firebird 32 bits ⇒ usar Python 32 bits (WinError 193 em Python 64 bits) ou instalar o cliente 64 bits.
- Gera arquivos tb_x_001.sql, tb_x_002.sql... com no máximo 500.000 registros, em UTF-8 (WIN1252 convertido no Python).
- Também gera 00_importar_tudo.sql, 99_auto_increment.sql e contagem_firebird.txt.
- Importar (a partir da pasta de saída): `mysql -u root -p --default-character-set=utf8mb4 < 00_importar_tudo.sql` (CMD) ou `source 00_importar_tudo.sql` no cliente mysql. PowerShell não aceita `<`.
- Conferir: comparar contagem_firebird.txt com banco/migracao/conferencia_mysql.sql.
- Observação: estrutura e exportador foram validados só por revisão e com driver simulado; confirmar na primeira carga real.
