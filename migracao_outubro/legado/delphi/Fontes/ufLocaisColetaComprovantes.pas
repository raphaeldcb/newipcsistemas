unit ufLocaisColetaComprovantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ShellAPI;

type
  TfLocaisColetaComprovante = class(TForm)
    Label28: TLabel;
    cb_Ano: TComboBox;
    Label30: TLabel;
    cb_Mes: TComboBox;
    sbVisualizar: TSpeedButton;
    BSair: TSpeedButton;
    procedure sbVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLocaisColetaComprovante: TfLocaisColetaComprovante;

implementation

uses ufDM;

{$R *.dfm}



{ É necessáro estar declarado ShellAPI, SysUtils e
  Windows na seção uses.
  Delphi XE 7 ou superior declare Winapi.ShellAPI, System.SysUtils e
  Winapi.Windows }

procedure OpenPDF(aFile : TFileName; TypeForm : Integer = SW_NORMAL);
var
  Pdir: PChar;
begin
  GetMem(pDir, 256);
  StrPCopy(pDir, aFile);
  ShellExecute(0, nil, Pchar(aFile), nil, Pdir, TypeForm);
  FreeMem(pdir, 256);
end;

procedure TfLocaisColetaComprovante.sbVisualizarClick(Sender: TObject);
var
   NumeroCredenciado, NomeArquivo : String;
begin

NumeroCredenciado := FormatFloat('000', DM.qLocalColetaLCO_COD.Value);

if cb_Mes.Text = 'JANEIRO'
then begin
      NomeArquivo := NumeroCredenciado + '01' + cb_Ano.Text;
    end;
if cb_Mes.Text = 'FEVEREIRO'
then begin
      NomeArquivo := NumeroCredenciado + '02' + cb_Ano.Text;
    end;
if cb_Mes.Text = 'MARÇO'
then begin
      NomeArquivo := NumeroCredenciado + '03' + cb_Ano.Text;
    end;
if cb_Mes.Text = 'ABRIL'
then begin
      NomeArquivo := NumeroCredenciado + '04' + cb_Ano.Text;
    end;
if cb_Mes.Text = 'MAIO'
then begin
      NomeArquivo := NumeroCredenciado + '05' + cb_Ano.Text;
    end;
if cb_Mes.Text = 'JUNHO'
then begin
      NomeArquivo := NumeroCredenciado + '06' + cb_Ano.Text;
    end;
if cb_Mes.Text = 'JULHO'
then begin
      NomeArquivo := NumeroCredenciado + '07' + cb_Ano.Text;
    end;
if cb_Mes.Text = 'AGOSTO'
then begin
      NomeArquivo := NumeroCredenciado + '08' + cb_Ano.Text;
    end;
if cb_Mes.Text = 'SETEMBRO'
then begin
      NomeArquivo := NumeroCredenciado + '09' + cb_Ano.Text;
    end;
if cb_Mes.Text = 'OUTUBRO'
then begin
      NomeArquivo := NumeroCredenciado + '10' + cb_Ano.Text;
    end;
if cb_Mes.Text = 'NOVEMBRO'
then begin
      NomeArquivo := NumeroCredenciado + '11' + cb_Ano.Text;
    end;
if cb_Mes.Text = 'DEZEMBRO'
then begin
      NomeArquivo := NumeroCredenciado + '12' + cb_Ano.Text;
    end;

  NomeArquivo := 'C:\SCPG\Documentos\' + NomeArquivo + '.pdf';

  if FileExists( NomeArquivo )
  then begin
        OpenPDF(NomeArquivo);
        OpenPDF(NomeArquivo, SW_SHOWMAXIMIZED);
       end else ShowMessage('Não existem comprovante para esse Mês/Ano!!!');
  inherited;
end;

end.
