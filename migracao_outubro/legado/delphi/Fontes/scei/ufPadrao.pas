unit ufPadrao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, Db, DBCtrls, DBTables, QuickRpt, Qrctrls;

type
  TfPadrao = class(TForm)
    p1: TPanel;
    p2: TPanel;
    DBN1: TDBNavigator;
    dsPadrao: TDataSource;
    sbExcluir: TSpeedButton;
    sbNovo: TSpeedButton;
    sbAlterar: TSpeedButton;
    sbSalvar: TSpeedButton;
    sbCancelar: TSpeedButton;
    sbFechar: TSpeedButton;
    procedure sbNovoClick(Sender: TObject);
    procedure sbAlterarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPadrao: TfPadrao;

implementation

{$R *.DFM}

procedure TfPadrao.sbNovoClick(Sender: TObject);
begin
  dsPadrao.Dataset.Append;
 {Desabilitar todos os outros botões}
 sbNovo.Enabled:=false;
 sbAlterar.enabled:=false;
 sbExcluir.enabled:=false;
 sbFechar.enabled:=false;

 DBN1.enabled:=false;

 {Habilitar o Salvar e Cancelar}
 sbSalvar.enabled:=true;
 sbCancelar.enabled:=true;
 p2.enabled:=true;

end;

procedure TfPadrao.sbAlterarClick(Sender: TObject);
begin

 if dsPadrao.dataset.recordcount <= 0 then
    begin
     ShowMessage('Não é possível Alteração');
    end
      else
         begin
          dsPadrao.dataset.Edit;
      {Desabilitar todos os outros botões}
           sbNovo.enabled:=false;
           sbAlterar.enabled:=false;
           sbExcluir.enabled:=false;
           sbFechar.enabled:=false;
           DBN1.enabled:=false;

           sbSalvar.enabled:=true;
           sbCancelar.enabled:=true;
           p2.enabled:=true;

          end;
end;

procedure TfPadrao.sbExcluirClick(Sender: TObject);
begin
 if Application.Messagebox('Deseja Mesmo Excluir?','Exclusão de Dados', mb_iconquestion + mb_yesno)= idyes then
 begin
 if dsPadrao.dataset.recordcount <= 0 then
    begin
    ShowMessage('Não possível a Exclusão');
    end
      else
         begin
           dsPadrao.dataset.delete;
           {Quando usar o TBDEDataset tem que usar uma unit(uses) chamada  DBTables }
         end;
end;
end;

procedure TfPadrao.sbSalvarClick(Sender: TObject);
begin

 dsPadrao.dataset.Post;
 {Habilitar todos os outros botões}
 sbNovo.Enabled:=true;
 sbAlterar.enabled:=true;
 sbExcluir.enabled:=true;
 sbFechar.enabled:=true;

 DBN1.enabled:=true;

 {Desabilitar o Salvar e Cancelar}
 sbSalvar.enabled:=false;
 sbCancelar.enabled:=false;
 p2.enabled:=false;

end;

procedure TfPadrao.sbCancelarClick(Sender: TObject);
begin

 dsPadrao.dataset.Cancel;

 {Habilitar todos os outros botões}
 sbNovo.Enabled:=true;
 sbAlterar.enabled:=true;
 sbExcluir.enabled:=true;
 sbFechar.enabled:=true;
 DBN1.enabled:=true;

 {Desabilitar o Salvar e Cancelar}
 sbSalvar.enabled:=false;
 sbCancelar.enabled:=false;
 p2.enabled:=false;
end;

procedure TfPadrao.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin

 if (key = #13) then
   begin
     key := #0;
     perform(WM_NEXTDLGCTL,0,0);

end;
end;
procedure TfPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2     :   sbNovo.Click;
    VK_F8     :   sbSalvar.Click;
    VK_F5     :   sbAlterar.Click;
    VK_F4     :   sbCancelar.Click;
    VK_ESCAPE :   sbFechar.Click;
  end;
end;


end.
