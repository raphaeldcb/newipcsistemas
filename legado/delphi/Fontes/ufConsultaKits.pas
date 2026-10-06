unit ufConsultaKits;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, ADODB, DBCtrls, ExtCtrls;

type
  TfConsultaKits = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSourceCodProcesso: TDataSource;
    QueryCodProcesso: TADOQuery;
    RxDBLookupComboNumeroCartao: TEdit;
    QueryCodProcessoKIT_NUM: TIntegerField;
    RG_Grupo: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EditCodigoEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsultaKits: TfConsultaKits;

implementation

uses ufDM, ufProcesso, ufKits;

{$R *.dfm}

procedure TfConsultaKits.BitBtn1Click(Sender: TObject);
var Kit : String;
begin
Kit := '';
if (RG_Grupo.ItemIndex = 0)
then begin
      Kit := RxDBLookupComboNumeroCartao.Text;
     end else Kit := RxDBLookupComboNumeroCartao.Text;

Application.CreateForm(TfKits, fKits);
if DM.qKits.Locate('KIT_NUM', StrToInt(Trim(Kit)), []) = True
then begin
      fKits.ShowModal;
      fKits.Free;
     end else begin
               ShowMessage('Desculpe. Cartão não encontrado com esse Número!!!!');
               RxDBLookupComboNumeroCartao.SetFocus;
              end;
end;

procedure TfConsultaKits.BitBtn2Click(Sender: TObject);
begin
 Close;
end;

procedure TfConsultaKits.EditCodigoEnter(Sender: TObject);
begin
Application.CreateForm(TfKits, fKits);
if DM.qKits.Locate('KIT_NUM', StrToInt(RxDBLookupComboNumeroCartao.Text), []) = True
then begin
      fKits.ShowModal;
      fKits.Free;
     end else begin
               ShowMessage('Desculpe. Cartão não encontrado com esse Número!!!!');
               RxDBLookupComboNumeroCartao.SetFocus;
              end;
end;

procedure TfConsultaKits.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
key:=#0;
Perform(WM_NEXTDLGCTL,0,0);
end;
end;

procedure TfConsultaKits.FormShow(Sender: TObject);
begin
 DM.qKits.Open;
 RxDBLookupComboNumeroCartao.SetFocus;
end;

end.
