unit ufExportaAlelosPlanilhas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, StdCtrls, DB, SqlExpr, Grids, DBGrids, IdFTP, IdFTPCommon, Math,
  ComObj, Buttons, ADODB, Clipbrd, ExtCtrls, ComCtrls;

type
  TfExportacaoAlelos = class(TForm)
    sbExportar: TSpeedButton;
    sbFechar: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    btnDestino: TSpeedButton;
    edtDestino: TEdit;
    opndlgDestino: TOpenDialog;
    qGeraDados: TADOQuery;
    qGeraDadosCOD_ALE: TIntegerField;
    qGeraDadosNM1_ALE: TStringField;
    qGeraDadosNM2_ALE: TStringField;
    qGeraDadosNM3_ALE: TStringField;
    qGeraDadosNM4_ALE: TStringField;
    qGeraDadosMAR_ALE: TStringField;
    qGeraDadosAL1_ALE: TStringField;
    qGeraDadosAL2_ALE: TStringField;
    qGeraDadosORD_ALE: TIntegerField;
    Label2: TLabel;
    EdtCodigo: TEdit;
    qPessoasParaExportar: TADOQuery;
    qPessoasParaExportarNM2_ALE: TStringField;
    DS_PessoasParaExportar: TDataSource;
    GroupBox2: TGroupBox;
    qConsultaPessoas: TADOQuery;
    ds_ConsultaPessoas: TDataSource;
    DBGrid2: TDBGrid;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    EdtPosicao1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdtPosicao2: TEdit;
    Label5: TLabel;
    EdtPosicao3: TEdit;
    bbtP1: TBitBtn;
    bbtP2: TBitBtn;
    bbtP3: TBitBtn;
    sbLimpar: TSpeedButton;
    sbNaoDisponivel1: TSpeedButton;
    sbNaoDisponivel4: TSpeedButton;
    bbtP4: TBitBtn;
    EdtPosicao4: TEdit;
    Label6: TLabel;
    gbxImport: TGroupBox;
    lbOrigem: TLabel;
    btnOrigem: TSpeedButton;
    edtOrigem: TEdit;
    opndlgOrigem: TOpenDialog;
    qInsereDados: TADOQuery;
    qInsereDadosCOD_ALE: TIntegerField;
    qInsereDadosNM1_ALE: TStringField;
    qInsereDadosNM2_ALE: TStringField;
    qInsereDadosNM3_ALE: TStringField;
    qInsereDadosNM4_ALE: TStringField;
    qInsereDadosMAR_ALE: TStringField;
    qInsereDadosAL1_ALE: TStringField;
    qInsereDadosAL2_ALE: TStringField;
    qInsereDadosORD_ALE: TIntegerField;
    DS_InsereDados: TDataSource;
    qVerificaDados: TADOQuery;
    ADOQuery1: TADOQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    IntegerField2: TIntegerField;
    qVerificaDadosCodigo: TADOQuery;
    qVerificaDadosCodigoNM1_ALE: TStringField;
    qExcluirCaso: TADOQuery;
    IntegerField3: TIntegerField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    IntegerField4: TIntegerField;
    qGuardaAlelos: TADOQuery;
    IntegerField5: TIntegerField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    IntegerField6: TIntegerField;
    qInsereDadosTemporarios: TADOQuery;
    qInsereDadosTemporariosCOD_TALE: TIntegerField;
    qInsereDadosTemporariosCASO_TALE: TStringField;
    qInsereDadosTemporariosPESSOA_TALE: TStringField;
    qInsereDadosTemporariosINICIAIS_TALE: TStringField;
    qInsereDadosTemporariosTIPO_TALE: TStringField;
    qInsereDadosTemporariosALELO_TALE: TStringField;
    qInsereDadosTemporariosVALOR1_TALE: TStringField;
    qInsereDadosTemporariosVALOR2_TALE: TStringField;
    qBuscaTemporarios: TADOQuery;
    qBuscaTemporariosCOD_TALE: TIntegerField;
    qBuscaTemporariosCASO_TALE: TStringField;
    qBuscaTemporariosPESSOA_TALE: TStringField;
    qBuscaTemporariosINICIAIS_TALE: TStringField;
    qBuscaTemporariosTIPO_TALE: TStringField;
    qBuscaTemporariosALELO_TALE: TStringField;
    qBuscaTemporariosVALOR1_TALE: TStringField;
    qBuscaTemporariosVALOR2_TALE: TStringField;
    qBuscaTipo: TADOQuery;
    qBuscaTipoATP_COD: TIntegerField;
    qBuscaTipoATP_NOME: TStringField;
    qBuscaTipoATP_ORDEM: TIntegerField;
    qBuscaTipoATP_TIPO: TStringField;
    qMostraResultado: TADOQuery;
    qMostraResultadoPES_NOME: TStringField;
    qMostraResultadoPES_INICIAIS: TStringField;
    qMostraResultadoMAR_ALE: TStringField;
    qMostraResultadoAL1_ALE: TStringField;
    qMostraResultadoAL2_ALE: TStringField;
    qMostraResultadoNM1_ALE: TStringField;
    qExcluiCasoTEMP: TADOQuery;
    qVerificaCasoIncluso: TADOQuery;
    IntegerField7: TIntegerField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    IntegerField8: TIntegerField;
    qDadosRepeticaoAlelos: TADOQuery;
    qDadosRepeticaoAlelosCOD_ALE: TIntegerField;
    qDadosRepeticaoAlelosNM1_ALE: TStringField;
    qDadosRepeticaoAlelosNM2_ALE: TStringField;
    qDadosRepeticaoAlelosNM3_ALE: TStringField;
    qDadosRepeticaoAlelosNM4_ALE: TStringField;
    qDadosRepeticaoAlelosMAR_ALE: TStringField;
    qDadosRepeticaoAlelosAL1_ALE: TStringField;
    qDadosRepeticaoAlelosAL2_ALE: TStringField;
    qDadosRepeticaoAlelosORD_ALE: TIntegerField;
    qTipoPessoas: TADOQuery;
    qTipoPessoasNM2_ALE: TStringField;
    L_Tipo: TLabel;
    sbConsultar: TSpeedButton;
    sbProcessamento: TSpeedButton;
    cb_NovoModelo: TCheckBox;
    qDadosProcesso: TADOQuery;
    qDadosProcessoPRO_COD: TIntegerField;
    qDadosProcessoPRO_ANO: TIntegerField;
    qDadosProcessoPRO_NPERC: TStringField;
    qDadosProcessoPRO_TIPO: TIntegerField;
    qDadosProcessoPRO_AUTO: TStringField;
    qDadosProcessoUF_SIGLA: TStringField;
    qDadosProcessoCAS_CODIGO: TStringField;
    qDadosProcessoCOM_COD: TIntegerField;
    qDadosProcessoVAR_COD: TIntegerField;
    qDadosProcessoLCO_COD: TIntegerField;
    qDadosProcessoPRO_HCOLE: TStringField;
    qDadosProcessoPRO_DCOLE: TDateField;
    qDadosProcessoPRO_HREC: TStringField;
    qDadosProcessoPRO_DREC: TDateField;
    qDadosProcessoPRO_DRESU: TDateField;
    qDadosProcessoPRO_SIT: TIntegerField;
    qDadosProcessoPRO_NCOMP: TIntegerField;
    qDadosProcessoPRO_RESUL: TIntegerField;
    qDadosProcessoPRO_PROB: TStringField;
    qDadosProcessoPRO_ARETI: TStringField;
    qDadosProcessoJUI_COD: TIntegerField;
    qDadosProcessoFG_PROP: TStringField;
    qDadosProcessoPRO_USUCAD: TStringField;
    qDadosProcessoPRO_NUMLAUDO: TStringField;
    qDadosProcessoPRO_RASTREAR: TStringField;
    qDadosProcessoPRO_CARREGACREDITO: TStringField;
    qDadosProcessoPRO_CREDITODNA: TStringField;
    qDadosProcessoPRO_HTREC: TStringField;
    qDadosProcessoPRO_RESUL_XLSX: TStringField;
    qDadosProcessoPRO_LACRE: TStringField;
    qBuscaNumeroLaudo: TADOQuery;
    qBuscaNumeroLaudoHIS_CONTR: TIntegerField;
    qBuscaNumeroLaudoPRO_COD: TIntegerField;
    qBuscaNumeroLaudoITE_COD: TIntegerField;
    qBuscaNumeroLaudoHIS_DATA: TDateField;
    qBuscaNumeroLaudoHIS_DOC: TStringField;
    qBuscaNumeroLaudoHIS_OBS: TStringField;
    qBuscaCidade: TADOQuery;
    qBuscaCidadeJUIZ: TStringField;
    qBuscaCidadeVARA: TStringField;
    qBuscaCidadeCOMARCA: TStringField;
    qBuscaCidadeESTADO: TStringField;
    qBuscaCidadeENDE_VARA: TStringField;
    qBuscaCidadeBAIRRO_VARA: TStringField;
    qBuscaCidadeCIDADE_VARA: TStringField;
    qBuscaCidadeCEP_VARA: TStringField;
    qBuscaCidadeJUI_SEXO: TStringField;
    qBuscaDados: TADOQuery;
    qBuscaDadosJUIZ: TStringField;
    qBuscaDadosVARA: TStringField;
    qBuscaDadosCOMARCA: TStringField;
    qBuscaDadosESTADO: TStringField;
    qBuscaDadosENDE_VARA: TStringField;
    qBuscaDadosBAIRRO_VARA: TStringField;
    qBuscaDadosCIDADE_VARA: TStringField;
    qBuscaDadosCEP_VARA: TStringField;
    qBuscaLaudo: TADOQuery;
    qBuscaLaudoHIS_CONTR: TIntegerField;
    qBuscaLaudoPRO_COD: TIntegerField;
    qBuscaLaudoITE_COD: TIntegerField;
    qBuscaLaudoHIS_DATA: TDateField;
    qBuscaLaudoHIS_DOC: TStringField;
    qBuscaLaudoHIS_OBS: TStringField;
    qBuscaDadosPessoas: TADOQuery;
    qBuscaDadosPessoasPRO_COD: TIntegerField;
    qBuscaDadosPessoasPES_COD: TIntegerField;
    qBuscaDadosPessoasPES_NOME: TStringField;
    qBuscaDadosPessoasPES_INICIAIS: TStringField;
    qBuscaDadosPessoasPES_SIT: TIntegerField;
    qBuscaDadosPessoasPES_DTNAS: TDateField;
    qBuscaDadosPessoasPES_LCNAS: TStringField;
    qBuscaDadosPessoasPES_SEXO: TStringField;
    qBuscaDadosPessoasPES_TDOC: TStringField;
    qBuscaDadosPessoasPES_NDOC: TStringField;
    qBuscaDadosPessoasPES_NOME_1: TStringField;
    qBuscaDadosPessoasSIT_NM: TStringField;
    qBuscaDadosPessoasPRO_DCOLE: TDateField;
    qBuscaDadosPessoasPRO_HCOLE: TStringField;
    qBuscaDadosColetador: TADOQuery;
    qBuscaDadosColetadorLCO_COD: TIntegerField;
    qBuscaDadosColetadorLCO_NOME: TStringField;
    qBuscaDadosColetadorLCO_SEXO: TIntegerField;
    qBuscaDadosColetadorLCO_CRM: TStringField;
    qBuscaDadosColetadorLCO_LABT: TStringField;
    qBuscaDadosColetadorLCO_FONE: TStringField;
    qBuscaDadosColetadorLCO_END: TStringField;
    qBuscaDadosColetadorLCO_CID: TStringField;
    qBuscaDadosColetadorUF_SIGLA: TStringField;
    qBuscaDadosColetadorLCO_TLIE: TIntegerField;
    qBuscaDadosColetadorLCO_CATE: TIntegerField;
    qBuscaDadosColetadorLCO_TRAT: TIntegerField;
    qBuscaDadosColetadorLCO_CEL: TStringField;
    qBuscaDadosColetadorLCO_RES: TStringField;
    qBuscaDadosColetadorLCO_EMAIL: TStringField;
    qBuscaDadosColetadorLCO_SITE: TStringField;
    qBuscaDadosColetadorLCO_CEP: TStringField;
    qBuscaDadosColetadorLCO_DTRE: TDateField;
    qBuscaDadosColetadorLCO_DCAD: TDateField;
    qBuscaDadosColetadorLCO_NUMCARTCORREIO: TIntegerField;
    qResultado: TADOQuery;
    qDadosProcessoPRO_TIPO_XLSX: TStringField;
    sbGerarPDF: TSpeedButton;
    sbNaoDisponivel5: TSpeedButton;
    bbtP5: TBitBtn;
    EdtPosicao5: TEdit;
    Label7: TLabel;
    Image1: TImage;
    cb_LabExterno: TCheckBox;
    EditNumCasoExterno: TEdit;
    Label8: TLabel;
    qQuantPartesProcesso: TADOQuery;
    qQuantPartesCSV: TADOQuery;
    qQuantPartesCSVNM1_ALE: TStringField;
    qQuantPartesCSVNM2_ALE: TStringField;
    qQuantPartesProcessoPRO_COD: TIntegerField;
    qQuantPartesProcessoPES_NOME: TStringField;
    qQuantPartesProcessoPES_INICIAIS: TStringField;
    qQuantPartesProcessoSIT_NM: TStringField;
    cb_UNA_Posicao2: TCheckBox;
    cb_UNA_Posicao3: TCheckBox;
    qControlaAuditoria: TADOQuery;
    qConsultaPessoasPES_NOME: TStringField;
    qConsultaPessoasPES_SEXO: TStringField;
    qConsultaPessoasPES_INICIAIS: TStringField;
    qConsultaPessoasPRO_COD: TIntegerField;
    qConsultaPessoasCAS_CODIGO: TStringField;
    procedure edtTelResKeyPress(Sender: TObject; var Key: Char);
    procedure sbFecharClick(Sender: TObject);
    function  ExportaAlelos: String;
    procedure btnDestinoClick(Sender: TObject);
    procedure sbProcessamentoClick(Sender: TObject);
    procedure bbtP1Click(Sender: TObject);
    procedure bbtP2Click(Sender: TObject);
    procedure bbtP3Click(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbLimparClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbNaoDisponivel1Click(Sender: TObject);
    procedure bbtP4Click(Sender: TObject);
    procedure sbNaoDisponivel4Click(Sender: TObject);
    function  VerificaDadosOLQuantPartes : String;
    function  VerificaTipoPCR : String;
    function  VerificaRepeticaoAlelos(Valor : String): String;
    function  BuscaNumeroLabExterno : String;
    procedure sbConsultarClick(Sender: TObject);
    procedure btnOrigemClick(Sender: TObject);
    procedure cb_NovoModeloClick(Sender: TObject);
    function MesExtenso( Mes:Word ) : string;
    procedure sbGerarPDFClick(Sender: TObject);
    procedure ftpsend(host, username, password, filefrom, fileto: string; port: integer);
    procedure sbNaoDisponivel5Click(Sender: TObject);
    procedure bbtP5Click(Sender: TObject);
    procedure CropBitmap(InBitmap : TBitmap; X, Y, W, H :Integer);
    procedure GeraQRCODE;
    procedure ExcluirCaso(Caso:String);
    procedure ExcluirCasoTemp(Caso:String);
    procedure cb_LabExternoClick(Sender: TObject);
    procedure cb_UNA_Posicao2Click(Sender: TObject);
    procedure cb_UNA_Posicao3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fExportacaoAlelos: TfExportacaoAlelos;
  excel, excel_planilha :variant;
  MesGerando, NomePlanilha, NumeroCaso, Diretorio, DiretorioPDF, NomePDF, DataLiberacao, PartesCaso, Tipo, DiretorioQrcode : String;
  Linha, NumeroSheets, i, NumeroCasoVerificacao, NumeroLabExterno : Integer;


implementation

uses ufuncoes, ufDM, ufDMR, ufGeraDocLabTipos, ufDMI, ufProcesso,
  StrUtils, PngImage, HTTPApp, WinInet, DelphiZXIngQRCode, QRCODE;

{$R *.dfm}

procedure TfExportacaoAlelos.edtTelResKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
     key := #0;
end;

procedure TfExportacaoAlelos.sbFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfExportacaoAlelos.CropBitmap(InBitmap : TBitmap; X, Y, W, H :Integer);
begin
  BitBlt(InBitmap.Canvas.Handle, 0, 0, W, H, InBitmap.Canvas.Handle, X, Y, SRCCOPY);
  InBitmap.Width :=W;
  InBitmap.Height:=H;
end;


function TfExportacaoAlelos.ExportaAlelos;
var Arquivo, DataAtual, DataLiberacao, AnoC, MesC, DiaC, VerificaMensagem, Probabilidade, AnoAtual, Diretorio : String;
    i, Linha, NumeroSheets, NumeroSheetsV2, Total, Codigo, Resultado, Proximo : Integer;
    ImageStream: TMemoryStream;
    PngImage: TPngImage;
    ImagemAjustada : TBitmap;
begin

qDadosProcesso.Close;
qDadosProcesso.Parameters.ParamByName('PROCESSO').Value := NumeroCaso;
qDadosProcesso.Open;

qBuscaCidade.Close;
qBuscaCidade.Parameters.ParamByName('PROCESSO').Value := qDadosProcessoPRO_COD.Value;
qBuscaCidade.Open;

qBuscaDadosPessoas.Close;
qBuscaDadosPessoas.Parameters.ParamByName('PROCESSO').Value := qDadosProcessoPRO_COD.Value;
qBuscaDadosPessoas.Open;

qBuscaNumeroLaudo.Close;
qBuscaNumeroLaudo.Parameters.ParamByName('PROCESSO').Value := qDadosProcessoPRO_COD.Value;
qBuscaNumeroLaudo.Open;

qBuscaNumeroLaudo.Close;
qBuscaNumeroLaudo.Parameters.ParamByName('PROCESSO').Value :=  qDadosProcessoPRO_COD.Value;
qBuscaNumeroLaudo.Open;

qBuscaNumeroLaudo.Close;
qBuscaNumeroLaudo.Parameters.ParamByName('PROCESSO').Value :=  qDadosProcessoPRO_COD.Value;
qBuscaNumeroLaudo.Open;

qBuscaDadosColetador.Close;
qBuscaDadosColetador.Parameters.ParamByName('Codigo').Value :=  qDadosProcessoLCO_COD.Value;
qBuscaDadosColetador.Open;

DecodeDate (Date, Ano, Mes, Dia);
AnoC := IntToStr(Ano);
MesC := MesExtenso(Mes);
DiaC := IntToStr(Dia);
if DiaC = '0'
then begin
      DiaC:= '01';
     end;
if Length(DiaC) = 1
then begin
      DiaC := ('0' + DiaC);
     end;
if (DiaC = IntToStr(01)) or (DiaC = IntToStr(-1))
then begin
DiaC := 'Primeiro';
end;
DataAtual := DiaC +' de '+ MesC +' de '+ AnoC;

DecodeDate (Date, Ano, Mes, Dia);
AnoA := IntToStr(Ano);
MesA := IntToStr(Mes);
DiaA := IntToStr(Dia);

Diretorio := DM.qParametrosPAM_DIRINTEGRADOC.Value + '\' + qDadosProcessoPRO_NUMLAUDO.Value + '\';
//Diretorio := DM.qParametrosPAM_DIRINTEGRADOC.Value + ' ' + IntToStr(qDadosProcessoPRO_ANO.Value) + '_\' + qDadosProcessoPRO_NUMLAUDO.Value + '\';

if not DirectoryExists(Diretorio)
then begin
      ForceDirectories(Diretorio);
    end;

DiretorioQrcode := '';
DiretorioQrcode :=  DM.qParametrosPAM_DIRINTEGRADOC.Value + '\' + qDadosProcessoPRO_NUMLAUDO.Value + '\Qrcode\';
//DiretorioQrcode :=  DM.qParametrosPAM_DIRINTEGRADOC.Value + ' ' + IntToStr(qDadosProcessoPRO_ANO.Value) + '_\' + qDadosProcessoPRO_NUMLAUDO.Value + '\Qrcode\';

if not DirectoryExists(DiretorioQrcode)
then begin
      ForceDirectories(DiretorioQrcode);
    end;

excel := CreateOleObject('Excel.Application');
if not Excel.Application.Visible then
Excel.WorkBooks.Open(edtDestino.Text);

if (cb_NovoModelo.Checked = True)
then begin
      NomePlanilha := Diretorio + qDadosProcessoPRO_NUMLAUDO.Value + '.xlsm';
     end else NomePlanilha := Diretorio + qDadosProcessoPRO_NUMLAUDO.Value + '.xlsx';

if (cb_UNA_Posicao2.Checked = True)
then begin
      if (cb_NovoModelo.Checked = True)
      then begin
            NomePlanilha := Diretorio + qDadosProcessoPRO_NUMLAUDO.Value + '_' + EdtPosicao2.Text + '_' + '.xlsm';
           end else NomePlanilha := Diretorio + qDadosProcessoPRO_NUMLAUDO.Value + '_' + EdtPosicao2.Text + '_' + '.xlsx';
     end;
if (cb_UNA_Posicao3.Checked = True)
then begin
      if (cb_NovoModelo.Checked = True)
      then begin
            NomePlanilha := Diretorio + qDadosProcessoPRO_NUMLAUDO.Value + '_' + EdtPosicao3.Text + '_' + '.xlsm';
           end else NomePlanilha := Diretorio + qDadosProcessoPRO_NUMLAUDO.Value + '_' + EdtPosicao3.Text + '_' + '.xlsx';
     end;

NumeroSheets := 1;
Linha := 4;
for i := 0 to 25 do
begin
 qGeraDados.Close;
 qGeraDados.Parameters.ParamByName('Pessoa').Value   := EdtPosicao2.Text;
 qGeraDados.Parameters.ParamByName('Numero').Value   := EdtCodigo.Text;
 qGeraDados.Parameters.ParamByName('Marcador').Value := Trim(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]);
 qGeraDados.Open;
 Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
 Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;
 Linha:=Linha+1;
end;

if not (EdtPosicao1.Text = 'Não Disponível')
then begin
      NumeroSheets := 1;
      Linha := 4;
      for i := 0 to 25 do
      begin
       qGeraDados.Close;
       qGeraDados.Parameters.ParamByName('Pessoa').Value   := EdtPosicao1.Text;
       qGeraDados.Parameters.ParamByName('Numero').Value   := EdtCodigo.Text;
       qGeraDados.Parameters.ParamByName('Marcador').Value := Trim(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]);
       qGeraDados.Open;
       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2] := qGeraDadosAL1_ALE.Value;
       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3] := qGeraDadosAL2_ALE.Value;
       Linha:=Linha+1;
      end;
     end; 


if not (EdtPosicao3.Text = 'Não Disponível')
then begin
      NumeroSheets := 1;
      Linha := 4;
      for i := 0 to 25 do
     begin
       qGeraDados.Close;
       qGeraDados.Parameters.ParamByName('Pessoa').Value   := EdtPosicao3.Text;
       qGeraDados.Parameters.ParamByName('Numero').Value   := EdtCodigo.Text;
       qGeraDados.Parameters.ParamByName('Marcador').Value := Trim(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]);
       qGeraDados.Open;
       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;
       Linha:=Linha+1;
      end;
     end;

if not (EdtPosicao4.Text = 'Não Disponível')
then begin
      NumeroSheets := 1;
      Linha := 4;
      for i := 0 to 25 do
      begin
       qGeraDados.Close;
       qGeraDados.Parameters.ParamByName('Pessoa').Value   := EdtPosicao4.Text;
       qGeraDados.Parameters.ParamByName('Numero').Value   := EdtCodigo.Text;
       qGeraDados.Parameters.ParamByName('Marcador').Value := Trim(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]);
       qGeraDados.Open;
       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,8] := qGeraDadosAL1_ALE.Value;
       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,9] := qGeraDadosAL2_ALE.Value;
       Linha:=Linha+1;
      end;
     end;

if not (EdtPosicao5.Text = 'Não Disponível')
then begin
      NumeroSheets := 1;
      Linha := 4;
      for i := 0 to 25 do
      begin
       qGeraDados.Close;
       qGeraDados.Parameters.ParamByName('Pessoa').Value   := EdtPosicao5.Text;
       qGeraDados.Parameters.ParamByName('Numero').Value   := EdtCodigo.Text;
       qGeraDados.Parameters.ParamByName('Marcador').Value := Trim(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]);
       qGeraDados.Open;
       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,10] := qGeraDadosAL1_ALE.Value;
       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,11] := qGeraDadosAL2_ALE.Value;
       Linha:=Linha+1;
      end;
     end;



Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[1,2] := qGeraDadosNM1_ALE.Value;

if (cb_NovoModelo.Checked = True)
then begin
      Resultado     := 0;

      //Busca Dados EXCEL
     try

      VerificaMensagem := '';

      if (qDadosProcessoCAS_CODIGO.Value = 'PD0101')
      then begin
            NumeroSheets := 5;
            VerificaMensagem := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[46,33];
            if (VerificaMensagem = 'VÍNCULO BIOLOGICAMENTE PROVADO') or (VerificaMensagem = 'POSITIVO')
            then begin
                  Resultado     := 1;
                  Probabilidade := '';
                  Probabilidade := FloatToStr(StrToFloat(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[44,33])*100);
                  if Length(Probabilidade) < 12
                  then begin
                         if Length(Probabilidade) = 11
                         then begin
                               Probabilidade := Probabilidade + '0';
                              end;
                         if Length(Probabilidade) = 10
                         then begin
                               Probabilidade := Probabilidade + '00';
                              end;
                         if Length(Probabilidade) = 9
                         then begin
                               Probabilidade := Probabilidade + '000';
                              end;
                          if Length(Probabilidade) = 8
                         then begin
                               Probabilidade := Probabilidade + '0000';
                              end;
                       end;
                  with qResultado do
                  begin
                  Close;
                  SQL.Clear;
                  SQL.Add('update TB_PROCESSO set PRO_RESUL = :Resultado, PRO_PROB = :Probabilidade where PRO_COD = :Codigo ');
                  Parameters.ParamByName('Resultado').Value      := 1;
                  Parameters.ParamByName('Probabilidade').Value  := Probabilidade;
                  Parameters.ParamByName('Codigo').Value         := NumeroCaso;
                  ExecSQL;
                  end;
                 end else begin
                            Resultado     := 2;
                            with qResultado do
                            begin
                            Close;
                            SQL.Clear;
                            SQL.Add('update TB_PROCESSO set PRO_RESUL = :Resultado, PRO_PROB = :Probabilidade where PRO_COD = :Codigo ');
                            Parameters.ParamByName('Resultado').Value      := 2;
                            Parameters.ParamByName('Probabilidade').Value  := Probabilidade;
                            Parameters.ParamByName('Codigo').Value         := NumeroCaso;
                            ExecSQL;
                            end;
                         end;

           end;

      if (qDadosProcessoCAS_CODIGO.Value = 'PD0201')
      then begin
            NumeroSheets := 6;
            VerificaMensagem := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[49,25];
            if (VerificaMensagem = 'VÍNCULO BIOLOGICAMENTE PROVADO') or (VerificaMensagem = 'POSITIVO')
            then begin
                  Resultado     := 1;
                  Probabilidade := '';
                  Probabilidade := FloatToStr(StrToFloat(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[47,25])*100);
                  if Length(Probabilidade) < 12
                  then begin
                         if Length(Probabilidade) = 11
                         then begin
                               Probabilidade := Probabilidade + '0';
                              end;
                         if Length(Probabilidade) = 10
                         then begin
                               Probabilidade := Probabilidade + '00';
                              end;
                         if Length(Probabilidade) = 9
                         then begin
                               Probabilidade := Probabilidade + '000';
                              end;
                          if Length(Probabilidade) = 8
                         then begin
                               Probabilidade := Probabilidade + '0000';
                              end;
                       end;
                  with qResultado do
                  begin
                  Close;
                  SQL.Clear;
                  SQL.Add('update TB_PROCESSO set PRO_RESUL = :Resultado, PRO_PROB = :Probabilidade where PRO_COD = :Codigo ');
                  Parameters.ParamByName('Resultado').Value      := 1;
                  Parameters.ParamByName('Probabilidade').Value  := Probabilidade;
                  Parameters.ParamByName('Codigo').Value         := NumeroCaso;
                  ExecSQL;
                  end;
                 end else begin
                            Resultado     := 2;
                            with qResultado do
                            begin
                            Close;
                            SQL.Clear;
                            SQL.Add('update TB_PROCESSO set PRO_RESUL = :Resultado, PRO_PROB = :Probabilidade where PRO_COD = :Codigo ');
                            Parameters.ParamByName('Resultado').Value      := 2;
                            Parameters.ParamByName('Probabilidade').Value  := Probabilidade;
                            Parameters.ParamByName('Codigo').Value         := NumeroCaso;
                            ExecSQL;
                            end;
                         end;

           end;

      if (qDadosProcessoCAS_CODIGO.Value = 'RD0301')
      then begin
            NumeroSheets := 7;
            VerificaMensagem := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[46,8];
            if (VerificaMensagem = 'VÍNCULO BIOLOGICAMENTE PROVADO') or (VerificaMensagem = 'POSITIVO')
            then begin
                  Resultado     := 1;
                  Probabilidade := '';
                  Probabilidade := FloatToStr(StrToFloat(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[44,8])*100);
                  if Length(Probabilidade) < 12
                  then begin
                         if Length(Probabilidade) = 11
                         then begin
                               Probabilidade := Probabilidade + '0';
                              end;
                         if Length(Probabilidade) = 10
                         then begin
                               Probabilidade := Probabilidade + '00';
                              end;
                         if Length(Probabilidade) = 9
                         then begin
                               Probabilidade := Probabilidade + '000';
                              end;
                          if Length(Probabilidade) = 8
                         then begin
                               Probabilidade := Probabilidade + '0000';
                              end;
                       end;
                  with qResultado do
                  begin
                  Close;
                  SQL.Clear;
                  SQL.Add('update TB_PROCESSO set PRO_RESUL = :Resultado, PRO_PROB = :Probabilidade where PRO_COD = :Codigo ');
                  Parameters.ParamByName('Resultado').Value      := 1;
                  Parameters.ParamByName('Probabilidade').Value  := Probabilidade;
                  Parameters.ParamByName('Codigo').Value         := NumeroCaso;
                  ExecSQL;
                  end;
                 end else begin
                            Resultado     := 2;
                            with qResultado do
                            begin
                            Close;
                            SQL.Clear;
                            SQL.Add('update TB_PROCESSO set PRO_RESUL = :Resultado, PRO_PROB = :Probabilidade where PRO_COD = :Codigo ');
                            Parameters.ParamByName('Resultado').Value      := 2;
                            Parameters.ParamByName('Probabilidade').Value  := Probabilidade;
                            Parameters.ParamByName('Codigo').Value         := NumeroCaso;
                            ExecSQL;
                            end;
                         end;

           end;
        Except
          MessageDlg('ATENÇÃO!' + #13 + #13 + 'Erro de CÁLCULO COM OS MARCADORES. Favor verificar o arquivo gerado!', TMsgDlgType.mtError, [mbOk], 0, mbOk);
        end;


      // Fim Busca Dados EXCEL

      qDadosProcesso.Close;
      qDadosProcesso.Parameters.ParamByName('PROCESSO').Value := NumeroCaso;
      qDadosProcesso.Open;

      // NOVO LAUDOS

      DataLiberacao := '';
      DataLiberacao := Copy(DateToStr(Date),7,4) + '-' + Copy(DateToStr(Date),4,2) + '-' + Copy(DateToStr(Date),1,2) + ' 16:00:00';

      if (qDadosProcessoCAS_CODIGO.Value = 'PD0101')
      then begin
            NumeroSheets   := 2;
            excel_planilha := Excel.Worksheets.Item['LAUDO PD0101'];
            excel_planilha.Select;
            Excel.WorkBooks[1].Sheets[NumeroSheets].Range['o4','o4'].Select;
           end;
      if (qDadosProcessoCAS_CODIGO.Value = 'PD0201')
      then begin
            NumeroSheets   := 3;
            excel_planilha := Excel.Worksheets.Item['LAUDO PD0201'];
            excel_planilha.Select;
            Excel.WorkBooks[1].Sheets[NumeroSheets].Range['l4','l4'].Select;
           end;
      if (qDadosProcessoCAS_CODIGO.Value = 'RD0301')
      then begin
            NumeroSheets   := 4;
            excel_planilha := Excel.Worksheets.Item['LAUDO RD0301'];
            excel_planilha.Select;
            Excel.WorkBooks[1].Sheets[NumeroSheets].Range['o4','o4'].Select;
           end;

      //Gera e Posiciona a imagem do QRCode
      GeraQRCODE;
      Excel.WorkBooks[1].Sheets[NumeroSheets].Pictures.Insert(DiretorioQrcode + IntToStr(qDadosProcessoPRO_COD.Value) + '.png');


      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[48,1]  := 'IPC - Rua da paz, 185 - Campo Grande, MS - ' + DataAtual;
      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[4,5]  := 'EXAME DE DNA      L' + qDadosProcessoPRO_NUMLAUDO.Value;


      if (qDadosProcessoPRO_TIPO.Value = 2)
      then begin
            if (qBuscaDadosColetadorLCO_COD.Value = 301)
            then begin
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[12,2] := 'EXTRAJUDICIAL - ' + AnsiUpperCase(qBuscaCidadeCOMARCA.Value) + ' / ' + qBuscaCidadeESTADO.Value;
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[26,1] := 'EXTRAJUDICIAL - ' + qBuscaCidadeCOMARCA.Value + ' / ' + qBuscaCidadeESTADO.Value;
                 end else begin
                           Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[12,2] := trim(qDadosProcessoPRO_TIPO_XLSX.Value) + ' - ' +  AnsiUpperCase(qBuscaCidadeCOMARCA.Value) + ' / ' + qBuscaCidadeESTADO.Value;
                           Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[25,1] := ' em relação à Criança.';
                           Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[26,1] := '';
                           Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[27,1] := '';
                          end;
           end else begin
                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[12,2] :=  trim(qDadosProcessoPRO_TIPO_XLSX.Value) + ' - ' +  AnsiUpperCase(qBuscaCidadeCOMARCA.Value) + ' / ' + qBuscaCidadeESTADO.Value;
                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[26,1] :=  trim(qDadosProcessoPRO_TIPO_XLSX.Value) + ' - ' +  AnsiUpperCase(qBuscaCidadeCOMARCA.Value) + ' / ' + qBuscaCidadeESTADO.Value;
                    end;



      // Posição do Laudo Tipo 2

      if (qDadosProcessoCAS_CODIGO.Value = 'PD0201')
      then begin
            if (qBuscaDadosColetadorLCO_COD.Value = 301)
            then begin
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[13,1]  := 'Coletador:';
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[13,2]  := 'INSTITUTO DE PERICIAS CIENTÍFICAS';
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[20,1] :=  'Compareceram ao INSTITUTO DE PERICIAS CIENTÍFICAS ';
                 end else begin
                            if (qBuscaDadosColetadorLCO_SEXO.Value = 2)
                            then begin
                                   Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[13,1]  := 'Coletadora:';
                                   Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[13,2]  := qBuscaDadosColetadorLCO_NOME.Value;
                                   Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[20,1] :=  'Compareceram perante a COLETADORA autorizada ';
                                 end else begin
                                           Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[13,1]  := 'Coletador:';
                                           Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[13,2]  :=  qBuscaDadosColetadorLCO_NOME.Value;
                                           Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[20,1]  := 'Compareceram perante o COLETADOR autorizado ';
                                         end;
                          end;


           //Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[3,9]    := qDadosProcessoPRO_NPERC.Value;
            // Datas Coleta e Recepeção
            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[13,11]  :=  DateToStr(qDadosProcessoPRO_DCOLE.Value) + ' às ' + Copy(qDadosProcessoPRO_HCOLE.Value,1,2) + 'h' + Copy(qDadosProcessoPRO_HCOLE.Value,4,2) + 'min';
            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[14,11] :=  DateToStr(qDadosProcessoPRO_DREC.Value)  + ' às ' + Copy(qDadosProcessoPRO_HREC.Value,1,2) + 'h' + Copy(qDadosProcessoPRO_HREC.Value,4,2) + 'min';

            //Informação do Lacre
            if ( (trim(qDadosProcessoPRO_LACRE.Value) = '0') or (Length(qDadosProcessoPRO_LACRE.Value) <= 2))
            then begin
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[15,10] :=  'Perícia:';
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[15,11] :=   qDadosProcessoPRO_NPERC.Value;
                 end else begin
                           Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[15,10] :=  'Lacre:';
                           Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[15,11] :=  qDadosProcessoPRO_LACRE.Value;
                           Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[16,10] :=  'Perícia:';
                           Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[16,11] :=  qDadosProcessoPRO_NPERC.Value;
                          end;

            //Informação do Processo
            if (trim(qDadosProcessoPRO_AUTO.Value) = '')
            then begin
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[12,10] :=  '';
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[12,11] :=  '';
                 end else begin
                           Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[12,10] :=  'Processo:';
                           Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[12,11] :=  qDadosProcessoPRO_AUTO.Value;
                          end;

            if (Resultado = 1)
            then begin
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[39,1]  := trim(qDadosProcessoPRO_RESUL_XLSX.Value) +  ', com '+ qDadosProcessoPRO_PROB.Value + '% de probabilidade de ';
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[40,1]  := ' paternidade. Os genótipos estão apresentados ';
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[41,1]  := ' no quadro ao lado, integrando o presente Exame ';
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[42,1]  := ' nº ' + qDadosProcessoPRO_NUMLAUDO.Value + ' com Termo de Autorização ';
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[43,1]  := ' digitalmente armazenado. ';
                 end else begin
                           Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[39,1]  := ' NEGATIVO, com 100% de certeza de exclusão da ';
                           Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[40,1]  := ' paternidade perquirida. Os genótipos estão ';
                           Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[41,1]  := ' apresentados no quadro ao lado, integrando ';
                           Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[42,1]  := ' o presente Exame nº ' + qDadosProcessoPRO_NUMLAUDO.Value + ' com Termo';
                           Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[43,1]  := ' de Autorização digitalmente armazenado.';
                          end;


           end else begin
                      if (qBuscaDadosColetadorLCO_COD.Value = 301)
                      then begin
                            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[13,1]  := 'Coletador:';
                            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[13,2]  := 'INSTITUTO DE PERICIAS CIENTÍFICAS';
                            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[20,1] :=  'Compareceram ao INSTITUTO DE PERICIAS CIENTÍFICAS ';
                           end else begin
                                      if (qBuscaDadosColetadorLCO_SEXO.Value = 2)
                                      then begin
                                             Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[13,1]  := 'Coletadora:';
                                             Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[13,2]  := qBuscaDadosColetadorLCO_NOME.Value;
                                             Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[20,1] :=  'Compareceram perante a COLETADORA autorizada ';
                                           end else begin
                                                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[13,1]  := 'Coletador:';
                                                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[13,2]  :=  qBuscaDadosColetadorLCO_NOME.Value;
                                                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[20,1]  := 'Compareceram perante o COLETADOR autorizado ';
                                                   end;
                                    end;

                      // Datas Coleta e Recepeção

                      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[13,11]  :=  DateToStr(qDadosProcessoPRO_DCOLE.Value) + ' às ' + Copy(qDadosProcessoPRO_HCOLE.Value,1,2) + 'h' + Copy(qDadosProcessoPRO_HCOLE.Value,4,2) + 'min';
                      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[14,11] :=  DateToStr(qDadosProcessoPRO_DREC.Value)  + ' às ' + Copy(qDadosProcessoPRO_HREC.Value,1,2) + 'h' + Copy(qDadosProcessoPRO_HREC.Value,4,2) + 'min';

                      //Informação do Lacre
                      if ( (trim(qDadosProcessoPRO_LACRE.Value) = '0') or (Length(qDadosProcessoPRO_LACRE.Value) <= 2))
                      then begin
                            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[15,10] := 'Perícia:';
                            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[15,11] :=  qDadosProcessoPRO_NPERC.Value;;
                           end else begin
                                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[15,10] :=  'Lacre:';
                                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[15,11] :=  qDadosProcessoPRO_LACRE.Value;
                                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[16,10] :=  'Perícia:';
                                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[16,11] :=  qDadosProcessoPRO_NPERC.Value;
                                    end;

                      //Informação do Processo
                      if (trim(qDadosProcessoPRO_AUTO.Value) = '')
                      then begin
                            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[12,10] :=  '';
                            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[12,11] :=  '';
                           end else begin
                                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[12,11] :=  'Processo:';
                                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[12,11] :=  qDadosProcessoPRO_AUTO.Value;
                                    end;

                      if (Resultado = 1)
                      then begin
                            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[39,1]  := trim(qDadosProcessoPRO_RESUL_XLSX.Value) +  ', com '+ qDadosProcessoPRO_PROB.Value + '% de probabilidade de ';
                            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[40,1]  := ' paternidade. A maternidade foi confirmada. Os ';
                            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[42,1]  := ' integrando o presente Exame nº ' + qDadosProcessoPRO_NUMLAUDO.Value;
                           end else begin
                                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[39,1]  := 'NEGATIVO, com 100% de certeza de exclusão da ';
                                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[40,1]  := ' paternidade perquirida. A maternidade foi confirmada. Os ';
                                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[42,1]  := ' integrando o presente Exame nº ' + qDadosProcessoPRO_NUMLAUDO.Value;
                                    end;

                    end;

      //Etiqueta
      if (qDadosProcessoPRO_TIPO.Value > 2)
      then begin
            qBuscaDados.Close;
            qBuscaDados.Parameters.ParamByName('ESTADO').Value  := qDadosProcessoUF_SIGLA.Value;
            qBuscaDados.Parameters.ParamByName('COMARCA').Value := qDadosProcessoCOM_COD.Value;
            qBuscaDados.Parameters.ParamByName('VARA').Value    := qDadosProcessoVAR_COD.Value;
            qBuscaDados.Open;

            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[63,3] :=  'DESTINATÁRIO:';
            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[64,3] :=  UpperCase(trim(qDadosProcessoPRO_TIPO_XLSX.Value)) + ' DA COMARCA DE ' + qBuscaDadosCOMARCA.Value;
            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[65,3] :=  'END.: ' + qBuscaDadosENDE_VARA.Value + ' ' +  qBuscaDadosBAIRRO_VARA.Value;
            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[66,3] :=  'CEP: ' + qBuscaDadosCEP_VARA.Value + ' - ' +  qBuscaDadosCIDADE_VARA.Value + ' (' + qBuscaDadosESTADO.Value + ')';
            DM.qJuiz.Open;
            if DM.qJuiz.Locate('JUI_COD', qDadosProcessoJUI_COD.Value, []) = True
            then begin
                  if (DM.qJuizJUI_SEXO.Value = '1')
                  then begin
                        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[67,3] :=  'Sr. ' + dm.qJuizJUI_DESC.Value + ' - EXAME ' +  qDadosProcessoPRO_NUMLAUDO.Value;
                        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[68,3] :=  'EXAME ' +  qDadosProcessoPRO_NUMLAUDO.Value;
                       end else begin
                                 Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[67,3] :=  'Sra. ' + dm.qJuizJUI_DESC.Value + ' - EXAME ' +  qDadosProcessoPRO_NUMLAUDO.Value;
                                 Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[68,3] :=  'EXAME ' +  qDadosProcessoPRO_NUMLAUDO.Value;
                                end;
                 end;

            PartesCaso := '';
            if (qDadosProcessoCAS_CODIGO.Value = 'PD0101')
            then begin
                  if qBuscaDadosPessoas.Locate('SIT_NM', 'CRIANÇA', []) = True
                  then begin
                        PartesCaso := 'INVTE: ' + qBuscaDadosPessoasPES_INICIAIS.Value;
                       end;
                  if qBuscaDadosPessoas.Locate('SIT_NM', 'MÃE', []) = True
                  then begin
                        PartesCaso := PartesCaso + ' - MAE: ' + qBuscaDadosPessoasPES_INICIAIS.Value;
                       end;
                  if qBuscaDadosPessoas.Locate('SIT_NM', 'SUPAI', []) = True
                  then begin
                        PartesCaso := PartesCaso + ' - SUP. PAI: ' + qBuscaDadosPessoasPES_INICIAIS.Value;
                       end;
                 end;

            if (qDadosProcessoCAS_CODIGO.Value = 'PD0201')
            then begin
                  if qBuscaDadosPessoas.Locate('SIT_NM', 'CRIANÇA', []) = True
                  then begin
                        PartesCaso := 'INVTE: ' + qBuscaDadosPessoasPES_INICIAIS.Value;
                       end;
                  if qBuscaDadosPessoas.Locate('SIT_NM', 'SUPAI', []) = True
                  then begin
                        PartesCaso := PartesCaso + ' - SUP. PAI: ' + qBuscaDadosPessoasPES_INICIAIS.Value;
                       end;
                 end;

            if (qDadosProcessoCAS_CODIGO.Value = 'RD0301')
            then begin
                  if qBuscaDadosPessoas.Locate('SIT_NM', 'CRIANÇA', []) = True
                  then begin
                        PartesCaso := 'INVTE: ' + qBuscaDadosPessoasPES_INICIAIS.Value;
                       end;
                  if qBuscaDadosPessoas.Locate('SIT_NM', 'MÃE', []) = True
                  then begin
                        PartesCaso := PartesCaso + ' - MAE: ' + qBuscaDadosPessoasPES_INICIAIS.Value;
                       end;
                  if qBuscaDadosPessoas.Locate('SIT_NM', 'SUPOSTO AVÔ', []) = True
                  then begin
                        PartesCaso := PartesCaso + ' - SUPOSTO AVÔ: ' + qBuscaDadosPessoasPES_INICIAIS.Value;
                       end;
                  if qBuscaDadosPessoas.Locate('SIT_NM', 'SUPOSTA AVÓ', []) = True
                  then begin
                        PartesCaso := PartesCaso + ' - SUPOSTA AVÓ: ' + qBuscaDadosPessoasPES_INICIAIS.Value;
                       end;
                 end;

          Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[69,3] := PartesCaso;

          end else begin
                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[60,3] :=  '';
                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[61,3] :=  '';
                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[62,3] :=  '';
                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[63,3] :=  '';
                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[64,3] :=  '';
                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[65,3] :=  '';
                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[66,3] :=  '';
                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[67,3] :=  '';
                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[68,3] :=  '';
                     Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[69,3] :=  '';
                    end;


      if (qDadosProcessoCAS_CODIGO.Value = 'PD0101')
      then begin
            if qBuscaDadosPessoas.Locate('SIT_NM', 'MÃE', []) = True
            then begin
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[16,1] := 'Mãe:';
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[16,2] := qBuscaDadosPessoasPES_NOME.Value;
                 end;
            if qBuscaDadosPessoas.Locate('SIT_NM', 'SUPAI', []) = True
            then begin
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[15,1] := 'Suposto Pai:';
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[15,2] := qBuscaDadosPessoasPES_NOME.Value;
                 end;
            if qBuscaDadosPessoas.Locate('SIT_NM', 'CRIANÇA', []) = True
            then begin
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[14,1] := 'Investigante:';
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[14,2] := qBuscaDadosPessoasPES_NOME.Value;
                 end;
           end;
      if (qDadosProcessoCAS_CODIGO.Value = 'PD0201')
      then begin
            if qBuscaDadosPessoas.Locate('SIT_NM', 'SUPAI', []) = True
            then begin
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[15,1] := 'Suposto Pai:';
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[15,2] := qBuscaDadosPessoasPES_NOME.Value;
                 end;
            if qBuscaDadosPessoas.Locate('SIT_NM', 'CRIANÇA', []) = True
            then begin
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[14,1] := 'Investigante:';
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[14,2] := qBuscaDadosPessoasPES_NOME.Value;
                 end;
           end;
      if (qDadosProcessoCAS_CODIGO.Value = 'RD0301')
      then begin
            if qBuscaDadosPessoas.Locate('SIT_NM', 'CRIANÇA', []) = True
            then begin
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[14,1] := 'Investigante:';
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[14,2] := qBuscaDadosPessoasPES_NOME.Value;
                 end;
            if qBuscaDadosPessoas.Locate('SIT_NM', 'SUPOSTO AVÔ', []) = True
            then begin
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[15,1] := 'Suposto Avô:';
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[15,2] := qBuscaDadosPessoasPES_NOME.Value;
                 end;
            if qBuscaDadosPessoas.Locate('SIT_NM', 'SUPOSTA AVÓ', []) = True
            then begin
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[16,1] := 'Suposta Avó:';
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[16,2] := qBuscaDadosPessoasPES_NOME.Value;
                 end;
            if qBuscaDadosPessoas.Locate('SIT_NM', 'MÃE', []) = True
            then begin
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[17,1] := 'Mãe:';
                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[17,2] := qBuscaDadosPessoasPES_NOME.Value;
                 end;
           end;

      // FIM NOVO LAUDO
     end;

Excel.Application.Visible := true;
Excel.ActiveWorkBook.SaveAs(NomePlanilha);
Excel.quit;
Excel:=unassigned;

// INSERE HISTÓRICO

DecodeDate(Date, Ano, Mes, Dia);
AnoAtual := IntToStr(Ano);

DM.qMaxHistorico.Close;
DM.qMaxHistorico.Open;
Proximo:=DM.qMaxHistoricoMAX.Value + 1;
DM.qHistorico.Append;
DM.qHistoricoHIS_CONTR.Value := Proximo;
DM.qHistoricoHIS_DATA.Value  := Date;
DM.qHistoricoPRO_COD.Value   := qDadosProcessoPRO_COD.Value;
DM.qHistoricoITE_COD.Value   := 6;
DM.qHistoricoHIS_DOC.Value   := qDadosProcessoPRO_NUMLAUDO.Value;
DM.qHistorico.Post;

// FIM INSERE HISTÓRICO

// ENVIA PARA SITE

try

qDadosProcesso.Close;
qDadosProcesso.Parameters.ParamByName('PROCESSO').Value := NumeroCaso;
qDadosProcesso.Open;


DMI.ADOC_MYSQL.Connected := True;
with DMI.qArquivosWeb do
begin
  Close;
  SQL.Clear;
  SQL.Add(' delete from rdcbco37_resultados.tb_arquivos_ipcms where nome = :nome');
  Parameters.ParamByName('nome').Value      := qDadosProcessoPRO_COD.Value;
  ExecSQL;
end;

with DMI.qArquivosWeb do
begin
  Close;
  SQL.Clear;
  SQL.Add(' INSERT INTO rdcbco37_resultados.tb_arquivos_ipcms (nome, arquivo, data_add, data_lib, protocolo, resultado, datacoleta) VALUES (:nome,:arquivo, now(), :datalibera, :protocolo, :resultado, :datacoleta)');
  Parameters.ParamByName('nome').Value      := qDadosProcessoPRO_COD.Value;
  Parameters.ParamByName('arquivo').Value   := 'DNA';
  Parameters.ParamByName('datalibera').Value:= DataLiberacao;
  Parameters.ParamByName('protocolo').Value := qDadosProcessoPRO_NPERC.Value;
  Parameters.ParamByName('datacoleta').Value:= DateToStr(qDadosProcessoPRO_DCOLE.Value);
  Parameters.ParamByName('resultado').Value := trim(qDadosProcessoPRO_RESUL_XLSX.Value);
  ExecSQL;
end;


DMI.ADOC_MYSQL.Connected := False;
Except
ShowMessage('Erro de conexão com internet (IP: 108.179.193.98). O Exame precisa ser gerado novamente! ');
DMI.ADOC_MYSQL.Connected := False;
end;

// FIM ENVIA PARA SITE
end;


procedure TfExportacaoAlelos.btnDestinoClick(Sender: TObject);
begin
  if opndlgDestino.Execute then
     edtDestino.Text := opndlgDestino.FileName;
end;

procedure TfExportacaoAlelos.sbProcessamentoClick(Sender: TObject);
var
  Arq : TextFile;
  ArqOrigem, Linha, Verificou, vlCOD_ARQ, vlNM1_ARQ, vlNM2_ARQ, vlNM3_ARQ, vlNM4_ARQ,
  vlMAR_ARQ, vlAL1_ARQ, vlAL2_ARQ, v1, v2, v3, v4, v5, v6, v7, Texto, vAuxTexto  : String;
  str : TStringList;
  Contador, vAux, vAux2, vAux3, vAux4, vAux5, vTam : Integer;
begin

//Importe Interno - NORMAL
if (cb_LabExterno.Checked = False)
then begin
      qInsereDadosTemporarios.Open;

      if (Trim(edtOrigem.Text) <> '') and
        (FileExists(Trim(edtOrigem.Text))) then
        begin
           str := TStringList.Create;
           str.Delimiter := ',';

           ArqOrigem := Trim(edtOrigem.Text);
           AssignFile(Arq,ArqOrigem);
           Reset(Arq);
           while not Eof(Arq) do
             begin
               Try
                 Readln(Arq,Linha);
                 str.DelimitedText := Linha;
                 vlNM1_ARQ := str[0];
                 if not ((vlNM1_ARQ = 'CONTROLE') or (vlNM1_ARQ = 'Identifiler') or (vlNM1_ARQ = 'IDENTIFILER') or (vlNM1_ARQ = 'Sample')
                      or (vlNM1_ARQ = 'FUSION') or (vlNM1_ARQ = 'FUSION2') or (vlNM1_ARQ = 'LADDER') or (vlNM1_ARQ = 'LADDER1') or (vlNM1_ARQ = 'LADDER2') or (vlNM1_ARQ = 'LADDER3') or (vlNM1_ARQ = 'LADDER4') or (vlNM1_ARQ = 'LADDER5') or (vlNM1_ARQ = 'FUSION6C'))
                 then begin
                       vlNM2_ARQ := str[1];
                       vlNM3_ARQ := str[2];
                       vlNM4_ARQ := str[3];
                       vlMAR_ARQ := str[4];
                       vlAL1_ARQ := str[5];
                       vlAL2_ARQ := str[6];
                       NumeroCaso                 := vlNM1_ARQ;
                       NumeroCasoVerificacao      := 0;
                       NumeroCasoVerificacao      := StrToInt(vlNM1_ARQ);

                       qVerificaCasoIncluso.Close;
                       qVerificaCasoIncluso.Parameters.ParamByName('Numero').Value := NumeroCaso;
                       qVerificaCasoIncluso.Open;
                       if (qVerificaCasoIncluso.RecordCount >= 1) and (Verificou = '')
                       then begin
                             Verificou := 'Sim';
                             MessageDlg('             :::::::::::: ATENÇÃO :::::::::::: ' + #13 + #13 + 'Caso já existe Cadastrado na Base de Dados.' + #13 + 'Pressione OK para excluir as informações gravadas e reinicie o processo de importação!', mtError,[mbOk], 0);
                             ExcluirCaso(NumeroCaso);
                             ExcluirCasoTemp(NumeroCaso);
                             Abort;
                           end else begin
                                     Verificou := 'Não';
                                     if (Copy(Trim(vlMAR_ARQ),1,2) <> 'DY')
                                     then begin
                                           qInsereDadosTemporarios.Append;
                                           qInsereDadosTemporariosCASO_TALE.Value     := vlNM1_ARQ;
                                           qInsereDadosTemporariosPESSOA_TALE.Value   := vlNM2_ARQ;
                                           qInsereDadosTemporariosINICIAIS_TALE.Value := vlNM3_ARQ;
                                           qInsereDadosTemporariosTIPO_TALE.Value     := vlNM4_ARQ;
                                           qInsereDadosTemporariosALELO_TALE.Value    := vlMAR_ARQ;
                                           qInsereDadosTemporariosVALOR1_TALE.Value   := vlAL1_ARQ;
                                           if vlAL2_ARQ <> ''
                                           then begin
                                                 qInsereDadosTemporariosVALOR2_TALE.Value  := vlAL2_ARQ;
                                                end else qInsereDadosTemporariosVALOR2_TALE .Value  := vlAL1_ARQ;
                                          qInsereDadosTemporarios.Post;
                                         end;
                                   end;
                      end;
               Except
                 Verificou := '';
                 Abort;
               end;
             end;
           CloseFile(Arq);
           Verificou := '';

           //AUDITORIA DE GERAÇÃO
           with qControlaAuditoria do
           begin
            Close;
            SQL.Clear;
            SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
            Parameters.ParamByName('Processo').Value := NumeroCaso;
            Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
            Parameters.ParamByName('Data').Value     := Date;
            Parameters.ParamByName('Hora').Value     := Time;
            Parameters.ParamByName('Execucao').Value := 'Apertou o Botão PROCESSAMENTO/ALELOS - Caso INT: ' + NumeroCaso + ' - Arquivo: ' + edtOrigem.Text;
            ExecSQL;
           end;

           VerificaTipoPCR;

           VerificaDadosOLQuantPartes;

           ExcluirCasoTemp(NumeroCaso);

           EdtCodigo.Text := NumeroCaso;

           sbConsultar.Click;

        end
      else
        Showmessage('Arquivo Inexistente!');
     end;
//Importe Interno - NORMAL - Final

//Importe Externo - NORMAL
if (cb_LabExterno.Checked = True)
then begin
      qInsereDadosTemporarios.Open;

      if (Trim(edtOrigem.Text) <> '') and
        (FileExists(Trim(edtOrigem.Text)) and (EditNumCasoExterno.Text <> '')) then
        begin
           str := TStringList.Create;
           str.Delimiter := ',';

           ArqOrigem := Trim(edtOrigem.Text);
           AssignFile(Arq,ArqOrigem);
           Reset(Arq);
           while not Eof(Arq) do
             begin
               Try
                 Readln(Arq,Linha);
                 str.DelimitedText := Linha;
                 vlNM1_ARQ := str[0];
                 vlMAR_ARQ := str[1];
                 if not ((vlNM1_ARQ = 'Sample') or (vlNM1_ARQ = ' ') or (vlNM1_ARQ = 'Yindel') or (vlMAR_ARQ = 'Yindel'))
                 then begin
                       vlMAR_ARQ := str[1];
                       vlAL1_ARQ := str[2];
                       vlAL2_ARQ := str[3];

                       Texto:= '';
                       Texto:= trim(vlNM1_ARQ);
                       vTam := Length(Texto);
                       v1   := Copy(Texto,1,POS('-', Texto) - 1);
                       vAux := 0;
                       vAux := POS('-', Texto);
                       vAux2:= POS('-', Texto);
                       vAuxTexto := Copy(Texto,vAux+1,vTam);
                       v2   := Copy(Texto,vAux+1,POS('-', vAuxTexto) - 1);
                       vAux := 0;
                       vAux := vAux2 + POS('-', vAuxTexto);
                       vAux3:= POS('-', Texto);
                       vAuxTexto := Copy(Texto,vAux+1,vTam);
                       v3   := Copy(Texto,vAux+1,POS('-', vAuxTexto) - 1);
                       if ((UpperCase(v3) = 'C') )
                       then begin
                             v4 :=  Copy(Texto,vAux+3,POS('-', vAuxTexto) - 1);
                            end;
                       if ((UpperCase(v3) = 'SAVO'))
                       then begin
                             v4 :=   Copy(Texto,vAux+6,1);
                            end;
                       if ((UpperCase(v3) = 'SP'))
                       then begin
                             v4 :=  Copy(Texto,vAux+4,1);
                            end;
                       
                       NumeroCaso := EditNumCasoExterno.Text;

                       qVerificaCasoIncluso.Close;
                       qVerificaCasoIncluso.Parameters.ParamByName('Numero').Value := NumeroCaso;
                       qVerificaCasoIncluso.Open;
                       if (qVerificaCasoIncluso.RecordCount >= 1) and (Verificou = '')
                       then begin
                             Verificou := 'Sim';
                             MessageDlg('             :::::::::::: ATENÇÃO :::::::::::: ' + #13 + #13 + 'Caso já existe Cadastrado na Base de Dados.' + #13 + 'Pressione OK para excluir as informações gravadas e reinicie o processo de importação!', mtError,[mbOk], 0);
                             ExcluirCaso(NumeroCaso);
                             ExcluirCasoTemp(NumeroCaso);
                             Abort;
                           end else begin
                                     Verificou := 'Não';
                                     if (Copy(Trim(vlMAR_ARQ),1,2) <> 'DY')
                                     then begin
                                           qInsereDadosTemporarios.Append;
                                           qInsereDadosTemporariosCASO_TALE.Value     := NumeroCaso;
                                           if ((UpperCase(v3) = 'C'))  then begin qInsereDadosTemporariosPESSOA_TALE.Value := 'CR1' end;
                                           if ((UpperCase(v3) = 'C') and ((v4 = '1') or (v4 = '2') or (v4 = '3') or (v4 = '4'))) then begin qInsereDadosTemporariosPESSOA_TALE.Value := Trim('CR' + v4) end;
                                           if ((UpperCase(v3) = 'C1') OR (UpperCase(v3) = 'C2') OR (UpperCase(v3) = 'C3') OR (UpperCase(v3) = 'C4')) then begin qInsereDadosTemporariosPESSOA_TALE.Value := Copy(UpperCase(v3),1,1) + 'R' + Copy(UpperCase(v3),2,1) end;
                                           if (UpperCase(v3) = 'M') then qInsereDadosTemporariosPESSOA_TALE.Value   := 'MA1';
                                           if ((UpperCase(v3) = 'SP'))  then begin qInsereDadosTemporariosPESSOA_TALE.Value := 'SP1' end;
                                           if ((UpperCase(v3) = 'SP') and ((v4 = '1') or (v4 = '2') or (v4 = '3') or (v4 = '4'))) then begin qInsereDadosTemporariosPESSOA_TALE.Value := Trim('SP' + v4) end;
                                           if ((UpperCase(v3) = 'SP1') OR (UpperCase(v3) = 'SP2') OR (UpperCase(v3) = 'SP3') OR (UpperCase(v3) = 'SP4')) then begin qInsereDadosTemporariosPESSOA_TALE.Value := Copy(UpperCase(v3),1,1) + 'P' + Copy(UpperCase(v3),2,1) end;
                                           if ((UpperCase(v3) = 'SAVO') and ((v4 = 'a') or (v4 = 'A')))
                                           then begin
                                                 qInsereDadosTemporariosPESSOA_TALE.Value := 'AGF'
                                                end;
                                           if ((UpperCase(v3) = 'SAVO') and ((v4 = 'b') or (v4 = 'B'))) then begin qInsereDadosTemporariosPESSOA_TALE.Value := 'AGM' end;
                                           if (UpperCase(v3) = 'SAVOA') then begin qInsereDadosTemporariosPESSOA_TALE.Value := 'AGF' end;
                                           if (UpperCase(v3) = 'SAVOB') then begin qInsereDadosTemporariosPESSOA_TALE.Value := 'AGM' end;
                                           qInsereDadosTemporariosINICIAIS_TALE.Value := 'NInf';
                                           qInsereDadosTemporariosTIPO_TALE.Value     := 'FUSION6C';
                                           qInsereDadosTemporariosALELO_TALE.Value    := vlMAR_ARQ;
                                           qInsereDadosTemporariosVALOR1_TALE.Value   := vlAL1_ARQ;
                                           if vlAL2_ARQ <> ''
                                           then begin
                                                 qInsereDadosTemporariosVALOR2_TALE.Value  := vlAL2_ARQ;
                                                end else qInsereDadosTemporariosVALOR2_TALE .Value  := vlAL1_ARQ;
                                          qInsereDadosTemporarios.Post;
                                         end;
                                   end;
                      end;
               Except
                 Verificou := '';
                 Abort;
               end;
             end;
           CloseFile(Arq);
           Verificou := '';

           //AUDITORIA DE GERAÇÃO
           with qControlaAuditoria do
           begin
            Close;
            SQL.Clear;
            SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
            Parameters.ParamByName('Processo').Value := NumeroCaso;
            Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
            Parameters.ParamByName('Data').Value     := Date;
            Parameters.ParamByName('Hora').Value     := Time;
            Parameters.ParamByName('Execucao').Value := 'Apertou o Botão PROCESSAMENTO/ALELOS - Caso EXT: ' + NumeroCaso + ' - Arquivo: ' + edtOrigem.Text;
            ExecSQL;
           end;


           VerificaTipoPCR;

           VerificaDadosOLQuantPartes;

           ExcluirCasoTemp(NumeroCaso);

           EdtCodigo.Text := NumeroCaso;
           sbConsultar.Click;

        end
      else begin
            MessageDlg('Informe o Número do Caso no IPCMS!', mtInformation,[mbOk], 0);
            EditNumCasoExterno.SetFocus;
           end;
     end;
//Importe Externo - Final

end;

procedure TfExportacaoAlelos.ExcluirCaso(Caso: String);
begin
  qExcluirCaso.Close;
  qExcluirCaso.Parameters.ParamByName('Numero').Value := Caso;
  qExcluirCaso.ExecSQL;
end;

procedure TfExportacaoAlelos.ExcluirCasoTemp(Caso: String);
begin
 qExcluiCasoTEMP.Close;
 qExcluiCasoTEMP.Parameters.ParamByName('Numero').Value := Caso;
 qExcluiCasoTEMP.ExecSQL;
end;


function TfExportacaoAlelos.BuscaNumeroLabExterno: String;
var
  Arq : TextFile;
  ArqOrigem, Linha, Verificou, vlCOD_ARQ, vlNM1_ARQ, vlNM2_ARQ, vlNM3_ARQ, vlNM4_ARQ,
  vlMAR_ARQ, vlAL1_ARQ, vlAL2_ARQ, v1, v2, v3, Texto, vAuxTexto, PegaNumeroIPCMS : String;
  str : TStringList;
  Contador, vAux, vAux2, vTam : Integer;
begin
Contador := 0;

if (Trim(edtOrigem.Text) <> '') and (FileExists(Trim(edtOrigem.Text)) and (EditNumCasoExterno.Text = '')) 
then begin
       str := TStringList.Create;
       str.Delimiter := ',';

       ArqOrigem := Trim(edtOrigem.Text);
       AssignFile(Arq,ArqOrigem);
       Reset(Arq);
       while not Eof(Arq) do
         begin
           Try
             Readln(Arq,Linha);
             str.DelimitedText := Linha;
             vlNM1_ARQ := str[0];
             if not ((vlNM1_ARQ = 'Sample') or (vlNM1_ARQ = ' ') or (vlNM1_ARQ = 'Yindel') or (vlMAR_ARQ = 'Yindel') or (Contador = 1))
             then begin
                     Texto:= '';
                     Texto:= trim(vlNM1_ARQ);
                     vTam := Length(Texto);
                     v1   := Copy(Texto,1,POS('-', Texto) - 1);
                     vAux := 0;
                     vAux := POS('-', Texto);
                     vAux2:= POS('-', Texto);
                     vAuxTexto := Copy(Texto,vAux+1,vTam);
                     v2   := Copy(Texto,vAux+1,POS('-', vAuxTexto) - 1);
                     vAux := 0;
                     vAux := vAux2 + POS('-', vAuxTexto);
                     vAuxTexto := Copy(Texto,vAux+1,vTam);
                     v3   := Copy(Texto,vAux+1,POS('-', vAuxTexto) - 1);

                      NumeroCaso                 := Copy(v1,3,8);
                      try
                      NumeroLabExterno := 0;
                      DMI.ADOC_MYSQL.Connected := True;
                      with DMI.qBuscaNumeroLabExterno do
                      begin
                        Close;
                        SQL.Clear;
                        SQL.Add(' select distinct codigo from rdcbco37_resultados.tb_processos_ipcms where codigodnalab = :Codigo');
                        Parameters.ParamByName('Codigo').Value      := NumeroCaso;
                        Open;
                      end;
                      NumeroLabExterno := DMI.qBuscaNumeroLabExternocodigo.Value;
                      if (NumeroLabExterno = 0)
                      then begin
                            PegaNumeroIPCMS := '';
                            PegaNumeroIPCMS := Copy(Trim(edtOrigem.Text),Length(Trim(edtOrigem.Text))-8,5);
                            Label8.Enabled             := True;
                            EditNumCasoExterno.Text    := '';
                            EditNumCasoExterno.Text    := PegaNumeroIPCMS;
                            EditNumCasoExterno.Enabled := True;
                            EditNumCasoExterno.SetFocus;
                            Abort;
                           end else begin
                                      Label8.Enabled             := True;
                                      EditNumCasoExterno.Enabled := True;
                                      EditNumCasoExterno.Text    := IntToStr(NumeroLabExterno);
                                    end;

                      DMI.ADOC_MYSQL.Connected := False;
                      Except
                        DMI.ADOC_MYSQL.Connected := False;
                      end;

                      Contador := 1;

                   end;
            except

            End;
         end;
         CloseFile(Arq);
      end;
end;

procedure TfExportacaoAlelos.sbGerarPDFClick(Sender: TObject);
begin

qDadosProcesso.Close;
qDadosProcesso.Parameters.ParamByName('PROCESSO').Value := EdtCodigo.Text;
qDadosProcesso.Open;

//DiretorioPDF := DM.qParametrosPAM_DIRINTEGRADOC.Value + ' ' + IntToStr(qDadosProcessoPRO_ANO.Value) + '_\' + qDadosProcessoPRO_NUMLAUDO.Value + '\';
//Diretorio    := DM.qParametrosPAM_DIRINTEGRADOC.Value + ' ' + IntToStr(qDadosProcessoPRO_ANO.Value) + '_\' + qDadosProcessoPRO_NUMLAUDO.Value + '\';

DiretorioPDF := DM.qParametrosPAM_DIRINTEGRADOC.Value + '\' + qDadosProcessoPRO_NUMLAUDO.Value + '\';
Diretorio    := DM.qParametrosPAM_DIRINTEGRADOC.Value + '\' + qDadosProcessoPRO_NUMLAUDO.Value + '\';


if (cb_NovoModelo.Checked = True)
then begin
      NomePlanilha := Diretorio + qDadosProcessoPRO_NUMLAUDO.Value + '.xlsm';
      NomePDF      := DiretorioPDF + qDadosProcessoPRO_NUMLAUDO.Value + '.pdf';
     end else begin
               NomePlanilha := Diretorio + qDadosProcessoPRO_NUMLAUDO.Value + '.xlsx';
               NomePDF      := DiretorioPDF + qDadosProcessoPRO_NUMLAUDO.Value + '.pdf';
              end;


//Abre o Aruivo
excel := CreateOleObject('Excel.Application');
if not Excel.Application.Visible then
Excel.WorkBooks.Open(NomePlanilha);

//Seleciona a Guia
if (qDadosProcessoCAS_CODIGO.Value = 'PD0101')
then begin
      excel_planilha := Excel.Worksheets.Item['LAUDO PD0101'];
     end;
if (qDadosProcessoCAS_CODIGO.Value = 'PD0201')
then begin
      excel_planilha := Excel.Worksheets.Item['LAUDO PD0201'];
     end;
if (qDadosProcessoCAS_CODIGO.Value = 'RD0301')
then begin
      excel_planilha := Excel.Worksheets.Item['LAUDO RD0301'];
     end;
excel_planilha.Select;

//Exporta para PDF
excel_planilha.ExportAsFixedFormat(0, NomePDF, 0, True, False, 1, 1, False, EmptyParam);
Excel.Application.Visible := true;
Excel.quit;
Excel:=unassigned;

ShowMessage('Geração do Exame XLSM e PDF finalizado!');

sbGerarPDF.Enabled := False;
sbLimpar.Click;
end;

procedure TfExportacaoAlelos.ftpsend(host, username, password, filefrom, fileto: string;port: integer);
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
       MessageDlg('Esse Exame precisa ser Liberado novamente: ' + fileto,mtError,[mbOk],0);
      end;
 finally
 ms.Free;

ftp.Free;
 end;
 except
 ShowMessage('Uma tentativa de enviar um arquivo para o servidor falhou');
 end;
end;


function TfExportacaoAlelos.VerificaTipoPCR;
begin

qBuscaTemporarios.Close;
qBuscaTemporarios.Parameters.ParamByName('Caso').Value := NumeroCaso;
qBuscaTemporarios.Open;

Tipo := '';

if (qBuscaTemporarios.Locate('INICIAIS_TALE', 'NInf', []) = true)
then begin
      Tipo := 'FUSION 6C'
     end else begin
                if (qBuscaTemporarios.Locate('ALELO_TALE', 'D6S1043', []) = true)
                then begin
                      Tipo := 'VERIFILER'
                     end else begin
                                if (qBuscaTemporarios.Locate('ALELO_TALE', 'D22S1045', []) = true)
                                then begin
                                      Tipo := 'FUSION 6C'
                                     end else begin
                                                if (qBuscaTemporarios.Locate('ALELO_TALE', 'SE33', []) = true)
                                                then begin
                                                      Tipo := 'GLOBAL'
                                                     end else begin
                                                                Tipo := 'FUSION';
                                                              end;
                                              end;
                             end;
              end;

L_Tipo.Caption := '';
L_Tipo.Caption := Tipo;

qInsereDados.Open;
qBuscaTemporarios.First;
while qBuscaTemporarios.Eof = False do
begin
 qInsereDados.Append;
 qInsereDadosNM1_ALE.Value  := qBuscaTemporariosCASO_TALE.Value;
 qInsereDadosNM2_ALE.Value  := qBuscaTemporariosPESSOA_TALE.Value;
 qInsereDadosNM3_ALE.Value  := qBuscaTemporariosINICIAIS_TALE.Value;
 qInsereDadosNM4_ALE.Value  := qBuscaTemporariosTIPO_TALE.Value;

 qBuscaTipo.Close;
 qBuscaTipo.Parameters.ParamByName('Tipo').Value  := Tipo;
 qBuscaTipo.Parameters.ParamByName('Alelo').Value := qBuscaTemporariosALELO_TALE.Value;
 qBuscaTipo.Open;
 qInsereDadosMAR_ALE.Value  := qBuscaTemporariosALELO_TALE.Value;
 qInsereDadosORD_ALE.Value  := qBuscaTipoATP_ORDEM.Value;

 qInsereDadosAL1_ALE.Value  := qBuscaTemporariosVALOR1_TALE.Value;
 qInsereDadosAL2_ALE.Value  := qBuscaTemporariosVALOR2_TALE.Value;
 qInsereDados.Post;

 qBuscaTemporarios.Next;
end;

qMostraResultado.Close;
qMostraResultado.Parameters.ParamByName('Caso').Value := NumeroCaso;
qMostraResultado.Open;

sbProcessamento.Enabled := False;

end;

function TfExportacaoAlelos.VerificaDadosOLQuantPartes;
var valor : String;
begin

// Verifica OL nos registros
qVerificaDadosCodigo.Close;
qVerificaDadosCodigo.Parameters.ParamByName('Numero').Value := NumeroCaso;
qVerificaDadosCodigo.Open;
valor := qVerificaDadosCodigoNM1_ALE.Value;
if (qVerificaDadosCodigo.RecordCount <> 1)
then begin
      MessageDlg('                                                      :::::ATENÇÃO::::::' + #13 + #13 + 'Informações INCORRETAS. Encontrado "CÓDIGOS DIFERENTES". Por favor confira os Dados!', mtError,[mbOk], 0);
      Abort;
      Close;
     end else begin
               qVerificaDados.Close;
               qVerificaDados.SQL.Clear;
               qVerificaDados.SQL.Add('select a.al1_ale from TB_ALELOS a ');
               qVerificaDados.SQL.Add(' where a.NM1_ALE = :Numero ');
               qVerificaDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
               qVerificaDados.Open;
               if qVerificaDados.Locate('AL1_ALE', 'OL', []) = True
               then begin
                     MessageDlg('                                                      :::::ATENÇÃO::::::' + #13 + #13 + 'Informações INCORRETAS. Encontrado valor "OL" nos alelos. Por favor confira os Dados!', mtError,[mbOk], 0);
                     Abort;
                     Close;
                    end else begin
                              qVerificaDados.Close;
                              qVerificaDados.SQL.Clear;
                              qVerificaDados.SQL.Add('select a.al2_ale from TB_ALELOS a ');
                              qVerificaDados.SQL.Add(' where a.NM1_ALE = :Numero ');
                              qVerificaDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
                              qVerificaDados.Open;
                              if qVerificaDados.Locate('AL2_ALE', 'OL', []) = True
                              then begin
                                    MessageDlg('                                                      :::::ATENÇÃO::::::' + #13 + #13 + 'Informações INCORRETAS. Encontrado valor "OL" nos alelos. Por favor confira os Dados!', mtError,[mbOk], 0);
                                    Abort;
                                    Close;
                                   end;
                            end;
              end;

// Verifica OL nos registros
qQuantPartesProcesso.Close;
qQuantPartesProcesso.Parameters.ParamByName('Codigo').Value := NumeroCaso;
qQuantPartesProcesso.Open;

qDadosProcesso.Close;
qDadosProcesso.Parameters.ParamByName('PROCESSO').Value := NumeroCaso;
qDadosProcesso.Open;

qQuantPartesCSV.Close;
qQuantPartesCSV.Parameters.ParamByName('Numero').Value := NumeroCaso;
qQuantPartesCSV.Open;

if not ((qDadosProcessoCAS_CODIGO.Value = 'PD0131') or (qDadosProcessoCAS_CODIGO.Value = 'PD0121')) // or (qDadosProcessoCAS_CODIGO.Value = 'PD0102'))
then begin
      if (qQuantPartesProcesso.RecordCount <> qQuantPartesCSV.RecordCount)
      then begin
            MessageDlg('                                   :::::ATENÇÃO::::::' + #13 + #13 + 'Informações INCORRETAS!' + #13 + #13 + ' Quantidade de partes do Caso DIFERENTE da quantidade partes do arquivo CSV.', mtError,[mbOk], 0);
            Abort;
            Close;
           end;
     end;
end;

procedure TfExportacaoAlelos.bbtP1Click(Sender: TObject);
begin
EdtPosicao1.Enabled := True;
EdtPosicao1.Text    := Trim(qPessoasParaExportarNM2_ALE.Value);
EdtPosicao1.Enabled := False;
bbtP1.Enabled       := False;
end;

procedure TfExportacaoAlelos.bbtP2Click(Sender: TObject);
begin
EdtPosicao2.Enabled := True;
EdtPosicao2.Text    := Trim(qPessoasParaExportarNM2_ALE.Value);
EdtPosicao2.Enabled := False;
bbtP2.Enabled       := False;
end;

procedure TfExportacaoAlelos.bbtP3Click(Sender: TObject);
begin
EdtPosicao3.Enabled := True;
EdtPosicao3.Text    := Trim(qPessoasParaExportarNM2_ALE.Value);
EdtPosicao3.Enabled := False;
bbtP3.Enabled       := False;
end;

procedure TfExportacaoAlelos.sbExportarClick(Sender: TObject);
begin

sbExportar.Enabled := True;
if ((edtDestino.Text=''))
then begin
      Showmessage('O arquivo do EXCEL de destinos das informações não foi selecionado. Favor verificar!');
     end else begin
                if ((EdtPosicao1.Text='') or (EdtPosicao2.Text='') or (EdtPosicao3.Text=''))
                then begin
                      Showmessage('Está faltando informar as posições com as pessoas a serem exportadas. Favor verificar!');
                     end else begin
                               ExportaAlelos;
                              end;
              end;




// Automatizações - 04/10/2024
if ((qDadosProcessoCAS_CODIGO.Value = 'PD0101') or (qDadosProcessoCAS_CODIGO.Value = 'PD0201') or (qDadosProcessoCAS_CODIGO.Value = 'RD0301'))
then begin
      sbGerarPDF.Enabled := True;
      sbGerarPDF.Click;
     end else ShowMessage('Geração do Exame XLSX finalizado!');
// Automatizações Fim
end;

procedure TfExportacaoAlelos.sbLimparClick(Sender: TObject);
begin
 edtDestino.Clear;
 EdtCodigo.Clear;
 EdtPosicao1.Clear;
 EdtPosicao2.Clear;
 EdtPosicao3.Clear;
 EdtPosicao4.Clear;
 EdtPosicao5.Clear;
 edtDestino.Text := '';
 qConsultaPessoas.Close;
 qPessoasParaExportar.Close;
 bbtP1.Enabled := False;
 bbtP2.Enabled := False;
 bbtP3.Enabled := False;
 bbtP4.Enabled := False;
 sbProcessamento.Enabled   := True;
 btnOrigem.Enabled         := True;
 L_Tipo.Caption            := '';
 Label8.Enabled            := False;
 EditNumCasoExterno.Clear;
 EditNumCasoExterno.Enabled:= False;
 cb_LabExterno.Checked     := False;
 cb_UNA_Posicao2.Checked   := False;
 cb_UNA_Posicao3.Checked   := False;

end;

procedure TfExportacaoAlelos.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
key:=#0;
Perform(WM_NEXTDLGCTL,0,0);
end;
end;

procedure TfExportacaoAlelos.sbNaoDisponivel1Click(Sender: TObject);
begin
EdtPosicao1.Enabled := True;
EdtPosicao1.Text    := 'Não Disponível';
EdtPosicao1.Enabled := False;

end;

procedure TfExportacaoAlelos.bbtP4Click(Sender: TObject);
begin
EdtPosicao4.Enabled := True;
EdtPosicao4.Text    := Trim(qPessoasParaExportarNM2_ALE.Value);
EdtPosicao4.Enabled := False;
bbtP4.Enabled       := False;
end;

procedure TfExportacaoAlelos.bbtP5Click(Sender: TObject);
begin
EdtPosicao5.Enabled := True;
EdtPosicao5.Text    := Trim(qPessoasParaExportarNM2_ALE.Value);
EdtPosicao5.Enabled := False;
bbtP5.Enabled       := False;
end;

procedure TfExportacaoAlelos.sbNaoDisponivel4Click(Sender: TObject);
begin
EdtPosicao4.Enabled := True;
EdtPosicao4.Text    := 'Não Disponível';
EdtPosicao4.Enabled := False;

end;


procedure TfExportacaoAlelos.sbNaoDisponivel5Click(Sender: TObject);
begin
EdtPosicao5.Enabled := True;
EdtPosicao5.Text    := 'Não Disponível';
EdtPosicao5.Enabled := False;
end;

function TfExportacaoAlelos.VerificaRepeticaoAlelos(Valor : String): String;
begin

qTipoPessoas.Close;
qTipoPessoas.Parameters.ParamByName('Numero').Value := NumeroCasoVerificacao;
qTipoPessoas.Open;

qTipoPessoas.First;
while qTipoPessoas.Eof = False do
begin

    qDadosRepeticaoAlelos.Close;
    qDadosRepeticaoAlelos.Parameters.ParamByName('Pessoa').Value := qTipoPessoasNM2_ALE.Value;
    qDadosRepeticaoAlelos.Parameters.ParamByName('Numero').Value := NumeroCasoVerificacao;
    qDadosRepeticaoAlelos.Open;

    qDadosRepeticaoAlelos.First;
    while qDadosRepeticaoAlelos.Eof = False do
    begin
     if qDadosRepeticaoAlelos.Locate('MAR_ALE', 'FGA', []) = True
     then begin
           DMR.qFGA.Close;
           DMR.qFGA.Parameters.ParamByName('Valor1').Value := qDadosRepeticaoAlelosAL1_ALE.Value;
           DMR.qFGA.Parameters.ParamByName('Valor2').Value := qDadosRepeticaoAlelosAL2_ALE.Value;
           DMR.qFGA.Open;
          end;

     if qDadosRepeticaoAlelos.Locate('MAR_ALE', 'D21S11', []) = True
     then begin
           DMR.qD21S11.Close;
           DMR.qD21S11.Parameters.ParamByName('Valor1').Value := qDadosRepeticaoAlelosAL1_ALE.Value;
           DMR.qD21S11.Parameters.ParamByName('Valor2').Value := qDadosRepeticaoAlelosAL2_ALE.Value;
           DMR.qD21S11.Open;
          end;

     if qDadosRepeticaoAlelos.Locate('MAR_ALE', 'D2S1338', []) = True
     then begin
           DMR.qD2S1338.Close;
           DMR.qD2S1338.Parameters.ParamByName('Valor1').Value := qDadosRepeticaoAlelosAL1_ALE.Value;
           DMR.qD2S1338.Parameters.ParamByName('Valor2').Value := qDadosRepeticaoAlelosAL2_ALE.Value;
           DMR.qD2S1338.Open;
          end;
   end;
end;
end;



procedure TfExportacaoAlelos.sbConsultarClick(Sender: TObject);
begin
sbExportar.Enabled := True;
btnOrigem.Enabled  := False;

qDadosProcesso.Close;
qDadosProcesso.Parameters.ParamByName('PROCESSO').Value := StrToInt(EdtCodigo.Text);
qDadosProcesso.Open;


qPessoasParaExportar.Close;
qPessoasParaExportar.Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
qPessoasParaExportar.Open;

qConsultaPessoas.Close;
qConsultaPessoas.Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
qConsultaPessoas.Open;

if (qPessoasParaExportar.RecordCount <= 0)
then begin
      Showmessage('Informações de ALELOS não foram encontrados no Banco de Dados!');
      EdtCodigo.Clear;
      qConsultaPessoas.Close;
      qPessoasParaExportar.Close;
      EdtCodigo.SetFocus;
     end;

EdtPosicao1.Enabled := True;
bbtP1.Enabled       := True;
EdtPosicao2.Enabled := True;
bbtP2.Enabled       := True;
EdtPosicao3.Enabled := True;
bbtP3.Enabled       := True;
EdtPosicao4.Enabled := True;
bbtP4.Enabled       := True;
EdtPosicao5.Enabled := True;
bbtP5.Enabled       := True;

if (L_Tipo.Caption = 'FUSION 6C')
then begin
      if (qConsultaPessoasCAS_CODIGO.Value = 'PD0101')
      then begin
            EdtPosicao1.Enabled := True;
            EdtPosicao1.Text    := 'MA1';
            EdtPosicao1.Enabled := False;
            bbtP1.Enabled       := False;
            EdtPosicao2.Enabled := True;
            EdtPosicao2.Text    := 'CR1';
            EdtPosicao2.Enabled := False;
            bbtP2.Enabled       := False;
            EdtPosicao3.Enabled := True;
            EdtPosicao3.Text    := 'SP1';
            EdtPosicao3.Enabled := False;
            bbtP3.Enabled       := False;
            EdtPosicao4.Enabled := True;
            EdtPosicao4.Text    := 'Não Disponível';
            EdtPosicao4.Enabled := False;
            bbtP4.Enabled       := False;
            EdtPosicao5.Enabled := True;
            EdtPosicao5.Text    := 'Não Disponível';
            EdtPosicao5.Enabled := False;
            bbtP5.Enabled       := False;
           end;
      if (qConsultaPessoasCAS_CODIGO.Value = 'PD0201')
      then begin
            EdtPosicao1.Enabled := True;
            EdtPosicao1.Text    := 'Não Disponível';
            EdtPosicao1.Enabled := False;
            bbtP1.Enabled       := False;
            EdtPosicao2.Enabled := True;
            EdtPosicao2.Text    := 'CR1';
            EdtPosicao2.Enabled := False;
            bbtP2.Enabled       := False;
            EdtPosicao3.Enabled := True;
            EdtPosicao3.Text    := 'SP1';
            EdtPosicao3.Enabled := False;
            bbtP3.Enabled       := False;
            EdtPosicao4.Enabled := True;
            EdtPosicao4.Text    := 'Não Disponível';
            EdtPosicao4.Enabled := False;
            bbtP4.Enabled       := False;
            EdtPosicao5.Enabled := True;
            EdtPosicao5.Text    := 'Não Disponível';
            EdtPosicao5.Enabled := False;
            bbtP5.Enabled       := False;
           end;
      if (qConsultaPessoasCAS_CODIGO.Value = 'RD0301')
      then begin
            EdtPosicao1.Enabled := True;
            EdtPosicao1.Text    := 'MA1';
            EdtPosicao1.Enabled := False;
            bbtP1.Enabled       := False;
            EdtPosicao2.Enabled := True;
            EdtPosicao2.Text    := 'CR1';
            EdtPosicao2.Enabled := False;
            bbtP2.Enabled       := False;
            EdtPosicao3.Enabled := True;
            EdtPosicao3.Text    := 'Não Disponível';
            EdtPosicao3.Enabled := False;
            bbtP3.Enabled       := False;
            EdtPosicao4.Enabled := True;
            EdtPosicao4.Text    := 'AGF';
            EdtPosicao4.Enabled := False;
            bbtP4.Enabled       := False;
            EdtPosicao5.Enabled := True;
            EdtPosicao5.Text    := 'AGM';
            EdtPosicao5.Enabled := False;
            bbtP5.Enabled       := False;
           end;
     end;

//Automatizaçãoes - Verificar sem Caso é Externo

cb_NovoModelo.Checked := True;


if (qConsultaPessoasCAS_CODIGO.Value = 'PD0101')
then begin

      if (cb_NovoModelo.Checked = True)
      then begin
            edtDestino.Text := DM.qParametrosPAM_DPADR.Value + 'Planilhas\CT01_FUSION_6c.xlsm';
           end else edtDestino.Text := DM.qParametrosPAM_DPADR.Value + 'Planilhas\CT01_FUSION_6c.xlsx';
     end;

if (qConsultaPessoasCAS_CODIGO.Value = 'PD0201')
then begin
      if (cb_NovoModelo.Checked = True)
      then begin
            edtDestino.Text := DM.qParametrosPAM_DPADR.Value + 'Planilhas\CT01_FUSION_6c.xlsm';
           end else edtDestino.Text := DM.qParametrosPAM_DPADR.Value + 'Planilhas\CT02_FUSION_6c.xlsx';
     end;
if (qConsultaPessoasCAS_CODIGO.Value = 'RD0301')
then begin
      if (cb_NovoModelo.Checked = True)
      then begin
            edtDestino.Text := DM.qParametrosPAM_DPADR.Value + 'Planilhas\CT01_FUSION_6c.xlsm';
           end else edtDestino.Text := DM.qParametrosPAM_DPADR.Value + 'Planilhas\CT03_FUSION_6c.xlsx';
     end;

// Automatizações - 04/10/2024

if (EdtPosicao2.Text = 'CR1')
then begin
      sbExportar.Click;
     end;
// Automatizações
end;

procedure TfExportacaoAlelos.btnOrigemClick(Sender: TObject);
begin
  if opndlgOrigem.Execute then
     edtOrigem.Text := opndlgOrigem.FileName;
end;

procedure TfExportacaoAlelos.GeraQRCODE;
var Valor: String;
begin
if not DirectoryExists(DiretorioQrcode)
then begin
      ForceDirectories(DiretorioQrcode);
    end;

  try
    Valor := 'www.rdcb.com.br/consulta.php?documento=' + qDadosProcessoPRO_NPERC.Value;
    Funcoes.GeraQRCode(
             Image1,
             Valor,
             0,
             TQRCodeEncoding(0),
             clBlack,
             clWhite
    );
    Image1.Picture.SaveToFile(DiretorioQrcode + IntToStr(qDadosProcessoPRO_COD.Value) + '.png');
  except
    on E: exception do
      ShowMessage(E.Message);
  end;
end;

procedure TfExportacaoAlelos.cb_LabExternoClick(Sender: TObject);
begin
if (cb_LabExterno.Checked = True)
then begin
      if (edtOrigem.Text<>'')
      then begin
            BuscaNumeroLabExterno;
           end else begin
                     Showmessage('Arquivo Inexistente!');
                     cb_LabExterno.Checked := False;
                     edtOrigem.SetFocus;
                    end;
     end;
end;

procedure TfExportacaoAlelos.cb_NovoModeloClick(Sender: TObject);
begin
if (qConsultaPessoasCAS_CODIGO.Value = 'PD0101')
then begin
      if (cb_NovoModelo.Checked = True)
      then begin
            edtDestino.Text := DM.qParametrosPAM_DPADR.Value + 'Planilhas\CT01_FUSION_6c.xlsm';
           end else edtDestino.Text := DM.qParametrosPAM_DPADR.Value + 'Planilhas\CT01_FUSION_6c.xlsx';
     end;

if (qConsultaPessoasCAS_CODIGO.Value = 'PD0201')
then begin
      if (cb_NovoModelo.Checked = True)
      then begin
            edtDestino.Text := DM.qParametrosPAM_DPADR.Value + 'Planilhas\CT01_FUSION_6c.xlsm';
           end else edtDestino.Text := DM.qParametrosPAM_DPADR.Value + 'Planilhas\CT02_FUSION_6c.xlsx';
     end;
if (qConsultaPessoasCAS_CODIGO.Value = 'RD0301')
then begin
      if (cb_NovoModelo.Checked = True)
      then begin
            edtDestino.Text := DM.qParametrosPAM_DPADR.Value + 'Planilhas\CT01_FUSION_6c.xlsm';
           end else edtDestino.Text := DM.qParametrosPAM_DPADR.Value + 'Planilhas\CT03_FUSION_6c.xlsx';
     end;
end;

procedure TfExportacaoAlelos.cb_UNA_Posicao2Click(Sender: TObject);
begin
if (cb_UNA_Posicao2.Checked = True) then cb_UNA_Posicao3.Checked := False;
end;

procedure TfExportacaoAlelos.cb_UNA_Posicao3Click(Sender: TObject);
begin
if (cb_UNA_Posicao3.Checked = True) then cb_UNA_Posicao2.Checked := False;
end;

function TfExportacaoAlelos.MesExtenso( Mes:Word ) : string; const meses : array[0..11] of PChar = ('janeiro', 'fevereiro', 'março', 'abril', 'maio', 'junho', 'julho', 'agosto', 'setembro','outubro', 'novembro', 'dezembro');
begin
result := meses[mes-1];
End;

end.
