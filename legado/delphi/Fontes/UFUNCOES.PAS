unit ufuncoes;

interface

 //function ChecaEstado(Dado: string) : boolean;
 function DataExtenso(Data:TDateTime): String;
 Function HoraValida(strh:string): Boolean;
 Function DataValida(StrData:String):Boolean;
 function GetBuildInfo1:string;

 implementation

uses
 Messages, Controls, Forms,
 Menus, DB,
 DelphiZXingQRCode, Classes, SysUtils, Vcl.StdCtrls, Vcl.ExtCtrls,
 Windows, Winapi.ShellAPI, Winapi.ShlObj, Vcl.Dialogs,
 Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.Graphics;


function DataExtenso(Data:TDateTime): String;
{Retorna uma data por extenso}
var
//  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda-feira';
  DiaDasemana [3]:= 'Terçafeira';
  DiaDasemana [4]:= 'Quarta-feira';
  DiaDasemana [5]:= 'Quinta-feira';
  DiaDasemana [6]:= 'Sexta-feira';
  DiaDasemana [7]:= 'Sábado';
{ Meses do ano }
  Meses [1] := 'Janeiro';
  Meses [2] := 'Fevereiro';
  Meses [3] := 'Março';
  Meses [4] := 'Abril';
  Meses [5] := 'Maio';
  Meses [6] := 'Junho';
  Meses [7] := 'Julho';
  Meses [8] := 'Agosto';
  Meses [9] := 'Setembro';
  Meses [10]:= 'Outubro';
  Meses [11]:= 'Novembro';
  Meses [12]:= 'Dezembro';
  DecodeDate (Data, Ano, Mes, Dia);
//  NoDia := DayOfWeek (Data);
//  Result := DiaDaSemana[NoDia] + ', ' + IntToStr(Dia) + ' de ' + Meses[Mes]+ ' de ' + IntToStr(Ano);
  Result := IntToStr(Dia) + ' de ' + Meses[Mes]+ ' de ' + IntToStr(Ano);
end;

Function HoraValida(strh:string): Boolean;
var
hh : Integer;
mm : Integer;
code : Integer;
begin
  Result := True;
  If (Length(Strh) = 0) or (Strh[1] = ' ') or (Strh[2] = ' ') or (Strh[4] = ' ') or (Strh[5] = ' ') then
  begin
    Result := False;
  end
  else
  begin
    Val(Copy(Strh, 1, 2), hh, Code);
    Val(Copy(Strh, 4, 2), mm, Code);
    If (hh >= 24) or (mm >= 60) then
    begin
      Result := False;
    end;
  end;
end;

Function DataValida(StrData:String):Boolean;
Var  Data: TDateTime;
Begin
 Try
  Data   := StrToDateTime(StrData);
  Result := True;
 Except
  Result := False;
 End;
End;


function GetBuildInfo1:string;
var
VerInfoSize: DWORD;
VerInfo: Pointer;
VerValueSize: DWORD;
VerValue: PVSFixedFileInfo;
Dummy: DWORD;
V1, V2, V3, V4: Word;
Prog : string;
begin
Prog := Application.Exename;
VerInfoSize := GetFileVersionInfoSize(PChar(prog), Dummy);
GetMem(VerInfo, VerInfoSize);
GetFileVersionInfo(PChar(prog), 0, VerInfoSize, VerInfo);
VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
with VerValue^ do
  begin
  V1 := dwFileVersionMS shr 16;
  V2 := dwFileVersionMS and $FFFF;
  V3 := dwFileVersionLS shr 16;
  V4 := dwFileVersionLS and $FFFF;
  end;
FreeMem(VerInfo, VerInfoSize);
result := Copy (IntToStr (100 + v1), 3, 2) + '.' +
  Copy (IntToStr (100 + v2), 2, 2) + '.' +
  Copy (IntToStr (100 + v3), 3, 2) + '.' +
  Copy (IntToStr (100 + v4), 2, 2);
end;

end.
