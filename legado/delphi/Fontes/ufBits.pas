unit ufBits;

interface
	uses Classes,SysUtils;

    function IsBitSet(const val: longint; const TheBit: byte): boolean;
    function BitOn(const val: longint; const TheBit: byte): LongInt;
    function BitOff(const val: longint; const TheBit: byte): LongInt;
    function BitToggle(const val: longint; const TheBit: byte): LongInt;

	function strPos(const aSubstr,S: String; aOfs: Integer): Integer;
	procedure strChange(var S:String; const Src, Dest: String);
	function strToken(var S: String; Seperator: Char): String;
	function strTokenCount(S: String; Seperator: Char): Integer;
	function strTokenAt(const S:String; Seperator: Char; At: Integer): String;
	procedure strTokenToStrings(S: String; Seperator: Char; List: TStrings);
	function strTokenFromStrings(Seperator: Char; List: TStrings): String;
	function strRPos(ch :Char; s:string) : string;
	function StrZero(s : string; Tam : byte) : string;
	function Proper( s : string ) : string;
	function strTrim(const S: String): String;
	function PosR(Ch : Char; s : string) : byte;

	function DtoN(DataStr : string) : string;

implementation

function IsBitSet(const val: longint; const TheBit: byte): boolean;
begin
  result := (val and (1 shl TheBit)) <> 0;
end;

function BitOn(const val: longint; const TheBit: byte): LongInt;
begin
	result := val or (1 shl TheBit);
end;

function BitOff(const val: longint; const TheBit: byte): LongInt;
begin
  result := val and ((1 shl TheBit) xor $FFFFFFFF);
end;

function BitToggle(const val: longint; const TheBit: byte): LongInt;
begin

  result := val xor (1 shl TheBit);
end;

function strPos(const aSubstr,S: String; aOfs: Integer): Integer;
begin
  Result:=Pos(aSubStr,Copy(S,aOfs,(Length(S)-aOfs)+1));
  if (Result>0) and (aOfs>1) then Inc(Result,aOfs-1);
end;

procedure strChange(var S:String; const Src, Dest: String);
var
  P : Integer;
begin
  P:=Pos(Src,S);
  while P<>0 do
  begin
    Delete(S,P,Length(Src));
    Insert(Dest,S,P);
    Inc(P,Length(Dest));
    P:=strPos(Src,S,P);
  end;
end;

function strToken(var S: String; Seperator: Char): String;
var
  I               : Word;
begin
  I:=Pos(Seperator,S);
  if I<>0 then
  begin
    Result:=System.Copy(S,1,I-1);
    System.Delete(S,1,I);
  end else
  begin
    Result:=S;
    S:='';
  end;
end;

function strTokenCount(S: String; Seperator: Char): Integer;
begin
  Result:=0;
  while S<>'' do begin            { 29.10.96 sb }
    StrToken(S,Seperator);
    Inc(Result);
  end;
end;

function strTokenAt(const S:String; Seperator: Char; At: Integer): String;
var
  j,i: Integer;
begin
  Result:='';
  j := 1;
  i := 0;
  while (i<=At ) and (j<=Length(S)) do
  begin
    if S[j]=Seperator then
       Inc(i)
    else if i = At then
       Result:=Result+S[j];
    Inc(j);
  end;
end;

procedure strTokenToStrings(S: String; Seperator: Char; List: TStrings);
var
  Token: String;
begin
{  List.Clear; }
  Token:=strToken(S,Seperator);
  while Token<>'' do
  begin
    List.Add(Token);
    Token:=strToken(S,Seperator);
  end;
end;

function strTokenFromStrings(Seperator: Char; List: TStrings): String;
var
  i: Integer;
begin
  Result:='';
  for i:=0 to List.Count-1 do
     if Result<>'' then
       Result:=Result+Seperator+List[i]
     else
       Result:=List[i];
end;

function  strRPos(ch :Char; s:string) : string;
var
	i : byte;
begin
	result := '';
	for i := length(s) downto 1 do
    	if s[i] = ch then
        begin
        	result := Copy(s,i,length(s));
            break;
        end
end;

function StrZero(s : string; Tam : byte) : string;
var
	i : byte;
    Valor : longint;
begin
    try
    	Valor := StrToInt(s);
    except
    	Valor := 0;
    end;
	s := Format('%*d',[Tam,Valor]);
    i := 1;
    while s[i] = ' ' do
    begin
    	s[i] := '0';
        inc(i);
    end;
    result := s;
end;

function Proper( s : string ) : string;
var
	Pal,Res : string;
begin
	Pal := StrToken(s,' ');
    Res := '';
    while Pal <> '' do
    begin
    	Pal := UpperCase(Pal);

		if (Pal='DE') or (Pal='DA') or (Pal='DAS') or (Pal='DO') or
           (Pal='DOS') or (Pal='E') then
    		Res := Res + ' ' + AnsiLowerCase(Pal[1])
        else
    		Res := Res + ' ' + AnsiUpperCase(Pal[1]);

        delete(pal,1,1);
    	Res := Res + AnsiLowerCase(Pal);
		Pal := StrToken(s,' ');
    end;
    delete(Res,1,1);
    result := Res;
end;

function strTrim(const S: String): String;
begin
  Result:=S;
  while (Length(Result)> 0) and (Result[Length(Result)]=' ') do
    Delete(Result,Length(Result),1);
end;


function PosR(Ch : Char; s : string) : byte;
var
	i : byte;
begin
	result := 0;
	for i := length(s) downto 1 do
    begin
    	if s[i] = ch then
        begin
        	result := i;
            break;
        end;
   end;
end;
function DtoN(DataStr : string) : string;
const
    Meses : array[1..12] of string[15] = ('janeiro', 'fevereiro', 'março',
					    'abril', 'maio', 'junho', 'julho', 'agosto',
                        'setembro','outubro','novembro','dezembro');
var
	Year, Month, Day : Word;
    Ano : string[5];
begin
    try
        DecodeDate(StrToDate(DataStr), Year, Month, Day);
        Ano := IntToStr(Year);
        Ano := Ano[1]+'.'+Copy(Ano,2,3);
        result := StrZero(InttoStr(Day),2)+' de '+Meses[Month]+' de '+Ano;
    except
    	result := '';
    end;
end;

end.
