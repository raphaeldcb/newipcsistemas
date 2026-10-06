unit UThreadPDFs;

interface 

uses 
  ComCtrls,
  Classes; 

type
 {
  TGSAPIrevision = packed record 
    product: PChar; 
    copyright: PChar; 
    revision: longint; 
    revisiondat: longint; 
  end; 

  PGSAPIrevision = ^TGSAPIrevision;
                                }
  Pgs_main_instance = Pointer; 
  PPChar = array of PChar; 

  TPDF = class(TThread)
  private 
    { Private declarations } 
    FoutPdf: ansistring; 
    Ffiles: array of ansistring;
    FProgresso: TProgressBar; 
  protected 
    procedure Execute; override; 
  public 
    procedure setFileOut(outPdf: string); 
    procedure setFilesIn(files: array of ansistring); 
    procedure setProgresso(Progresso: TProgressBar); 
  end; 

const 
  GS_ARG_ENCODING_LOCAL = 0; 
  GS_ARG_ENCODING_UTF8 = 1; 
  e_Quit = -990; 

procedure JuntaPdfs(FProgresso: TProgressBar; FoutPdf: ansistring; 
  Ffiles: array of ansistring); 

implementation 

{ funções e procedure da dll gsdll32.dll } 
function gsapi_new_instance(pinstance: Pgs_main_instance;
  caller_handle: Pointer): Integer; stdcall; external 'gsdll32.dll';
function gsapi_init_with_args(pinstance: Pgs_main_instance; argc: Integer; 
  argv: PPChar): Integer; stdcall; external 'gsdll32.dll'; 
function gsapi_exit(pinstance: Pgs_main_instance): Integer; stdcall;
  external 'gsdll32.dll'; 
procedure gsapi_delete_instance(pinstance: Pgs_main_instance); stdcall; 
  external 'gsdll32.dll'; 
function gsapi_set_arg_encoding(pinstance: Pgs_main_instance; ENCODING: Integer) 
  : Integer; stdcall; external 'gsdll32.dll'; 

{ TPDF } 

procedure TPDF.setFileOut(outPdf: string); 
begin 
  FoutPdf := outPdf; 
end; 

procedure TPDF.setFilesIn(files: array of ansistring); 
var 
  i: Integer; 
begin 
  setlength(Ffiles, length(files)); 
  for i := Low(Ffiles) to High(Ffiles) do 
    Ffiles[i] := files[i]; 
end; 

procedure TPDF.setProgresso(Progresso: TProgressBar); 
begin 
  FProgresso := Progresso; 
end; 

procedure TPDF.Execute; 
var 
  code, code1, gsargc, i: Integer; 
  gsargv: array of pansichar; 
//  minst: PGSAPIrevision;
begin 
  if (FoutPdf<>'') and (length(Ffiles) > 0) then 
  begin 
  setlength(gsargv, length(gsargv) + 1); 
  gsargv[high(gsargv)] := 'gs'; 
  setlength(gsargv, length(gsargv) + 1); 
  gsargv[high(gsargv)] := '-dBATCH'; 
  setlength(gsargv, length(gsargv) + 1); 
  gsargv[high(gsargv)] := '-dNOPAUSE'; 
  setlength(gsargv, length(gsargv) + 1); 
  gsargv[high(gsargv)] := '-q'; 
  setlength(gsargv, length(gsargv) + 1); 
  gsargv[high(gsargv)] := '-sDEVICE=pdfwrite'; 
  setlength(gsargv, length(gsargv) + 1); 
  gsargv[high(gsargv)] := pansichar('-sOutputFile=' + FoutPdf); 

    for i := Low(Ffiles) to High(Ffiles) do 
    begin 
      setlength(gsargv, length(gsargv) + 1); 
      gsargv[high(gsargv)] := pansichar(Ffiles[i]); 
    end; 
    gsargc := length(gsargv); 
//    code := gsapi_new_instance(@minst, nil);
    if (code < 0) then 
    begin 
      // result := 1; 
      Terminate; 
      exit; 
    end; 
//    code := gsapi_set_arg_encoding(minst, GS_ARG_ENCODING_UTF8);
    // if (code = 0) then 
    // code := gsapi_init_with_args(minst, gsargc, @gsargv[0]); 

    if (code = 0) then 
    begin 
      if FProgresso <> nil then 
        FProgresso.Max := gsargc; 
      for i := 1 to gsargc do 
      begin 
//        code := gsapi_init_with_args(minst, 1, @gsargv[i - 1]);
        if FProgresso <> nil then 
          FProgresso.Position := i; 
      end; 
    end; 

//    code1 := gsapi_exit(minst);
    if ((code = 0) or (code = e_Quit)) then 
      code := code1; 
//    gsapi_delete_instance(minst); 
    if ((code = 0) or (code = e_Quit)) then 
    begin 
      // result := 0; 
      Terminate; 
      exit; 
    end; 
  end; 
  // result := 1; 
end; 

procedure JuntaPdfs(FProgresso: TProgressBar; FoutPdf: ansistring; 
  Ffiles: array of ansistring); 
var 
  myTread: TPDF; 
begin 
    myTread := TPDF.Create(true); 
    myTread.FreeOnTerminate := true; 
    myTread.Priority := tpNormal; 
    myTread.setFileOut(FoutPdf); 
    myTread.setFilesIn(Ffiles); 
    myTread.setProgresso(FProgresso); 
    myTread.Resume; 
end; 

end.
