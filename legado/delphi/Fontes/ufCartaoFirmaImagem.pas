unit ufCartaoFirmaImagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, DBCtrls, DB, Jpeg, dbclient, Provider,
  FMTBcd, SqlExpr, IniFiles, StdCtrls, Data.DBXInterBase, Data.DBXFirebird, Data.DBXCommon,
  Data.Win.ADODB, hyieutils, hyiedefs, iesettings, imageenio, iemio,
  imageenproc, ieview, imageenview, imageen, RLReport;

const 
  OffsetMemoryStream : Int64 = 0;
type
  TfCartaoFirmaImagem = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    sbSalvar: TSpeedButton;
    sbImagem: TSpeedButton;
    SQLDataSet: TSQLDataSet;
    SQLConnection: TSQLConnection;
    SQLDataSetCODIGO: TIntegerField;
    SQLDataSetDTABER: TDateField;
    SQLDataSetNOME: TStringField;
    SQLDataSetNUMOR: TIntegerField;
    SQLDataSetSTATUS: TStringField;
    SQLDataSetCDPESS: TIntegerField;
    SQLDataSetIMAGEM: TMemoField;
    qTempCartaoFirma: TADOQuery;
    ImageEnView: TImageEnView;
    Image: TImage;
    procedure sbSalvarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure ExibeFoto(DataSet : TDataSet; BlobFieldName : String; ImageExibicao : TImage);
    procedure FormShow(Sender: TObject);
    procedure ConectaFireBird(CaminhoIni: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCartaoFirmaImagem: TfCartaoFirmaImagem;
  MemoryStream : TMemoryStream;
  Jpg : TJpegImage;
  Bitmap : TBitmap;

implementation

uses ufDM, ufCartaoFirma, Especificacao_SIGEX;

{$R *.DFM}

const
  TempFileName = 'temp.jpg';

procedure TfCartaoFirmaImagem.ConectaFireBird(CaminhoIni: String);
var ArquivoIni : TIniFile;
    CaminhoBanco : String;
begin
   if FileExists(CaminhoIni + 'SCRC.ini') then begin
      //Cria o arquivo Ini
      ArquivoIni := TIniFile.Create(CaminhoIni + 'SCRC.ini');
      //Pega o caminho do banco de dados informado no arquivo Ini
      CaminhoBanco := ArquivoIni.ReadString('CONFIGURACAO','DATABASE',CaminhoBanco);
      try
        SQLConnection.Connected          := False;
        SQLConnection.DriverName         := 'FIREBIRD';
        SQLConnection.GetDriverFunc      := 'getSQLDriverINTERBASE';
        SQLConnection.LibraryName        := 'dbxfb.dll';
        SQLConnection.VendorLib          := 'fbclient.dll';
        SQLConnection.LoginPrompt        := false;
        SQLConnection.LoadParamsOnConnect:= False;

        SQLConnection.Params.Clear;
        SQLConnection.Params.Add('DriverName=FIREBIRD');
        SQLConnection.Params.Add(TDBXPropertyNames.DriverUnit+'=DBXFirebird');
        SQLConnection.Params.Add('Database='+CaminhoBanco);
        SQLConnection.Params.Add('Role=RoleName');
        SQLConnection.Params.Add('User_Name=sysdba');
        SQLConnection.Params.Add('Password=masterkey');
        SQLConnection.Params.Add('ServerCharSet=ISO8859_1');
        SQLConnection.Params.Add('SQLDialect=3');
        SQLConnection.Params.Add('ErrorResourceFile=');
        SQLConnection.Params.Add('LocaleCode=0000');
        SQLConnection.Params.Add('BlobSize=-1');
        SQLConnection.Params.Add('CommitRetain=False');
        SQLConnection.Params.Add('IsolationLevel=ReadCommitted');
        SQLConnection.Params.Add('Trim Char=False');
        SQLConnection.Params.Add('WaitOnLocks=True');
        SQLConnection.LoginPrompt := False;
        SQLConnection.Connected := True;
      except
         SQLConnection.Connected := False;
         ShowMessage('Erro ao conectar no banco de dados, verifique o arquivo SCRC.ini');
      end;
      ArquivoIni.Free;

   end else begin
      ShowMessage('Não foi possível encontrar o arquivo SCRC.ini');
   end;
end;

procedure TfCartaoFirmaImagem.sbSalvarClick(Sender: TObject);
var
  Jpg: TJpegImage;
  Stm: TMemoryStream;
  Bmp: TBitmap;
begin
   DM.qTempCartaoFirma.Close;
   DM.qTempCartaoFirma.Sql.Clear;
   DM.qTempCartaoFirma.Sql.Add('UPDATE CARTAO_FIRMA c SET C.IMAGEM = null WHERE c.CODIGO = :Cartao');
   DM.qTempCartaoFirma.Parameters.ParamByName('Cartao').Value := DM.qCartaoFirmaCODIGO.Value;
   DM.qTempCartaoFirma.ExecSql;

   DM.qTempCartaoFirma.Active := False;
   DM.qTempCartaoFirma.Sql.Clear;
   DM.qTempCartaoFirma.Sql.Add('UPDATE CARTAO_FIRMA c SET C.IMAGEM = :Imagem WHERE c.CODIGO = :Cartao');

   Bmp := TBitmap.Create;
   Bmp.Assign(Image.Picture.Graphic);
   Jpg := TJpegImage.Create;
   Jpg.Assign(Bmp);
   Jpg.Compress;
   Stm := TMemoryStream.Create;
   Jpg.SaveToStream(Stm);
   Stm.Position := 0;


   DM.qTempCartaoFirma.Parameters.ParamByName('Imagem').LoadFromStream(Stm, ftGraphic);
   DM.qTempCartaoFirma.Parameters.ParamByName('Cartao').Value := DM.qCartaoFirmaCODIGO.Value;


   Stm.SaveToFile(ChangeFileExt('C:\Suporte\temp_imagem', '.jpg'));
   Stm.Free;
   Jpg.Free;
   Bmp.Free;

   DM.qTempCartaoFirma.ExecSql;
   DM.qTempCartaoFirma.Close;

   sbSalvar.Enabled := False;
end;

procedure TfCartaoFirmaImagem.ExibeFoto(DataSet : TDataSet; BlobFieldName : String; ImageExibicao : TImage);
begin
SQLDataSet.Close;
SQLDataSet.ParamByName('Codigo').Value := DM.qCartaoFirmaCODIGO.Value;
SQLDataSet.Open;

if not(DataSet.IsEmpty) and not (SQLDataSetIMAGEM.Value = '') then
  try
    MemoryStream := TMemoryStream.Create;
    Jpg := TJpegImage.Create;
    SQLDataSetIMAGEM.SaveToStream(MemoryStream);
    MemoryStream.Position := OffsetMemoryStream;
    Jpg.LoadFromStream(MemoryStream);
    ImageExibicao.Picture.Assign(Jpg);
  finally
    Jpg.Free;
    MemoryStream.Free;
  end
else
  ImageExibicao.Picture := Nil;
end;

procedure TfCartaoFirmaImagem.SpeedButton1Click(Sender: TObject);
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

procedure TfCartaoFirmaImagem.sbFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfCartaoFirmaImagem.FormShow(Sender: TObject);
begin
ConectaFireBird(extractfilepath(ParamStr(0)));
ExibeFoto(dm.qCartaoFirma,'IMAGEM',Image);

end;

end.
