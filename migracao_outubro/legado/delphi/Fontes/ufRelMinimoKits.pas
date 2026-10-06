unit ufRelMinimoKits;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RLReport;

type
  TfRelMinimoKits = class(TForm)
    QuickRep2: TRLReport;
    QRBand5: TRLBand;
    QRLabel12: TRLLabel;
    QRLabel14: TRLLabel;
    QRSysData3: TRLSystemInfo;
    QRLabel16: TRLLabel;
    QRLabel17: TRLLabel;
    QRSysData4: TRLSystemInfo;
    QRBand6: TRLBand;
    QRLabel18: TRLLabel;
    QRLabel19: TRLLabel;
    QRLabel22: TRLLabel;
    QRBand8: TRLBand;
    QRBand7: TRLBand;
    QRDBText6: TRLDBText;
    QRDBText7: TRLDBText;
    QRDBText2: TRLDBText;
    QRLabel1: TRLLabel;
    QRLabel2: TRLLabel;
    QRLabel3: TRLLabel;
    QRDBText1: TRLDBText;
    QRDBText3: TRLDBText;
    RLSystemInfo1: TRLSystemInfo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelMinimoKits: TfRelMinimoKits;

implementation

uses ufDMR;

{$R *.dfm}

end.
