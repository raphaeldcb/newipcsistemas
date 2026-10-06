unit ufMapa_ExtAmpli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, Buttons, ExtCtrls, StdCtrls, Mask,
  DBCtrls, COMobj, ADODB, WordXP, OleServer, Word2010;

type
  TfMapa_ExtAmpli = class(TForm)
    qBuscaDadosPessoas: TADOQuery;
    waWord: TWordApplication;
    wdDoc: TWordDocument;
    qBuscaDadosPessoasPRO_COD: TIntegerField;
    qBuscaDadosPessoasPES_COD: TIntegerField;
    qBuscaDadosPessoasPES_NOME: TStringField;
    qBuscaDadosPessoasPES_SIT: TIntegerField;
    qBuscaDadosPessoasPES_DTNAS: TDateField;
    qBuscaDadosPessoasPES_LCNAS: TStringField;
    qBuscaDadosPessoasPES_SEXO: TStringField;
    qBuscaDadosPessoasPES_TDOC: TStringField;
    qBuscaDadosPessoasPES_NDOC: TStringField;
    qBuscaDadosPessoasPES_INICIAIS: TStringField;
    qBuscaDadosPessoasSIT_COD: TIntegerField;
    qBuscaDadosPessoasSIT_NM: TStringField;
    qBuscaDadosPessoasSIT_SIGLA: TStringField;
    qMaxOrdem: TADOQuery;
    qMaxOrdemNUMEROORDEM: TIntegerField;
    qMaxLote: TADOQuery;
    qMaxLoteMAIORLOTE: TIntegerField;
    qMaxLotes: TADOQuery;
    qMaxLotesQTDE: TIntegerField;
    qBuscaDadosPessoasSIT_ORDEM: TIntegerField;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    sbMapaExtracao: TSpeedButton;
    sbCriaLotes: TSpeedButton;
    EdtCdIni: TEdit;
    EdtCdFim: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    EdtLtIni: TEdit;
    EdtLtFim: TEdit;
    sbFechar: TSpeedButton;
    sbMapaExcel: TSpeedButton;
    CKB_Segunda: TCheckBox;
    procedure sbMapaExtracaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbCriaLotesClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure sbMapaExcelClick(Sender: TObject);
    Function MesExtenso( Mes:Word ) : string;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMapa_ExtAmpli: TfMapa_ExtAmpli;
  f_false, f_true, f_NomeDoc, f_Troca, f_Var, f_NomeSalva :OleVariant;
  Ano, Mes, Dia : Word;
  Data_Mapa, AnoA, MesA, DiaA : String;


implementation

uses ufDM, ufDMR, ufProcesso, ufGeraWord;

{$R *.dfm}


function TfMapa_ExtAmpli.MesExtenso( Mes:Word ) : string; const meses : array[0..11] of PChar = ('01', '02', '03', '04', '05', '06', '07', '08', '09','10', '11', '12');
begin
result := meses[mes-1];
End;

procedure TfMapa_ExtAmpli.sbMapaExtracaoClick(Sender: TObject);
var Tipo, MesGerando, LocalPlanilha, MesAtual, DataParaMapa, NomePlanilha : String;
    Lote : Integer;
begin

  DecodeDate (Date, Ano, Mes, Dia);
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
        DiaA := '01';
       end;
  Data_Mapa := DiaA +'_'+ MesA +'_'+ Copy(AnoA,3,1) + Copy(AnoA,4,1);

if MesA = '01'
then begin
MesAtual := 'JANEIRO';
end;
if MesA = '02'
then begin
MesAtual := 'FEVEREIRO';
end;
if MesA = '03'
then begin
MesAtual := 'MARÇO';
end;
if MesA = '04'
then begin
MesAtual := 'ABRIL';
end;
if MesA = '05'
then begin
MesAtual := 'MAIO';
end;
if MesA = '06'
then begin
MesAtual := 'JUNHO';
end;
if MesA = '07'
then begin
MesAtual := 'JULHO';
end;
if MesA = '08'
then begin
MesAtual := 'AGOSTO';
end;
if MesA = '09'
then begin
MesAtual := 'SETEMBRO';
end;
if MesA = '10'
then begin
MesAtual := 'OUTUBRO';
end;
if MesA = '11'
then begin
MesAtual := 'NOVEMBRO';
end;
if MesA = '12'
then begin
MesAtual := 'DEZEMBRO';
end;
     f_NomeDoc := 'U:\CPG\SCPG\Modelos\SUPERVISAO_EXTRACAO.doc';
//   f_NomeDoc := 'C:\SCPG\Modelos\SUPERVISAO_EXTRACAO.doc';
  
try
  Lote := StrToInt(InputBox('Informe o Número do Lote', 'Emissão da Folha de Extração', '0'));
  DMR.qSelecionaCasosMapas.Close;
  DMR.qSelecionaCasosMapas.Parameters.ParamByName('Lote').Value := Lote;
  DMR.qSelecionaCasosMapas.Open;

  f_NomeSalva := 'U:\Laboratorio\Supervisão\Supervisoes_Geradas\Extracao\' + AnoA + '\' + MesAtual + '\' + IntToStr(DMR.qSelecionaCasosMapasMPEA_LOTE.Value) + '.doc';
//    f_NomeSalva := 'C:\SCPG\Documentos_Gerados\' + AnoA + '\' + MesAtual + '\' + IntToStr(DMR.qSelecionaCasosMapasMPEA_LOTE.Value) + '.doc';

  waWord.Connect;
  waWord.Visible := True;
  wdDoc.ConnectTo(waWord.Documents.Open2000(f_NomeDoc, EmptyParam, f_True,
  EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam));

  wdDoc.SaveAs(f_NomeSalva);

DMR.qSelecionaCasosMapas.First;
while not DMR.qSelecionaCasosMapas.Eof do
begin
if not (DMR.qSelecionaCasosMapasPES_INICIAIS.Value = 'FIM')
then begin
       f_Var   := '<INICIAIS'+ IntToStr(DMR.qSelecionaCasosMapasMPEA_ORD.Value) + '>';
       f_Troca := DMR.qSelecionaCasosMapasPES_INICIAIS.Value;
       while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
       f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
       f_Var := f_Var;


       f_Var   := '<TIPO'+ IntToStr(DMR.qSelecionaCasosMapasMPEA_ORD.Value) + '>';
       f_Troca := DMR.qSelecionaCasosMapasSIT_SIGLA.Value;
       while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
       f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
       f_Var := f_Var;

       f_Var   := '<CASO'+ IntToStr(DMR.qSelecionaCasosMapasMPEA_ORD.Value) + '>';
       f_Troca := DMR.qSelecionaCasosMapasPRO_COD.Value;
       while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
       f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
       f_Var := f_Var;
     end;
DMR.qSelecionaCasosMapas.Next;
end;
 f_Var   := '<LOTE>';
 f_Troca := DMR.qSelecionaCasosMapasMPEA_LOTE.Value;
 while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
 f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
 f_Var := f_Var;

 f_Var   := '<USUARIO>';
 f_Troca := DM.qHostsHOS_USUA.Value;
 while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
 f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
 f_Var := f_Var;

 f_Var   := '<DATAHORA>';
 f_Troca := DateToStr(Date) + ' ' + TimeToStr(Time);
 while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
 f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
 f_Var := f_Var;

 wdDoc.Save;
except
showmessage('Ocorreu erro ao executar a transferência');
end;

ShowMessage('Nesse momento existe um DOCUMENTO gerado na barra de tarefas. ' + #13 + 'Trabalhe normalmente nele e quando terminar de editar o documento e imprimir.' +
#13 + #13 + 'Pressione OK para encerrar o documento.' + #13 + #13 + 'Atenção: Não precisa fechar o Word. Pressionando OK ele fecha automaticamente!!!');
f_false := False;
waWord.Quit(f_False, f_False, f_False);
waWord.Disconnect;
end;

procedure TfMapa_ExtAmpli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Dm.qMapa_ExtAmpli.Close;
end;

procedure TfMapa_ExtAmpli.FormShow(Sender: TObject);
begin
  inherited;
  Dm.qMapa_ExtAmpli.Open;
end;

procedure TfMapa_ExtAmpli.sbCriaLotesClick(Sender: TObject);
var NumeroLote, NumeroOrdem, OrdemExportacao, ContadorCodigo, i, CodigoCaso : Integer;
begin
// inherited;
ContadorCodigo := (StrToInt(EdtCdFim.Text)-StrToInt(EdtCdIni.Text)) + 1;
for i := 1 to ContadorCodigo do
begin
 if i = 1
 then begin
       CodigoCaso := StrToInt(EdtCdIni.Text);
      end else begin
                CodigoCaso := CodigoCaso + 1;
               end;


 if fProcessos.qProcessoCPG.Locate('PRO_COD', CodigoCaso, []) = True
 then begin
       if fProcessos.qProcessoCPGCAS_CODIGO.Value = 'PD0101'
       then begin
             qBuscaDadosPessoas.Close;
             qBuscaDadosPessoas.Parameters.ParamByName('PROCESSO').Value  := CodigoCaso;
             qBuscaDadosPessoas.Open;

             while qBuscaDadosPessoas.Eof = False do
             begin
              qMaxLote.Close;
              qMaxLote.Open;
              if qMaxLoteMAIORLOTE.Value = 0
              then begin
                    NumeroLote := qMaxLoteMAIORLOTE.Value + 1;
                   end else NumeroLote := qMaxLoteMAIORLOTE.Value;

              qMaxOrdem.Close;
              qMaxOrdem.Parameters.ParamByName('Lote').Value  := NumeroLote;
              qMaxOrdem.Open;
              if (qMaxOrdemNUMEROORDEM.Value >= 18)
              then begin
                    NumeroLote  := NumeroLote + 1;
                    NumeroOrdem := 1;
                   end else NumeroOrdem := qMaxOrdemNUMEROORDEM.Value + 1;

               DM.qMapa_ExtAmpli.Append;
               DM.qMapa_ExtAmpliMPEA_LOTE.Value    := NumeroLote;
               DM.qMapa_ExtAmpliMPEA_ORD.Value     := NumeroOrdem;
               DM.qMapa_ExtAmpliMPEA_DATA.Value    := Date;
               DM.qMapa_ExtAmpliPES_INICIAIS.Value := qBuscaDadosPessoasPES_INICIAIS.Value;
               DM.qMapa_ExtAmpliSIT_SIGLA.Value    := qBuscaDadosPessoasSIT_SIGLA.Value;
               DM.qMapa_ExtAmpliPRO_COD.Value      := CodigoCaso;
               DM.qMapa_ExtAmpli.Post;

               qBuscaDadosPessoas.Next;
             end;
            end;

//Caso Tipo 2
       if fProcessos.qProcessoCPGCAS_CODIGO.Value = 'PD0201'
       then begin
             qMaxLote.Close;
             qMaxLote.Open;
             if qMaxLoteMAIORLOTE.Value = 0
             then begin
                   NumeroLote := qMaxLoteMAIORLOTE.Value + 1;
                  end else NumeroLote := qMaxLoteMAIORLOTE.Value;

              qMaxOrdem.Close;
              qMaxOrdem.Parameters.ParamByName('Lote').Value  := NumeroLote;
              qMaxOrdem.Open;
              if (qMaxOrdemNUMEROORDEM.Value >= 18)
              then begin
                    NumeroLote  := NumeroLote + 1;
                    NumeroOrdem := 1;
                   end else NumeroOrdem := qMaxOrdemNUMEROORDEM.Value + 1;

               DM.qMapa_ExtAmpli.Append;
               DM.qMapa_ExtAmpliMPEA_LOTE.Value    := NumeroLote;
               DM.qMapa_ExtAmpliMPEA_ORD.Value     := NumeroOrdem;
               DM.qMapa_ExtAmpliMPEA_DATA.Value    := Date;
               DM.qMapa_ExtAmpliPES_INICIAIS.Value := '';
               DM.qMapa_ExtAmpliSIT_SIGLA.Value    := '';
               DM.qMapa_ExtAmpliPRO_COD.Value      := CodigoCaso;
               DM.qMapa_ExtAmpli.Post;

             qBuscaDadosPessoas.Close;
             qBuscaDadosPessoas.Parameters.ParamByName('PROCESSO').Value  := CodigoCaso;
             qBuscaDadosPessoas.Open;

             while qBuscaDadosPessoas.Eof = False do
             begin
              qMaxLote.Close;
              qMaxLote.Open;
              if qMaxLoteMAIORLOTE.Value = 0
              then begin
                    NumeroLote := qMaxLoteMAIORLOTE.Value + 1;
                   end else NumeroLote := qMaxLoteMAIORLOTE.Value;

              qMaxOrdem.Close;
              qMaxOrdem.Parameters.ParamByName('Lote').Value  := NumeroLote;
              qMaxOrdem.Open;
              if (qMaxOrdemNUMEROORDEM.Value >= 18)
              then begin
                    NumeroLote  := NumeroLote + 1;
                    NumeroOrdem := 1;
                   end else NumeroOrdem := qMaxOrdemNUMEROORDEM.Value + 1;

               DM.qMapa_ExtAmpli.Append;
               DM.qMapa_ExtAmpliMPEA_LOTE.Value    := NumeroLote;
               DM.qMapa_ExtAmpliMPEA_ORD.Value     := NumeroOrdem;
               DM.qMapa_ExtAmpliMPEA_DATA.Value    := Date;
               DM.qMapa_ExtAmpliPES_INICIAIS.Value := qBuscaDadosPessoasPES_INICIAIS.Value;
               DM.qMapa_ExtAmpliSIT_SIGLA.Value    := qBuscaDadosPessoasSIT_SIGLA.Value;
               DM.qMapa_ExtAmpliPRO_COD.Value      := CodigoCaso;
               DM.qMapa_ExtAmpli.Post;

               qBuscaDadosPessoas.Next;
             end;
            end;
//Fim Caso Tipo 2
           end;
end;

//Validação Final do Dia
if messagedlg('Esse é o último Lote a ser criado??',mtconfirmation,[mbyes,mbno],0) = mryes
then begin
begin
  qMaxLote.Close;
  qMaxLote.Open;
  if qMaxLoteMAIORLOTE.Value = 0
  then begin
        NumeroLote := qMaxLoteMAIORLOTE.Value + 1;
       end else NumeroLote := qMaxLoteMAIORLOTE.Value;

  qMaxOrdem.Close;
  qMaxOrdem.Parameters.ParamByName('Lote').Value  := NumeroLote;
  qMaxOrdem.Open;
  if (qMaxOrdemNUMEROORDEM.Value >= 18)
  then begin
        NumeroLote  := NumeroLote + 1;
        NumeroOrdem := 1;
       end else NumeroOrdem := qMaxOrdemNUMEROORDEM.Value + 1;

   DM.qMapa_ExtAmpli.Append;
   DM.qMapa_ExtAmpliMPEA_LOTE.Value    := NumeroLote;
   DM.qMapa_ExtAmpliMPEA_ORD.Value     := 18;
   DM.qMapa_ExtAmpliMPEA_DATA.Value    := Date;
   DM.qMapa_ExtAmpliPES_INICIAIS.Value := 'FIM';
   DM.qMapa_ExtAmpliSIT_SIGLA.Value    := 'FIM';
   DM.qMapa_ExtAmpliPRO_COD.Value      := 99999;
   DM.qMapa_ExtAmpli.Post;
end;

end;




ShowMessage('Os LOTES from criados com sucesso!!!!');
end;

procedure TfMapa_ExtAmpli.sbFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfMapa_ExtAmpli.sbMapaExcelClick(Sender: TObject);
var excel :variant;
    MesGerando, LocalPlanilha, MesAtual, DataParaMapa, NomePlanilha : String;
    ContadorLote, i, Lote, Coluna, Linha  : Integer;
begin
try

  DecodeDate (Date, Ano, Mes, Dia);
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
        DiaA := '01';
       end;
  Data_Mapa := DiaA +'_'+ MesA +'_'+ Copy(AnoA,3,1) + Copy(AnoA,4,1);

if MesA = '01'
then begin
MesAtual := 'JANEIRO';
end;
if MesA = '02'
then begin
MesAtual := 'FEVEREIRO';
end;
if MesA = '03'
then begin
MesAtual := 'MARÇO';
end;
if MesA = '04'
then begin
MesAtual := 'ABRIL';
end;
if MesA = '05'
then begin
MesAtual := 'MAIO';
end;
if MesA = '06'
then begin
MesAtual := 'JUNHO';
end;
if MesA = '07'
then begin
MesAtual := 'JULHO';
end;
if MesA = '08'
then begin
MesAtual := 'AGOSTO';
end;
if MesA = '09'
then begin
MesAtual := 'SETEMBRO';
end;
if MesA = '10'
then begin
MesAtual := 'OUTUBRO';
end;
if MesA = '11'
then begin
MesAtual := 'NOVEMBRO';
end;
if MesA = '12'
then begin
MesAtual := 'DEZEMBRO';
end;

if CKB_Segunda.Checked = False
then begin
       DataParaMapa := Data_Mapa;
     end else DataParaMapa := Data_Mapa + '_2';

  NomePlanilha := 'U:\Laboratorio\Supervisão\Supervisoes_Geradas\Amplificacao_Excel\' + AnoA + '\' + MesAtual + '\' + DataParaMapa + '.xls';
  LocalPlanilha := DM.qParametrosPAM_DIRMPEXTRACAOXLS.Value;

  excel := CreateOleObject('Excel.Application');
  if not Excel.Application.Visible then
  Excel.WorkBooks.Open(LocalPlanilha);

  Linha  := 13;
  Coluna := 2;
  ContadorLote := (StrToInt(EdtLtFim.Text)-StrToInt(EdtLtIni.Text)) + 1;
  for i := 1 to ContadorLote do
  begin
     if i = 1
     then begin
           Lote := StrToInt(EdtLtIni.Text);
          end else begin
                    Lote := Lote + 1;
                   end;

   DMR.qSelecionaCasosMapas.Close;
   DMR.qSelecionaCasosMapas.Parameters.ParamByName('Lote').Value  := Lote;
   DMR.qSelecionaCasosMapas.Open;

   DMR.qSelecionaCasosMapas.First;
   while not DMR.qSelecionaCasosMapas.Eof do
   begin
    if not ((DMR.qSelecionaCasosMapasPES_INICIAIS.Value = 'FIM') or (DMR.qSelecionaCasosMapasPES_INICIAIS.Value = ''))
    then begin
          Excel.WorkBooks[1].Sheets[1].Cells[Linha,Coluna]:= IntToStr(DMR.qSelecionaCasosMapasPRO_COD.Value) + ',' + DMR.qSelecionaCasosMapasSIT_SIGLA.Value + ',' + DMR.qSelecionaCasosMapasPES_INICIAIS.Value + ',ID';
          if Linha = 20
          then begin
                Coluna  := Coluna + 1;
                Linha   := 13;
               end else Linha:=Linha+1;
        end;
    DMR.qSelecionaCasosMapas.Next;
   end;
end;
Excel.WorkBooks[1].Sheets[1].Cells[Linha,Coluna]:= 'ID';

Excel.WorkBooks[1].Sheets[2].Cells[2,5] := InputBox('Informe o NOME DO SUPERVISOR', 'Nome', '0');
Excel.WorkBooks[1].Sheets[2].Cells[2,6] := InputBox('Informe o NOME DO CRIADOR', 'Nome', '0');

if CKB_Segunda.Checked = False
then begin
      Excel.WorkBooks[1].Sheets[1].Cells[1,11]:= Data_Mapa;
     end else Excel.WorkBooks[1].Sheets[1].Cells[1,11]:= Data_Mapa + '_2';

Showmessage('Ver o arquivo Excel na Pasta "U:\Laboratorio\Supervisão\Supervisoes_Geradas\Amplificacao_Excel\"');
Excel.Application.Visible := true;
Excel.ActiveWorkBook.SaveAs(NomePlanilha);
Excel.quit;
Excel:=unassigned;

except
showmessage('Ocorreu erro ao executar a transferência');
end;
end;

end.
