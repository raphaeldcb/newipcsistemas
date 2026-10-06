unit ufConsultaLotes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB;

type
  TfConsultaLotes = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    BSair: TSpeedButton;
    qDadosProcessoLote: TADOQuery;
    DBGrid2: TDBGrid;
    Label3: TLabel;
    DS_ProcessoLote: TDataSource;
    qDadosProcessoLotePES_INICIAIS: TStringField;
    qDadosProcessoLoteSIT_SIGLA: TStringField;
    qDadosProcessoLoteMPEA_DATA: TDateField;
    sbExclusao: TSpeedButton;
    procedure ComboBox1Change(Sender: TObject);
    procedure BSairClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure sbExclusaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsultaLotes: TfConsultaLotes;

implementation

uses ufDMR, ufDM, fExclusaoLotes;

{$R *.dfm}

procedure TfConsultaLotes.ComboBox1Change(Sender: TObject);
begin
DMR.qConsultaLotes.Close;
DMR.qConsultaLotes.Parameters.ParamByName('Lote').Value := ComboBox1.Text;
DMR.qConsultaLotes.Open;

end;

procedure TfConsultaLotes.BSairClick(Sender: TObject);
begin
 Close;
end;

procedure TfConsultaLotes.DBGrid1CellClick(Column: TColumn);
begin
qDadosProcessoLote.Close;
qDadosProcessoLote.Parameters.ParamByName('Processo').Value := DMR.qConsultaLotesPRO_COD.Value;
qDadosProcessoLote.Open;
end;

procedure TfConsultaLotes.sbExclusaoClick(Sender: TObject);
begin
 Application.CreateForm(TfExcluiLotes, fExcluiLotes);
 fExcluiLotes.NumeroLote := ComboBox1.Text;
 fExcluiLotes.ShowModal;
 fExcluiLotes.Free;
 Close;
end;

end.
