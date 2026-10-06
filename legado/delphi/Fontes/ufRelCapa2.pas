unit ufRelCapa2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RLReport, RLBarcode;

type
  TfRelCapa2 = class(TForm)
    QuickRep1: TRLReport;
    QRBand3: TRLBand;
    QRDBText13: TRLDBText;
    QRDBText14: TRLDBText;
    QRDBText15: TRLDBText;
    QRDBText16: TRLDBText;
    QRDBText17: TRLDBText;
    QRDBText18: TRLDBText;
    QRDBText19: TRLDBText;
    QRDBText20: TRLDBText;
    QRLabel29: TRLLabel;
    QRLabel32: TRLLabel;
    QRLabel33: TRLLabel;
    QRLabel34: TRLLabel;
    QRLabel35: TRLLabel;
    QRLabel36: TRLLabel;
    DataLimite: TRLLabel;
    QRLabel38: TRLLabel;
    Cadastrador: TRLLabel;
    QRLabel40: TRLLabel;
    CRIANCA: TRLLabel;
    QRLabel42: TRLLabel;
    QRLabel43: TRLLabel;
    QRLabel44: TRLLabel;
    QRLabel45: TRLLabel;
    Hora: TRLLabel;
    Minuto: TRLLabel;
    QRLabel48: TRLLabel;
    QRLabel49: TRLLabel;
    QRLabel50: TRLLabel;
    HORACOL: TRLLabel;
    MINUTOCOL: TRLLabel;
    QRLabel53: TRLLabel;
    QRLabel54: TRLLabel;
    QRLabel55: TRLLabel;
    QRLabel56: TRLLabel;
    QRLabel57: TRLLabel;
    QRLabel58: TRLLabel;
    NumLaudo: TRLLabel;
    QRLabel60: TRLLabel;
    QRLabel61: TRLLabel;
    QRLabel62: TRLLabel;
    QRLabel63: TRLLabel;
    ESTADO: TRLLabel;
    QRLabel65: TRLLabel;
    QRLabel66: TRLLabel;
    QRLabel67: TRLLabel;
    QRLabel68: TRLLabel;
    QRLabel69: TRLLabel;
    QRBand4: TRLBand;
    QRDBText21: TRLDBText;
    QRDBText22: TRLDBText;
    QRDBText23: TRLDBText;
    QRDBText24: TRLDBText;
    QRDBText1: TRLDBText;
    QRLabel1: TRLLabel;
    QRLabel2: TRLLabel;
    QRDBText2: TRLDBText;
    BarraCodigo: TRLBarcode;
    RLLabel1: TRLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelCapa2: TfRelCapa2;

implementation

uses ufProcesso;

{$R *.dfm}

end.
