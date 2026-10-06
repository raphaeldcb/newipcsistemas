unit ufColetadorAdicional;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufPadrao, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask,
  JvExMask, JvToolEdit, JvDBControls;

type
  TfColetadorAdicional = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBLookupComboBoxColetador: TDBLookupComboBox;
    DBDateEditCOA: TJvDBDateEdit;
    Label2: TLabel;
    DBDateEditCOAREC: TJvDBDateEdit;
    procedure BNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fColetadorAdicional: TfColetadorAdicional;

implementation

{$R *.dfm}

uses ufDM, ufProcesso;

procedure TfColetadorAdicional.BNovoClick(Sender: TObject);
begin
  inherited;
  fProcessos.qColetadorAdicionalCOA_DATA.Value := Date;
  fProcessos.qColetadorAdicionalPRO_COD.Value  := fProcessos.qProcessoCPGPRO_COD.Value;
  DBDateEditCOA.SetFocus;
end;

procedure TfColetadorAdicional.FormShow(Sender: TObject);
begin
  inherited;
  fProcessos.qColetadorAdicional.Open;
  fProcessos.qSelColeta.Open;
end;

end.
