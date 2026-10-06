unit ufImprimeFolhaResultados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, Buttons, ExtCtrls, StdCtrls, Mask,
  DBCtrls, COMobj, ADODB, WordXP, OleServer, RLReport, RLBarcode;

type
  TfImprimeFolhaResultados = class(TForm)
    qFolhaResultados: TADOQuery;
    QuickRep1: TRLReport;
    QRBand1: TRLBand;
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
    QRBand2: TRLBand;
    QRImage1: TRLImage;
    QRLabel1: TRLLabel;
    QRDBText1: TRLDBText;
    QRDBText2: TRLDBText;
    QRLabel2: TRLLabel;
    qFolhaResultadosPES_COD: TIntegerField;
    qFolhaResultadosPES_NOME: TStringField;
    qFolhaResultadosPES_INICIAIS: TStringField;
    qFolhaResultadosPES_SIT: TIntegerField;
    qFolhaResultadosPES_DTNAS: TDateField;
    qFolhaResultadosPES_LCNAS: TStringField;
    qFolhaResultadosPES_SEXO: TStringField;
    qFolhaResultadosPES_TDOC: TStringField;
    qFolhaResultadosPES_NDOC: TStringField;
    qFolhaResultadosPRO_COD_1: TIntegerField;
    qFolhaResultadosPRO_USUCAD: TStringField;
    qFolhaResultadosPRO_NUMLAUDO: TStringField;
    qFolhaResultadosPRO_RASTREAR: TStringField;
    qFolhaResultadosPRO_CARREGACREDITO: TStringField;
    qFolhaResultadosSIT_COD: TIntegerField;
    qFolhaResultadosSIT_NM: TStringField;
    qFolhaResultadosSIT_SIGLA: TStringField;
    qFolhaResultadosSIT_ORDEM: TIntegerField;
    QRDBText5: TRLDBText;
    QRBand3: TRLBand;
    QRDBText6: TRLDBText;
    QRDBText7: TRLDBText;
    QRDBText8: TRLDBText;
    QRImage2: TRLImage;
    QRLabel6: TRLLabel;
    QRDBText3: TRLDBText;
    QRImage3: TRLImage;
    QRLabel7: TRLLabel;
    DATA_EXTENSO_COLETA: TRLLabel;
    Barra_Codigo: TRLBarcode;
    procedure qFolhaResultadosPES_SEXOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImprimeFolhaResultados: TfImprimeFolhaResultados;
  f_false, f_true, f_NomeDoc, f_Troca, f_Var, f_NomeSalva :OleVariant;
  Ano, Mes, Dia : Word;
  Data_Mapa, AnoA, MesA, DiaA : String;


implementation

uses ufDM, ufDMR, ufProcesso, ufGeraWord;

{$R *.dfm}



procedure TfImprimeFolhaResultados.qFolhaResultadosPES_SEXOGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
	Case qFolhaResultadosPES_SEXO.AsInteger of
        1 : Text := 'Masculino';
        2 : Text := 'Feminino';
    end;
end;

end.
