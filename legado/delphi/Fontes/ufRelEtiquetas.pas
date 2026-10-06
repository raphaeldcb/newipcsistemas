unit ufRelEtiquetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, RLReport, Buttons, RLBarcode,
  JvMemoryDataset;

type
  TfRelEtiquetas = class(TForm)
    QuickRep1: TRLReport;
    DataSourceCodProcesso: TDataSource;
    QRCabecaColuna: TRLBand;
    Detail: TRLBand;
    QRCodProcesso: TRLDBText;
    QRNome: TRLDBText;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    qCodigoProcesso: TADOQuery;
    RLBarcode1: TRLBarcode;
    dsCodigoProcesso: TDataSource;
    SpeedButton1: TSpeedButton;
    RLBarcode2: TRLBarcode;
    RLBarcode3: TRLBarcode;
    qCodigoProcessoPRO_COD: TIntegerField;
    RLBarcode5: TRLBarcode;
    bbtFechar: TSpeedButton;
    QRImage1: TRLImage;
    MemoryTableCodProcesso: TJvMemoryData;
    procedure SpeedButton1Click(Sender: TObject);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelEtiquetas: TfRelEtiquetas;
  valor : Integer;

implementation

{$R *.dfm}

procedure TfRelEtiquetas.SpeedButton1Click(Sender: TObject);
begin
qCodigoProcesso.Open;
RLReport1.Preview(nil);
end;

procedure TfRelEtiquetas.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var i,j : Integer;
begin
  if (valor = 0)
  then begin
        j := valor + 142001;
      end else j := valor + 1;
  RLBarcode1.Caption := IntToStr(j);
  j := j + 1;
  RLBarcode2.Caption := IntToStr(j);
  j := j + 1;
  RLBarcode3.Caption := IntToStr(j);
  j := j + 1;
//  RLBarcode4.Caption := IntToStr(j);
//  j := j + 1;
  RLBarcode5.Caption := IntToStr(j);
  valor := j
end;

end.
