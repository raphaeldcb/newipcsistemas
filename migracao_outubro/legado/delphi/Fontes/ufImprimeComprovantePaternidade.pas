unit ufImprimeComprovantePaternidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLBarcode, RLReport;

type
  TfImprimeComprExaPater = class(TForm)
    RLReport: TRLReport;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLLabel2: TRLLabel;
    RLDBText2: TRLDBText;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLImage1: TRLImage;
    RLLabel7: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel11: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel1: TRLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImprimeComprExaPater: TfImprimeComprExaPater;

implementation

uses ufProcesso;

{$R *.dfm}

end.
