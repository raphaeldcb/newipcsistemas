-- =============================================================================
-- SGBD_SCPG  -  estrutura convertida de Firebird 2.5 (WI-V2.5.9.27139) para MySQL 8.3
-- Charset: utf8mb4 | Engine: InnoDB | Nomes de objetos em minusculo
-- Execute com o cliente em UTF-8:  mysql --default-character-set=utf8mb4 < estrutura_mysql.sql
-- =============================================================================
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS sgbd_scpg
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_0900_ai_ci;
USE sgbd_scpg;

-- Os generators do Firebird (GEN_*) e os triggers TG_GERA_CODIGO_* foram
-- substituidos por colunas AUTO_INCREMENT (ver tabelas abaixo).

-- =============================================================================
-- TABELAS
-- =============================================================================

-- Tabela: tb_acordos
CREATE TABLE tb_acordos (
  aco_cod     INT NOT NULL,
  aco_dcad    DATE,
  aco_hora    TIME,
  lab_cod     INT,
  cas_codigo  VARCHAR(6),
  aco_vlrweb  DECIMAL(14,4),
  aco_vlrimp  DECIMAL(14,4),
  aco_vigente INT,
  aco_dina    DATE,
  aco_covid   VARCHAR(3),
  PRIMARY KEY (aco_cod)
) ENGINE=InnoDB;

-- Tabela: tb_alelos
CREATE TABLE tb_alelos (
  cod_ale INT NOT NULL AUTO_INCREMENT,
  nm1_ale VARCHAR(100),
  nm2_ale VARCHAR(100),
  nm3_ale VARCHAR(100),
  nm4_ale VARCHAR(100),
  mar_ale VARCHAR(200),
  al1_ale VARCHAR(30),
  al2_ale VARCHAR(30),
  ord_ale INT,
  PRIMARY KEY (cod_ale)
) ENGINE=InnoDB;

-- Tabela: tb_alelos_frequencia
CREATE TABLE tb_alelos_frequencia (
  fre_marcador   VARCHAR(10),
  fre_alelo      DECIMAL(12,1),
  fre_frequencia DECIMAL(12,6)
) ENGINE=InnoDB;

-- Tabela: tb_alelos_resultados
CREATE TABLE tb_alelos_resultados (
  are_marcador   VARCHAR(10),
  are_al1_mae    DECIMAL(12,2),
  are_al2_mae    DECIMAL(12,2),
  are_al1_cri    DECIMAL(12,2),
  are_al2_cri    DECIMAL(12,2),
  are_al1_spa    DECIMAL(12,2),
  are_al2_spa    DECIMAL(12,2),
  are_frequencia DECIMAL(12,2),
  are_pi         DECIMAL(12,6),
  are_proba      DECIMAL(12,6),
  pro_cod        INT
) ENGINE=InnoDB;

-- Tabela: tb_alelos_tipos
CREATE TABLE tb_alelos_tipos (
  atp_cod   INT,
  atp_nome  VARCHAR(60),
  atp_ordem INT,
  atp_tipo  VARCHAR(30),
  atp_lmmin DECIMAL(12,2),
  atp_lmmax DECIMAL(12,2)
) ENGINE=InnoDB;

-- Tabela: tb_alelos_tmp
CREATE TABLE tb_alelos_tmp (
  cod_tale      INT NOT NULL AUTO_INCREMENT,
  caso_tale     VARCHAR(100),
  pessoa_tale   VARCHAR(100),
  iniciais_tale VARCHAR(100),
  tipo_tale     VARCHAR(100),
  alelo_tale    VARCHAR(200),
  valor1_tale   VARCHAR(30),
  valor2_tale   VARCHAR(30),
  PRIMARY KEY (cod_tale)
) ENGINE=InnoDB;

-- Tabela: tb_auditoria
CREATE TABLE tb_auditoria (
  pro_cod        INT NOT NULL,
  hos_usua       VARCHAR(60),
  aud_data       DATE,
  aud_hora       VARCHAR(12),
  aud_aviso      VARCHAR(200),
  aud_execucao   VARCHAR(100),
  aud_contr      INT NOT NULL AUTO_INCREMENT,
  aud_cam_orialt VARCHAR(300),
  PRIMARY KEY (aud_contr)
) ENGINE=InnoDB;

-- Tabela: tb_banco
CREATE TABLE tb_banco (
  cod_banco  VARCHAR(3) NOT NULL,
  desc_banco VARCHAR(50),
  PRIMARY KEY (cod_banco)
) ENGINE=InnoDB;

-- Tabela: tb_casos
CREATE TABLE tb_casos (
  cas_contr  INT NOT NULL,
  cas_codigo VARCHAR(6),
  cas_desc   VARCHAR(60),
  cas_vlr    DECIMAL(14,2),
  cas_nome0  VARCHAR(3),
  cas_nome1  VARCHAR(15),
  cas_nome2  VARCHAR(15),
  cas_nome3  VARCHAR(15),
  cas_nome4  VARCHAR(15),
  cas_sig1   VARCHAR(5),
  cas_sig2   VARCHAR(5),
  cas_sig3   VARCHAR(5),
  cas_sig4   VARCHAR(5),
  PRIMARY KEY (cas_contr)
) ENGINE=InnoDB;

-- Tabela: tb_caso_endereco
CREATE TABLE tb_caso_endereco (
  cor_cod     INT NOT NULL,
  cor_destino VARCHAR(60),
  cor_end     VARCHAR(80),
  cor_bairro  VARCHAR(40),
  cor_cid     VARCHAR(40),
  cor_cep     VARCHAR(12),
  uf_sigla    VARCHAR(2),
  pro_cod     INT,
  PRIMARY KEY (cor_cod)
) ENGINE=InnoDB;

-- Tabela: tb_codigo
CREATE TABLE tb_codigo (
  pro_cod INT NOT NULL,
  status  CHAR(1),
  PRIMARY KEY (pro_cod)
) ENGINE=InnoDB;

-- Tabela: tb_colaborador
CREATE TABLE tb_colaborador (
  clb_cod  INT NOT NULL,
  clb_pis  VARCHAR(11),
  clb_nome VARCHAR(200),
  PRIMARY KEY (clb_cod)
) ENGINE=InnoDB;

-- Tabela: tb_coletador
CREATE TABLE tb_coletador (
  col_cod   INT NOT NULL,
  col_ordem INT NOT NULL,
  col_nome  VARCHAR(200),
  PRIMARY KEY (col_cod)
) ENGINE=InnoDB;

-- Tabela: tb_coletador_rel
CREATE TABLE tb_coletador_rel (
  codigo INT NOT NULL,
  ordem  INT NOT NULL,
  nome   VARCHAR(200),
  PRIMARY KEY (ordem)
) ENGINE=InnoDB;

-- Tabela: tb_coleta_adicional
CREATE TABLE tb_coleta_adicional (
  coa_id     INT NOT NULL AUTO_INCREMENT,
  pro_cod    INT NOT NULL,
  coa_data   DATE,
  coa_hora   VARCHAR(5),
  coa_obs    VARCHAR(50),
  lco_cod    INT,
  coa_datrec DATE,
  PRIMARY KEY (coa_id, pro_cod)
) ENGINE=InnoDB;

-- Tabela: tb_comarca
CREATE TABLE tb_comarca (
  uf_sigla  VARCHAR(2) NOT NULL,
  com_cod   INT NOT NULL,
  com_desc  VARCHAR(40),
  com_sigla VARCHAR(2),
  PRIMARY KEY (uf_sigla, com_cod)
) ENGINE=InnoDB;

-- Tabela: tb_compra_kit
CREATE TABLE tb_compra_kit (
  numero_kit    INT NOT NULL,
  nome_supai    VARCHAR(60),
  cpf_supai     VARCHAR(14),
  ende_supai    VARCHAR(200),
  data_cadastro DATE,
  PRIMARY KEY (numero_kit)
) ENGINE=InnoDB;

-- Tabela: tb_contaalelo
CREATE TABLE tb_contaalelo (
  qtd_codigo INT NOT NULL
) ENGINE=InnoDB;

-- Tabela: tb_controle
CREATE TABLE tb_controle (
  codigo_procedimento INT NOT NULL,
  codigo_paciente     INT NOT NULL
) ENGINE=InnoDB;

-- Tabela: tb_correspondencia
CREATE TABLE tb_correspondencia (
  end_cod    INT NOT NULL,
  pro_cod    INT NOT NULL,
  obs        VARCHAR(20),
  tipo       VARCHAR(10),
  regcorreio VARCHAR(14),
  corr_usu   VARCHAR(20) NOT NULL,
  corr_data  DATE NOT NULL,
  PRIMARY KEY (end_cod, pro_cod)
) ENGINE=InnoDB;

-- Tabela: tb_creditos
CREATE TABLE tb_creditos (
  id_credito   INT NOT NULL AUTO_INCREMENT,
  jui_cod      INT,
  pro_cod      INT,
  cred_qdcre   VARCHAR(10),
  cre_data     DATE,
  pro_dtrec    DATE,
  cred_inicial INT,
  cred_final   INT,
  PRIMARY KEY (id_credito)
) ENGINE=InnoDB;

-- Tabela: tb_creditos_temporario
CREATE TABLE tb_creditos_temporario (
  id_credito INT,
  jui_cod    INT,
  pro_cod    INT,
  cred_qdcre VARCHAR(10),
  cre_data   DATE,
  pro_dtrec  DATE
) ENGINE=InnoDB;

-- Tabela: tb_dadosprocesso
CREATE TABLE tb_dadosprocesso (
  dpr_cod INT NOT NULL,
  dpr_tia VARCHAR(50),
  reqte   VARCHAR(100),
  reqdo   VARCHAR(100),
  pro_cod INT NOT NULL
) ENGINE=InnoDB;

-- Tabela: tb_enderecos
CREATE TABLE tb_enderecos (
  end_cod   INT NOT NULL AUTO_INCREMENT,
  end_loc   VARCHAR(60),
  end_nmr   VARCHAR(80),
  end_bai   VARCHAR(30),
  end_end   VARCHAR(120),
  end_cid   VARCHAR(40),
  end_cep   VARCHAR(40),
  uf_sigla  VARCHAR(2),
  end_trata VARCHAR(30),
  PRIMARY KEY (end_cod)
) ENGINE=InnoDB;

-- Tabela: tb_exames
CREATE TABLE tb_exames (
  exa_cod    VARCHAR(10),
  exa_desc   VARCHAR(100),
  exa_unm    INT,
  exa_sin    VARCHAR(50),
  exa_met    VARCHAR(200),
  exa_vre    VARCHAR(30),
  exa_vlab   DECIMAL(10,2),
  exa_vpac   DECIMAL(10,2),
  exa_recm   VARCHAR(500),
  exa_mate   VARCHAR(200),
  exa_observ VARCHAR(2000)
) ENGINE=InnoDB;

-- Tabela: tb_extracao
CREATE TABLE tb_extracao (
  ext_cod          INT NOT NULL AUTO_INCREMENT,
  ext_data         DATE,
  mpea_lote        INT NOT NULL,
  ext_resp         VARCHAR(20),
  ext_super        VARCHAR(20),
  seq_dtcorr       DATE,
  seq_resp         VARCHAR(20),
  seq_super        VARCHAR(20),
  seq_forlote      VARCHAR(20),
  seq_ilslote      VARCHAR(20),
  seq_ladlote      VARCHAR(20),
  seq_pip10ul      INT DEFAULT 0,
  seq_pip200ul     INT DEFAULT 0,
  seq_pip1000ul    INT DEFAULT 0,
  rea_ftalote      VARCHAR(20),
  rea_chelexlote   VARCHAR(20),
  rea_agualote     VARCHAR(20),
  ampl_resp        VARCHAR(20),
  ampl_super       VARCHAR(20),
  ampl_data        DATE,
  ampl_kitlote     VARCHAR(20),
  ampl_term9700    INT DEFAULT 0,
  ampl_term2720    INT DEFAULT 0,
  ampl_pip10ul     INT DEFAULT 0,
  ampl_pip200ul    INT DEFAULT 0,
  ampl_pip1000ul   INT DEFAULT 0,
  equ_outros       VARCHAR(20),
  equ_blcter19     INT DEFAULT 0,
  equ_blcter20     INT DEFAULT 0,
  equ_vortex18     INT DEFAULT 0,
  equ_agimag25     INT DEFAULT 0,
  equ_bombva30     INT DEFAULT 0,
  equ_centr31      INT DEFAULT 0,
  equ_pip10ul      INT DEFAULT 0,
  equ_pip200ul     INT DEFAULT 0,
  equ_pip1000ul    INT DEFAULT 0,
  equ_pip10ulnum   INT DEFAULT 0,
  equ_pip200ulnum  INT DEFAULT 0,
  equ_pip1000ulnum INT DEFAULT 0,
  PRIMARY KEY (ext_cod)
) ENGINE=InnoDB;

-- Tabela: tb_extracao_casos
CREATE TABLE tb_extracao_casos (
  extc_cod         INT NOT NULL AUTO_INCREMENT,
  sup_data         DATE,
  sup_super        VARCHAR(20),
  sup_meiorem      INT DEFAULT 0,
  sup_pespara      VARCHAR(20),
  sup_simgeamo     INT DEFAULT 0,
  sup_inclmacri    INT DEFAULT 0,
  sup_inclmasup    INT DEFAULT 0,
  ana_dtleit       DATE,
  ana_resconf      VARCHAR(20),
  pro_cod          INT NOT NULL,
  ana_iniconfnconf INT DEFAULT 0,
  ana_simgeamo     INT DEFAULT 0,
  ana_inclmacri    INT DEFAULT 0,
  ana_inclmasup    INT DEFAULT 0,
  ana_inclusao     INT DEFAULT 0,
  ana_mutacao      INT DEFAULT 0,
  ana_marcador     VARCHAR(20),
  ana_exclusao     INT DEFAULT 0,
  ana_contraprova  INT DEFAULT 0,
  ana_conforme     INT DEFAULT 0,
  ana_repeticao    INT DEFAULT 0,
  ana_repeticaom   INT DEFAULT 0,
  ana_repeticaoc   INT DEFAULT 0,
  ana_repeticaosp  INT DEFAULT 0,
  ana_ouanadp18    INT DEFAULT 0,
  ana_ouanacroy    INT DEFAULT 0,
  ana_ouanaresp    VARCHAR(20),
  ana_inclusivo    INT DEFAULT 0,
  ana_ouanadata    DATE,
  ana_ladcompale   INT DEFAULT 0,
  ana_contrdna     INT DEFAULT 0,
  mpea_lote        INT NOT NULL,
  PRIMARY KEY (extc_cod)
) ENGINE=InnoDB;

-- Tabela: tb_historico
CREATE TABLE tb_historico (
  his_contr INT NOT NULL AUTO_INCREMENT,
  pro_cod   INT NOT NULL,
  ite_cod   INT NOT NULL,
  his_data  DATE,
  his_doc   VARCHAR(50),
  his_obs   VARCHAR(50),
  PRIMARY KEY (his_contr, pro_cod)
) ENGINE=InnoDB;

-- Tabela: tb_hosts
CREATE TABLE tb_hosts (
  hos_nome     VARCHAR(50),
  hos_usua     VARCHAR(20) NOT NULL,
  hos_senha    VARCHAR(10),
  res_cod      INT,
  hos_maqui    VARCHAR(20),
  hos_situacao INT NOT NULL DEFAULT 0,
  hos_dtultalt DATE
) ENGINE=InnoDB;

-- Tabela: tb_impressoes
CREATE TABLE tb_impressoes (
  pro_cod   INT NOT NULL,
  ite_cod   INT NOT NULL,
  imp_tipo  VARCHAR(20),
  imp_qdfl  INT,
  imp_qdim  INT,
  imp_impr  VARCHAR(50),
  imp_data  DATE,
  imp_contr INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (imp_contr)
) ENGINE=InnoDB;

-- Tabela: tb_item
CREATE TABLE tb_item (
  ite_cod  INT NOT NULL,
  ite_desc VARCHAR(60),
  ite_org  CHAR(1),
  PRIMARY KEY (ite_cod)
) ENGINE=InnoDB;

-- Tabela: tb_juiz
CREATE TABLE tb_juiz (
  jui_cod     INT NOT NULL,
  jui_desc    VARCHAR(50),
  jui_sexo    CHAR(1),
  jui_credito CHAR(1),
  PRIMARY KEY (jui_cod)
) ENGINE=InnoDB;

-- Tabela: tb_kits
CREATE TABLE tb_kits (
  kit_cod      INT NOT NULL AUTO_INCREMENT,
  kit_tip      INT,
  kit_num      INT NOT NULL,
  col_cod      INT NOT NULL,
  kit_denv     DATE,
  kit_dret     DATE,
  kit_cexa     INT,
  kit_status   CHAR(1),
  kit_rastrear VARCHAR(20),
  PRIMARY KEY (kit_cod)
) ENGINE=InnoDB;

-- Tabela: tb_laboratorios
CREATE TABLE tb_laboratorios (
  lab_cod            INT NOT NULL,
  lab_nome           VARCHAR(60),
  lab_sexo           VARCHAR(10),
  lab_crm            VARCHAR(15),
  lab_labt           VARCHAR(60),
  lab_fone           VARCHAR(25),
  lab_end            VARCHAR(80),
  lab_cid            VARCHAR(40),
  uf_sigla           VARCHAR(2),
  lab_intext         VARCHAR(8),
  lab_fgvlr          VARCHAR(3),
  lab_fgboleto       VARCHAR(3),
  com_cod            INT,
  lab_fg_exporta     INT,
  lab_cod_internet   SMALLINT,
  lab_resul_internet SMALLINT,
  PRIMARY KEY (lab_cod)
) ENGINE=InnoDB;

-- Tabela: tb_lcoleta
CREATE TABLE tb_lcoleta (
  lco_cod            INT NOT NULL,
  lco_nome           VARCHAR(60),
  lco_sexo           INT,
  lco_crm            VARCHAR(15),
  lco_labt           VARCHAR(60),
  lco_fone           VARCHAR(25),
  lco_end            VARCHAR(80),
  lco_cid            VARCHAR(40),
  uf_sigla           VARCHAR(2),
  lco_tlie           INT,
  lco_cate           INT,
  lco_trat           INT,
  lco_cel            VARCHAR(15),
  lco_res            VARCHAR(15),
  lco_email          VARCHAR(50),
  lco_site           VARCHAR(50),
  lco_cep            VARCHAR(12),
  lco_dtre           DATE,
  lco_dcad           DATE,
  lco_numcartcorreio INT,
  lco_situacao       CHAR(1),
  lco_dnasc          DATE,
  lco_cpfcnpj        VARCHAR(20),
  lco_banco          VARCHAR(20),
  lco_agencia        VARCHAR(20),
  lco_conta          VARCHAR(30),
  lco_minkit         INT,
  lco_pix            VARCHAR(100),
  PRIMARY KEY (lco_cod)
) ENGINE=InnoDB;

-- Tabela: tb_mapa_extampli
CREATE TABLE tb_mapa_extampli (
  pro_cod      INT,
  mpea_data    DATE NOT NULL,
  mpea_lote    INT NOT NULL,
  mpea_ord     INT,
  pes_iniciais VARCHAR(10),
  sit_sigla    VARCHAR(5)
) ENGINE=InnoDB;

-- Tabela: tb_mapa_extampli_casos
CREATE TABLE tb_mapa_extampli_casos (
  mpea_lote    INT NOT NULL,
  pro_cod      INT NOT NULL,
  mpea_ord     INT NOT NULL,
  pes_iniciais VARCHAR(10),
  sit_sigla    VARCHAR(5),
  PRIMARY KEY (pro_cod, mpea_lote, mpea_ord)
) ENGINE=InnoDB;

-- Tabela: tb_medicos
CREATE TABLE tb_medicos (
  med_crm  VARCHAR(15),
  med_nome VARCHAR(60),
  med_cid  VARCHAR(40),
  med_cod  INT NOT NULL,
  PRIMARY KEY (med_cod)
) ENGINE=InnoDB;

-- Tabela: tb_pacientes
CREATE TABLE tb_pacientes (
  pes_cod          INT NOT NULL,
  pes_nome         VARCHAR(60),
  pes_escv         VARCHAR(12),
  pes_ida          INT,
  pes_sexo         VARCHAR(10),
  pes_dnas         DATE,
  pes_end          VARCHAR(150),
  pes_cies         VARCHAR(50),
  pes_fres         VARCHAR(16),
  pes_fcel         VARCHAR(16),
  pes_cpf          VARCHAR(15),
  pes_rg           VARCHAR(30),
  pes_cod_internet SMALLINT,
  pes_email        VARCHAR(100),
  pes_numcar       VARCHAR(30),
  pes_claori       VARCHAR(20),
  pes_raca         VARCHAR(30),
  pes_nunend       VARCHAR(10),
  pes_cep          VARCHAR(10),
  pes_bairro       VARCHAR(50),
  pes_sintomas     VARCHAR(200),
  pes_uf           VARCHAR(2),
  pes_sintoma1     SMALLINT,
  pes_sintoma2     SMALLINT,
  pes_sintoma3     SMALLINT,
  pes_sintoma4     SMALLINT,
  pes_sintoma5     SMALLINT,
  pes_sintoma6     SMALLINT,
  pes_sintoma7     SMALLINT,
  pes_sintoma8     SMALLINT,
  pes_sintoma9     SMALLINT,
  pes_sintoma10    SMALLINT,
  pes_pass         VARCHAR(30),
  PRIMARY KEY (pes_cod)
) ENGINE=InnoDB;

-- Tabela: tb_parametro
CREATE TABLE tb_parametro (
  pam_cod              INT NOT NULL,
  pam_dpadr            VARCHAR(200) NOT NULL,
  pam_ddest            VARCHAR(200) NOT NULL,
  pam_unid             VARCHAR(3) NOT NULL,
  pam_drcol            VARCHAR(600),
  pam_dpadrdg          VARCHAR(200),
  pam_drexcel          VARCHAR(300),
  pam_dirmpextracao    VARCHAR(300),
  pam_dirmpextracaoxls VARCHAR(300),
  pam_vlrjud           DECIMAL(10,2),
  pam_vlrextra         DECIMAL(10,2),
  pam_vlrmp            DECIMAL(10,2),
  pam_vlrdp            DECIMAL(10,2),
  pam_vlrct            DECIMAL(10,2),
  pam_drpdf            VARCHAR(300),
  pam_impetq           INT DEFAULT 0,
  pam_dirdoc           VARCHAR(300),
  pam_dirintegradoc    VARCHAR(300),
  pam_dirintegraof     VARCHAR(300),
  pam_ultcred          INT,
  PRIMARY KEY (pam_cod)
) ENGINE=InnoDB;

-- Tabela: tb_parcelas
CREATE TABLE tb_parcelas (
  pro_cod          INT NOT NULL,
  par_nparc        INT,
  par_vlr          DECIMAL(14,2),
  par_data         DATE,
  par_sit          INT,
  par_tppg         VARCHAR(30),
  controle         INT NOT NULL AUTO_INCREMENT,
  par_obs          VARCHAR(80),
  par_hora         TIME DEFAULT (CURRENT_TIME),
  par_onde         VARCHAR(20),
  par_dataprevista DATE,
  par_nmfor        VARCHAR(100),
  PRIMARY KEY (pro_cod, controle),
  KEY idx_tb_parcelas_controle (controle)
) ENGINE=InnoDB;

-- Tabela: tb_pedidos_web
CREATE TABLE tb_pedidos_web (
  pwb_cod       INT NOT NULL,
  pwb_dcad      DATE,
  pwb_prot      VARCHAR(30),
  pwb_idpd      VARCHAR(50),
  pwb_nome      VARCHAR(100),
  pwb_dnas      DATE,
  pwb_email     VARCHAR(70),
  pwb_pass      VARCHAR(30),
  pwb_cpf       VARCHAR(30),
  pwb_cvn       INT,
  pwb_tele      VARCHAR(30),
  pwb_sexo      VARCHAR(30),
  pwb_dcole     DATE,
  pwb_hcole     TIME,
  pwb_fg_resul  SMALLINT,
  pwb_rg        VARCHAR(30),
  pwb_ord       SMALLINT,
  pwb_claori    VARCHAR(30),
  pwb_convenio  VARCHAR(40),
  pwb_prazo     VARCHAR(130),
  pwb_nuncar    VARCHAR(20),
  pwb_resultado VARCHAR(30),
  pwb_raca      VARCHAR(30),
  pwb_nunend    VARCHAR(10),
  pwb_cep       VARCHAR(10),
  pwb_bairro    VARCHAR(50),
  pwb_sintomas  VARCHAR(200),
  pwb_uf        VARCHAR(2),
  pwb_end       VARCHAR(150),
  pwb_cies      VARCHAR(50),
  pwb_escv      VARCHAR(20),
  pwb_sintoma1  SMALLINT,
  pwb_sintoma2  SMALLINT,
  pwb_sintoma3  SMALLINT,
  pwb_sintoma4  SMALLINT,
  pwb_sintoma5  SMALLINT,
  pwb_sintoma6  SMALLINT,
  pwb_sintoma7  SMALLINT,
  pwb_sintoma8  SMALLINT,
  pwb_sintoma9  SMALLINT,
  pwb_sintoma10 SMALLINT,
  pwb_automa    INT DEFAULT 0,
  pwb_exame     SMALLINT,
  PRIMARY KEY (pwb_cod)
) ENGINE=InnoDB;

-- Tabela: tb_pesquisa
CREATE TABLE tb_pesquisa (
  peq_cod   INT NOT NULL AUTO_INCREMENT,
  peq_nome  VARCHAR(80),
  peq_ndoc  VARCHAR(80),
  peq_estc  VARCHAR(80),
  peq_dtnas DATE,
  peq_lcnas VARCHAR(100),
  peq_lcre  VARCHAR(100),
  peq_fone  VARCHAR(20),
  PRIMARY KEY (peq_cod)
) ENGINE=InnoDB;

-- Tabela: tb_pessoas
CREATE TABLE tb_pessoas (
  pro_cod      INT NOT NULL,
  pes_cod      INT NOT NULL AUTO_INCREMENT,
  pes_nome     VARCHAR(60),
  pes_iniciais VARCHAR(10),
  pes_sit      INT,
  pes_dtnas    DATE,
  pes_lcnas    VARCHAR(50),
  pes_sexo     CHAR(1),
  pes_tdoc     VARCHAR(30),
  pes_ndoc     VARCHAR(200),
  PRIMARY KEY (pro_cod, pes_cod),
  KEY idx_tb_pessoas_pes_cod (pes_cod)
) ENGINE=InnoDB;

-- Tabela: tb_procedimentos
CREATE TABLE tb_procedimentos (
  pro_cod      INT NOT NULL,
  pro_dcad     DATE,
  pes_cod      INT,
  lab_cod      INT,
  med_crm      VARCHAR(15),
  exa_cod      VARCHAR(10),
  pro_dcol     DATE,
  pro_dent     DATE,
  pro_geno     VARCHAR(50),
  pro_vlog     DECIMAL(14,4),
  pro_resul    VARCHAR(30),
  pro_obs      VARCHAR(100),
  pro_uint     DECIMAL(14,4),
  pro_cmli     DECIMAL(14,4),
  pro_prot     VARCHAR(12),
  pro_apa      VARCHAR(3),
  pro_drec     DATE,
  pro_atend    VARCHAR(40),
  pro_tipr     VARCHAR(10),
  pro_hcad     VARCHAR(5),
  pro_valor    DECIMAL(10,2),
  pro_hcol     TIME,
  pro_fg_resul SMALLINT,
  pro_prazo    VARCHAR(30),
  pro_idweb    INT,
  pro_tippag   VARCHAR(30),
  pro_hash     VARCHAR(255),
  pro_fg_site  INT,
  PRIMARY KEY (pro_cod)
) ENGINE=InnoDB;

-- Tabela: tb_procedimentos_carga
CREATE TABLE tb_procedimentos_carga (
  proc_cod  INT NOT NULL AUTO_INCREMENT,
  pro_cod   INT,
  proc_data DATE DEFAULT (CURRENT_DATE),
  proc_hora TIME DEFAULT (CURRENT_TIME),
  hos_usua  VARCHAR(20),
  PRIMARY KEY (proc_cod)
) ENGINE=InnoDB;

-- Tabela: tb_procedimentos_resultado
CREATE TABLE tb_procedimentos_resultado (
  pror_cod   INT NOT NULL AUTO_INCREMENT,
  pro_cod    INT,
  pror_dat   DATE,
  pro_vlog   DECIMAL(14,9),
  pro_uint   DECIMAL(14,4),
  pro_cmli   DECIMAL(14,4),
  pro_resul  VARCHAR(100),
  pro_resul3 VARCHAR(100),
  pro_resul2 VARCHAR(100),
  pro_resul4 VARCHAR(100),
  PRIMARY KEY (pror_cod)
) ENGINE=InnoDB;

-- Tabela: tb_processo
CREATE TABLE tb_processo (
  pro_cod            INT NOT NULL,
  pro_ano            INT,
  pro_nperc          VARCHAR(17),
  pro_tipo           INT,
  pro_auto           VARCHAR(30),
  uf_sigla           VARCHAR(2),
  cas_codigo         VARCHAR(6),
  com_cod            INT,
  var_cod            INT,
  lco_cod            INT,
  pro_hcole          VARCHAR(5),
  pro_dcole          DATE,
  pro_hrec           VARCHAR(5),
  pro_drec           DATE,
  pro_dresu          DATE,
  pro_sit            INT,
  pro_ncomp          INT,
  pro_resul          INT,
  pro_prob           VARCHAR(15),
  pro_areti          VARCHAR(100),
  jui_cod            INT,
  fg_prop            VARCHAR(1),
  pro_usucad         VARCHAR(20),
  pro_numlaudo       VARCHAR(20),
  pro_rastrear       VARCHAR(20),
  pro_carregacredito CHAR(1),
  pro_creditodna     VARCHAR(20),
  pro_htrec          VARCHAR(5),
  pro_lacre          VARCHAR(20),
  pro_fg_externo     INT DEFAULT 0,
  pro_fg_resul       INT DEFAULT 0,
  pro_data_externo   DATE,
  fg_calccred        INT DEFAULT 0,
  PRIMARY KEY (pro_cod)
) ENGINE=InnoDB;

-- Tabela: tb_processo_credito
CREATE TABLE tb_processo_credito (
  pro_cod     INT NOT NULL,
  uf_sigla    VARCHAR(2),
  com_cod     INT,
  var_cod     INT,
  num_credito INT,
  dat_credito DATE,
  PRIMARY KEY (pro_cod)
) ENGINE=InnoDB;

-- Tabela: tb_registros_ponto
CREATE TABLE tb_registros_ponto (
  rgp_seq   INT NOT NULL,
  rgp_pis   VARCHAR(11),
  rgp_dtreg DATE,
  rgp_hrreg TIME,
  rgp_dtimp DATE,
  PRIMARY KEY (rgp_seq)
) ENGINE=InnoDB;

-- Tabela: tb_regra
CREATE TABLE tb_regra (
  reg_cod   INT NOT NULL,
  reg_mod   VARCHAR(20) NOT NULL,
  ite_cod   INT NOT NULL,
  reg_tipo  INT NOT NULL,
  reg_pasta VARCHAR(20) NOT NULL,
  reg_cpnom VARCHAR(5) NOT NULL,
  PRIMARY KEY (reg_cod)
) ENGINE=InnoDB;

-- Tabela: tb_restricao
CREATE TABLE tb_restricao (
  res_cod  INT NOT NULL,
  res_desc VARCHAR(200),
  PRIMARY KEY (res_cod)
) ENGINE=InnoDB;

-- Tabela: tb_sequencial
CREATE TABLE tb_sequencial (
  sequencial INT
) ENGINE=InnoDB;

-- Tabela: tb_situacao
CREATE TABLE tb_situacao (
  sit_cod   INT NOT NULL,
  sit_nm    VARCHAR(20),
  sit_sigla VARCHAR(5),
  sit_ordem INT,
  PRIMARY KEY (sit_cod)
) ENGINE=InnoDB;

-- Tabela: tb_status_procedimento
CREATE TABLE tb_status_procedimento (
  pro_cod    INT,
  stp_data   DATE,
  stp_desc   VARCHAR(60),
  stp_status INT
) ENGINE=InnoDB;

-- Tabela: tb_temp_credito
CREATE TABLE tb_temp_credito (
  id_credito INT NOT NULL,
  tcred_num  INT NOT NULL,
  tcred_juiz VARCHAR(100)
) ENGINE=InnoDB;

-- Tabela: tb_temp_mec
CREATE TABLE tb_temp_mec (
  mpea_lote    INT NOT NULL,
  pro_cod      INT NOT NULL,
  mpea_ord     INT NOT NULL,
  pes_iniciais VARCHAR(10),
  sit_sigla    VARCHAR(5)
) ENGINE=InnoDB;

-- Tabela: tb_uf
CREATE TABLE tb_uf (
  uf_sigla VARCHAR(2) NOT NULL,
  uf_desc  VARCHAR(20),
  PRIMARY KEY (uf_sigla)
) ENGINE=InnoDB;

-- Tabela: tb_varas
CREATE TABLE tb_varas (
  uf_sigla   VARCHAR(2) NOT NULL,
  com_cod    INT NOT NULL,
  var_cod    INT NOT NULL,
  var_desc   VARCHAR(40),
  jui_cod    INT,
  var_sigla  VARCHAR(3),
  var_end    VARCHAR(80),
  var_bairro VARCHAR(40),
  var_cid    VARCHAR(40),
  var_cep    VARCHAR(12),
  PRIMARY KEY (uf_sigla, com_cod, var_cod)
) ENGINE=InnoDB;

-- -----------------------------------------------------------------------------
-- Tabelas de log/versionamento do IBExpert (OPCIONAL - pode remover esta secao
-- e os triggers ibe$* no final se nao usa mais o IBExpert)
-- -----------------------------------------------------------------------------
CREATE TABLE `ibe$log_tables` (
  id         BIGINT      NOT NULL AUTO_INCREMENT,
  table_name VARCHAR(67) NOT NULL,
  operation  VARCHAR(1)  NOT NULL,
  date_time  DATETIME    NOT NULL,
  user_name  VARCHAR(67) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE `ibe$log_fields` (
  log_tables_id BIGINT       NOT NULL,
  field_name    VARCHAR(67)  NOT NULL,
  old_value     VARCHAR(255),
  new_value     VARCHAR(255),
  KEY `ibe$log_fields_idx1` (log_tables_id)
) ENGINE=InnoDB;

CREATE TABLE `ibe$log_keys` (
  log_tables_id BIGINT       NOT NULL,
  key_field     VARCHAR(67)  NOT NULL,
  key_value     VARCHAR(255),
  KEY `ibe$log_keys_idx1` (log_tables_id)
) ENGINE=InnoDB;

-- VARCHAR(10000) viraria 40.000 bytes/coluna em utf8mb4 e estouraria o limite
-- de 65.535 bytes por linha; por isso as colunas *_char_value viram TEXT.
CREATE TABLE `ibe$log_blob_fields` (
  log_tables_id  BIGINT      NOT NULL,
  field_name     VARCHAR(67) NOT NULL,
  old_char_value TEXT,
  new_char_value TEXT,
  old_blob_value LONGBLOB,
  new_blob_value LONGBLOB,
  KEY `ibe$log_blob_fields_idx1` (log_tables_id)
) ENGINE=InnoDB;

CREATE TABLE `ibe$version_history` (
  `ibe$vh_id`          INT         NOT NULL AUTO_INCREMENT,
  `ibe$vh_modify_date` DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ibe$vh_user_name`   VARCHAR(67),
  `ibe$vh_object_type` SMALLINT    NOT NULL,
  `ibe$vh_object_name` VARCHAR(67) NOT NULL,
  `ibe$vh_header`      LONGBLOB,
  `ibe$vh_body`        LONGBLOB,
  `ibe$vh_description` LONGTEXT,
  PRIMARY KEY (`ibe$vh_id`)
) ENGINE=InnoDB;

-- =============================================================================
-- INDICES
-- =============================================================================
CREATE INDEX idx_cod              ON tb_alelos    (nm1_ale);
CREATE INDEX idx_nome             ON tb_alelos    (nm2_ale);
CREATE INDEX tb_alelos_idx_vl     ON tb_alelos    (al1_ale, al2_ale);
CREATE INDEX tb_auditoria_dt      ON tb_auditoria (aud_data);
CREATE INDEX tb_auditoria_dtcod   ON tb_auditoria (pro_cod, aud_data);
CREATE INDEX tb_auditoria_pro_cod ON tb_auditoria (pro_cod);
CREATE INDEX tb_pessoas_idx1      ON tb_pessoas   (pes_nome, pes_sit);
CREATE INDEX tb_processo_idx1     ON tb_processo  (uf_sigla, cas_codigo, com_cod, var_cod, lco_cod, pro_dresu, pro_drec);
CREATE INDEX tb_processo_pericia  ON tb_processo  (pro_nperc);

-- =============================================================================
-- CHAVES ESTRANGEIRAS
-- (os triggers CHECK_1/2/3 do Firebird eram so a implementacao interna destas FKs)
-- =============================================================================
ALTER TABLE tb_caso_endereco ADD CONSTRAINT fk_tb_caso_endereco_1
  FOREIGN KEY (uf_sigla) REFERENCES tb_uf (uf_sigla);

ALTER TABLE tb_kits ADD CONSTRAINT fk_tb_kits_1
  FOREIGN KEY (col_cod) REFERENCES tb_coletador (col_cod)
  ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE tb_lcoleta ADD CONSTRAINT fk_tb_lcoleta_1
  FOREIGN KEY (uf_sigla) REFERENCES tb_uf (uf_sigla)
  ON UPDATE CASCADE;

-- =============================================================================
-- FUNCOES E PROCEDURES
-- =============================================================================
DELIMITER $$

-- Antes: procedure selecionavel (select * from sp_formata_data(d)). Agora: funcao.
CREATE FUNCTION sp_formata_data(p_data DATE)
RETURNS VARCHAR(10) CHARSET utf8mb4
DETERMINISTIC NO SQL
BEGIN
  RETURN DATE_FORMAT(p_data, '%d/%m/%Y');
END$$

-- Antes: procedure selecionavel. Agora: funcao. (Firebird: 0 = domingo; MySQL DAYOFWEEK: 1 = domingo)
CREATE FUNCTION sp_dia_semana(p_data DATE)
RETURNS VARCHAR(15) CHARSET utf8mb4
DETERMINISTIC NO SQL
BEGIN
  RETURN ELT(DAYOFWEEK(p_data), 'DOMINGO', 'SEGUNDA-FEIRA', 'TERÇA-FEIRA',
             'QUARTA-FEIRA', 'QUINTA-FEIRA', 'SEXTA-FEIRA', 'SÁBADO');
END$$

-- Antes: RETURNS (MENSAGEM) com SUSPEND. Agora: parametro OUT (sempre NULL, como no original).
CREATE PROCEDURE bu_alelos(
  IN  p_valormarcador1 VARCHAR(10),
  IN  p_valormarcador2 VARCHAR(10),
  IN  p_marcador       VARCHAR(30),
  OUT p_mensagem       VARCHAR(30))
BEGIN
  INSERT INTO tb_contaalelo (qtd_codigo)
  SELECT DISTINCT nm1_ale
    FROM tb_alelos
   WHERE al1_ale = p_valormarcador1
     AND al2_ale = p_valormarcador2
     AND mar_ale = p_marcador;
  SET p_mensagem = NULL;
END$$

-- =============================================================================
-- TRIGGERS (apenas os do IBExpert; os de geracao de codigo viraram AUTO_INCREMENT)
-- =============================================================================
CREATE TRIGGER `ibe$log_tables_bd` BEFORE DELETE ON `ibe$log_tables`
FOR EACH ROW
BEGIN
  DELETE FROM `ibe$log_fields`      WHERE log_tables_id = OLD.id;
  DELETE FROM `ibe$log_blob_fields` WHERE log_tables_id = OLD.id;
  DELETE FROM `ibe$log_keys`        WHERE log_tables_id = OLD.id;
END$$

CREATE TRIGGER `ibe$version_history_bi` BEFORE INSERT ON `ibe$version_history`
FOR EACH ROW
BEGIN
  SET NEW.`ibe$vh_user_name`   = SUBSTRING_INDEX(USER(), '@', 1);
  SET NEW.`ibe$vh_modify_date` = NOW();
END$$

DELIMITER ;

-- =============================================================================
-- VIEWS
-- =============================================================================
CREATE VIEW vi_alelosencontrados (contador, codigo) AS
SELECT COUNT(ca.qtd_codigo), ca.qtd_codigo
  FROM tb_contaalelo ca
 GROUP BY ca.qtd_codigo;

CREATE VIEW vi_busca_paciente (pes_cod, pes_cpf) AS
SELECT p.pes_cod,
       CAST(REPLACE(REPLACE(TRIM(p.pes_cpf), '-', ''), '.', '') AS SIGNED) AS pes_cpf
  FROM tb_pacientes p;

CREATE VIEW vi_status_casos (caso, cadastrado, coletado, laboratorio, resultado) AS
SELECT p.pro_cod,
       sp_formata_data(p.pro_drec),
       sp_formata_data(p.pro_dcole),
       sp_formata_data(h.his_data),
       sp_formata_data(p.pro_dresu)
  FROM tb_processo p
  LEFT OUTER JOIN tb_historico h ON h.pro_cod = p.pro_cod AND h.ite_cod = 61;

CREATE VIEW vi_dados_sense (codigo, ano, tipo, uf, vara, comarca, caso, item, local_coleta, valor, tipo_pagamento) AS
SELECT p.pro_cod  AS codigo,
       p.pro_ano  AS ano,
       CASE p.pro_tipo
         WHEN 1  THEN 'Judicial'
         WHEN 2  THEN 'ExtraJudicial'
         WHEN 3  THEN 'Ministério Público'
         WHEN 4  THEN 'Defensoria Pública'
         WHEN 5  THEN 'Delegacia de Polícia'
         WHEN 6  THEN 'Justiça Comunitária'
         WHEN 7  THEN 'Conselho Tutelar'
         WHEN 8  THEN 'Promotoria de Justiça'
         WHEN 9  THEN 'Paternidade Responsável'
         WHEN 10 THEN 'Núcleo de Prática Forense'
       END        AS tipo,
       p.uf_sigla AS uf,
       v.var_desc AS vara,
       cm.com_desc AS comarca,
       pr.cas_desc AS caso,
       i.ite_desc  AS item,
       c.lco_nome  AS local_coleta,
       parc.par_vlr  AS valor,
       parc.par_tppg AS tipo_pagamento
  FROM tb_processo p
  JOIN tb_lcoleta c   ON p.lco_cod = c.lco_cod
  LEFT OUTER JOIN tb_varas v ON v.uf_sigla = p.uf_sigla AND v.com_cod = p.com_cod AND v.var_cod = p.var_cod
  JOIN tb_comarca cm  ON cm.uf_sigla = p.uf_sigla AND cm.com_cod = p.com_cod
  JOIN tb_casos pr    ON p.cas_codigo = pr.cas_codigo
  JOIN tb_historico h ON p.pro_cod = h.pro_cod
  JOIN tb_item i      ON h.ite_cod = i.ite_cod
  LEFT OUTER JOIN tb_parcelas parc ON parc.pro_cod = p.pro_cod;

CREATE VIEW vi_quantidade_kits (codigo, nome, cidade, minimo_kit, atual_kit, ultima_data_envio) AS
SELECT l.lco_cod, l.lco_nome, l.lco_cid, l.lco_minkit,
       (SELECT COUNT(k.kit_num) FROM tb_kits k WHERE l.lco_cod = k.col_cod AND k.kit_status = 'A') AS atualkit,
       (SELECT MAX(k.kit_denv)  FROM tb_kits k WHERE l.lco_cod = k.col_cod AND k.kit_status = 'A') AS ultenvio
  FROM tb_lcoleta l
 WHERE l.lco_situacao = 'A';

CREATE VIEW vi_acordos (cas_codigo, cas_desc, cas_vlrim, cas_vlrwb, lab_cod, lab_labt, vigente) AS
SELECT c.cas_codigo, c.cas_desc, a.aco_vlrimp, a.aco_vlrweb, a.lab_cod, l.lab_labt,
       CASE WHEN a.aco_vigente = 1 THEN 'Sim' ELSE 'Não' END AS vigente
  FROM tb_acordos a
  JOIN tb_casos c        ON c.cas_codigo = a.cas_codigo
  JOIN tb_laboratorios l ON l.lab_cod = a.lab_cod;

CREATE VIEW vi_alelo_limites (val_marcador, val_marcador_min, val_marcador_max) AS
SELECT f.fre_marcador, MIN(f.fre_alelo), MAX(f.fre_alelo)
  FROM tb_alelos_frequencia f
 GROUP BY f.fre_marcador;

CREATE VIEW vi_valor_coletador (caso, valorcaso, valor) AS
SELECT p.pro_cod,
       CAST(SUM(pa.par_vlr) AS DECIMAL(15,2)) AS valor_caso,
       CASE WHEN SUM(pa.par_vlr) >= 11  AND SUM(pa.par_vlr) <= 350 THEN 30
            WHEN SUM(pa.par_vlr) >= 0   AND SUM(pa.par_vlr) <= 10  THEN 60
            WHEN SUM(pa.par_vlr) >= 351 AND SUM(pa.par_vlr) <= 499 THEN 50
            WHEN SUM(pa.par_vlr) >= 500 AND SUM(pa.par_vlr) <= 999 THEN 60
            ELSE 120
       END
  FROM tb_processo p
  JOIN tb_parcelas pa ON pa.pro_cod = p.pro_cod
 GROUP BY p.pro_cod;

SET FOREIGN_KEY_CHECKS = 1;
