unit ufConsultaPericia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, ADODB, DBCtrls;

type
  TfConsultaPericia = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSourceCodProcesso: TDataSource;
    QueryCodProcesso: TADOQuery;
    RxDBLookupComboCodProcesso: TEdit;
    QueryCodProcessoPRO_COD: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EditCodigoEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupComboCodProcessoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsultaPericia: TfConsultaPericia;

implementation

uses ufDM, ufProcesso;

{$R *.dfm}

procedure TfConsultaPericia.BitBtn1Click(Sender: TObject);
var Codigo : Integer;
    Letra  : String;
begin
Codigo := StrToInt(Copy(RxDBLookupComboCodProcesso.Text,1,5));
Letra  := Copy(RxDBLookupComboCodProcesso.Text,6,1);

if fProcessos.qProcessoCPG.Locate('PRO_COD', Codigo, []) = True
then begin
      Close;
      if (Letra = 'N')
      then begin
            Close;
           end;
      if (Letra = 'F')
      then begin
            fProcessos.bbtPagamento.Click;
           end;
      if (Letra = 'C')
      then begin
            fProcessos.tbHonorarios.Show;
           end;
     end else begin
               ShowMessage('Desculpe. Perícia não encontrada com esse Código!!!!');
               RxDBLookupComboCodProcesso.SetFocus;
              end;
end;

procedure TfConsultaPericia.BitBtn2Click(Sender: TObject);
begin
 Close;
end;

procedure TfConsultaPericia.EditCodigoEnter(Sender: TObject);
begin
if fProcessos.qProcessoCPG.Locate('PRO_COD', StrToInt(RxDBLookupComboCodProcesso.Text), []) = True
then begin
      Close;
     end else begin
               ShowMessage('Desculpe. Perícia não encontrada com esse Código!!!!');
               RxDBLookupComboCodProcesso.SetFocus;
              end;
end;

procedure TfConsultaPericia.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
key:=#0;
Perform(WM_NEXTDLGCTL,0,0);
end;
end;

procedure TfConsultaPericia.FormShow(Sender: TObject);
begin
 RxDBLookupComboCodProcesso.SetFocus;
end;

procedure TfConsultaPericia.RxDBLookupComboCodProcessoChange(
  Sender: TObject);
begin
if (Length(RxDBLookupComboCodProcesso.Text) = 6)
then begin
      BitBtn1.Click;
     end;
end;

end.
