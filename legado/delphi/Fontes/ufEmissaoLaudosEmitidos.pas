unit ufEmissaoLaudosEmitidos;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, Mask, Buttons, JvExMask, JvToolEdit;

type
  TfEmissaoRelLaudosEmitidos = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    bbtConsultar: TBitBtn;
    bbtFechar: TBitBtn;
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
  fEmissaoRelLaudosEmitidos: TfEmissaoRelLaudosEmitidos;

implementation

uses ufDMR, ufRelConsulta, ufRelFinanceiro, ufRelLaudosEmitidos;

{$R *.DFM}


procedure TfEmissaoRelLaudosEmitidos.bbtFecharClick(Sender: TObject);
begin
	close;
end;

procedure TfEmissaoRelLaudosEmitidos.bbtConsultarClick(Sender: TObject);
var Contador : Integer;
begin
Contador := 0;
if ((DateEditInicial.Date = 0) and (DateEditFinal.Date = 0)) then
begin
  ShowMessage('Pelo menos um parâmetro tem que ser informado.');
end else begin
          DMR.qRelLaudosEmitidos.Close;
          DMR.qRelLaudosEmitidos.Parameters.ParamByName('DataIni').Value := DateEditInicial.Date;
          DMR.qRelLaudosEmitidos.Parameters.ParamByName('DataFim').Value := DateEditFinal.Date;
          DMR.qRelLaudosEmitidos.Open;

          if DMR.qRelLaudosEmitidos.RecordCount > 0
          then begin
                Application.CreateForm(TfRelLaudosEmitidos,fRelLaudosEmitidos);
                fRelLaudosEmitidos.QuickRep2.Preview(nil);
                fRelLaudosEmitidos.Free;
               end else begin
                         ShowMessage('Não foram encontrados dados para geração desse relatório.');
                        end;

         end;
end;

end.

