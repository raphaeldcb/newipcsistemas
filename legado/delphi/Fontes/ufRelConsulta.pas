unit ufRelConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, RLReport;

type
  TfRelConsulta = class(TForm)
    QuickRep1: TRLReport;
    QRBand8: TRLBand;
    QRLabel37: TRLLabel;
    QRSysData4: TRLSystemInfo;
    QRLabel38: TRLLabel;
    QRLabel40: TRLLabel;
    qBuscaCrianca: TADOQuery;
    qBuscaCriancaPES_NOME: TStringField;
    qBuscaPai: TADOQuery;
    qBuscaMae: TADOQuery;
    RLBand1: TRLBand;
    QRLabel21: TRLLabel;
    QRDBText18: TRLDBText;
    QRLabel22: TRLLabel;
    QRDBText19: TRLDBText;
    QRLabel23: TRLLabel;
    QRDBText20: TRLDBText;
    QRLabel24: TRLLabel;
    QRDBText21: TRLDBText;
    QRLabel25: TRLLabel;
    QRLabel26: TRLLabel;
    QRLabel27: TRLLabel;
    QRLabel28: TRLLabel;
    QRLabel29: TRLLabel;
    QRDBText26: TRLDBText;
    QRDBText25: TRLDBText;
    QRLabel33: TRLLabel;
    QRLabel32: TRLLabel;
    RLL_MAE: TRLLabel;
    RLL_CRIANCA: TRLLabel;
    RLL_SUPAI: TRLLabel;
    RLBand2: TRLBand;
    RLLabel3: TRLLabel;
    RLDBResult1: TRLDBResult;
    qBuscaMaePES_NOME: TStringField;
    qBuscaPaiPES_NOME: TStringField;
    RLL_USUEMISSAO: TRLLabel;
    QRSysData3: TRLSystemInfo;
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelConsulta: TfRelConsulta;

implementation

uses ufDMR, ufConsultaCPG, ufDM;

{$R *.dfm}

procedure TfRelConsulta.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
qBuscaCrianca.Close;
qBuscaCrianca.Parameters.ParamByName('PRO_COD').Value  := DMR.qFiltroCPGTelaPRO_COD.Value;
qBuscaCrianca.Open;
RLL_CRIANCA.Caption := qBuscaCriancaPES_NOME.Value;
qBuscaPai.Close;
qBuscaPai.Parameters.ParamByName('PRO_COD').Value  := DMR.qFiltroCPGTelaPRO_COD.Value;
qBuscaPai.Open;
RLL_SUPAI.Caption := qBuscaPaiPES_NOME.Value;
qBuscaMae.Close;
qBuscaMae.Parameters.ParamByName('PRO_COD').Value  := DMR.qFiltroCPGTelaPRO_COD.Value;
qBuscaMae.Open;
RLL_MAE.Caption := qBuscaMaePES_NOME.Value;

RLL_USUEMISSAO.Caption := '';
RLL_USUEMISSAO.Caption := 'Emitido por: ' + DM.qHostsHOS_USUA.Value;

end;

end.
