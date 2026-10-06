unit ufMedicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, DBCtrls, Buttons, ExtCtrls, StdCtrls, Mask, Grids,
  DBGrids;

type
  TfMedicos = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure sbNovoClick(Sender: TObject);
    procedure sbAlterarClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMedicos: TfMedicos;

implementation

uses ufDMI;

{$R *.dfm}

procedure TfMedicos.sbNovoClick(Sender: TObject);
begin
  inherited;
  DBEdit1.SetFocus;
end;

procedure TfMedicos.sbAlterarClick(Sender: TObject);
begin
  inherited;
  DBEdit2.SetFocus;
end;

procedure TfMedicos.sbSalvarClick(Sender: TObject);
begin
if DBEdit1.Text = '' then
begin
 ShowMessage('Código Não Preenchido!!');
 DBEdit1.SetFocus;
end else
if DBEdit2.Text = '' then
begin
 ShowMessage('Nome do Médico Não Preenchido!!');
 DBEdit2.SetFocus;
end else
  inherited;

end;

procedure TfMedicos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMI.qMedico.Open;
end;

procedure TfMedicos.FormShow(Sender: TObject);
begin
  inherited;
  DMI.qMedico.Open;
end;

procedure TfMedicos.BNovoClick(Sender: TObject);
var Proximo : Integer;
begin
  DMI.qMAX_Medico.Close;
  DMI.qMAX_Medico.Open;
  Proximo:=DMI.qMAX_MedicoMAX.Value + 1;
  inherited;
  DMI.qMedicoMED_COD.Value := Proximo;
  DBEdit1.SetFocus;
end;

end.
