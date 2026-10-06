unit ufGeraDocLabTipos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, StdCtrls, DB, SqlExpr, Grids, DBGrids,
  ComObj, Buttons, ADODB,
  ExtCtrls, ComCtrls;

type
  TfAlelosTipos = class(TForm)
    gbxImport: TGroupBox;
    lbOrigem: TLabel;
    edtOrigem: TEdit;
    btnOrigem: TSpeedButton;
    opndlgOrigem: TOpenDialog;
    qInsereDados: TADOQuery;
    DS_InsereDados: TDataSource;
    DBGrid1: TDBGrid;
    sbProcessamento: TSpeedButton;
    sbFechar: TSpeedButton;
    qVerificaDados: TADOQuery;
    qGeraDados: TADOQuery;
    qVerificaDadosCodigo: TADOQuery;
    qInsereDadosCOD_ALE: TIntegerField;
    qInsereDadosNM1_ALE: TStringField;
    qInsereDadosNM2_ALE: TStringField;
    qInsereDadosNM3_ALE: TStringField;
    qInsereDadosNM4_ALE: TStringField;
    qInsereDadosMAR_ALE: TStringField;
    qInsereDadosAL1_ALE: TStringField;
    qInsereDadosAL2_ALE: TStringField;
    qInsereDadosORD_ALE: TIntegerField;
    qVerificaDadosCodigoNM1_ALE: TStringField;
    qGeraDadosCOD_ALE: TIntegerField;
    qGeraDadosNM1_ALE: TStringField;
    qGeraDadosNM2_ALE: TStringField;
    qGeraDadosNM3_ALE: TStringField;
    qGeraDadosNM4_ALE: TStringField;
    qGeraDadosMAR_ALE: TStringField;
    qGeraDadosAL1_ALE: TStringField;
    qGeraDadosAL2_ALE: TStringField;
    qGeraDadosORD_ALE: TIntegerField;
    qVerificaCasoIncluso: TADOQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    IntegerField2: TIntegerField;
    qExcluirCaso: TADOQuery;
    IntegerField3: TIntegerField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    IntegerField4: TIntegerField;
    qDadosRepeticaoAlelos: TADOQuery;
    qDadosRepeticaoAlelosCOD_ALE: TIntegerField;
    qDadosRepeticaoAlelosNM1_ALE: TStringField;
    qDadosRepeticaoAlelosNM2_ALE: TStringField;
    qDadosRepeticaoAlelosNM3_ALE: TStringField;
    qDadosRepeticaoAlelosNM4_ALE: TStringField;
    qDadosRepeticaoAlelosMAR_ALE: TStringField;
    qDadosRepeticaoAlelosAL1_ALE: TStringField;
    qDadosRepeticaoAlelosAL2_ALE: TStringField;
    qDadosRepeticaoAlelosORD_ALE: TIntegerField;
    qTipoPessoas: TADOQuery;
    qTipoPessoasNM2_ALE: TStringField;
    qSelecionaSituacaoPessoa: TADOQuery;
    qSelecionaSituacaoPessoaNM2_ALE: TStringField;
    DS_SelecionaSituacaoPessoa: TDataSource;
    qSelecionaPessoa: TADOQuery;
    qSelecionaPessoaCOD_ALE: TIntegerField;
    qSelecionaPessoaNM1_ALE: TStringField;
    qSelecionaPessoaNM2_ALE: TStringField;
    qSelecionaPessoaNM3_ALE: TStringField;
    qSelecionaPessoaNM4_ALE: TStringField;
    qSelecionaPessoaMAR_ALE: TStringField;
    qSelecionaPessoaAL1_ALE: TStringField;
    qSelecionaPessoaAL2_ALE: TStringField;
    qSelecionaPessoaORD_ALE: TIntegerField;
    qContador: TADOQuery;
    qContadorCONTADOR: TIntegerField;
    qContadorCODIGO: TIntegerField;
    ds_Contador: TDataSource;
    qLimpaContadorAlelos: TADOQuery;
    sp_BuscaAlelos: TADOStoredProc;
    sp_BuscaAlelosMENSAGEM: TStringField;
    qGuardaAlelos: TADOQuery;
    IntegerField5: TIntegerField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    IntegerField6: TIntegerField;
    qInsereDadosTemporarios: TADOQuery;
    qInsereDadosTemporariosCOD_TALE: TIntegerField;
    qInsereDadosTemporariosCASO_TALE: TStringField;
    qInsereDadosTemporariosPESSOA_TALE: TStringField;
    qInsereDadosTemporariosINICIAIS_TALE: TStringField;
    qInsereDadosTemporariosTIPO_TALE: TStringField;
    qInsereDadosTemporariosALELO_TALE: TStringField;
    qInsereDadosTemporariosVALOR1_TALE: TStringField;
    qInsereDadosTemporariosVALOR2_TALE: TStringField;
    qBuscaTemporarios: TADOQuery;
    qBuscaTemporariosCOD_TALE: TIntegerField;
    qBuscaTemporariosCASO_TALE: TStringField;
    qBuscaTemporariosPESSOA_TALE: TStringField;
    qBuscaTemporariosINICIAIS_TALE: TStringField;
    qBuscaTemporariosTIPO_TALE: TStringField;
    qBuscaTemporariosALELO_TALE: TStringField;
    qBuscaTemporariosVALOR1_TALE: TStringField;
    qBuscaTemporariosVALOR2_TALE: TStringField;
    L_Tipo: TLabel;
    qBuscaTipo: TADOQuery;
    qBuscaTipoATP_COD: TIntegerField;
    qBuscaTipoATP_NOME: TStringField;
    qBuscaTipoATP_ORDEM: TIntegerField;
    qBuscaTipoATP_TIPO: TStringField;
    qMostraResultado: TADOQuery;
    qMostraResultadoPES_NOME: TStringField;
    qMostraResultadoPES_INICIAIS: TStringField;
    qMostraResultadoMAR_ALE: TStringField;
    qMostraResultadoAL1_ALE: TStringField;
    qMostraResultadoAL2_ALE: TStringField;
    sbPlanilha: TSpeedButton;
    qMostraResultadoNM1_ALE: TStringField;
    qExcluiCasoTEMP: TADOQuery;
    procedure btnOrigemClick(Sender: TObject);
    procedure edtTelResKeyPress(Sender: TObject; var Key: Char);
    procedure sbFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbPlanilhaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAlelosTipos: TfAlelosTipos;
  excel :variant;
  MesGerando, NomePlanilha, NumeroCaso : String;
  Linha, NumeroSheets, i, NumeroCasoVerificacao : Integer;


implementation

uses ufuncoes, Math, ufDM, ufDMR, ufExportaAlelosPlanilhas;

{$R *.dfm}

procedure TfAlelosTipos.btnOrigemClick(Sender: TObject);
begin
  if opndlgOrigem.Execute then
     edtOrigem.Text := opndlgOrigem.FileName;
end;

procedure TfAlelosTipos.edtTelResKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
     key := #0;
end;

procedure TfAlelosTipos.sbFecharClick(Sender: TObject);
begin
 Close;
end;


procedure TfAlelosTipos.FormShow(Sender: TObject);
begin
qInsereDados.Open;
end;

procedure TfAlelosTipos.sbPlanilhaClick(Sender: TObject);
begin
  qExcluiCasoTEMP.Close;
  qExcluiCasoTEMP.Parameters.ParamByName('Numero').Value := NumeroCaso;
  qExcluiCasoTEMP.ExecSQL;

  Application.CreateForm(TfExportacaoAlelos,fExportacaoAlelos);
  fExportacaoAlelos.EdtCodigo.Text := qMostraResultadoNM1_ALE.Value;
  fExportacaoAlelos.ShowModal;
  fExportacaoAlelos.Free;
end;

end.
