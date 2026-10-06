unit ufExames;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, DBCtrls, Buttons, ExtCtrls, StdCtrls, Mask, Grids,
  DBGrids;

type
  TfExames = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBMemo1: TDBMemo;
    Label6: TLabel;
    procedure sbNovoClick(Sender: TObject);
    procedure sbAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fExames: TfExames;

implementation

uses ufDM, ufDMI;

{$R *.dfm}

procedure TfExames.sbNovoClick(Sender: TObject);
begin
  inherited;
  DBEdit1.SetFocus;
end;

procedure TfExames.sbAlterarClick(Sender: TObject);
begin
  inherited;
  DBEdit2.SetFocus;
end;

procedure TfExames.FormShow(Sender: TObject);
begin
  inherited;
  DMI.qExames.Open;
end;

procedure TfExames.sbSalvarClick(Sender: TObject);
begin
if DBEdit1.Text = '' then
begin
 ShowMessage('Código do Laboratório Não Preenchido!!');
 DBEdit1.SetFocus;
end else
if DBEdit2.Text = '' then
begin
 ShowMessage('Descrição do Exame Não Preenchido!!');
 DBEdit2.SetFocus;
end else
if DBEdit3.Text = '' then
begin
 ShowMessage('Unidade do Exame Não Preenchido!!');
 DBEdit3.SetFocus;
end else
if DBEdit4.Text = '' then
begin
 ShowMessage('Sinonímia do Exame Não Preenchido!!');
 DBEdit4.SetFocus;
end else
if DBEdit5.Text = '' then
begin
 ShowMessage('Metodologia do Exame Não Preenchido!!');
 DBEdit5.SetFocus;
end else
if DBMemo1.Text = '' then
begin
 ShowMessage('Observação para o Laudo do Exame Não Preenchido!!');
 DBMemo1.SetFocus;
end else
if DBEdit10.Text = '' then
begin
 ShowMessage('Material para Coleta Não Preenchido!!');
 DBEdit10.SetFocus;
end else
     inherited;
end;

end.
