unit ufEmissaoLColetaExames;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, Mask, Buttons,
  DBCtrls, Grids, DBGrids, DB, ADODB, JvExMask, JvToolEdit;

type
  TfEmissaoLColetaExames = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    bbtConsultar: TBitBtn;
    bbtFechar: TBitBtn;
    qConsultaNaoEnvio: TADOQuery;
    DBGrid1: TDBGrid;
    qConsultaNaoEnvioLCO_LABT: TStringField;
    qConsultaNaoEnvioDATA_ULTIMO_ENVIO: TDateField;
    DS_ConsultaNaoEnvio: TDataSource;
    qConsultaNaoEnvioLCO_NOME: TStringField;
    qConsultaNaoEnvioLCO_CID: TStringField;
    LBMensagem: TLabel;
    DateEditInicial: TJvDateEdit;
    DateEditFinal: TJvDateEdit;
    procedure bbtFecharClick(Sender: TObject);
    procedure bbtConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEmissaoLColetaExames: TfEmissaoLColetaExames;

implementation

uses ufDMR, ufRelConsulta, ufRelFinanceiro, ufRelLaudosEmitidos, ufDM;

{$R *.DFM}


procedure TfEmissaoLColetaExames.bbtFecharClick(Sender: TObject);
begin
	close;
end;

procedure TfEmissaoLColetaExames.bbtConsultarClick(Sender: TObject);
var Contador : Integer;
begin
Contador := 0;
if ((DateEditInicial.Date = 0) and (DateEditFinal.Date = 0)) then
begin
  ShowMessage('Informar o Perídodo para consultar!');
end else begin
          LBMensagem.Visible := True;
          qConsultaNaoEnvio.Close;
          qConsultaNaoEnvio.Parameters.ParamByName('DataIni').Value := DateEditInicial.Date;
          qConsultaNaoEnvio.Parameters.ParamByName('DataFim').Value := DateEditFinal.Date;
          qConsultaNaoEnvio.Open;

          if qConsultaNaoEnvio.RecordCount > 0
          then begin
                DBGrid1.Visible := True;
                LBMensagem.Visible := False;
               end else begin
                         ShowMessage('Não foram encontrados dados para geração desse relatório.');
                         LBMensagem.Visible := False;
                        end;

         end;
end;

end.

