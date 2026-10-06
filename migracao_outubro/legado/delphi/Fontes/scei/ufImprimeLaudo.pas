unit ufImprimeLaudo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, QRCtrls, RLReport, RLFilters, RLDraftFilter,
  RLBarcode, RLPDFFilter, jpeg, RLRichText, HTTPApp, WinInet, pngimage;

type
  TfImprimeLaudo = class(TForm)
    RLReport_Quarto: TRLReport;
    RLPDFFilter1: TRLPDFFilter;
    RLBand8: TRLBand;
    RLLabel58: TRLLabel;
    RLLabel59: TRLLabel;
    RLLabel60: TRLLabel;
    RLDBText41: TRLDBText;
    RLDBText42: TRLDBText;
    RLDBText43: TRLDBText;
    RLDBText45: TRLDBText;
    RLDBText46: TRLDBText;
    RLDBText48: TRLDBText;
    RLDataHoje_Quarto: TRLLabel;
    RLLabel67: TRLLabel;
    RLLabel21: TRLLabel;
    RLBand1: TRLBand;
    RLImage1: TRLImage;
    RLBand3: TRLBand;
    RLImage2: TRLImage;
    RLLabel19: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel44: TRLLabel;
    RLLabel45: TRLLabel;
    RLLabel46: TRLLabel;
    RLDBText24: TRLDBText;
    RLDBMemo1: TRLDBMemo;
    RLReport_Primeiro: TRLReport;
    RLBand5: TRLBand;
    RLLabel22: TRLLabel;
    RLLabel48: TRLLabel;
    RLLabel49: TRLLabel;
    RLDBText27: TRLDBText;
    RLDBText28: TRLDBText;
    RLDBText29: TRLDBText;
    RLDBText32: TRLDBText;
    RLDBText34: TRLDBText;
    RLDataHoje_Primeiro: TRLLabel;
    RLLabel51: TRLLabel;
    RLLabel52: TRLLabel;
    RLLabel54: TRLLabel;
    RLLabel61: TRLLabel;
    RLLabel62: TRLLabel;
    RLLabel63: TRLLabel;
    RLLabel64: TRLLabel;
    RLDBText35: TRLDBText;
    RLDBMemo2: TRLDBMemo;
    RLBand7: TRLBand;
    RLImage3: TRLImage;
    RLBand9: TRLBand;
    RLImage4: TRLImage;
    RLLabel90: TRLLabel;
    RLLabel89: TRLLabel;
    RLDBText58: TRLDBText;
    RLLabel91: TRLLabel;
    RLDBText59: TRLDBText;
    RLDBText19: TRLDBText;
    RLDBText17: TRLDBText;
    RLLabel27: TRLLabel;
    RLLabel43: TRLLabel;
    RLDBText23: TRLDBText;
    RLLabel53: TRLLabel;
    RLLabel55: TRLLabel;
    RLReport_Segundo: TRLReport;
    RLBand4: TRLBand;
    RLLabel50: TRLLabel;
    RLLabel65: TRLLabel;
    RLLabel66: TRLLabel;
    RLDBText30: TRLDBText;
    RLDBText36: TRLDBText;
    RLDBText37: TRLDBText;
    RLDBText38: TRLDBText;
    RLDBText44: TRLDBText;
    RLDataHoje_Segundo: TRLLabel;
    RLLabel69: TRLLabel;
    RLLabel70: TRLLabel;
    RLLabel71: TRLLabel;
    RLLabel72: TRLLabel;
    RLLabel73: TRLLabel;
    RLLabel74: TRLLabel;
    RLLabel75: TRLLabel;
    RLDBText47: TRLDBText;
    RLDBMemo3: TRLDBMemo;
    RLLabel76: TRLLabel;
    RLLabel77: TRLLabel;
    RLDBText49: TRLDBText;
    RLLabel78: TRLLabel;
    RLDBText50: TRLDBText;
    RLBand10: TRLBand;
    RLImage5: TRLImage;
    RLBand11: TRLBand;
    RLImage6: TRLImage;
    RLReport_Terceiro: TRLReport;
    RLBand2: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDataHoje_Terceiro: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLDBText7: TRLDBText;
    RLDBMemo4: TRLDBMemo;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLDBText9: TRLDBText;
    RLLabel15: TRLLabel;
    RLDBText10: TRLDBText;
    RLBand12: TRLBand;
    RLImage7: TRLImage;
    RLBand13: TRLBand;
    RLImage8: TRLImage;
    RLDBText39: TRLDBText;
    RLDBText31: TRLDBText;
    RLDBText6: TRLDBText;
    RLReport_New: TRLReport;
    RLBand6: TRLBand;
    RLImage9: TRLImage;
    RLLabel4: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel23: TRLLabel;
    RLDataHoje: TRLLabel;
    RLMemo1: TRLMemo;
    RLMemo2: TRLMemo;
    RLLabel24: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLL_DATAS: TRLLabel;
    RLL_RESULTADOS: TRLLabel;
    RLL_PROTOCOLO: TRLLabel;
    RLL_PACIENTE: TRLLabel;
    RLL_CONVENIO: TRLLabel;
    RLLabel36: TRLLabel;
    RLLabel37: TRLLabel;
    RLLabel38: TRLLabel;
    RLLabel39: TRLLabel;
    RLDraw1: TRLDraw;
    RLLabel40: TRLLabel;
    RLLabel41: TRLLabel;
    Image1: TRLImage;
    RLL_Code: TRLAngleLabel;
    RLL_SiteConfere: TRLAngleLabel;
    RLL_PACIENTEP: TRLLabel;
    RLL_PASSDTNAS: TRLLabel;
    RLLabel47: TRLLabel;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    RLLabel35: TRLLabel;
    RLDraw2: TRLDraw;
    RLLabel42: TRLLabel;
    RLLabel56: TRLLabel;
    RLLabel57: TRLLabel;
    procedure RLBand6BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImprimeLaudo: TfImprimeLaudo;

implementation

uses ufDM, ufDMI, ufEmissaoLaudosAgrupadoNew;


type
TQrImage_ErrCorrLevel=(L,M,Q,H);

const
UrlGoogleQrCode='http://chart.apis.google.com/chart?cht=qr&chl=%s&chs=120x120';
QrImgCorrStr   : array [TQrImage_ErrCorrLevel] of string=('L','M','Q','H');

{$R *.DFM}


procedure WinInet_HttpGet(const Url: string;Stream:TStream);
const
BuffSize = 1024*1024;
var
  hInter   : HINTERNET;
  UrlHandle: HINTERNET;
  BytesRead: DWORD;
  Buffer   : Pointer;
begin
  hInter := InternetOpen('', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  if Assigned(hInter) then
  begin
    Stream.Seek(0,0);
    GetMem(Buffer,BuffSize);
    try
        UrlHandle := InternetOpenUrl(hInter, PChar(Url), nil, 0, INTERNET_FLAG_RELOAD, 0);
        if Assigned(UrlHandle) then
        begin
          repeat
            InternetReadFile(UrlHandle, Buffer, BuffSize, BytesRead);
            if BytesRead>0 then
             Stream.WriteBuffer(Buffer^,BytesRead);
          until BytesRead = 0;
          InternetCloseHandle(UrlHandle);
        end;
    finally
      FreeMem(Buffer);
    end;
    InternetCloseHandle(hInter);
  end
end;

procedure GetQrCode(const Data:string;StreamImage : TMemoryStream);
Var
 EncodedURL  : string;
begin
  EncodedURL:=Format(UrlGoogleQrCode,[HTTPEncode(Data)]);
  WinInet_HttpGet(EncodedURL,StreamImage);
end;

procedure TfImprimeLaudo.RLBand6BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
    ImageStream : TMemoryStream;
    PngImage    : TPNGObject;
    Link : String;
begin
  if (fEmissaoLaudosAgrupadoNew.qRelLaudoPRO_HASH.Value = '')
  then begin
         RLL_Code.Visible        := False;
         RLL_SiteConfere.Visible := False;
         Image1.Visible          := False;
         RLLabel47.Visible       := False;
       end;
  // ----------------- qr code ---------------------------------

 Image1.Picture:=nil;
 ImageStream:=TMemoryStream.Create;
 PngImage   := TPNGObject.Create;
 try
   try
        GetQrCode('https://www.rdcb.com.br/consulta.php?documento=' + fEmissaoLaudosAgrupadoNew.qRelLaudoPRO_HASH.Value,ImageStream);
       if ImageStream.Size>0 then
       begin
          ImageStream.Position:=0;
          PngImage.LoadFromStream(ImageStream);
          Image1.Picture.Assign(PngImage);
       end;
   except
//      on E: exception do
//      ShowMessage(E.Message);
   end;
 finally
  ImageStream.Free;
  PngImage.Free;
 end;
end;


end.
