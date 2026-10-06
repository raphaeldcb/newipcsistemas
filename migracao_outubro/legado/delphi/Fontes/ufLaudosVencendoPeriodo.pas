unit ufLaudosVencendoPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Mask, RLReport, JvExMask, JvToolEdit;

type
  TfLaudosVencendoPeriodo = class(TForm)
    sbVisualizar: TSpeedButton;
    sbFechar: TSpeedButton;
    Label1: TLabel;
    Ckb_Hoje: TCheckBox;
    DateEditInicial: TJvDateEdit;
    Label2: TLabel;
    DateEditFinal: TJvDateEdit;
    procedure sbVisualizarClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure Ckb_HojeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLaudosVencendoPeriodo: TfLaudosVencendoPeriodo;

implementation

uses ufDMR, ufRelLaudosPendentes;

{$R *.dfm}

procedure TfLaudosVencendoPeriodo.sbVisualizarClick(Sender: TObject);
begin
if (DateEditInicial.Date <> 0) and (DateEditFinal.Date <> 0)
then begin
      DMR.qRelLaudosHojeSemPessoa.Close;
      DMR.qRelLaudosHojeSemPessoa.Parameters.ParamByName('DTRESULTADOINI').Value := DateEditInicial.Date;
      DMR.qRelLaudosHojeSemPessoa.Parameters.ParamByName('DTRESULTADOFIM').Value := DateEditFinal.Date;
      DMR.qRelLaudosHojeSemPessoa.Open;

      if DMR.qRelLaudosHojeSemPessoa.RecordCount <= 0
      then begin
           ShowMessage('Não existem dados para essa Consulta!!!!');
          end else begin
                    Application.CreateForm(TfRelLaudosPendentes, fRelLaudosPendentes);
                    fRelLaudosPendentes.VemdeOnde := '';
                    fRelLaudosPendentes.QuickRep2.Preview(nil);
                    fRelLaudosPendentes.Free;
                   end;
    end else ShowMessage('Informe um período para gerar o Relatório!!');               
end;

procedure TfLaudosVencendoPeriodo.sbFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfLaudosVencendoPeriodo.Ckb_HojeClick(Sender: TObject);
begin
if Ckb_Hoje.Checked = True
then begin
      DateEditInicial.Date := Date;
      DateEditFinal.Date := Date;
     end; 
end;

end.
