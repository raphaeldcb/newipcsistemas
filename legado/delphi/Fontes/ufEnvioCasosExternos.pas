unit ufEnvioCasosExternos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, dbcgrids, DBCtrls, StdCtrls, ExtCtrls, Grids, DBGrids,
  RLReport, RLFilters, RLPDFFilter, DB, ADODB, Sockets,  MaskUtils, StrUtils,
  jpeg, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdFTP, IdFTPCommon, Math,
  Menus, Mask, COMobj, DateUtils, HTTPApp, WinInet, pngimage,
  JvExControls, JvDBLookup, JvExMask, JvToolEdit;

type
  TfEnvioCasosExternos = class(TForm)
    sbConsultar: TSpeedButton;
    RLPDFFilter1: TRLPDFFilter;
    qLimpaXMarcados: TADOQuery;
    qListaProcessos: TADOQuery;
    ds_ListaProcessos: TDataSource;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    qAgrupaProcessos: TADOQuery;
    qAjustaDatas: TADOQuery;
    sbTodos: TSpeedButton;
    GroupBox3: TGroupBox;
    sbEnviarCasos: TSpeedButton;
    qRelLaudo: TADOQuery;
    dsRelLaudo: TDataSource;
    TcpClient: TIdTCPClient;
    qIncluiProtocolo: TADOQuery;
    qSelecionaCasosMapas: TADOQuery;
    qSelecionaCasosMapasPRO_COD: TIntegerField;
    qSelecionaCasosMapasPRO_DCAD: TDateField;
    qSelecionaCasosMapasPES_COD: TIntegerField;
    qSelecionaCasosMapasLAB_COD: TIntegerField;
    qSelecionaCasosMapasMED_CRM: TStringField;
    qSelecionaCasosMapasEXA_COD: TStringField;
    qSelecionaCasosMapasPRO_DCOL: TDateField;
    qSelecionaCasosMapasPRO_DENT: TDateField;
    qSelecionaCasosMapasPRO_GENO: TStringField;
    qSelecionaCasosMapasPRO_VLOG: TBCDField;
    qSelecionaCasosMapasPRO_RESUL: TStringField;
    qSelecionaCasosMapasPRO_OBS: TStringField;
    qSelecionaCasosMapasPRO_UINT: TBCDField;
    qSelecionaCasosMapasPRO_CMLI: TBCDField;
    qSelecionaCasosMapasPRO_PROT: TStringField;
    qSelecionaCasosMapasPRO_APA: TStringField;
    qSelecionaCasosMapasPRO_DREC: TDateField;
    qSelecionaCasosMapasPRO_ATEND: TStringField;
    qSelecionaCasosMapasPRO_TIPR: TStringField;
    qSelecionaCasosMapasPRO_HCAD: TStringField;
    qSelecionaCasosMapasPRO_VALOR: TBCDField;
    qSelecionaCasosMapasPRO_HCOL: TTimeField;
    qSelecionaCasosMapasPRO_FG_RESUL: TSmallintField;
    qSelecionaCasosMapasPRO_PRAZO: TStringField;
    qSelecionaCasosMapasPRO_IDWEB: TSmallintField;
    qDeletaProcesso: TADOQuery;
    qConsultaHash: TADOQuery;
    qConsultaHashPRO_COD: TIntegerField;
    qConsultaHashPRO_DCAD: TDateField;
    qConsultaHashPES_COD: TIntegerField;
    qConsultaHashLAB_COD: TIntegerField;
    qConsultaHashMED_CRM: TStringField;
    qConsultaHashEXA_COD: TStringField;
    qConsultaHashPRO_DCOL: TDateField;
    qConsultaHashPRO_DENT: TDateField;
    qConsultaHashPRO_GENO: TStringField;
    qConsultaHashPRO_VLOG: TBCDField;
    qConsultaHashPRO_RESUL: TStringField;
    qConsultaHashPRO_OBS: TStringField;
    qConsultaHashPRO_UINT: TBCDField;
    qConsultaHashPRO_CMLI: TBCDField;
    qConsultaHashPRO_PROT: TStringField;
    qConsultaHashPRO_APA: TStringField;
    qConsultaHashPRO_DREC: TDateField;
    qConsultaHashPRO_ATEND: TStringField;
    qConsultaHashPRO_TIPR: TStringField;
    qConsultaHashPRO_HCAD: TStringField;
    qConsultaHashPRO_VALOR: TBCDField;
    qConsultaHashPRO_HCOL: TTimeField;
    qConsultaHashPRO_FG_RESUL: TSmallintField;
    qConsultaHashPRO_PRAZO: TStringField;
    qConsultaHashPRO_IDWEB: TSmallintField;
    qConsultaHashPRO_TIPPAG: TStringField;
    qConsultaHashPRO_HASH: TStringField;
    qRelLaudoPRO_HASH: TStringField;
    qRelLaudoPRO_PRAZO: TStringField;
    qRelLaudoPRO_COD: TIntegerField;
    qRelLaudoPES_DNAS: TDateField;
    qRelLaudoPES_PASS: TStringField;
    qRelLaudoLAB_LABT: TStringField;
    qRelLaudoPRO_RESUL: TStringField;
    qRelLaudoPRO_RESUL_I: TStringField;
    qRelLaudoPRO_DCOL_I: TStringField;
    qRelLaudoPRO_DCOL: TDateField;
    qRelLaudoLAB_COD_INTERNET: TSmallintField;
    qRelLaudoLAB_RESUL_INTERNET: TSmallintField;
    qRelLaudoPES_CPF: TStringField;
    qRelLaudoPES_COD: TIntegerField;
    qRelLaudoPRO_HCOL: TTimeField;
    qRelLaudoPRO_HCOL_I: TStringField;
    qRelLaudoPRO_RESUL2: TStringField;
    qRelLaudoPRO_RESUL_I2: TStringField;
    qRelLaudoPRO_RESUL3: TStringField;
    qRelLaudoPRO_RESUL_I3: TStringField;
    qRelLaudoPRO_RESUL4: TStringField;
    qRelLaudoPRO_RESUL_I4: TStringField;
    qRelLaudoEXA_COD: TStringField;
    qRelLaudoPRO_PROT: TStringField;
    qManutencao: TADOQuery;
    qRelLaudoPRO_FG_SITE: TIntegerField;
    qRelLaudoPES_NOME: TStringField;
    DateEditInicial: TJvDateEdit;
    DateEditFinal: TJvDateEdit;
    DBGrid: TDBGrid;
    qProcesso: TADOQuery;
    qProcessoPRO_COD: TIntegerField;
    qProcessoPRO_ANO: TIntegerField;
    qProcessoPRO_TIPO: TIntegerField;
    qProcessoPRO_AUTO: TStringField;
    qProcessoUF_SIGLA: TStringField;
    qProcessoCOM_COD: TIntegerField;
    qProcessoVAR_COD: TIntegerField;
    qProcessoLCO_COD: TIntegerField;
    qProcessoPRO_HCOLE: TStringField;
    qProcessoPRO_DCOLE: TDateField;
    qProcessoPRO_HREC: TStringField;
    qProcessoPRO_DREC: TDateField;
    qProcessoPRO_DRESU: TDateField;
    qProcessoPRO_SIT: TIntegerField;
    qProcessoPRO_NCOMP: TIntegerField;
    qProcessoPRO_RESUL: TIntegerField;
    qProcessoPRO_PROB: TStringField;
    qProcessoPRO_ARETI: TStringField;
    qProcessoCAS_CODIGO: TStringField;
    qProcessoJUI_COD: TIntegerField;
    qProcessoPRO_NPERC: TStringField;
    qProcessoFG_PROP: TStringField;
    qProcessoPRO_USUCAD: TStringField;
    qProcessoPRO_NUMLAUDO: TStringField;
    qProcessoPRO_RASTREAR: TStringField;
    qProcessoPRO_CARREGACREDITO: TStringField;
    qProcessoPRO_CREDITODNA: TStringField;
    qProcessoPRO_HTREC: TStringField;
    qProcessoPRO_LACRE: TStringField;
    DS_Processo: TDataSource;
    qListaProcessosSEQUENCIAL: TLargeintField;
    qListaProcessosPRO_COD: TIntegerField;
    qListaProcessosPRO_NPERC: TStringField;
    qListaProcessosCAS_CODIGO: TStringField;
    qListaProcessosTIPO: TStringField;
    qListaProcessosPRO_DREC: TDateField;
    qListaProcessosPRO_FG_RESUL: TIntegerField;
    qAjustaSequencial: TADOQuery;
    qAgrupaProcessosPRO_COD: TIntegerField;
    qAgrupaProcessosPRO_ANO: TIntegerField;
    qAgrupaProcessosPRO_NPERC: TStringField;
    qAgrupaProcessosPRO_TIPO: TIntegerField;
    qAgrupaProcessosPRO_AUTO: TStringField;
    qAgrupaProcessosUF_SIGLA: TStringField;
    qAgrupaProcessosCAS_CODIGO: TStringField;
    qAgrupaProcessosCOM_COD: TIntegerField;
    qAgrupaProcessosVAR_COD: TIntegerField;
    qAgrupaProcessosLCO_COD: TIntegerField;
    qAgrupaProcessosPRO_HCOLE: TStringField;
    qAgrupaProcessosPRO_DCOLE: TDateField;
    qAgrupaProcessosPRO_HREC: TStringField;
    qAgrupaProcessosPRO_DREC: TDateField;
    qAgrupaProcessosPRO_DRESU: TDateField;
    qAgrupaProcessosPRO_SIT: TIntegerField;
    qAgrupaProcessosPRO_NCOMP: TIntegerField;
    qAgrupaProcessosPRO_RESUL: TIntegerField;
    qAgrupaProcessosPRO_PROB: TStringField;
    qAgrupaProcessosPRO_ARETI: TStringField;
    qAgrupaProcessosJUI_COD: TIntegerField;
    qAgrupaProcessosFG_PROP: TStringField;
    qAgrupaProcessosPRO_USUCAD: TStringField;
    qAgrupaProcessosPRO_NUMLAUDO: TStringField;
    qAgrupaProcessosPRO_RASTREAR: TStringField;
    qAgrupaProcessosPRO_CARREGACREDITO: TStringField;
    qAgrupaProcessosPRO_CREDITODNA: TStringField;
    qAgrupaProcessosPRO_HTREC: TStringField;
    qAgrupaProcessosPRO_LACRE: TStringField;
    qAgrupaProcessosPRO_FG_RESUL: TIntegerField;
    qGravaProcesso: TADOQuery;
    qProcessoPRO_FG_RESUL: TIntegerField;
    qProcessoPRO_COD_1: TIntegerField;
    qProcessoPES_COD: TIntegerField;
    qProcessoPES_NOME: TStringField;
    qProcessoPES_INICIAIS: TStringField;
    qProcessoPES_SIT: TIntegerField;
    qProcessoPES_DTNAS: TDateField;
    qProcessoPES_LCNAS: TStringField;
    qProcessoPES_SEXO: TStringField;
    qProcessoPES_TDOC: TStringField;
    qProcessoPES_NDOC: TStringField;
    AjustaFGExterno: TADOQuery;
    BFechar: TSpeedButton;
    qListaProcessosPRO_FG_EXTERNO: TStringField;
    sbRelatorio: TSpeedButton;
    qrp_Dados: TRLReport;
    RLBand2: TRLBand;
    RLLabel3: TRLLabel;
    RLL_Titulo: TRLLabel;
    RLLabel5: TRLLabel;
    RLSystemInfo4: TRLSystemInfo;
    RLSystemInfo5: TRLSystemInfo;
    RLLabel6: TRLLabel;
    RLBand3: TRLBand;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel11: TRLLabel;
    RLBand4: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    qListaProcessosPRO_DATA_EXTERNO: TDateField;
    RLLabel1: TRLLabel;
    RLDBText2: TRLDBText;
    RLBand1: TRLBand;
    RLDBResult1: TRLDBResult;
    ds_RelProcessos: TDataSource;
    qRelProcessos: TADOQuery;
    qRelProcessosSEQUENCIAL: TLargeintField;
    qRelProcessosPRO_COD: TIntegerField;
    qRelProcessosPRO_NPERC: TStringField;
    qRelProcessosCAS_CODIGO: TStringField;
    qRelProcessosTIPO: TStringField;
    qRelProcessosPRO_DREC: TDateField;
    qRelProcessosPRO_FG_RESUL: TIntegerField;
    qRelProcessosPRO_FG_EXTERNO: TStringField;
    qRelProcessosPRO_DATA_EXTERNO: TDateField;
    RLLabel2: TRLLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    JvDtEdt_Envio: TJvDateEdit;
    qRelProcessosExt: TADOQuery;
    qRelProcessosExtSEQUENCIAL: TLargeintField;
    qRelProcessosExtPRO_COD: TIntegerField;
    qRelProcessosExtPRO_NPERC: TStringField;
    qRelProcessosExtCAS_CODIGO: TStringField;
    qRelProcessosExtTIPO: TStringField;
    qRelProcessosExtPRO_DREC: TDateField;
    qRelProcessosExtPRO_FG_RESUL: TIntegerField;
    qRelProcessosExtPRO_FG_EXTERNO: TStringField;
    qRelProcessosExtPRO_DATA_EXTERNO: TDateField;
    ds_RelProcessosExt: TDataSource;
    qrp_DadosExt: TRLReport;
    RLBand5: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel12: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel13: TRLLabel;
    RLBand6: TRLBand;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLBand7: TRLBand;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLBand8: TRLBand;
    RLDBResult2: TRLDBResult;
    RLLabel19: TRLLabel;
    pm_Relatorio: TPopupMenu;
    DatadeRecepeo1: TMenuItem;
    N1: TMenuItem;
    DatadeEnvio1: TMenuItem;
    procedure BFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbConsultarClick(Sender: TObject);
    procedure qListaProcedimentosLAB_FG_EXPORTAGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    Function MesExtenso( Mes:Word ) : string;
    procedure sbTodosClick(Sender: TObject);
    procedure ftpsend(host, username, password, filefrom, fileto: string;
 port: integer);
    function GetStrNumber(const S: string): string;
    procedure sbEnviarCasosClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DatadeRecepeo1Click(Sender: TObject);
    procedure DatadeEnvio1Click(Sender: TObject);
    procedure sbRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEnvioCasosExternos: TfEnvioCasosExternos;
  f_false, f_true, f_NomeDoc, f_Troca, f_Var, f_NomeSalva :OleVariant;
  Ano, Mes, Dia : Word;
  Sequencial, AnoS, Data_Mapa, AnoA, MesA, DiaA : String;

implementation

uses ufDMR, ufDMI, ufDM, ufConsultaLaboratorios, ufPacientes,
  ufImprimeComprovante, ufImprimeLaudo, ufImprimeLaudo2;



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


procedure TfEnvioCasosExternos.BFecharClick(Sender: TObject);
begin
with qLimpaXMarcados do
begin
Close;
SQL.Clear;
SQL.Add(' update TB_PROCESSO p set p.PRO_FG_RESUL = :Valor ');
Parameters.ParamByName('Valor').Value := 0;
ExecSQL;
end;

Close;
end;

function TfEnvioCasosExternos.MesExtenso( Mes:Word ) : string; const meses : array[0..11] of PChar = ('janeiro', 'fevereiro', 'março', 'abril', 'maio', 'junho', 'julho', 'agosto', 'setembro','outubro', 'novembro', 'dezembro');
begin
result := meses[mes-1];
End;


procedure TfEnvioCasosExternos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
with qLimpaXMarcados do
begin
Close;
SQL.Clear;
SQL.Add(' update TB_PROCESSO p set p.PRO_FG_RESUL = :Valor ');
Parameters.ParamByName('Valor').Value := 0;
ExecSQL;
end;
Close;
end;

procedure TfEnvioCasosExternos.FormShow(Sender: TObject);
begin
   DMI.qLaboratorios.Open;
   DMI.qExames.Open;

   DateEditInicial.Clear;
   DateEditInicial.Date := Date;
   DateEditFinal.Clear;
   DateEditFinal.Date   := Date;
end;


procedure TfEnvioCasosExternos.ftpsend(host, username, password, filefrom, fileto: string;port: integer);
var
 ftp: TIdFTP;
 ms: TMemoryStream;
begin
 ftp := TIdFTP.Create(Application);
 ms := TMemoryStream.Create;
 try
 try
 ftp.host := host; // Endereço do servidor FTP
 ftp.port := port;
 ftp.username := username; // Parametro nome usuario servidor FTP
 ftp.password := password; // Parametro senha servidor FTP
 ftp.Passive  := true;
 ftp.TransferType := ftBinary;
 ftp.Connect();
 AssErt(ftp.Connected);
 ftp.ChangeDir('/arq/'); // Definir a pasta no servidor
 ftp.Put(filefrom, fileto, false); // Transferir o arquivo para o servidor
 ftp.Size(filefrom);
 if (ftp.Size(fileto) <=0)
 then begin
       MessageDlg('Esse Laudo precisa ser Liberado novamente: ' + fileto,mtError,[mbOk],0);
      end;
 finally
 ms.Free;

ftp.Free;
 end;
 except
 ShowMessage('Uma tentativa de enviar um arquivo para o servidor falhou');
 end;
end;


procedure TfEnvioCasosExternos.qListaProcedimentosLAB_FG_EXPORTAGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
Text := EmptyStr;
end;

procedure TfEnvioCasosExternos.sbTodosClick(Sender: TObject);
begin
qListaProcessos.First;
while qListaProcessos.Eof = False do
begin
  with qLimpaXMarcados do
  begin
  Close;
  SQL.Clear;
  SQL.Add(' update TB_PROCESSO p set p.PRO_FG_RESUL = :Valor where p.PRO_COD = :Codigo ');
  Parameters.ParamByName('Valor').Value  := 1;
  Parameters.ParamByName('Codigo').Value := qListaProcessosPRO_COD.Value;
  ExecSQL;
  end;
  qListaProcessos.Next
end;
sbConsultar.Click;
end;

procedure TfEnvioCasosExternos.sbConsultarClick(Sender: TObject);
var NomePDF, NomeInformado, Nome : String;
    Contador : Integer;
begin

with qAjustaSequencial do
begin
  Close;
  SQL.Clear;
  SQL.Add(' alter sequence GRID_LINHAS restart with 0 ');
  ExecSQL;
end;

qListaProcessos.Close;
//Grid.Visible := False;

if ((DateEditInicial.Date = 0))
then begin
      ShowMessage('Favor informar pelo menos um parâmetro para pesquisar!!');
     end else begin
                Contador := 0;
                qListaProcessos.Close;
                qListaProcessos.Parameters.ParamByName('DATAINI').Value := DateEditInicial.Date;
                qListaProcessos.Parameters.ParamByName('DATAFIN').Value := DateEditFinal.Date;
                qListaProcessos.Open;
                qRelProcessos.Close;
                qRelProcessos.Parameters.ParamByName('DATAINI').Value := DateEditInicial.Date;
                qRelProcessos.Parameters.ParamByName('DATAFIN').Value := DateEditFinal.Date;
                qRelProcessos.Open;
                qRelProcessosExt.Close;
                qRelProcessosExt.Parameters.ParamByName('DATAINI').Value := DateEditInicial.Date;
                qRelProcessosExt.Parameters.ParamByName('DATAFIN').Value := DateEditFinal.Date;
                qRelProcessosExt.Open;
              end;

if (qListaProcessos.RecordCount > 0)
then begin
      sbEnviarCasos.Enabled     := True;
      sbRelatorio.Enabled       := True;
    end else ShowMessage('Dados não foram encontrados!');
end;

function TfEnvioCasosExternos.GetStrNumber(const S: string): string;
var
  vText : PChar;
begin
  vText := PChar(S);
  Result := '';

  while (vText^ <> #0) do
  begin
    {$IFDEF UNICODE}
    if CharInSet(vText^, ['0'..'9']) then
    {$ELSE}
    if vText^ in ['0'..'9'] then
    {$ENDIF}
      Result := Result + vText^;

    Inc(vText);
  end;
end;

procedure TfEnvioCasosExternos.sbEnviarCasosClick(Sender: TObject);
var DataHoje, AnoN, DiaN, AnoD, AnoA, MesA, DiaA, NomeLaudoPDF, Desc_Sensibilidade, Resultado, CPF, DataLiberacao : String;
    Linha, CodigoUsuario : Integer;
    Ano, Mes, Dia : Word;
    DataGerada : TDateTime;
begin

if ((JvDtEdt_Envio.Date > 0) or (JvDtEdt_Envio.Text <> '  /  /    '))
then begin
          DecodeDate (Date, Ano, Mes, Dia);
          AnoA := IntToStr(Ano);
          MesA := MesExtenso(Mes);
          DiaA := IntToStr(Dia);
          if DiaA = IntToStr(1)
          then begin
          DiaA := 'Primeiro';
          end;

          if (DiaA <> 'Primeiro')
          then begin
                DiaN     := Format('%.2d',[Dia]);
                DataHoje := Format('%.2d',[Dia]) +' de '+ MesA +' de '+ AnoA + '.';
               end else begin
                         DiaN     := '01';
                         DataHoje := DiaA +' de '+ MesA +' de '+ AnoA + '.';
                        end;

          if MessageDlg(' Confirma o ENVIO? ',mtconfirmation,[mbyes,mbno],0) = mryes
          then begin
                qAgrupaProcessos.Close;
                qAgrupaProcessos.SQL.Clear;
                qAgrupaProcessos.SQL.Add(' select * from tb_PROCESSO p');
                qAgrupaProcessos.SQL.Add(' where p.PRO_FG_RESUL = :Valor ');
                qAgrupaProcessos.Parameters.ParamByName('Valor').Value := 1;
                qAgrupaProcessos.open;


                qAgrupaProcessos.First;
                while qAgrupaProcessos.Eof = False  do
                begin

                  qProcesso.Close;
                  qProcesso.Parameters.ParamByName('Processo').Value := qAgrupaProcessosPRO_COD.Value;
                  qProcesso.Open;

                  DMI.ADOC_MYSQL.Connected := True;
                  with qDeletaProcesso do
                  begin
                    Close;
                    SQL.Clear;
                    SQL.Add(' delete from rdcbco37_resultados.tb_processos_ipcms where processado = 0 and codigo = :Codigo');
                    Parameters.ParamByName('Codigo').Value := qProcessoPRO_COD.Value;
                    ExecSQL;
                  end;

                  qProcesso.First;
                  while qProcesso.Eof = False  do
                  begin
                     with qGravaProcesso do
                     begin
                       Close;
                       SQL.Clear;
                       SQL.Add(' INSERT INTO rdcbco37_resultados.tb_processos_ipcms (exame, codigo, datacoleta, datarecepacao, data_add, nome, vinculo, datanascimento, localnascimento, sexo, tipodoc, numerodoc, datacadastro, processado) VALUES (:exame,:codigo, :datacoleta, :datarecepacao, now(), :nome, :vinculo, :datanascimento, :localnascimento, :sexo, :tipodoc, :numerodoc, :datacadastro, 0)');

                       Parameters.ParamByName('exame').Value          := qProcessoCAS_CODIGO.Value;
                       Parameters.ParamByName('codigo').Value         := qProcessoPRO_COD.Value;
                       Parameters.ParamByName('datacoleta').Value     := DateToStr(qProcessoPRO_DCOLE.Value);
                       Parameters.ParamByName('datarecepacao').Value  := DateToStr(qProcessoPRO_DREC.Value);
                       Parameters.ParamByName('datacadastro').Value   := DateToStr(JvDtEdt_Envio.Date);
                       Parameters.ParamByName('nome').Value           := qProcessoPES_NOME.Value;
                       Parameters.ParamByName('vinculo').Value        := qProcessoPES_SIT.Value;
                       Parameters.ParamByName('datanascimento').Value := DateToStr(qProcessoPES_DTNAS.Value);
                       Parameters.ParamByName('localnascimento').Value:= qProcessoPES_LCNAS.Value;
                       Parameters.ParamByName('sexo').Value           := qProcessoPES_SEXO.Value;
                       Parameters.ParamByName('tipodoc').Value        := qProcessoPES_TDOC.Value;
                       Parameters.ParamByName('numerodoc').Value      := qProcessoPES_NDOC.Value;

                       ExecSQL;
                      end;
                      qProcesso.Next;
                  end;
                  qGravaProcesso.Close;
                  DMI.ADOC_MYSQL.Connected := False;

                  with AjustaFGExterno do
                  begin
                    Close;
                    SQL.Clear;
                    SQL.Add(' update tb_PROCESSO p set p.PRO_FG_EXTERNO = :Valor, p.PRO_DATA_EXTERNO = :Data where p.PRO_COD = :Codigo ');
                    Parameters.ParamByName('Valor').Value  := 1;
                    Parameters.ParamByName('Data').Value   := JvDtEdt_Envio.Date;
                    Parameters.ParamByName('Codigo').Value := qAgrupaProcessosPRO_COD.Value;
                    ExecSQL;
                  end;
                  qAgrupaProcessos.Next;
                 end;
                end;
        ShowMessage('ENVIO finalizado!');
        with qLimpaXMarcados do
        begin
          Close;
          SQL.Clear;
          SQL.Add(' update tb_PROCESSO p set p.PRO_FG_RESUL = :Valor');
          Parameters.ParamByName('Valor').Value  := 0;
          ExecSQL;
        end;
        sbConsultar.Click;
      end else begin
                ShowMessage('Favor informar a Data para Envio do Caso, para integração!');
                JvDtEdt_Envio.SetFocus;
               end;
end;

procedure TfEnvioCasosExternos.sbRelatorioClick(Sender: TObject);
begin
  with TButton(Sender).ClientToScreen(point(0, TButton(Sender).Height)) do pm_Relatorio.Popup(X, Y);
end;

procedure TfEnvioCasosExternos.DatadeEnvio1Click(Sender: TObject);
begin
 qRelProcessosExt.Close;
 qRelProcessosExt.Open;
 qrp_DadosExt.Preview(nil);
end;

procedure TfEnvioCasosExternos.DatadeRecepeo1Click(Sender: TObject);
begin
 qRelProcessos.Close;
 qRelProcessos.Open;
 qrp_Dados.Preview(nil);
end;

procedure TfEnvioCasosExternos.DBGridDblClick(Sender: TObject);
begin
  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  (Sender as TDBGrid).DataSource.Dataset.Edit;

  (Sender as TDBGrid).DataSource.Dataset.FieldByName('PRO_FG_RESUL').AsInteger :=
    IfThen((Sender as TDBGrid).DataSource.Dataset.FieldByName('PRO_FG_RESUL').AsInteger = 1, 0, 1);

  (Sender as TDBGrid).DataSource.Dataset.Post;
end;

procedure TfEnvioCasosExternos.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;

  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  // Desenha um checkbox no dbgrid
  if Column.FieldName = 'PRO_FG_RESUL' then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);

    if ((Sender as TDBGrid).DataSource.Dataset.FieldByName('PRO_FG_RESUL').AsInteger = 1) then
      Check := DFCS_CHECKED
    else
      Check := 0;

    R := Rect;
    InflateRect(R, -2, -2); { Diminue o tamanho do CheckBox }
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON,
      DFCS_BUTTONCHECK or Check);
  end;

end;
end.

