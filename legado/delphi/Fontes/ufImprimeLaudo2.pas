unit ufImprimeLaudo2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RLReport, RLFilters, RLBarcode, RLPDFFilter, jpeg, RLRichText, HTTPApp, WinInet, pngimage;

type
  TfImprimeLaudo2 = class(TForm)
    RLPDFFilter1: TRLPDFFilter;
    RLReport_New: TRLReport;
    RLBand6: TRLBand;
    RLImage9: TRLImage;
    RLLabel4: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel23: TRLLabel;
    RLDataHoje: TRLLabel;
    RL_MEMO_INFLUENZA_PORT: TRLMemo;
    RLLabel24: TRLLabel;
    RLL_DATAS: TRLLabel;
    RLL_RESULTADOS: TRLLabel;
    RLL_PROTOCOLO: TRLLabel;
    RLL_PACIENTE: TRLLabel;
    RLLabel36: TRLLabel;
    RLLabel37: TRLLabel;
    RLLabel38: TRLLabel;
    RLLabel39: TRLLabel;
    RLDraw1: TRLDraw;
    Image1: TRLImage;
    RLL_Code: TRLAngleLabel;
    RLL_SiteConfere: TRLAngleLabel;
    RLLabel47: TRLLabel;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    RLLabel35: TRLLabel;
    RLLabel56: TRLLabel;
    RLLabel57: TRLLabel;
    RLL_RESULTADOS2: TRLLabel;
    RLLabel17: TRLLabel;
    RLL_ANALISE: TRLLabel;
    RLL_RESULTADOS3: TRLLabel;
    RLL_RESULTADOS4: TRLLabel;
    RL_MEMO_COVID_PORT: TRLMemo;
    RL_MEMO_COVID_INGL: TRLMemo;
    RL_MEMO_INFLUENZA_INGL: TRLMemo;
    RLDraw2: TRLDraw;
    RLLabel42: TRLLabel;
    RLLabel1: TRLLabel;
    RLLabel16: TRLLabel;
    RLL_CONVENIO: TRLLabel;
    RLLabel41: TRLLabel;
    RLLabel40: TRLLabel;
    procedure RLBand6BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImprimeLaudo2: TfImprimeLaudo2;

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

procedure TfImprimeLaudo2.RLBand6BeforePrint(Sender: TObject;
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
