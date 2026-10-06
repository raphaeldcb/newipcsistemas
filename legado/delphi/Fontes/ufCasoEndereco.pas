unit ufCasoEndereco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, Buttons, ExtCtrls, StdCtrls,
  DBCtrls, Mask;

type
  TfCasoEndereco = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    procedure BNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCasoEndereco: TfCasoEndereco;

implementation

uses ufDM, ufProcesso;

{$R *.dfm}

procedure TfCasoEndereco.BNovoClick(Sender: TObject);
var proximo:integer;
begin
 DM.qMaxCasoEndereco.Close;
 DM.qMaxCasoEndereco.Open;
 Proximo:=DM.qMaxCasoEnderecoULTIMO.Value + 1;
 inherited;
 DM.qCasoEnderecoPRO_COD.Value  := fProcessos.qProcessoCPGPRO_COD.Value;
 DM.qCasoEnderecoCOR_COD.Value  := proximo;
 DBRadioGroup1.SetFocus;
end;

procedure TfCasoEndereco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DM.qCasoEndereco.Close;
end;

procedure TfCasoEndereco.FormShow(Sender: TObject);
begin
  inherited;
  DM.qCasoEndereco.Open;

end;

end.
