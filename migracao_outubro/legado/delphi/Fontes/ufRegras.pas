unit ufRegras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, StdCtrls, DBCtrls, Mask, DB, Grids, DBGrids,
  Buttons, ExtCtrls, JvExStdCtrls, JvCombobox, JvDBCombobox;

type
  TfRegras = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    JvDBComboBoxTipo: TJvDBComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BNovoClick(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRegras: TfRegras;

implementation

uses ufEstado, ufDM;

{$R *.dfm}

procedure TfRegras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
DM.qRegras.Open;
DM.qItem.Open;
end;

procedure TfRegras.FormShow(Sender: TObject);
begin
  inherited;
DM.qRegras.Open;
DM.qItem.Open;
end;

procedure TfRegras.BNovoClick(Sender: TObject);
var proximo:integer;
begin
  DM.qRegras.Close;
  DM.qRegras.Open;
  Proximo:=DM.qRegrasREG_COD.Value + 1;
  inherited;
  DM.qRegrasREG_COD.Value := Proximo;
  DBEdit2.SetFocus;
end;

procedure TfRegras.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  DM.qRegrasREG_CPNOM.Value := (DBEdit2.Text[1]) + (DBEdit2.Text[2]) + (DBEdit2.Text[3]);
end;

end.
