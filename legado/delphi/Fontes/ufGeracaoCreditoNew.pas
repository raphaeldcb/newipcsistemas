unit ufGeracaoCreditoNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons, DB, ADODB,
  JvExMask, JvToolEdit, Vcl.Grids, Vcl.DBGrids, RLReport, RLBarcode, Vcl.Menus, HTTPApp, WinInet, jpeg, pngimage,
  RLFilters, RLPDFFilter, DelphiZXingQRCode;

type
  TfGeracaoCreditos = class(TForm)
    BSair: TSpeedButton;
    BProcessar: TSpeedButton;
    qCalcCred_Lista: TADOQuery;
    dsCalcCred_Lista: TDataSource;
    qCalcCred_ListaUF: TStringField;
    qCalcCred_ListaVARA: TStringField;
    qCalcCred_ListaCOMARCA: TStringField;
    qCalcCred_ListaNUM_CREDITO: TIntegerField;
    qCalcCred_ListaDAT_CREDITO: TDateField;
    qrp_QRCode: TRLReport;
    RLBand1: TRLBand;
    qCalcCred_Rel: TADOQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField1: TIntegerField;
    DateField1: TDateField;
    RLImageLogo: TRLImage;
    dsCalcCred_Rel: TDataSource;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    PopupMenu1: TPopupMenu;
    CartoQRCode1: TMenuItem;
    qValorCreditoParametros: TADOQuery;
    qValorCreditoParametrosPAM_ULTCRED: TIntegerField;
    Image1: TRLImage;
    Crédito: TRLLabel;
    qCalcCred_ListaCasos: TADOQuery;
    ds_CalcCred_ListaCasos: TDataSource;
    qCalcCred_ListaCasosPRO_COD: TIntegerField;
    qCalcCred_ListaCasosUF: TStringField;
    qCalcCred_ListaCasosVARA: TStringField;
    qCalcCred_ListaCasosCOMARCA: TStringField;
    qCalcCred_ListaCasosCOUNT: TIntegerField;
    DBGrid_ListaCasos: TDBGrid;
    RG_Listas: TRadioGroup;
    DBGrid_ListaCreditos: TDBGrid;
    procedure BSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BProcessarClick(Sender: TObject);
    procedure CartoQRCode1Click(Sender: TObject);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormShow(Sender: TObject);
    procedure RG_ListasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGeracaoCreditos: TfGeracaoCreditos;

implementation

uses ufDM;


{$R *.DFM}


procedure GerarQRCode(const Texto: string; Image: TRLImage);
var
  QRCode: TDelphiZXingQRCode;
  Bitmap: TBitmap;
  Row, Column: Integer;
begin
  QRCode := TDelphiZXingQRCode.Create;
  try
    QRCode.Data := Texto;
    QRCode.Encoding := TQRCodeEncoding.qrAuto;
    QRCode.QuietZone := 4;

    Bitmap := TBitmap.Create;
    try
      Bitmap.SetSize(QRCode.Rows, QRCode.Columns);

      for Row := 0 to QRCode.Rows - 1 do
        for Column := 0 to QRCode.Columns - 1 do
          if QRCode.IsBlack[Row, Column] then
            Bitmap.Canvas.Pixels[Column, Row] := clBlack
          else
            Bitmap.Canvas.Pixels[Column, Row] := clWhite;

      Image.Picture.Bitmap := Bitmap;
    finally
      Bitmap.Free;
    end;
  finally
    QRCode.Free;
  end;
end;

procedure TfGeracaoCreditos.BSairClick(Sender: TObject);
begin
 Close;
end;

procedure TfGeracaoCreditos.CartoQRCode1Click(Sender: TObject);
begin
 qCalcCred_Rel.Close;
 qCalcCred_Rel.Parameters.ParamByName('Credito').Value := qCalcCred_ListaNUM_CREDITO.Value;
 qCalcCred_Rel.Open;
 qrp_QRCode.Preview(nil);
end;

procedure TfGeracaoCreditos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.qColetador.Close;
end;


procedure TfGeracaoCreditos.FormShow(Sender: TObject);
begin
BProcessar.Click;
end;

procedure GetQrCode(const Data:string;StreamImage : TMemoryStream);
begin
end;

procedure TfGeracaoCreditos.RG_ListasClick(Sender: TObject);
begin
if (RG_Listas.ItemIndex = 0)
then begin
      DBGrid_ListaCreditos.Visible := True;
      DBGrid_ListaCasos.Visible    := False;
     end else begin
               DBGrid_ListaCreditos.Visible := False;
               DBGrid_ListaCasos.Visible    := True;
              end;
end;

procedure TfGeracaoCreditos.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var  Credito : String;
begin
  Credito := '';
  Credito := IntToStr(qCalcCred_ListaNUM_CREDITO.Value);
  // ----------------- qr code ---------------------------------
  GerarQRCode(Credito, Image1);
end;

procedure TfGeracaoCreditos.BProcessarClick(Sender: TObject);
var ValorCredito : Integer;
begin
DM.qParametros.Open;

//Começo da geração
DM.qCalcCred_GeraCredito.Close;
DM.qCalcCred_GeraCredito.Open;
DM.qCalcCred_GeraCredito.RecordCount;

DM.qCalcCred_GeraCredito.First;
while DM.qCalcCred_GeraCredito.Eof = False do
begin

 with DM.qCalcCred_AjustaProcesso do
 begin
   Close;
   SQL.Clear;
   SQL.Add('update TB_PARAMETRO set PAM_ULTCRED = PAM_ULTCRED + 1 ');
   ExecSQL;
 end;

 qValorCreditoParametros.Close;
 qValorCreditoParametros.Open;
 ValorCredito := 0;
 ValorCredito := qValorCreditoParametrosPAM_ULTCRED.Value;


 DM.qCalcCred_AtualizaCred.Close;
 DM.qCalcCred_AtualizaCred.Parameters.ParamByName('Sigla').Value   := DM.qCalcCred_GeraCreditoUF_SIGLA.Value;
 DM.qCalcCred_AtualizaCred.Parameters.ParamByName('Comarca').Value := DM.qCalcCred_GeraCreditoCOM_COD.Value;
 DM.qCalcCred_AtualizaCred.Parameters.ParamByName('Vara').Value    := DM.qCalcCred_GeraCreditoVAR_COD.Value;
 DM.qCalcCred_AtualizaCred.Open;
 DM.qCalcCred_AtualizaCred.RecordCount;

 DM.qCalcCred_AtualizaCred.First;
 while DM.qCalcCred_AtualizaCred.Eof = False do
 begin
  with DM.qCalcCred_AjustaProcesso do
  begin
    Close;
    SQL.Clear;
    SQL.Add('update TB_PROCESSO_CREDITO set NUM_CREDITO = :Credito, DAT_CREDITO = :Data where PRO_COD = :Processo');
    Parameters.ParamByName('Processo').Value := DM.qCalcCred_AtualizaCredPRO_COD.Value;
    Parameters.ParamByName('Credito').Value  := ValorCredito;
    Parameters.ParamByName('Data').Value     := Date;
    ExecSQL;
  end;
  DM.qCalcCred_AtualizaCred.Next;
 end;
  DM.qCalcCred_GeraCredito.Next;
end;

qCalcCred_Lista.Close;
qCalcCred_Lista.Open;

qCalcCred_ListaCasos.Close;
qCalcCred_ListaCasos.Open;

end;
end.
