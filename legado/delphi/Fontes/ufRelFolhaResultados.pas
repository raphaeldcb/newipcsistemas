unit ufRelFolhaResultados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, Buttons, ExtCtrls, StdCtrls, Mask,
  DBCtrls, COMobj, ADODB, WordXP, OleServer, QuickRpt, QRCtrls;

type
  TfRelFolhaResultados = class(TForm)
    qBuscaMae: TADOQuery;
    qFolhaResultados: TADOQuery;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    sbGeraFolhas: TSpeedButton;
    EdtCdIni: TEdit;
    EdtCdFim: TEdit;
    sbFechar: TSpeedButton;
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    qFolhaResultadosPRO_COD: TIntegerField;
    qFolhaResultadosPRO_ANO: TIntegerField;
    qFolhaResultadosPRO_NPERC: TStringField;
    qFolhaResultadosPRO_TIPO: TIntegerField;
    qFolhaResultadosPRO_AUTO: TStringField;
    qFolhaResultadosUF_SIGLA: TStringField;
    qFolhaResultadosCAS_CODIGO: TStringField;
    qFolhaResultadosCOM_COD: TIntegerField;
    qFolhaResultadosVAR_COD: TIntegerField;
    qFolhaResultadosLCO_COD: TIntegerField;
    qFolhaResultadosPRO_HCOLE: TStringField;
    qFolhaResultadosPRO_DCOLE: TDateField;
    qFolhaResultadosPRO_HREC: TStringField;
    qFolhaResultadosPRO_DREC: TDateField;
    qFolhaResultadosPRO_DRESU: TDateField;
    qFolhaResultadosPRO_SIT: TIntegerField;
    qFolhaResultadosPRO_NCOMP: TIntegerField;
    qFolhaResultadosPRO_RESUL: TIntegerField;
    qFolhaResultadosPRO_PROB: TStringField;
    qFolhaResultadosPRO_ARETI: TStringField;
    qFolhaResultadosJUI_COD: TIntegerField;
    qFolhaResultadosFG_PROP: TStringField;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    DATA_EXTENSO_COLETA: TQRLabel;
    qBuscaMaePES_NOME: TStringField;
    qBuscaSupPai: TADOQuery;
    qBuscaCrianca: TADOQuery;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    qBuscaSupPaiPES_NOME: TStringField;
    qBuscaCriancaPES_NOME: TStringField;
    CRIANCA: TQRLabel;
    qBuscaCriancaPES_SEXO: TStringField;
    procedure sbGeraFolhasClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    Function MesExtenso( Mes:Word ) : string;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelFolhaResultados: TfRelFolhaResultados;
  f_false, f_true, f_NomeDoc, f_Troca, f_Var, f_NomeSalva :OleVariant;
  Ano, Mes, Dia : Word;
  Data_Mapa, AnoA, MesA, DiaA : String;


implementation

uses ufDM, ufDMR, ufProcesso, ufGeraWord;

{$R *.dfm}


function TfRelFolhaResultados.MesExtenso( Mes:Word ) : string; const meses : array[0..11] of PChar = ('janeiro', 'fevereiro', 'março', 'abril', 'maio', 'junho', 'julho', 'agosto', 'setembro','outubro', 'novembro', 'dezembro');
begin
result := meses[mes-1];
End;

procedure TfRelFolhaResultados.sbGeraFolhasClick(Sender: TObject);
var ContadorCodigo, i, CodigoCaso : Integer;
begin
// inherited;

ContadorCodigo := (StrToInt(EdtCdFim.Text)-StrToInt(EdtCdIni.Text)) + 1;
for i := 1 to ContadorCodigo do
begin
 if i = 1
 then begin
       CodigoCaso := StrToInt(EdtCdIni.Text);
       qFolhaResultados.Close;
       qFolhaResultados.Parameters.ParamByName('PROCESSO').Value  := CodigoCaso;
       qFolhaResultados.Open;
      end else begin
                CodigoCaso := CodigoCaso + 1;
                qFolhaResultados.Close;
                qFolhaResultados.Parameters.ParamByName('PROCESSO').Value  := CodigoCaso;
                qFolhaResultados.Open;
                end;
        QuickRep1.Preview;

end;
end;

procedure TfRelFolhaResultados.sbFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfRelFolhaResultados.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 DecodeDate (qFolhaResultadosPRO_DCOLE.Value, Ano, Mes, Dia);
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
       DiaA := 'Primeiro';
      end;
 DataDiaColeta := DiaA +' de '+ MesA +' de '+ AnoA;

 DATA_EXTENSO_COLETA.Caption := DataDiaColeta;

 qBuscaCrianca.Close;
 qBuscaCrianca.Parameters.ParamByName('PROCESSO').Value  := qFolhaResultadosPRO_COD.Value;
 qBuscaCrianca.Open;
 if (qBuscaCriancaPES_SEXO.Value = '1')
 then begin
       CRIANCA.Caption := qBuscaCriancaPES_NOME.Value + ' - ' + 'Masc.';
      end else begin
                if (qBuscaCriancaPES_SEXO.Value = '2')
                then begin
                      CRIANCA.Caption := qBuscaCriancaPES_NOME.Value + ' - ' + 'Femi.';
                     end else CRIANCA.Caption := qBuscaCriancaPES_NOME.Value;
               end;


 qBuscaMae.Close;
 qBuscaMae.Parameters.ParamByName('PROCESSO').Value  := qFolhaResultadosPRO_COD.Value;
 qBuscaMae.Open;

 qBuscaSupPai.Close;
 qBuscaSupPai.Parameters.ParamByName('PROCESSO').Value  := qFolhaResultadosPRO_COD.Value;
 qBuscaSupPai.Open;
end;

end.
