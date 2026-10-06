unit ufMergePDFs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ShellApi;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    ProgressBar1: TProgressBar;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ListarArquivos(Path: string; Lista: TStrings);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Diretorio1,Diretorio2 : String;

implementation

uses  ufProcesso, ufDM, UThreadPDFs;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var 
  s: array of ansistring;
  i: integer;
begin
  Diretorio1 := '';
  Diretorio1 := DM.qParametrosPAM_DRPDF.Value + '\' + IntToStr(fProcessos.qProcessoCPGPRO_COD.Value) + '\';

  setlength(s, Memo1.Lines.Count);
  for i := 0 to Memo1.Lines.Count - 1 do
    s[i] := Memo1.Lines.Strings[i];

  JuntaPdfs(ProgressBar1, Diretorio1, s);

end;

procedure TForm1.ListarArquivos(Path: string; Lista: TStrings);
var SR: TSearchRec;
begin
if FindFirst(Path + '*.PDF', faAnyFile, SR) = 0
then begin
      repeat
       if (SR.Attr <> 0) then
          Lista.Add(SR.Name);
       until FindNext(SR) = 0;
       FindClose(SR);
     end;
end;
procedure TForm1.BitBtn2Click(Sender: TObject);
var
  SR: TSearchRec;
  I: integer;
  s: array of ansistring;
  Arquivo1, Arquivo2, Arquivo3, Comando : String;

begin
  Diretorio1 := '';
  Diretorio2 := '';
  Diretorio1 := DM.qParametrosPAM_DRPDF.Value + '\' + IntToStr(fProcessos.qProcessoCPGPRO_COD.Value) + '\*.PDF';
  Diretorio2 := DM.qParametrosPAM_DRPDF.Value + '\' + IntToStr(fProcessos.qProcessoCPGPRO_COD.Value) + '\';
  Memo1.Lines.Clear;

  I := FindFirst(Diretorio1, faDirectory, SR);
  while I = 0 do
  begin
    Memo1.Lines.Add(Diretorio2 + sr.Name);
    I := FindNext(SR);
  end;

  Arquivo1 := DM.qParametrosPAM_DRPDF.Value + '\' + IntToStr(fProcessos.qProcessoCPGPRO_COD.Value) + '\TERMO_' + IntToStr(fProcessos.qProcessoCPGPRO_COD.Value) + '.PDF';
  Arquivo2 := DM.qParametrosPAM_DRPDF.Value + '\' + IntToStr(fProcessos.qProcessoCPGPRO_COD.Value) + '\LAUDO_' + IntToStr(fProcessos.qProcessoCPGPRO_COD.Value) + '.PDF';
  Arquivo3 := '';
  Comando  := 'gswin64 -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=' + Diretorio2 + 'final.pdf' + ' ' + Arquivo1 + ' ' + Arquivo2;

  WinExec(PAnsiChar('cmd.exe /c ' + Comando), sw_normal);

end;

end.
