unit ufConsultaStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, ADODB, DBCtrls, Grids, DBGrids;

type
  TfConsultaStatus = class(TForm)
    DataSourceCodProcesso: TDataSource;
    QueryCodProcesso: TADOQuery;
    sbFechar: TSpeedButton;
    DBGrid1: TDBGrid;
    QueryCodProcessoCASO: TIntegerField;
    QueryCodProcessoCADASTRADO: TStringField;
    QueryCodProcessoCOLETADO: TStringField;
    QueryCodProcessoLABORATORIO: TStringField;
    QueryCodProcessoRESULTADO: TStringField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsultaStatus: TfConsultaStatus;

implementation

uses ufDM, ufProcesso;

{$R *.dfm}

procedure TfConsultaStatus.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
key:=#0;
Perform(WM_NEXTDLGCTL,0,0);
end;
end;

procedure TfConsultaStatus.sbFecharClick(Sender: TObject);
begin
Close;
end;

procedure TfConsultaStatus.FormShow(Sender: TObject);
begin
QueryCodProcesso.Close;
QueryCodProcesso.Parameters.ParamByName('Codigo').Value := fProcessos.qProcessoCPGPRO_COD.Value;
QueryCodProcesso.Open;
end;

end.
