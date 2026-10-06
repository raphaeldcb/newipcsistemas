unit ufImportaDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, COMobj;

type
  TfImportaDados = class(TForm)
    BitBtn1: TBitBtn;
    qDados: TADOQuery;
    qDadosNOME: TStringField;
    qDadosDATA: TDateField;
    qDadosVALOR: TBCDField;
    qIndices: TADOQuery;
    qIndicesDATA: TDateField;
    qIndicesINDICE: TBCDField;
    qIndicesNOME: TStringField;
    qDadosCARGO: TStringField;
    qDados2: TADOQuery;
    qDados2NOME: TStringField;
    qDados2DATA: TDateField;
    qDados2VALOR: TBCDField;
    qDados2CARGO: TStringField;
    gbxImport: TGroupBox;
    lbOrigem: TLabel;
    btnOrigem: TSpeedButton;
    edtOrigem: TEdit;
    opndlgOrigem: TOpenDialog;
    sbFechar: TSpeedButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnOrigemClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImportaDados: TfImportaDados;

implementation

uses ufDM;

{$R *.dfm}

procedure TfImportaDados.BitBtn1Click(Sender: TObject);
var excel :variant;
    MesGerando : String;
    i, j, Linha, NumeroSheets  : Integer;
begin
try
excel := CreateOleObject('Excel.Application');
if not Excel.Application.Visible then
Excel.WorkBooks.Open(edtOrigem.Text);

NumeroSheets := 1;

Linha := 4;
DM.qKits.Open;
for i := 1 to 763 do
begin

DM.qKits.Append;
DM.qKitsKIT_TIP.Value  := 03;
DM.qKitsKIT_NUM.Value  := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1];
DM.qKitsCOL_COD.Value  := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2];
DM.qKitsKIT_DENV.Value := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4];
DM.qKitsKIT_DRET.Value := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6];
DM.qKitsKIT_CEXA.Value := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5];

DM.qKits.Post;
Linha:=Linha+1;
end;
showmessage('Importação Finalizada');
except
showmessage('Erro Linha : ' + IntToStr(Linha));
end;
end;

procedure TfImportaDados.btnOrigemClick(Sender: TObject);
begin
  if opndlgOrigem.Execute then
     edtOrigem.Text := opndlgOrigem.FileName;
end;

procedure TfImportaDados.sbFecharClick(Sender: TObject);
begin
Close;
end;

end.
