unit ufEstado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, DBCtrls, StdCtrls, Buttons,
  ExtCtrls, Mask;

type
  TfEstado = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEstado: TfEstado;

implementation

uses ufDM;

{$R *.dfm}

procedure TfEstado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
DM.qUF.Open;
end;

procedure TfEstado.FormShow(Sender: TObject);
begin
  inherited;
DM.qUF.Open;
end;

end.
