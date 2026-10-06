unit ufJuiz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, Buttons, ExtCtrls, StdCtrls, Mask,
  DBCtrls;

type
  TfJuiz = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    procedure BNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fJuiz: TfJuiz;

implementation

uses ufDM;

{$R *.dfm}

procedure TfJuiz.BNovoClick(Sender: TObject);
var proximo:integer;
begin
  DM.qMaxJuiz.Close;
  DM.qMaxJuiz.Open;
  Proximo:=DM.qMaxJuizULTIMO.Value + 1;
  inherited;
  DM.qJuizJUI_COD.Value := Proximo;
  DBEdit2.SetFocus;
end;

end.
