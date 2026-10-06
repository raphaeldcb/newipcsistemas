unit ufRelCreditosJuiz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, ADODB, Grids,
  DBGrids, ExtCtrls, RLReport;

type
  TfRelCreditosporJuiz = class(TForm)
    DBGrid1: TDBGrid;
    qBuscaDados: TADOQuery;
    DS_BuscaDados: TDataSource;
    Label4: TLabel;
    qBuscaDadosCOUNT: TIntegerField;
    qBuscaDadosPRO_COD: TIntegerField;
    qBuscaDadosPRO_NPERC: TStringField;
    qBuscaDadosLCO_NOME: TStringField;
    qBuscaDadosUF_SIGLA: TStringField;
    qBuscaDadosDESCRICAOCASO: TStringField;
    qBuscaDadosPRO_DREC: TDateField;
    qBuscaDadosPRO_TIPO: TIntegerField;
    qBuscaDadosPRO_AUTO: TStringField;
    qBuscaDadosVARA: TStringField;
    qBuscaDadosCOMARCA: TStringField;
    qBuscaDadosJUI_COD: TIntegerField;
    qBuscaDadosJUI_DESC: TStringField;
    qBuscaDadosCRED_QDCRE: TStringField;
    QuickRep2: TRLReport;
    QRBand7: TRLBand;
    QRGroup2: TRLGroup;
    QRLabel37: TRLLabel;
    QRLabel38: TRLLabel;
    QRLabel4: TRLLabel;
    DataIni: TRLLabel;
    QRLabel6: TRLLabel;
    DataFim: TRLLabel;
    QRLabel28: TRLLabel;
    QRDBText1: TRLDBText;
    qBuscaDatas: TADOQuery;
    qBuscaDatasCRE_DATA: TDateField;
    ds_BuscaDatas: TDataSource;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    qBuscaMaiorData: TADOQuery;
    qBuscaMaiorDataMAIORDATA: TDateField;
    qBuscaMenorData: TADOQuery;
    qBuscaMenorDataMENORDATA: TDateField;
    bbtFechar: TSpeedButton;
    bbtImprimir: TSpeedButton;
    QRBand1: TRLBand;
    QRLabel21: TRLLabel;
    QRDBText18: TRLDBText;
    QRLabel30: TRLLabel;
    QRDBText28: TRLDBText;
    QRLabel22: TRLLabel;
    QRDBText19: TRLDBText;
    QRLabel3: TRLLabel;
    QRDBText3: TRLDBText;
    QRDBText27: TRLDBText;
    QRLabel31: TRLLabel;
    QRDBText26: TRLDBText;
    QRDBText2: TRLDBText;
    QRLabel2: TRLLabel;
    QRLabel29: TRLLabel;
    QRDBText20: TRLDBText;
    QRLabel23: TRLLabel;
    QRBand11: TRLBand;
    QRLabel39: TRLLabel;
    QRSysData3: TRLSystemInfo;
    QRLabel1: TRLLabel;
    QuickRep1: TRLReport;
    QRBand2: TRLBand;
    QRLabel5: TRLLabel;
    QRLabel7: TRLLabel;
    QRLabel8: TRLLabel;
    QRLabel9: TRLLabel;
    QRLabel10: TRLLabel;
    QRLabel11: TRLLabel;
    QRGroup1: TRLGroup;
    QRLabel13: TRLLabel;
    QRDBText4: TRLDBText;
    QRBand3: TRLBand;
    QRLabel14: TRLLabel;
    QRDBText5: TRLDBText;
    QRLabel15: TRLLabel;
    QRDBText6: TRLDBText;
    QRLabel16: TRLLabel;
    QRDBText7: TRLDBText;
    QRLabel17: TRLLabel;
    QRDBText8: TRLDBText;
    QRDBText9: TRLDBText;
    QRLabel18: TRLLabel;
    QRDBText10: TRLDBText;
    QRDBText11: TRLDBText;
    QRLabel19: TRLLabel;
    QRLabel20: TRLLabel;
    QRDBText12: TRLDBText;
    QRLabel24: TRLLabel;
    QRBand4: TRLBand;
    QRLabel25: TRLLabel;
    QRSysData2: TRLSystemInfo;
    QRLabel26: TRLLabel;
    qContador: TADOQuery;
    qContadorJUI_COD: TIntegerField;
    RLDBResult1: TRLDBResult;
    RLSystemInfo1: TRLSystemInfo;
    QRLabel40: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLDBResult2: TRLDBResult;
    procedure bbtFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtImprimirClick(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelCreditosporJuiz: TfRelCreditosporJuiz;

implementation

uses ufDMR, ufRelFinanceiro, ufDM, ufProcesso, ufVinculaCreditos;

{$R *.dfm}

procedure TfRelCreditosporJuiz.bbtFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfRelCreditosporJuiz.FormShow(Sender: TObject);
begin
qBuscaDatas.Open;
end;

procedure TfRelCreditosporJuiz.bbtImprimirClick(Sender: TObject);
begin
DataIni.Caption := DateToStr(qBuscaMenorDataMENORDATA.Value);
DataFim.Caption := DateToStr(qBuscaMaiorDataMAIORDATA.Value);
if qContador.RecordCount > 1
then begin
      QuickRep2.Preview;
     end else QuickRep1.Preview;
bbtImprimir.Enabled := False;
end;

procedure TfRelCreditosporJuiz.DBGrid2CellClick(Column: TColumn);
begin
qBuscaDados.Close;
qBuscaDados.Parameters.ParamByName('Data').Value     := qBuscaDatasCRE_DATA.Value;
qBuscaDados.Open;

qContador.Close;
qContador.Parameters.ParamByName('Informacao').Value := qBuscaDatasCRE_DATA.Value;
qContador.Open;

qBuscaMenorData.Close;
qBuscaMenorData.Parameters.ParamByName('Data').Value := qBuscaDatasCRE_DATA.Value;
qBuscaMenorData.Open;

qBuscaMaiorData.Close;
qBuscaMaiorData.Parameters.ParamByName('Data').Value := qBuscaDatasCRE_DATA.Value;
qBuscaMaiorData.Open;


if (qBuscaDados.RecordCount > 0)
then begin
      bbtImprimir.Enabled := True;
     end else bbtImprimir.Enabled := False;

end;

end.
