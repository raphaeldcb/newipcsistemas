unit ufImpressoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, Buttons, ExtCtrls, StdCtrls,
  DBCtrls, Mask, JvExMask, JvToolEdit, JvDBControls;

type
  TfImpressoes = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBDateEdit1: TJvDBDateEdit;
    procedure BNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImpressoes: TfImpressoes;

implementation

uses ufDM;

{$R *.dfm}

procedure TfImpressoes.BNovoClick(Sender: TObject);
begin
  inherited;
  DM.qImpressoesIMP_DATA.Value := Date;
  DM.qImpressoesPRO_COD.Value  := DM.qHistoricoPRO_COD.Value;
  DM.qImpressoesITE_COD.Value  := DM.qHistoricoITE_COD.Value;
  DBComboBox1.SetFocus;
end;

procedure TfImpressoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 DM.qImpressoes.Close;
end;

procedure TfImpressoes.FormShow(Sender: TObject);
begin
  inherited;
 DM.qImpressoes.Open;
end;

end.
