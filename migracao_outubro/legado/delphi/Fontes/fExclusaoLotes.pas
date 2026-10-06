unit fExclusaoLotes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, ExtCtrls;

type
  TfExcluiLotes = class(TForm)
    EdtLote: TEdit;
    Label1: TLabel;
    Label6: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    Edit3: TEdit;
    BOk: TBitBtn;
    BSair: TBitBtn;
    qExcluiAlelos: TADOQuery;
    qControlaAuditoria: TADOQuery;
    Shape1: TShape;
    Shape2: TShape;
    procedure BOkClick(Sender: TObject);
    procedure BSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
     NumeroLote : String;
    { Public declarations }
  end;

var
  fExcluiLotes: TfExcluiLotes;

implementation

uses ufDM, ufProcesso, ufAcesso;

{$R *.dfm}

procedure TfExcluiLotes.BOkClick(Sender: TObject);
var Instrucao: String;
begin
   DM.qHosts.Close;
   DM.qHosts.Parameters.ParamByName('Usuario').value := Edit2.text;
   DM.qHosts.Parameters.ParamByName('Senha').value   := Edit3.text;
   DM.qHosts.Open;
   if (DM.qHosts.RecordCount > 0)
   then begin
         if MessageDlg('Deseja realmente excluir esse LOTE?',mtconfirmation,[mbyes,mbno],1) = mryes
         then begin
                with qExcluiAlelos do
                begin
                 Instrucao := 'delete from tb_mapa_extampli ma where ma.mpea_lote = ' + EdtLote.Text;
                 Close;
                 SQL.Clear;
                 SQL.Add(''+ Instrucao + '');
                 ExecSQL;
                end;
                with qControlaAuditoria do
                begin
                 Close;
                 SQL.Clear;
                 SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
                 Parameters.ParamByName('Processo').Value := '4444';
                 Parameters.ParamByName('Usuario').Value  := Edit2.Text;
                 Parameters.ParamByName('Data').Value     := Date;
                 Parameters.ParamByName('Hora').Value     := Time;
                 Parameters.ParamByName('Execucao').Value := 'Realizou a EXCLUSÂO do Lote ' + EdtLote.Text;
                 ExecSQL;
                end;
               Close;
               end;
        end
   else begin
           MessageDlg('Login/Senha não autorizado ou Máquina não habilitada para o executar essa tarefa. Entrar em contato com Administrador!', mtinformation,[mbok],0);
           Edit2.SetFocus;
        end;
end;

procedure TfExcluiLotes.BSairClick(Sender: TObject);
begin
 Close;
end;

procedure TfExcluiLotes.FormShow(Sender: TObject);
begin
 EdtLote.Text :=  NumeroLote;
 NumeroLote := '';
 Edit2.SetFocus;
end;

end.
