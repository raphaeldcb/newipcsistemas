unit ufColetadoresRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, Buttons, ExtCtrls, StdCtrls, Mask,
  DBCtrls;

type
  TfColetadoresRelatorios = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure BNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fColetadoresRelatorios: TfColetadoresRelatorios;

implementation

uses ufDM;

{$R *.dfm}

procedure TfColetadoresRelatorios.BNovoClick(Sender: TObject);
var proximo:integer;
begin
 DM.qColetadoresRelatorios.Close;
 DM.qColetadoresRelatorios.Open;
 DM.qColetadoresRelatorios.Last;
 Proximo:=DM.qColetadoresRelatoriosORDEM.Value + 1;
 inherited;
 DM.qColetadoresRelatoriosORDEM.Value  := Proximo;
 DM.qColetadoresRelatoriosCODIGO.Value := DM.qLocalColetaLCO_COD.Value;
 DM.qColetadoresRelatoriosNOME.Value   := DM.qLocalColetaLCO_NOME.Value;
 DBEdit1.SetFocus;
end;

procedure TfColetadoresRelatorios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 DM.qColetadoresRelatorios.Close;
end;

procedure TfColetadoresRelatorios.FormShow(Sender: TObject);
begin
  inherited;
 DM.qColetadoresRelatorios.Open;
end;

end.
