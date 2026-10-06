unit ufGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufPadrao, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Db, Buttons, ExtCtrls;

type
  TfRestricao = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure sbAlterarClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure BNovoClick(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
    procedure BExcluirClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRestricao: TfRestricao;

implementation

uses ufDM;


{$R *.DFM}

procedure TfRestricao.sbAlterarClick(Sender: TObject);
begin
  inherited;
 DBEdit2.SetFocus;
end;

procedure TfRestricao.sbSalvarClick(Sender: TObject);
begin
if DBEdit1.Text = '' then
begin
 ShowMessage('Código Não Preenchido!!');
 DBEdit1.SetFocus;
end else
if DBEdit2.Text = '' then
begin
 ShowMessage('Descrição Não Preenchido!!');
 DBEdit2.SetFocus;
end else
  inherited;
end;

procedure TfRestricao.sbNovoClick(Sender: TObject);
begin
  inherited;
  DBEdit2.SetFocus;
end;

procedure TfRestricao.BNovoClick(Sender: TObject);
var Proximo : Integer;
begin
  DM.qRestricao.Last;
  Proximo:=DM.qRestricaoRES_COD.Value + 1;
  inherited;
  DM.qRestricaoRES_COD.Value := Proximo;
  DBEdit2.SetFocus;
end;

procedure TfRestricao.BEditarClick(Sender: TObject);
begin
  inherited;
  DBEdit2.SetFocus;
end;

procedure TfRestricao.BExcluirClick(Sender: TObject);
begin
   {if DM.ADOQ_Clientes.Active = False
    then DM.ADOQ_Clientes.Open;
     if ((DM.ADOQ_Clientes.Locate('Cod_Cidade',StrToInt(DBEdit1.text),[]) = True))
      then MessageDlg('Exclusão não permitida! Há pessoas vinculadas a esta cidade!',mtError, [mbOK],0)
      else} inherited;
end;

procedure TfRestricao.BSalvarClick(Sender: TObject);
begin
   if TRIM(DBEdit2.text) = ''
   then begin
           showmessage('Informe a Descrição!');
           DBEdit2.SetFocus;
        end
        else begin
              inherited;
             end;
end;

procedure TfRestricao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DM.qRestricao.Open;
end;

procedure TfRestricao.FormShow(Sender: TObject);
begin
  inherited;
  DM.qRestricao.Open;
end;

end.
