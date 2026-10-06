unit ufAjustaProcotolo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Buttons, StdCtrls;

type
  TfAjustaProtocolo = class(TForm)
    sbZerar: TSpeedButton;
    qAjusta: TADOQuery;
    BSair: TSpeedButton;
    LUsuario: TLabel;
    procedure sbZerarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAjustaProtocolo: TfAjustaProtocolo;

implementation

uses ufDMI, ufAcesso;

{$R *.dfm}

procedure TfAjustaProtocolo.sbZerarClick(Sender: TObject);
begin
if MessageDlg(' Confirma o processo de zera o Protocolo? ',mtconfirmation,[mbyes,mbno],0) = mryes
then begin
      with qAjusta do
      begin
       Close;
       SQL.Clear;
       SQL.Add(' update TB_SEQUENCIAL s set s.SEQUENCIAL = 0');
       ExecSQL;
      end;
      ShowMessage('Protocolo Zerado!');
    end;
end;

procedure TfAjustaProtocolo.FormShow(Sender: TObject);
begin
LUsuario.Caption := 'Usuário: ' + fAcesso.Edit1.Text;
end;

procedure TfAjustaProtocolo.BSairClick(Sender: TObject);
begin
 Close;
end;

end.
