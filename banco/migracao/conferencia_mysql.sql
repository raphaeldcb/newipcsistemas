-- Compare com contagem_firebird.txt (formato tabela;qtd)
USE sgbd_scpg;
SELECT 'tb_acordos' AS tabela, COUNT(*) AS qtd FROM tb_acordos
UNION ALL
SELECT 'tb_alelos' AS tabela, COUNT(*) AS qtd FROM tb_alelos
UNION ALL
SELECT 'tb_alelos_frequencia' AS tabela, COUNT(*) AS qtd FROM tb_alelos_frequencia
UNION ALL
SELECT 'tb_alelos_resultados' AS tabela, COUNT(*) AS qtd FROM tb_alelos_resultados
UNION ALL
SELECT 'tb_alelos_tipos' AS tabela, COUNT(*) AS qtd FROM tb_alelos_tipos
UNION ALL
SELECT 'tb_alelos_tmp' AS tabela, COUNT(*) AS qtd FROM tb_alelos_tmp
UNION ALL
SELECT 'tb_auditoria' AS tabela, COUNT(*) AS qtd FROM tb_auditoria
UNION ALL
SELECT 'tb_banco' AS tabela, COUNT(*) AS qtd FROM tb_banco
UNION ALL
SELECT 'tb_caso_endereco' AS tabela, COUNT(*) AS qtd FROM tb_caso_endereco
UNION ALL
SELECT 'tb_casos' AS tabela, COUNT(*) AS qtd FROM tb_casos
UNION ALL
SELECT 'tb_codigo' AS tabela, COUNT(*) AS qtd FROM tb_codigo
UNION ALL
SELECT 'tb_colaborador' AS tabela, COUNT(*) AS qtd FROM tb_colaborador
UNION ALL
SELECT 'tb_coleta_adicional' AS tabela, COUNT(*) AS qtd FROM tb_coleta_adicional
UNION ALL
SELECT 'tb_coletador' AS tabela, COUNT(*) AS qtd FROM tb_coletador
UNION ALL
SELECT 'tb_coletador_rel' AS tabela, COUNT(*) AS qtd FROM tb_coletador_rel
UNION ALL
SELECT 'tb_comarca' AS tabela, COUNT(*) AS qtd FROM tb_comarca
UNION ALL
SELECT 'tb_compra_kit' AS tabela, COUNT(*) AS qtd FROM tb_compra_kit
UNION ALL
SELECT 'tb_contaalelo' AS tabela, COUNT(*) AS qtd FROM tb_contaalelo
UNION ALL
SELECT 'tb_controle' AS tabela, COUNT(*) AS qtd FROM tb_controle
UNION ALL
SELECT 'tb_correspondencia' AS tabela, COUNT(*) AS qtd FROM tb_correspondencia
UNION ALL
SELECT 'tb_creditos' AS tabela, COUNT(*) AS qtd FROM tb_creditos
UNION ALL
SELECT 'tb_creditos_temporario' AS tabela, COUNT(*) AS qtd FROM tb_creditos_temporario
UNION ALL
SELECT 'tb_dadosprocesso' AS tabela, COUNT(*) AS qtd FROM tb_dadosprocesso
UNION ALL
SELECT 'tb_enderecos' AS tabela, COUNT(*) AS qtd FROM tb_enderecos
UNION ALL
SELECT 'tb_exames' AS tabela, COUNT(*) AS qtd FROM tb_exames
UNION ALL
SELECT 'tb_extracao' AS tabela, COUNT(*) AS qtd FROM tb_extracao
UNION ALL
SELECT 'tb_extracao_casos' AS tabela, COUNT(*) AS qtd FROM tb_extracao_casos
UNION ALL
SELECT 'tb_historico' AS tabela, COUNT(*) AS qtd FROM tb_historico
UNION ALL
SELECT 'tb_hosts' AS tabela, COUNT(*) AS qtd FROM tb_hosts
UNION ALL
SELECT 'tb_impressoes' AS tabela, COUNT(*) AS qtd FROM tb_impressoes
UNION ALL
SELECT 'tb_item' AS tabela, COUNT(*) AS qtd FROM tb_item
UNION ALL
SELECT 'tb_juiz' AS tabela, COUNT(*) AS qtd FROM tb_juiz
UNION ALL
SELECT 'tb_kits' AS tabela, COUNT(*) AS qtd FROM tb_kits
UNION ALL
SELECT 'tb_laboratorios' AS tabela, COUNT(*) AS qtd FROM tb_laboratorios
UNION ALL
SELECT 'tb_lcoleta' AS tabela, COUNT(*) AS qtd FROM tb_lcoleta
UNION ALL
SELECT 'tb_mapa_extampli' AS tabela, COUNT(*) AS qtd FROM tb_mapa_extampli
UNION ALL
SELECT 'tb_mapa_extampli_casos' AS tabela, COUNT(*) AS qtd FROM tb_mapa_extampli_casos
UNION ALL
SELECT 'tb_medicos' AS tabela, COUNT(*) AS qtd FROM tb_medicos
UNION ALL
SELECT 'tb_pacientes' AS tabela, COUNT(*) AS qtd FROM tb_pacientes
UNION ALL
SELECT 'tb_parametro' AS tabela, COUNT(*) AS qtd FROM tb_parametro
UNION ALL
SELECT 'tb_parcelas' AS tabela, COUNT(*) AS qtd FROM tb_parcelas
UNION ALL
SELECT 'tb_pedidos_web' AS tabela, COUNT(*) AS qtd FROM tb_pedidos_web
UNION ALL
SELECT 'tb_pesquisa' AS tabela, COUNT(*) AS qtd FROM tb_pesquisa
UNION ALL
SELECT 'tb_pessoas' AS tabela, COUNT(*) AS qtd FROM tb_pessoas
UNION ALL
SELECT 'tb_procedimentos' AS tabela, COUNT(*) AS qtd FROM tb_procedimentos
UNION ALL
SELECT 'tb_procedimentos_carga' AS tabela, COUNT(*) AS qtd FROM tb_procedimentos_carga
UNION ALL
SELECT 'tb_procedimentos_resultado' AS tabela, COUNT(*) AS qtd FROM tb_procedimentos_resultado
UNION ALL
SELECT 'tb_processo' AS tabela, COUNT(*) AS qtd FROM tb_processo
UNION ALL
SELECT 'tb_processo_credito' AS tabela, COUNT(*) AS qtd FROM tb_processo_credito
UNION ALL
SELECT 'tb_registros_ponto' AS tabela, COUNT(*) AS qtd FROM tb_registros_ponto
UNION ALL
SELECT 'tb_regra' AS tabela, COUNT(*) AS qtd FROM tb_regra
UNION ALL
SELECT 'tb_restricao' AS tabela, COUNT(*) AS qtd FROM tb_restricao
UNION ALL
SELECT 'tb_sequencial' AS tabela, COUNT(*) AS qtd FROM tb_sequencial
UNION ALL
SELECT 'tb_situacao' AS tabela, COUNT(*) AS qtd FROM tb_situacao
UNION ALL
SELECT 'tb_status_procedimento' AS tabela, COUNT(*) AS qtd FROM tb_status_procedimento
UNION ALL
SELECT 'tb_temp_credito' AS tabela, COUNT(*) AS qtd FROM tb_temp_credito
UNION ALL
SELECT 'tb_temp_mec' AS tabela, COUNT(*) AS qtd FROM tb_temp_mec
UNION ALL
SELECT 'tb_uf' AS tabela, COUNT(*) AS qtd FROM tb_uf
UNION ALL
SELECT 'tb_varas' AS tabela, COUNT(*) AS qtd FROM tb_varas;
