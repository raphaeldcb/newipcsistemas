unit ufMapa_ExtAmpliNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, Buttons, ExtCtrls, StdCtrls, Mask,
  DBCtrls, ADODB, COMobj, WordXP, OleServer, JvExMask, JvToolEdit, JvDBControls;

type
  TfMapa_ExtAmpliNew = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBDateEdit1: TJvDBDateEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    EdtCdIni: TEdit;
    EdtCdFim: TEdit;
    Label10: TLabel;
    cb_Agrupa: TCheckBox;
    cb_Indi: TCheckBox;
    EdtCdIndividual: TEdit;
    sbConsultar: TSpeedButton;
    DBG_Consulta: TDBGrid;
    DBG_Gravados: TDBGrid;
    sbTodos: TSpeedButton;
    sbIndividual: TSpeedButton;
    sbExcluirTodos: TSpeedButton;
    sbExcluirIndividual: TSpeedButton;
    qBuscaDadosPessoas: TADOQuery;
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
    qBuscaDadosPessoasSIT_ORDEM: TIntegerField;
    qTemp: TADOQuery;
    qMaxLote: TADOQuery;
    qMaxLoteMAIORLOTE: TIntegerField;
    qMaxLotes: TADOQuery;
    qMaxLotesQTDE: TIntegerField;
    sbGerar: TSpeedButton;
    CKB_Segunda: TCheckBox;
    qTempMPEA_LOTE: TIntegerField;
    qTempPRO_COD: TIntegerField;
    qTempMPEA_ORD: TIntegerField;
    qTempPES_INICIAIS: TStringField;
    qTempSIT_SIGLA: TStringField;
    dsTemp: TDataSource;
    qSelecionaCasosMapas: TADOQuery;
    qSelecionaCasosMapasMPEA_LOTE: TIntegerField;
    qSelecionaCasosMapasMPEA_DATA: TDateField;
    qSelecionaCasosMapasPRO_COD: TIntegerField;
    qSelecionaCasosMapasMPEA_ORD: TIntegerField;
    qSelecionaCasosMapasPES_INICIAIS: TStringField;
    qSelecionaCasosMapasSIT_SIGLA: TStringField;
    qDelTemp: TADOQuery;
    IntegerField1: TIntegerField;
    Label4: TLabel;
    Label5: TLabel;
    procedure sbTodosClick(Sender: TObject);
    procedure BNovoClick(Sender: TObject);
    procedure BCnsultarClick(Sender: TObject);
    Function MesExtenso( Mes:Word ) : string;
    procedure cb_AgrupaClick(Sender: TObject);
    procedure cb_IndiClick(Sender: TObject);
    procedure sbConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbIndividualClick(Sender: TObject);
    procedure sbExcluirTodosClick(Sender: TObject);
    procedure sbExcluirIndividualClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure BSairClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMapa_ExtAmpliNew: TfMapa_ExtAmpliNew;
  f_false, f_true, f_NomeDoc, f_Troca, f_Var, f_NomeSalva :OleVariant;
  Ano, Mes, Dia : Word;
  Data_Mapa, AnoA, MesA, DiaA : String;


implementation

uses ufDM, ufProcesso, ufDMR, Math;

{$R *.dfm}

procedure TfMapa_ExtAmpliNew.sbTodosClick(Sender: TObject);
var Ordem : Integer;
begin
   if dsp.DataSet.State in [dsinsert, dsedit]
   then begin
         DM.qMapa_ExtAmpli.Post;
        end;

 qTemp.First;
 while not qTemp.Eof do
 begin
   DM.qMapa_ExtAmpli_Casos.Append;
   DM.qMapa_ExtAmpli_CasosMPEA_LOTE.Value    := qTempMPEA_LOTE.Value;
   DM.qMapa_ExtAmpli_CasosMPEA_ORD.Value     := qTempMPEA_ORD.Value;
   DM.qMapa_ExtAmpli_CasosPES_INICIAIS.Value := qTempPES_INICIAIS.Value;
   DM.qMapa_ExtAmpli_CasosSIT_SIGLA.Value    := qTempSIT_SIGLA.Value;
   DM.qMapa_ExtAmpli_CasosPRO_COD.Value      := qTempPRO_COD.Value;
   DM.qMapa_ExtAmpli_Casos.Post;

   qTemp.Next;
 end;
DM.qMapa_ExtAmpli_Casos.Open;

sbExcluirTodos.Enabled      := True;
sbExcluirIndividual.Enabled := True;
end;


procedure TfMapa_ExtAmpliNew.BNovoClick(Sender: TObject);
begin
 qMaxLote.Close;
 qMaxLote.Open;
 inherited;
 DM.qMapa_ExtAmpliMPEA_LOTE.Value := qMaxLoteMAIORLOTE.Value + 1;
 DM.qMapa_ExtAmpliMPEA_DATA.Value := Date;
end;

function TfMapa_ExtAmpliNew.MesExtenso( Mes:Word ) : string; const meses : array[0..11] of PChar = ('01', '02', '03', '04', '05', '06', '07', '08', '09','10', '11', '12');
begin
result := meses[mes-1];
End;

procedure TfMapa_ExtAmpliNew.BCnsultarClick(Sender: TObject);
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

 // Produção
  NomePlanilha := 'U:\Laboratorio\Supervisão\Supervisoes_Geradas\Amplificacao_Excel\' + AnoA + '\' + MesAtual + '\' + DataParaMapa + '.xlsx';
 // Testes
 // NomePlanilha := 'C:\SCPG\Documentos_Gerados\Planilhas_Geradas\' + AnoA + '\' + MesAtual + '\' + DataParaMapa + '.xlsx';

 // Testes
 // LocalPlanilha := 'C:\SCPG\Modelos\MAPA_AMPLIFICACAO_FUSION.xlsx';
 // Produção
  LocalPlanilha := 'U:\CPG\SCPG\Modelos\MAPA_AMPLIFICACAO_FUSION.xlsx';

  excel := CreateOleObject('Excel.Application');
  if not Excel.Application.Visible then
  Excel.WorkBooks.Open(LocalPlanilha);

  Linha  := 13;
  Coluna := 2;

  qSelecionaCasosMapas.Close;
  qSelecionaCasosMapas.Parameters.ParamByName('Lote').Value  := DM.qMapa_ExtAmpliMPEA_LOTE.Value;
  qSelecionaCasosMapas.Open;

  qSelecionaCasosMapas.First;
  while not qSelecionaCasosMapas.Eof do
  begin
   Excel.WorkBooks[1].Sheets[1].Cells[Linha,Coluna]:= IntToStr(qSelecionaCasosMapasPRO_COD.Value) + ',' + qSelecionaCasosMapasSIT_SIGLA.Value + ',' + qSelecionaCasosMapasPES_INICIAIS.Value + ',ID';
   if Linha = 20
   then begin
         Coluna  := Coluna + 1;
         Linha   := 13;
        end else Linha:=Linha+1;
   qSelecionaCasosMapas.Next;
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


procedure TfMapa_ExtAmpliNew.cb_AgrupaClick(Sender: TObject);
begin
qTemp.Close;
with qDelTemp do
begin
  Close;
  SQL.Clear;
  SQL.Add('delete from TB_TEMP_MEC');
  ExecSQL;
end;


if (cb_Agrupa.Checked = True)
then begin
      Label3.Enabled          := True;
      Label10.Enabled         := True;
      EdtCdIni.Enabled        := True;
      EdtCdFim.Enabled        := True;
      cb_Indi.Checked         := False;
      EdtCdFim.Clear;
      EdtCdIndividual.Enabled := False;
      EdtCdIni.SetFocus;
      sbConsultar.Enabled     := True;
     end;
  inherited;
end;

procedure TfMapa_ExtAmpliNew.cb_IndiClick(Sender: TObject);
begin
if (cb_Indi.Checked = True)
then begin
      Label3.Enabled          := False;
      Label10.Enabled         := False;
      EdtCdIni.Clear;
      EdtCdFim.Clear;
      EdtCdIni.Enabled        := False;
      EdtCdFim.Enabled        := False;
      cb_Agrupa.Checked       := False;
      EdtCdIndividual.Enabled := True;
      EdtCdIndividual.SetFocus;
      sbConsultar.Enabled     := True;
     end;
  inherited;

end;

procedure TfMapa_ExtAmpliNew.sbConsultarClick(Sender: TObject);
var NumeroLote, NumeroOrdem, OrdemExportacao, ContadorCodigo, Ordem, i, CodigoCaso : Integer;
begin
qTemp.Open;
if (cb_Agrupa.Checked = True)
then begin
      Ordem := 1;
      ContadorCodigo := (StrToInt(EdtCdFim.Text)-StrToInt(EdtCdIni.Text)) + 1;
      for i := 1 to ContadorCodigo do
      begin
         if i = 1
         then begin
               CodigoCaso := StrToInt(EdtCdIni.Text);
              end else begin
                        CodigoCaso := CodigoCaso + 1;
                       end;

         qBuscaDadosPessoas.Close;
         qBuscaDadosPessoas.Parameters.ParamByName('PROCESSO').Value  := CodigoCaso;
         qBuscaDadosPessoas.Open;

         qBuscaDadosPessoas.First;
         while not qBuscaDadosPessoas.Eof do
         begin
          qTemp.Append;
          qTempMPEA_LOTE.Value    := dm.qMapa_ExtAmpliMPEA_LOTE.Value;
          qTempMPEA_ORD.Value     := Ordem;
          qTempPES_INICIAIS.Value := qBuscaDadosPessoasPES_INICIAIS.Value;
          qTempSIT_SIGLA.Value    := qBuscaDadosPessoasSIT_SIGLA.Value;
          qTempPRO_COD.Value      := CodigoCaso;
          qTemp.Post;

          Ordem      := Ordem + 1;
          qBuscaDadosPessoas.Next;
         end;
     end;
    end;

if (cb_Indi.Checked = True)
then begin
      Ordem := 1;
      CodigoCaso := StrToInt(EdtCdIndividual.Text);

      qBuscaDadosPessoas.Close;
      qBuscaDadosPessoas.Parameters.ParamByName('PROCESSO').Value  := CodigoCaso;
      qBuscaDadosPessoas.Open;

      qTemp.Append;
      qTempMPEA_LOTE.Value    := NumeroLote;
      qTempMPEA_ORD.Value     := Ordem;
      qTempPES_INICIAIS.Value := qBuscaDadosPessoasPES_INICIAIS.Value;
      qTempSIT_SIGLA.Value    := qBuscaDadosPessoasSIT_SIGLA.Value;
      qTempPRO_COD.Value      := CodigoCaso;
      qTemp.Post;
     end;
 Label4.Caption := 'Casos encontrados: Total de Pessoas: ' + IntToStr(qTemp.RecordCount);
end;

procedure TfMapa_ExtAmpliNew.FormShow(Sender: TObject);
begin
DM.qMapa_ExtAmpli.Open;
DM.qMapa_ExtAmpli_Casos.Open;
  inherited;

end;

procedure TfMapa_ExtAmpliNew.sbIndividualClick(Sender: TObject);
begin
    if dsp.DataSet.State in [dsinsert, dsedit]
   then begin
         DM.qMapa_ExtAmpli.Post;
        end;

        
  DM.qMapa_ExtAmpli_Casos.Append;
  DM.qMapa_ExtAmpli_CasosMPEA_LOTE.Value    := qTempMPEA_LOTE.Value;
  DM.qMapa_ExtAmpli_CasosMPEA_ORD.Value     := qTempMPEA_ORD.Value;
  DM.qMapa_ExtAmpli_CasosPES_INICIAIS.Value := qTempPES_INICIAIS.Value;
  DM.qMapa_ExtAmpli_CasosSIT_SIGLA.Value    := qTempSIT_SIGLA.Value;
  DM.qMapa_ExtAmpli_CasosPRO_COD.Value      := qTempPRO_COD.Value;
  DM.qMapa_ExtAmpli_Casos.Post;

  DM.qMapa_ExtAmpli_Casos.Open;
  sbExcluirTodos.Enabled      := True;
  sbExcluirIndividual.Enabled := True;
//  inherited;
end;

procedure TfMapa_ExtAmpliNew.sbExcluirTodosClick(Sender: TObject);
begin
if messagedlg('Confirma a exclusão todos os Casos vinculados do Lote?',mtconfirmation,[mbyes,mbno],0) = mryes
then begin
      with qDelTemp do
      begin
       Close;
       SQL.Clear;
       SQL.Add('delete from TB_MAPA_EXTAMPLI_CASOS c where c.MPEA_LOTE = :Lote');
       Parameters.ParamByName('Lote').Value := DM.qMapa_ExtAmpliMPEA_LOTE.Value;
       ExecSQL;
      end;

      DM.qMapa_ExtAmpli_Casos.Close;
      DM.qMapa_ExtAmpli_Casos.Open;

      sbExcluirTodos.Enabled      := False;
      sbExcluirIndividual.Enabled := False;
    end;

end;

procedure TfMapa_ExtAmpliNew.sbExcluirIndividualClick(Sender: TObject);
begin
if messagedlg('Confirma a exclusão do caso selecionado ?',mtconfirmation,[mbyes,mbno],0) = mryes
then begin
      DM.qMapa_ExtAmpli_Casos.Delete;
     end; 

end;

procedure TfMapa_ExtAmpliNew.BSalvarClick(Sender: TObject);
begin
sbGerar.Enabled := True;
  inherited;

end;

procedure TfMapa_ExtAmpliNew.BSairClick(Sender: TObject);
begin
qTemp.Close;
with qDelTemp do
begin
  Close;
  SQL.Clear;
  SQL.Add('delete from TB_TEMP_MEC');
  ExecSQL;
end;

  inherited;

end;

end.
