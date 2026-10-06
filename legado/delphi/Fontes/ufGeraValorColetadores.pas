unit ufGeraValorColetadores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ComCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, Mask, COMobj, DB, ADODB, RLReport,
  JvExControls, JvDBLookup, JvExMask, JvToolEdit, Vcl.Menus;

type
  TfGeraValorColetadores = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    SBConsultar: TSpeedButton;
    SBFechar: TSpeedButton;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Label5: TLabel;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    sbMostrar: TSpeedButton;
    RadioGroup1: TRadioGroup;
    DBGrid_anual: TDBGrid;
    QuickRepBanco: TRLReport;
    QRBand7: TRLBand;
    QRLabel9: TRLLabel;
    QRLabel10: TRLLabel;
    QRSysData1: TRLSystemInfo;
    QRSysData2: TRLSystemInfo;
    QRImage1: TRLImage;
    QRLabel4: TRLLabel;
    QRLabel7: TRLLabel;
    QRLabel6: TRLLabel;
    QRLabel3: TRLLabel;
    sbImprimir: TSpeedButton;
    qSelCidade: TADOQuery;
    DS_SelCidade: TDataSource;
    RxDBLookupComboCidades: TJvDBLookupCombo;
    Label6: TLabel;
    DBGrid_mensal: TDBGrid;
    ComboBox2: TComboBox;
    Label7: TLabel;
    qSelCidadeLCO_CID: TStringField;
    sbLimpar: TSpeedButton;
    DBGrid_Filtro: TDBGrid;
    sbREM: TSpeedButton;
    DateEdit2: TJvDateEdit;
    DateEdit1: TJvDateEdit;
    RLGroup1: TRLGroup;
    QRBand12: TRLBand;
    QRLabel26: TRLLabel;
    QRDBText10: TRLDBText;
    QRLabel18: TRLLabel;
    QRLabel17: TRLLabel;
    QRLabel19: TRLLabel;
    QRLabel20: TRLLabel;
    QRLabel1: TRLLabel;
    QRLabel2: TRLLabel;
    QRBand10: TRLBand;
    QRDBText5: TRLDBText;
    QRDBText1: TRLDBText;
    QRDBText2: TRLDBText;
    QRDBText3: TRLDBText;
    QRDBText8: TRLDBText;
    QRDBText9: TRLDBText;
    QRBand11: TRLBand;
    QRLabel22: TRLLabel;
    RLDBResult1: TRLDBResult;
    QuickRepConferencia: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLImage1: TRLImage;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLGroup2: TRLGroup;
    RLBand2: TRLBand;
    RLLabel7: TRLLabel;
    RLDBText1: TRLDBText;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLBand3: TRLBand;
    RLDBText2: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLBand4: TRLBand;
    RLLabel14: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLDBText8: TRLDBText;
    pm_Relatorios: TPopupMenu;
    ListaparaBANCO1: TMenuItem;
    N1: TMenuItem;
    ListaparaConferncia1: TMenuItem;
    procedure SBFecharClick(Sender: TObject);
    procedure SBConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure sbMostrarClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure sbLimparClick(Sender: TObject);
    procedure sbREMClick(Sender: TObject);
    procedure ListaparaBANCO1Click(Sender: TObject);
    procedure ListaparaConferncia1Click(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGeraValorColetadores: TfGeraValorColetadores;

implementation

uses ufDM, ufDMR;

{$R *.dfm}

procedure TfGeraValorColetadores.SBFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfGeraValorColetadores.SBConsultarClick(Sender: TObject);
var excel :variant;
    MesGerando : String;
    i, Linha, NumeroSheets, NumeroSheetsV2, Total, Codigo  : Integer;
begin
try

excel := CreateOleObject('Excel.Application');
if not Excel.Application.Visible then
Excel.WorkBooks.Open(DM.qParametrosPAM_DRCOL.Value);

if ComboBox1.Text = 'JANEIRO'
then begin
NumeroSheets := 2;
end;
if ComboBox1.Text = 'FEVEREIRO'
then begin
NumeroSheets := 3;
end;
if ComboBox1.Text = 'MARÇO'
then begin
NumeroSheets := 4;
end;
if ComboBox1.Text = 'ABRIL'
then begin
NumeroSheets := 5;
end;
if ComboBox1.Text = 'MAIO'
then begin
NumeroSheets := 6;
end;
if ComboBox1.Text = 'JUNHO'
then begin
NumeroSheets := 7;
end;
if ComboBox1.Text = 'JULHO'
then begin
NumeroSheets := 8;
end;
if ComboBox1.Text = 'AGOSTO'
then begin
NumeroSheets := 9;
end;
if ComboBox1.Text = 'SETEMBRO'
then begin
NumeroSheets   := 10;
end;
if ComboBox1.Text = 'OUTUBRO'
then begin
NumeroSheets := 11;
end;
if ComboBox1.Text = 'NOVEMBRO'
then begin
NumeroSheets := 12;
end;
if ComboBox1.Text = 'DEZEMBRO'
then begin
NumeroSheets := 13;
end;


Linha := 5;

for i := 1 to 500 do
begin
if (Trim(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3])='')
then begin
      Codigo     := 0;
     end else Codigo := StrToInt(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3]);

if not (Codigo <= 0)
then begin
      DMR.qGeraValorColetaroresSemPessoas.Close;
      DMR.qGeraValorColetaroresSemPessoas.Parameters.ParamByName('DTINI').Value := DateEdit1.Date;
      DMR.qGeraValorColetaroresSemPessoas.Parameters.ParamByName('DTFIN').Value := DateEdit2.Date;
      DMR.qGeraValorColetaroresSemPessoas.Parameters.ParamByName('LOC').Value   := Codigo;
      DMR.qGeraValorColetaroresSemPessoas.Open;

      {//Normal
      DMR.qGeraValorColetaroresEXTRA.Close;
      DMR.qGeraValorColetaroresEXTRA.Parameters.ParamByName('DTINI').Value := DateEdit1.Date;
      DMR.qGeraValorColetaroresEXTRA.Parameters.ParamByName('DTFIN').Value := DateEdit2.Date;
      DMR.qGeraValorColetaroresEXTRA.Parameters.ParamByName('LOC').Value   := DMR.qConsultaColetadoresCODIGO.Value;
      DMR.qGeraValorColetaroresEXTRA.Open;

      DMR.qGeraValorColetaroresJUDI.Close;
      DMR.qGeraValorColetaroresJUDI.Parameters.ParamByName('DTINI').Value := DateEdit1.Date;
      DMR.qGeraValorColetaroresJUDI.Parameters.ParamByName('DTFIN').Value := DateEdit2.Date;
      DMR.qGeraValorColetaroresJUDI.Parameters.ParamByName('LOC').Value   := DMR.qConsultaColetadoresCODIGO.Value;
      DMR.qGeraValorColetaroresJUDI.Open;

      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4]:= DMR.qGeraValorColetaroresEXTRACOUNT.Value;
      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5]:= DMR.qGeraValorColetaroresJUDICOUNT.Value;
      //Fim Normal
      }

      //Versão 3
      DMR.qGeraValorColetaroresCT.Close;
      DMR.qGeraValorColetaroresCT.Parameters.ParamByName('DTINI').Value := DateEdit1.Date;
      DMR.qGeraValorColetaroresCT.Parameters.ParamByName('DTFIN').Value := DateEdit2.Date;
      DMR.qGeraValorColetaroresCT.Parameters.ParamByName('LOC').Value   := Codigo;
      DMR.qGeraValorColetaroresCT.Open;

      DMR.qGeraValorColetaroresDP.Close;
      DMR.qGeraValorColetaroresDP.Parameters.ParamByName('DTINI').Value := DateEdit1.Date;
      DMR.qGeraValorColetaroresDP.Parameters.ParamByName('DTFIN').Value := DateEdit2.Date;
      DMR.qGeraValorColetaroresDP.Parameters.ParamByName('LOC').Value   := Codigo;
      DMR.qGeraValorColetaroresDP.Open;

      DMR.qGeraValorColetaroresMP.Close;
      DMR.qGeraValorColetaroresMP.Parameters.ParamByName('DTINI').Value := DateEdit1.Date;
      DMR.qGeraValorColetaroresMP.Parameters.ParamByName('DTFIN').Value := DateEdit2.Date;
      DMR.qGeraValorColetaroresMP.Parameters.ParamByName('LOC').Value   := Codigo;
      DMR.qGeraValorColetaroresMP.Open;

      DMR.qGeraValorColetaroresJUD.Close;
      DMR.qGeraValorColetaroresJUD.Parameters.ParamByName('DTINI').Value := DateEdit1.Date;
      DMR.qGeraValorColetaroresJUD.Parameters.ParamByName('DTFIN').Value := DateEdit2.Date;
      DMR.qGeraValorColetaroresJUD.Parameters.ParamByName('LOC').Value   := Codigo;
      DMR.qGeraValorColetaroresJUD.Open;

      DMR.qGeraValorColetaroresEXT.Close;
      DMR.qGeraValorColetaroresEXT.Parameters.ParamByName('DTINI').Value := DateEdit1.Date;
      DMR.qGeraValorColetaroresEXT.Parameters.ParamByName('DTFIN').Value := DateEdit2.Date;
      DMR.qGeraValorColetaroresEXT.Parameters.ParamByName('LOC').Value   := Codigo;
      DMR.qGeraValorColetaroresEXT.Open;

      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := DMR.qGeraValorColetaroresEXTCOUNT.Value;
      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,8] := DMR.qGeraValorColetaroresJUDCOUNT.Value;
      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,11]:= DMR.qGeraValorColetaroresMPCOUNT.Value;
      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,12]:= DMR.qGeraValorColetaroresDPCOUNT.Value;
      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,13]:= DMR.qGeraValorColetaroresCTCOUNT.Value;
      //Fim Versão 2
    end;
 Linha:=Linha+1;
 ProgressBar1.Position:=ProgressBar1.Position+1;

end;

Excel.Application.Visible := true;

except
showmessage('Ocorreu erro ao executar a transferência');
end;
end;


procedure TfGeraValorColetadores.FormShow(Sender: TObject);
begin
DMR.qConsultaColetadores.Open;
DM.qParametros.Open;
qSelCidade.Open;
end;

procedure TfGeraValorColetadores.ListaparaBANCO1Click(Sender: TObject);
begin
ProgressBar1.Position := ProgressBar1.Position + 200;
ProgressBar1.Position := ProgressBar1.Position + 400;

DMR.qVisaoPagamentoBanco.Close;
DMR.qVisaoPagamentoBanco.Parameters.ParamByName('DTINI').Value  := DateEdit1.Date;
DMR.qVisaoPagamentoBanco.Parameters.ParamByName('DTFIN').Value  := DateEdit2.Date;
DMR.qVisaoPagamentoBanco.Open;

ProgressBar1.Position := ProgressBar1.Position + 600;
ProgressBar1.Position := ProgressBar1.Position + 800;

QuickRepBanco.Preview(nil);

ProgressBar1.Position := 0;
end;

procedure TfGeraValorColetadores.ListaparaConferncia1Click(Sender: TObject);
begin
ProgressBar1.Position := ProgressBar1.Position + 200;
ProgressBar1.Position := ProgressBar1.Position + 400;

DMR.qVisaoPagamentoConferencia.Close;
DMR.qVisaoPagamentoConferencia.Parameters.ParamByName('DTINI').Value := DateEdit1.Date;
DMR.qVisaoPagamentoConferencia.Parameters.ParamByName('DTFIN').Value := DateEdit2.Date;
DMR.qVisaoPagamentoConferencia.Open;

ProgressBar1.Position := ProgressBar1.Position + 600;
ProgressBar1.Position := ProgressBar1.Position + 800;

QuickRepConferencia.Preview(nil);

ProgressBar1.Position := 0;
end;

procedure TfGeraValorColetadores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DMR.qConsultaColetadores.Close;
DM.qParametros.Close;
qSelCidade.Close;
end;

procedure TfGeraValorColetadores.ComboBox1Change(Sender: TObject);
var    Ano, Mes, Dia : Word;
       AnoA : String;
begin

DecodeDate (Date, Ano, Mes, Dia);
AnoA := IntToStr(Ano);

if ComboBox1.Text = 'JANEIRO'
then begin
DateEdit1.Text := '01/01/'+AnoA;
DateEdit2.Text := '31/01/'+AnoA;
end;
if ComboBox1.Text = 'FEVEREIRO'
then begin
DateEdit1.Text := '01/02/'+AnoA;
DateEdit2.Text := '28/02/'+AnoA;
end;
if ComboBox1.Text = 'MARÇO'
then begin
DateEdit1.Text := '01/03/'+AnoA;
DateEdit2.Text := '31/03/'+AnoA;
end;
if ComboBox1.Text = 'ABRIL'
then begin
DateEdit1.Text := '01/04/'+AnoA;
DateEdit2.Text := '30/04/'+AnoA;
end;
if ComboBox1.Text = 'MAIO'
then begin
DateEdit1.Text := '01/05/'+AnoA;
DateEdit2.Text := '31/05/'+AnoA;
end;
if ComboBox1.Text = 'JUNHO'
then begin
DateEdit1.Text := '01/06/'+AnoA;
DateEdit2.Text := '30/06/'+AnoA;
end;
if ComboBox1.Text = 'JULHO'
then begin
DateEdit1.Text := '01/07/'+AnoA;
DateEdit2.Text := '31/07/'+AnoA;
end;
if ComboBox1.Text = 'AGOSTO'
then begin
DateEdit1.Text := '01/08/'+AnoA;
DateEdit2.Text := '31/08/'+AnoA;
end;
if ComboBox1.Text = 'SETEMBRO'
then begin
DateEdit1.Text := '01/09/'+AnoA;
DateEdit2.Text := '30/09/'+AnoA;
end;
if ComboBox1.Text = 'OUTUBRO'
then begin
DateEdit1.Text := '01/10/'+AnoA;
DateEdit2.Text := '31/10/'+AnoA;
end;
if ComboBox1.Text = 'NOVEMBRO'
then begin
DateEdit1.Text := '01/11/'+AnoA;
DateEdit2.Text := '30/11/'+AnoA;
end;
if ComboBox1.Text = 'DEZEMBRO'
then begin
DateEdit1.Text := '01/12/'+AnoA;
DateEdit2.Text := '31/12/'+AnoA;
end;

end;

procedure TfGeraValorColetadores.sbMostrarClick(Sender: TObject);
var Contador : Integer;
begin
ProgressBar1.Position := ProgressBar1.Position + 200;
ProgressBar1.Position := ProgressBar1.Position + 400;
ProgressBar1.Position := ProgressBar1.Position + 600;
ProgressBar1.Position := ProgressBar1.Position + 800;
if (RadioGroup1.ItemIndex = 0)
then begin
      DMR.qVisaoPagamento.Close;
      DMR.qVisaoPagamento.Parameters.ParamByName('DTINI').Value := DateEdit1.Date;
      DMR.qVisaoPagamento.Parameters.ParamByName('DTFIN').Value := DateEdit2.Date;
      DMR.qVisaoPagamento.Open;
     end;
if (RadioGroup1.ItemIndex = 1)
then begin
      DMR.qVisaoPagamentoAno.Close;
      DMR.qVisaoPagamentoAno.Open;
     end;

if (RadioGroup1.ItemIndex = 2)
then begin
      DMR.qVisaoPagamentoFiltro.Close;
      DMR.qVisaoPagamentoFiltro.SQL.Clear;
      DMR.qVisaoPagamentoFiltro.SQL.Add('select ');
      DMR.qVisaoPagamentoFiltro.SQL.Add('upper(lc.lco_cod) codigo, ');
      DMR.qVisaoPagamentoFiltro.SQL.Add('upper(lc.lco_nome) nome, ');
      DMR.qVisaoPagamentoFiltro.SQL.Add('upper(lc.lco_cid || '' - '' || lc.uf_sigla) cidade, ');
      DMR.qVisaoPagamentoFiltro.SQL.Add('cast(sum(x.ct) AS NUMERIC(15,2)) totConselhoTutelar, ');
      DMR.qVisaoPagamentoFiltro.SQL.Add('cast(sum(x.dp) AS NUMERIC(15,2)) totDefensoriaPublica, ');
      DMR.qVisaoPagamentoFiltro.SQL.Add('cast(sum(x.mp) AS NUMERIC(15,2)) totMinisterioPublico, ');
      DMR.qVisaoPagamentoFiltro.SQL.Add('cast(sum(x.jud) AS NUMERIC(15,2)) totJudicial, ');
      DMR.qVisaoPagamentoFiltro.SQL.Add('cast(sum(x.ext) AS NUMERIC(15,2)) totExtrajudicial, ');
      DMR.qVisaoPagamentoFiltro.SQL.Add('cast(sum(x.ext+x.jud+x.mp+x.dp+x.ct) AS NUMERIC(15,2)) totGeral ');
      DMR.qVisaoPagamentoFiltro.SQL.Add('from ');
      DMR.qVisaoPagamentoFiltro.SQL.Add('( ');

      //full
      if (ComboBox2.Text = '')
      then begin
            DMR.qVisaoPagamentoFiltro.SQL.Add('	select   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	  p.pro_cod   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 7)) THEN (count(*)*(v.valor)) ELSE 0 END ct  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (4,10))) THEN (count(*)*(v.valor)) ELSE 0  END dp  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 3)) THEN (count(*)*(v.valor)) ELSE 0  END mp  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (1,5,6,8))) THEN (count(*)*(v.valor)) ELSE 0  END jud  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 2)) THEN (count(*)*(v.valor)) ELSE 0  END ext  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, p.pro_drec   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, p.lco_cod   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	from tb_PROCESSO p JOIN VI_VALOR_COLETADOR v on v.caso=p.pro_cod    ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	group by p.pro_drec, p.lco_cod, v.valor, p.pro_cod, p.pro_sit,p.pro_tipo   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('        ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	UNION  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('        ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	select      ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	  p.pro_cod      ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 7)) THEN (count(*)*(v.valor)) ELSE 0 END ct  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (4,10))) THEN (count(*)*(v.valor)) ELSE 0  END dp  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 3)) THEN (count(*)*(v.valor)) ELSE 0  END mp  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (1,5,6,8))) THEN (count(*)*(v.valor)) ELSE 0  END jud  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 2)) THEN (count(*)*(v.valor)) ELSE 0  END ext  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, tca.COA_DATREC pro_drec   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, tca.lco_cod   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	from tb_PROCESSO p JOIN VI_VALOR_COLETADOR v on v.caso=p.pro_cod  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	JOIN TB_COLETA_ADICIONAL tca ON tca.PRO_COD=p.PRO_COD  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	group by tca.COA_DATREC, tca.lco_cod, v.valor, p.pro_cod, p.pro_sit,p.pro_tipo  ');
           end;

      //ct
      if (ComboBox2.Text = 'CT')
      then begin
            DMR.qVisaoPagamentoFiltro.SQL.Add('	select   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	  p.pro_cod   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (4,10))) THEN (count(*)*(v.valor)) ELSE 0  END dp  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, p.pro_drec   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, p.lco_cod   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	from tb_PROCESSO p JOIN VI_VALOR_COLETADOR v on v.caso=p.pro_cod    ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	group by p.pro_drec, p.lco_cod, v.valor, p.pro_cod, p.pro_sit,p.pro_tipo   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('        ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	UNION  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('        ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	select      ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	  p.pro_cod      ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (4,10))) THEN (count(*)*(v.valor)) ELSE 0  END dp  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, tca.COA_DATREC pro_drec ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, tca.lco_cod   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	from tb_PROCESSO p JOIN VI_VALOR_COLETADOR v on v.caso=p.pro_cod  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	JOIN TB_COLETA_ADICIONAL tca ON tca.PRO_COD=p.PRO_COD  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	group by tca.COA_DATREC, tca.lco_cod, v.valor, p.pro_cod, p.pro_sit,p.pro_tipo  ');
           end;

      //dp
      if (ComboBox2.Text = 'DP')
      then begin
            DMR.qVisaoPagamentoFiltro.SQL.Add('	select   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	  p.pro_cod   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 3)) THEN (count(*)*(v.valor)) ELSE 0  END mp  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, p.pro_drec   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, p.lco_cod   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	from tb_PROCESSO p JOIN VI_VALOR_COLETADOR v on v.caso=p.pro_cod    ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	group by p.pro_drec, p.lco_cod, v.valor, p.pro_cod, p.pro_sit,p.pro_tipo   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('        ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	UNION  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('        ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	select      ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	  p.pro_cod      ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 3)) THEN (count(*)*(v.valor)) ELSE 0  END mp  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, tca.COA_DATREC pro_drec   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, tca.lco_cod   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	from tb_PROCESSO p JOIN VI_VALOR_COLETADOR v on v.caso=p.pro_cod  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	JOIN TB_COLETA_ADICIONAL tca ON tca.PRO_COD=p.PRO_COD  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	group by tca.COA_DATREC, tca.lco_cod, v.valor, p.pro_cod, p.pro_sit,p.pro_tipo  ');
           end;
      //mp
      if (ComboBox2.Text = 'MP')
      then begin
            DMR.qVisaoPagamentoFiltro.SQL.Add('	select   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	  p.pro_cod   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 7)) THEN (count(*)*(v.valor)) ELSE 0 END ct  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, p.pro_drec   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, p.lco_cod   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	from tb_PROCESSO p JOIN VI_VALOR_COLETADOR v on v.caso=p.pro_cod    ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	group by p.pro_drec, p.lco_cod, v.valor, p.pro_cod, p.pro_sit,p.pro_tipo   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('        ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	UNION  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('        ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	select      ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	  p.pro_cod      ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 7)) THEN (count(*)*(v.valor)) ELSE 0 END ct  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, tca.COA_DATREC pro_drec   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, tca.lco_cod   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	from tb_PROCESSO p JOIN VI_VALOR_COLETADOR v on v.caso=p.pro_cod  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	JOIN TB_COLETA_ADICIONAL tca ON tca.PRO_COD=p.PRO_COD  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	group by tca.COA_DATREC, tca.lco_cod, v.valor, p.pro_cod, p.pro_sit,p.pro_tipo  ');
           end;
      //jud
      if (ComboBox2.Text = 'JUD')
      then begin
            DMR.qVisaoPagamentoFiltro.SQL.Add('	select   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	  p.pro_cod   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (1,5,6,8))) THEN (count(*)*(v.valor)) ELSE 0  END jud  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, p.pro_drec   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, p.lco_cod   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	from tb_PROCESSO p JOIN VI_VALOR_COLETADOR v on v.caso=p.pro_cod    ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	group by p.pro_drec, p.lco_cod, v.valor, p.pro_cod, p.pro_sit,p.pro_tipo   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('        ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	UNION  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('        ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	select      ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	  p.pro_cod      ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (1,5,6,8))) THEN (count(*)*(v.valor)) ELSE 0  END jud  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, tca.COA_DATREC pro_drec  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, tca.lco_cod   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	from tb_PROCESSO p JOIN VI_VALOR_COLETADOR v on v.caso=p.pro_cod  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	JOIN TB_COLETA_ADICIONAL tca ON tca.PRO_COD=p.PRO_COD  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	group by tca.COA_DATREC, tca.lco_cod, v.valor, p.pro_cod, p.pro_sit,p.pro_tipo  ');
           end;
      //parti
      if (ComboBox2.Text = 'PART')
      then begin
            DMR.qVisaoPagamentoFiltro.SQL.Add('	select   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	  p.pro_cod   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 2)) THEN (count(*)*(v.valor)) ELSE 0  END ext  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, p.pro_drec   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, p.lco_cod   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	from tb_PROCESSO p JOIN VI_VALOR_COLETADOR v on v.caso=p.pro_cod    ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	group by p.pro_drec, p.lco_cod, v.valor, p.pro_cod, p.pro_sit,p.pro_tipo   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('        ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	UNION  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('        ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	select      ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	  p.pro_cod      ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 2)) THEN (count(*)*(v.valor)) ELSE 0  END ext  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, tca.COA_DATREC pro_drec ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	, tca.lco_cod   ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	from tb_PROCESSO p JOIN VI_VALOR_COLETADOR v on v.caso=p.pro_cod  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	JOIN TB_COLETA_ADICIONAL tca ON tca.PRO_COD=p.PRO_COD  ');
            DMR.qVisaoPagamentoFiltro.SQL.Add('	group by tca.COA_DATREC, tca.lco_cod, v.valor, p.pro_cod, p.pro_sit,p.pro_tipo  ');
            Contador := Contador + 1;
           end;

      DMR.qVisaoPagamentoFiltro.SQL.Add('	) as x join TB_LCOLETA lc on lc.LCO_COD = x.lco_cod ');
      DMR.qVisaoPagamentoFiltro.SQL.Add('	where');

      if (DateEdit1.Date <> 0) and (DateEdit2.Date <> 0)
      then begin
            DMR.qVisaoPagamentoFiltro.SQL.Add('	(x.pro_drec >= :DTINI) and (x.pro_drec <= :DTFIN) ');
            DMR.qVisaoPagamentoFiltro.Parameters.ParamByName('DTINI').Value := DateEdit1.Date;
            DMR.qVisaoPagamentoFiltro.Parameters.ParamByName('DTFIN').Value := DateEdit2.Date;
            Contador := Contador + 1;
           end;

      if (RxDBLookupComboCidades.Value <> '')
      then begin
            if Contador >=1
            then begin
                  DMR.qVisaoPagamentoFiltro.SQL.Add(' AND ');
                  DMR.qVisaoPagamentoFiltro.SQL.Add(' lc.lco_cid like :Cidade ');
                  DMR.qVisaoPagamentoFiltro.Parameters.ParamByName('Cidade').Value := '%' +RxDBLookupComboCidades.Value+ '%';
                 end else begin
                           DMR.qVisaoPagamentoFiltro.SQL.Add('	 lc.lco_cid like :Cidade ');
                           DMR.qVisaoPagamentoFiltro.Parameters.ParamByName('Cidade').Value := '%' +RxDBLookupComboCidades.Value+ '%';
                          end;
           Contador := Contador + 1;
           end;

      DMR.qVisaoPagamentoFiltro.SQL.Add('	group by lc.lco_cod, lc.lco_nome,lc.lco_cid || '' - '' || lc.uf_sigla ');
      DMR.qVisaoPagamentoFiltro.Open;
     end;


ProgressBar1.Position := 0;
end;

procedure TfGeraValorColetadores.RadioGroup1Click(Sender: TObject);
begin
if (RadioGroup1.ItemIndex = 0)
then begin
      ComboBox1.Enabled := True;
      Label2.Enabled    := True;
      Label3.Enabled    := True;
      Label5.Enabled    := True;
      DateEdit1.Enabled := True;
      DateEdit2.Enabled := True;
      DBGrid_mensal.Visible := True;
      DBGrid_anual.Visible  := False;
      Label6.Enabled        := False;
      Label7.Enabled        := False;
      ComboBox2.Enabled     := False;
      RxDBLookupComboCidades.Enabled := False;
      DBGrid_Filtro.Visible          := False;
      sbLimpar.Enabled               := False;
      sbImprimir.Enabled             := True;
      sbMostrar.Enabled              := True;

    end;
if (RadioGroup1.ItemIndex = 1)
then begin
      ComboBox1.Enabled := False;
      ComboBox1.Text    := '';
      Label2.Enabled    := False;
      Label3.Enabled    := False;
      Label5.Enabled    := False;
      DateEdit1.Enabled := False;
      DateEdit2.Enabled := False;
      DateEdit1.Date    := 0;
      DateEdit2.Date    := 0;
      DBGrid_mensal.Visible := False;
      DBGrid_anual.Visible  := True;
      DMR.qVisaoPagamentoAno.Close;
      DMR.qVisaoPagamentoAno.Open;
      Label6.Enabled        := False;
      Label7.Enabled        := False;
      ComboBox2.Enabled     := False;
      RxDBLookupComboCidades.Enabled := False;
      DBGrid_Filtro.Visible          := False;
      sbLimpar.Enabled               := False;
      sbImprimir.Enabled             := False;
      sbMostrar.Enabled              := False;
    end;
if (RadioGroup1.ItemIndex = 2)
then begin
      ComboBox1.Enabled := True;
      ComboBox1.Text    := '';
      Label2.Enabled    := True;
      Label3.Enabled    := True;
      Label5.Enabled    := True;
      DateEdit1.Enabled := True;
      DateEdit2.Enabled := True;
      DateEdit1.Date    := 0;
      DateEdit2.Date    := 0;
      DBGrid_mensal.Visible := False;
      DBGrid_anual.Visible  := False;
      Label6.Enabled        := True;
      Label7.Enabled        := True;
      ComboBox2.Enabled     := True;
      RxDBLookupComboCidades.Enabled := True;
      DBGrid_Filtro.Visible          := True;
      sbLimpar.Enabled               := True;
      sbImprimir.Enabled             := False;
      sbMostrar.Enabled              := True;

    end;

end;

procedure TfGeraValorColetadores.sbImprimirClick(Sender: TObject);
begin
pm_Relatorios.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfGeraValorColetadores.sbLimparClick(Sender: TObject);
begin
if ((RadioGroup1.ItemIndex = 0) or (RadioGroup1.ItemIndex = 2))
then begin
      DateEdit1.Text                  := '';
      DateEdit2.Text                  := '';
      RxDBLookupComboCidades.KeyValue := -1;
      ComboBox1.Text                  := '';
      ComboBox2.Text                  := '';
      ComboBox1.SetFocus;
     end;
end;

procedure TfGeraValorColetadores.sbREMClick(Sender: TObject);
var
  Texto : TStringList;
  Linha, LocalSalva, AnoA, MesA, DiaA, HoraA : String;
  Ano, Mes, Dia : Word;
begin

   DecodeDate (Date, Ano, Mes, Dia);
   AnoA := IntToStr(Ano);
   if (Dia <= 9) then begin DiaA:= '0' + IntToStr(Dia) end else DiaA:=IntToStr(Dia);
   if (Mes <= 9) then begin MesA:= '0' + IntToStr(Mes) end else MesA:=IntToStr(Mes);

   HOraA := FormatDateTime('hhMMss', Now);

   Texto := TStringList.Create;
   LocalSalva := 'C:\SCPG\Documentos_Gerados\CI240_001_000004.REM';

    Linha := '';
 // Linha Header
    Linha := Linha + '077';   // Código do Banco na Compensação
    Linha := Linha + '0000';  // Lote de Serviço
    Linha := Linha + '0';     // Tipo de Registro
    Linha := Linha + '         ';     // Branco
    Linha := Linha + '2';     // Tipo de documento da empresa
    Linha := Linha + '14424142000190';   // CPF/CNPJ da empresa
    Linha := Linha + '                    ';   // Código do Convênio no Banco da empresa
    Linha := Linha + '00001';   //  Agência Mantenedora da Conta da empresa
    Linha := Linha + '0';   // Dígito Verificador da Agência
    Linha := Linha + '000004335168';   //  Número da Conta Corrente da empresa   *
    Linha := Linha + '9';   //  Dígito Verificador da Conta     *
    Linha := Linha + ' ';   //  Branco
    Linha := Linha + 'INSTITUTO DE PERICIAS CIENTIFI';   //  Nome da Empresa
    Linha := Linha + 'BANCO INTER                   ';   //  Nome do Banco
    Linha := Linha + '          ';   //  Branco
    Linha := Linha + '1';   // Código de Remessa
    Linha := Linha + DiaA + MesA+ AnoA;   //  Data de Geração do Arquivo
    Linha := Linha + HoraA;   //  Hora de Geração do Arquivo
    Linha := Linha + '000001';   //  Número Sequencial do Arquivo
    Linha := Linha + '107';   //  Número da Versão do Layout do Arquivo
    Linha := Linha + '01600';   //  Densidade de Gravação do Arquivo
    Linha := Linha + '                    ';   //  Para Uso Reservado do Banco
    Linha := Linha + '                    ';   //  Para Uso Reservado da Empresa
    Linha := Linha + '                             ' + (#13);   //  Campo em branco
 //

 // Header de Lote
    Linha := Linha + '077';   // Código do Banco na Compensação
    Linha := Linha + '0001';  // Lote de Serviço
    Linha := Linha + '1';     // Tipo de Registro
    Linha := Linha + 'C';     // Tipo da Operação
    Linha := Linha + '32';    // Tipo do Serviço - Pagamento de Honorários
    Linha := Linha + '03';    // Forma de Lançamento - TED
    Linha := Linha + '046';   // Nº da Versão do Layout do Lote
    Linha := Linha + ' ';   //  Branco
    Linha := Linha + '2';     // Tipo de documento da empresa
    Linha := Linha + '14424142000190';   // CPF/CNPJ da empresa
    Linha := Linha + '                    ';   // Código do Convênio no Banco da empresa
    Linha := Linha + '00001';   //  Agência Mantenedora da Conta da empresa
    Linha := Linha + '0';   // Dígito Verificador da Agência
    Linha := Linha + '000004335168';   //  Número da Conta Corrente da empresa   *
    Linha := Linha + '9';   //  Dígito Verificador da Conta     *
    Linha := Linha + ' ';   //  Branco
    Linha := Linha + 'INSTITUTO DE PERICIAS CIENTIFI';   //  Nome da Empresa
    Linha := Linha + '                                        ';   // Informação 1 - Mensagem
    Linha := Linha + 'RUA DA PAZ                    ';   // Nome da Rua, Av, Pça, Etc.. da empresa
    Linha := Linha + '00185';   // Número do Local da empresa
    Linha := Linha + '               ';  // Casa, Apto, Sala, Etc.. da empresa
    Linha := Linha + 'CAMPO GRANDE        ';  // Nome da Cidade da empresa
    Linha := Linha + '79002';   //  CEP da empresa
    Linha := Linha + '190';   //  Complemento do CEP
    Linha := Linha + 'MS';  //  Sigla do Estado da empresa
    Linha := Linha + '        ';   //  Branco
    Linha := Linha + '          ' + (#13);   //  Códigos das Ocorrências (Campo exclusivo para retorno)

 //

 // Segmento A
    Linha := Linha + '077';   // Código do Banco na Compensação
    Linha := Linha + '0001';  // Lote de Serviço
    Linha := Linha + '3';     // Tipo de Registro
    Linha := Linha + '00001';     // Nº Seqüencial do Registro no Lote
    Linha := Linha + 'A';    // Código de Segmento do Reg. Detalhe
    Linha := Linha + '0';    // Tipo de Movimento
    Linha := Linha + '00';   // Código da Instrução p/ Movimento
    Linha := Linha + '000';    //  Código da Câmara Centralizadora
    Linha := Linha + '260';     // Código do Banco do Favorecido
    Linha := Linha + '00001';   // Ag. Mantenedora da Cta do Favor.
    Linha := Linha + '0';   // Dígito Verificador da Agência
    Linha := Linha + '000007381628';   //  Número da Conta Corrente
    Linha := Linha + '7';   // Dígito Verificador da Conta
    Linha := Linha + '0';   // Dígito Verificador da AG/Conta
    Linha := Linha + 'RAPHAEL DOMINGOS CAVALARI BARB';   //  Nome do Favorecido
    Linha := Linha + '    PAGTESTE092022_1';   //  Nº do Docum. Atribuído p/ Empresa
    Linha := Linha + DiaA + MesA+ AnoA;   // Data do Pagamento
    Linha := Linha + 'BRL';   // Tipo da Moeda
    Linha := Linha + '000000000000001';   // Quantidade da Moeda
    Linha := Linha + '000000000000100';   // Valor do Pagamento
    Linha := Linha + '                    ';  // Nº do Docum. Atribuído pelo Banco
    Linha := Linha + DiaA + MesA+ AnoA;  // Data Real da Efetivação Pagto
    Linha := Linha + '000000000000100';  //  Valor Real da Efetivação do Pagto
    Linha := Linha + '                                        ';   //  Outras Informações
    Linha := Linha + '01';  //  Compl. Tipo Serviço
    Linha := Linha + '00001';  //  Codigo finalidade da TED
    Linha := Linha + '  ';   // Complemento de finalidade pagto.
    Linha := Linha + '   ';   //  Uso Exclusivo FEBRABAN/CNAB
    Linha := Linha + '0';   //  Aviso ao Favorecido
    Linha := Linha + '          ' + (#13);   //  Códigos das Ocorrências p/ Retorno
 //

 // Segmento B
    Linha := Linha + '077';   // Código do Banco na Compensação
    Linha := Linha + '0001';  // Lote de Serviço ( Numero do lote )
    Linha := Linha + '3';     // Tipo de Registro
    Linha := Linha + '00001';     // Numero Sequencial do registro detalhe
    Linha := Linha + 'B';    // Código de Segmento do Reg. Detalhe
    Linha := Linha + '   ';    // Forma de Iniciação
    Linha := Linha + '1';   // Tipo de documento do favorecido
    Linha := Linha + '00092877150178';    //  CPF/CNPJ do favorecido
    Linha := Linha + '                                   ';     // Informação 1
    Linha := Linha + '                                                            ';   // Informação 2
    Linha := Linha + '                                                                                                   ';   // Informaão 3
    Linha := Linha + '000000';   //  Uso Exclusivo para o SIAPE
    Linha := Linha + '00000000' + (#13);   // Código ISPB
 //

  // Trailer Lote
    Linha := Linha + '077';   // Código do Banco na Compensação
    Linha := Linha + '0001';  // Lote de Serviço ( Número do lote ) Header
    Linha := Linha + '5';     // Tipo de Registro
    Linha := Linha + '         ';     // Campo em Branco
    Linha := Linha + '000001';    // Quantidade de Registros do Lote (Quantidade de detalhes)
    Linha := Linha + '000000000000000100';    // Somatória dos Valores
    Linha := Linha + '000000000000000000';   // Somatória de Quantidade de Moedas
    Linha := Linha + '000000';    //  Número Aviso de Débito
    Linha := Linha + '                                                                                                                                                                     ';     // Campo em Branco
    Linha := Linha + '          ' + (#13);   // Códigos das Ocorrências para Retorno (Campo exclusivo para retorno)
 //

  // Trailer Arquivo
    Linha := Linha + '077';   // Código do Banco na Compensação
    Linha := Linha + '9999';  // Lote de Serviço ( Número do lote ) Header
    Linha := Linha + '9';     // Tipo de Registro
    Linha := Linha + '         ';     // Campo em Branco
    Linha := Linha + '000001';    // Quantidade de Lotes do Arquivo
    Linha := Linha + '000001';    // Quantidade de Registros do Arquivo
    Linha := Linha + '000001';    // Quantidade de Contas para Conciliação (Quantidade de lotes)
    Linha := Linha + '                                                                                                                                                                                                             ';   // Campo em Branco
 //
  Texto.Add(Linha);
  Texto.SaveToFile(LocalSalva);
end;

end.


