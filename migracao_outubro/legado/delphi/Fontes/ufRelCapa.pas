unit ufRelCapa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RLReport, RLBarcode;

type
  TfRelCapa = class(TForm)
    QuickRep1: TRLReport;
    QRBand1: TRLBand;
    QRDBText1: TRLDBText;
    QRDBText3: TRLDBText;
    QRDBText4: TRLDBText;
    QRDBText5: TRLDBText;
    QRDBText6: TRLDBText;
    QRDBText7: TRLDBText;
    QRDBText8: TRLDBText;
    QRDBText9: TRLDBText;
    QRLabel1: TRLLabel;
    QRLabel2: TRLLabel;
    QRLabel3: TRLLabel;
    QRLabel4: TRLLabel;
    QRLabel5: TRLLabel;
    QRLabel6: TRLLabel;
    DataLimite: TRLLabel;
    QRLabel7: TRLLabel;
    Cadastrador: TRLLabel;
    QRBand2: TRLBand;
    QRLabel8: TRLLabel;
    QRDBText11: TRLDBText;
    QRDBText12: TRLDBText;
    CRIANCA: TRLLabel;
    QRLabel9: TRLLabel;
    QRLabel10: TRLLabel;
    QRLabel11: TRLLabel;
    QRLabel12: TRLLabel;
    Hora: TRLLabel;
    MINUTO: TRLLabel;
    QRLabel13: TRLLabel;
    QRLabel14: TRLLabel;
    QRLabel15: TRLLabel;
    HORACOL: TRLLabel;
    MINUTOCOL: TRLLabel;
    QRLabel16: TRLLabel;
    QRDBText10: TRLDBText;
    QRLabel18: TRLLabel;
    QRLabel19: TRLLabel;
    QRLabel20: TRLLabel;
    QRLabel21: TRLLabel;
    QRLabel17: TRLLabel;
    NumLaudo: TRLLabel;
    QRLabel22: TRLLabel;
    QRLabel23: TRLLabel;
    QRLabel24: TRLLabel;
    QRLabel25: TRLLabel;
    ESTADO: TRLLabel;
    QRDBText2: TRLDBText;
    QRLabel27: TRLLabel;
    QRLabel28: TRLLabel;
    QRLabel30: TRLLabel;
    QRLabel31: TRLLabel;
    QRLabel26: TRLLabel;
    QRLabel29: TRLLabel;
    QRDBText13: TRLDBText;
    BarraCodigo: TRLBarcode;
    RLLabel1: TRLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelCapa: TfRelCapa;

implementation

uses ufProcesso;

{$R *.dfm}

end.
