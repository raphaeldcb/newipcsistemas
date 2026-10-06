unit ufConsultaDadosparaCredito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, ADODB, Grids,
  DBGrids, StrUtils;

type
  TfCreditoHabilitacao = class(TForm)
    bbtFechar: TSpeedButton;
    DBGrid: TDBGrid;
    procedure bbtFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCreditoHabilitacao: TfCreditoHabilitacao;

implementation

uses ufDMR, ufRelFinanceiro, ufDM, ufProcesso, ufVinculaCreditos;

{$R *.dfm}

procedure TfCreditoHabilitacao.bbtFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfCreditoHabilitacao.DBGridDblClick(Sender: TObject);
begin
  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  (Sender as TDBGrid).DataSource.Dataset.Edit;

  (Sender as TDBGrid).DataSource.Dataset.FieldByName('JUI_CREDITO').AsString :=
    IfThen((Sender as TDBGrid).DataSource.Dataset.FieldByName('JUI_CREDITO').AsString = 'S','N','S');

  (Sender as TDBGrid).DataSource.Dataset.Post;
end;

procedure TfCreditoHabilitacao.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;

  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  // Desenha um checkbox no dbgrid
  if Column.FieldName = 'JUI_CREDITO' then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);

    if ((Sender as TDBGrid).DataSource.Dataset.FieldByName('JUI_CREDITO').AsString = 'S') then
      Check := DFCS_CHECKED
    else
      Check := 0;

    R := Rect;
    InflateRect(R, -2, -2); { Diminue o tamanho do CheckBox }
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON,
      DFCS_BUTTONCHECK or Check);
  end;

end;

procedure TfCreditoHabilitacao.FormShow(Sender: TObject);
begin
DM.qJuiz.Open;
end;

end.
