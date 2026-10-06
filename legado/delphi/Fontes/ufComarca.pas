unit ufComarca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, DBCtrls, StdCtrls, Buttons,
  ExtCtrls, Mask, JvExControls, JvDBLookup;

type
  TfComarca = class(TfPadrao)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    RxDBLookupComboTipoCaso: TJvDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BSairClick(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupComboTipoCasoExit(Sender: TObject);
    procedure BNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fComarca: TfComarca;

implementation

uses ufDM, ufConsultaComarca;

{$R *.dfm}

procedure TfComarca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
DM.qComarca.Open;
DM.qUF.Open;
end;

procedure TfComarca.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TfConsultaComarca, fConsultaComarca);
  fConsultaComarca.ShowModal;
  fConsultaComarca.Free;
  inherited;
end;

procedure TfComarca.BSairClick(Sender: TObject);
begin
  DM.qComarca.Close;
  DM.qComarca.SQL.Clear;
  DM.qComarca.SQL.Add('SELECT c.com_cod, c.com_desc, c.com_sigla, c.uf_sigla, e.uf_desc AS DESCRICAOESTADO FROM tb_COMARCA c JOIN tb_UF e ON c.uf_sigla = e.uf_sigla order by UF_SIGLA asc');
  DM.qComarca.Open;
  inherited;
end;

procedure TfComarca.DBEdit4Exit(Sender: TObject);
var Proximo : Integer;
begin
inherited;
DM.qMaxComarca.Close;
DM.qMaxComarca.Parameters.ParamByName('ESTADO').Value := DM.qComarcaUF_SIGLA.Value;
DM.qMaxComarca.Open;
Proximo := DM.qMaxComarcaMAX.Value + 1;
DM.qComarcaCOM_COD.Value := Proximo;
DBEdit3.SetFocus;
end;

procedure TfComarca.FormShow(Sender: TObject);
begin
  inherited;
DM.qComarca.Open;
DM.qUF.Open;
bbtUltimo.Click;
end;

procedure TfComarca.RxDBLookupComboTipoCasoExit(Sender: TObject);
var Proximo : Integer;
begin
inherited;
DM.qMaxComarca.Close;
DM.qMaxComarca.Parameters.ParamByName('ESTADO').Value := DM.qComarcaUF_SIGLA.Value;
DM.qMaxComarca.Open;
Proximo := DM.qMaxComarcaMAX.Value + 1;
DM.qComarcaCOM_COD.Value := Proximo;
DBEdit3.SetFocus;
end;

procedure TfComarca.BNovoClick(Sender: TObject);
begin
  inherited;
  DM.qComarcaUF_SIGLA.Value := 'MS';
  DBEdit4.SetFocus;
end;

end.
