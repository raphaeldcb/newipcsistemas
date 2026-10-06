unit ufColaborador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, Buttons, ExtCtrls, StdCtrls, Mask,
  DBCtrls;

type
  TfColaborador = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure BNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fColaborador: TfColaborador;

implementation

uses ufDM;

{$R *.dfm}

procedure TfColaborador.BNovoClick(Sender: TObject);
var proximo:integer;
begin
 DM.qColaborador.Close;
 DM.qColaborador.Open;
 DM.qColaborador.Last;
 Proximo:=DM.qColaboradorCLB_COD.Value + 1;
 inherited;
 DM.qColaboradorCLB_COD.Value  := Proximo;
 DBEdit2.SetFocus;

end;

procedure TfColaborador.FormShow(Sender: TObject);
begin
 DM.qColaborador.Open;
  inherited;
end;

end.
