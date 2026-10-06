unit ufImprimeLaudoImpressora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RLReport, RLFilters, RLBarcode, RLPDFFilter;

type
  TfImprimeLaudoImpressora = class(TForm)
    RLReport_Primeiro: TRLReport;
    RLReport_Segundo: TRLReport;
    RLReport_Terceiro: TRLReport;
    RLBand6: TRLBand;
    RLDBText31: TRLDBText;
    RLDBText33: TRLDBText;
    RLLabel47: TRLLabel;
    RLDBText39: TRLDBText;
    RLLabel56: TRLLabel;
    RLLabel57: TRLLabel;
    RLDBText40: TRLDBText;
    RLReport_Quarto: TRLReport;
    RLBand4: TRLBand;
    RLDBText17: TRLDBText;
    RLDBText19: TRLDBText;
    RLLabel27: TRLLabel;
    RLLabel79: TRLLabel;
    RLLabel80: TRLLabel;
    RLDBText47: TRLDBText;
    RLDBText49: TRLDBText;
    RLLabel81: TRLLabel;
    RLLabel82: TRLLabel;
    RLDBText53: TRLDBText;
    RLLabel83: TRLLabel;
    RLDBText54: TRLDBText;
    RLLabel84: TRLLabel;
    RLLabel85: TRLLabel;
    RLDBText55: TRLDBText;
    RLLabel86: TRLLabel;
    RLDBText56: TRLDBText;
    RLLabel87: TRLLabel;
    RLDBText57: TRLDBText;
    RLLabel88: TRLLabel;
    RLLabel89: TRLLabel;
    RLDBText58: TRLDBText;
    RLLabel90: TRLLabel;
    RLDBText59: TRLDBText;
    RLLabel91: TRLLabel;
    RLLabel92: TRLLabel;
    RLDataHoje_Primeiro: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel28: TRLLabel;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLLabel29: TRLLabel;
    RLLabel30: TRLLabel;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLDBText16: TRLDBText;
    RLLabel34: TRLLabel;
    RLDBText18: TRLDBText;
    RLLabel35: TRLLabel;
    RLDBText20: TRLDBText;
    RLLabel38: TRLLabel;
    RLLabel39: TRLLabel;
    RLDBText21: TRLDBText;
    RLLabel40: TRLLabel;
    RLDBText22: TRLDBText;
    RLLabel41: TRLLabel;
    RLLabel42: TRLLabel;
    RLDataHoje_Terceiro: TRLLabel;
    RLLabel43: TRLLabel;
    RLDBText23: TRLDBText;
    RLLabel53: TRLLabel;
    RLLabel55: TRLLabel;
    RLLabel78: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel68: TRLLabel;
    RLLabel75: TRLLabel;
    RLBand2: TRLBand;
    RLDBText6: TRLDBText;
    RLDBText8: TRLDBText;
    RLLabel10: TRLLabel;
    RLDBText25: TRLDBText;
    RLLabel36: TRLLabel;
    RLLabel37: TRLLabel;
    RLDBText26: TRLDBText;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel9: TRLLabel;
    RLDBText7: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBText9: TRLDBText;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLDBText10: TRLDBText;
    RLLabel14: TRLLabel;
    RLDBText11: TRLDBText;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLDataHoje_Segundo: TRLLabel;
    RLLabel1: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLBand8: TRLBand;
    RLLabel58: TRLLabel;
    RLLabel59: TRLLabel;
    RLLabel60: TRLLabel;
    RLLabel63: TRLLabel;
    RLDBText41: TRLDBText;
    RLDBText42: TRLDBText;
    RLDBText43: TRLDBText;
    RLDBText44: TRLDBText;
    RLDBText46: TRLDBText;
    RLLabel64: TRLLabel;
    RLDBText48: TRLDBText;
    RLLabel54: TRLLabel;
    RLLabel67: TRLLabel;
    RLLabel72: TRLLabel;
    RLLabel66: TRLLabel;
    RLLabel62: TRLLabel;
    RLDBText45: TRLDBText;
    RLDataHoje_Quarto: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel61: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImprimeLaudoImpressora: TfImprimeLaudoImpressora;

implementation

uses ufDM;

{$R *.dfm}

end.
