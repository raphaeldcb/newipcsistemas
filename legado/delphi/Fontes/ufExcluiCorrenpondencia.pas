unit ufExcluiCorrenpondencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, DB, ADODB;

type
  TfExcluirCorrespondencias = class(TForm)
    BExcluir: TSpeedButton;
    BSair: TSpeedButton;
    Label1: TLabel;
    qManutencaoCorrespondencia: TADOQuery;
    ComboBox1: TComboBox;
    procedure BExcluirClick(Sender: TObject);
    procedure BSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fExcluirCorrespondencias: TfExcluirCorrespondencias;

implementation

{$R *.dfm}

procedure TfExcluirCorrespondencias.BExcluirClick(Sender: TObject);
begin
  with qManutencaoCorrespondencia do
  begin
  Close;
  SQL.Clear;
  SQL.Add(' delete from tb_CORRESPONDENCIA c where c.CORR_USU = :Usuario ');
  Parameters.ParamByName('Usuario').Value := ComboBox1.Text;
  ExecSQL;
  end;
  ShowMessage('Dados atuais foram excluídos com sucesso.');

end;

procedure TfExcluirCorrespondencias.BSairClick(Sender: TObject);
begin
 Close;
end;

end.
