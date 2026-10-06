unit ufLaboratorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, DBCtrls, Buttons, ExtCtrls, StdCtrls, Mask, ADODB,
  Grids, DBGrids;

type
  TfLaboratorios = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BNovoClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLaboratorios: TfLaboratorios;

implementation

uses ufDMI;

{$R *.dfm}

procedure TfLaboratorios.FormShow(Sender: TObject);
begin
  inherited;
  DMI.qLaboratorios.Open;
  dmI.qUF.Open;

end;

procedure TfLaboratorios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMI.qLaboratorios.Open;
end;

procedure TfLaboratorios.BNovoClick(Sender: TObject);
var Proximo : Integer;
begin
  DMI.qMax_Laboratorio.Close;
  DMI.qMax_Laboratorio.Open;
  Proximo:=DMI.qMax_LaboratorioMAX.Value + 1;
  inherited;
  DMI.qLaboratoriosLAB_COD.Value := Proximo;
  DBEdit2.SetFocus;

end;

procedure TfLaboratorios.BSalvarClick(Sender: TObject);
begin
if DBEdit1.Text = '' then
begin
 ShowMessage('Código do Laboratório Não Preenchido!!');
 DBEdit1.SetFocus;
end else
if DBEdit5.Text = '' then
begin
 ShowMessage('Nome do Laboratório Não Preenchido!!');
 DBEdit5.SetFocus;
end else
     inherited;

end;

procedure TfLaboratorios.BEditarClick(Sender: TObject);
begin
  inherited;
 DBEdit2.SetFocus;
end;

end.
