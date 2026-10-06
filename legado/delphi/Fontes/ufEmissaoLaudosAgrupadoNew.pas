unit ufEmissaoLaudosAgrupadoNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, dbcgrids, DBCtrls, StdCtrls, ExtCtrls, Grids, DBGrids,
  RLReport, RLFilters, RLPDFFilter, DB, ADODB, Sockets,  MaskUtils, StrUtils,
  jpeg, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdFTP, IdFTPCommon, Math,
  Menus, Mask, COMobj, DateUtils, HTTPApp, WinInet, pngimage,
  JvExControls, JvDBLookup, JvExMask, JvToolEdit;

type
  TfEmissaoLaudosAgrupadoNew = class(TForm)
    sbConsultar: TSpeedButton;
    BFechar: TSpeedButton;
    RLPDFFilter1: TRLPDFFilter;
    qLimpaXMarcados: TADOQuery;
    qListaProcedimentos: TADOQuery;
    ds_ListaProcedimentos: TDataSource;
    GroupBox1: TGroupBox;
    Label25: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    gb_Covid: TGroupBox;
    Label10: TLabel;
    sbProcessarCovid: TSpeedButton;
    qLancaResultado: TADOQuery;
    cb_ResultadoCovid: TComboBox;
    qAjustaDatas: TADOQuery;
    sbTodos: TSpeedButton;
    sbCLocal: TSpeedButton;
    qAtualizaResultado: TADOQuery;
    GroupBox3: TGroupBox;
    sbGeraLaudos: TSpeedButton;
    qAtualizaPacientes: TADOQuery;
    qAtualizaLibera: TADOQuery;
    qAjustaSequencial: TADOQuery;
    RxDBLookupComboColeta: TJvDBLookupCombo;
    qLancaResultadoPRO_COD: TIntegerField;
    qLancaResultadoPRO_DCAD: TDateField;
    qLancaResultadoPES_COD: TIntegerField;
    qLancaResultadoLAB_COD: TIntegerField;
    qLancaResultadoMED_CRM: TStringField;
    qLancaResultadoEXA_COD: TStringField;
    qLancaResultadoPRO_DCOL: TDateField;
    qLancaResultadoPRO_DENT: TDateField;
    qLancaResultadoPRO_GENO: TStringField;
    qLancaResultadoPRO_VLOG: TBCDField;
    qLancaResultadoPRO_RESUL: TStringField;
    qLancaResultadoPRO_OBS: TStringField;
    qLancaResultadoPRO_UINT: TBCDField;
    qLancaResultadoPRO_CMLI: TBCDField;
    qLancaResultadoPRO_PROT: TStringField;
    qLancaResultadoPRO_APA: TStringField;
    qLancaResultadoPRO_DREC: TDateField;
    qLancaResultadoPRO_ATEND: TStringField;
    qLancaResultadoPRO_TIPR: TStringField;
    qLancaResultadoPRO_HCAD: TStringField;
    qLancaResultadoPRO_VALOR: TBCDField;
    qLancaResultadoPRO_HCOL: TTimeField;
    qLancaResultadoPRO_PRAZO: TStringField;
    qLancaResultadoPRO_FG_RESUL: TSmallintField;
    qRelLaudo: TADOQuery;
    dsRelLaudo: TDataSource;
    TcpClient: TIdTCPClient;
    qListaProcedimentosSEQUENCIAL: TLargeintField;
    qListaProcedimentosPRO_COD: TIntegerField;
    qListaProcedimentosPRO_PROT: TStringField;
    qListaProcedimentosPRO_DCOL: TDateField;
    qListaProcedimentosPES_NOME: TStringField;
    qListaProcedimentosLAB_LABT: TStringField;
    qListaProcedimentosEXA_COD: TStringField;
    qListaProcedimentosPRO_FG_RESUL: TSmallintField;
    pm_Funcoes: TPopupMenu;
    GerarProtocolo1: TMenuItem;
    qIncluiProtocolo: TADOQuery;
    qSelecionaCasosMapas: TADOQuery;
    qAtualizaCPF: TADOQuery;
    CB_Prazo: TComboBox;
    Label3: TLabel;
    qListaProcedimentosPRO_PRAZO: TStringField;
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
    RxDBLookupComboPaciente: TJvDBLookupCombo;
    Label4: TLabel;
    qConsultaPaciente: TADOQuery;
    qConsultaPacientePES_COD: TIntegerField;
    qConsultaPacientePES_NOME: TStringField;
    ds_ConsultaPaciente: TDataSource;
    qDeletaArquivo: TADOQuery;
    N1: TMenuItem;
    PcientesConsulta1: TMenuItem;
    qListaProcedimentosPES_COD: TIntegerField;
    N2: TMenuItem;
    GerarEtiqueta1: TMenuItem;
    N3: TMenuItem;
    CasoConsulta1: TMenuItem;
    N4: TMenuItem;
    Laudo1: TMenuItem;
    qListaProcedimentosPRO_HASH: TStringField;
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
    sbInverter: TSpeedButton;
    sbSelProtocolos: TSpeedButton;
    N5: TMenuItem;
    EnviarLaudoSiteArquivo1: TMenuItem;
    Label5: TLabel;
    cb_ConsultaResultado: TComboBox;
    sbEtiqueta: TSpeedButton;
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
    sbGeraEtiquetas: TSpeedButton;
    sbGerarProtocolo: TSpeedButton;
    sbGeraPlaca: TSpeedButton;
    gb_Influenza: TGroupBox;
    Label6: TLabel;
    sbProcessarInfluenza: TSpeedButton;
    cb_ResultadoInfluenzaA: TComboBox;
    Label7: TLabel;
    cb_ResultadoInfluenzaB: TComboBox;
    gb_CI: TGroupBox;
    Label8: TLabel;
    sbProcessarCovidInfluenza: TSpeedButton;
    Label9: TLabel;
    cb_ResultadoCI_InfluenzaA: TComboBox;
    cb_ResultadoCI_InfluenzaB: TComboBox;
    Label11: TLabel;
    cb_ResultadoCI_Covid: TComboBox;
    gb_Painel: TGroupBox;
    Label12: TLabel;
    sbProcessarPainel: TSpeedButton;
    Label13: TLabel;
    Label14: TLabel;
    cb_ResultadoPainel_InfluenzaA: TComboBox;
    cb_ResultadoPainel_InfluenzaB: TComboBox;
    cb_ResultadoPainel_Covid: TComboBox;
    Label15: TLabel;
    cb_ResultadoPainel_VRS: TComboBox;
    qRelLaudoPRO_RESUL2: TStringField;
    qRelLaudoPRO_RESUL_I2: TStringField;
    qRelLaudoPRO_RESUL3: TStringField;
    qRelLaudoPRO_RESUL_I3: TStringField;
    qRelLaudoPRO_RESUL4: TStringField;
    qRelLaudoPRO_RESUL_I4: TStringField;
    qListaProcedimentosRESULTADO_COVID: TStringField;
    qListaProcedimentosRESULTADO_INFLUA: TStringField;
    qListaProcedimentosRESULTADO_INFLUB: TStringField;
    qListaProcedimentosRESULTADO_VRS: TStringField;
    qRelLaudoEXA_COD: TStringField;
    RxDBLookupComboExame: TJvDBLookupCombo;
    Label16: TLabel;
    qRelLaudoPRO_PROT: TStringField;
    qManutencao: TADOQuery;
    sbAtualizaQuant: TSpeedButton;
    sbNaoSite: TSpeedButton;
    qListaProcedimentosPRO_FG_SITE: TSmallintField;
    qRelLaudoPRO_FG_SITE: TIntegerField;
    qRelLaudoPES_NOME: TStringField;
    DateEditInicial: TJvDateEdit;
    DateEditFinal: TJvDateEdit;
    DBGrid: TDBGrid;
    procedure BFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbConsultarClick(Sender: TObject);
    procedure qListaProcedimentosLAB_FG_EXPORTAGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure sbProcessarCovidClick(Sender: TObject);
    Function MesExtenso( Mes:Word ) : string;
    procedure sbCLocalClick(Sender: TObject);
    procedure sbTodosClick(Sender: TObject);
    procedure ftpsend(host, username, password, filefrom, fileto: string;
 port: integer);
    function GetStrNumber(const S: string): string;
    procedure sbGeraLaudosClick(Sender: TObject);
    procedure GerarProtocolo1Click(Sender: TObject);
    procedure sbGeraPlacaClick(Sender: TObject);
    procedure sbGerarProtocoloClick(Sender: TObject);
    procedure PcientesConsulta1Click(Sender: TObject);
    procedure GerarEtiqueta1Click(Sender: TObject);
    procedure CasoConsulta1Click(Sender: TObject);
    procedure sbGeraEtiquetasClick(Sender: TObject);
    procedure Laudo1Click(Sender: TObject);
    function GetRandomPassword(Size: Integer; Tipo : Integer = 1): String;
    procedure sbInverterClick(Sender: TObject);
    procedure sbSelProtocolosClick(Sender: TObject);
    procedure EnviarLaudoSiteArquivo1Click(Sender: TObject);
    procedure sbEtiquetaClick(Sender: TObject);
    procedure sbProcessarInfluenzaClick(Sender: TObject);
    procedure sbProcessarCovidInfluenzaClick(Sender: TObject);
    procedure sbProcessarPainelClick(Sender: TObject);
    procedure sbAtualizaQuantClick(Sender: TObject);
    procedure sbNaoSiteClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEmissaoLaudosAgrupadoNew: TfEmissaoLaudosAgrupadoNew;
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


procedure TfEmissaoLaudosAgrupadoNew.BFecharClick(Sender: TObject);
begin
with qLimpaXMarcados do
begin
Close;
SQL.Clear;
SQL.Add(' update TB_PROCEDIMENTOS p set p.PRO_FG_RESUL = :Valor ');
Parameters.ParamByName('Valor').Value := 0;
ExecSQL;
end;

Close;
end;

function TfEmissaoLaudosAgrupadoNew.MesExtenso( Mes:Word ) : string; const meses : array[0..11] of PChar = ('janeiro', 'fevereiro', 'março', 'abril', 'maio', 'junho', 'julho', 'agosto', 'setembro','outubro', 'novembro', 'dezembro');
begin
result := meses[mes-1];
End;


procedure TfEmissaoLaudosAgrupadoNew.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
with qLimpaXMarcados do
begin
Close;
SQL.Clear;
SQL.Add(' update TB_PROCEDIMENTOS p set p.PRO_FG_RESUL = :Valor ');
Parameters.ParamByName('Valor').Value := 0;
ExecSQL;
end;
Close;
end;

procedure TfEmissaoLaudosAgrupadoNew.FormShow(Sender: TObject);
begin
   DMI.qLaboratorios.Open;
   DMI.qExames.Open;
   qConsultaPaciente.Open;

   DateEditInicial.Clear;
   DateEditInicial.Date := Date;
   DateEditFinal.Clear;
   DateEditFinal.Date   := Date;
end;


procedure TfEmissaoLaudosAgrupadoNew.ftpsend(host, username, password, filefrom, fileto: string;port: integer);
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


procedure TfEmissaoLaudosAgrupadoNew.qListaProcedimentosLAB_FG_EXPORTAGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
Text := EmptyStr;
end;

procedure TfEmissaoLaudosAgrupadoNew.sbProcessarCovidClick(Sender: TObject);
begin
if MessageDlg(' Confirma o Lançamento dos Resultados do Exame? ',mtconfirmation,[mbyes,mbno],0) = mryes
then begin
      qLancaResultado.Close;
      qLancaResultado.SQL.Clear;
      qLancaResultado.SQL.Add(' select * from tb_PROCEDIMENTOS pr');
      qLancaResultado.SQL.Add(' where pr.PRO_FG_RESUL = :Valor ');
      qLancaResultado.Parameters.ParamByName('Valor').Value := 1;
      qLancaResultado.open;

      MessageDlg(' Quantidade de Resultados a serem processados é : ' + IntToStr(qLancaResultado.RecordCount) ,mtConfirmation,[mbOK],0);

      qLancaResultado.First;
      while qLancaResultado.Eof = False  do
      begin
        DMI.qVerificaResultado.Close;
        DMI.qVerificaResultado.Parameters.ParamByName('Codigo').Value := (qLancaResultadoPRO_COD.Value);
        DMI.qVerificaResultado.Open;
        if (DMI.qVerificaResultadoQUANTIDADE.Value >0 )
        then begin
              with qAtualizaResultado do
              begin
                Close;
                SQL.Clear;
                SQL.Add(' update TB_PROCEDIMENTOS_RESULTADO p set p.PRO_RESUL = :Resultado where p.PRO_COD = :Codigo ');
                Parameters.ParamByName('Resultado').Value  := cb_ResultadoCovid.Text;
                Parameters.ParamByName('Codigo').Value    := (qLancaResultadoPRO_COD.Value);
                ExecSQL;
              end;
             end else begin
                       DMI.qProcedimentos_Resultado.Close;
                       DMI.qProcedimentos_Resultado.Open;
                       DMI.qProcedimentos_Resultado.Append;
                       DMI.qProcedimentos_ResultadoPRO_COD.Value        := (qLancaResultadoPRO_COD.Value);
                       DMI.qProcedimentos_ResultadoPROR_DAT.Value       := Date;
                       DMI.qProcedimentos_ResultadoPRO_RESUL.Value      := cb_ResultadoCovid.Text;
                       DMI.qProcedimentos_Resultado.Post;
                      end;

        qLancaResultado.Next;
      end;

  {  with qLimpaXMarcados do
    begin
     Close;
     SQL.Clear;
     SQL.Add(' update TB_PROCEDIMENTOS p set p.PRO_FG_RESUL = :Valor ');
     Parameters.ParamByName('Valor').Value := 0;
     ExecSQL;
    end;    }
    ShowMessage('Resultados lançados com sucesso!');
    sbConsultar.Click;
   end else RxDBLookupComboColeta.SetFocus;




end;

procedure TfEmissaoLaudosAgrupadoNew.sbTodosClick(Sender: TObject);
begin
qListaProcedimentos.First;
while qListaProcedimentos.Eof = False do
begin
  with qLimpaXMarcados do
  begin
  Close;
  SQL.Clear;
  SQL.Add(' update TB_PROCEDIMENTOS p set p.PRO_FG_RESUL = :Valor where p.PRO_COD = :Codigo ');
  Parameters.ParamByName('Valor').Value  := 1;
  Parameters.ParamByName('Codigo').Value := qListaProcedimentosPRO_COD.Value;
  ExecSQL;
  end;
  qListaProcedimentos.Next
end;
sbConsultar.Click;
end;

procedure TfEmissaoLaudosAgrupadoNew.sbCLocalClick(Sender: TObject);
begin
 Application.CreateForm(TfConsultaLaboratorios, fConsultaLaboratorios);
 fConsultaLaboratorios.Showmodal;
 RxDBLookupComboColeta.KeyValue := DMI.qConsultaLaboratoriosLAB_COD.Value;
 fConsultaLaboratorios.Free;
end;

procedure TfEmissaoLaudosAgrupadoNew.sbConsultarClick(Sender: TObject);
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

qListaProcedimentos.Close;
//Grid.Visible := False;

if ((RxDBLookupComboPaciente.KeyValue < 0) and (RxDBLookupComboColeta.KeyValue < 0) and (CB_Prazo.Text = '') and (DateEditInicial.Date = 0))
then begin
      ShowMessage('Favor informar pelo menos um parâmetro para pesquisar!!');
     end else begin

                Contador := 0;

                qListaProcedimentos.Close;


                qListaProcedimentos.SQL.Clear;

                qListaProcedimentos.SQL.Add(' select NEXT VALUE FOR GRID_LINHAS as sequencial,  ');
                qListaProcedimentos.SQL.Add(' pr.pro_hash, pr.pro_cod,          ');
                qListaProcedimentos.SQL.Add(' pr.pro_prot,         ');
                qListaProcedimentos.SQL.Add(' pr.pro_dcol,         ');
                qListaProcedimentos.SQL.Add(' pr.PRO_FG_SITE,         ');
                qListaProcedimentos.SQL.Add(' pr.pes_cod,         ');
                qListaProcedimentos.SQL.Add(' (select PA.pes_nome from tb_PACIENTES pa WHERE pr.pes_cod = pa.pes_cod) pes_nome,  ');
                qListaProcedimentos.SQL.Add(' (select l.lab_labt from  tb_laboratorios l where pr.lab_cod = l.lab_cod)  lab_labt,  ');
                qListaProcedimentos.SQL.Add(' (select e.exa_cod from  tb_exames e where pr.exa_cod = e.exa_cod) exa_cod,  ');
                qListaProcedimentos.SQL.Add(' pr.pro_fg_resul, pr.pro_prazo,    ');
                qListaProcedimentos.SQL.Add(' (select r.pro_resul from tb_procedimentos_resultado R where r.pro_cod = pr.pro_cod) resultado_covid,   ');
                qListaProcedimentos.SQL.Add(' (select r.pro_resul2 from tb_procedimentos_resultado R where r.pro_cod = pr.pro_cod) resultado_influa,   ');
                qListaProcedimentos.SQL.Add(' (select r.pro_resul3 from tb_procedimentos_resultado R where r.pro_cod = pr.pro_cod) resultado_influb,   ');
                qListaProcedimentos.SQL.Add(' (select r.pro_resul4 from tb_procedimentos_resultado R where r.pro_cod = pr.pro_cod) resultado_vrs   ');
                qListaProcedimentos.SQL.Add(' from tb_PROCEDIMENTOS pr  ');

                qListaProcedimentos.SQL.Add(' where ');

                with qListaProcedimentos do
                begin

                    if (RxDBLookupComboColeta.KeyValue > 0)
                    then begin
                          if Contador >=1
                          then begin
                               qListaProcedimentos.SQL.Add(' AND ');
                              end;
                         qListaProcedimentos.SQL.Add(' pr.LAB_COD = :LOCAL ');
                         qListaProcedimentos.Parameters.ParamByName('LOCAL').Value := RxDBLookupComboColeta.KeyValue;
                         Contador := Contador + 1;
                    end;

                    if (cb_ConsultaResultado.Text <> '')
                    then begin
                          if Contador >=1
                          then begin
                               qListaProcedimentos.SQL.Add(' AND ');
                              end;
                          if (cb_ConsultaResultado.Text = 'SEM RESULTADO')
                          then begin
                                qListaProcedimentos.SQL.Add(' ( ');
                                qListaProcedimentos.SQL.Add(' (select r.pro_resul from tb_procedimentos_resultado R where r.pro_cod = pr.pro_cod) is null or ');
                                qListaProcedimentos.SQL.Add(' (select r.pro_resul2 from tb_procedimentos_resultado R where r.pro_cod = pr.pro_cod) is null or ');
                                qListaProcedimentos.SQL.Add(' (select r.pro_resul3 from tb_procedimentos_resultado R where r.pro_cod = pr.pro_cod) is null or ');
                                qListaProcedimentos.SQL.Add(' (select r.pro_resul4 from tb_procedimentos_resultado R where r.pro_cod = pr.pro_cod) is null ');
                                qListaProcedimentos.SQL.Add(' ) ');
                               end else begin
                                         qListaProcedimentos.SQL.Add(' ( ');
                                         qListaProcedimentos.SQL.Add(' (select r.pro_resul from tb_procedimentos_resultado R where r.pro_cod = pr.pro_cod) = :Resultado or ');
                                         qListaProcedimentos.SQL.Add(' (select r.pro_resul2 from tb_procedimentos_resultado R where r.pro_cod = pr.pro_cod) = :Resultado2 or ');
                                         qListaProcedimentos.SQL.Add(' (select r.pro_resul3 from tb_procedimentos_resultado R where r.pro_cod = pr.pro_cod) = :Resultado3 or ');
                                         qListaProcedimentos.SQL.Add(' (select r.pro_resul4 from tb_procedimentos_resultado R where r.pro_cod = pr.pro_cod) = :Resultado4 ');
                                         qListaProcedimentos.SQL.Add(' ) ');
                                         qListaProcedimentos.Parameters.ParamByName('Resultado').Value  := cb_ConsultaResultado.Text;
                                         qListaProcedimentos.Parameters.ParamByName('Resultado2').Value := cb_ConsultaResultado.Text;
                                         qListaProcedimentos.Parameters.ParamByName('Resultado3').Value := cb_ConsultaResultado.Text;
                                         qListaProcedimentos.Parameters.ParamByName('Resultado4').Value := cb_ConsultaResultado.Text;
                                        end;

                          Contador := Contador + 1;
                    end;

                    if (CB_Prazo.Text <> '')
                    then begin
                          if Contador >=1
                          then begin
                               qListaProcedimentos.SQL.Add(' AND ');
                              end;
                         qListaProcedimentos.SQL.Add(' pr.PRO_PRAZO = :PRAZO ');
                         qListaProcedimentos.Parameters.ParamByName('PRAZO').Value := CB_Prazo.Text;
                         Contador := Contador + 1;
                    end;

                    if (RxDBLookupComboPaciente.KeyValue > 0)
                    then begin
                          if Contador >=1
                          then begin
                               qListaProcedimentos.SQL.Add(' AND ');
                              end;
                         qListaProcedimentos.SQL.Add(' pr.PES_COD = :PACIENTE ');
                         qListaProcedimentos.Parameters.ParamByName('PACIENTE').Value := RxDBLookupComboPaciente.KeyValue;
                         Contador := Contador + 1;
                    end;

                    if (RxDBLookupComboExame.Text <> '')
                    then begin
                          if Contador >=1
                          then begin
                               qListaProcedimentos.SQL.Add(' AND ');
                              end;
                         qListaProcedimentos.SQL.Add(' pr.EXA_COD = :EXAME ');
                         qListaProcedimentos.Parameters.ParamByName('EXAME').Value := RxDBLookupComboExame.KeyValue;
                         Contador := Contador + 1;
                    end;

                    if DateEditInicial.Date <> 0
                    then begin
                          if Contador >=1 then
                          begin
                           qListaProcedimentos.SQL.Add(' AND ');
                          end;
                          if DateEditFinal.Date <> 0
                          then begin
                                qListaProcedimentos.SQL.Add('pr.PRO_DCOL >= :DATAINI AND pr.PRO_DCOL <= :DATAFIN');
                                qListaProcedimentos.Parameters.ParamByName('DATAINI').Value := DateEditInicial.Date;
                                qListaProcedimentos.Parameters.ParamByName('DATAFIN').Value := DateEditFinal.Date;
                                Contador := Contador + 1;
                               end else begin
                                         qListaProcedimentos.SQL.Add('pr.PRO_DCOL >= :DATAINI ');
                                         qListaProcedimentos.Parameters.ParamByName('DATAINI').Value := DateEditInicial.Date;
                                         Contador := Contador + 1;
                                        end;
                         end;

                    end;

               qListaProcedimentos.SQL.Add(' order by 4 ');
               qListaProcedimentos.Open;

               if (qListaProcedimentos.RecordCount > 0)
               then begin
                      //Grid.Visible           := True;
                      sbGeraLaudos.Enabled     := True;
                      sbGeraPlaca.Enabled      := True;
                      sbGerarProtocolo.Enabled := True;
                      sbGeraEtiquetas.Enabled  := True;
                    end;

              end;

with qAtualizaCPF do
begin
 Close;
 SQL.Clear;
 SQL.Add(' update TB_PACIENTES set pes_cpf = null where pes_cpf = :CPF');
 Parameters.ParamByName('CPF').Value  := '';
 ExecSQL;
end;

end;

function TfEmissaoLaudosAgrupadoNew.GetStrNumber(const S: string): string;
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

procedure TfEmissaoLaudosAgrupadoNew.sbGeraLaudosClick(Sender: TObject);
var DataHoje, AnoN, DiaN, AnoD, AnoA, MesA, DiaA, NomeLaudoPDF, Desc_Sensibilidade, Resultado, CPF, DataLiberacao : String;
    Linha, CodigoUsuario : Integer;
    Ano, Mes, Dia : Word;
    DataGerada : TDateTime;
begin
  inherited;
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

       if MessageDlg(' Confirma a Geração dos Laudos em Lote? ',mtconfirmation,[mbyes,mbno],0) = mryes
      then begin
            qLancaResultado.Close;
            qLancaResultado.SQL.Clear;
            qLancaResultado.SQL.Add(' select * from tb_PROCEDIMENTOS pr');
            qLancaResultado.SQL.Add(' where pr.PRO_FG_RESUL = :Valor and pr.pro_prot is not null ');
            qLancaResultado.Parameters.ParamByName('Valor').Value := 1;
            qLancaResultado.open;

            qLancaResultado.First;
            while qLancaResultado.Eof = False  do
            begin

              qRelLaudo.Close;
              qRelLaudo.Parameters.ParamByName('CODIGO').Value := qLancaResultadoPRO_COD.Value;
              qRelLaudo.Open;
              if (qRelLaudo.RecordCount <=0)
              then begin
                    ShowMessage('Problema na Emissão do Laudo!!!');
                   end else begin
                             //Regra Data Liberação
                              if (qRelLaudoPRO_PRAZO.Value = 'MESMO DIA')
                              then begin
                                    DataLiberacao := Copy(DateToStr(qRelLaudoPRO_DCOL.Value),7,4) + '-' + Copy(DateToStr(qRelLaudoPRO_DCOL.Value),4,2) + '-'  + Copy(DateToStr(qRelLaudoPRO_DCOL.Value),1,2) + ' 18:00:00';
                                   end;
                              if ((qRelLaudoPRO_PRAZO.Value = '6 HORAS') or (qRelLaudoPRO_PRAZO.Value = 'URGENTE (3H)') or (qRelLaudoPRO_PRAZO.Value = 'SÁBADO (3H)') or (qRelLaudoPRO_PRAZO.Value = 'FINAL SEMANA (3H)'))
                              then begin
                                    DataLiberacao := Copy(DateToStr(qRelLaudoPRO_DCOL.Value),7,4) + '-' + Copy(DateToStr(qRelLaudoPRO_DCOL.Value),4,2) + '-'  + Copy(DateToStr(qRelLaudoPRO_DCOL.Value),1,2) + ' 02:00:00';
                                   end;
                              if (qRelLaudoPRO_PRAZO.Value = '24 HORAS')
                              then begin
                                    DataGerada := IncDay(qRelLaudoPRO_DCOL.Value, 1);
                                    DataLiberacao := Copy(DateToStr(DataGerada),7,4) + '-' + Copy(DateToStr(DataGerada),4,2) + '-' + Copy(DateToStr(DataGerada),1,2) + ' 10:00:00';
                                   end;
                              if (qRelLaudoPRO_PRAZO.Value = '48 HORAS')
                              then begin
                                    DataGerada := IncDay(qRelLaudoPRO_DCOL.Value, 2);
                                    DataLiberacao := Copy(DateToStr(DataGerada),7,4) + '-' + Copy(DateToStr(DataGerada),4,2) + '-' + Copy(DateToStr(DataGerada),1,2) + ' 10:00:00';
                                   end;
                              if (qRelLaudoPRO_PRAZO.Value = '72 HORAS')
                              then begin
                                    DataGerada := IncDay(qRelLaudoPRO_DCOL.Value, 3);
                                    DataLiberacao := Copy(DateToStr(DataGerada),7,4) + '-' + Copy(DateToStr(DataGerada),4,2) + '-' + Copy(DateToStr(DataGerada),1,2) + ' 10:00:00';
                                   end;

                             if (qRelLaudoEXA_COD.Value = 'COVID-19')
                             then begin
                                     // Laudo Covid
                                     Application.CreateForm(TfImprimeLaudo,fImprimeLaudo);
                                     fImprimeLaudo.RLDataHoje.Caption     := '';
                                     fImprimeLaudo.RLL_DATAS.Caption      := '';
                                     fImprimeLaudo.RLL_RESULTADOS.Caption := '';
                                     fImprimeLaudo.RLL_PROTOCOLO.Caption  := '';
                                     fImprimeLaudo.RLL_CONVENIO.Caption   := '';
                                     fImprimeLaudo.RLL_Code.Caption       := '';

                                     fImprimeLaudo.RLL_PACIENTE.Caption   := '';
                                     fImprimeLaudo.RLL_PACIENTEP.Caption   := '';
                                     fImprimeLaudo.RLL_PASSDTNAS.Caption   := '';

                                     fImprimeLaudo.RLDataHoje.Caption     := DataHoje;
                                     if ((qRelLaudoPRO_HCOL.Value > 0) and (qRelLaudoPRO_HCOL.Value <> 44252))
                                     then begin
                                            fImprimeLaudo.RLL_DATAS.Font.Size := 10;
                                            fImprimeLaudo.RLL_DATAS.Caption   := DateToStr(qRelLaudoPRO_DCOL.Value) + '/' + qRelLaudoPRO_DCOL_I.Value + ' - ' + Copy(TimeToStr(qRelLaudoPRO_HCOL.Value),1,5) + '/' + qRelLaudoPRO_HCOL_I.Value;
                                          end else fImprimeLaudo.RLL_DATAS.Caption  := DateToStr(qRelLaudoPRO_DCOL.Value) + ' / ' + qRelLaudoPRO_DCOL_I.Value;
                                     fImprimeLaudo.RLL_RESULTADOS.Caption := qRelLaudoPRO_RESUL.Value + ' / ' + qRelLaudoPRO_RESUL_I.Value;
                                     fImprimeLaudo.RLL_PROTOCOLO.Caption  := qRelLaudoPRO_PROT.Value;
                                     fImprimeLaudo.RLL_CONVENIO.Caption   := qRelLaudoLAB_LABT.Value;
                                     fImprimeLaudo.RLL_Code.Caption       := qRelLaudoPRO_HASH.Value;

                                     if (qRelLaudoPES_PASS.Value <> '')
                                     then begin
                                           fImprimeLaudo.RLL_PACIENTE.Caption   := '';
                                           fImprimeLaudo.RLL_PACIENTE.Visible   := False;
                                           fImprimeLaudo.RLL_PACIENTEP.Visible  := True;
                                           fImprimeLaudo.RLL_PASSDTNAS.Visible  := True;
                                           fImprimeLaudo.RLL_PACIENTEP.Caption  := trim(qRelLaudoPES_NOME.Value);
                                           fImprimeLaudo.RLL_PASSDTNAS.Caption  := trim(qRelLaudoPES_PASS.Value) + ' -  BIRTH ' + Copy(DateToStr(qRelLaudoPES_DNAS.Value),1,2) + '-' + Copy(DateToStr(qRelLaudoPES_DNAS.Value),4,2) + '-' + Copy(DateToStr(qRelLaudoPES_DNAS.Value),7,4) ;
                                         end else begin
                                                   fImprimeLaudo.RLL_PACIENTE.Visible   := True;
                                                   fImprimeLaudo.RLL_PACIENTE.Caption   := trim(qRelLaudoPES_NOME.Value);
                                                   fImprimeLaudo.RLL_PACIENTEP.Caption  := '';
                                                   fImprimeLaudo.RLL_PASSDTNAS.Caption  := '';
                                                   fImprimeLaudo.RLL_PACIENTEP.Visible  := False;
                                                   fImprimeLaudo.RLL_PASSDTNAS.Visible  := False;

                                                  end;


                                     if (UpperCase(UpperCase(GetEnvironmentVariable('COMPUTERNAME'))) = 'NCPESEDE008306') or (UpperCase(UpperCase(GetEnvironmentVariable('COMPUTERNAME'))) = 'NCPESEDE008306')
                                     then begin
                                            NomeLaudoPDF := 'C:\SCPG\Documentos_Gerados\' + qRelLaudoPRO_PROT.Value + '_' + trim(qRelLaudoPES_NOME.Value) + '.pdf';
                                          end else NomeLaudoPDF := 'U:\Laboratorio\Infecciosas\Covid\' + qRelLaudoPRO_PROT.Value + '_' + trim(qRelLaudoPES_NOME.Value) + '.pdf';
                                    fImprimeLaudo.RLReport_New.SaveToFile(NomeLaudoPDF) ;
                                    fImprimeLaudo.Free;
                                   //Laudo Covid
                                end;
                             if (qRelLaudoEXA_COD.Value <> 'COVID-19')
                             then begin
                                    // Laudo Não Covid
                                   Application.CreateForm(TfImprimeLaudo2,fImprimeLaudo2);
                                   fImprimeLaudo2.RLDataHoje.Caption      := '';
                                   fImprimeLaudo2.RLL_DATAS.Caption       := '';
                                   fImprimeLaudo2.RLL_RESULTADOS.Caption  := '';
                                   fImprimeLaudo2.RLL_RESULTADOS2.Caption := '';
                                   fImprimeLaudo2.RLL_RESULTADOS3.Caption := '';
                                   fImprimeLaudo2.RLL_RESULTADOS4.Caption := '';
                                   fImprimeLaudo2.RLL_PROTOCOLO.Caption   := '';
                                   fImprimeLaudo2.RLL_CONVENIO.Caption    := '';
                                   fImprimeLaudo2.RLL_Code.Caption        := '';
                                   fImprimeLaudo2.RLL_PACIENTE.Caption    := '';

                                   fImprimeLaudo2.RLDataHoje.Caption     := DataHoje;
                                   if ((qRelLaudoPRO_HCOL.Value > 0) and (qRelLaudoPRO_HCOL.Value <> 44252))
                                   then begin
                                          fImprimeLaudo2.RLL_DATAS.Font.Size := 10;
                                          fImprimeLaudo2.RLL_DATAS.Caption   := DateToStr(qRelLaudoPRO_DCOL.Value) + '/' + qRelLaudoPRO_DCOL_I.Value + ' - ' + Copy(TimeToStr(qRelLaudoPRO_HCOL.Value),1,5) + '/' + qRelLaudoPRO_HCOL_I.Value;
                                        end else fImprimeLaudo2.RLL_DATAS.Caption  := DateToStr(qRelLaudoPRO_DCOL.Value) + ' / ' + qRelLaudoPRO_DCOL_I.Value;

                                   if (qRelLaudoEXA_COD.Value = 'INFLUENZA')
                                   then begin
                                         fImprimeLaudo2.RLL_ANALISE.Caption     := 'Influenza A e B Teste Rápido';
                                         fImprimeLaudo2.RLL_RESULTADOS.Caption  := 'INFLUENZA A : ' + qRelLaudoPRO_RESUL2.Value + ' / ' + qRelLaudoPRO_RESUL_I2.Value;
                                         fImprimeLaudo2.RLL_RESULTADOS2.Caption := 'INFLUENZA B : ' + qRelLaudoPRO_RESUL3.Value + ' / ' + qRelLaudoPRO_RESUL_I3.Value;
                                         fImprimeLaudo2.RLL_RESULTADOS3.Visible := False;
                                         fImprimeLaudo2.RLL_RESULTADOS4.Visible := False;

                                         fImprimeLaudo2.RL_MEMO_INFLUENZA_PORT.Visible := True;
                                         fImprimeLaudo2.RL_MEMO_INFLUENZA_INGL.Visible := True;
                                         fImprimeLaudo2.RL_MEMO_COVID_PORT.Visible     := False;
                                         fImprimeLaudo2.RL_MEMO_COVID_INGL.Visible     := False;
                                        end;
                                   if (qRelLaudoEXA_COD.Value = 'COVIDINFLU')
                                   then begin
                                         fImprimeLaudo2.RLL_ANALISE.Caption     := 'RT-PCR para Covid + Influenza A e B Teste Rápido';
                                         fImprimeLaudo2.RLL_RESULTADOS.Caption  := 'COVID-19 : '    + qRelLaudoPRO_RESUL.Value + ' / ' + qRelLaudoPRO_RESUL_I.Value;
                                         fImprimeLaudo2.RLL_RESULTADOS2.Caption := 'INFLUENZA A : ' + qRelLaudoPRO_RESUL2.Value + ' / ' + qRelLaudoPRO_RESUL_I2.Value;
                                         fImprimeLaudo2.RLL_RESULTADOS3.Caption := 'INFLUENZA B : ' + qRelLaudoPRO_RESUL3.Value + ' / ' + qRelLaudoPRO_RESUL_I3.Value;
                                         fImprimeLaudo2.RLL_RESULTADOS4.Visible := False;

                                         fImprimeLaudo2.RL_MEMO_INFLUENZA_PORT.Visible := False;
                                         fImprimeLaudo2.RL_MEMO_INFLUENZA_INGL.Visible := False;
                                         fImprimeLaudo2.RL_MEMO_COVID_PORT.Visible     := True;
                                         fImprimeLaudo2.RL_MEMO_COVID_INGL.Visible     := True;
                                        end;
                                   if (qRelLaudoEXA_COD.Value = 'PNLVIRAL')
                                   then begin
                                         fImprimeLaudo2.RLL_ANALISE.Caption     := 'RT-PCR Painel Viral';
                                         fImprimeLaudo2.RLL_RESULTADOS.Caption  := 'COVID-19 : '    + qRelLaudoPRO_RESUL.Value + ' / ' + qRelLaudoPRO_RESUL_I.Value;
                                         fImprimeLaudo2.RLL_RESULTADOS2.Caption := 'INFLUENZA A : ' + qRelLaudoPRO_RESUL2.Value + ' / ' + qRelLaudoPRO_RESUL_I2.Value;
                                         fImprimeLaudo2.RLL_RESULTADOS3.Caption := 'INFLUENZA B : ' + qRelLaudoPRO_RESUL3.Value + ' / ' + qRelLaudoPRO_RESUL_I3.Value;
                                         fImprimeLaudo2.RLL_RESULTADOS4.Caption := 'VÍRUS SINCICIAL : ' + qRelLaudoPRO_RESUL4.Value + ' / ' + qRelLaudoPRO_RESUL_I4.Value;

                                         fImprimeLaudo2.RL_MEMO_INFLUENZA_PORT.Visible := False;
                                         fImprimeLaudo2.RL_MEMO_INFLUENZA_INGL.Visible := False;
                                         fImprimeLaudo2.RL_MEMO_COVID_PORT.Visible     := True;
                                         fImprimeLaudo2.RL_MEMO_COVID_INGL.Visible     := True;
                                        end;

                                  fImprimeLaudo2.RLL_CONVENIO.Caption   := qRelLaudoLAB_LABT.Value;
                                  fImprimeLaudo2.RLL_PROTOCOLO.Caption  := qRelLaudoPRO_PROT.Value;
                                  fImprimeLaudo2.RLL_Code.Caption       := qRelLaudoPRO_HASH.Value;

                                   fImprimeLaudo2.RLL_PACIENTE.Visible   := True;
                                   fImprimeLaudo2.RLL_PACIENTE.Caption   := trim(qRelLaudoPES_NOME.Value);

                                   if (UpperCase(UpperCase(GetEnvironmentVariable('COMPUTERNAME'))) = 'NCPESEDE008306') or (UpperCase(UpperCase(GetEnvironmentVariable('COMPUTERNAME'))) = 'NCPESEDE008306')
                                   then begin
                                          NomeLaudoPDF := 'C:\SCPG\Documentos_Gerados\' + qRelLaudoPRO_PROT.Value + '_' + trim(qRelLaudoPES_NOME.Value) + '.pdf';
                                        end else NomeLaudoPDF := 'U:\Laboratorio\Infecciosas\Covid\' + qRelLaudoPRO_PROT.Value + '_' + trim(qRelLaudoPES_NOME.Value) + '.pdf';
                                  fImprimeLaudo2.RLReport_New.SaveToFile(NomeLaudoPDF) ;
                                  fImprimeLaudo2.Free;
                                 //Laudo Não Covid

                               end;

                            DMI.qStatusProcedimentos.Close;
                            DMI.qStatusProcedimentos.Open;
                            DMI.qStatusProcedimentos.Append;
                            DMI.qStatusProcedimentosPRO_COD.Value    := qLancaResultadoPRO_COD.Value;
                            DMI.qStatusProcedimentosSTP_DATA.Value   := Date;
                            DMI.qStatusProcedimentosSTP_STATUS.Value := 4;
                            DMI.qStatusProcedimentosSTP_DESC.Value   := 'Laudo já foi impresso';
                            DMI.qStatusProcedimentos.Post;

                      // ENVIAR PARA SITE

                            if (qRelLaudoLAB_COD_INTERNET.Value > 0)
                            then begin

                                 DMI.ADOC_MYSQL.Connected := True;

                                 DMI.qVerificaArquivo.Close;
                                 DMI.qVerificaArquivo.Parameters.ParamByName('Nome').Value   := qRelLaudoPES_NOME.Value;
                                 DMI.qVerificaArquivo.Parameters.ParamByName('Data').Value   := qRelLaudoPRO_DCOL.Value;
                                 DMI.qVerificaArquivo.Open;



                                 if (DMI.qVerificaArquivo.RecordCount > 0)
                                 then begin
                                       DMI.qVerificaArquivo.First;
                                       while DMI.qVerificaArquivo.Eof = False  do
                                       begin
                                        with qDeletaArquivo do
                                        begin
                                          Close;
                                          SQL.Clear;
                                          SQL.Add(' delete from rdcbco37_resultados.tb_arquivos_ipcms where cod = :Codigo');
                                          Parameters.ParamByName('Codigo').Value := DMI.qVerificaArquivocod.Value;
                                          ExecSQL;
                                        end;
                                        DMI.qVerificaArquivo.Next;
                                       end;
                                      end;

                                  with DMI.qArquivosWeb do
                                  begin
                                    Close;
                                    SQL.Clear;
                                    SQL.Add(' INSERT INTO rdcbco37_resultados.tb_arquivos_ipcms (nome, arquivo, usuario, data_add, data_lib, protocolo, resultado, datacoleta) VALUES (:nome,:arquivo, :usuario, now(), :datalibera, :protocolo, :resultado, :datacoleta)');
                                    Parameters.ParamByName('nome').Value      := qRelLaudoPES_NOME.Value;
                                    Parameters.ParamByName('arquivo').Value   := 'arq/'+ qRelLaudoPRO_PROT.Value + '_' + trim(qRelLaudoPES_NOME.Value) + '.pdf';
                                    Parameters.ParamByName('usuario').Value   := qRelLaudoLAB_COD_INTERNET.Value;
                                    Parameters.ParamByName('datalibera').Value:= DataLiberacao;
                                    Parameters.ParamByName('protocolo').Value := qRelLaudoPRO_HASH.Value;
                                    Parameters.ParamByName('datacoleta').Value:= DateToStr(qRelLaudoPRO_DCOL.Value);



                                    if (qRelLaudoEXA_COD.Value = 'COVID-19')
                                    then begin
	 		  					                         Parameters.ParamByName('resultado').Value := qRelLaudoPRO_RESUL.Value;
                                         end;
                                    if (qRelLaudoEXA_COD.Value = 'INFLUENZA')
                                    then begin
                 								          Parameters.ParamByName('resultado').Value := qRelLaudoPRO_RESUL2.Value +  ' / ' + qRelLaudoPRO_RESUL3.Value;
                                        end;
                                    if (qRelLaudoEXA_COD.Value = 'COVIDINFLU')
                                    then begin
                                          Parameters.ParamByName('resultado').Value := qRelLaudoPRO_RESUL.Value +  ' / ' + qRelLaudoPRO_RESUL2.Value +  ' / ' + qRelLaudoPRO_RESUL3.Value;
					 			                    		end;
                                    if (qRelLaudoEXA_COD.Value = 'PNLVIRAL')
                                    then begin
                                          Parameters.ParamByName('resultado').Value := qRelLaudoPRO_RESUL.Value +  ' / ' + qRelLaudoPRO_RESUL2.Value +  ' / ' + qRelLaudoPRO_RESUL3.Value +  ' / ' + qRelLaudoPRO_RESUL4.Value;
                                         end;
                                     ExecSQL;
                                  end;

                                  ftpsend('108.179.193.98','raphael@rdcb.com.br','Tucano%23', NomeLaudoPDF, qRelLaudoPRO_PROT.Value + '_' + trim(qRelLaudoPES_NOME.Value) + '.pdf',21);

                                  DMI.qVerificaArquivo.Close;
                                  DMI.qArquivosWeb.Close;

 //                                 DMI.ADOC_MYSQL.Connected := False;
                                 end;
                                end;

                           //USUÁRIO
                            if (qRelLaudoLAB_RESUL_INTERNET.Value > 0)
                            then begin

                                  CodigoUsuario := 14;

                                  // SITE
                                  if ((Length(trim(qRelLaudoPES_CPF.Value)) > 4) or (qRelLaudoPES_PASS.Value <> ''))
                                  then begin

 //                                       DMI.ADOC_MYSQL.Connected := True;

                                        DMI.qConsultaUsuarioWeb.Close;
                                        DMI.qConsultaUsuarioWeb.Parameters.ParamByName('login').Value := GetStrNumber(qRelLaudoPES_CPF.Value);
                                        DMI.qConsultaUsuarioWeb.Open;

                                        if (DMI.qConsultaUsuarioWeb.RecordCount <= 0)
                                        then begin
                                              DMI.qConsultaUsuarioWebPASS.Close;
                                              DMI.qConsultaUsuarioWebPASS.Parameters.ParamByName('login').Value  := trim(qRelLaudoPES_PASS.Value);
                                              DMI.qConsultaUsuarioWebPASS.Open;

                                              if (DMI.qConsultaUsuarioWebPASS.RecordCount <= 0)
                                              then begin
                                                    with DMI.qUsuarioWeb do
                                                    begin
                                                      Close;
                                                      SQL.Clear;
                                                      SQL.Add(' INSERT INTO rdcbco37_resultados.tb_usuarios_ipcms (login, senha, nome, passaporte,senhapass) VALUES (:usuario,password(:senha),:nome,:passaporte,password(:senhapass))');
                                                      Parameters.ParamByName('usuario').Value      := GetStrNumber(qRelLaudoPES_CPF.Value);
                                                      Parameters.ParamByName('senha').Value        := Copy(trim(GetStrNumber(qRelLaudoPES_CPF.Value)),1,5) ;
                                                      Parameters.ParamByName('nome').Value         := qRelLaudoPES_NOME.Value;
                                                      Parameters.ParamByName('passaporte').Value   := trim(qRelLaudoPES_PASS.Value);
                                                      Parameters.ParamByName('senhapass').Value    := Copy(trim(qRelLaudoPES_PASS.Value),1,5) ;
                                                      ExecSQL;
                                                    end;
                                                   end else  CodigoUsuario := DMI.qConsultaUsuarioWebPASScod.Value;
                                            end else CodigoUsuario := DMI.qConsultaUsuarioWebcod.Value;

                                     end;
                                  //

                                   with qAtualizaPacientes do
                                   begin
                                   Close;
                                   SQL.Clear;
                                   SQL.Add(' update TB_PACIENTES set PES_COD_INTERNET = :CodWeb where PES_COD = :Codigo');
                                   Parameters.ParamByName('CodWeb').Value  := CodigoUsuario;
                                   Parameters.ParamByName('Codigo').Value  := qRelLaudoPES_COD.Value;;
                                   ExecSQL;
                                   end;

                                   if (CodigoUsuario <= 0)
                                   then begin
                                         CodigoUsuario := 14;
                                        end;

                                   with DMI.qArquivosWeb do
                                   begin
                                   Close;
                                   SQL.Clear;
                                   SQL.Add(' INSERT INTO rdcbco37_resultados.tb_arquivos_ipcms (nome, arquivo, usuario, data_add, data_lib, protocolo, resultado, datacoleta) VALUES (:nome,:arquivo, :usuario, now(), :datalibera, :protocolo, :resultado, :datacoleta)');
                                   Parameters.ParamByName('nome').Value      := qRelLaudoPES_NOME.Value;
                                   Parameters.ParamByName('arquivo').Value   := 'arq/'+ qRelLaudoPRO_PROT.Value + '_' + trim(qRelLaudoPES_NOME.Value) + '.pdf';
                                   Parameters.ParamByName('usuario').Value   := CodigoUsuario;
                                   Parameters.ParamByName('datalibera').Value:= DataLiberacao;
                                   Parameters.ParamByName('protocolo').Value := qRelLaudoPRO_HASH.Value;
                                   Parameters.ParamByName('datacoleta').Value:= DateToStr(qRelLaudoPRO_DCOL.Value);

                                   if (qRelLaudoEXA_COD.Value = 'COVID-19')
                                   then begin
								                         Parameters.ParamByName('resultado').Value := qRelLaudoPRO_RESUL.Value;
                                        end;
                                   if (qRelLaudoEXA_COD.Value = 'INFLUENZA')
                                   then begin
                								          Parameters.ParamByName('resultado').Value := qRelLaudoPRO_RESUL2.Value +  ' / ' + qRelLaudoPRO_RESUL3.Value;
                                        end;
                                   if (qRelLaudoEXA_COD.Value = 'COVIDINFLU')
                                   then begin
                                         Parameters.ParamByName('resultado').Value := qRelLaudoPRO_RESUL.Value +  ' / ' + qRelLaudoPRO_RESUL2.Value +  ' / ' + qRelLaudoPRO_RESUL3.Value;
								                    		end;
                                   if (qRelLaudoEXA_COD.Value = 'PNLVIRAL')
                                   then begin
                                         Parameters.ParamByName('resultado').Value := qRelLaudoPRO_RESUL.Value +  ' / ' + qRelLaudoPRO_RESUL2.Value +  ' / ' + qRelLaudoPRO_RESUL3.Value +  ' / ' + qRelLaudoPRO_RESUL4.Value;
                                        end;
                                   ExecSQL;
                                   end;

                                   DMI.qConsultaUsuarioWeb.Close;
                                   DMI.ADOC_MYSQL.Connected := False;

                              end;
               qLancaResultado.Next;

          end;
              ShowMessage('Laudos gerados com Sucesso! (Site e Local)');
         end;

    with qLimpaXMarcados do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' update TB_PROCEDIMENTOS p set p.PRO_FG_RESUL = :Valor ');
      Parameters.ParamByName('Valor').Value := 0;
      ExecSQL;
    end;


    sbConsultar.Click;
end;


procedure TfEmissaoLaudosAgrupadoNew.GerarProtocolo1Click(Sender: TObject);
var Ano, Mes, Dia : Word;
    AnoC, MesC, DiaC, Hash : String;
    Codigo : Integer;
begin
if (qListaProcedimentosPRO_PROT.Value <> '')
then begin
      ShowMessage('Protocolo já foi gerado!');
     end else begin
                Codigo := 0;
                Codigo := qListaProcedimentosPRO_COD.Value;

                DMI.qSequencial.Close;
                DMI.qSequencial.Open;
                Sequencial := IntToStr(DMI.qSequencialSEQUENCIAL.Value + 1);
                if Length(Sequencial) = 1
                then begin
                      Sequencial := ('000' + Sequencial);
                     end else begin
                               if Length(Sequencial) = 2
                               then begin
                                     Sequencial := ('00' + Sequencial);
                                    end else begin
                                              if Length(Sequencial) = 3
                                              then begin
                                                    Sequencial := ('0' + Sequencial);
                                                   end else begin
                                                              Sequencial := (Sequencial);
                                                            end;
                                             end;
                             end;

                DECODEDATE(qListaProcedimentosPRO_DCOL.Value, Ano, Mes, Dia);
                AnoC := IntToStr(Ano);
                MesC := IntToStr(Mes);
                if Length(MesC) = 1
                then begin
                      MesC := '0' + MesC;
                     end;
                DiaC := IntToStr(Dia);
                if Length(DiaC) = 1
                then begin
                      DiaC := '0' + DiaC;
                     end;

                DMI.qSequencial.Edit;
                DMI.qSequencialSEQUENCIAL.Value := StrToInt(Sequencial);
                DMI.qSequencial.Post;

                Hash := '';
                Hash := GetRandomPassword(10, 2);

                with qIncluiProtocolo do
                begin
                Close;
                SQL.Clear;
                SQL.Add(' update TB_PROCEDIMENTOS p set p.PRO_PROT = :Valor, p.PRO_HASH = :Hash where p.PRO_COD = :Codigo');
                Parameters.ParamByName('Valor').Value  := AnoC + MesC + Sequencial;
                Parameters.ParamByName('Hash').Value   := Hash + AnoC + MesC + Sequencial;
                Parameters.ParamByName('Codigo').Value := Codigo;
                ExecSQL;
                end;
                Codigo := 0;
                sbConsultar.Click;
               end; 

end;

function TfEmissaoLaudosAgrupadoNew.GetRandomPassword(Size: Integer; Tipo : Integer = 1): String;
var
  I: Integer;
  Chave: String;
const
  str1 = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  str2 = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  str3 = '1234567890abcdefghijklmnopqrstuvwxyz';
  str4 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  str5 = '123456789089898784545465';
  str6 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  str7 = 'abcdefghijklmnopqrstuvwxyz';
begin
  Chave := '';
 
  for I := 1 to Size do
  begin
    case Tipo of
      1 : Chave := Chave + str1[Random(Length(str1)) + 1];
      2 : Chave := Chave + str2[Random(Length(str2)) + 1];
      3 : Chave := Chave + str3[Random(Length(str3)) + 1];
      4 : Chave := Chave + str4[Random(Length(str4)) + 1];
      5 : Chave := Chave + str5[Random(Length(str5)) + 1];
      6 : Chave := Chave + str6[Random(Length(str6)) + 1];
      7 : Chave := Chave + str7[Random(Length(str7)) + 1];
    end;
  end;
 
  Result := Chave;
end;

procedure TfEmissaoLaudosAgrupadoNew.sbGeraPlacaClick(Sender: TObject);
var excel :variant;
    MesGerando, LocalPlanilha, MesAtual, DataParaMapa, NomePlanilha, Hora_Mapa, NomeMonta : String;
    i, Lote, Coluna, Linha, ContadorColuna : Integer;
begin
try

  DecodeDate (Date, Ano, Mes, Dia);
  AnoA := IntToStr(Ano);
  MesA := MesExtenso(Mes);
  DiaA := IntToStr(Dia);
  if DiaA = '0'
  then begin
        DiaA:= '01';
       end;
  if Length(DiaA) = 1
  then begin
        DiaA := ('0' + DiaA);
       end;
  if (DiaA = IntToStr(01)) or (DiaA = IntToStr(-1))
  then begin
        DiaA := '01';
       end;
  Data_Mapa := DiaA +'_'+ MesA +'_'+ Copy(AnoA,3,1) + Copy(AnoA,4,1);

  Hora_Mapa := Copy(TimeToStr(Time),1,2) + '_' + Copy(TimeToStr(Time),4,2) ;

 if (UpperCase(UpperCase(GetEnvironmentVariable('COMPUTERNAME'))) = 'NCPESEDE008306') or (UpperCase(UpperCase(GetEnvironmentVariable('COMPUTERNAME'))) = 'NCPESEDE008306')
 then begin
      NomeMonta     := '';
      NomeMonta     := 'covid_' +  DiaA +'_'+ MesA +'_' + Copy(AnoA,3,2) + '_' + Hora_Mapa;
      NomePlanilha  := 'C:\SCPG\Documentos_Gerados\' + NomeMonta + '.xls';
      LocalPlanilha := 'C:\SCPG\Modelos\MODELO_PLACA_COVID.xls';
     end else begin
               NomeMonta     := '';
               NomeMonta     := 'covid_' +  DiaA +'_'+ MesA +'_' + Copy(AnoA,3,2) + '_' + Hora_Mapa;
               NomePlanilha := 'U:\CPG\SCPG\Documentos_Gerados\' + NomeMonta + '.xls';
               LocalPlanilha := 'U:\CPG\SCPG\Modelos\MODELO_PLACA_COVID.xls';
              end;

  excel := CreateOleObject('Excel.Application');
  if not Excel.Application.Visible then
  Excel.WorkBooks.Open(LocalPlanilha);

  Linha  := 5;
  Coluna := 9;
  ContadorColuna := 1;

  qSelecionaCasosMapas.Close;
  qSelecionaCasosMapas.Open;

  qSelecionaCasosMapas.First;
  while not qSelecionaCasosMapas.Eof do
  begin
   if (ContadorColuna <= 95)
   then begin
         Excel.WorkBooks[1].Sheets[2].Cells[Linha,Coluna]:= qSelecionaCasosMapasPRO_PROT.Value;
         Coluna         := Coluna - 1 ;
         ContadorColuna := ContadorColuna + 1;

         if (Coluna > 1)
         then begin
                Coluna := Coluna;
              end else begin
                        Coluna := 9;
                        Linha  := Linha + 1;
                       end;
         qSelecionaCasosMapas.Next;
        end;
       end;

  Showmessage('Ver o arquivo Excel na Pasta "U:\CPG\SCPG\Documentos_Gerados\"');
  Excel.Application.Visible := true;

  Excel.ActiveWorkBook.SaveAs(NomePlanilha);
  Excel.quit;
  Excel:=unassigned;

except
showmessage('Ocorreu erro ao executar a transferência');
end;
end;


procedure TfEmissaoLaudosAgrupadoNew.sbGerarProtocoloClick(
  Sender: TObject);
var Ano, Mes, Dia : Word;
    AnoC, MesC, DiaC, Hash : String;
    Codigo : Integer;
begin

if MessageDlg(' Confirma a Geração dos Protocolos em Lote? ',mtconfirmation,[mbyes,mbno],0) = mryes
then begin
      qLancaResultado.Close;
      qLancaResultado.SQL.Clear;
      qLancaResultado.SQL.Add(' select * from tb_PROCEDIMENTOS pr');
      qLancaResultado.SQL.Add(' where pr.PRO_FG_RESUL = :Valor and pr.pro_prot is null ');
      qLancaResultado.Parameters.ParamByName('Valor').Value := 1;
      qLancaResultado.open;

      qLancaResultado.First;
      while qLancaResultado.Eof = False  do
      begin
        Codigo := 0;
        Codigo := qLancaResultadoPRO_COD.Value;

        DMI.qSequencial.Close;
        DMI.qSequencial.Open;
        Sequencial := IntToStr(DMI.qSequencialSEQUENCIAL.Value + 1);
        if Length(Sequencial) = 1
        then begin
              Sequencial := ('000' + Sequencial);
             end else begin
                       if Length(Sequencial) = 2
                       then begin
                             Sequencial := ('00' + Sequencial);
                            end else begin
                                      if Length(Sequencial) = 3
                                      then begin
                                            Sequencial := ('0' + Sequencial);
                                           end else begin
                                                      Sequencial := (Sequencial);
                                                    end;
                                     end;
                     end;
        DECODEDATE(qLancaResultadoPRO_DCOL.Value, Ano, Mes, Dia);
        AnoC := IntToStr(Ano);
        MesC := IntToStr(Mes);
        if Length(MesC) = 1
        then begin
              MesC := '0' + MesC;
             end;
        DiaC := IntToStr(Dia);
        if Length(DiaC) = 1
        then begin
              DiaC := '0' + DiaC;
             end;

        DMI.qSequencial.Edit;
        DMI.qSequencialSEQUENCIAL.Value := StrToInt(Sequencial);
        DMI.qSequencial.Post;

        Hash := '';
        Hash := GetRandomPassword(10, 2);

        with qIncluiProtocolo do
        begin
        Close;
        SQL.Clear;
        SQL.Add(' update TB_PROCEDIMENTOS p set p.PRO_PROT = :Valor, p.PRO_HASH = :Hash where p.PRO_COD = :Codigo');
        Parameters.ParamByName('Valor').Value  := AnoC + MesC + Sequencial;
        Parameters.ParamByName('Hash').Value   := Hash + AnoC + MesC + Sequencial;
        Parameters.ParamByName('Codigo').Value := Codigo;
        ExecSQL;
        end;

       qLancaResultado.Next;
      end;
    end;  
sbConsultar.Click;
end;

procedure TfEmissaoLaudosAgrupadoNew.PcientesConsulta1Click(
  Sender: TObject);
begin
 DMI.qPacientes.Open;
 Application.CreateForm(TfPacientes, fPacientes);
 DMI.qPacientes.Edit;
 if DMI.qPacientes.Locate('PES_COD', qListaProcedimentosPES_COD.Value, []) = True
 then begin
       fPacientes.Showmodal;
       fPacientes.Free;
       DMI.qPacientes.Close;
       DMI.qPacientes.Open;
       DMI.qConsultaPacientes.Close;
       DMI.qConsultaPacientes.Open;
      end;

end;

procedure TfEmissaoLaudosAgrupadoNew.GerarEtiqueta1Click(Sender: TObject);
begin
 DMI.qInfecto.Close;
 DMI.qInfecto.Parameters.ParamByName('Codigo').Value := qListaProcedimentosPRO_COD.Value;
 DMI.qInfecto.Open;

 Application.CreateForm(TfImprimeComprovante,fImprimeComprovante);
 fImprimeComprovante.RLA_NOME_2.Caption      :=  DMI.qInfectoPES_NOME.Value;
 fImprimeComprovante.RLA_CASODATA_2.Caption  :=  'Caso: ' + IntToStr(DMI.qInfectoPRO_COD.Value) + ' / Dt. Amostra: ' + DateToStr(DMI.qInfectoPRO_DCOL.Value);
 fImprimeComprovante.RLA_PRAZO_2.Caption     :=  'Prazo: ' + DMI.qInfectoPRO_PRAZO.Value;
 fImprimeComprovante.RLA_CONVENIO_2.Caption  :=  'Origem: ' + DMI.qInfectoLAB_LABT.Value;
 fImprimeComprovante.RLBcode.Caption         :=  IntToStr(DMI.qInfectoPRO_COD.Value);
 fImprimeComprovante.RLBcode.Width           :=  32;
 fImprimeComprovante.RLR_Infecto2.Preview(nil);
 fImprimeComprovante.Free;
end;

procedure TfEmissaoLaudosAgrupadoNew.CasoConsulta1Click(Sender: TObject);
begin
 if DMI.qProcedimentos.Locate('PRO_COD', qListaProcedimentosPRO_COD.Value, []) = True
 then begin
        Close;
      end;

end;

procedure TfEmissaoLaudosAgrupadoNew.sbGeraEtiquetasClick(Sender: TObject);
begin
 DMI.qInfectoEtiquetas.Close;
 DMI.qInfectoEtiquetas.Open;

 Application.CreateForm(TfImprimeComprovante,fImprimeComprovante);
 fImprimeComprovante.RLR_Infecto3.Preview(nil);
 fImprimeComprovante.Free;
end;

procedure TfEmissaoLaudosAgrupadoNew.Laudo1Click(Sender: TObject);
var DataHoje, AnoA, MesA, DiaA, NomeLaudoPDF, Desc_Sensibilidade, Resultado, CPF, DataLiberacao : String;
    Linha, CodigoUsuario : Integer;
    Ano, Mes, Dia : Word;
    DataGerada : TDateTime;
begin
  inherited;
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
        DataHoje := Format('%.2d',[Dia]) +' de '+ MesA +' de '+ AnoA + '.';
       end else DataHoje := DiaA +' de '+ MesA +' de '+ AnoA + '.';

  if ((qListaProcedimentosRESULTADO_COVID.Value = '') and (qListaProcedimentosRESULTADO_INFLUA.Value = ''))
  then begin
        ShowMessage('Não tem resultado lançado!!!');
       end else begin

                  qRelLaudo.Close;
                  qRelLaudo.Parameters.ParamByName('CODIGO').Value := qListaProcedimentosPRO_COD.Value;
                  qRelLaudo.Open;

                   if (qRelLaudoEXA_COD.Value = 'COVID-19')
                   then begin
                           // Laudo Covid
                           Application.CreateForm(TfImprimeLaudo,fImprimeLaudo);
                           fImprimeLaudo.RLDataHoje.Caption     := '';
                           fImprimeLaudo.RLL_DATAS.Caption      := '';
                           fImprimeLaudo.RLL_RESULTADOS.Caption := '';
                           fImprimeLaudo.RLL_PROTOCOLO.Caption  := '';
                           fImprimeLaudo.RLL_CONVENIO.Caption   := '';
                           fImprimeLaudo.RLL_Code.Caption       := '';

                           fImprimeLaudo.RLL_PACIENTE.Caption   := '';
                           fImprimeLaudo.RLL_PACIENTEP.Caption   := '';
                           fImprimeLaudo.RLL_PASSDTNAS.Caption   := '';

                           fImprimeLaudo.RLDataHoje.Caption     := DataHoje;
                           if ((qRelLaudoPRO_HCOL.Value > 0) and (qRelLaudoPRO_HCOL.Value <> 44252))
                           then begin
                                  fImprimeLaudo.RLL_DATAS.Font.Size := 10;
                                  fImprimeLaudo.RLL_DATAS.Caption   := DateToStr(qRelLaudoPRO_DCOL.Value) + '/' + qRelLaudoPRO_DCOL_I.Value + ' - ' + Copy(TimeToStr(qRelLaudoPRO_HCOL.Value),1,5) + '/' + qRelLaudoPRO_HCOL_I.Value;
                                end else fImprimeLaudo.RLL_DATAS.Caption  := DateToStr(qRelLaudoPRO_DCOL.Value) + ' / ' + qRelLaudoPRO_DCOL_I.Value;
                           fImprimeLaudo.RLL_RESULTADOS.Caption := qRelLaudoPRO_RESUL.Value + ' / ' + qRelLaudoPRO_RESUL_I.Value;
                           fImprimeLaudo.RLL_PROTOCOLO.Caption  := qRelLaudoPRO_PROT.Value;
                           fImprimeLaudo.RLL_CONVENIO.Caption   := qRelLaudoLAB_LABT.Value;
                           fImprimeLaudo.RLL_Code.Caption       := qRelLaudoPRO_HASH.Value;

                           if (qRelLaudoPES_PASS.Value <> '')
                           then begin
                                 fImprimeLaudo.RLL_PACIENTE.Caption   := '';
                                 fImprimeLaudo.RLL_PACIENTE.Visible   := False;
                                 fImprimeLaudo.RLL_PACIENTEP.Visible  := True;
                                 fImprimeLaudo.RLL_PASSDTNAS.Visible  := True;
                                 fImprimeLaudo.RLL_PACIENTEP.Caption  := trim(qRelLaudoPES_NOME.Value);
                                 fImprimeLaudo.RLL_PASSDTNAS.Caption  := trim(qRelLaudoPES_PASS.Value) + ' -  BIRTH ' + Copy(DateToStr(qRelLaudoPES_DNAS.Value),1,2) + '-' + Copy(DateToStr(qRelLaudoPES_DNAS.Value),4,2) + '-' + Copy(DateToStr(qRelLaudoPES_DNAS.Value),7,4) ;
                               end else begin
                                         fImprimeLaudo.RLL_PACIENTE.Visible   := True;
                                         fImprimeLaudo.RLL_PACIENTE.Caption   := trim(qRelLaudoPES_NOME.Value);
                                         fImprimeLaudo.RLL_PACIENTEP.Caption  := '';
                                         fImprimeLaudo.RLL_PASSDTNAS.Caption  := '';
                                         fImprimeLaudo.RLL_PACIENTEP.Visible  := False;
                                         fImprimeLaudo.RLL_PASSDTNAS.Visible  := False;

                                       end;
                         fImprimeLaudo.RLReport_New.Preview(nil);
                         fImprimeLaudo.Free;
                         //Laudo Covid
                      end;

                     if (qRelLaudoEXA_COD.Value <> 'COVID-19')
                     then begin
                           Application.CreateForm(TfImprimeLaudo2,fImprimeLaudo2);
                           fImprimeLaudo2.RLDataHoje.Caption      := '';
                           fImprimeLaudo2.RLL_DATAS.Caption       := '';
                           fImprimeLaudo2.RLL_RESULTADOS.Caption  := '';
                           fImprimeLaudo2.RLL_RESULTADOS2.Caption := '';
                           fImprimeLaudo2.RLL_RESULTADOS3.Caption := '';
                           fImprimeLaudo2.RLL_RESULTADOS4.Caption := '';
                           fImprimeLaudo2.RLL_PROTOCOLO.Caption   := '';
                           fImprimeLaudo2.RLL_Code.Caption        := '';
                           fImprimeLaudo2.RLL_PACIENTE.Caption    := '';

                           fImprimeLaudo2.RLDataHoje.Caption     := DataHoje;
                           if ((qRelLaudoPRO_HCOL.Value > 0) and (qRelLaudoPRO_HCOL.Value <> 44252))
                           then begin
                                  fImprimeLaudo2.RLL_DATAS.Font.Size := 10;
                                  fImprimeLaudo2.RLL_DATAS.Caption   := DateToStr(qRelLaudoPRO_DCOL.Value) + '/' + qRelLaudoPRO_DCOL_I.Value + ' - ' + Copy(TimeToStr(qRelLaudoPRO_HCOL.Value),1,5) + '/' + qRelLaudoPRO_HCOL_I.Value;
                                end else fImprimeLaudo2.RLL_DATAS.Caption  := DateToStr(qRelLaudoPRO_DCOL.Value) + ' / ' + qRelLaudoPRO_DCOL_I.Value;

                           if (qRelLaudoEXA_COD.Value = 'INFLUENZA')
                           then begin
                                 fImprimeLaudo2.RLL_ANALISE.Caption     := 'Influenza A e B Teste Rápido';
                                 fImprimeLaudo2.RLL_RESULTADOS.Caption  := 'INFLUENZA A : ' + qRelLaudoPRO_RESUL2.Value + ' / ' + qRelLaudoPRO_RESUL_I2.Value;
                                 fImprimeLaudo2.RLL_RESULTADOS2.Caption := 'INFLUENZA B : ' + qRelLaudoPRO_RESUL3.Value + ' / ' + qRelLaudoPRO_RESUL_I3.Value;
                                 fImprimeLaudo2.RLL_RESULTADOS3.Visible := False;
                                 fImprimeLaudo2.RLL_RESULTADOS4.Visible := False;

                                 fImprimeLaudo2.RL_MEMO_INFLUENZA_PORT.Visible := True;
                                 fImprimeLaudo2.RL_MEMO_INFLUENZA_INGL.Visible := True;
                                 fImprimeLaudo2.RL_MEMO_COVID_PORT.Visible     := False;
                                 fImprimeLaudo2.RL_MEMO_COVID_INGL.Visible     := False;
                                end;
                           if (qRelLaudoEXA_COD.Value = 'COVIDINFLU')
                           then begin
                                 fImprimeLaudo2.RLL_ANALISE.Caption     := 'RT-PCR para Covid + Influenza A e B Teste Rápido';
                                 fImprimeLaudo2.RLL_RESULTADOS.Caption  := 'COVID-19 : '    + qRelLaudoPRO_RESUL.Value + ' / ' + qRelLaudoPRO_RESUL_I.Value;
                                 fImprimeLaudo2.RLL_RESULTADOS2.Caption := 'INFLUENZA A : ' + qRelLaudoPRO_RESUL2.Value + ' / ' + qRelLaudoPRO_RESUL_I2.Value;
                                 fImprimeLaudo2.RLL_RESULTADOS3.Caption := 'INFLUENZA B : ' + qRelLaudoPRO_RESUL3.Value + ' / ' + qRelLaudoPRO_RESUL_I3.Value;
                                 fImprimeLaudo2.RLL_RESULTADOS4.Visible := False;

                                 fImprimeLaudo2.RL_MEMO_INFLUENZA_PORT.Visible := False;
                                 fImprimeLaudo2.RL_MEMO_INFLUENZA_INGL.Visible := False;
                                 fImprimeLaudo2.RL_MEMO_COVID_PORT.Visible     := True;
                                 fImprimeLaudo2.RL_MEMO_COVID_INGL.Visible     := True;
                                end;
                           if (qRelLaudoEXA_COD.Value = 'PNLVIRAL')
                           then begin
                                 fImprimeLaudo2.RLL_ANALISE.Caption     := 'RT-PCR Painel Viral';
                                 fImprimeLaudo2.RLL_RESULTADOS.Caption  := 'COVID-19 : '    + qRelLaudoPRO_RESUL.Value + ' / ' + qRelLaudoPRO_RESUL_I.Value;
                                 fImprimeLaudo2.RLL_RESULTADOS2.Caption := 'INFLUENZA A : ' + qRelLaudoPRO_RESUL2.Value + ' / ' + qRelLaudoPRO_RESUL_I2.Value;
                                 fImprimeLaudo2.RLL_RESULTADOS3.Caption := 'INFLUENZA B : ' + qRelLaudoPRO_RESUL3.Value + ' / ' + qRelLaudoPRO_RESUL_I3.Value;
                                 fImprimeLaudo2.RLL_RESULTADOS4.Caption := 'VÍRUS SINCICIAL : ' + qRelLaudoPRO_RESUL4.Value + ' / ' + qRelLaudoPRO_RESUL_I4.Value;

                                 fImprimeLaudo2.RL_MEMO_INFLUENZA_PORT.Visible := False;
                                 fImprimeLaudo2.RL_MEMO_INFLUENZA_INGL.Visible := False;
                                 fImprimeLaudo2.RL_MEMO_COVID_PORT.Visible     := True;
                                 fImprimeLaudo2.RL_MEMO_COVID_INGL.Visible     := True;
                                end;

                          fImprimeLaudo2.RLL_PROTOCOLO.Caption  := qRelLaudoPRO_PROT.Value;
                          fImprimeLaudo2.RLL_Code.Caption       := qRelLaudoPRO_HASH.Value;

                          fImprimeLaudo2.RLL_PACIENTE.Visible   := True;
                          fImprimeLaudo2.RLL_PACIENTE.Caption   := trim(qRelLaudoPES_NOME.Value);

                          fImprimeLaudo2.RLReport_New.Preview(nil);
                          fImprimeLaudo2.Free;
                       end;



                  DMI.qStatusProcedimentos.Close;
                  DMI.qStatusProcedimentos.Open;
                  DMI.qStatusProcedimentos.Append;
                  DMI.qStatusProcedimentosPRO_COD.Value    := qListaProcedimentosPRO_COD.Value;
                  DMI.qStatusProcedimentosSTP_DATA.Value   := Date;
                  DMI.qStatusProcedimentosSTP_STATUS.Value := 4;
                  DMI.qStatusProcedimentosSTP_DESC.Value   := 'Laudo já foi impresso';
                  DMI.qStatusProcedimentos.Post;

                end;

end;


procedure TfEmissaoLaudosAgrupadoNew.sbInverterClick(Sender: TObject);
begin
qListaProcedimentos.First;
while qListaProcedimentos.Eof = False do
begin
  with qLimpaXMarcados do
  begin
  Close;
  SQL.Clear;
  SQL.Add(' update TB_PROCEDIMENTOS p set p.PRO_FG_RESUL = :NewValor where p.PRO_COD = :Codigo and p.PRO_FG_RESUL = :Valor ');
  Parameters.ParamByName('NewValor').Value:= 2;
  Parameters.ParamByName('Valor').Value   := 1;
  Parameters.ParamByName('Codigo').Value  := qListaProcedimentosPRO_COD.Value;
  ExecSQL;
  end;
  qListaProcedimentos.Next
end;

qListaProcedimentos.First;
while qListaProcedimentos.Eof = False do
begin
  with qLimpaXMarcados do
  begin
  Close;
  SQL.Clear;
  SQL.Add(' update TB_PROCEDIMENTOS p set p.PRO_FG_RESUL = :NewValor where p.PRO_COD = :Codigo and p.PRO_FG_RESUL = :Valor ');
  Parameters.ParamByName('NewValor').Value:= 1;
  Parameters.ParamByName('Valor').Value   := 0;
  Parameters.ParamByName('Codigo').Value  := qListaProcedimentosPRO_COD.Value;
  ExecSQL;
  end;
  qListaProcedimentos.Next
end;

qListaProcedimentos.First;
while qListaProcedimentos.Eof = False do
begin
  with qLimpaXMarcados do
  begin
  Close;
  SQL.Clear;
  SQL.Add(' update TB_PROCEDIMENTOS p set p.PRO_FG_RESUL = :NewValor where p.PRO_COD = :Codigo and p.PRO_FG_RESUL = :Valor ');
  Parameters.ParamByName('NewValor').Value:= 0;
  Parameters.ParamByName('Valor').Value   := 2;
  Parameters.ParamByName('Codigo').Value  := qListaProcedimentosPRO_COD.Value;
  ExecSQL;
  end;
  qListaProcedimentos.Next
end;

sbConsultar.Click;

end;

procedure TfEmissaoLaudosAgrupadoNew.sbSelProtocolosClick(Sender: TObject);
begin

qListaProcedimentos.First;
while qListaProcedimentos.Eof = False do
begin
  with qLimpaXMarcados do
  begin
  Close;
  SQL.Clear;
  SQL.Add(' update TB_PROCEDIMENTOS p set p.PRO_FG_RESUL = :NewValor where p.PRO_COD = :Codigo ');
  Parameters.ParamByName('NewValor').Value:= 0;
  Parameters.ParamByName('Codigo').Value  := qListaProcedimentosPRO_COD.Value;
  ExecSQL;
  end;
  qListaProcedimentos.Next
end;

qListaProcedimentos.First;
while qListaProcedimentos.Eof = False do
begin
  with qLimpaXMarcados do
  begin
  Close;
  SQL.Clear;
  SQL.Add(' update TB_PROCEDIMENTOS p set p.PRO_FG_RESUL = :NewValor where p.PRO_COD = :Codigo and p.PRO_PROT IS NOT NULL ');
  Parameters.ParamByName('NewValor').Value:= 1;
  Parameters.ParamByName('Codigo').Value  := qListaProcedimentosPRO_COD.Value;
  ExecSQL;
  end;
  qListaProcedimentos.Next
end;

sbConsultar.Click;
end;

procedure TfEmissaoLaudosAgrupadoNew.EnviarLaudoSiteArquivo1Click(
  Sender: TObject);
var DataHoje, AnoA, MesA, DiaA, NomeLaudoPDF, Desc_Sensibilidade, Resultado, CPF, DataLiberacao : String;
    Linha, CodigoUsuario : Integer;
    Ano, Mes, Dia : Word;
    DataGerada : TDateTime;
begin

qRelLaudo.Close;
qRelLaudo.Parameters.ParamByName('CODIGO').Value := qListaProcedimentosPRO_COD.Value;
qRelLaudo.Open;

DecodeDate (Date, Ano, Mes, Dia);
AnoA := IntToStr(Ano);
MesA := MesExtenso(Mes);
DiaA := IntToStr(Dia);
if DiaA = IntToStr(1)
then begin
DiaA := 'Primeiro';
end;
DataHoje := DiaA +' de '+ MesA +' de '+ AnoA + '.';

if (qRelLaudoLAB_COD_INTERNET.Value > 0)
then begin
       //Regra Data Liberação
        if (qRelLaudoPRO_PRAZO.Value = 'MESMO DIA')
        then begin
              DataLiberacao := Copy(DateToStr(qRelLaudoPRO_DCOL.Value),7,4) + '-' + Copy(DateToStr(qRelLaudoPRO_DCOL.Value),4,2) + '-'  + Copy(DateToStr(qRelLaudoPRO_DCOL.Value),1,2) + ' 18:00:00';
             end;
        if (qRelLaudoPRO_PRAZO.Value = '6 HORAS')
        then begin
              DataLiberacao := Copy(DateToStr(qRelLaudoPRO_DCOL.Value),7,4) + '-' + Copy(DateToStr(qRelLaudoPRO_DCOL.Value),4,2) + '-'  + Copy(DateToStr(qRelLaudoPRO_DCOL.Value),1,2) + ' 02:00:00';
             end;
        if (qRelLaudoPRO_PRAZO.Value = '24 HORAS')
        then begin
              DataGerada := IncDay(qRelLaudoPRO_DCOL.Value, 1);
              DataLiberacao := Copy(DateToStr(DataGerada),7,4) + '-' + Copy(DateToStr(DataGerada),4,2) + '-' + Copy(DateToStr(DataGerada),1,2) + ' 10:00:00';
             end;
        if (qRelLaudoPRO_PRAZO.Value = '48 HORAS')
        then begin
              DataGerada := IncDay(qRelLaudoPRO_DCOL.Value, 2);
              DataLiberacao := Copy(DateToStr(DataGerada),7,4) + '-' + Copy(DateToStr(DataGerada),4,2) + '-' + Copy(DateToStr(DataGerada),1,2) + ' 10:00:00';
             end;
        if (qRelLaudoPRO_PRAZO.Value = '72 HORAS')
        then begin
              DataGerada := IncDay(qRelLaudoPRO_DCOL.Value, 3);
              DataLiberacao := Copy(DateToStr(DataGerada),7,4) + '-' + Copy(DateToStr(DataGerada),4,2) + '-' + Copy(DateToStr(DataGerada),1,2) + ' 10:00:00';
             end;

                             if (qRelLaudoEXA_COD.Value = 'COVID-19')
                             then begin
                                     // Laudo Covid
                                     Application.CreateForm(TfImprimeLaudo,fImprimeLaudo);
                                     fImprimeLaudo.RLDataHoje.Caption     := '';
                                     fImprimeLaudo.RLL_DATAS.Caption      := '';
                                     fImprimeLaudo.RLL_RESULTADOS.Caption := '';
                                     fImprimeLaudo.RLL_PROTOCOLO.Caption  := '';
                                     fImprimeLaudo.RLL_CONVENIO.Caption   := '';
                                     fImprimeLaudo.RLL_Code.Caption       := '';

                                     fImprimeLaudo.RLL_PACIENTE.Caption   := '';
                                     fImprimeLaudo.RLL_PACIENTEP.Caption   := '';
                                     fImprimeLaudo.RLL_PASSDTNAS.Caption   := '';

                                     fImprimeLaudo.RLDataHoje.Caption     := DataHoje;
                                     if ((qRelLaudoPRO_HCOL.Value > 0) and (qRelLaudoPRO_HCOL.Value <> 44252))
                                     then begin
                                            fImprimeLaudo.RLL_DATAS.Font.Size := 10;
                                            fImprimeLaudo.RLL_DATAS.Caption   := DateToStr(qRelLaudoPRO_DCOL.Value) + '/' + qRelLaudoPRO_DCOL_I.Value + ' - ' + Copy(TimeToStr(qRelLaudoPRO_HCOL.Value),1,5) + '/' + qRelLaudoPRO_HCOL_I.Value;
                                          end else fImprimeLaudo.RLL_DATAS.Caption  := DateToStr(qRelLaudoPRO_DCOL.Value) + ' / ' + qRelLaudoPRO_DCOL_I.Value;
                                     fImprimeLaudo.RLL_RESULTADOS.Caption := qRelLaudoPRO_RESUL.Value + ' / ' + qRelLaudoPRO_RESUL_I.Value;
                                     fImprimeLaudo.RLL_PROTOCOLO.Caption  := qRelLaudoPRO_PROT.Value;
                                     fImprimeLaudo.RLL_CONVENIO.Caption   := qRelLaudoLAB_LABT.Value;
                                     fImprimeLaudo.RLL_Code.Caption       := qRelLaudoPRO_HASH.Value;

                                     if (qRelLaudoPES_PASS.Value <> '')
                                     then begin
                                           fImprimeLaudo.RLL_PACIENTE.Caption   := '';
                                           fImprimeLaudo.RLL_PACIENTE.Visible   := False;
                                           fImprimeLaudo.RLL_PACIENTEP.Visible  := True;
                                           fImprimeLaudo.RLL_PASSDTNAS.Visible  := True;
                                           fImprimeLaudo.RLL_PACIENTEP.Caption  := trim(qRelLaudoPES_NOME.Value);
                                           fImprimeLaudo.RLL_PASSDTNAS.Caption  := trim(qRelLaudoPES_PASS.Value) + ' -  BIRTH ' + Copy(DateToStr(qRelLaudoPES_DNAS.Value),1,2) + '-' + Copy(DateToStr(qRelLaudoPES_DNAS.Value),4,2) + '-' + Copy(DateToStr(qRelLaudoPES_DNAS.Value),7,4) ;
                                         end else begin
                                                   fImprimeLaudo.RLL_PACIENTE.Visible   := True;
                                                   fImprimeLaudo.RLL_PACIENTE.Caption   := trim(qRelLaudoPES_NOME.Value);
                                                   fImprimeLaudo.RLL_PACIENTEP.Caption  := '';
                                                   fImprimeLaudo.RLL_PASSDTNAS.Caption  := '';
                                                   fImprimeLaudo.RLL_PACIENTEP.Visible  := False;
                                                   fImprimeLaudo.RLL_PASSDTNAS.Visible  := False;

                                                  end;


                                     if (UpperCase(UpperCase(GetEnvironmentVariable('COMPUTERNAME'))) = 'NCPESEDE008306') or (UpperCase(UpperCase(GetEnvironmentVariable('COMPUTERNAME'))) = 'NCPESEDE008306')
                                     then begin
                                            NomeLaudoPDF := 'C:\SCPG\Documentos_Gerados\' + qRelLaudoPRO_PROT.Value + '_' + trim(qRelLaudoPES_NOME.Value) + '.pdf';
                                          end else NomeLaudoPDF := 'U:\Laboratorio\Infecciosas\Covid\' + qRelLaudoPRO_PROT.Value + '_' + trim(qRelLaudoPES_NOME.Value) + '.pdf';
                                   fImprimeLaudo.RLReport_New.SaveToFile(NomeLaudoPDF) ;
                                   fImprimeLaudo.Free;
                                end;
                             if (qRelLaudoEXA_COD.Value <> 'COVID-19')
                             then begin
                                    // Laudo Covid
                                   Application.CreateForm(TfImprimeLaudo2,fImprimeLaudo2);
                                   fImprimeLaudo2.RLDataHoje.Caption      := '';
                                   fImprimeLaudo2.RLL_DATAS.Caption       := '';
                                   fImprimeLaudo2.RLL_RESULTADOS.Caption  := '';
                                   fImprimeLaudo2.RLL_RESULTADOS2.Caption := '';
                                   fImprimeLaudo2.RLL_RESULTADOS3.Caption := '';
                                   fImprimeLaudo2.RLL_RESULTADOS4.Caption := '';
                                   fImprimeLaudo2.RLL_PROTOCOLO.Caption   := '';
                                   fImprimeLaudo2.RLL_Code.Caption        := '';
                                   fImprimeLaudo2.RLL_PACIENTE.Caption    := '';

                                   fImprimeLaudo2.RLDataHoje.Caption     := DataHoje;
                                   if ((qRelLaudoPRO_HCOL.Value > 0) and (qRelLaudoPRO_HCOL.Value <> 44252))
                                   then begin
                                          fImprimeLaudo2.RLL_DATAS.Font.Size := 10;
                                          fImprimeLaudo2.RLL_DATAS.Caption   := DateToStr(qRelLaudoPRO_DCOL.Value) + '/' + qRelLaudoPRO_DCOL_I.Value + ' - ' + Copy(TimeToStr(qRelLaudoPRO_HCOL.Value),1,5) + '/' + qRelLaudoPRO_HCOL_I.Value;
                                        end else fImprimeLaudo2.RLL_DATAS.Caption  := DateToStr(qRelLaudoPRO_DCOL.Value) + ' / ' + qRelLaudoPRO_DCOL_I.Value;

                                   if (qRelLaudoEXA_COD.Value = 'INFLUENZA')
                                   then begin
                                         fImprimeLaudo2.RLL_ANALISE.Caption     := 'Influenza A e B Teste Rápido';
                                         fImprimeLaudo2.RLL_RESULTADOS.Caption  := 'INFLUENZA A : ' + qRelLaudoPRO_RESUL2.Value + ' / ' + qRelLaudoPRO_RESUL_I2.Value;
                                         fImprimeLaudo2.RLL_RESULTADOS2.Caption := 'INFLUENZA B : ' + qRelLaudoPRO_RESUL3.Value + ' / ' + qRelLaudoPRO_RESUL_I3.Value;
                                         fImprimeLaudo2.RLL_RESULTADOS3.Visible := False;
                                         fImprimeLaudo2.RLL_RESULTADOS4.Visible := False;

                                         fImprimeLaudo2.RL_MEMO_INFLUENZA_PORT.Visible := True;
                                         fImprimeLaudo2.RL_MEMO_INFLUENZA_INGL.Visible := True;
                                         fImprimeLaudo2.RL_MEMO_COVID_PORT.Visible     := False;
                                         fImprimeLaudo2.RL_MEMO_COVID_INGL.Visible     := False;
                                        end;
                                   if (qRelLaudoEXA_COD.Value = 'COVIDINFLU')
                                   then begin
                                         fImprimeLaudo2.RLL_ANALISE.Caption     := 'RT-PCR para Covid + Influenza A e B Teste Rápido';
                                         fImprimeLaudo2.RLL_RESULTADOS.Caption  := 'COVID-19 : '    + qRelLaudoPRO_RESUL.Value + ' / ' + qRelLaudoPRO_RESUL_I.Value;
                                         fImprimeLaudo2.RLL_RESULTADOS2.Caption := 'INFLUENZA A : ' + qRelLaudoPRO_RESUL2.Value + ' / ' + qRelLaudoPRO_RESUL_I2.Value;
                                         fImprimeLaudo2.RLL_RESULTADOS3.Caption := 'INFLUENZA B : ' + qRelLaudoPRO_RESUL3.Value + ' / ' + qRelLaudoPRO_RESUL_I3.Value;
                                         fImprimeLaudo2.RLL_RESULTADOS4.Visible := False;

                                         fImprimeLaudo2.RL_MEMO_INFLUENZA_PORT.Visible := False;
                                         fImprimeLaudo2.RL_MEMO_INFLUENZA_INGL.Visible := False;
                                         fImprimeLaudo2.RL_MEMO_COVID_PORT.Visible     := True;
                                         fImprimeLaudo2.RL_MEMO_COVID_INGL.Visible     := True;
                                        end;
                                   if (qRelLaudoEXA_COD.Value = 'PNLVIRAL')
                                   then begin
                                         fImprimeLaudo2.RLL_ANALISE.Caption     := 'RT-PCR Painel Viral';
                                         fImprimeLaudo2.RLL_RESULTADOS.Caption  := 'COVID-19 : '    + qRelLaudoPRO_RESUL.Value + ' / ' + qRelLaudoPRO_RESUL_I.Value;
                                         fImprimeLaudo2.RLL_RESULTADOS2.Caption := 'INFLUENZA A : ' + qRelLaudoPRO_RESUL2.Value + ' / ' + qRelLaudoPRO_RESUL_I2.Value;
                                         fImprimeLaudo2.RLL_RESULTADOS2.Caption := 'INFLUENZA B : ' + qRelLaudoPRO_RESUL3.Value + ' / ' + qRelLaudoPRO_RESUL_I3.Value;
                                         fImprimeLaudo2.RLL_RESULTADOS2.Caption := 'VÍRUS SINCICIAL : ' + qRelLaudoPRO_RESUL4.Value + ' / ' + qRelLaudoPRO_RESUL_I4.Value;

                                         fImprimeLaudo2.RL_MEMO_INFLUENZA_PORT.Visible := False;
                                         fImprimeLaudo2.RL_MEMO_INFLUENZA_INGL.Visible := False;
                                         fImprimeLaudo2.RL_MEMO_COVID_PORT.Visible     := True;
                                         fImprimeLaudo2.RL_MEMO_COVID_INGL.Visible     := True;
                                        end;

                                  fImprimeLaudo2.RLL_PROTOCOLO.Caption  := qRelLaudoPRO_PROT.Value;
                                  fImprimeLaudo2.RLL_Code.Caption       := qRelLaudoPRO_HASH.Value;

                                   fImprimeLaudo2.RLL_PACIENTE.Visible   := True;
                                   fImprimeLaudo2.RLL_PACIENTE.Caption   := trim(qRelLaudoPES_NOME.Value);

                                   if (UpperCase(UpperCase(GetEnvironmentVariable('COMPUTERNAME'))) = 'NCPESEDE008306') or (UpperCase(UpperCase(GetEnvironmentVariable('COMPUTERNAME'))) = 'NCPESEDE008306')
                                   then begin
                                          NomeLaudoPDF := 'C:\SCPG\Documentos_Gerados\' + qRelLaudoPRO_PROT.Value + '_' + trim(qRelLaudoPES_NOME.Value) + '.pdf';
                                        end else NomeLaudoPDF := 'U:\Laboratorio\Infecciosas\Covid\' + qRelLaudoPRO_PROT.Value + '_' + trim(qRelLaudoPES_NOME.Value) + '.pdf';
                                  fImprimeLaudo2.RLReport_New.SaveToFile(NomeLaudoPDF) ;
                                  fImprimeLaudo2.Free;
                                 //Laudo Covid

                               end;

      DMI.qStatusProcedimentos.Close;
      DMI.qStatusProcedimentos.Open;
      DMI.qStatusProcedimentos.Append;
      DMI.qStatusProcedimentosPRO_COD.Value    := qListaProcedimentosPRO_COD.Value;
      DMI.qStatusProcedimentosSTP_DATA.Value   := Date;
      DMI.qStatusProcedimentosSTP_STATUS.Value := 4;
      DMI.qStatusProcedimentosSTP_DESC.Value   := 'Laudo já foi impresso';
      DMI.qStatusProcedimentos.Post;

// ENVIAR PARA SITE


   DMI.ADOC_MYSQL.Connected := True;

   DMI.qVerificaArquivo.Close;
   DMI.qVerificaArquivo.Parameters.ParamByName('Nome').Value   := qRelLaudoPES_NOME.Value;
   DMI.qVerificaArquivo.Parameters.ParamByName('Data').Value   := qRelLaudoPRO_DCOL.Value;
   DMI.qVerificaArquivo.Open;

   if (DMI.qVerificaArquivo.RecordCount > 0)
   then begin
         DMI.qVerificaArquivo.First;
         while DMI.qVerificaArquivo.Eof = False  do
         begin
          with qDeletaArquivo do
          begin
            Close;
            SQL.Clear;
            SQL.Add(' delete from rdcbco37_resultados.tb_arquivos_ipcms where cod = :Codigo');
            Parameters.ParamByName('Codigo').Value := DMI.qVerificaArquivocod.Value;
            ExecSQL;
          end;
          DMI.qVerificaArquivo.Next;
         end;
        end;

    with DMI.qArquivosWeb do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' INSERT INTO rdcbco37_resultados.tb_arquivos_ipcms (nome, arquivo, usuario, data_add, data_lib, protocolo,resultado) VALUES (:nome,:arquivo, :usuario, now(), :datalibera, :protocolo, :resultado)');
      Parameters.ParamByName('nome').Value      := qRelLaudoPES_NOME.Value;
      Parameters.ParamByName('arquivo').Value   := 'arq/'+ qRelLaudoPRO_PROT.Value + '_' + trim(qRelLaudoPES_NOME.Value) + '.pdf';
      Parameters.ParamByName('usuario').Value   := qRelLaudoLAB_COD_INTERNET.Value;
      Parameters.ParamByName('datalibera').Value:= DataLiberacao;
      Parameters.ParamByName('protocolo').Value := qRelLaudoPRO_HASH.Value;
      Parameters.ParamByName('resultado').Value := qRelLaudoPRO_RESUL.Value;;
      ExecSQL;
    end;

    ftpsend('108.179.193.98','raphael@rdcb.com.br','Tucano%23', NomeLaudoPDF, qRelLaudoPRO_PROT.Value + '_' + trim(qRelLaudoPES_NOME.Value) + '.pdf',21);

    DMI.qVerificaArquivo.Close;
    DMI.qArquivosWeb.Close;

    DMI.ADOC_MYSQL.Connected := False;
   end;
//
ShowMessage('Laudo de ' + qRelLaudoPES_NOME.Value + ', gerado (Pasta) enviado para o Site!');
end;

procedure TfEmissaoLaudosAgrupadoNew.sbEtiquetaClick(Sender: TObject);
begin
if (RxDBLookupComboPaciente.KeyValue > 0)
then begin
       sbConsultar.Click;


       DMI.qInfecto.Close;
       DMI.qInfecto.Parameters.ParamByName('Codigo').Value := qListaProcedimentosPRO_COD.Value;
       DMI.qInfecto.Open;

       Application.CreateForm(TfImprimeComprovante,fImprimeComprovante);
       if (Length(DMI.qInfectoPES_NOME.Value) >= 27)
       then begin
              fImprimeComprovante.RLA_NOME_2.Caption      :=  DMI.qInfectoPES_NOME.Value;
              fImprimeComprovante.RLA_NOME_2.Font.Size    :=  7;
           end else fImprimeComprovante.RLA_NOME_2.Caption      :=  DMI.qInfectoPES_NOME.Value;
       fImprimeComprovante.RLA_CASODATA_2.Caption  :=  'Caso: ' + IntToStr(DMI.qInfectoPRO_COD.Value) + ' / Dt. Amostra: ' + DateToStr(DMI.qInfectoPRO_DCOL.Value);
       fImprimeComprovante.RLA_PRAZO_2.Caption     :=  'Prazo: ' + DMI.qInfectoPRO_PRAZO.Value;
       fImprimeComprovante.RLA_CONVENIO_2.Caption  :=  'Origem: ' + DMI.qInfectoLAB_LABT.Value;
       fImprimeComprovante.RLBcode.Caption         :=  IntToStr(DMI.qInfectoPRO_COD.Value);
       fImprimeComprovante.RLBcode.Width           :=  32;
       fImprimeComprovante.RLR_Infecto2.Preview(nil);
       fImprimeComprovante.Free;
    end;
end;

procedure TfEmissaoLaudosAgrupadoNew.sbProcessarInfluenzaClick(
  Sender: TObject);
begin
if MessageDlg(' Confirma o Lançamento dos Resultados do Exame? ',mtconfirmation,[mbyes,mbno],0) = mryes
then begin
      qLancaResultado.Close;
      qLancaResultado.SQL.Clear;
      qLancaResultado.SQL.Add(' select * from tb_PROCEDIMENTOS pr');
      qLancaResultado.SQL.Add(' where pr.PRO_FG_RESUL = :Valor ');
      qLancaResultado.Parameters.ParamByName('Valor').Value := 1;
      qLancaResultado.open;

      MessageDlg(' Quantidade de Resultados a serem processados é : ' + IntToStr(qLancaResultado.RecordCount) ,mtConfirmation,[mbOK],0);
      
      qLancaResultado.First;
      while qLancaResultado.Eof = False  do
      begin
        DMI.qVerificaResultado.Close;
        DMI.qVerificaResultado.Parameters.ParamByName('Codigo').Value := (qLancaResultadoPRO_COD.Value);
        DMI.qVerificaResultado.Open;
        if (DMI.qVerificaResultadoQUANTIDADE.Value >0 )
        then begin
              with qAtualizaResultado do
              begin
                Close;
                SQL.Clear;
                SQL.Add(' update TB_PROCEDIMENTOS_RESULTADO p set p.PRO_RESUL2 = :Resultado2, p.PRO_RESUL3 = :Resultado3 where p.PRO_COD = :Codigo ');
                Parameters.ParamByName('Resultado2').Value  := cb_ResultadoInfluenzaA.Text;
                Parameters.ParamByName('Resultado3').Value  := cb_ResultadoInfluenzaB.Text;
                Parameters.ParamByName('Codigo').Value    := (qLancaResultadoPRO_COD.Value);
                ExecSQL;
              end;
             end else begin
                       DMI.qProcedimentos_Resultado.Close;
                       DMI.qProcedimentos_Resultado.Open;
                       DMI.qProcedimentos_Resultado.Append;
                       DMI.qProcedimentos_ResultadoPRO_COD.Value        := (qLancaResultadoPRO_COD.Value);
                       DMI.qProcedimentos_ResultadoPROR_DAT.Value       := Date;
                       DMI.qProcedimentos_ResultadoPRO_RESUL2.Value     := cb_ResultadoInfluenzaA.Text;
                       DMI.qProcedimentos_ResultadoPRO_RESUL3.Value     := cb_ResultadoInfluenzaB.Text;
                       DMI.qProcedimentos_Resultado.Post;
                      end;

        qLancaResultado.Next;
      end;

 {   with qLimpaXMarcados do
    begin
     Close;
     SQL.Clear;
     SQL.Add(' update TB_PROCEDIMENTOS p set p.PRO_FG_RESUL = :Valor ');
     Parameters.ParamByName('Valor').Value := 0;
     ExecSQL;
    end;  }
    ShowMessage('Resultados lançados com sucesso!');
    sbConsultar.Click;
   end else RxDBLookupComboColeta.SetFocus;

end;

procedure TfEmissaoLaudosAgrupadoNew.sbProcessarCovidInfluenzaClick(Sender: TObject);
begin
if MessageDlg(' Confirma o Lançamento dos Resultados do Exame? ',mtconfirmation,[mbyes,mbno],0) = mryes
then begin
      qLancaResultado.Close;
      qLancaResultado.SQL.Clear;
      qLancaResultado.SQL.Add(' select * from tb_PROCEDIMENTOS pr');
      qLancaResultado.SQL.Add(' where pr.PRO_FG_RESUL = :Valor ');
      qLancaResultado.Parameters.ParamByName('Valor').Value := 1;
      qLancaResultado.open;

      MessageDlg(' Quantidade de Resultados a serem processados é : ' + IntToStr(qLancaResultado.RecordCount) ,mtConfirmation,[mbOK],0);

      qLancaResultado.First;
      while qLancaResultado.Eof = False  do
      begin
        DMI.qVerificaResultado.Close;
        DMI.qVerificaResultado.Parameters.ParamByName('Codigo').Value := (qLancaResultadoPRO_COD.Value);
        DMI.qVerificaResultado.Open;
        if (DMI.qVerificaResultadoQUANTIDADE.Value >0 )
        then begin
              with qAtualizaResultado do
              begin
                Close;
                SQL.Clear;
                SQL.Add(' update TB_PROCEDIMENTOS_RESULTADO p set p.PRO_RESUL = :Resultado, p.PRO_RESUL2 = :Resultado2, p.PRO_RESUL3 = :Resultado3 where p.PRO_COD = :Codigo ');
                Parameters.ParamByName('Resultado').Value  := cb_ResultadoCI_Covid.Text;
                Parameters.ParamByName('Resultado2').Value := cb_ResultadoCI_InfluenzaA.Text;
                Parameters.ParamByName('Resultado3').Value := cb_ResultadoCI_InfluenzaB.Text;
                Parameters.ParamByName('Codigo').Value    := (qLancaResultadoPRO_COD.Value);
                ExecSQL;
              end;
             end else begin
                       DMI.qProcedimentos_Resultado.Close;
                       DMI.qProcedimentos_Resultado.Open;
                       DMI.qProcedimentos_Resultado.Append;
                       DMI.qProcedimentos_ResultadoPRO_COD.Value        := (qLancaResultadoPRO_COD.Value);
                       DMI.qProcedimentos_ResultadoPROR_DAT.Value       := Date;
                       DMI.qProcedimentos_ResultadoPRO_RESUL.Value      := cb_ResultadoCI_Covid.Text;
                       DMI.qProcedimentos_ResultadoPRO_RESUL2.Value     := cb_ResultadoCI_InfluenzaA.Text;
                       DMI.qProcedimentos_ResultadoPRO_RESUL3.Value     := cb_ResultadoCI_InfluenzaB.Text;
                       DMI.qProcedimentos_Resultado.Post;
                      end;

        qLancaResultado.Next;
      end;

  {  with qLimpaXMarcados do
    begin
     Close;
     SQL.Clear;
     SQL.Add(' update TB_PROCEDIMENTOS p set p.PRO_FG_RESUL = :Valor ');
     Parameters.ParamByName('Valor').Value := 0;
     ExecSQL;
    end;  }
    ShowMessage('Resultados lançados com sucesso!');
    sbConsultar.Click;
   end else RxDBLookupComboColeta.SetFocus;

end;

procedure TfEmissaoLaudosAgrupadoNew.sbProcessarPainelClick(
  Sender: TObject);
begin
if MessageDlg(' Confirma o Lançamento dos Resultados do Exame? ',mtconfirmation,[mbyes,mbno],0) = mryes
then begin
      qLancaResultado.Close;
      qLancaResultado.SQL.Clear;
      qLancaResultado.SQL.Add(' select * from tb_PROCEDIMENTOS pr');
      qLancaResultado.SQL.Add(' where pr.PRO_FG_RESUL = :Valor ');
      qLancaResultado.Parameters.ParamByName('Valor').Value := 1;
      qLancaResultado.open;

      MessageDlg(' Quantidade de Resultados a serem processados é : ' + IntToStr(qLancaResultado.RecordCount) ,mtConfirmation,[mbOK],0);

      qLancaResultado.First;
      while qLancaResultado.Eof = False  do
      begin
        DMI.qVerificaResultado.Close;
        DMI.qVerificaResultado.Parameters.ParamByName('Codigo').Value := (qLancaResultadoPRO_COD.Value);
        DMI.qVerificaResultado.Open;
        if (DMI.qVerificaResultadoQUANTIDADE.Value >0 )
        then begin
              with qAtualizaResultado do
              begin
                Close;
                SQL.Clear;
                SQL.Add(' update TB_PROCEDIMENTOS_RESULTADO p set p.PRO_RESUL = :Resultado, p.PRO_RESUL2 = :Resultado2, p.PRO_RESUL3 = :Resultado3 , p.PRO_RESUL4 = :Resultado4 where p.PRO_COD = :Codigo ');
                Parameters.ParamByName('Resultado').Value  := cb_ResultadoPainel_Covid.Text;
                Parameters.ParamByName('Resultado2').Value := cb_ResultadoPainel_InfluenzaA.Text;
                Parameters.ParamByName('Resultado3').Value := cb_ResultadoPainel_InfluenzaB.Text;
                Parameters.ParamByName('Resultado4').Value := cb_ResultadoPainel_VRS.Text;
                Parameters.ParamByName('Codigo').Value    := (qLancaResultadoPRO_COD.Value);
                ExecSQL;
              end;
             end else begin
                       DMI.qProcedimentos_Resultado.Close;
                       DMI.qProcedimentos_Resultado.Open;
                       DMI.qProcedimentos_Resultado.Append;
                       DMI.qProcedimentos_ResultadoPRO_COD.Value        := (qLancaResultadoPRO_COD.Value);
                       DMI.qProcedimentos_ResultadoPROR_DAT.Value       := Date;
                       DMI.qProcedimentos_ResultadoPRO_RESUL.Value      := cb_ResultadoPainel_Covid.Text;
                       DMI.qProcedimentos_ResultadoPRO_RESUL2.Value     := cb_ResultadoPainel_InfluenzaA.Text;
                       DMI.qProcedimentos_ResultadoPRO_RESUL3.Value     := cb_ResultadoPainel_InfluenzaB.Text;
                       DMI.qProcedimentos_ResultadoPRO_RESUL4.Value     := cb_ResultadoPainel_VRS.Text;
                       DMI.qProcedimentos_Resultado.Post;
                      end;

        qLancaResultado.Next;
      end;

{    with qLimpaXMarcados do
    begin
     Close;
     SQL.Clear;
     SQL.Add(' update TB_PROCEDIMENTOS p set p.PRO_FG_RESUL = :Valor ');
     Parameters.ParamByName('Valor').Value := 0;
     ExecSQL;
    end;}
    ShowMessage('Resultados lançados com sucesso!');
    sbConsultar.Click;
   end else RxDBLookupComboColeta.SetFocus;

end;

procedure TfEmissaoLaudosAgrupadoNew.DBGridCellClick(Column: TColumn);
begin
if (qListaProcedimentosEXA_COD.Value = 'COVID-19')
then begin
      gb_Covid.Visible     := True;
      gb_Influenza.Visible := False;
      gb_CI.Visible        := False;
      gb_Painel.Visible    := False;
     end;
if (qListaProcedimentosEXA_COD.Value = 'INFLUENZA')
then begin
      gb_Covid.Visible     := False;
      gb_Influenza.Visible := True;
      gb_CI.Visible        := False;
      gb_Painel.Visible    := False;
     end;
if (qListaProcedimentosEXA_COD.Value = 'COVIDINFLU')
then begin
      gb_Covid.Visible     := False;
      gb_Influenza.Visible := False;
      gb_CI.Visible        := True;
      gb_Painel.Visible    := False;
     end;
if (qListaProcedimentosEXA_COD.Value = 'PNLVIRAL')
then begin
      gb_Covid.Visible     := False;
      gb_Influenza.Visible := False;
      gb_CI.Visible        := False;
      gb_Painel.Visible    := True;
     end;
end;

procedure TfEmissaoLaudosAgrupadoNew.DBGridDblClick(Sender: TObject);
begin
  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  (Sender as TDBGrid).DataSource.Dataset.Edit;

  (Sender as TDBGrid).DataSource.Dataset.FieldByName('PRO_FG_RESUL').AsInteger :=
    IfThen((Sender as TDBGrid).DataSource.Dataset.FieldByName('PRO_FG_RESUL').AsInteger = 1, 0, 1);

  (Sender as TDBGrid).DataSource.Dataset.Post;
end;

procedure TfEmissaoLaudosAgrupadoNew.DBGridDrawColumnCell(Sender: TObject;
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

procedure TfEmissaoLaudosAgrupadoNew.sbAtualizaQuantClick(Sender: TObject);
var Quantidade : Integer;
begin

if MessageDlg(' Confirma a atualização da quantidade de laudos no Site? *Atenção, o processo pode ser demorado. ',mtconfirmation,[mbyes,mbno],0) = mryes
then begin
      // - Quantidade Liberados
      try
      DMI.ADOC_MYSQL.Connected := True;

      qListaProcedimentos.First;
      while qListaProcedimentos.Eof = False  do
      begin
       DMI.qQuantArquivos.Close;
       DMI.qQuantArquivos.Parameters.ParamByName('Nome').Value   := trim(qListaProcedimentosPES_NOME.Value);
       DMI.qQuantArquivos.Parameters.ParamByName('Data').Value   := qListaProcedimentosPRO_DCOL.Value;
       DMI.qQuantArquivos.Open;
       Quantidade := 0;
       Quantidade := DMI.qQuantArquivosquantidade.Value;
       with qManutencao do
       begin
         Close;
         SQL.Clear;
         SQL.Add(' update tb_PROCEDIMENTOS pr set pr.PRO_FG_SITE = :Quantidade where pr.PRO_COD = :Codigo');
         Parameters.ParamByName('Quantidade').Value := Quantidade;
         Parameters.ParamByName('Codigo').Value     := qListaProcedimentosPRO_COD.Value;
         ExecSQL;
       end;
      qListaProcedimentos.Next;
      end;
      Except

      end;
      DMI.ADOC_MYSQL.Connected := False;
     //
    end;

sbConsultar.Click;
end;

procedure TfEmissaoLaudosAgrupadoNew.sbNaoSiteClick(Sender: TObject);
begin
qListaProcedimentos.First;
while qListaProcedimentos.Eof = False do
begin
  with qLimpaXMarcados do
  begin
  Close;
  SQL.Clear;
  SQL.Add(' update TB_PROCEDIMENTOS p set p.PRO_FG_RESUL = :NewValor where p.PRO_COD = :Codigo ');
  Parameters.ParamByName('NewValor').Value:= 0;
  Parameters.ParamByName('Codigo').Value  := qListaProcedimentosPRO_COD.Value;
  ExecSQL;
  end;
  qListaProcedimentos.Next
end;


qListaProcedimentos.First;
while qListaProcedimentos.Eof = False do
begin
  qRelLaudo.Close;
  qRelLaudo.Parameters.ParamByName('CODIGO').Value := qListaProcedimentosPRO_COD.Value;
  qRelLaudo.Open;

  if (((qRelLaudoPRO_RESUL.Value <> '') or (qRelLaudoPRO_RESUL2.Value <> '')) and (qRelLaudoPRO_FG_SITE.Value = 0))
  then begin
        with qLimpaXMarcados do
        begin
          Close;
          SQL.Clear;
          SQL.Add(' update TB_PROCEDIMENTOS p set p.PRO_FG_RESUL = :NewValor where p.PRO_COD = :Codigo');
          Parameters.ParamByName('NewValor').Value:= 1;
          Parameters.ParamByName('Codigo').Value  := qRelLaudoPRO_COD.Value;
          ExecSQL;
        end;
       end;
  qListaProcedimentos.Next
end;

sbConsultar.Click;

end;

end.

