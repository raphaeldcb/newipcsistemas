unit ufRecebimentoLaboratorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, ADODB, DBCtrls, Sockets, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient;

type
  TfRecebimentoLaboratorio = class(TForm)
    Label1: TLabel;
    RxDBLookupComboCodProcesso: TEdit;
    sbReceberLab: TSpeedButton;
    sbFechar: TSpeedButton;
    TcpClient: TIdTCPClient;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupComboCodProcessoChange(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure sbReceberLabClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRecebimentoLaboratorio: TfRecebimentoLaboratorio;

implementation

uses ufDM, ufProcesso;

{$R *.dfm}

procedure TfRecebimentoLaboratorio.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
key:=#0;
Perform(WM_NEXTDLGCTL,0,0);
end;
end;

procedure TfRecebimentoLaboratorio.FormShow(Sender: TObject);
begin
 RxDBLookupComboCodProcesso.SetFocus;
end;

procedure TfRecebimentoLaboratorio.RxDBLookupComboCodProcessoChange(
  Sender: TObject);
begin
if (Length(RxDBLookupComboCodProcesso.Text) = 6)
then begin
      sbReceberLab.Click;
     end;
end;

procedure TfRecebimentoLaboratorio.sbFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfRecebimentoLaboratorio.sbReceberLabClick(Sender: TObject);
var proximo:integer;
    Ano, Mes, Dia : Word;
    AnoAtual : String;
begin
if fProcessos.qProcessoCPG.Locate('PRO_COD', StrToInt(RxDBLookupComboCodProcesso.Text), []) = True
then begin
      DecodeDate(Date, Ano, Mes, Dia);
      AnoAtual := IntToStr(Ano);

      DM.qMaxHistorico.Close;
      DM.qMaxHistorico.Open;
      Proximo:=DM.qMaxHistoricoMAX.Value + 1;
      DM.qHistorico.Append;
      DM.qHistoricoHIS_CONTR.Value := Proximo;
      DM.qHistoricoHIS_DATA.Value  := Date;
      DM.qHistoricoPRO_COD.Value   := StrToint(RxDBLookupComboCodProcesso.Text);
      DM.qHistoricoITE_COD.Value   := 61;
      DM.qHistoricoHIS_DOC.Value   := DM.qHostsHOS_USUA.Value;
      DM.qHistorico.Post;

      ShowMessage('Casos recebido com sucesso!');
      RxDBLookupComboCodProcesso.Clear;
      RxDBLookupComboCodProcesso.SetFocus;
     end else begin
               ShowMessage('Desculpe. Casos não encontrado com esse Código!!!!');
               RxDBLookupComboCodProcesso.Clear;
               RxDBLookupComboCodProcesso.SetFocus;
              end;




end;
end.
