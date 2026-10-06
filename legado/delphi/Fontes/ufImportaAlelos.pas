unit ufImportaAlelos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, StdCtrls, DB, SqlExpr, Grids, DBGrids,
  ComObj, Buttons, ADODB,
  ExtCtrls, ComCtrls;

type
  TfImportaAlelos = class(TForm)
    gbxImport: TGroupBox;
    lbOrigem: TLabel;
    edtOrigem: TEdit;
    btnOrigem: TSpeedButton;
    opndlgOrigem: TOpenDialog;
    qInsereDados: TADOQuery;
    DS_InsereDados: TDataSource;
    DBGrid1: TDBGrid;
    sbImportar: TSpeedButton;
    sbFechar: TSpeedButton;
    qVerificaDados: TADOQuery;
    qGeraDados: TADOQuery;
    qVerificaDadosCodigo: TADOQuery;
    qInsereDadosCOD_ALE: TIntegerField;
    qInsereDadosNM1_ALE: TStringField;
    qInsereDadosNM2_ALE: TStringField;
    qInsereDadosNM3_ALE: TStringField;
    qInsereDadosNM4_ALE: TStringField;
    qInsereDadosMAR_ALE: TStringField;
    qInsereDadosAL1_ALE: TStringField;
    qInsereDadosAL2_ALE: TStringField;
    qInsereDadosORD_ALE: TIntegerField;
    qVerificaDadosCodigoNM1_ALE: TStringField;
    qGeraDadosCOD_ALE: TIntegerField;
    qGeraDadosNM1_ALE: TStringField;
    qGeraDadosNM2_ALE: TStringField;
    qGeraDadosNM3_ALE: TStringField;
    qGeraDadosNM4_ALE: TStringField;
    qGeraDadosMAR_ALE: TStringField;
    qGeraDadosAL1_ALE: TStringField;
    qGeraDadosAL2_ALE: TStringField;
    qGeraDadosORD_ALE: TIntegerField;
    qVerificaCasoIncluso: TADOQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    IntegerField2: TIntegerField;
    qExcluirCaso: TADOQuery;
    IntegerField3: TIntegerField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    IntegerField4: TIntegerField;
    qDadosRepeticaoAlelos: TADOQuery;
    qDadosRepeticaoAlelosCOD_ALE: TIntegerField;
    qDadosRepeticaoAlelosNM1_ALE: TStringField;
    qDadosRepeticaoAlelosNM2_ALE: TStringField;
    qDadosRepeticaoAlelosNM3_ALE: TStringField;
    qDadosRepeticaoAlelosNM4_ALE: TStringField;
    qDadosRepeticaoAlelosMAR_ALE: TStringField;
    qDadosRepeticaoAlelosAL1_ALE: TStringField;
    qDadosRepeticaoAlelosAL2_ALE: TStringField;
    qDadosRepeticaoAlelosORD_ALE: TIntegerField;
    qTipoPessoas: TADOQuery;
    qTipoPessoasNM2_ALE: TStringField;
    qSelecionaPessoa: TADOQuery;
    qSelecionaPessoaCOD_ALE: TIntegerField;
    qSelecionaPessoaNM1_ALE: TStringField;
    qSelecionaPessoaNM2_ALE: TStringField;
    qSelecionaPessoaNM3_ALE: TStringField;
    qSelecionaPessoaNM4_ALE: TStringField;
    qSelecionaPessoaMAR_ALE: TStringField;
    qSelecionaPessoaAL1_ALE: TStringField;
    qSelecionaPessoaAL2_ALE: TStringField;
    qSelecionaPessoaORD_ALE: TIntegerField;
    qContador: TADOQuery;
    qContadorCONTADOR: TIntegerField;
    qContadorCODIGO: TIntegerField;
    ds_Contador: TDataSource;
    qLimpaContadorAlelos: TADOQuery;
    qTeste: TADOQuery;
    qTesteCONTADOR: TIntegerField;
    qTesteCODIGO: TIntegerField;
    sp_BuscaAlelos: TADOStoredProc;
    sp_BuscaAlelosMENSAGEM: TStringField;
    qSelecionaSituacaoPessoa: TADOQuery;
    qSelecionaSituacaoPessoaNM2_ALE: TStringField;
    DS_SelecionaSituacaoPessoa: TDataSource;
    RG_Tipo: TRadioGroup;
    procedure btnOrigemClick(Sender: TObject);
    procedure edtTelResKeyPress(Sender: TObject; var Key: Char);
    procedure sbImportarClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    function  VerificaDados: String;
    function  VerificaRepeticaoAlelos(Valor : String): String;
    function  DuplicacaoAlelos: String;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImportaAlelos: TfImportaAlelos;
  excel :variant;
  MesGerando, NomePlanilha, NumeroCaso : String;
  Linha, NumeroSheets, i, NumeroCasoVerificacao : Integer;


implementation

uses ufuncoes, Math, ufDM, ufDMR;

{$R *.dfm}

procedure TfImportaAlelos.btnOrigemClick(Sender: TObject);
begin
  if opndlgOrigem.Execute then
     edtOrigem.Text := opndlgOrigem.FileName;
end;

procedure TfImportaAlelos.edtTelResKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
     key := #0;
end;

procedure TfImportaAlelos.sbImportarClick(Sender: TObject);
var
  Arq : TextFile;
  ArqOrigem, Linha, Verificou: String;
  vlCOD_ARQ, vlNM1_ARQ, vlNM2_ARQ, vlNM3_ARQ, vlNM4_ARQ, vlMAR_ARQ, vlAL1_ARQ, vlAL2_ARQ  : String;
  str : TStringList;
  Contador : Integer;
begin

// Identifiler
if (RG_Tipo.ItemIndex = 0)
then begin
        qInsereDados.Open;
        if (Trim(edtOrigem.Text) <> '') and
          (FileExists(Trim(edtOrigem.Text))) then
          begin
             str := TStringList.Create;
             str.Delimiter := ',';

             ArqOrigem := Trim(edtOrigem.Text);
             AssignFile(Arq,ArqOrigem);
             Reset(Arq);

             while not Eof(Arq) do
               begin
                 Try
                   Readln(Arq,Linha);
                   str.DelimitedText := Linha;
                   vlNM1_ARQ := str[0];
                   if not (vlNM1_ARQ = 'CONTROLE')
                   then begin
                         if not ((vlNM1_ARQ = 'Identifiler') or (vlNM1_ARQ = 'IDENTIFILER'))
                         then begin
                               if not (vlNM1_ARQ = 'Sample')
                               then begin
                                     vlNM2_ARQ := str[1];
                                     vlNM3_ARQ := str[2];
                                     vlNM4_ARQ := str[3];
                                     vlMAR_ARQ := str[4];
                                     vlAL1_ARQ := str[5];
                                     vlAL2_ARQ := str[6];
                                     NumeroCaso                 := vlNM1_ARQ;
                                     NumeroCasoVerificacao      := 0;
                                     NumeroCasoVerificacao      := StrToInt(vlNM1_ARQ);

                                     qVerificaCasoIncluso.Close;
                                     qVerificaCasoIncluso.Parameters.ParamByName('Numero').Value := NumeroCaso;
                                     qVerificaCasoIncluso.Open;
                                     if (qVerificaCasoIncluso.RecordCount >= 1) and (Verificou = '')
                                     then begin
                                           Verificou := 'Sim';
                                           Showmessage('             :::::::::::::::::::::::::::::::::::: ATENÇÃO :::::::::::::::::::::::::::::::::::' + #13 + #13 + 'Caso já existe Cadastrado na Base de Dados.' + #13 + 'Pressione OK para exlcuir as informações gravadas e reinicie o processo de importação!' + #13 + #13 + 'Qualquer dúvida falar com Raphael (Ramal 0044)!');
                                           qExcluirCaso.Close;
                                           qExcluirCaso.Parameters.ParamByName('Numero').Value := NumeroCaso;
                                           qExcluirCaso.ExecSQL;
                                           Abort;
                                          end else begin
                                                     Verificou := 'Não';
                                                     qInsereDados.Append;
                                                     qInsereDadosNM1_ALE.Value  := vlNM1_ARQ;
                                                     qInsereDadosNM2_ALE.Value  := vlNM2_ARQ;
                                                     qInsereDadosNM3_ALE.Value  := vlNM3_ARQ;
                                                     qInsereDadosNM4_ALE.Value  := vlNM4_ARQ;
                                                     qInsereDadosMAR_ALE.Value  := vlMAR_ARQ;
                                                     if (vlMAR_ARQ = 'D8S1179')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 1;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D21S11')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 2;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D7S820')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 3;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'CSF1PO')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 4;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D3S1358')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 5;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'TH01')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 6;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D13S317')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 7;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D16S539')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 8;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D2S1338')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 9;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D19S433')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 10;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'vWA')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 11;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'TPOX')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 12;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D18S51')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 13;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'AMEL')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 14;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D5S818')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 15;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'FGA')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 16;
                                                          end;

                                                     qInsereDadosAL1_ALE.Value  := vlAL1_ARQ;
                                                     if vlAL2_ARQ <> ''
                                                     then begin
                                                           qInsereDadosAL2_ALE.Value  := vlAL2_ARQ;
                                                          end else qInsereDadosAL2_ALE.Value  := vlAL1_ARQ;
                                                     qInsereDados.Post;
                                                   end;
                                    end;
                              end;
                        end;
                 Except
                   Showmessage(':::::ATENÇÃO:::::' + #13 + 'Ação cancelada. Pressione OK para continuar!');
                   Verificou := '';
                   Abort;
                 end;
               end;
             CloseFile(Arq);
             Showmessage('Registros IMPORTADOS com Sucesso!' + #13 + 'As informações serão verificadas. Pressione OK para continuar!');
             Verificou := '';

             DuplicacaoAlelos;

             VerificaDados;

             Showmessage('Processo finalizados com sucesso!' + #13 + 'Pressione OK para continuar, para importar outro caso!');
             edtOrigem.Clear;
             qInsereDados.Close;
             edtOrigem.SetFocus;

          end
        else
          Showmessage('Arquivo Inexistente!');
        // Identifiler - FIM
     end;

// Fusion
if (RG_Tipo.ItemIndex = 1)
then begin
        Contador := 0;
        qInsereDados.Open;
        if (Trim(edtOrigem.Text) <> '') and
          (FileExists(Trim(edtOrigem.Text))) then
          begin
             str := TStringList.Create;
             str.Delimiter := ',';

             ArqOrigem := Trim(edtOrigem.Text);
             AssignFile(Arq,ArqOrigem);
             Reset(Arq);

             while not Eof(Arq) do
               begin
                 Try
                   Readln(Arq,Linha);
                   str.DelimitedText := Linha;
                   vlNM1_ARQ := str[0];
                   if not (vlNM1_ARQ = 'CONTROLE')
                   then begin
                         if not ((vlNM1_ARQ = 'fusion') or (vlNM1_ARQ = 'FUSION') or (vlNM1_ARQ = 'LADDER') or (vlNM1_ARQ = 'Ladder'))
                         then begin
                               if not (vlNM1_ARQ = 'Sample')
                               then begin
                                     vlNM2_ARQ := str[1];
                                     vlNM3_ARQ := str[2];
                                     vlNM4_ARQ := str[3];
                                     vlAL1_ARQ := str[4];
                                     vlAL2_ARQ := str[5];
                                     vlAL2_ARQ := str[6];

                                     NumeroCaso                 := vlNM1_ARQ;
                                     NumeroCasoVerificacao      := 0;
                                     NumeroCasoVerificacao      := StrToInt(vlNM1_ARQ);

                                     qVerificaCasoIncluso.Close;
                                     qVerificaCasoIncluso.Parameters.ParamByName('Numero').Value := NumeroCaso;
                                     qVerificaCasoIncluso.Open;
                                     if (qVerificaCasoIncluso.RecordCount >= 1) and (Verificou = '')
                                     then begin
                                           Verificou := 'Sim';
                                           Showmessage('             :::::::::::::::::::::::::::::::::::: ATENÇÃO :::::::::::::::::::::::::::::::::::' + #13 + #13 + 'Caso já existe Cadastrado na Base de Dados.' + #13 + 'Pressione OK para exlcuir as informações gravadas e reinicie o processo de importação!' + #13 + #13 + 'Qualquer dúvida falar com Raphael (Ramal 0044)!');
                                           qExcluirCaso.Close;
                                           qExcluirCaso.Parameters.ParamByName('Numero').Value := NumeroCaso;
                                           qExcluirCaso.ExecSQL;
                                           Abort;
                                          end else begin
                                                     Verificou := 'Não';
                                                     qInsereDados.Append;
                                                     qInsereDadosNM1_ALE.Value  := vlNM1_ARQ;
                                                     qInsereDadosNM2_ALE.Value  := vlNM2_ARQ;
                                                     qInsereDadosNM3_ALE.Value  := vlNM3_ARQ;
                                                     qInsereDadosNM4_ALE.Value  := vlNM4_ARQ;
                                                     qInsereDadosMAR_ALE.Value  := vlMAR_ARQ;

                                                     if (vlMAR_ARQ = 'AMEL')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 1;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D3S1358')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 2;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D1S1656')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 3;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D2S441')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 4;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D10S1248')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 5;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D13S317')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 6;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'Penta_E')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 7;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D16S539')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 8;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D18S51')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 9;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D2S1338')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 10;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'CSF1PO')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 11;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'Penta_D')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 12;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'TH01')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 13;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'vWA')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 14;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D21S11')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 15;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D7S820')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 16;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D5S818')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 17;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'TPOX')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 18;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'DYS391')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 19;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D8S1179')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 20;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D12S391')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 21;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D19S433')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 22;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'FGA')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 23;
                                                          end;
                                                     if (qInsereDadosMAR_ALE.Value = 'D22S1045')
                                                     then begin
                                                           qInsereDadosORD_ALE.Value := 24;
                                                          end;

                                                     qInsereDadosAL1_ALE.Value  := vlAL1_ARQ;
                                                     if vlAL2_ARQ <> ''
                                                     then begin
                                                           qInsereDadosAL2_ALE.Value  := vlAL2_ARQ;
                                                          end else qInsereDadosAL2_ALE.Value  := vlAL1_ARQ;

                                                     if (Contador = 24)
                                                     then begin
                                                           Contador := 1;
                                                          end else Contador := qInsereDadosORD_ALE.Value;

                                                     qInsereDados.Post;
                                                   end;
                                    end;
                              end;
                        end;
                 Except
                   Showmessage(':::::ATENÇÃO:::::' + #13 + 'Ação cancelada. Pressione OK para continuar!');
                   Verificou := '';
                   Abort;
                 end;
               end;
             CloseFile(Arq);
             Showmessage('Registros IMPORTADOS com Sucesso!' + #13 + 'As informações serão verificadas. Pressione OK para continuar!');
             Verificou := '';

             DuplicacaoAlelos;

             VerificaDados;

             Showmessage('Processo finalizados com sucesso!' + #13 + 'Pressione OK para continuar, para importar outro caso!');
             edtOrigem.Clear;
             qInsereDados.Close;
             edtOrigem.SetFocus;

          end
        else
          Showmessage('Arquivo Inexistente!');
        // Fusion - FIM
     end;



end;

procedure TfImportaAlelos.sbFecharClick(Sender: TObject);
begin
 Close;
end;

function TfImportaAlelos.VerificaDados;
var valor : String;
begin
qVerificaDadosCodigo.Close;
qVerificaDadosCodigo.Parameters.ParamByName('Numero').Value := NumeroCaso;
qVerificaDadosCodigo.Open;
valor := qVerificaDadosCodigoNM1_ALE.Value;
if (qVerificaDadosCodigo.RecordCount <> 1)
then begin
      ShowMessage('                                                      :::::ATENÇÃO::::::' + #13 + #13 + 'Informações INCORRETAS. Encontrado "CÓDIGOS DIFERENTES". Por favor confira os Dados!');
     end else begin
               qVerificaDados.Close;
               qVerificaDados.SQL.Clear;
               qVerificaDados.SQL.Add('select a.al1_ale from TB_ALELOS a ');
               qVerificaDados.SQL.Add(' where a.NM1_ALE = :Numero ');
               qVerificaDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
               qVerificaDados.Open;
               if qVerificaDados.Locate('AL1_ALE', 'OL', []) = True
               then begin
                     ShowMessage('                                                      :::::ATENÇÃO::::::' + #13 + #13 + 'Informações INCORRETAS. Encontrado valor "OL" nos alelos. Por favor confira os Dados!');
                    end else begin
                              qVerificaDados.Close;
                              qVerificaDados.SQL.Clear;
                              qVerificaDados.SQL.Add('select a.al2_ale from TB_ALELOS a ');
                              qVerificaDados.SQL.Add(' where a.NM1_ALE = :Numero ');
                              qVerificaDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
                              qVerificaDados.Open;
                              if qVerificaDados.Locate('AL2_ALE', 'OL', []) = True
                              then begin
                                    ShowMessage('                                                      :::::ATENÇÃO::::::' + #13 + #13 + 'Informações INCORRETAS. Encontrado valor "OL" nos alelos. Por favor confira os Dados!');
                                   end else begin
                                             ShowMessage('Dados verificados. Informações CORRETAS!');
                                            end;

                            end;
              end;
end;


function TfImportaAlelos.VerificaRepeticaoAlelos(Valor : String): String;
begin

qTipoPessoas.Close;
qTipoPessoas.Parameters.ParamByName('Numero').Value := NumeroCasoVerificacao;
qTipoPessoas.Open;

qTipoPessoas.First;
while qTipoPessoas.Eof = False do
begin

    qDadosRepeticaoAlelos.Close;
    qDadosRepeticaoAlelos.Parameters.ParamByName('Pessoa').Value := qTipoPessoasNM2_ALE.Value;
    qDadosRepeticaoAlelos.Parameters.ParamByName('Numero').Value := NumeroCasoVerificacao;
    qDadosRepeticaoAlelos.Open;

    qDadosRepeticaoAlelos.First;
    while qDadosRepeticaoAlelos.Eof = False do
    begin
     if qDadosRepeticaoAlelos.Locate('MAR_ALE', 'FGA', []) = True
     then begin
           DMR.qFGA.Close;
           DMR.qFGA.Parameters.ParamByName('Valor1').Value := qDadosRepeticaoAlelosAL1_ALE.Value;
           DMR.qFGA.Parameters.ParamByName('Valor2').Value := qDadosRepeticaoAlelosAL2_ALE.Value;
           DMR.qFGA.Open;
          end;

     if qDadosRepeticaoAlelos.Locate('MAR_ALE', 'D21S11', []) = True
     then begin
           DMR.qD21S11.Close;
           DMR.qD21S11.Parameters.ParamByName('Valor1').Value := qDadosRepeticaoAlelosAL1_ALE.Value;
           DMR.qD21S11.Parameters.ParamByName('Valor2').Value := qDadosRepeticaoAlelosAL2_ALE.Value;
           DMR.qD21S11.Open;
          end;

     if qDadosRepeticaoAlelos.Locate('MAR_ALE', 'D2S1338', []) = True
     then begin
           DMR.qD2S1338.Close;
           DMR.qD2S1338.Parameters.ParamByName('Valor1').Value := qDadosRepeticaoAlelosAL1_ALE.Value;
           DMR.qD2S1338.Parameters.ParamByName('Valor2').Value := qDadosRepeticaoAlelosAL2_ALE.Value;
           DMR.qD2S1338.Open;
          end;
   end;
end;
end;

function TfImportaAlelos.DuplicacaoAlelos;
var Valor : Integer;
begin
// Identifiler
if (RG_Tipo.ItemIndex = 0)
then begin
        qSelecionaSituacaoPessoa.Close;
        qSelecionaSituacaoPessoa.Parameters.ParamByName('Codigo').Value := NumeroCaso;
        qSelecionaSituacaoPessoa.Open;

        qSelecionaSituacaoPessoa.First;
        while qSelecionaSituacaoPessoa.Eof = False do
        begin
          qSelecionaPessoa.Close;
          qSelecionaPessoa.Parameters.ParamByName('Pessoa').Value := qSelecionaSituacaoPessoaNM2_ALE.Value;
          qSelecionaPessoa.Parameters.ParamByName('Numero').Value := NumeroCaso;
          qSelecionaPessoa.Open;

          if qSelecionaPessoa.Locate('MAR_ALE', 'FGA', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'FGA';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;


          if qSelecionaPessoa.Locate('MAR_ALE', 'D8S1179', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D8S1179';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D21S11', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D21S11';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D7S820', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D7S820';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'CSF1PO', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'CSF1PO';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D3S1358', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D3S1358';
                sp_BuscaAlelos.Open;
               end;

                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'TH01', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'TH01';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D13S317', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D13S317';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D16S539', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D16S539';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D2S1338', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D2S1338';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D19S433', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D19S433';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'vWA', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'vWA';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'TPOX', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'TPOX';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D18S51', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D18S51';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'AMEL', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'AMEL';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D5S818', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D5S818';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

                //Verificador de Quantidade de Códigos Encontrados (SE >=16  = ENCONTRADO ALELOS DUPLICADOS)
                qContador.Close;
                qContador.Parameters.ParamByName('CodigoCaso').Value := NumeroCaso;
                qContador.Open;

                if qContador.Locate('CONTADOR', 16, []) = True
         //          if (qContadorCONTADOR.Value >= 16)
                  then begin
                      ShowMessage('Alelos Duplicados do ' + qSelecionaPessoaNM2_ALE.Value);
                      ShowMessage('::::::::::::::::::::::::::::: ATENÇÃO :::::::::::::::::::::::::::::' + #13+ 'Foram encontrados ALELOS IGUAIS nesse Caso.' + #13 + ' Utilize a tela de Consulta de Alelos Duplicados para analisar com mais precisão. ');
                     end;
                with qLimpaContadorAlelos do
                begin
                Close;
                SQL.Clear;
                SQL.Add(' delete from tb_CONTAALELO ');
                ExecSQL;
                end;

        qSelecionaSituacaoPessoa.Next;
        end;
        qContador.Close;
        // Identifiler - FIM
end;

// Fusion
if (RG_Tipo.ItemIndex = 1)
then begin
        qSelecionaSituacaoPessoa.Close;
        qSelecionaSituacaoPessoa.Parameters.ParamByName('Codigo').Value := NumeroCaso;
        qSelecionaSituacaoPessoa.Open;

        qSelecionaSituacaoPessoa.First;
        while qSelecionaSituacaoPessoa.Eof = False do
        begin
          qSelecionaPessoa.Close;
          qSelecionaPessoa.Parameters.ParamByName('Pessoa').Value := qSelecionaSituacaoPessoaNM2_ALE.Value;
          qSelecionaPessoa.Parameters.ParamByName('Numero').Value := NumeroCaso;
          qSelecionaPessoa.Open;

          if qSelecionaPessoa.Locate('MAR_ALE', 'AMEL', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'AMEL';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;


          if qSelecionaPessoa.Locate('MAR_ALE', 'D3S1358', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D3S1358';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D1S1656', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D1S1656';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D2S441', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D2S441';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D10S1248', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D10S1248';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D13S317', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D13S317';
                sp_BuscaAlelos.Open;
               end;

                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'Penta E', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'Penta E';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D16S539', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D16S539';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D18S51', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D18S51';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D2S1338', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D2S1338';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'CSF1PO', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'CSF1PO';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'Penta D', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'Penta D';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'TH01', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'TH01';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'vWA', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'vWA';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D21S11', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D21S11';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D7S820', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D7S820';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D5S818', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D5S818';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'TPOX', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'TPOX';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;
          if qSelecionaPessoa.Locate('MAR_ALE', 'DYS391', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'DYS391';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D8S1179', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D8S1179';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D12S391', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D12S391';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

           if qSelecionaPessoa.Locate('MAR_ALE', 'D19S433', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D19S433';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'FGA', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'FGA';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D22S1045', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D22S1045';
                sp_BuscaAlelos.Open;
               end;
                qTeste.Close;
                qTeste.Open;
                qTeste.RecordCount;
                Valor := 0;
                Valor := qTesteCONTADOR.Value;


                //Verificador de Quantidade de Códigos Encontrados (SE >=24  = ENCONTRADO ALELOS DUPLICADOS)
                qContador.Close;
                qContador.Parameters.ParamByName('CodigoCaso').Value := NumeroCaso;
                qContador.Open;

                if qContador.Locate('CONTADOR', 24, []) = True
                  then begin
                      ShowMessage('Alelos Duplicados do ' + qSelecionaPessoaNM2_ALE.Value);
                      ShowMessage('::::::::::::::::::::::::::::: ATENÇÃO :::::::::::::::::::::::::::::' + #13+ 'Foram encontrados ALELOS IGUAIS nesse Caso.' + #13 + ' Utilize a tela de Consulta de Alelos Duplicados para analisar com mais precisão. ');
                     end;
                with qLimpaContadorAlelos do
                begin
                Close;
                SQL.Clear;
                SQL.Add(' delete from tb_CONTAALELO ');
                ExecSQL;
                end;

        qSelecionaSituacaoPessoa.Next;
        end;
        qContador.Close;
        // Fusion - FIM
     end;
end;


end.
