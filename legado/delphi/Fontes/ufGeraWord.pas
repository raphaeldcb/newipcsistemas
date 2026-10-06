unit ufGeraWord;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DB, Word2000, OleServer,
  Variants, Comobj, ADODB, WordXP, JvExMask, JvToolEdit, Word2010, Math;

type
  TfExpWord = class(TForm)
    SaveDialog1: TSaveDialog;
    RadioGroupOpc: TRadioGroup;
    LabelDir: TLabel;
    GroupBox1: TGroupBox;
    LabelDoc: TLabel;
    LabelItem: TLabel;
    sbEmitir: TSpeedButton;
    sbFechar: TSpeedButton;
    qBuscaDados: TADOQuery;
    qBuscaLaudo: TADOQuery;
    qBuscaDadosPessoas: TADOQuery;
    qBuscaLaudoHIS_CONTR: TIntegerField;
    qBuscaLaudoPRO_COD: TIntegerField;
    qBuscaLaudoITE_COD: TIntegerField;
    qBuscaLaudoHIS_DATA: TDateField;
    qBuscaLaudoHIS_OBS: TStringField;
    qBuscaDadosJUIZ: TStringField;
    qBuscaDadosVARA: TStringField;
    qBuscaDadosCOMARCA: TStringField;
    qBuscaDadosESTADO: TStringField;
    waWord: TWordApplication;
    wdDoc: TWordDocument;
    qBuscaDadosColetador: TADOQuery;
    qBuscaDadosColetadorLCO_COD: TIntegerField;
    qBuscaDadosColetadorLCO_NOME: TStringField;
    qBuscaDadosColetadorLCO_SEXO: TIntegerField;
    qBuscaDadosColetadorLCO_CRM: TStringField;
    qBuscaDadosColetadorLCO_LABT: TStringField;
    qBuscaDadosColetadorLCO_FONE: TStringField;
    qBuscaDadosColetadorLCO_END: TStringField;
    qBuscaDadosColetadorLCO_CID: TStringField;
    qBuscaDadosColetadorUF_SIGLA: TStringField;
    qBuscaDadosColetadorLCO_TLIE: TIntegerField;
    qBuscaDadosColetadorLCO_CATE: TIntegerField;
    qBuscaDadosColetadorLCO_TRAT: TIntegerField;
    RG_Destino: TRadioGroup;
    qBuscaDadosENDE_VARA: TStringField;
    qBuscaDadosBAIRRO_VARA: TStringField;
    qBuscaDadosCIDADE_VARA: TStringField;
    qBuscaDadosCEP_VARA: TStringField;
    qBuscaDadosColetadorLCO_CEL: TStringField;
    qBuscaDadosColetadorLCO_RES: TStringField;
    qBuscaDadosColetadorLCO_EMAIL: TStringField;
    qBuscaDadosColetadorLCO_SITE: TStringField;
    qBuscaDadosColetadorLCO_CEP: TStringField;
    qBuscaDadosColetadorLCO_DTRE: TDateField;
    qBuscaDadosColetadorLCO_DCAD: TDateField;
    qBuscaDadosColetadorLCO_NUMCARTCORREIO: TIntegerField;
    SpeedButton1: TSpeedButton;
    qDadosProcesso: TADOQuery;
    qBuscaDadosPessoasPRO_COD: TIntegerField;
    qBuscaDadosPessoasPES_COD: TIntegerField;
    qBuscaDadosPessoasPES_NOME: TStringField;
    qBuscaDadosPessoasPES_INICIAIS: TStringField;
    qBuscaDadosPessoasPES_SIT: TIntegerField;
    qBuscaDadosPessoasPES_DTNAS: TDateField;
    qBuscaDadosPessoasPES_LCNAS: TStringField;
    qBuscaDadosPessoasPES_SEXO: TStringField;
    qBuscaDadosPessoasPES_TDOC: TStringField;
    qBuscaDadosPessoasPES_NDOC: TStringField;
    qBuscaDadosPessoasPES_NOME_1: TStringField;
    qBuscaDadosPessoasSIT_NM: TStringField;
    qBuscaDadosPessoasPRO_DCOLE: TDateField;
    qBuscaDadosPessoasPRO_HCOLE: TStringField;
    qBuscaNumeroLaudo: TADOQuery;
    qBuscaNumeroLaudoHIS_CONTR: TIntegerField;
    qBuscaNumeroLaudoPRO_COD: TIntegerField;
    qBuscaNumeroLaudoITE_COD: TIntegerField;
    qBuscaNumeroLaudoHIS_DATA: TDateField;
    qBuscaNumeroLaudoHIS_DOC: TStringField;
    qBuscaNumeroLaudoHIS_OBS: TStringField;
    qBuscaCidade: TADOQuery;
    qBuscaCidadeJUIZ: TStringField;
    qBuscaCidadeVARA: TStringField;
    qBuscaCidadeCOMARCA: TStringField;
    qBuscaCidadeESTADO: TStringField;
    qBuscaCidadeENDE_VARA: TStringField;
    qBuscaCidadeBAIRRO_VARA: TStringField;
    qBuscaCidadeCIDADE_VARA: TStringField;
    qBuscaCidadeCEP_VARA: TStringField;
    qBuscaCidadeJUI_SEXO: TStringField;
    qDadosProcessoPRO_COD: TIntegerField;
    qDadosProcessoPRO_ANO: TIntegerField;
    qDadosProcessoPRO_NPERC: TStringField;
    qDadosProcessoPRO_TIPO: TIntegerField;
    qDadosProcessoPRO_AUTO: TStringField;
    qDadosProcessoUF_SIGLA: TStringField;
    qDadosProcessoCAS_CODIGO: TStringField;
    qDadosProcessoCOM_COD: TIntegerField;
    qDadosProcessoVAR_COD: TIntegerField;
    qDadosProcessoLCO_COD: TIntegerField;
    qDadosProcessoPRO_HCOLE: TStringField;
    qDadosProcessoPRO_DCOLE: TDateField;
    qDadosProcessoPRO_HREC: TStringField;
    qDadosProcessoPRO_DREC: TDateField;
    qDadosProcessoPRO_DRESU: TDateField;
    qDadosProcessoPRO_SIT: TIntegerField;
    qDadosProcessoPRO_NCOMP: TIntegerField;
    qDadosProcessoPRO_RESUL: TIntegerField;
    qDadosProcessoPRO_PROB: TStringField;
    qDadosProcessoPRO_ARETI: TStringField;
    qDadosProcessoJUI_COD: TIntegerField;
    qDadosProcessoFG_PROP: TStringField;
    qDadosProcessoPRO_USUCAD: TStringField;
    qDadosProcessoPRO_NUMLAUDO: TStringField;
    qDadosProcessoPRO_RASTREAR: TStringField;
    qDadosProcessoPRO_CARREGACREDITO: TStringField;
    qDadosProcessoPRO_CREDITODNA: TStringField;
    qDadosProcessoPRO_HTREC: TStringField;
    qDadosProcessoPRO_RESUL_XLSX: TStringField;
    qDadosProcessoPRO_LACRE: TStringField;
    EditArqDest: TJvDirectoryEdit;
    qBuscaLaudoHIS_DOC: TStringField;
    function FirstCharUpper(Source :String) :String;
    function ValidateString(Source :string; StrList: array of string) :Boolean;
    Function MesExtenso( Mes:Word ) : string;
    Function DataExtenso (dData : TDateTime) : string;
    Function DoisAnteriorDiaUtil (dData : TDateTime) : TDateTime;
    Function extenso (valor: real): string;
    Function GeraDadosPessoas: String;
    function InformacoesLaudos: String;
    function InformacoesJudicial: String;
    function InformacoesColetador: String;
    function ConverteMaiuscula(Texto : string): String;
    function NaoComparecimento : String;
    function GeraDadosExumacao : String;
    procedure SpeedItemSairClick(Sender: TObject);
    procedure RadioGroupOpcClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure sbEmitirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    NomeMuda : String;
  end;

var
  fExpWord: TfExpWord;
  f_false, f_true, f_NomeDoc, f_Troca, f_Var, f_NomeSalva :OleVariant;
  Ano, Mes, Dia : Word;
  DataDiaColeta, AnoA, MesA, DiaA, NovaDataResultadoF, AnoB, MesB, DiaB, AnoC, MesC, DiaC, NovaDataResultado, DataAtual, AnoR, MesR, DiaR, DataDiaRecepcao : String;

implementation

uses ufuncoes, ufProcesso, ufDM, ufDMR, ufDMI;

{$R *.DFM}

procedure TfExpWord.SpeedItemSairClick(Sender: TObject);
begin
	close;
end;

function TfExpWord.MesExtenso( Mes:Word ) : string; const meses : array[0..11] of PChar = ('janeiro', 'fevereiro', 'março', 'abril', 'maio', 'junho', 'julho', 'agosto', 'setembro','outubro', 'novembro', 'dezembro');
begin
result := meses[mes-1];
End;

Function TfExpWord.DataExtenso (dData : TDateTime) : string;
var
Ano, Mes, Dia : word;
Dias, Meses : String;


begin
DecodeDate(dData, Ano, Mes, Dia);
Meses := IntToStr(Mes);
Dias  := IntToStr(Dia);

if Dia = 1 then
 begin
  Dias := 'Primeiro';
 end;

DataExtenso := Dias + ' de ' {+ MesExtenso(Meses) }+ ' de ' + IntToStr(Ano);
end;

function TfExpWord.extenso (valor: real): string;
var
Centavos, Centena, Milhar, Milhao, Texto, msg: string;
const
Unidades: array[1..9] of string = ('Um', 'Dois', 'Três', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove');
Dez: array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
Dezenas: array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta', 'Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa');
Centenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');
function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: String): String;
begin
if Expressao
then Result:=CasoVerdadeiro
else Result:=CasoFalso;
end;

function MiniExtenso (trio: string): string;
var
Unidade, Dezena, Centena: string;
begin
Unidade:='';
Dezena:='';
Centena:='';
if (trio[2]='1') and (trio[3]<>'0') then
  begin
  Unidade:=Dez[strtoint(trio[3])];
  Dezena:='';
end
else
 begin
  if trio[2]<>'0' then Dezena:=Dezenas[strtoint(trio[2])];
  if trio[3]<>'0' then Unidade:=Unidades[strtoint(trio[3])];
 end;
if (trio[1]='1') and (Unidade='') and (Dezena='')
 then Centena:='cem'
else
 if trio[1]<>'0'
  then Centena:=Centenas[strtoint(trio[1])]
  else Centena:='';
 Result:= Centena + ifs((Centena<>'') and ((Dezena<>'') or (Unidade<>'')), ' e ', '')
  + Dezena + ifs((Dezena<>'') and (Unidade<>''),' e ', '') + Unidade;
end;
begin
if (valor>999999.99) or (valor<0) then
 begin
  msg:='O valor está fora do intervalo permitido.';
  msg:=msg+'O número deve ser maior ou igual a zero e menor que 999.999,99.';
  msg:=msg+' Se não for corrigido o número não será escrito por extenso.';
  showmessage(msg);
  Result:='';
  exit;
 end;
if valor=0 then
 begin
  Result:='';
  Exit;
 end;
Texto:=formatfloat('000000.00',valor);
Milhar:=MiniExtenso(Copy(Texto,1,3));
Centena:=MiniExtenso(Copy(Texto,4,3));
Centavos:=MiniExtenso('0'+Copy(Texto,8,2));
Result:=Milhar;
if Milhar<>'' then
  if copy(texto,4,3)='000' then
  Result:=Result+' Mil Reais'
  else
  Result:=Result+' Mil, ';
if (((copy(texto,4,2)='00') and (Milhar<>'')
  and (copy(texto,6,1)<>'0')) or (centavos=''))
  and (Centena<>'') then Result:=Result+'';
if (Milhar+Centena <>'') then Result:=Result+Centena;
if (Milhar='') and (copy(texto,4,3)='001') then
  Result:=Result+' Real'
 else
  if (copy(texto,4,3)<>'000') then Result:=Result+'';
if Centavos='' then
 begin
  Result:=Result+'';
  Exit;
 end
else
 begin
  if Milhar+Centena='' then
  Result:=Centavos
  else
  Result:=Result+', e '+Centavos;
if (copy(texto,8,2)='01') and (Centavos<>'') then
  Result:=Result+' Centavo.'
 else
  Result:=Result+' Centavos.';
end;
end;



procedure TfExpWord.RadioGroupOpcClick(Sender: TObject);
var Caminho, Guarda : String;
begin
Caminho := EditArqDest.Text;
Guarda  := EditArqDest.Text;
if RadioGroupOpc.ItemIndex = 0
then begin
      EditArqDest.Text := Guarda;
     end else EditArqDest.Text := '<<Impressoa>>';
end;

procedure TfExpWord.sbFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfExpWord.sbEmitirClick(Sender: TObject);
var s, PastaLocalizaModelo, f_NomePDF, Diretorio : String;
    Documento : Variant;
begin
if fProcessos.TipoItem = 'L'
then begin
      PastaLocalizaModelo := 'Laudos';
     end else begin
               if fProcessos.TipoItem = 'F'
               then begin
                     PastaLocalizaModelo := 'Folhas_Resultado';
                    end else begin
                              if fProcessos.TipoItem = 'A'
                              then begin
                                    PastaLocalizaModelo := 'Autorizacoes_Coleta';
                                   end else begin
                                             if fProcessos.TipoItem = 'R'
                                             then begin
                                                   PastaLocalizaModelo := 'Recibos';
                                                  end else begin
                                                            if fProcessos.TipoItem = 'E'
                                                            then begin
                                                                  PastaLocalizaModelo := 'Termos_Entrega';
                                                                 end else PastaLocalizaModelo := 'Oficios';
                                                           end;


                                            end;

                             end;

              end;

  f_NomeSalva := EditArqDest.text;

  if FileExists( f_NomeSalva ) then
  begin
    s := 'Documento '+f_NomeSalva+' já existe. Confirma a substituição ?'#0;
    if Application.MessageBox(@s[1],'Aviso',MB_YESNO) = IDYES then
      begin
       f_NomeDoc := DM.qParametrosPAM_DPADR.Value + PastaLocalizaModelo + '\' + LabelDoc.Caption;
       // Regra para pegar Modelo de Laudo Padrão
       if (PastaLocalizaModelo = 'Laudos')
       then begin
             if not FileExists( f_NomeDoc )
             then begin
                    f_NomeDoc        := DM.qParametrosPAM_DPADR.Value + PastaLocalizaModelo + '\' + 'LPADRAO.DOC';
                    LabelDoc.Caption :=  'LPADRAO.DOC';
                  end;
            end;
       //

       if FileExists( f_NomeDoc ) then
       begin
         try
          waWord.Connect;
          waWord.Visible := True;
          wdDoc.ConnectTo(waWord.Documents.Open2000(f_NomeDoc, EmptyParam, f_True,
          EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam));

          wdDoc.SaveAs(f_NomeSalva);

         if (fProcessos.qProcessoCPGPRO_TIPO.Value = 1) or (fProcessos.qProcessoCPGPRO_TIPO.Value = 3) or (fProcessos.qProcessoCPGPRO_TIPO.Value = 4) or (fProcessos.qProcessoCPGPRO_TIPO.Value = 6)  or (fProcessos.qProcessoCPGPRO_TIPO.Value = 7) or (fProcessos.qProcessoCPGPRO_TIPO.Value = 8) or (fProcessos.qProcessoCPGPRO_TIPO.Value = 10) or (fProcessos.qProcessoCPGPRO_TIPO.Value = 9)
         then begin
               InformacoesJudicial;
              end;

         if fProcessos.qProcessoCPGPRO_NCOMP.Value <> 0
         then begin
               NaoComparecimento;
             end;

         qBuscaLaudo.Close;
         qBuscaLaudo.Parameters.ParamByName('PROCESSO').Value  := fProcessos.qProcessoCPGPRO_COD.Value;
         qBuscaLaudo.Open;

         if (DM.qHistoricoITE_COD.Value = 17)
         then begin
                waWord.ActiveDocument.Sections.Item(1).Footers.Item(wdHeaderFooterPrimary).Range.InsertBefore(fProcessos.qProcessoCPGPRO_NPERC.Value);
              end else begin
                         if ((DM.qHistoricoITE_COD.Value = 6) or (DM.qHistoricoITE_COD.Value = 66))
                         then begin
                               InformacoesLaudos;
                              end else begin
                                        if (DM.qHistoricoITE_COD.Value = 26) or (DM.qHistoricoITE_COD.Value = 41) or (DM.qHistoricoITE_COD.Value = 31) or (DM.qHistoricoITE_COD.Value = 32) or (DM.qHistoricoITE_COD.Value = 44) or (DM.qHistoricoITE_COD.Value = 45) or (DM.qHistoricoITE_COD.Value = 46) or (DM.qHistoricoITE_COD.Value = 47) or (DM.qHistoricoITE_COD.Value = 48) or (DM.qHistoricoITE_COD.Value = 49) or (DM.qHistoricoITE_COD.Value = 50)
                                        then begin
                                             end else begin
                                                       if ((DM.qHistoricoITE_COD.Value = 5) or (DM.qHistoricoITE_COD.Value = 62))
                                                       then begin
                                                             waWord.ActiveDocument.Sections.Item(1).Footers.Item(wdHeaderFooterPrimary).Range.InsertBefore('OF. ' + DM.qHistoricoHIS_DOC.Value + '/IPC/DNA');
                                                            end else begin
                                                                      if (DM.qHistoricoITE_COD.Value = 3)
                                                                      then begin
                                                                            //waWord.ActiveDocument.Sections.Item(1).Footers.Item(wdHeaderFooterPrimary).Range.InsertAfter(fProcessos.qProcessoCPGPRO_NPERC.Value + ' - em duas laudas')
                                                                           end else //waWord.ActiveDocument.Sections.Item(1).Footers.Item(wdHeaderFooterPrimary).Range.InsertAfter(fProcessos.qProcessoCPGPRO_NPERC.Value);
                                                                     end;
                                                      end;


                                       end;
                       end;

        GeraDadosPessoas;
        InformacoesColetador;

        DecodeDate (fProcessos.qProcessoCPGPRO_DCOLE.Value, Ano, Mes, Dia);
        AnoA := IntToStr(Ano);
        MesA := MesExtenso(Mes);
        DiaA := IntToStr(Dia);
        if DiaA = '0'
        then begin
              DiaA:= '01';
             end;
        if Length(DiaA) = 1
        then begin
              DiaA := ('0' + DiaA);
             end;
        if (DiaA = IntToStr(01)) or (DiaA = IntToStr(-1))
        then begin
              DiaA := 'Primeiro';
             end;
        DataDiaColeta := DiaA +' de '+ MesA +' de '+ AnoA;

        f_Var   := '<DTCOLETA>';
        f_Troca := DataDiaColeta;
        while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
        f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
        f_Var := f_Var;

        DecodeDate (Date, Ano, Mes, Dia);
        AnoC := IntToStr(Ano);
        MesC := MesExtenso(Mes);
        DiaC := IntToStr(Dia);
        if DiaC = '0'
        then begin
              DiaC:= '01';
             end;
        if Length(DiaC) = 1
        then begin
              DiaC := ('0' + DiaC);
             end;
        if (DiaC = IntToStr(01)) or (DiaC = IntToStr(-1))
        then begin
        DiaC := 'Primeiro';
        end;
        DataAtual := DiaC +' de '+ MesC +' de '+ AnoC;

        f_Var   := '<DTATUAL>';
        f_Troca := DataAtual;
        while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
        f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
        f_Var := f_Var;

        f_Var   := '<DOCUMENTOHISTORICO>';
        f_Troca := dm.qHistoricoHIS_DOC.Value;
        while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
        f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
        f_Var := f_Var;


        f_Var   := '<HORA>';
        f_Troca := fProcessos.qProcessoCPGPRO_HCOLE.Value[1] + fProcessos.qProcessoCPGPRO_HCOLE.Value[2];
        while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
        f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
        f_Var := f_Var;

        f_Var   := '<MINUTO>';
        f_Troca := fProcessos.qProcessoCPGPRO_HCOLE.Value[4] + fProcessos.qProcessoCPGPRO_HCOLE.Value[5];
        while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
        f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
        f_Var := f_Var;

        DecodeDate (fProcessos.qProcessoCPGPRO_DREC.Value, Ano, Mes, Dia);
        AnoR := IntToStr(Ano);
        MesR := MesExtenso(Mes);
        DiaR := IntToStr(Dia);
        if DiaR = '0'
        then begin
              DiaR:= '01';
             end;
        if Length(DiaR) = 1
        then begin
              DiaR := ('0' + DiaR);
             end;
        if (DiaR = IntToStr(01)) or (DiaR = IntToStr(-1))
        then begin
        DiaR := 'Primeiro';
        end;
        DataDiaRecepcao := DiaR +' de '+ MesR +' de '+ AnoR;

        if not ((fProcessos.qProcessoCPGPRO_NCOMP.Value > 0) or (fProcessos.qProcessoCPGLCO_COD.Value = 36))
        then begin
              f_Var   := '<DTREC>';
              f_Troca := DataDiaRecepcao;
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;

              f_Var   := '<HORARECEPCAO>';
              f_Troca := fProcessos.qProcessoCPGPRO_HREC.Value[1] + fProcessos.qProcessoCPGPRO_HREC.Value[2];
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;


              f_Var   := '<MINUTORECEPCAO>';
              f_Troca := fProcessos.qProcessoCPGPRO_HREC.Value[4] + fProcessos.qProcessoCPGPRO_HREC.Value[5];
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;
            end;
        if not (fProcessos.qProcessoCPGPRO_NCOMP.Value > 0)
        then begin
              DecodeDate (DoisAnteriorDiaUtil(fProcessos.qProcessoCPGPRO_DRESU.Value), Ano, Mes, Dia);
              AnoA := IntToStr(Ano);
              MesA := IntToStr(Mes);
              DiaA := IntToStr(Dia-2);
              if DiaA = '0'
              then begin
                    DiaA:= '01';
                   end;
              if Length(DiaA) = 1
              then begin
                    DiaA := ('0' + DiaA);
                   end;
              if (DiaA = IntToStr(01)) or (DiaA = IntToStr(-1))
              then begin
              DiaA := '01';
              end;
              NovaDataResultadoF := (DiaA + '/' + MesA + '/'+ AnoA);

              f_Var   := '<DTRESULTF>';
              f_Troca := StrToDate(NovaDataResultadoF);
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;


              DecodeDate (DoisAnteriorDiaUtil(fProcessos.qProcessoCPGPRO_DRESU.Value), Ano, Mes, Dia);
              AnoB := IntToStr(Ano);
              MesB := MesExtenso(Mes);
              DiaB := IntToStr(Dia);
              if DiaB = '0'
              then begin
                    DiaB:= '01';
                   end;
              if Length(DiaB) = 1
              then begin
                    DiaB := ('0' + DiaB);
                   end;
              if (DiaB = IntToStr(01)) or (DiaB = IntToStr(-1))
              then begin
              DiaB := 'Primeiro';
              end;
              NovaDataResultado := DiaB +' de '+ MesB +' de '+ AnoB;

              f_Var   := '<DTRESULT>';
              f_Troca := NovaDataResultado;
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;
             end;


        f_Var   := '<CODIGO>';
        f_Troca :=  fProcessos.qProcessoCPGPRO_COD.Value ;
        while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
        f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
        f_Var := f_Var;

        f_Var   := '<PROCESSO>';
        f_Troca :=  fProcessos.qProcessoCPGPRO_NPERC.Value ;
        while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
        f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
        f_Var := f_Var;

        if (fProcessos.qProcessoCPGPRO_RESUL.Value = 1)
        then begin
              f_Var   := '<PROBABILIDADEPPC>';
              f_Troca := 'POSITIVO COM ' + fProcessos.qProcessoCPGPRO_PROB.Value + '%';
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;
             end else begin
                        f_Var   := '<PROBABILIDADEPPC>';
                        f_Troca := 'NEGATIVO COM 100% DE CERTEZA DE EXCLUSÃO';
                        while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                        f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                        f_Var := f_Var;
                      end;

        f_Var   := '<PROBABILIDADE>';
        f_Troca :=  fProcessos.qProcessoCPGPRO_PROB.Value;
        while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
        f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
        f_Var := f_Var;

        f_Var   := '<AUTORETIRAR>';
        f_Troca :=  fProcessos.qProcessoCPGPRO_ARETI.Value;
        while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
        f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
        f_Var := f_Var;

        wdDoc.Save;

       except
        Application.MessageBox('Erro ao tentar abrir o modelo de documento.!', 'Mensagem', mb_iconInformation);
        end;
        { //Retirado em 13/05/2026 ShowMessage('Nesse momento existe um DOCUMENTO gerado na barra de tarefas. ' + #13 + 'Trabalhe normalmente nele e quando terminar de editar o documento e imprimir.' +
         #13 + #13 + 'Pressione OK para encerrar o documento.' + #13 + #13 + 'Atenção: Não precisa fechar o Word. Pressionando OK ele fecha automaticamente!!!');
         f_false := False;

         waWord.Quit(f_False, f_False, f_False);
         waWord.Disconnect;

         }
       end;
       end else MessageDlg('Modelo na foi encontrado!', mtInformation, [mbOk], 0, mbOk);

  ///////////////////////////////
 end else begin
           f_NomeDoc := DM.qParametrosPAM_DPADR.Value + PastaLocalizaModelo + '\' + LabelDoc.Caption;
           // Regra para pegar Modelo de Laudo Padrão
           if (PastaLocalizaModelo = 'Laudos')
           then begin
                 if not FileExists( f_NomeDoc )
                 then begin
                        f_NomeDoc        := DM.qParametrosPAM_DPADR.Value + PastaLocalizaModelo + '\' + 'LPADRAO.DOC';
                        LabelDoc.Caption :=  'LPADRAO.DOC';
                      end;
                end;
           //

           if FileExists( f_NomeDoc ) then
           begin
               try
                waWord.Connect;
                waWord.Visible := True;
                wdDoc.ConnectTo(waWord.Documents.Open2000(f_NomeDoc, EmptyParam, f_True,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam));

                wdDoc.SaveAs(f_NomeSalva);

               if (fProcessos.qProcessoCPGPRO_TIPO.Value = 1) or (fProcessos.qProcessoCPGPRO_TIPO.Value = 3) or (fProcessos.qProcessoCPGPRO_TIPO.Value = 4) or (fProcessos.qProcessoCPGPRO_TIPO.Value = 6) or (fProcessos.qProcessoCPGPRO_TIPO.Value = 7)  or (fProcessos.qProcessoCPGPRO_TIPO.Value = 8) or (fProcessos.qProcessoCPGPRO_TIPO.Value = 10) or (fProcessos.qProcessoCPGPRO_TIPO.Value = 9)
               then begin
                     InformacoesJudicial;
                    end;

               if fProcessos.qProcessoCPGPRO_NCOMP.Value <> 0
               then begin
                     NaoComparecimento;
                    end;

               qBuscaLaudo.Close;
               qBuscaLaudo.Parameters.ParamByName('PROCESSO').Value  := fProcessos.qProcessoCPGPRO_COD.Value;
               qBuscaLaudo.Open;


               if (DM.qHistoricoITE_COD.Value = 17)
               then begin
                     waWord.ActiveDocument.Sections.Item(1).Footers.Item(wdHeaderFooterPrimary).Range.InsertBefore('OF. ' + DM.qHistoricoHIS_DOC.Value + '/IPC/DNA');
                      //waWord.ActiveDocument.Sections.Item(1).Footers.Item(wdHeaderFooterPrimary).Range.InsertBefore(fProcessos.qProcessoCPGPRO_NPERC.Value); Pedido do Bruno 02/08/20221
                    end else begin
                               if ((DM.qHistoricoITE_COD.Value = 6) or (DM.qHistoricoITE_COD.Value = 66))
                               then begin
                                     InformacoesLaudos;
                                    end else begin
                                              if (DM.qHistoricoITE_COD.Value = 26) or (DM.qHistoricoITE_COD.Value = 41) or (DM.qHistoricoITE_COD.Value = 31) or (DM.qHistoricoITE_COD.Value = 32) or (DM.qHistoricoITE_COD.Value = 44) or (DM.qHistoricoITE_COD.Value = 45) or (DM.qHistoricoITE_COD.Value = 46) or (DM.qHistoricoITE_COD.Value = 47) or (DM.qHistoricoITE_COD.Value = 48) or (DM.qHistoricoITE_COD.Value = 49) or (DM.qHistoricoITE_COD.Value = 50)
                                              then begin
                                                   end else begin
                                                             if (DM.qHistoricoITE_COD.Value = 5)
                                                             then begin
                                                                   waWord.ActiveDocument.Sections.Item(1).Footers.Item(wdHeaderFooterPrimary).Range.InsertBefore('OF. ' + DM.qHistoricoHIS_DOC.Value + '/IPC/DNA');
                                                                  end else begin
                                                                            if (DM.qHistoricoITE_COD.Value = 3)
                                                                            then begin
                                                                                  waWord.ActiveDocument.Sections.Item(1).Footers.Item(wdHeaderFooterPrimary).Range.InsertAfter(fProcessos.qProcessoCPGPRO_NPERC.Value + ' - em duas laudas')
                                                                                 end else waWord.ActiveDocument.Sections.Item(1).Footers.Item(wdHeaderFooterPrimary).Range.InsertAfter(fProcessos.qProcessoCPGPRO_NPERC.Value);
                                                                           end;
                                                            end;


                                             end;
                             end;


              DecodeDate (fProcessos.qProcessoCPGPRO_DCOLE.Value, Ano, Mes, Dia);
              AnoA := IntToStr(Ano);
              MesA := MesExtenso(Mes);
              DiaA := IntToStr(Dia);
              if DiaA = '0'
              then begin
                    DiaA:= '01';
                   end;
              if Length(DiaA) = 1
              then begin
                    DiaA := ('0' + DiaA);
                   end;
              if (DiaA = IntToStr(01)) or (DiaA = IntToStr(-1))
              then begin
                    DiaA := 'Primeiro';
                   end;
              DataDiaColeta := DiaA +' de '+ MesA +' de '+ AnoA;

              DecodeDate (Date, Ano, Mes, Dia);
              AnoC := IntToStr(Ano);
              MesC := MesExtenso(Mes);
              DiaC := IntToStr(Dia);
              if DiaC = '0'
              then begin
                    DiaC:= '01';
                   end;
              if Length(DiaC) = 1
              then begin
                    DiaC := ('0' + DiaC);
                   end;
              if (DiaC = IntToStr(01)) or (DiaC = IntToStr(-1))
              then begin
              DiaC := 'Primeiro';
              end;
              DataAtual := DiaC +' de '+ MesC +' de '+ AnoC;

              f_Var   := '<DTATUAL>';
              f_Troca := DataAtual;
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;

              f_Var   := '<DOCUMENTOHISTORICO>';
              f_Troca := dm.qHistoricoHIS_DOC.Value;
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;


              f_Var   := '<DTCOLETA>';
              f_Troca := DataDiaColeta;
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;

              f_Var   := '<HORA>';
              f_Troca := fProcessos.qProcessoCPGPRO_HCOLE.Value[1] + fProcessos.qProcessoCPGPRO_HCOLE.Value[2];
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;

              f_Var   := '<MINUTO>';
              f_Troca := fProcessos.qProcessoCPGPRO_HCOLE.Value[4] + fProcessos.qProcessoCPGPRO_HCOLE.Value[5];
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;

              DecodeDate (fProcessos.qProcessoCPGPRO_DREC.Value, Ano, Mes, Dia);
              AnoR := IntToStr(Ano);
              MesR := MesExtenso(Mes);
              DiaR := IntToStr(Dia);
              if DiaR = '0'
              then begin
                    DiaR:= '01';
                   end;
              if Length(DiaR) = 1
              then begin
                    DiaR := ('0' + DiaR);
                   end;
              if (DiaR = IntToStr(01)) or (DiaR = IntToStr(-1))
              then begin
              DiaR := 'Primeiro';
              end;
              DataDiaRecepcao := DiaR +' de '+ MesR +' de '+ AnoR;

              if not ((fProcessos.qProcessoCPGPRO_NCOMP.Value > 0) or (fProcessos.qProcessoCPGLCO_COD.Value = 36))
              then begin
                    f_Var   := '<DTREC>';
                    f_Troca := DataDiaRecepcao;
                    while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                    f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                    f_Var := f_Var;

                    f_Var   := '<HORARECEPCAO>';
                    f_Troca := fProcessos.qProcessoCPGPRO_HREC.Value[1] + fProcessos.qProcessoCPGPRO_HREC.Value[2];
                    while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                    f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                    f_Var := f_Var;


                    f_Var   := '<MINUTORECEPCAO>';
                    f_Troca := fProcessos.qProcessoCPGPRO_HREC.Value[4] + fProcessos.qProcessoCPGPRO_HREC.Value[5];
                    while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                    f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                    f_Var := f_Var;
                  end;
              if not (fProcessos.qProcessoCPGPRO_NCOMP.Value > 0)
              then begin
                    DecodeDate (DoisAnteriorDiaUtil(fProcessos.qProcessoCPGPRO_DRESU.Value), Ano, Mes, Dia);
                    AnoA := IntToStr(Ano);
                    MesA := IntToStr(Mes);
                    DiaA := IntToStr(Dia-2);
                    if DiaA = '0'
                    then begin
                          DiaA:= '01';
                         end;
                    if Length(DiaA) = 1
                    then begin
                          DiaA := ('0' + DiaA);
                         end;
                    if (DiaA = IntToStr(01)) or (DiaA = IntToStr(-1))
                    then begin
                          DiaA := '01';
                         end;
                    NovaDataResultadoF := (DiaA + '/' + MesA + '/'+ AnoA);

                    f_Var   := '<DTRESULTF>';
                    f_Troca := StrToDate(NovaDataResultadoF);
                    while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                    f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                    f_Var := f_Var;

                    DecodeDate (DoisAnteriorDiaUtil(fProcessos.qProcessoCPGPRO_DRESU.Value), Ano, Mes, Dia);
                    AnoB := IntToStr(Ano);
                    MesB := MesExtenso(Mes);
                    DiaB := IntToStr(Dia);
                    if DiaB = '0'
                    then begin
                          DiaB:= '01';
                         end;
                    if Length(DiaB) = 1
                    then begin
                          DiaB := ('0' + DiaB);
                         end;
                    if (DiaB = IntToStr(01)) or (DiaB = IntToStr(-1))
                    then begin
                          DiaB := 'Primeiro';
                         end;
                    NovaDataResultado := DiaB +' de '+ MesB +' de '+ AnoB;

                    f_Var   := '<DTRESULT>';
                    f_Troca := NovaDataResultado;
                    while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                    f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                    f_Var := f_Var;
                   end;

              f_Var   := '<CODIGO>';
              f_Troca :=  fProcessos.qProcessoCPGPRO_COD.Value ;
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;

              f_Var   := '<PROCESSO>';
              f_Troca :=  fProcessos.qProcessoCPGPRO_NPERC.Value ;
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;

              if (fProcessos.qProcessoCPGPRO_RESUL.Value = 1)
              then begin
                    f_Var   := '<PROBABILIDADEPPC>';
                    f_Troca := 'POSITIVO COM ' + fProcessos.qProcessoCPGPRO_PROB.Value + '%';
                    while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                    f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                    f_Var := f_Var;
                   end else begin
                              f_Var   := '<PROBABILIDADEPPC>';
                              f_Troca := 'NEGATIVO COM 100% DE CERTEZA DE EXCLUSÃO';
                              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                              f_Var := f_Var;
                            end;


              f_Var   := '<PROBABILIDADE>';
              f_Troca :=  fProcessos.qProcessoCPGPRO_PROB.Value;
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;

              f_Var   := '<AUTORETIRAR>';
              f_Troca :=  fProcessos.qProcessoCPGPRO_ARETI.Value;
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;

              GeraDadosPessoas;
              InformacoesColetador;

              wdDoc.Save;

              except
               Application.MessageBox('Erro ao tentar abrir o modelo de documento.!', 'Mensagem', mb_iconInformation);
              end;

              { //Retirado em 13/05/2026
              ShowMessage('Nesse momento existe um DOCUMENTO gerado na barra de tarefas. ' + #13 + 'Trabalhe normalmente nele e quando terminar de editar o documento e imprimir.' +
              #13 + #13 + 'Pressione OK para encerrar o documento.' + #13 + #13 + 'Atenção: Não precisa fechar o Word. Pressionando OK ele fecha automaticamente!!!');
              f_false := False;

              waWord.Quit(f_False, f_False, f_False);
              waWord.Disconnect;
              }

             end else MessageDlg('Modelo na foi encontrado!', mtInformation, [mbOk], 0, mbOk);
            end;
end;


Function TfExpWord.DoisAnteriorDiaUtil (dData : TDateTime) : TDateTime;
begin
if DayOfWeek(dData) = 7 then
dData := dData + 2
else
if DayOfWeek(dData) = 1 then
dData := dData + 1;
DoisAnteriorDiaUtil := dData;
end;

function TfExpWord.InformacoesJudicial;
begin
  f_Var   := '<AUTOS>';
  f_Troca := fProcessos.qProcessoCPGPRO_AUTO.Value;
  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
  f_Var := f_Var;

  qBuscaDados.Close;
  qBuscaDados.Parameters.ParamByName('ESTADO').Value  := fProcessos.qProcessoCPGUF_SIGLA.Value;
  qBuscaDados.Parameters.ParamByName('COMARCA').Value := fProcessos.qProcessoCPGCOM_COD.Value;
  qBuscaDados.Parameters.ParamByName('VARA').Value    := fProcessos.qProcessoCPGVAR_COD.Value;
  qBuscaDados.Open;

  f_Var   := '<ESTADO>';
  f_Troca := qBuscaDadosESTADO.Value;
  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
  f_Var := f_Var;

  f_Var   := '<VARAS>';
  f_Troca := ConverteMaiuscula(qBuscaDadosVARA.Value);
  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
  f_Var := f_Var;

  f_Var   := '<COMARCA>';
  f_Troca := qBuscaDadosCOMARCA.Value;
  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
  f_Var := f_Var;

  DM.qJuiz.Open;
  if DM.qJuiz.Locate('JUI_COD', fProcessos.qProcessoCPGJUI_COD.Value, []) = True
  then begin
        f_Var   := '<JUIZ>';
        f_Troca := dm.qJuizJUI_DESC.Value;
        while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
        f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
        f_Var := f_Var;

        if (DM.qJuizJUI_SEXO.Value = '1')
        then begin
              f_Var   := '<TRATAMENTOJUIZ>';
              f_Troca := 'do Excelentíssimo Senhor Juiz de Direito';
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;

              f_Var   := '<TRATAMENTODEFENSOR>';
              f_Troca := 'do';
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;

              f_Var   := '<TRATAMENTONOMEJUIZ>';
              f_Troca := 'Doutor';
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;

              f_Var   := '<TRATAMENTOTIPOJUIZ>';
              f_Troca := 'MM. Juiz';
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;

              f_Var   := '<TRATAMENTOJUIZINI>';
              f_Troca := 'Excelentíssimo Senhor';
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;

            end;

        if (DM.qJuizJUI_SEXO.Value = '2')
        then begin
              f_Var   := '<TRATAMENTOJUIZ>';
              f_Troca := 'da Excelentíssima Senhora Juíza de Direito';
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;

              f_Var   := '<TRATAMENTODEFENSOR>';
              f_Troca := 'da';
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;

              f_Var   := '<TRATAMENTONOMEJUIZ>';
              f_Troca := 'Doutora';
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;

              f_Var   := '<TRATAMENTOTIPOJUIZ>';
              f_Troca := 'MMª Juíza';
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;

              f_Var   := '<TRATAMENTOJUIZINI>';
              f_Troca := 'Excelentíssima Senhora';
              while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
              f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
              f_Var := f_Var;

            end;
        end;

end;

function TfExpWord.InformacoesColetador;
begin
  qBuscaDadosColetador.Close;
  qBuscaDadosColetador.Parameters.ParamByName('Codigo').Value  := fProcessos.qProcessoCPGLCO_COD.Value;
  qBuscaDadosColetador.Open;

//Dados de Endereço do Laudo

if (RG_Destino.ItemIndex = 1)
then begin

      qBuscaDados.Close;
      qBuscaDados.Parameters.ParamByName('ESTADO').Value  := fProcessos.qProcessoCPGUF_SIGLA.Value;
      qBuscaDados.Parameters.ParamByName('COMARCA').Value := fProcessos.qProcessoCPGCOM_COD.Value;
      qBuscaDados.Parameters.ParamByName('VARA').Value    := fProcessos.qProcessoCPGVAR_COD.Value;
      qBuscaDados.Open;

      f_Var   := '<DESTINO_CASO>';
      f_Troca := 'FÓRUM DE ' + qBuscaDadosCOMARCA.Value + ' ' + qBuscaDadosVARA.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      f_Var   := '<ENDERECO_CASO>';
      f_Troca := qBuscaDadosENDE_VARA.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      f_Var   := '<BAIRRO_CASO>';
      f_Troca := '– BAIRRO: ' + qBuscaDadosBAIRRO_VARA.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      f_Var   := '<CEP_CASO>';
      f_Troca := qBuscaDadosCEP_VARA.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      f_Var   := '<CIDADE_CASO>';
      f_Troca := qBuscaDadosCIDADE_VARA.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      f_Var   := '<UF_CASO>';
      f_Troca := qBuscaDadosESTADO.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end else begin
                if qBuscaDadosColetadorLCO_SEXO.Value = 1
                then begin
                      f_Var   := '<DESTINO_CASO>';
                      f_Troca := UpperCase('Coletador ' + qBuscaDadosColetadorLCO_NOME.Value);
                      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                      f_Var := f_Var;
                     end else begin
                               f_Var   := '<DESTINO_CASO>';
                               f_Troca := UpperCase('Coletadora ' + qBuscaDadosColetadorLCO_NOME.Value);
                               while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                               f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                               f_Var := f_Var;
                             end;

                f_Var   := '<ENDERECO_CASO>';
                f_Troca := qBuscaDadosColetadorLCO_END.Value;
                while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                f_Var := f_Var;

                f_Var   := '<BAIRRO_CASO>';
                f_Troca := '';
                while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                f_Var := f_Var;

                f_Var   := '<CEP_CASO>';
                f_Troca := qBuscaDadosColetadorLCO_CEP.Value;
                while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                f_Var := f_Var;

                f_Var   := '<CIDADE_CASO>';
                f_Troca := qBuscaDadosColetadorLCO_CID.Value;
                while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                f_Var := f_Var;

                f_Var   := '<UF_CASO>';
                f_Troca := qBuscaDadosColetadorUF_SIGLA.Value;
                while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                f_Var := f_Var;
              end;
//Dados de Endereço do Laudo

  if qBuscaDadosColetadorLCO_SEXO.Value = 1
  then begin
        f_Var   := '<SEXOCOLETADOR>';
        f_Troca := 'O COLETADOR é o';
        while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
        f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
        f_Var := f_Var;

        f_Var   := '<SEXOSIMPLESCOLETADOR>';
        f_Troca := 'o COLETADOR signatário';
        while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
        f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
        f_Var := f_Var;


        f_Var   := '<COLETADORPPC1>';
        f_Troca := 'COLETADOR';
        while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
        f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
        f_Var := f_Var;

        f_Var   := '<COLETADORPPC2>';
        f_Troca := 'indicado';
        while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
        f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
        f_Var := f_Var;

       end else begin
                 f_Var   := '<SEXOCOLETADOR>';
                 f_Troca := 'A COLETADORA é a';
                 while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                 f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                 f_Var := f_Var;

                 f_Var   := '<SEXOSIMPLESCOLETADOR>';
                 f_Troca := 'a COLETADORA signatária';
                 while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                 f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                 f_Var := f_Var;

                 f_Var   := '<COLETADORPPC1>';
                 f_Troca := 'COLETADORA';
                 while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                 f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                 f_Var := f_Var;

                 f_Var   := '<COLETADORPPC2>';
                 f_Troca := 'indicada';
                 while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                 f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                 f_Var := f_Var;
                end;

  f_Var   := '<COLETADOR>';
  f_Troca := qBuscaDadosColetadorLCO_NOME.Value;
  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
  f_Var := f_Var;

  f_Var   := '<ENDERECOCOLETADOR>';
  f_Troca := qBuscaDadosColetadorLCO_END.Value;
  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
  f_Var := f_Var;

  f_Var   := '<LOCALCOLETADOR>';
  f_Troca := FirstCharUpper(qBuscaDadosColetadorLCO_LABT.Value);
  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
  f_Var := f_Var;

  f_Var   := '<FONECOLETADOR>';
  f_Troca := qBuscaDadosColetadorLCO_FONE.Value;
  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
  f_Var := f_Var;

   f_Var   := '<CIDADECOLETADOR>';
  f_Troca := qBuscaDadosColetadorLCO_CID.Value;
  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
  f_Var := f_Var;

  f_Var   := '<UFCOLETADOR>';
  f_Troca := qBuscaDadosColetadorUF_SIGLA.Value;
  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
  f_Var := f_Var;
end;


function TfExpWord.InformacoesLaudos;
begin
  qBuscaLaudo.Last;

  f_Var   := '<DOCUMENTOHISTORICO>';
  f_Troca := qBuscaLaudoHIS_DOC.Value;
  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
  f_Var := f_Var;

end;



function TfExpWord.GeraDadosPessoas;
var AnoPes, MesPes, DiaPes, DataPes : String;
begin
//dados da mãe
qBuscaDadosPessoas.Close;
qBuscaDadosPessoas.Parameters.ParamByName('PROCESSO').Value  := fProcessos.qProcessoCPGPRO_COD.Value;
qBuscaDadosPessoas.Open;

if qBuscaDadosPessoas.Locate('PES_SIT', 1, []) = True
then begin
      f_Var   := '<MAE>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      f_Var   := '<INIMAE>';
      f_Troca := qBuscaDadosPessoasPES_INICIAIS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      f_Var   := '<LOCALNASCIMENTOMAE>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTOMAE>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTOMAE>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;

//dados da criança
if qBuscaDadosPessoas.Locate('PES_SIT', 2, []) = True
then begin
      f_Var   := '<CRIANCA>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      f_Var   := '<INICRIANCA>';
      f_Troca := qBuscaDadosPessoasPES_INICIAIS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      f_Var   := '<LOCALNASCIMENTOCRIANCA>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTOCRIANCA>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTOCRIANCA>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;

     if (qBuscaDadosPessoasPES_SEXO.Value = '1')
     then begin
            f_Var   := '<SEXOCRIANCA>';
            f_Troca := 'filho';
            while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
            f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
            f_Var := f_Var;

            f_Var   := '<SEXO>';
            f_Troca := 'Masc.';
            while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
            f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
            f_Var := f_Var;

          end;

     if (qBuscaDadosPessoasPES_SEXO.Value = '2')
     then begin
            f_Var   := '<SEXOCRIANCA>';
            f_Troca := 'filha';
            while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
            f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
            f_Var := f_Var;

            f_Var   := '<SEXO>';
            f_Troca := 'Femi.';
            while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
            f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
            f_Var := f_Var;

          end;

     if (qBuscaDadosPessoasPES_SEXO.Value = '3')
     then begin
            f_Var   := '<SEXOCRIANCA>';
            f_Troca := 'filho(a)';
            while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
            f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
            f_Var := f_Var;

            f_Var   := '<SEXO>';
            f_Troca := 'Ignor.';
            while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
            f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
            f_Var := f_Var;

          end;


//dados n1
if qBuscaDadosPessoas.Locate('PES_SIT', 3, []) = True
then begin
      f_Var   := '<N1>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<LOCALNASCIMENTON1>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTON1>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTON1>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;

//dados n2
if qBuscaDadosPessoas.Locate('PES_SIT', 4, []) = True
then begin
      f_Var   := '<N2>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<LOCALNASCIMENTON2>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTON2>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTON2>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;

//dados n3
if qBuscaDadosPessoas.Locate('PES_SIT', 5, []) = True
then begin
      f_Var   := '<N3>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<LOCALNASCIMENTON3>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTON3>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTON3>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;

//dados n4
 if qBuscaDadosPessoas.Locate('PES_SIT', 6, []) = True
then begin
      f_Var   := '<N4>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<LOCALNASCIMENTON4>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTON4>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTON4>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;


//dados do pai
if qBuscaDadosPessoas.Locate('PES_SIT', 0, []) = True
then begin
      f_Var   := '<SUPAI>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      f_Var   := '<INISUPAI>';
      f_Troca := qBuscaDadosPessoasPES_INICIAIS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      f_Var   := '<LOCALNASCIMENTOSUPAI>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTOSUPAI>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTOSUPAI>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;

//dados do pai
if qBuscaDadosPessoas.Locate('PES_SIT', 27, []) = True
then begin
      f_Var   := '<SUPAI2>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      f_Var   := '<INISUPAI2>';
      f_Troca := qBuscaDadosPessoasPES_INICIAIS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      f_Var   := '<LOCALNASCIMENTOSUPAI2>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTOSUPAI2>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTOSUPAI2>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;


//dados agf
if qBuscaDadosPessoas.Locate('PES_SIT', 15, []) = True
then begin
      f_Var   := '<AGF>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<LOCALNASCIMENTOAGF>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTOAGF>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTOAGF>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;
     
     
//dados agm
if qBuscaDadosPessoas.Locate('PES_SIT', 16, []) = True
then begin
      f_Var   := '<AGM>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<LOCALNASCIMENTOAGM>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTOAGM>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTOAGM>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;

//dados mãe 2
if qBuscaDadosPessoas.Locate('PES_SIT', 17, []) = True
then begin
      f_Var   := '<MAE2>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<LOCALNASCIMENTOMAE2>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTOMAE2>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTOMAE2>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;

//dados criança 2
if qBuscaDadosPessoas.Locate('PES_SIT', 18, []) = True
then begin
      f_Var   := '<CRIANCA2>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<LOCALNASCIMENTOCRIANCA2>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTOCRIANCA2>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTOCRIANCA2>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;

//dados criança 3
if qBuscaDadosPessoas.Locate('PES_SIT', 19, []) = True
then begin
      f_Var   := '<CRIANCA3>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<LOCALNASCIMENTOCRIANCA3>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTOCRIANCA3>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTOCRIANCA3>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;

//dados criança 4
if qBuscaDadosPessoas.Locate('PES_SIT', 20, []) = True
then begin
      f_Var   := '<CRIANCA4>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<LOCALNASCIMENTOCRIANCA4>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTOCRIANCA4>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTOCRIANCA4>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;


//dados suposto tio 1
if qBuscaDadosPessoas.Locate('PES_SIT', 21, []) = True
then begin
      f_Var   := '<SUPTIO1>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<LOCALNASCIMENTOSUPTIO1>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTOSUPTIO1>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTOSUPTIO1>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;



//dados suposto tio 2
if qBuscaDadosPessoas.Locate('PES_SIT', 22, []) = True
then begin
      f_Var   := '<SUPTIO2>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<LOCALNASCIMENTOSUPTIO2>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTOSUPTIO2>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTOSUPTIO2>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;

//dados suposto tio 3
if qBuscaDadosPessoas.Locate('PES_SIT', 23, []) = True
then begin
      f_Var   := '<SUPTIO3>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<LOCALNASCIMENTOSUPTIO3>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTOSUPTIO3>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTOSUPTIO3>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;

//dados suposto meio irmão 1
if qBuscaDadosPessoas.Locate('PES_SIT', 24, []) = True
then begin
      f_Var   := '<SUPMEIOI1>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<LOCALNASCIMENTOSUPMEIOI1>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTOSUPMEIOI1>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTOSUPMEIOI1>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;
     


//dados suposto meio irmão 2
if qBuscaDadosPessoas.Locate('PES_SIT', 25, []) = True
then begin
      f_Var   := '<SUPMEIOI2>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<LOCALNASCIMENTOSUPMEIOI2>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTOSUPMEIOI2>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTOSUPMEIOI2>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;
     
 
 //dados suposto meio irmão 3
 if qBuscaDadosPessoas.Locate('PES_SIT', 26, []) = True
 then begin
       f_Var   := '<SUPMEIOI3>';
       f_Troca := qBuscaDadosPessoasPES_NOME.Value;
       while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
       f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
       f_Var := f_Var;
 
 
       f_Var   := '<LOCALNASCIMENTOSUPMEIOI3>';
       f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
       while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
       f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
       f_Var := f_Var;
 
       //
         DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
         AnoPes := IntToStr(Ano);
         MesPes := MesExtenso(Mes);
         DiaPes := IntToStr(Dia);
         if DiaPes = IntToStr(1)
         then begin
         DiaPes := 'Primeiro';
         end;
         DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
       //
 
       f_Var   := '<DATANASCIMENTOSUPMEIOI3>';
       f_Troca := DataPes;
       while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
       f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
       f_Var := f_Var;
 
 
       f_Var   := '<DOCUMENTOSUPMEIOI3>';
       f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
       while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
       f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
       f_Var := f_Var;
     end;



     if fProcessos.qProcessoCPGCAS_CODIGO.Value = 'ES0999'
     then begin
           GeraDadosExumacao;
          end;
end;

function TfExpWord.GeraDadosExumacao;
var AnoPes, MesPes, DiaPes, DataPes : String;
begin
if qBuscaDadosPessoas.Locate('PES_SIT', 10, []) = True
then begin
      f_Var   := '<EXUMADO>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<LOCALNASCIMENTOEXUMADO>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTOEXUMADO>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTOEXUMADO>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;

if qBuscaDadosPessoas.Locate('PES_SIT', 11, []) = True
then begin
      f_Var   := '<FILHO1>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<LOCALNASCIMENTOFILHO1>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTOFILHO1>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTOFILHO1>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;

if qBuscaDadosPessoas.Locate('PES_SIT', 12, []) = True
then begin
      f_Var   := '<FILHO2>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<LOCALNASCIMENTOFILHO2>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTOFILHO2>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTOFILHO2>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;

if qBuscaDadosPessoas.Locate('PES_SIT', 13, []) = True
then begin
      f_Var   := '<FILHO3>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<LOCALNASCIMENTOFILHO3>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTOFILHO3>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTOFILHO3>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;

if qBuscaDadosPessoas.Locate('PES_SIT', 14, []) = True
then begin
      f_Var   := '<FILHO4>';
      f_Troca := qBuscaDadosPessoasPES_NOME.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<LOCALNASCIMENTOFILHO4>';
      f_Troca := qBuscaDadosPessoasPES_LCNAS.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      //
        DecodeDate (qBuscaDadosPessoasPES_DTNAS.Value, Ano, Mes, Dia);
        AnoPes := IntToStr(Ano);
        MesPes := MesExtenso(Mes);
        DiaPes := IntToStr(Dia);
        if DiaPes = IntToStr(1)
        then begin
        DiaPes := 'Primeiro';
        end;
        DataPes := DiaPes +' de '+ MesPes +' de '+ AnoPes;
      //

      f_Var   := '<DATANASCIMENTOFILHO4>';
      f_Troca := DataPes;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;


      f_Var   := '<DOCUMENTOFILHO4>';
      f_Troca := qBuscaDadosPessoasPES_TDOC.Value + ':' + qBuscaDadosPessoasPES_NDOC.Value;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;
     end;
end;



procedure TfExpWord.FormShow(Sender: TObject);
begin
DM.qParametros.Open;
if fProcessos.GeraDocumento = 'Sim'
then begin
      sbEmitir.Click;
     end;
end;

Function TfExpWord.ConverteMaiuscula(Texto : string): String;
var Contador     : Integer;
    Linha : String;
begin
Result := '';
Texto := Trim(Texto);
 repeat
     Contador := Pos(' ', Texto);
     if (Contador <= 0) then
       Contador := Length(Texto) + 1;
       Linha := UpperCase(Copy(Texto, 1, Contador-1));
     if (Length(Linha) <= 2) or (Linha = 'do') or (Linha = 'da') or (Linha = 'de') or (Linha = 'dos') or (Linha = 'e') or (Linha = 'das') or (Linha = 'na') or (Linha = 'no') or (Linha = 'nas') or (Linha = 'nos') then
     begin
       Result := Result + Lowercase(Copy(Texto, 1, Contador-1))
     end else begin
               if (Linha = 'JUSTIÇA') then
               begin
                Result := Result + Copy('Justiça', 1, Contador-1)
               end else begin
                         if (Linha = 'CÍVEL') then
                         begin
                          Result := Result + Copy('Cível', 1, Contador-1)
                         end else begin
                                   if (Linha = 'DÉCIMA') then
                                   begin
                                    Result := Result + Copy('Décima', 1, Contador-1)
                                   end else begin
                                             if (Linha = 'PÚBLICO') then
                                             begin
                                              Result := Result + Copy('Público', 1, Contador-1)
                                             end else begin
                                                       if (Linha = 'DIREÇÃO') then
                                                       begin
                                                        Result := Result + Copy('Direção', 1, Contador-1)
                                                       end else begin
                                                                 if (Linha = 'FAMÍLIA') then
                                                                 begin
                                                                  Result := Result + Copy('Família', 1, Contador-1)
                                                                 end else begin
                                                                           if (Linha = 'SÉTIMA') then
                                                                           begin
                                                                            Result := Result + Copy('Sétima', 1, Contador-1)
                                                                           end else begin
                                                                                     if (Linha = 'DE') then
                                                                                     begin
                                                                                      Result := Result + Copy('de', 1, Contador-1)
                                                                                     end else begin
                                                                                               if (Linha = 'NÚCLEO') then
                                                                                               begin
                                                                                                 Result := Result + Copy('Núcleo', 1, Contador-1)
                                                                                               end else begin
                                                                                                          if (Linha = 'CONCILIAÇÃO') then
                                                                                                          begin
                                                                                                            Result := Result + Copy('Conciliação', 1, Contador-1)
                                                                                                          end else begin
                                                                                                                    Result := Result + UpperCase(Texto[1]) + Lowercase(Copy(Texto, 2, Contador-2));
                                                                                                                   end;
                                                                                                        end;
                                                                                              end;
                                                                                   end;
                                                                          end;
                                                                end;
                                                     end;
                                           end;
                                  end;
                        end;
              end;
      Delete(Texto, 1, Contador);
       if (Texto <> '') then
       begin
        Result := Result + ' ';
       end;
  until (Texto = '');
end;

function TfExpWord.ValidateString(Source :string; StrList: array of string) :Boolean;
var
  Idx :Integer;
begin
  Result := False;
  Idx := 0; // Incializa índice para a StrList
  // Enquanto não processar todas a palavras na lista e Source não fizer parte dela
  while (Idx < Length(StrList)) and not Result do
  begin
    Result := Source = StrList[Idx];
    Inc(Idx);
  end;
end;

function TfExpWord.FirstCharUpper(Source :String) :String;
var
  Idx :Integer;
  StrWord :String;
begin
  Result := '';
  if Source = '' then
    Exit;
  Source := Trim(Source); // retira qualquer espaço extra
  repeat
    Idx := Pos(' ', Source); // Identifica o término da primeira palavra
    if Idx > 0 then // Se há espaço, há uma nova palavra após a encontrada
    begin
      StrWord := LowerCase(Trim(Copy(Source, 1, Idx-1))); // Isola primeira palavra de Source convertendo-a para minuscula
      if (Result = '') or // Se é primeira palavra ou não é uma das filtradas, converte primeira letra
        not ValidateString(StrWord, ['do', 'da', 'de', 'dos', 'e', 'das', 'na', 'no', 'nas', 'nos']) then
        StrWord := UpCase(StrWord[1]) +Copy(StrWord, 2, Length(StrWord));
      Source := Trim(Copy(Source, Idx +1, Length(Source))); // Retira primeira palavra de Source
      Result := Result +StrWord +' '; // Concatena palavras processadas, formando o resultado final
    end else // última palavra em Source a ser processada
      Result := Result +UpCase(Source[1]) +LowerCase(Copy(Source, 2, Length(Source)));
    until Idx = 0;
end;


procedure TfExpWord.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DM.qParametros.Open;
end;


function TfExpWord.NaoComparecimento;
begin
 if fProcessos.qProcessoCPGPRO_NCOMP.Value = 1
 then begin
       f_Var   := '<TEXTOOFICIO>';
       f_Troca := 'compareceram a Parte Requerente e sua Genitora, deixando, contudo, de comparecer o Suposto Pai.';
       while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
       f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
       f_Var := f_Var;

       f_Var   := '<TEXTONOMESUPAI>';
       f_Troca := '';
       while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
       f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
       f_Var := f_Var;

       f_Var   := '<TEXTONOMEMAE>';
       f_Troca := ' . Genitora da Parte Requerente:';
       while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
       f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
       f_Var := f_Var;
      end else begin
                 if fProcessos.qProcessoCPGPRO_NCOMP.Value = 2
                 then begin
                  f_Var   := '<TEXTOOFICIO>';
                  f_Troca := 'compareceu o Suposto Pai, deixando, contudo, de comparecer a Parte Requerente.';
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;

                  f_Var   := '<TEXTONOMESUPAI>';
                  f_Troca := ' . Suposto Pai:';
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;

                  f_Var   := '<TEXTONOMEMAE>';
                  f_Troca := '';
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;
                 end else begin
                           if fProcessos.qProcessoCPGPRO_NCOMP.Value = 3
                           then begin
                            f_Var   := '<TEXTOOFICIO>';
                            f_Troca := 'compareceu o Suposto Pai, deixando, contudo, de comparecer a Parte Requerente e sua Genitora.';
                            while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                            f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                            f_Var := f_Var;

                            f_Var   := '<TEXTONOMESUPAI>';
                            f_Troca := ' . Suposto Pai:';
                            while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                            f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                            f_Var := f_Var;

                            f_Var   := '<TEXTONOMEMAE>';
                            f_Troca := '';
                            while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                            f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                            f_Var := f_Var;
                           end else begin
                                     if fProcessos.qProcessoCPGPRO_NCOMP.Value = 4
                                     then begin
                                      f_Var   := '<TEXTOOFICIO>';
                                      f_Troca := 'nenhuma das partes compareceu.';
                                      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                                      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                                      f_Var := f_Var;

                                      f_Var   := '<TEXTONOMESUPAI>';
                                      f_Troca := '';
                                      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                                      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                                      f_Var := f_Var;

                                      f_Var   := '<TEXTONOMEMAE>';
                                      f_Troca := '';
                                      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                                      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                                      f_Var := f_Var;
                                     end else begin
                                               if fProcessos.qProcessoCPGPRO_NCOMP.Value = 5
                                               then begin
                                                f_Var   := '<TEXTOOFICIO>';
                                                f_Troca := 'todas as pessoas compareceram, não se realizando a coleta em decorrência da indisponibilidade financeira para que as mesmas absorvessem os custos Periciais.';
                                                while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                                                f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                                                f_Var := f_Var;

                                                f_Var   := '<TEXTONOMESUPAI>';
                                                f_Troca := '. Suposto Pai:';
                                                while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                                                f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                                                f_Var := f_Var;

                                                f_Var   := '<TEXTONOMEMAE>';
                                                f_Troca := ' . Genitora da Parte Requerente:';
                                                while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                                                f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                                                f_Var := f_Var;
                                               end;
                                             end;
                                  end;
                        end;
                end;
end;



procedure TfExpWord.SpeedButton1Click(Sender: TObject);
var s, PastaLocalizaModelo, f_NomePDF, Diretorio : String;
    Documento : Variant;
begin
if fProcessos.TipoItem = 'L'
then begin
      PastaLocalizaModelo := 'Laudos';
     end else begin
               if fProcessos.TipoItem = 'F'
               then begin
                     PastaLocalizaModelo := 'Folhas_Resultado';
                    end else begin
                              if fProcessos.TipoItem = 'A'
                              then begin
                                    PastaLocalizaModelo := 'Autorizacoes_Coleta';
                                   end else begin
                                             if fProcessos.TipoItem = 'R'
                                             then begin
                                                   PastaLocalizaModelo := 'Recibos';
                                                  end else begin
                                                            if fProcessos.TipoItem = 'E'
                                                            then begin
                                                                  PastaLocalizaModelo := 'Termos_Entrega';
                                                                 end else PastaLocalizaModelo := 'Oficios';
                                                           end;


                                            end;

                             end;

              end;

  f_NomeSalva := EditArqDest.text;

  if FileExists( f_NomeSalva )
  then begin

        if ((DM.qHistoricoITE_COD.Value = 6) or (DM.qHistoricoITE_COD.Value = 66))
        then begin
              Diretorio := DM.qParametrosPAM_DRPDF.Value + '\' + IntToStr(fProcessos.qProcessoCPGPRO_COD.Value) + '\';
              f_NomePDF := Diretorio + 'LAUDO_' + IntToStr(fProcessos.qProcessoCPGPRO_COD.Value) + '.pdf';
              Documento := waWord.Documents.Open2000(f_NomeSalva, EmptyParam, f_True, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
              Documento.ExportAsFixedFormat(f_NomePDF, 17);
              waWord.Quit;
             end;

        if ((DM.qHistoricoITE_COD.Value = 3))
        then begin
              Diretorio := DM.qParametrosPAM_DRPDF.Value + '\' + IntToStr(fProcessos.qProcessoCPGPRO_COD.Value) + '\';
              f_NomePDF := Diretorio + 'TERMO_' + IntToStr(fProcessos.qProcessoCPGPRO_COD.Value) + '.pdf';
              Documento := waWord.Documents.Open2000(f_NomeSalva, EmptyParam, f_True, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
              Documento.ExportAsFixedFormat(f_NomePDF, 17);
              waWord.Quit;
             end;
        ShowMessage('PDF do Laudo gerado com sucesso !');
       end else ShowMessage('Não existe o Laudo gerado !');
 end;
end.
