unit ufParametros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, DBCtrls, StdCtrls, Buttons,
  ExtCtrls, Mask;

type
  TfParametros = class(TfPadrao)
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
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    DBEdit12: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fParametros: TfParametros;

implementation

uses ufDM;

{$R *.dfm}

procedure TfParametros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qParametros.Close;
end;

procedure TfParametros.FormShow(Sender: TObject);
begin
  inherited;
DM.qParametros.Open;
end;

procedure TfParametros.BNovoClick(Sender: TObject);
var proximo:integer;
begin
  DM.qParametros.Close;
  DM.qParametros.Open;
  Proximo:=DM.qParametrosPAM_COD.Value + 1;
  inherited;
  DM.qParametrosPAM_COD.Value := Proximo;
  DBEdit2.SetFocus;

end;

end.
