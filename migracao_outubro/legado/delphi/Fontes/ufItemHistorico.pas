unit ufItemHistorico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, DBCtrls, StdCtrls, Buttons,
  ExtCtrls, Mask;

type
  TfItemHist = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBComboBox1: TDBComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BNovoClick(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BSairClick(Sender: TObject);
    procedure BCnsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fItemHist: TfItemHist;

implementation

uses ufDM, ufConsultaItemHistorico;

{$R *.dfm}

procedure TfItemHist.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
DM.qItem.Open;
end;

procedure TfItemHist.FormShow(Sender: TObject);
begin
  inherited;
DM.qItem.Open;
end;

procedure TfItemHist.BNovoClick(Sender: TObject);
var proximo:integer;
begin
  DM.qItem.Close;
  DM.qItem.Open;
  Proximo:=DM.qItemITE_COD.Value + 1;
  inherited;
  DM.qItemITE_COD.Value := Proximo;
  DBEdit2.SetFocus;
end;

procedure TfItemHist.BEditarClick(Sender: TObject);
begin
  inherited;
DBEdit1.Enabled := False;
DBEdit2.SetFocus;
end;

procedure TfItemHist.BSalvarClick(Sender: TObject);
begin
DBEdit1.Enabled := True;
  inherited;

end;

procedure TfItemHist.BCancelarClick(Sender: TObject);
begin
DBEdit1.Enabled := True;
  inherited;

end;

procedure TfItemHist.BSairClick(Sender: TObject);
begin
  DM.qItem.Close;
  DM.qItem.SQL.Clear;
  DM.qItem.SQL.Add('select * from tb_Item');
  DM.qItem.Open;
  inherited;

end;

procedure TfItemHist.BCnsultarClick(Sender: TObject);
begin
 Application.CreateForm(TfConsultaItemHistorico, fConsultaItemHistorico);
 fConsultaItemHistorico.ShowModal;
 fConsultaItemHistorico.Free;
  inherited;

end;

end.
