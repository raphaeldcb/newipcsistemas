unit ufRelGuiaPostagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WordXP, OleServer, DB, ADODB;

type
  TfRelGuiaPostagem = class(TForm)
    RadioGroup1: TRadioGroup;
    qBuscaDadosPessoas: TADOQuery;
    qBuscaDadosPessoasPRO_COD: TIntegerField;
    qBuscaDadosPessoasPES_COD: TIntegerField;
    qBuscaDadosPessoasPES_NOME: TStringField;
    qBuscaDadosPessoasPES_SIT: TIntegerField;
    qBuscaDadosPessoasPES_DTNAS: TDateField;
    qBuscaDadosPessoasPES_LCNAS: TStringField;
    qBuscaDadosPessoasPES_SEXO: TStringField;
    qBuscaDadosPessoasPES_NDOC: TStringField;
    qBuscaDadosPessoasPES_TDOC: TStringField;
    qBuscaDadosHistorico: TADOQuery;
    qBuscaDadosHistoricoHIS_DOC: TStringField;
    waWord: TWordApplication;
    wdDoc: TWordDocument;
    qDadosRelatorio: TADOQuery;
    qDadosRelatorioEND_COD: TIntegerField;
    qDadosRelatorioPRO_COD: TIntegerField;
    qDadosRelatorioOBS: TStringField;
    qDadosRelatorioTIPO: TStringField;
    qDadosRelatorioREGCORREIO: TStringField;
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelGuiaPostagem: TfRelGuiaPostagem;
  f_false, f_true, f_NomeDoc, f_Troca, f_Var, f_NomeSalva : OleVariant;
  AnoA, MesA, DiaA, NovaDataResultadoF : String;
  Ano, Mes, Dia : Word;

implementation

uses ufDM;

{$R *.dfm}

procedure TfRelGuiaPostagem.RadioGroup1Click(Sender: TObject);
var Contador, i : Integer;
begin
if RadioGroup1.ItemIndex = 0
then begin
      qDadosRelatorio.Close;
      qDadosRelatorio.SQL.Clear;
      qDadosRelatorio.SQL.Add(' select * from tb_correspondencia c ');
      qDadosRelatorio.SQL.Add(' where c.tipo = :Tipo ');
      qDadosRelatorio.Parameters.ParamByName('Tipo').Value := 'SEDEX';
      qDadosRelatorio.Open;
      Contador := qDadosRelatorio.RecordCount;

      f_NomeDoc := DM.qParametrosPAM_DPADR.Value + 'SEDEX.DOC';
      try
        waWord.Connect;
        waWord.Visible := True;
        wdDoc.ConnectTo(waWord.Documents.Open2000(f_NomeDoc, EmptyParam, f_True,
        EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam));

        qDadosRelatorio.First;
        for i := 1 to Contador do
        begin
          DM.qEnderecos.Open;
          if DM.qEnderecos.Locate('END_COD', qDadosRelatorioEND_COD.Value, []) = True
          then begin
                f_Var   := '<COMARCA'+ IntToStr(i) + '>';
                f_Troca := DM.qEnderecosEND_CID.Value;
                while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                f_Var := f_Var;

                f_Var   := '<CEP'+ IntToStr(i) + '>';
                f_Troca := DM.qEnderecosEND_CEP.Value;
                while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                f_Var := f_Var;

                f_Var   := '<REGISTRO'+ IntToStr(i) + '>';
                f_Troca := qDadosRelatorioREGCORREIO.Value;
                while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                f_Var := f_Var;

                f_Var   := '<QUANTIDADE>';
                f_Troca := IntToStr(Contador);
                while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                f_Var := f_Var;
               end;
               DecodeDate (Date, Ano, Mes, Dia);
               AnoA := IntToStr(Ano);
               MesA := IntToStr(Mes);
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
               NovaDataResultadoF := (DiaA + '/' + MesA + '/'+ AnoA);

               f_Var   := '<DATA>';
               f_Troca := StrToDate(NovaDataResultadoF);
               while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
               f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
               f_Var := f_Var;
        qDadosRelatorio.Next;
        end;
         except
          wdDoc.PrintOut(f_False, f_False, f_False);
          waWord.Quit(f_False, f_False, f_False);
          Application.MessageBox('Erro ao tentar abrir o modelo de documento.!', 'Mensagem', mb_iconInformation);
          end;

        ShowMessage('Nesse momento existe um DOCUMENTO gerado na barra de tarefas. ' + #13 + 'Trabalhe normalmente nele e quando terminar de editar o documento e imprimir.' +
        #13 + #13 + 'Pressione OK para encerrar o documento.' + #13 + #13 + 'Atenção: Não precisa fechar o Word. Pressionando OK ele fecha automaticamente!!!');
        f_false := False;
        waWord.Quit(f_False, f_False, f_False);
        waWord.Disconnect;
     end else begin
                qDadosRelatorio.Close;
                qDadosRelatorio.SQL.Clear;
                qDadosRelatorio.SQL.Add(' select * from tb_correspondencia c ');
                qDadosRelatorio.SQL.Add(' where c.tipo = :Tipo ');
                qDadosRelatorio.Parameters.ParamByName('Tipo').Value := 'REGISTRADA';
                qDadosRelatorio.Open;
                Contador := qDadosRelatorio.RecordCount;

                f_NomeDoc := DM.qParametrosPAM_DPADR.Value + 'REGISTRADA.DOC';
                try
                  waWord.Connect;
                  waWord.Visible := True;
                  wdDoc.ConnectTo(waWord.Documents.Open2000(f_NomeDoc, EmptyParam, f_True,
                  EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam));

                  qDadosRelatorio.First;
                  for i := 1 to Contador do
                  begin
                    DM.qEnderecos.Open;
                    if DM.qEnderecos.Locate('END_COD', qDadosRelatorioEND_COD.Value, []) = True
                    then begin
                          f_Var   := '<RESPONSAVEL' + IntToStr(i) + '>';
                          f_Troca := DM.qEnderecosEND_NMR.Value;
                          while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                          f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                          f_Var := f_Var;

                          f_Var   := '<CEP'+ IntToStr(i) + '>';
                          f_Troca := DM.qEnderecosEND_CEP.Value;
                          while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                          f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                          f_Var := f_Var;

                          f_Var   := '<REGISTRO'+ IntToStr(i) + '>';
                          f_Troca := qDadosRelatorioREGCORREIO.Value;
                          while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                          f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                          f_Var := f_Var;

                          f_Var   := '<QUANTIDADE>';
                          f_Troca := IntToStr(Contador);
                          while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                          f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                          f_Var := f_Var;
                         end;
                         DecodeDate (Date, Ano, Mes, Dia);
                         AnoA := IntToStr(Ano);
                         MesA := IntToStr(Mes);
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
                         NovaDataResultadoF := (DiaA + '/' + MesA + '/'+ AnoA);

                         f_Var   := '<DATA>';
                         f_Troca := StrToDate(NovaDataResultadoF);
                         while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                         f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                         f_Var := f_Var;
                  qDadosRelatorio.Next;
                  end;
                   except
                    wdDoc.PrintOut(f_False, f_False, f_False);
                    waWord.Quit(f_False, f_False, f_False);
                    Application.MessageBox('Erro ao tentar abrir o modelo de documento.!', 'Mensagem', mb_iconInformation);
                    end;

                  ShowMessage('Nesse momento existe um DOCUMENTO gerado na barra de tarefas. ' + #13 + 'Trabalhe normalmente nele e quando terminar de editar o documento e imprimir.' +
                  #13 + #13 + 'Pressione OK para encerrar o documento.' + #13 + #13 + 'Atenção: Não precisa fechar o Word. Pressionando OK ele fecha automaticamente!!!');
                  f_false := False;
                  waWord.Quit(f_False, f_False, f_False);
                  waWord.Disconnect;

              end;
end;

end.
