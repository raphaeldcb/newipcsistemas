unit ufKits;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, Buttons, ExtCtrls, StdCtrls, DBCtrls, Mask, ADODB, Menus,
  JvExMask, JvToolEdit, JvDBControls;

type
  TfKits = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBDateEdit1: TJvDBDateEdit;
    DBDateEdit2: TJvDBDateEdit;
    qSomaBasico: TADOQuery;
    qSomaBasicoBASICO: TIntegerField;
    qSomaReconstrucao: TADOQuery;
    qSomaReconstrucaoRECONSTRUCAO: TIntegerField;
    pm_relatorio: TPopupMenu;
    QuantidadeMnimadeKits1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure QuantidadeMnimadeKits1Click(Sender: TObject);
    procedure BCnsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fKits: TfKits;

implementation

uses ufDM, ufDMR, ufRelMinimoKits;

{$R *.dfm}

procedure TfKits.FormShow(Sender: TObject);
begin
  inherited;
  DM.qColetador.Open;
end;

procedure TfKits.BSalvarClick(Sender: TObject);
begin
  DM.qKitsKIT_STATUS.Value := 'B';
  inherited;

  qSomaBasico.Close;
  qSomaBasico.Parameters.ParamByName('Codigo').Value := DBLookupComboBox1.KeyValue;
  qSomaBasico.Open;

  qSomaReconstrucao.Close;
  qSomaReconstrucao.Parameters.ParamByName('Codigo').Value := DBLookupComboBox1.KeyValue;
  qSomaReconstrucao.Open;

  ShowMessage('Pra o Coletador ' + DBLookupComboBox1.Text + ' a quantidade de Kits é : ' + #13 + #13 +
              'Kits Básicos (Trio) =  ' +  IntToStr(qSomaBasicoBASICO.Value) + #13 +
              'Kits Reconstrução =  ' +  IntToStr(qSomaReconstrucaoRECONSTRUCAO.Value));


end;

procedure TfKits.QuantidadeMnimadeKits1Click(Sender: TObject);
begin
dmr.qQuantMinimoKits.Close;
dmr.qQuantMinimoKits.Open;
Application.CreateForm(TfRelMinimoKits, fRelMinimoKits);
fRelMinimoKits.QuickRep2.Preview;
fRelMinimoKits.Free;

end;

procedure TfKits.BCnsultarClick(Sender: TObject);
begin
pm_relatorio.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);

end;

end.
