unit ufRelEtiquetasAdesiva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, RLBarcode, ADODB, RLReport, Buttons, StdCtrls;

type
  TfRelEtiquetasAdesiva = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    qDadosProcessos: TADOQuery;
    dsDadosProcessos: TDataSource;
    SpeedButton1: TSpeedButton;
    bbtFechar: TSpeedButton;
    qDadosProcessosCODIGO: TIntegerField;
    qDadosProcessosPES_NOME: TStringField;
    qDadosProcessosSIT_NM: TStringField;
    EdtCodigo: TEdit;
    Label1: TLabel;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBBarcode1: TRLDBBarcode;
    RLDBText4: TRLDBText;
    qDadosProcessosPRO_NPERC: TStringField;
    qDadosProcessosPRO_DCOLE: TDateField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure bbtFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelEtiquetasAdesiva: TfRelEtiquetasAdesiva;
  valor : Integer;

implementation

{$R *.dfm}

procedure TfRelEtiquetasAdesiva.SpeedButton1Click(Sender: TObject);
begin
qDadosProcessos.Close;
qDadosProcessos.Parameters.ParamByName('Codigo').Value := EdtCodigo.Text;
qDadosProcessos.Open;

RLReport1.Preview(nil);
end;

procedure TfRelEtiquetasAdesiva.bbtFecharClick(Sender: TObject);
begin
Close;
end;

end.
