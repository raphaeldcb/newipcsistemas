unit ufColetadoresKits;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, Buttons, ExtCtrls, StdCtrls, Mask,
  DBCtrls;

type
  TfColetadoresKits = class(TfPadrao)
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
  fColetadoresKits: TfColetadoresKits;

implementation

uses ufDM;

{$R *.dfm}

procedure TfColetadoresKits.BNovoClick(Sender: TObject);
var proximo:integer;
begin
 DM.qColetadoresKits.Close;
 DM.qColetadoresKits.Open;
 DM.qColetadoresKits.Last;
 Proximo:=DM.qColetadoresKitsCOL_ORDEM.Value + 1;
 inherited;
 DM.qColetadoresKitsCOL_ORDEM.Value  := Proximo;
 DM.qColetadoresKitsCOL_COD.Value    := DM.qLocalColetaLCO_COD.Value;
 DM.qColetadoresKitsCOL_NOME.Value   := DM.qLocalColetaLCO_NOME.Value;
 DBEdit1.SetFocus;
end;

procedure TfColetadoresKits.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 DM.qColetadoresKits.Close;
end;

procedure TfColetadoresKits.FormShow(Sender: TObject);
begin
  inherited;
 DM.qColetadoresKits.Open;
end;

end.
