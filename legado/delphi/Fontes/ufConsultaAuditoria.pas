unit ufConsultaAuditoria;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, Mask, Buttons,
  Grids, DBGrids, DBCtrls, Data.DB, JvExMask, JvToolEdit;

type
  TfConsultaAuditoria = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    bbtConsultar: TBitBtn;
    bbtFechar: TBitBtn;
    Label20: TLabel;
    EdtCasos: TEdit;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    bbtLimpar: TBitBtn;
    DateEditInicial: TJvDateEdit;
    DateEditFinal: TJvDateEdit;
    procedure bbtFecharClick(Sender: TObject);
    procedure bbtConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsultaAuditoria: TfConsultaAuditoria;

implementation

uses ufDMR, ufRelConsulta, ufRelFinanceiro;

{$R *.DFM}


procedure TfConsultaAuditoria.bbtFecharClick(Sender: TObject);
begin
	close;
end;

procedure TfConsultaAuditoria.bbtConsultarClick(Sender: TObject);
var Contador : Integer;
begin
Contador := 0;
if ((DateEditInicial.Date = 0) and (DateEditFinal.Date = 0)) and (EdtCasos.Text = '') then
begin
  ShowMessage('Pelo menos um parâmetro tem que ser informado.');
end else begin
          DMR.qConsultaAuditoria.Close;
          DMR.qConsultaAuditoria.SQL.Clear;
          DMR.qConsultaAuditoria.SQL.Add('select * from tb_auditoria a');
          DMR.qConsultaAuditoria.SQL.Add(' where ');

          if (DateEditInicial.Date > 0) and (DateEditFinal.Date > 0)
          then begin
                Contador := Contador + 1;
                DMR.qConsultaAuditoria.SQL.Add(' a.AUD_DATA >= :DT1 and a.AUD_DATA <= :DT2 ');
                DMR.qConsultaAuditoria.Parameters.ParamByName('DT1').Value := DateEditInicial.Date;
                DMR.qConsultaAuditoria.Parameters.ParamByName('DT2').Value := DateEditFinal.Date;
               end;


          if (EdtCasos.Text <> '')
          then begin
                if Contador > 0
                then begin
                      DMR.qConsultaAuditoria.SQL.Add(' and a.PRO_COD = :p1 ');
                      DMR.qConsultaAuditoria.Parameters.ParamByName('p1').Value := EdtCasos.Text;
                     end else begin
                               DMR.qConsultaAuditoria.SQL.Add(' a.PRO_COD = :p1 ');
                               DMR.qConsultaAuditoria.Parameters.ParamByName('p1').Value := EdtCasos.Text;
                              end;
               end;

          DMR.qConsultaAuditoria.Open;

          if DMR.qConsultaAuditoria.RecordCount > 0
          then begin

               end else begin
                         ShowMessage('Não foram encontrados dados para essa auditoria.');
                        end;

         end;
end;

procedure TfConsultaAuditoria.FormShow(Sender: TObject);
begin
 EdtCasos.SetFocus;
end;

procedure TfConsultaAuditoria.bbtLimparClick(Sender: TObject);
begin
EdtCasos.Clear;
DateEditInicial.Date := 0;
DateEditFinal.Date := 0;
DMR.qConsultaAuditoria.Close;
EdtCasos.SetFocus;
end;

end.

