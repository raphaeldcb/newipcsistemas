unit ufConsultaCPG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, Mask, StdCtrls, Buttons, ComCtrls,
   ExtCtrls, DBCtrls, JvExControls, JvDBLookup, JvExMask, JvToolEdit;

type
  TfConsultaCPG = class(TForm)
    gb_DadosGerais: TGroupBox;
    Label21: TLabel;
    Label20: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label18: TLabel;
    Label6: TLabel;
    RxDBLookupComboEstado: TJvDBLookupCombo;
    EditEstado: TEdit;
    EditTipoCaso: TEdit;
    EditAno: TEdit;
    EditMae: TEdit;
    EditCrianca: TEdit;
    EditSupai: TEdit;
    gb_Origem: TGroupBox;
    Label24: TLabel;
    Label5: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    RxDBLookupComboComarca: TJvDBLookupCombo;
    EditComarca: TEdit;
    EditVara: TEdit;
    EditAutos: TEdit;
    gb_DadosColeta: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label25: TLabel;
    Label28: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    RxDBLookupComboColeta: TJvDBLookupCombo;
    EditLocal: TEdit;
    gb_DadosResultados: TGroupBox;
    Label30: TLabel;
    Label33: TLabel;
    DS_SelEstado: TDataSource;
    DS_SelComarca: TDataSource;
    DS_SelVaras: TDataSource;
    DS_SelColeta: TDataSource;
    DS_SelCaso: TDataSource;
    qFiltroCPG: TADOQuery;
    DS_FiltroCPG: TDataSource;
    qHistoricoFiltro: TADOQuery;
    sbConsultar: TSpeedButton;
    sbFechar: TSpeedButton;
    DS_HistoricoFiltro: TDataSource;
    sbImprimir: TSpeedButton;
    qContadorPericias: TADOQuery;
    RxDBComboBoxResultado: TComboBox;
    RxDBComboBoxPagamento: TComboBox;
    RxDBComboBoxTipo: TComboBox;
    RxDBComboBoxSituacao: TComboBox;
    StatusBar1: TStatusBar;
    GroupBox6: TGroupBox;
    DBGridCPG: TDBGrid;
    GroupBox5: TGroupBox;
    DBGridHistorico: TDBGrid;
    GroupBox7: TGroupBox;
    DBGridPessoas: TDBGrid;
    qSelEstado: TADOQuery;
    qSelEstadoUF_SIGLA: TStringField;
    qSelEstadoUF_DESC: TStringField;
    qSelComarca: TADOQuery;
    qSelComarcaUF_SIGLA: TStringField;
    qSelComarcaCOM_COD: TIntegerField;
    qSelComarcaCOM_DESC: TStringField;
    qSelComarcaCOM_SIGLA: TStringField;
    qSelVaras: TADOQuery;
    qSelColeta: TADOQuery;
    qSelColetaLCO_COD: TIntegerField;
    qSelColetaLCO_NOME: TStringField;
    qSelColetaLCO_SEXO: TIntegerField;
    qSelColetaLCO_CRM: TStringField;
    qSelColetaLCO_LABT: TStringField;
    qSelColetaLCO_FONE: TStringField;
    qSelColetaLCO_END: TStringField;
    qSelColetaLCO_CID: TStringField;
    qSelColetaUF_SIGLA: TStringField;
    qSelColetaLCO_TLIE: TIntegerField;
    qSelColetaLCO_CATE: TIntegerField;
    qSelColetaLCO_TRAT: TIntegerField;
    qSelCaso: TADOQuery;
    qSelCasoCAS_CONTR: TIntegerField;
    qSelCasoCAS_CODIGO: TStringField;
    qSelCasoCAS_DESC: TStringField;
    qSelCasoCAS_VLR: TBCDField;
    qSelCasoCAS_NOME0: TStringField;
    qSelCasoCAS_NOME1: TStringField;
    qSelCasoCAS_NOME2: TStringField;
    qSelCasoCAS_NOME3: TStringField;
    qSelCasoCAS_NOME4: TStringField;
    qSelCasoCAS_SIG1: TStringField;
    qSelCasoCAS_SIG2: TStringField;
    qSelCasoCAS_SIG3: TStringField;
    qSelCasoCAS_SIG4: TStringField;
    qSelVarasUF_SIGLA: TStringField;
    qSelVarasCOM_COD: TIntegerField;
    qSelVarasVAR_COD: TIntegerField;
    qSelVarasVAR_DESC: TStringField;
    qSelVarasVAR_SIGLA: TStringField;
    qSelVarasJUI_COD: TIntegerField;
    RxDBLookupComboVara: TJvDBLookupCombo;
    qContadorPericiasCOUNT: TIntegerField;
    qFiltroCPGCOUNT: TIntegerField;
    qFiltroCPGPRO_COD: TIntegerField;
    qFiltroCPGPRO_NPERC: TStringField;
    qFiltroCPGLCO_NOME: TStringField;
    qFiltroCPGUF_SIGLA: TStringField;
    qFiltroCPGDESCRICAOCASO: TStringField;
    qFiltroCPGPRO_TIPO: TIntegerField;
    qFiltroCPGPRO_AUTO: TStringField;
    qFiltroCPGCOMARCA: TStringField;
    qFiltroCPGDATAITEM: TDateField;
    qFiltroCPGDESCRICAOITEM: TStringField;
    qFiltroCPGDOCUMENTOITEM: TStringField;
    qFiltroCPGOBSERVACAOITEM: TStringField;
    qHistoricoFiltroPRO_COD: TIntegerField;
    qHistoricoFiltroHIS_DATA: TDateField;
    qHistoricoFiltroITE_COD: TIntegerField;
    qHistoricoFiltroHIS_DOC: TStringField;
    qHistoricoFiltroHIS_OBS: TStringField;
    qPessoasFiltro: TADOQuery;
    DS_PessoaFiltro: TDataSource;
    qPessoasFiltroPRO_COD: TIntegerField;
    qPessoasFiltroPES_COD: TIntegerField;
    qPessoasFiltroPES_NOME: TStringField;
    qPessoasFiltroPES_SIT: TIntegerField;
    qPessoasFiltroPES_DTNAS: TDateField;
    qPessoasFiltroPES_LCNAS: TStringField;
    qPessoasFiltroPES_SEXO: TStringField;
    qPessoasFiltroPES_TDOC: TStringField;
    qPessoasFiltroPES_NDOC: TStringField;
    qHistoricoFiltroITE_DESC: TStringField;
    gb_Union: TGroupBox;
    Label8: TLabel;
    Label15: TLabel;
    EdtUnion: TEdit;
    CheckBox1: TCheckBox;
    qFiltroCPG_Union: TADOQuery;
    DS_FiltroCPG_Union: TDataSource;
    DS_HistoricoFiltro_Union: TDataSource;
    qHistoricoFiltro_Union: TADOQuery;
    qPessoasFiltro_Union: TADOQuery;
    DS_PessoaFiltro_Union: TDataSource;
    qPessoasFiltro_UnionPRO_COD: TIntegerField;
    qPessoasFiltro_UnionPES_COD: TIntegerField;
    qPessoasFiltro_UnionPES_NOME: TStringField;
    qPessoasFiltro_UnionPES_SIT: TIntegerField;
    qPessoasFiltro_UnionPES_DTNAS: TDateField;
    qPessoasFiltro_UnionPES_LCNAS: TStringField;
    qPessoasFiltro_UnionPES_SEXO: TStringField;
    qPessoasFiltro_UnionPES_TDOC: TStringField;
    qPessoasFiltro_UnionPES_NDOC: TStringField;
    qHistoricoFiltro_UnionPRO_COD: TIntegerField;
    qHistoricoFiltro_UnionHIS_DATA: TDateField;
    qHistoricoFiltro_UnionITE_COD: TIntegerField;
    qHistoricoFiltro_UnionITE_DESC: TStringField;
    qHistoricoFiltro_UnionHIS_DOC: TStringField;
    qHistoricoFiltro_UnionHIS_OBS: TStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    DateEditInicial: TJvDateEdit;
    DateEditFinal: TJvDateEdit;
    DateInicio: TJvDateEdit;
    DateFim: TJvDateEdit;
    qFiltroCPG_UnionCOUNT: TIntegerField;
    qFiltroCPG_UnionPRO_COD: TIntegerField;
    qFiltroCPG_UnionPRO_NPERC: TStringField;
    qFiltroCPG_UnionLCO_NOME: TStringField;
    qFiltroCPG_UnionUF_SIGLA: TStringField;
    qFiltroCPG_UnionDESCRICAOCASO: TStringField;
    qFiltroCPG_UnionPRO_TIPO: TIntegerField;
    qFiltroCPG_UnionPRO_AUTO: TStringField;
    qFiltroCPG_UnionCOMARCA: TStringField;
    qFiltroCPG_UnionDATAITEM: TDateField;
    qFiltroCPG_UnionDESCRICAOITEM: TStringField;
    qFiltroCPG_UnionDOCUMENTOITEM: TStringField;
    qFiltroCPG_UnionOBSERVACAOITEM: TStringField;
    procedure sbConsultarClick(Sender: TObject);
    procedure RxDBLookupComboEstadoChange(Sender: TObject);
    procedure EditEstadoExit(Sender: TObject);
    procedure RxDBLookupComboComarcaChange(Sender: TObject);
    procedure RxDBLookupComboVaraChange(Sender: TObject);
    procedure RxDBLookupComboColetaChange(Sender: TObject);
    procedure EditComarcaExit(Sender: TObject);
    procedure EditVaraExit(Sender: TObject);
    procedure EditLocalExit(Sender: TObject);
    procedure EditTipoCasoExit(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBGridCPGDblClick(Sender: TObject);
    procedure qPessoasFiltroPES_SITGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure EditMaeKeyPress(Sender: TObject; var Key: Char);
    procedure EditCriancaKeyPress(Sender: TObject; var Key: Char);
    procedure EditSupaiKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);
    procedure EdtUnionKeyPress(Sender: TObject; var Key: Char);
    procedure qPessoasFiltro_UnionPES_SITGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure DBLookupComboBox1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsultaCPG: TfConsultaCPG;
  LocalConsulta : String;

implementation

uses ufRelConsulta, ufItemHistorico, ufDM, ufProcesso, ufDMR;

{$R *.dfm}

procedure TfConsultaCPG.sbConsultarClick(Sender: TObject);
var Contador : Integer;
begin
if CheckBox1.Checked = True
then begin
       LocalConsulta := 'Union';

       fConsultaCPG.Caption := 'Consulta de Perícias:        Pesquisa sendo realizada. Aguarde.....';

       qContadorPericias.Close;
       qContadorPericias.Open;

       StatusBar1.Panels[3].Text := IntToStr(qContadorPericiasCOUNT.Value);

       qFiltroCPG_Union.Close;
       qFiltroCPG_Union.Parameters.ParamByName('NOME').Value := '%' + EdtUnion.Text + '%';
{       qFiltroCPG_Union.Parameters.ParamByName('PARAMETRO1').Value := '%' + EdtUnion.Text + '%';
       qFiltroCPG_Union.Parameters.ParamByName('PARAMETRO2').Value := '%' + EdtUnion.Text + '%';
       qFiltroCPG_Union.Parameters.ParamByName('PARAMETRO3').Value := '%' + EdtUnion.Text + '%';
       qFiltroCPG_Union.Parameters.ParamByName('PARAMETRO4').Value := '%' + EdtUnion.Text + '%';
       qFiltroCPG_Union.Parameters.ParamByName('PARAMETRO5').Value := '%' + EdtUnion.Text + '%';
       qFiltroCPG_Union.Parameters.ParamByName('PARAMETRO6').Value := '%' + EdtUnion.Text + '%';
       qFiltroCPG_Union.Parameters.ParamByName('PARAMETRO7').Value := '%' + EdtUnion.Text + '%';
       qFiltroCPG_Union.Parameters.ParamByName('PARAMETRO8').Value := '%' + EdtUnion.Text + '%';
                                                                                                  }
       qFiltroCPG_Union.Open;
       StatusBar1.Panels[1].Text := IntToStr(qFiltroCPG_Union.RecordCount);
       qHistoricoFiltro_Union.Open;
       qPessoasFiltro_Union.Open;

       DBGridCPG.DataSource       := DS_FiltroCPG_Union;
       DBGridPessoas.DataSource   := DS_PessoaFiltro_Union;
       DBGridHistorico.DataSource := DS_HistoricoFiltro_Union;

       if qFiltroCPG_Union.RecordCount>0
       then begin
             fConsultaCPG.Caption := 'Consulta de Perícias';
             StatusBar1.Panels[4].Text := 'Dados encontrados. Listados do lado direto superior da Tela!!!';
            end else begin
                      fConsultaCPG.Caption := 'Consulta de Perícias';
                      StatusBar1.Panels[4].Text := 'Não há Perícias com esses parâmetros!';
                     end;
     end;
if CheckBox1.Checked = False
then begin
                LocalConsulta := 'Geral';
                fConsultaCPG.Caption := 'Consulta de Perícias:        Pesquisa sendo realizada. Aguarde.....';

                qContadorPericias.Close;
                qContadorPericias.Open;

                StatusBar1.Panels[3].Text := IntToStr(qContadorPericiasCOUNT.Value);

                Contador := 0;

                qFiltroCPG.Close;
                qFiltroCPG.SQL.Clear;
                qFiltroCPG.SQL.Add('select distinct COUNT(p.pro_cod), p.pro_cod, p.pro_nperc, c.lco_nome, p.uf_sigla, pr.cas_desc AS DESCRICAOCASO, p.pro_tipo, p.pro_auto, cm.com_desc AS COMARCA, h.his_data AS DATAITEM, i.ite_desc AS DESCRICAOITEM,  ');
                qFiltroCPG.SQL.Add(' h.his_doc AS DOCUMENTOITEM, h.his_obs AS OBSERVACAOITEM ');
                qFiltroCPG.SQL.Add('from tb_PROCESSO p left outer join tb_LCOLETA c ON (p.lco_cod = c.lco_cod) ');
//Novo
                qFiltroCPG.SQL.Add('left outer JOIN tb_VARAS v  ON (v.uf_sigla = p.uf_sigla) and (v.com_cod = p.com_cod) and (v.var_cod = p.var_cod) ');
                qFiltroCPG.SQL.Add('left outer join tb_parcelas pa on p.pro_cod = pa.pro_cod ');

                qFiltroCPG.SQL.Add('JOIN tb_COMARCA cm ON (cm.uf_sigla = p.uf_sigla) and (cm.com_cod = p.com_cod) ');
                qFiltroCPG.SQL.Add('left outer join tb_CASOS pr ON (p.cas_codigo = pr.cas_codigo) ');
                qFiltroCPG.SQL.Add('JOIN tb_HISTORICO h ON (p.pro_cod = h.pro_cod) ');
                qFiltroCPG.SQL.Add('JOIN tb_ITEM i ON (h.ite_cod = i.ite_cod) JOIN TB_PESSOAS ps ON (p.pro_cod = ps. pro_cod) ');

{               qFiltroCPG.SQL.Add('select distinct COUNT(p.pro_cod), p.pro_cod, p.pro_nperc, c.lco_nome, p.uf_sigla, pr.cas_desc AS DESCRICAOCASO, p.pro_tipo, p.pro_auto, v.var_desc AS VARA, cm.com_desc AS COMARCA, h.his_data AS DATAITEM, i.ite_desc AS DESCRICAOITEM,  ');
                qFiltroCPG.SQL.Add(' h.his_doc AS DOCUMENTOITEM, h.his_obs AS OBSERVACAOITEM ');
                qFiltroCPG.SQL.Add('from tb_PROCESSO p JOIN tb_LCOLETA c ON (p.lco_cod = c.lco_cod) ');
                qFiltroCPG.SQL.Add('left outer JOIN tb_VARAS v  ON (v.uf_sigla = p.uf_sigla) and (v.com_cod = p.com_cod) and (v.var_cod = p.var_cod) ');
                qFiltroCPG.SQL.Add('left outer JOIN tb_COMARCA cm ON (cm.uf_sigla = p.uf_sigla) and (cm.com_cod = p.com_cod) ');
                qFiltroCPG.SQL.Add('JOIN tb_CASOS pr ON (p.cas_codigo = pr.cas_codigo) ');
                qFiltroCPG.SQL.Add('JOIN tb_HISTORICO h ON (p.pro_cod = h.pro_cod) ');
                qFiltroCPG.SQL.Add('JOIN tb_ITEM i ON (h.ite_cod = i.ite_cod) JOIN TB_PESSOAS ps ON (p.pro_cod = ps. pro_cod) ');
}
                qFiltroCPG.SQL.Add(' and ');

                with qFiltroCPG do
                begin
                if EditAno.Text <> ''
                then begin
                      Contador := Contador + 1;
                      qFiltroCPG.SQL.Add(' p.PRO_ANO = :ANO ');
                      qFiltroCPG.Parameters.ParamByName('ANO').Value := EditAno.Text;
                     end;

                if EditEstado.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            qFiltroCPG.SQL.Add(' AND ');
                            end;
                     qFiltroCPG.SQL.Add(' p.UF_SIGLA = :ESTADO ');
                     qFiltroCPG.Parameters.ParamByName('ESTADO').Value := EditEstado.Text;
                     Contador := Contador + 1;
                end;

                if EditTipoCaso.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            qFiltroCPG.SQL.Add(' AND ');
                           end;
                     qFiltroCPG.SQL.Add(' p.CAS_CODIGO = :TIPOCASO ');
                     qFiltroCPG.Parameters.ParamByName('TIPOCASO').Value := EditTipoCaso.Text;
                     Contador := Contador + 1;
                end;

                if EditMae.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            qFiltroCPG.SQL.Add(' AND ');
                           end;
                     qFiltroCPG.SQL.Add(' ps.PES_NOME LIKE :MAE and ps.PES_SIT = 1 ');
                     qFiltroCPG.Parameters.ParamByName('MAE').Value := '%' + EditMae.Text + '%';
                     Contador := Contador + 1;
                end;

                if EditCrianca.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            qFiltroCPG.SQL.Add(' AND ');
                           end;
                     qFiltroCPG.SQL.Add(' ps.PES_NOME LIKE :CRIANCA and ps.PES_SIT = 2 ');
                     qFiltroCPG.Parameters.ParamByName('CRIANCA').Value := '%' + EditCrianca.Text + '%';
                     Contador := Contador + 1;
                end;

                if EditSupai.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            qFiltroCPG.SQL.Add(' AND ');
                           end;
                     qFiltroCPG.SQL.Add(' ps.PES_NOME LIKE :SUPAI and ps.PES_SIT = 0 ');
                     qFiltroCPG.Parameters.ParamByName('SUPAI').Value := '%' + EditSupai.Text + '%';
                     Contador := Contador + 1;
                end;


                if RxDBComboBoxTipo.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            qFiltroCPG.SQL.Add(' AND ');
                           end;
                      if RxDBComboBoxTipo.Text = 'Judicial'
                      then begin
                            qFiltroCPG.SQL.Add(' p.PRO_TIPO = :TIPO ');
                            qFiltroCPG.Parameters.ParamByName('TIPO').Value := 1;
                            Contador := Contador + 1;
                           end else begin
                                     if RxDBComboBoxTipo.Text = 'ExtraJudicial'
                                     then begin
                                           qFiltroCPG.SQL.Add(' p.PRO_TIPO = :TIPO ');
                                           qFiltroCPG.Parameters.ParamByName('TIPO').Value := 2;
                                           Contador := Contador + 1;
                                          end else begin
                                                     if RxDBComboBoxTipo.Text = 'Ministério Público'
                                                     then begin
                                                           qFiltroCPG.SQL.Add(' p.PRO_TIPO = :TIPO ');
                                                           qFiltroCPG.Parameters.ParamByName('TIPO').Value := 2;
                                                           Contador := Contador + 1;
                                                          end else begin
                                                                    if RxDBComboBoxTipo.Text = 'Defensoria Pública'
                                                                    then begin
                                                                          qFiltroCPG.SQL.Add(' p.PRO_TIPO = :TIPO ');
                                                                          qFiltroCPG.Parameters.ParamByName('TIPO').Value := 4;
                                                                          Contador := Contador + 1;
                                                                         end else begin
                                                                                    if RxDBComboBoxTipo.Text = 'Delegacia de Polícia'
                                                                                    then begin
                                                                                          qFiltroCPG.SQL.Add(' p.PRO_TIPO = :TIPO ');
                                                                                          qFiltroCPG.Parameters.ParamByName('TIPO').Value := 5;
                                                                                          Contador := Contador + 1;
                                                                                         end else begin
                                                                                                    if RxDBComboBoxTipo.Text = 'Justiça Comunitária'
                                                                                                    then begin
                                                                                                          qFiltroCPG.SQL.Add(' p.PRO_TIPO = :TIPO ');
                                                                                                          qFiltroCPG.Parameters.ParamByName('TIPO').Value := 6;
                                                                                                          Contador := Contador + 1;
                                                                                                         end else begin
                                                                                                                    if RxDBComboBoxTipo.Text = 'Conselho Tutelar'
                                                                                                                    then begin
                                                                                                                          qFiltroCPG.SQL.Add(' p.PRO_TIPO = :TIPO ');
                                                                                                                          qFiltroCPG.Parameters.ParamByName('TIPO').Value := 7;
                                                                                                                          Contador := Contador + 1;
                                                                                                                         end else begin
                                                                                                                                    if RxDBComboBoxTipo.Text = 'Promotoria de Justiça'
                                                                                                                                    then begin
                                                                                                                                          qFiltroCPG.SQL.Add(' p.PRO_TIPO = :TIPO ');
                                                                                                                                          qFiltroCPG.Parameters.ParamByName('TIPO').Value := 8;
                                                                                                                                          Contador := Contador + 1;
                                                                                                                                         end else begin
                                                                                                                                                    if RxDBComboBoxTipo.Text = 'Paternidade Responsável'
                                                                                                                                                    then begin
                                                                                                                                                          qFiltroCPG.SQL.Add(' p.PRO_TIPO = :TIPO ');
                                                                                                                                                          qFiltroCPG.Parameters.ParamByName('TIPO').Value := 9;
                                                                                                                                                          Contador := Contador + 1;
                                                                                                                                                         end else begin
                                                                                                                                                                    if RxDBComboBoxTipo.Text = 'Núcleo de Prática Forense'
                                                                                                                                                                    then begin
                                                                                                                                                                          qFiltroCPG.SQL.Add(' p.PRO_TIPO = :TIPO ');
                                                                                                                                                                          qFiltroCPG.Parameters.ParamByName('TIPO').Value := 10;
                                                                                                                                                                          Contador := Contador + 1;
                                                                                                                                                                         end;
                                                                                                                                                                  end;
                                                                                                                                                  end;

                                                                                                                                  end;

                                                                                                                  end;

                                                                                                   end;

                                                                                  end;
                                                                   end;

                                                   end;

                                    end;
                end;

                if EditAutos.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            qFiltroCPG.SQL.Add(' AND ');
                           end;
                     qFiltroCPG.SQL.Add(' p.PRO_AUTO LIKE :AUTOS ');
                     qFiltroCPG.Parameters.ParamByName('AUTOS').Value := '%' + EditAutos.Text + '%';
                     Contador := Contador + 1;
                end;

                if EditComarca.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            qFiltroCPG.SQL.Add(' AND ');
                           end;
                     qFiltroCPG.SQL.Add(' p.COM_COD = :COMARCA ');
                     qFiltroCPG.Parameters.ParamByName('COMARCA').Value := EditComarca.Text;
                     Contador := Contador + 1;
                end;

//Novo
                if EditVara.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            qFiltroCPG.SQL.Add(' AND ');
                           end;
                     qFiltroCPG.SQL.Add(' p.VAR_COD = :VARAS ');
                     qFiltroCPG.Parameters.ParamByName('VARAS').Value := EditVara.Text;
                     Contador := Contador + 1;
                end;

                if EditLocal.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                           qFiltroCPG.SQL.Add(' AND ');
                          end;
                     qFiltroCPG.SQL.Add(' p.LCO_COD = :LOCAL ');
                     qFiltroCPG.Parameters.ParamByName('LOCAL').Value := EditLocal.Text;
                     Contador := Contador + 1;
                end;

                if DateEditInicial.Date <> 0
                then begin
                      if Contador >=1 then
                      begin
                       qFiltroCPG.SQL.Add(' AND ');
                      end;
                      if DateEditFinal.Date <> 0
                      then begin
                            qFiltroCPG.SQL.Add('p.PRO_DCOLE >= :DATAINI AND p.PRO_DCOLE <= :DATAFIN');
                            qFiltroCPG.Parameters.ParamByName('DATAINI').Value := DateEditInicial.Date;
                            qFiltroCPG.Parameters.ParamByName('DATAFIN').Value := DateEditFinal.Date;
                            Contador := Contador + 1;
                           end else begin
                                     qFiltroCPG.SQL.Add('p.PRO_DCOLE >= :DATAINI ');
                                     qFiltroCPG.Parameters.ParamByName('DATAINI').Value := DateEditInicial.Date;
                                     Contador := Contador + 1;
                                    end;
                     end;

                if DateInicio.Date <> 0
                then begin
                      if Contador >=1
                      then begin
                            qFiltroCPG.SQL.Add(' AND ');
                           end;
                           if DateFim.Date <> 0
                           then begin
                                 qFiltroCPG.SQL.Add('p.PRO_DREC >= :DATAINICIO AND p.PRO_DREC <= :DATAFINAL');
                                 qFiltroCPG.Parameters.ParamByName('DATAINICIO').Value := DateInicio.Date;
                                 qFiltroCPG.Parameters.ParamByName('DATAFINAL').Value := DateFim.Date;
                                 Contador := Contador + 1;
                                end else begin
                                          qFiltroCPG.SQL.Add('p.PRO_DREC >= :DATAINICIO ');
                                          qFiltroCPG.Parameters.ParamByName('DATAINICIO').Value := DateInicio.Date;
                                          Contador := Contador + 1;
                                         end;
                    end;

                if RxDBComboBoxSituacao.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            qFiltroCPG.SQL.Add(' AND ');
                           end;
                           if RxDBComboBoxSituacao.Text = 'Realizada'
                           then begin
                                 qFiltroCPG.SQL.Add(' p.PRO_SIT = :SITUACAO ');
                                 qFiltroCPG.Parameters.ParamByName('SITUACAO').Value := 1;
                                 Contador := Contador + 1;
                                end else begin
                                          qFiltroCPG.SQL.Add(' p.PRO_SIT = :SITUACAO ');
                                          qFiltroCPG.Parameters.ParamByName('SITUACAO').Value := 2;
                                          Contador := Contador + 1;
                                         end;
                end;

                if RxDBComboBoxResultado.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            qFiltroCPG.SQL.Add(' AND ');
                           end;

                           if RxDBComboBoxResultado.Text = 'Positivo'
                           then begin
                                 qFiltroCPG.SQL.Add(' p.PRO_RESUL = :RESULTADO ');
                                 qFiltroCPG.Parameters.ParamByName('RESULTADO').Value := 1;
                                 Contador := Contador + 1;
                                end;

                           if RxDBComboBoxResultado.Text = 'Negativo'
                           then begin
                                 qFiltroCPG.SQL.Add(' p.PRO_RESUL = :RESULTADO ');
                                 qFiltroCPG.Parameters.ParamByName('RESULTADO').Value := 2;
                                 Contador := Contador + 1;
                                end;

                           if RxDBComboBoxResultado.Text = 'Cancelado'
                           then begin
                                 qFiltroCPG.SQL.Add(' p.PRO_RESUL = :RESULTADO ');
                                 qFiltroCPG.Parameters.ParamByName('RESULTADO').Value := 3;
                                 Contador := Contador + 1;
                                end;

                           if RxDBComboBoxResultado.Text = 'Andamento'
                           then begin
                                 qFiltroCPG.SQL.Add(' p.PRO_RESUL = :RESULTADO ');
                                 qFiltroCPG.Parameters.ParamByName('RESULTADO').Value := 4;
                                 Contador := Contador + 1;
                                end;
                end;


                if RxDBComboBoxPagamento.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            qFiltroCPG.SQL.Add(' AND ');
                            qFiltroCPG.SQL.Add(' pa.par_tppg = :PAGAMENTO ');
                            qFiltroCPG.Parameters.ParamByName('PAGAMENTO').Value := RxDBComboBoxPagamento.Text;
                            Contador := Contador + 1;
                           end;
                end;

                end;

                qFiltroCPG.SQL.Add(' group by p.PRO_DCOLE, p.pro_cod, p.pro_nperc, c.lco_nome, p.uf_sigla, pr.cas_desc, p.pro_tipo, p.pro_auto, cm.com_desc, h.his_data, i.ite_desc, h.his_doc, h.his_obs');
                qFiltroCPG.SQL.Add(' order by p.PRO_DCOLE ');

                //Começa contador da Tela
                Contador := 0;

                DMR.qFiltroCPGTela.Close;
                DMR.qFiltroCPGTela.SQL.Clear;

                DMR.qFiltroCPGTela.SQL.Add('select distinct COUNT(p.pro_cod), p.pro_tipo, p.pro_cod, p.pro_nperc, c.lco_nome, p.uf_sigla, pr.cas_desc AS DESCRICAOCASO, p.pro_auto, cm.com_desc AS COMARCA ');
                DMR.qFiltroCPGTela.SQL.Add('from tb_PROCESSO p left outer JOIN tb_LCOLETA c ON (p.lco_cod = c.lco_cod) ');
//Novo
                DMR.qFiltroCPGTela.SQL.Add('left outer JOIN tb_VARAS v  ON (v.uf_sigla = p.uf_sigla) and (v.com_cod = p.com_cod) and (v.var_cod = p.var_cod) ');
                DMR.qFiltroCPGTela.SQL.Add('left outer join tb_parcelas pa on p.pro_cod = pa.pro_cod ');

                DMR.qFiltroCPGTela.SQL.Add('JOIN tb_COMARCA cm ON (cm.uf_sigla = p.uf_sigla) and (cm.com_cod = p.com_cod) ');
                DMR.qFiltroCPGTela.SQL.Add('left outer join tb_CASOS pr ON (p.cas_codigo = pr.cas_codigo) JOIN TB_PESSOAS ps ON (p.pro_cod = ps.pro_cod) ');


                DMR.qFiltroCPGTela.SQL.Add(' and ');

                with DMR.qFiltroCPGTela do
                begin
                if EditAno.Text <> ''
                then begin
                      Contador := Contador + 1;
                      DMR.qFiltroCPGTela.SQL.Add(' p.PRO_ANO = :ANO ');
                      DMR.qFiltroCPGTela.Parameters.ParamByName('ANO').Value := EditAno.Text;
                     end;

                if EditEstado.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            DMR.qFiltroCPGTela.SQL.Add(' AND ');
                            end;
                     DMR.qFiltroCPGTela.SQL.Add(' p.UF_SIGLA = :ESTADO ');
                     DMR.qFiltroCPGTela.Parameters.ParamByName('ESTADO').Value := EditEstado.Text;
                     Contador := Contador + 1;
                end;

                if EditTipoCaso.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            DMR.qFiltroCPGTela.SQL.Add(' AND ');
                           end;
                     DMR.qFiltroCPGTela.SQL.Add(' p.CAS_CODIGO = :TIPOCASO ');
                     DMR.qFiltroCPGTela.Parameters.ParamByName('TIPOCASO').Value := EditTipoCaso.Text;
                     Contador := Contador + 1;
                end;

                if EditMae.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            DMR.qFiltroCPGTela.SQL.Add(' AND ');
                           end;
                     DMR.qFiltroCPGTela.SQL.Add(' ps.PES_NOME LIKE :MAE and ps.PES_SIT = 1 ');
                     DMR.qFiltroCPGTela.Parameters.ParamByName('MAE').Value := '%' + EditMae.Text + '%';
                     Contador := Contador + 1;
                end;

                if EditCrianca.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            DMR.qFiltroCPGTela.SQL.Add(' AND ');
                           end;
                     DMR.qFiltroCPGTela.SQL.Add(' ps.PES_NOME LIKE :CRIANCA and ps.PES_SIT = 2 ');
                     DMR.qFiltroCPGTela.Parameters.ParamByName('CRIANCA').Value := '%' + EditCrianca.Text + '%';
                     Contador := Contador + 1;
                end;

                if EditSupai.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            DMR.qFiltroCPGTela.SQL.Add(' AND ');
                           end;
                     DMR.qFiltroCPGTela.SQL.Add(' ps.PES_NOME LIKE :SUPAI and ps.PES_SIT = 0 ');
                     DMR.qFiltroCPGTela.Parameters.ParamByName('SUPAI').Value := '%' + EditSupai.Text + '%';
                     Contador := Contador + 1;
                end;

                if RxDBComboBoxTipo.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            DMR.qFiltroCPGTela.SQL.Add(' AND ');
                           end;
                      if RxDBComboBoxTipo.Text = 'Judicial'
                      then begin
                            DMR.qFiltroCPGTela.SQL.Add(' p.PRO_TIPO = :TIPO ');
                            DMR.qFiltroCPGTela.Parameters.ParamByName('TIPO').Value := 1;
                            Contador := Contador + 1;
                           end else begin
                                     if RxDBComboBoxTipo.Text = 'ExtraJudicial'
                                     then begin
                                           DMR.qFiltroCPGTela.SQL.Add(' p.PRO_TIPO = :TIPO ');
                                           DMR.qFiltroCPGTela.Parameters.ParamByName('TIPO').Value := 2;
                                           Contador := Contador + 1;
                                          end else begin
                                                     if RxDBComboBoxTipo.Text = 'Ministério Público'
                                                     then begin
                                                           DMR.qFiltroCPGTela.SQL.Add(' p.PRO_TIPO = :TIPO ');
                                                           DMR.qFiltroCPGTela.Parameters.ParamByName('TIPO').Value := 2;
                                                           Contador := Contador + 1;
                                                          end else begin
                                                                    if RxDBComboBoxTipo.Text = 'Defensoria Pública'
                                                                    then begin
                                                                          DMR.qFiltroCPGTela.SQL.Add(' p.PRO_TIPO = :TIPO ');
                                                                          DMR.qFiltroCPGTela.Parameters.ParamByName('TIPO').Value := 4;
                                                                          Contador := Contador + 1;
                                                                         end else begin
                                                                                    if RxDBComboBoxTipo.Text = 'Delegacia de Polícia'
                                                                                    then begin
                                                                                          DMR.qFiltroCPGTela.SQL.Add(' p.PRO_TIPO = :TIPO ');
                                                                                          DMR.qFiltroCPGTela.Parameters.ParamByName('TIPO').Value := 5;
                                                                                          Contador := Contador + 1;
                                                                                         end else begin
                                                                                                    if RxDBComboBoxTipo.Text = 'Justiça Comunitária'
                                                                                                    then begin
                                                                                                          DMR.qFiltroCPGTela.SQL.Add(' p.PRO_TIPO = :TIPO ');
                                                                                                          DMR.qFiltroCPGTela.Parameters.ParamByName('TIPO').Value := 6;
                                                                                                          Contador := Contador + 1;
                                                                                                         end else begin
                                                                                                                    if RxDBComboBoxTipo.Text = 'Conselho Tutelar'
                                                                                                                    then begin
                                                                                                                          DMR.qFiltroCPGTela.SQL.Add(' p.PRO_TIPO = :TIPO ');
                                                                                                                          DMR.qFiltroCPGTela.Parameters.ParamByName('TIPO').Value := 7;
                                                                                                                          Contador := Contador + 1;
                                                                                                                         end else begin
                                                                                                                                    if RxDBComboBoxTipo.Text = 'Promotoria de Justiça'
                                                                                                                                    then begin
                                                                                                                                          DMR.qFiltroCPGTela.SQL.Add(' p.PRO_TIPO = :TIPO ');
                                                                                                                                          DMR.qFiltroCPGTela.Parameters.ParamByName('TIPO').Value := 8;
                                                                                                                                          Contador := Contador + 1;
                                                                                                                                         end else begin
                                                                                                                                                    if RxDBComboBoxTipo.Text = 'Paternidade Responsável'
                                                                                                                                                    then begin
                                                                                                                                                          DMR.qFiltroCPGTela.SQL.Add(' p.PRO_TIPO = :TIPO ');
                                                                                                                                                          DMR.qFiltroCPGTela.Parameters.ParamByName('TIPO').Value := 9;
                                                                                                                                                          Contador := Contador + 1;
                                                                                                                                                         end else begin
                                                                                                                                                                    if RxDBComboBoxTipo.Text = 'Núcleo de Prática Forense'
                                                                                                                                                                    then begin
                                                                                                                                                                          DMR.qFiltroCPGTela.SQL.Add(' p.PRO_TIPO = :TIPO ');
                                                                                                                                                                          DMR.qFiltroCPGTela.Parameters.ParamByName('TIPO').Value := 10;
                                                                                                                                                                          Contador := Contador + 1;
                                                                                                                                                                         end;
                                                                                                                                                                  end;
                                                                                                                                                  end;

                                                                                                                                  end;

                                                                                                                  end;

                                                                                                   end;

                                                                                  end;
                                                                   end;

                                                   end;

                                    end;
                end;

                if EditAutos.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            DMR.qFiltroCPGTela.SQL.Add(' AND ');
                           end;
                     DMR.qFiltroCPGTela.SQL.Add(' p.PRO_AUTO LIKE :AUTOS ');
                     DMR.qFiltroCPGTela.Parameters.ParamByName('AUTOS').Value := '%' + EditAutos.Text + '%';
                     Contador := Contador + 1;
                end;

                if EditComarca.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            DMR.qFiltroCPGTela.SQL.Add(' AND ');
                           end;
                     DMR.qFiltroCPGTela.SQL.Add(' p.COM_COD = :COMARCA ');
                     DMR.qFiltroCPGTela.Parameters.ParamByName('COMARCA').Value := EditComarca.Text;
                     Contador := Contador + 1;
                end;

//Novo
               if EditVara.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                           DMR.qFiltroCPGTela.SQL.Add(' AND ');
                           end;
                     DMR.qFiltroCPGTela.SQL.Add(' p.VAR_COD = :VARAS ');
                     DMR.qFiltroCPGTela.Parameters.ParamByName('VARAS').Value := EditVara.Text;
                     Contador := Contador + 1;
                end;

                if EditLocal.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                           DMR.qFiltroCPGTela.SQL.Add(' AND ');
                          end;
                     DMR.qFiltroCPGTela.SQL.Add(' p.LCO_COD = :LOCAL ');
                     DMR.qFiltroCPGTela.Parameters.ParamByName('LOCAL').Value := EditLocal.Text;
                     Contador := Contador + 1;
                end;

                if DateEditInicial.Date <> 0
                then begin
                      if Contador >=1 then
                      begin
                       DMR.qFiltroCPGTela.SQL.Add(' AND ');
                      end;
                      if DateEditFinal.Date <> 0
                      then begin
                            DMR.qFiltroCPGTela.SQL.Add('p.PRO_DCOLE >= :DATAINI AND p.PRO_DCOLE <= :DATAFIN');
                            DMR.qFiltroCPGTela.Parameters.ParamByName('DATAINI').Value := DateEditInicial.Date;
                            DMR.qFiltroCPGTela.Parameters.ParamByName('DATAFIN').Value := DateEditFinal.Date;
                            Contador := Contador + 1;
                           end else begin
                                     DMR.qFiltroCPGTela.SQL.Add('p.PRO_DCOLE >= :DATAINI ');
                                     DMR.qFiltroCPGTela.Parameters.ParamByName('DATAINI').Value := DateEditInicial.Date;
                                     Contador := Contador + 1;
                                    end;
                     end;

                if DateInicio.Date <> 0
                then begin
                      if Contador >=1
                      then begin
                            DMR.qFiltroCPGTela.SQL.Add(' AND ');
                           end;
                           if DateFim.Date <> 0
                           then begin
                                 DMR.qFiltroCPGTela.SQL.Add('p.PRO_DREC >= :DATAINICIO AND p.PRO_DREC <= :DATAFINAL');
                                 DMR.qFiltroCPGTela.Parameters.ParamByName('DATAINICIO').Value := DateInicio.Date;
                                 DMR.qFiltroCPGTela.Parameters.ParamByName('DATAFINAL').Value := DateFim.Date;
                                 Contador := Contador + 1;
                                end else begin
                                          DMR.qFiltroCPGTela.SQL.Add('p.PRO_DREC >= :DATAINICIO ');
                                          DMR.qFiltroCPGTela.Parameters.ParamByName('DATAINICIO').Value := DateInicio.Date;
                                          Contador := Contador + 1;
                                         end;
                    end;

                if RxDBComboBoxSituacao.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            DMR.qFiltroCPGTela.SQL.Add(' AND ');
                           end;
                           if RxDBComboBoxSituacao.Text = 'Realizada'
                           then begin
                                 DMR.qFiltroCPGTela.SQL.Add(' p.PRO_SIT = :SITUACAO ');
                                 DMR.qFiltroCPGTela.Parameters.ParamByName('SITUACAO').Value := 1;
                                 Contador := Contador + 1;
                                end else begin
                                          DMR.qFiltroCPGTela.SQL.Add(' p.PRO_SIT = :SITUACAO ');
                                          DMR.qFiltroCPGTela.Parameters.ParamByName('SITUACAO').Value := 2;
                                          Contador := Contador + 1;
                                         end;
                end;

                if RxDBComboBoxResultado.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            DMR.qFiltroCPGTela.SQL.Add(' AND ');
                           end;

                           if RxDBComboBoxResultado.Text = 'Positivo'
                           then begin
                                 DMR.qFiltroCPGTela.SQL.Add(' p.PRO_RESUL = :RESULTADO ');
                                 DMR.qFiltroCPGTela.Parameters.ParamByName('RESULTADO').Value := 1;
                                 Contador := Contador + 1;
                                end;

                           if RxDBComboBoxResultado.Text = 'Negativo'
                           then begin
                                 DMR.qFiltroCPGTela.SQL.Add(' p.PRO_RESUL = :RESULTADO ');
                                 DMR.qFiltroCPGTela.Parameters.ParamByName('RESULTADO').Value := 2;
                                 Contador := Contador + 1;
                                end;

                           if RxDBComboBoxResultado.Text = 'Cancelado'
                           then begin
                                 DMR.qFiltroCPGTela.SQL.Add(' p.PRO_RESUL = :RESULTADO ');
                                 DMR.qFiltroCPGTela.Parameters.ParamByName('RESULTADO').Value := 3;
                                 Contador := Contador + 1;
                                end;

                           if RxDBComboBoxResultado.Text = 'Andamento'
                           then begin
                                 DMR.qFiltroCPGTela.SQL.Add(' p.PRO_RESUL = :RESULTADO ');
                                 DMR.qFiltroCPGTela.Parameters.ParamByName('RESULTADO').Value := 4;
                                 Contador := Contador + 1;
                                end;
                end;


                if RxDBComboBoxPagamento.Text <> ''
                then begin
                      if Contador >=1
                      then begin
                            DMR.qFiltroCPGTela.SQL.Add(' AND ');
                            DMR.qFiltroCPGTela.SQL.Add(' pa.par_tppg = :PAGAMENTO ');
                            DMR.qFiltroCPGTela.Parameters.ParamByName('PAGAMENTO').Value := RxDBComboBoxPagamento.Text;
                           end;

                 end;

                end;

                DMR.qFiltroCPGTela.SQL.Add(' group by p.PRO_DCOLE, p.pro_cod, p.pro_nperc, c.lco_nome, p.uf_sigla, pr.cas_desc, p.pro_tipo, p.pro_auto, cm.com_desc ');
                DMR.qFiltroCPGTela.SQL.Add(' order by p.PRO_DCOLE ');

                //Memo1.Lines.Add(DMR.qFiltroCPGTela.SQL.Text);
                DMR.qFiltroCPGTela.Open;
                qFiltroCPG.Open;

                StatusBar1.Panels[1].Text := IntToStr(DMR.qFiltroCPGTela.RecordCount);
                qHistoricoFiltro.Open;
                qPessoasFiltro.Open;

                DBGridCPG.DataSource       := DMR.DS_FiltroCPGTela;
                DBGridPessoas.DataSource   := DS_PessoaFiltro;
                DBGridHistorico.DataSource := DS_HistoricoFiltro;

                if qFiltroCPG.RecordCount>0
                then begin
                      fConsultaCPG.Caption := 'Consulta de Perícias';
                      StatusBar1.Panels[4].Text := 'Dados encontrados. Listados do lado direto superior da Tela!!!';
                     end else begin
                               fConsultaCPG.Caption := 'Consulta de Perícias';
                               StatusBar1.Panels[4].Text := 'Não há Perícias com esses parâmetros!';
                              end;
           end; //fim do else da condição
end;

procedure TfConsultaCPG.RxDBLookupComboEstadoChange(Sender: TObject);
begin
EditEstado.Text := RxDBLookupComboEstado.KeyValue;
end;

procedure TfConsultaCPG.EditEstadoExit(Sender: TObject);
begin
RxDBLookupComboEstado.KeyValue := EditEstado.Text;
end;

procedure TfConsultaCPG.RxDBLookupComboComarcaChange(Sender: TObject);
begin
EditComarca.Text := RxDBLookupComboComarca.KeyValue;
end;

procedure TfConsultaCPG.RxDBLookupComboVaraChange(Sender: TObject);
begin
EditVara.Text := RxDBLookupComboVara.KeyValue;
end;

procedure TfConsultaCPG.RxDBLookupComboColetaChange(Sender: TObject);
begin
EditLocal.Text := RxDBLookupComboColeta.KeyValue;
end;

procedure TfConsultaCPG.EditComarcaExit(Sender: TObject);
begin
RxDBLookupComboComarca.KeyValue := EditComarca.Text;
end;

procedure TfConsultaCPG.EditVaraExit(Sender: TObject);
begin
RxDBLookupComboVara.KeyValue := EditVara.Text;
end;

procedure TfConsultaCPG.EditLocalExit(Sender: TObject);
begin
RxDBLookupComboColeta.KeyValue := EditLocal.Text;
end;

procedure TfConsultaCPG.EditTipoCasoExit(Sender: TObject);
begin
DBLookupComboBox1.KeyValue := EditTipoCaso.Text;
end;

procedure TfConsultaCPG.sbFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfConsultaCPG.sbImprimirClick(Sender: TObject);
begin
  Application.CreateForm(TfRelConsulta,fRelConsulta);
  fRelConsulta.QuickRep1.Preview;
  fRelConsulta.Free;
end;

procedure TfConsultaCPG.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.qItem.Close;
end;

procedure TfConsultaCPG.FormShow(Sender: TObject);
begin
 qSelEstado.Open;
 qSelColeta.Open;
 qSelCaso.Open;
 qSelComarca.Open;
 qSelVaras.Open;
 DM.qItem.Open;
 EditMae.SetFocus;
end;

procedure TfConsultaCPG.DBGridCPGDblClick(Sender: TObject);
begin
if LocalConsulta = 'Union'
then begin
      if fProcessos.qProcessoCPG.Locate('PRO_COD', qFiltroCPG_UnionPRO_COD.Value, []) = True
      then begin
            Close;
           end;
     end;
if LocalConsulta = 'Geral'
then begin
      if fProcessos.qProcessoCPG.Locate('PRO_COD', DMR.qFiltroCPGTelaPRO_COD.Value, []) = True
      then begin
            Close;
           end;
     end;
LocalConsulta := '';
end;

procedure TfConsultaCPG.qPessoasFiltroPES_SITGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	Case qPessoasFiltroPES_SIT.AsInteger of
        0 : Text := 'SUPAI';
        1 : Text := 'MÃE';
        2 : Text := 'CRIANÇA';
    end;
end;

procedure TfConsultaCPG.EditMaeKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13
then begin
      sbConsultar.Click;
     end;
end;

procedure TfConsultaCPG.EditCriancaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13
then begin
      sbConsultar.Click;
     end;
end;

procedure TfConsultaCPG.EditSupaiKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13
then begin
      sbConsultar.Click;
     end;
end;

procedure TfConsultaCPG.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked = True
then begin
      gb_DadosColeta.Enabled     := False;
      gb_DadosGerais.Enabled     := False;
      gb_DadosResultados.Enabled := False;
      gb_Origem.Enabled          := False;
      gb_Union.Enabled           := True;
      EdtUnion.SetFocus;
     end else begin
               gb_DadosColeta.Enabled     := True;
               gb_DadosGerais.Enabled     := True;
               gb_DadosResultados.Enabled := True;
               gb_Origem.Enabled          := True;
               gb_Union.Enabled           := False;
               EditMae.SetFocus;
              end;

end;

procedure TfConsultaCPG.EdtUnionKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13
then begin
      sbConsultar.Click;
     end;
end;

procedure TfConsultaCPG.qPessoasFiltro_UnionPES_SITGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	Case qPessoasFiltro_UnionPES_SIT.AsInteger of
        0 : Text := 'SUPAI';
        1 : Text := 'MÃE';
        2 : Text := 'CRIANÇA';
    end;
end;

procedure TfConsultaCPG.DBLookupComboBox1Exit(Sender: TObject);
begin
 EditTipoCaso.Text := DBLookupComboBox1.KeyValue;
end;

end.
