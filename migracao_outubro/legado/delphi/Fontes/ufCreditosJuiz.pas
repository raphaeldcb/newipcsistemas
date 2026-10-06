unit ufCreditosJuiz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, Buttons, ExtCtrls, DBCtrls, StdCtrls, Mask, ADODB, RLReport,
  JvExMask, JvToolEdit, JvDBControls;

type
  TfCreditosGeracao = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBLookupComboBoxJuiz: TDBLookupComboBox;
    DBDateEdit2: TJvDBDateEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    ds_UtlimoCredito: TDataSource;
    bbtImprimir: TSpeedButton;
    qTempCreditos: TADOQuery;
    qTempCreditosID_CREDITO: TIntegerField;
    qTempCreditosTCRED_NUM: TIntegerField;
    RLReport_New: TRLReport;
    ds_TempCredito: TDataSource;
    RLDetailGrid1: TRLDetailGrid;
    qManutencao: TADOQuery;
    qListaJuiz: TADOQuery;
    qListaJuizJUI_COD: TIntegerField;
    qListaJuizJUI_DESC: TStringField;
    qListaJuizJUI_SEXO: TStringField;
    qListaJuizJUI_CREDITO: TStringField;
    ds_ListaJuiz: TDataSource;
    qTempCreditosTCRED_JUIZ: TStringField;
    RLDraw1: TRLDraw;
    RLDBText2: TRLDBText;
    RLDBText1: TRLDBText;
    RLImage1: TRLImage;
    RLLabel1: TRLLabel;
    qCreditoUltimo: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure BNovoClick(Sender: TObject);
    procedure DBLookupComboBoxJuizExit(Sender: TObject);
    procedure bbtImprimirClick(Sender: TObject);
    procedure BSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCreditosGeracao: TfCreditosGeracao;
  Total, I, Primeiro: Integer;

implementation

uses ufDM;

{$R *.dfm}

procedure TfCreditosGeracao.FormShow(Sender: TObject);
begin
dm.qCreditos.Open;
qListaJuiz.Open;

end;

procedure TfCreditosGeracao.BNovoClick(Sender: TObject);
var proximo:integer;
begin

  DM.qMaxCreditos.Close;
  DM.qMaxCreditos.Open;
  Proximo:=DM.qMaxCreditosULTIMO.Value + 1;
  inherited;
  DM.qCreditosID_CREDITO.Value := Proximo;
  DM.qCreditosCRE_DATA.Value   := Date;
  DBLookupComboBoxJuiz.SetFocus;


end;

procedure TfCreditosGeracao.DBLookupComboBoxJuizExit(Sender: TObject);
begin
qCreditoUltimo.Close;
qCreditoUltimo.Parameters.ParamByName('Juiz').Value := DBLookupComboBoxJuiz.KeyValue;
qCreditoUltimo.Open;
inherited;

end;

procedure TfCreditosGeracao.bbtImprimirClick(Sender: TObject);
begin
with qManutencao do
begin
  Close;
  SQL.Clear;
  SQL.Add(' delete from TB_TEMP_CREDITO ');
  ExecSQL;
end;


dm.qRelCreditos.Close;
dm.qRelCreditos.Parameters.ParamByName('Credito').Value := DM.qCreditosID_CREDITO.Value;
dm.qRelCreditos.Open;
Total    := DM.qCreditosCRED_FINAL.Value - DM.qCreditosCRED_INICIAL.Value;
Primeiro := DM.qCreditosCRED_INICIAL.Value;
for I := 1 to Total do
begin
   qTempCreditos.Open;
   qTempCreditos.Append;
   qTempCreditosID_CREDITO.Value := dm.qRelCreditosID_CREDITO.Value;
   qTempCreditosTCRED_JUIZ.Value := DBLookupComboBoxJuiz.Text;
   qTempCreditosTCRED_NUM.Value  := Primeiro + I;
   qTempCreditos.Post;
end;
RLReport_New.Preview(nil);



end;

procedure TfCreditosGeracao.BSairClick(Sender: TObject);
begin
with qManutencao do
begin
  Close;
  SQL.Clear;
  SQL.Add(' delete from TB_TEMP_CREDITO ');
  ExecSQL;
end;

inherited;

end;

end.
