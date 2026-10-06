unit fUserValidaExtracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, ExtCtrls;

type
  TfValidaExtracao = class(TForm)
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
  private
    { Private declarations }
  public
     Origem, Retorno : String;
    { Public declarations }
  end;

var
  fValidaExtracao: TfValidaExtracao;

implementation

uses ufDM, ufProcesso, ufAcesso;

{$R *.dfm}

procedure TfValidaExtracao.BOkClick(Sender: TObject);
begin
   Retorno := '';
   DM.qHosts.Close;
   DM.qHosts.Parameters.ParamByName('Usuario').value := Edit2.text;
   DM.qHosts.Parameters.ParamByName('Senha').value   := Edit3.text;
   DM.qHosts.Open;
   if (DM.qHosts.RecordCount > 0)
   then begin
         Retorno := Edit2.Text;
         Close;
        end
   else begin
           MessageDlg('Login/Senha não autorizado!', mtinformation,[mbok],0);
           Edit2.SetFocus;
        end;
end;

procedure TfValidaExtracao.BSairClick(Sender: TObject);
begin
 Retorno := '';
 Close;
end;

end.
