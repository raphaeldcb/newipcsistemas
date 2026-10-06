unit ufConsultaItemHistorico;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ADODB;

type
  TfConsultaItemHistorico = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Cancelar: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
   CodComarca : string;
   Estado : string;
   CodVara : string;

  end;

var
  fConsultaItemHistorico: TfConsultaItemHistorico;

implementation

uses ufDM, ufVara, ufItemHistorico;

{$R *.DFM}

procedure TfConsultaItemHistorico.BitBtn1Click(Sender: TObject);
begin
  DM.qItem.Close;
  DM.qItem.SQL.Clear;
  DM.qItem.SQL.Add('select * from tb_ITEM');
  DM.qItem.SQL.Add(' WHERE ITE_COD LIKE :CODIGO');
  DM.qItem.Parameters.ParamByName('CODIGO').Value := StrToInt(Edit1.Text);
  DM.qItem.Open;
end;



procedure TfConsultaItemHistorico.CancelarClick(Sender: TObject);
begin
  Close;
end;


procedure TfConsultaItemHistorico.FormShow(Sender: TObject);
begin
   Edit1.Text := '';
   Edit1.SetFocus;
end;

procedure TfConsultaItemHistorico.BitBtn5Click(Sender: TObject);
begin
if DM.qItem.RecordCount > 0
then begin
      Close;
     end else begin
               ShowMessage('Desculpe. Item não encontrado!!!!');
              end;
end;

end.
