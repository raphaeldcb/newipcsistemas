unit ufEmissaoRelQuantidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, JvExMask, JvToolEdit;

type
  TfEmissaoRelEnviados = class(TForm)
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
  fEmissaoRelEnviados: TfEmissaoRelEnviados;

implementation

uses ufDMR, ufRelFinanceiro;

{$R *.dfm}

procedure TfEmissaoRelEnviados.bbtFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfEmissaoRelEnviados.bbtConsultarClick(Sender: TObject);
begin
if (DateEditInicial.Date = 0) and (DateEditFinal.Date = 0)
then begin
      ShowMessage('Pelo menos um parâmetro tem que ser informado.');
     end else begin
               DMR.qRelQuantidade.Close;
               DMR.qRelQuantidade.Parameters.ParamByName('DTINI').Value := DateEditInicial.Date;
               DMR.qRelQuantidade.Parameters.ParamByName('DTFIN').Value := DateEditFinal.Date;
               DMR.qRelQuantidade.Open;

               if DMR.qRelQuantidade.RecordCount > 0
               then begin
                     Application.CreateForm(TfRelFinanceiro,fRelFinanceiro);
                     fRelFinanceiro.QuickRep2.Preview(nil);
                     fRelFinanceiro.Free;
                    end else begin
                              ShowMessage('Não foram encontrados dados para geração desse relatório.');
                             end;
             end;
end;

end.
