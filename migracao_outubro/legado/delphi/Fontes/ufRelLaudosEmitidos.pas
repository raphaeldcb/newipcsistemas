unit ufRelLaudosEmitidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RLReport;

type
  TfRelLaudosEmitidos = class(TForm)
    QuickRep2: TRLReport;
    QRBand5: TRLBand;
    QRLabel12: TRLLabel;
    QRLabel13: TRLLabel;
    QRLabel14: TRLLabel;
    QRLabel15: TRLLabel;
    QRBand6: TRLBand;
    QRLabel18: TRLLabel;
    QRLabel19: TRLLabel;
    QRLabel21: TRLLabel;
    QRLabel22: TRLLabel;
    QRBand8: TRLBand;
    QRBand7: TRLBand;
    QRDBText6: TRLDBText;
    QRDBText7: TRLDBText;
    QRDBText1: TRLDBText;
    QRDBText2: TRLDBText;
    QRLabel2: TRLLabel;
    Criador: TRLLabel;
    QRLabel16: TRLLabel;
    QRLabel17: TRLLabel;
    QRSysData4: TRLSystemInfo;
    QRSysData3: TRLSystemInfo;
    RLSystemInfo1: TRLSystemInfo;
    QRLabel1: TRLLabel;
    procedure QRBand7BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelLaudosEmitidos: TfRelLaudosEmitidos;

implementation

uses ufDMR;

{$R *.dfm}

procedure TfRelLaudosEmitidos.QRBand7BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
DMR.qBuscaFezLaudo.Close;
DMR.qBuscaFezLaudo.Parameters.ParamByName('Codigo').Value  := DMR.qRelLaudosEmitidosPRO_NPERC.Value;
DMR.qBuscaFezLaudo.Open;
DMR.qBuscaFezLaudo.Last;
Criador.Caption := DMR.qBuscaFezLaudoHOS_USUA.Value;
end;

end.
