unit ufCartaoFirmaImgNew;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, DBCtrls, DB, Jpeg, dbclient, Provider,
  FMTBcd, SqlExpr, IniFiles, StdCtrls, Data.DBXInterBase, Data.DBXFirebird, Data.DBXCommon,
  Data.Win.ADODB, hyieutils, hyiedefs, iesettings, imageenio, iemio,
  imageenproc, ieview, imageenview, imageen, RLReport, JvADOQuery, ADODB;

const 
  OffsetMemoryStream : Int64 = 0;
type
  TfCartaoFirmaImgNew = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    sbSalvar: TSpeedButton;
    sbImagem: TSpeedButton;
    qHistCartaoFirma: TADOQuery;
    Image: TImage;
    procedure sbSalvarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ExibeImgNew;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCartaoFirmaImgNew: TfCartaoFirmaImgNew;
  MemoryStream : TMemoryStream;
  Jpg : TJpegImage;
  Bitmap : TBitmap;

implementation

uses ufDM, ufCartaoFirma, Especificacao_SIGEX;

{$R *.DFM}

const
  TempFileName = 'temp.jpg';

procedure TfCartaoFirmaImgNew.sbSalvarClick(Sender: TObject);
var
  Jpg: TJpegImage;
  Stm: TMemoryStream;
  Bmp: TBitmap;
  CaminhoBanco, CaminhoFisico, NomeArquivo : String;
begin
  CaminhoBanco  := '';
  CaminhoFisico := '';
  NomeArquivo   := '';

  qContaCartoes.Close;
  qContaCartoes.Parameters.ParamByName('Codigo').Value := DM.qCartaoFirmaCODIGO.Value;
  qContaCartoes.Open;

  if (UpperCase(GetEnvironmentVariable('COMPUTERNAME')) = 'NOTE-RAPHAEL') or (UpperCase(GetEnvironmentVariable('COMPUTERNAME')) = 'SOL')
  then begin
         if (qContaCartoesCONTACARTOES.Value > 1)
         then begin
               CaminhoBanco  := DM.qParametroPAR_DIR_LOCAL_SALVA.Value + '\CARTORIO\CARTOES_FIRMA_SCRC\' + IntToStr(DM.qCartaoFirmaCODIGO.Value) + '_' + IntToStr(qContaCartoesCONTACARTOES.Value) + '.jpg';
               NomeArquivo   := IntToStr(DM.qCartaoFirmaCODIGO.Value) + '_' + IntToStr(qContaCartoesCONTACARTOES.Value) + '.jpg';
              end else begin
                        CaminhoBanco  := DM.qParametroPAR_DIR_LOCAL_SALVA.Value + '\CARTORIO\CARTOES_FIRMA_SCRC\' + IntToStr(DM.qCartaoFirmaCODIGO.Value) + '.jpg';
                        NomeArquivo   := IntToStr(DM.qCartaoFirmaCODIGO.Value) + '.jpg';
                       end;
          CaminhoFisico := DM.qParametroPAR_DIR_LOCAL_SALVA.Value + '\CARTORIO\CARTOES_FIRMA_SCRC\';
       end else begin
                 if (qContaCartoesCONTACARTOES.Value > 1)
                 then begin
                       CaminhoBanco  := 'T:\CARTORIO\CARTOES_FIRMA_SCRC\' + IntToStr(DM.qCartaoFirmaCODIGO.Value) + '_' + IntToStr(qContaCartoesCONTACARTOES.Value) + '.jpg';
                       NomeArquivo   := IntToStr(DM.qCartaoFirmaCODIGO.Value) + '_' + IntToStr(qContaCartoesCONTACARTOES.Value) + '.jpg';
                      end else begin
                                CaminhoBanco  := 'T:\CARTORIO\CARTOES_FIRMA_SCRC\' + IntToStr(DM.qCartaoFirmaCODIGO.Value) + '.jpg';
                                NomeArquivo   := IntToStr(DM.qCartaoFirmaCODIGO.Value) + '.jpg';
                               end;
                  CaminhoFisico := 'T:\CARTORIO\CARTOES_FIRMA_SCRC\';
                end;

   if (DM.qCartaoFirmaIMAGEM_CAMINHO.Value <> '')
   then begin

          qHistCartaoFirma.Close;
          qHistCartaoFirma.Sql.Clear;
          qHistCartaoFirma.Sql.Add('INSERT INTO cartao_firma_historico (CODIGO, DTABER, NOME, NUMOR, STATUS, CDPESS, IMAGEM, DATA_ALTERACAO) VALUES ');
          qHistCartaoFirma.Sql.Add('(:NEW.CODIGO, :NEW.DTABER, :NEW.NOME, :NEW.NUMOR, :NEW.STATUS, :NEW.CDPESS, :NEW.IMAGEM_CAMINHO, current_date) ');
          qHistCartaoFirma.Parameters.ParamByName('NEW.CODIGO').Value         := DM.qCartaoFirmaCODIGO.Value;
          qHistCartaoFirma.Parameters.ParamByName('NEW.DTABER').Value         := DM.qCartaoFirmaDTABER.Value;
          qHistCartaoFirma.Parameters.ParamByName('NEW.NOME').Value           := DM.qCartaoFirmaNOME.Value;
          qHistCartaoFirma.Parameters.ParamByName('NEW.NUMOR').Value          := DM.qCartaoFirmaNUMOR.Value;
          qHistCartaoFirma.Parameters.ParamByName('NEW.STATUS').Value         := DM.qCartaoFirmaSTATUS.Value;
          qHistCartaoFirma.Parameters.ParamByName('NEW.CDPESS').Value         := DM.qCartaoFirmaCDPESS.Value;
          qHistCartaoFirma.Parameters.ParamByName('NEW.IMAGEM_CAMINHO').Value := DM.qCartaoFirmaIMAGEM_CAMINHO.Value;
          qHistCartaoFirma.ExecSql;
        end;


   DM.qTempCartaoFirma.Close;
   DM.qTempCartaoFirma.Sql.Clear;
   DM.qTempCartaoFirma.Sql.Add('UPDATE CARTAO_FIRMA c SET C.IMAGEM_CAMINHO = null WHERE c.CODIGO = :Cartao');
   DM.qTempCartaoFirma.Parameters.ParamByName('Cartao').Value := DM.qCartaoFirmaCODIGO.Value;
   DM.qTempCartaoFirma.ExecSql;

   DM.qTempCartaoFirma.Active := False;
   DM.qTempCartaoFirma.Sql.Clear;
   DM.qTempCartaoFirma.Sql.Add('UPDATE CARTAO_FIRMA c SET C.IMAGEM_CAMINHO = :Caminho WHERE c.CODIGO = :Cartao');

   Bmp := TBitmap.Create;
   Bmp.Assign(Image.Picture.Graphic);
   Jpg := TJpegImage.Create;
   Jpg.Assign(Bmp);
   Jpg.Compress;
   Stm := TMemoryStream.Create;
   Jpg.SaveToStream(Stm);
   Stm.Position := 0;


   DM.qTempCartaoFirma.Parameters.ParamByName('Caminho').Value := CaminhoBanco;
   DM.qTempCartaoFirma.Parameters.ParamByName('Cartao').Value  := DM.qCartaoFirmaCODIGO.Value;

   // Limpar o arquivo do Cartão no Diretório padrão.
   Deletefile(CaminhoBanco);

   Stm.SaveToFile(ChangeFileExt(CaminhoFisico, NomeArquivo));
   Stm.Free;
   Jpg.Free;
   Bmp.Free;

   DM.qTempCartaoFirma.ExecSql;
   DM.qTempCartaoFirma.Close;

   sbSalvar.Enabled := False;
end;

procedure TfCartaoFirmaImgNew.SpeedButton1Click(Sender: TObject);
begin
  {Scaneando}
if ImageEnView.io.SelectAcquireSource then
begin
  ImageEnView.io.Acquire;
  ImageEnView.Stretch;
  Image.Picture.Bitmap.Assign(ImageEnView.Bitmap);
  Image.Update;
end;
sbSalvar.Enabled := True;

end;

procedure TfCartaoFirmaImgNew.sbFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfCartaoFirmaImgNew.FormShow(Sender: TObject);
begin
 DM.qParametro.Open;
 ExibeImgNew;
end;

procedure TfCartaoFirmaImgNew.ExibeImgNew;
var
  CaminhoBanco : String;
begin
  CaminhoBanco  := '';
  CaminhoBanco  := DM.qCartaoFirmaIMAGEM_CAMINHO.Value;

  try
   Image.Picture.LoadFromFile(CaminhoBanco);
  except
    ShowMessage('Não existe imagem digitalizada para esse Cartão!');
  end;
end;

end.
