
unit ufImprimeMapa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RLReport, RLFilters,
  RLBarcode, RLConsts;

type
  TfImprimeMapa = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLLabel7: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLDBText4: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText12: TRLDBText;
    RLBand4: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLDBText2: TRLDBText;
    RLBand3: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel4: TRLLabel;
    RLDraw1: TRLDraw;
    RLDBText15: TRLDBText;
    RLDraw2: TRLDraw;
    RLLabel5: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLLabel6: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLDBBarcode1: TRLDBBarcode;
    RLDBText1: TRLDBText;
    RLLabel20: TRLLabel;
    RLDBText11: TRLDBText;
    RLDBText19: TRLDBText;
    RLLabel21: TRLLabel;
    RLDBText20: TRLDBText;
    RLLabel22: TRLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImprimeMapa: TfImprimeMapa;

implementation

uses ufDM, ufDMRI, ufDMI;

{$R *.dfm}

initialization
end.
