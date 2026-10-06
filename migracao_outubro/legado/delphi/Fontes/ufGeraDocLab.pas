unit ufGeraDocLab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, StdCtrls, DB, SqlExpr, Grids, DBGrids,
  ComObj, Buttons, ADODB,
  ExtCtrls, ComCtrls;

type
  TfAlelos = class(TForm)
    gbxImport: TGroupBox;
    lbOrigem: TLabel;
    edtOrigem: TEdit;
    btnOrigem: TSpeedButton;
    opndlgOrigem: TOpenDialog;
    qInsereDados: TADOQuery;
    DS_InsereDados: TDataSource;
    DBGrid1: TDBGrid;
    sbProcessamento: TSpeedButton;
    sbFechar: TSpeedButton;
    qVerificaDados: TADOQuery;
    qGeraDados: TADOQuery;
    RG_TipoCasaIdentifiler: TRadioGroup;
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
    qSelecionaSituacaoPessoa: TADOQuery;
    qSelecionaSituacaoPessoaNM2_ALE: TStringField;
    DS_SelecionaSituacaoPessoa: TDataSource;
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
    sp_BuscaAlelos: TADOStoredProc;
    sp_BuscaAlelosMENSAGEM: TStringField;
    RG_Tipo: TRadioGroup;
    CheckBox2: TCheckBox;
    CheckBox1: TCheckBox;
    RG_TipoCasaFusion: TRadioGroup;
    CB_BH: TCheckBox;
    qGuardaAlelos: TADOQuery;
    IntegerField5: TIntegerField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    IntegerField6: TIntegerField;
    procedure btnOrigemClick(Sender: TObject);
    procedure edtTelResKeyPress(Sender: TObject; var Key: Char);
    procedure sbProcessamentoClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    function  VerificaDados: String;
    function  ExportaDados: String;
    function  ExportaCasos1: String;
    function  ExportaCasos2: String;
    function  ExportaCasos1_Fusion: String;
    function  ExportaCasos2_Fusion: String;
    function  ExportaCasos3_Fusion: String;
    function  ExportaCasos3: String;
    function  ExportaCasos1_2C: String;
    function  ExportaCasos2_2C: String;
    function  VerificaRepeticaoAlelos(Valor : String): String;
    function  DuplicacaoAlelos: String;
    procedure RG_TipoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAlelos: TfAlelos;
  excel :variant;
  MesGerando, NomePlanilha, NumeroCaso : String;
  Linha, NumeroSheets, i, NumeroCasoVerificacao : Integer;


implementation

uses ufuncoes, Math, ufDM, ufDMR;

{$R *.dfm}

procedure TfAlelos.btnOrigemClick(Sender: TObject);
begin
  if opndlgOrigem.Execute then
     edtOrigem.Text := opndlgOrigem.FileName;
end;

procedure TfAlelos.edtTelResKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
     key := #0;
end;

procedure TfAlelos.sbProcessamentoClick(Sender: TObject);
var
  Arq : TextFile;
  ArqOrigem, Linha, Verificou: String;
  vlCOD_ARQ, vlNM1_ARQ, vlNM2_ARQ, vlNM3_ARQ, vlNM4_ARQ, vlMAR_ARQ, vlAL1_ARQ, vlAL2_ARQ  : String;
  str : TStringList;
  Contador : Integer;
begin
if (RG_Tipo.ItemIndex =  0) and (RG_TipoCasaIdentifiler.ItemIndex = -1)
then begin
      Showmessage('Informe o Tipo de Caso para Importação dos Dados!');
     end else begin
                // Identifiler
                if (RG_Tipo.ItemIndex = 0)
                then begin
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
                                                             Showmessage('             :::::::::::::::::::::::::::::::::::: ATENÇÃO :::::::::::::::::::::::::::::::::::' + #13 + #13 + 'Caso já existe Cadastrado na Base de Dados.' + #13 + 'Pressione OK para excluir as informações gravadas e reinicie o processo de importação!' + #13 + #13 + 'Qualquer dúvida falar com Raphael (Ramal 0044)!');
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

                                                                       if (((qInsereDadosNM2_ALE.Value = 'MA1') or (qInsereDadosNM2_ALE.Value = 'SP1')) and (qInsereDadosMAR_ALE.Value = 'AMEL'))
                                                                       then begin
                                                                             if (qInsereDadosNM2_ALE.Value = 'SP1')
                                                                             then begin
                                                                                   qInsereDadosAL1_ALE.Value  := 'X';
                                                                                   qInsereDadosAL2_ALE.Value  := 'Y';
                                                                                  end;
                                                                             if (qInsereDadosNM2_ALE.Value = 'MA1')
                                                                             then begin
                                                                                   qInsereDadosAL1_ALE.Value  := 'X';
                                                                                   qInsereDadosAL2_ALE.Value  := 'X';
                                                                                  end;
                                                                            end else begin
                                                                                      qInsereDadosAL1_ALE.Value  := vlAL1_ARQ;
                                                                                      if vlAL2_ARQ <> ''
                                                                                      then begin
                                                                                            qInsereDadosAL2_ALE.Value  := vlAL2_ARQ;
                                                                                           end else qInsereDadosAL2_ALE.Value  := vlAL1_ARQ;
                                                                                     end;
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
                               Showmessage('Registros IMPORTADOS com Sucesso!');
                               Verificou := '';

                               DuplicacaoAlelos;

                               VerificaDados;

                            end
                          else
                            Showmessage('Arquivo Inexistente!');
                  // Identifiler - FIM
                end;
              end;

if (RG_Tipo.ItemIndex =  1) and (RG_TipoCasaFusion.ItemIndex = -1)
then begin
      Showmessage('Informe o Tipo de Caso para Importação dos Dados!');
     end else begin
              // Fusion
              if (RG_Tipo.ItemIndex = 1)
              then begin
                      Contador := 0;
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
end;

procedure TfAlelos.sbFecharClick(Sender: TObject);
begin
 Close;
end;

function TfAlelos.VerificaDados;
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
                                             ExportaDados;
                                            end;

                            end;
              end;
end;

function TfAlelos.ExportaDados;
begin

// Identifiler
if (RG_Tipo.ItemIndex = 0)
then begin
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR2';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;

      if (qGeraDados.RecordCount > 0)
      then begin
            try
             if RG_TipoCasaIdentifiler.ItemIndex = 0
             then begin
                    ExportaCasos1_2C;
                  end else begin
                            if RG_TipoCasaIdentifiler.ItemIndex = 1
                            then begin
                                  ExportaCasos2_2C;
                                 end else Showmessage('Sistema não preparado para essa Situação');
                           end;
            except
            Showmessage(':::::ATENÇÃO::::::' + #13 + 'Dados NÃO FORAM EXPORTADOS. Verifique dos Dados!');
           end;
           end else begin
                     try
                      excel := CreateOleObject('Excel.Application');
                      if not Excel.Application.Visible then
                      if RG_TipoCasaIdentifiler.ItemIndex = 0
                      then begin
                             ExportaCasos1;
                           end else begin
                                     if RG_TipoCasaIdentifiler.ItemIndex = 1
                                     then begin
                                           ExportaCasos2
                                          end else ExportaCasos3;
                                    end;
                      Showmessage('Os dados foram EXPORTADOS corretamente.' + #13 + 'Ver o arquivo Excel na Pasta "U:\CPG\SCPG\Documentos_Gerados\Planilhas_Geradas\"');
                      Excel.Application.Visible := true;
                      Excel.ActiveWorkBook.SaveAs(NomePlanilha);
                      Excel.quit;
                      Excel:=unassigned;
                      NumeroCaso := '';
                     except
                      Showmessage(':::::ATENÇÃO::::::' + #13 + 'Dados NÃO FORAM EXPORTADOS. Verifique dos Dados!');
                      NumeroCaso := '';
                     end;
                    end;
    end;

// Fusion
if (RG_Tipo.ItemIndex = 1)
then begin
       try
        excel := CreateOleObject('Excel.Application');
        if not Excel.Application.Visible then
        if RG_TipoCasaFusion.ItemIndex = 0
        then begin
               ExportaCasos1_Fusion;
             end else begin
                       if RG_TipoCasaFusion.ItemIndex = 1
                       then begin
                             ExportaCasos2_Fusion;
                            end else ExportaCasos3_Fusion;
                      end;
        Showmessage('Os dados foram EXPORTADOS corretamente.' + #13 + 'Ver o arquivo Excel na Pasta "U:\CPG\SCPG\Documentos_Gerados\Planilhas_Geradas\"');
        Excel.Application.Visible := true;
        Excel.ActiveWorkBook.SaveAs(NomePlanilha);
        Excel.quit;
        Excel:=unassigned;
        NumeroCaso := '';
       except
        Showmessage(':::::ATENÇÃO::::::' + #13 + 'Dados NÃO FORAM EXPORTADOS. Verifique dos Dados!');
        NumeroCaso := '';
       end;
    end;

end;


function TfAlelos.ExportaCasos1_Fusion;
begin
if (RG_TipoCasaFusion.ItemIndex = 0) and (CB_BH.Checked = False) //BH
then begin
        //criança = Coluna 4 e 5 e Linha 4 a 19
        excel := CreateOleObject('Excel.Application');
        if not Excel.Application.Visible then
        Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT01_FUSION_GERAL.xlsx');
//        Excel.WorkBooks.Open('C:\SCPG\Modelos\Planilhas\CT01_FUSION_GERAL.xlsx');
        //mae     = Coluna 2 e 3 e Linha 4 a 19
        NumeroSheets := 5;
        Linha := 4;
        qGeraDados.Close;
        qGeraDados.Parameters.ParamByName('Pessoa').Value := 'MA1';
        qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
        qGeraDados.Open;
        qGeraDados.First;
          while not qGeraDados.Eof do
          begin
          Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2] := qGeraDadosAL1_ALE.Value;
          Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3] := qGeraDadosAL2_ALE.Value;

          Linha:=Linha+1;
          qGeraDados.Next;
          end;
        NumeroSheets := 5;
        Linha := 4;
        qGeraDados.Close;
        qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR1';
        qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
        qGeraDados.Open;
        qGeraDados.First;
          while not qGeraDados.Eof do
          begin
          Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
          Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;

          Linha:=Linha+1;
          qGeraDados.Next;
          end;
        //supai   = Coluna 6 e 7 e Linha 4 a 19
        NumeroSheets := 5;
        Linha := 4;
        qGeraDados.Close;
        qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
        qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
        qGeraDados.Open;
        qGeraDados.First;
          while not qGeraDados.Eof do
          begin
          Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
          Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;

          Linha:=Linha+1;
          qGeraDados.Next;
          end;
    end;

if (RG_TipoCasaFusion.ItemIndex = 0) and (CB_BH.Checked = True) //BH
then begin
      //criança = Coluna 4 e 5 e Linha 4 a 19
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT01_BH.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
      //mae     = Coluna 2 e 3 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'MA1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
      //supai   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
      while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
   end;

Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[1,2] := qGeraDadosNM1_ALE.Value;
NomePlanilha := 'U:\CPG\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value;
//NomePlanilha := 'C:\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value;

end;

function TfAlelos.ExportaCasos2_Fusion;
begin
if (RG_TipoCasaFusion.ItemIndex = 1) and (CB_BH.Checked = False) //Geral
then begin
      //criança = Coluna 4 e 5 e Linha 4 a 19
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT02_FUSION_GERAL.xls');
        //  Excel.WorkBooks.Open('C:\SCPG\Modelos\Planilhas\CT02_FUSION_GERAL.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //supai   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
    end;

if (RG_TipoCasaFusion.ItemIndex = 1) and (CB_BH.Checked = True) //BH
then begin
      //criança = Coluna 4 e 5 e Linha 4 a 19
//      Excel.WorkBooks.Open('C:\SCPG\Modelos\Planilhas\CT02_MANAUS.xls');
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT02_BH.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //supai   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
    end;


Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[1,2] := qGeraDadosNM1_ALE.Value;
NomePlanilha := 'U:\CPG\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value;
//NomePlanilha := 'C:\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value;
end;


function TfAlelos.ExportaCasos3_Fusion;
begin
if (RG_TipoCasaFusion.ItemIndex = 2) and (CB_BH.Checked = False) //Geral
then begin
      //criança = Coluna 4 e 5 e Linha 4 a 19
//       Excel.WorkBooks.Open('C:\SCPG\Modelos\Planilhas\CT03_FUSION_GERAL.xlsx');
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT03_FUSION_GERAL.xlsx');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //mae     = Coluna 2 e 3 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'MA1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //avô   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'AGF';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
      while not qGeraDados.Eof do
      begin
      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;

      Linha:=Linha+1;
      qGeraDados.Next;
      end;

      //avó   = Coluna 8 e 9 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'AGM';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,8] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,9] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
    end;

if (RG_TipoCasaFusion.ItemIndex = 2) and (CB_BH.Checked = True) //Geral
then begin
      //criança = Coluna 4 e 5 e Linha 4 a 19
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT03_BH.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
      //mae     = Coluna 2 e 3 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'MA1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
      //avô   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'AGF';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //avó   = Coluna 8 e 9 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'AGM';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,8] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,9] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
    end;



Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[1,2] := qGeraDadosNM1_ALE.Value;
NomePlanilha := 'U:\CPG\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value;
//NomePlanilha := 'C:\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value;

end;



function TfAlelos.ExportaCasos1;
begin
if (RG_TipoCasaIdentifiler.ItemIndex = 0)  and (CheckBox1.Checked = False) and (CheckBox2.Checked = False) //Geral
then begin
        //criança = Coluna 4 e 5 e Linha 4 a 19
        excel := CreateOleObject('Excel.Application');
        if not Excel.Application.Visible then
        Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT01_GERAL.xls');
//        Excel.WorkBooks.Open('C:\SCPG\Modelos\Planilhas\CT01_GERAL.xls');
        NumeroSheets := 1;
        Linha := 4;
        qGeraDados.Close;
        qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR1';
        qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
        qGeraDados.Open;
        qGeraDados.First;
          while not qGeraDados.Eof do
          begin
          Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
          Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;

          Linha:=Linha+1;
          qGeraDados.Next;
          end;
        //mae     = Coluna 2 e 3 e Linha 4 a 19
        NumeroSheets := 1;
        Linha := 4;
        qGeraDados.Close;
        qGeraDados.Parameters.ParamByName('Pessoa').Value := 'MA1';
        qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
        qGeraDados.Open;
        qGeraDados.First;
          while not qGeraDados.Eof do
          begin
          Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2] := qGeraDadosAL1_ALE.Value;
          Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3] := qGeraDadosAL2_ALE.Value;

          Linha:=Linha+1;
          qGeraDados.Next;
          end;
        //supai   = Coluna 6 e 7 e Linha 4 a 19
        NumeroSheets := 1;
        Linha := 4;
        qGeraDados.Close;
        qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
        qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
        qGeraDados.Open;
        qGeraDados.First;
          while not qGeraDados.Eof do
          begin
          Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
          Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;

          Linha:=Linha+1;
          qGeraDados.Next;
          end;
    end;

if (RG_TipoCasaIdentifiler.ItemIndex = 0) and (CheckBox1.Checked = True) and (CheckBox2.Checked = False) //Rui
then begin
      //criança = Coluna 4 e 5 e Linha 4 a 19
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT01_RUI.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
      //mae     = Coluna 2 e 3 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'MA1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
      //supai   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
      while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
   end;

if (RG_TipoCasaIdentifiler.ItemIndex = 0) and (CheckBox1.Checked = False) and (CheckBox2.Checked = True) //Manaus
then begin
      //criança = Coluna 4 e 5 e Linha 4 a 19
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT01_MANAUS.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
      //mae     = Coluna 2 e 3 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'MA1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
      //supai   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
      while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
   end;


Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[1,2] := qGeraDadosNM1_ALE.Value;
NomePlanilha := 'U:\CPG\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value;
//NomePlanilha := 'C:\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value;

end;

function TfAlelos.ExportaCasos2;
begin
if (RG_TipoCasaIdentifiler.ItemIndex = 1) and (CheckBox1.Checked = False) and (CheckBox2.Checked = False) //Geral
then begin
      //criança = Coluna 4 e 5 e Linha 4 a 19
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT02_GERAL.xls');
//      Excel.WorkBooks.Open('C:\SCPG\Modelos\Planilhas\CT02_GERAL.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //supai   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
    end;

if (RG_TipoCasaIdentifiler.ItemIndex = 1) and (CheckBox1.Checked = True) and (CheckBox2.Checked = False) //Rui
then begin
      //criança = Coluna 4 e 5 e Linha 4 a 19
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT02_RUI.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //supai   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
    end;

if (RG_TipoCasaIdentifiler.ItemIndex = 1) and (CheckBox1.Checked = False) and (CheckBox2.Checked = True) //Manaus
then begin
      //criança = Coluna 4 e 5 e Linha 4 a 19
//      Excel.WorkBooks.Open('C:\SCPG\Modelos\Planilhas\CT02_MANAUS.xls');
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT02_MANAUS.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //supai   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
    end;

Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[1,2] := qGeraDadosNM1_ALE.Value;
NomePlanilha := 'U:\CPG\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value;
//NomePlanilha := 'C:\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value;
end;

function TfAlelos.ExportaCasos3;
begin
if (RG_TipoCasaIdentifiler.ItemIndex = 2) and (CheckBox1.Checked = False) and (CheckBox2.Checked = False) //Geral
then begin
      //criança = Coluna 4 e 5 e Linha 4 a 19
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT03_GERAL.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //mae     = Coluna 2 e 3 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'MA1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //avô   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'AGF';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
      while not qGeraDados.Eof do
      begin
      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;

      Linha:=Linha+1;
      qGeraDados.Next;
      end;

      //avó   = Coluna 8 e 9 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'AGM';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,8] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,9] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
    end;

if (RG_TipoCasaIdentifiler.ItemIndex = 2) and (CheckBox1.Checked = True) and (CheckBox2.Checked = False) //Rui
then begin
      //criança = Coluna 4 e 5 e Linha 4 a 19
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT03_RUI.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
      //mae     = Coluna 2 e 3 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'MA1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
      //avô   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'AGF';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //avó   = Coluna 8 e 9 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'AGM';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,8] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,9] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
    end;

if (RG_TipoCasaIdentifiler.ItemIndex = 2) and (CheckBox1.Checked = False) and (CheckBox2.Checked = True) //Manaus
then begin
      //criança = Coluna 4 e 5 e Linha 4 a 19
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT03_MANAUS.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
      //mae     = Coluna 2 e 3 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'MA1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
      //avô   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'AGF';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //avó   = Coluna 8 e 9 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'AGM';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof do
        begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,8] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,9] := qGeraDadosAL2_ALE.Value;

        Linha:=Linha+1;
        qGeraDados.Next;
        end;
    end;


Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[1,2] := qGeraDadosNM1_ALE.Value;
NomePlanilha := 'U:\CPG\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value;
end;


function TfAlelos.ExportaCasos1_2C;
begin
if ((RG_TipoCasaIdentifiler.ItemIndex = 0) and (CheckBox1.Checked = False) and (CheckBox2.Checked = False)) //Geral - Criança 1
then begin
      excel := CreateOleObject('Excel.Application');
      if not Excel.Application.Visible then
      //criança = Coluna 4 e 5 e Linha 4 a 19
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT01_GERAL.xls');
//     Excel.WorkBooks.Open('C:\SCPG\Modelos\Planilhas\CT01_GERAL.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //mae     = Coluna 2 e 3 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'MA1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //supai   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;
      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[1,2] := qGeraDadosNM1_ALE.Value;
      NomePlanilha := 'U:\CPG\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value + '_CR1';
//      NomePlanilha := 'C:\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value + '_CR1';

      Showmessage('Planilha da CRIANÇA 1 foi EXPORTADA corretamente.' + #13 + 'Ver o arquivo Excel na Pasta "C:\Casos_Analisados\Planilhas\"');
      Excel.Application.Visible := true;
      Excel.ActiveWorkBook.SaveAs(NomePlanilha);
      Excel.quit;
      Excel:=unassigned;
    end;

if (RG_TipoCasaIdentifiler.ItemIndex = 0)  and (CheckBox1.Checked = False) and (CheckBox2.Checked = False) //Geral - Criança 2
then begin
      excel := CreateOleObject('Excel.Application');
      if not Excel.Application.Visible then
//      Excel.WorkBooks.Open('C:\SCPG\Modelos\Planilhas\CT01_GERAL.xls');
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT01_GERAL.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR2';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //mae     = Coluna 2 e 3 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'MA1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //supai   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;
      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[1,2] := qGeraDadosNM1_ALE.Value;
      NomePlanilha := 'U:\CPG\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value + '_CR2';
//      NomePlanilha := 'C:\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value + '_CR2';

      Showmessage('Planilha da CRIANÇA 2 foi EXPORTADA corretamente.' + #13 + 'Ver o arquivo Excel na Pasta "C:\Casos_Analisados\Planilhas\"');
      Excel.Application.Visible := true;
      Excel.ActiveWorkBook.SaveAs(NomePlanilha);
      Excel.quit;
      Excel:=unassigned;
    end;


if ((RG_TipoCasaIdentifiler.ItemIndex = 0)  and (CheckBox1.Checked = True) and (CheckBox2.Checked = False))  //Rui - Criança 1
then begin
      excel := CreateOleObject('Excel.Application');
      if not Excel.Application.Visible then
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT01_RUI.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //mae     = Coluna 2 e 3 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'MA1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //supai   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;
      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[1,2] := qGeraDadosNM1_ALE.Value;
      NomePlanilha := 'U:\CPG\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value + '_CR1_RUI';

      Showmessage('Planilha da CRIANÇA 1 - RUI foi EXPORTADA corretamente.' + #13 + 'Ver o arquivo Excel na Pasta "C:\Casos_Analisados\Planilhas\"');
      Excel.Application.Visible := true;
      Excel.ActiveWorkBook.SaveAs(NomePlanilha);
      Excel.quit;
      Excel:=unassigned;
    end;

if (RG_TipoCasaIdentifiler.ItemIndex = 0)  and (CheckBox1.Checked = True) and (CheckBox2.Checked = False)  //Rui - Criança 2
then begin
      excel := CreateOleObject('Excel.Application');
      if not Excel.Application.Visible then
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT01_RUI.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR2';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //mae     = Coluna 2 e 3 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'MA1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //supai   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;
      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[1,2] := qGeraDadosNM1_ALE.Value;
      NomePlanilha := 'U:\CPG\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value + '_CR2_RUI';

      Showmessage('Planilha da CRIANÇA 2 - RUI foi EXPORTADA corretamente.' + #13 + 'Ver o arquivo Excel na Pasta "C:\Casos_Analisados\Planilhas\"');
      Excel.Application.Visible := true;
      Excel.ActiveWorkBook.SaveAs(NomePlanilha);
      Excel.quit;
      Excel:=unassigned;
     end;

if ((RG_TipoCasaIdentifiler.ItemIndex = 0)  and (CheckBox1.Checked = False) and (CheckBox2.Checked = True))  //Manaus - Criança 1
then begin
      excel := CreateOleObject('Excel.Application');
      if not Excel.Application.Visible then
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT01_MANAUS.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //mae     = Coluna 2 e 3 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'MA1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //supai   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;
      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[1,2] := qGeraDadosNM1_ALE.Value;
      NomePlanilha := 'U:\CPG\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value + '_CR1_MANAUS';

      Showmessage('Planilha da CRIANÇA 1 - MANAUS foi EXPORTADA corretamente.' + #13 + 'Ver o arquivo Excel na Pasta "C:\Casos_Analisados\Planilhas\"');
      Excel.Application.Visible := true;
      Excel.ActiveWorkBook.SaveAs(NomePlanilha);
      Excel.quit;
      Excel:=unassigned;
    end;

if (RG_TipoCasaIdentifiler.ItemIndex = 0)  and (CheckBox1.Checked = False) and (CheckBox2.Checked = True)  //Manaus - Criança 2
then begin
      excel := CreateOleObject('Excel.Application');
      if not Excel.Application.Visible then
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT01_MANAUS.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR2';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //mae     = Coluna 2 e 3 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'MA1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //supai   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;
      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[1,2] := qGeraDadosNM1_ALE.Value;
      NomePlanilha := 'U:\CPG\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value + '_CR2_MANAUS';

      Showmessage('Planilha da CRIANÇA 2 - MANAUS foi EXPORTADA corretamente.' + #13 + 'Ver o arquivo Excel na Pasta "C:\Casos_Analisados\Planilhas\"');
      Excel.Application.Visible := true;
      Excel.ActiveWorkBook.SaveAs(NomePlanilha);
      Excel.quit;
      Excel:=unassigned;
     end;

end;


function TfAlelos.ExportaCasos2_2C;
begin
if (RG_TipoCasaIdentifiler.ItemIndex = 1) and (CheckBox1.Checked = False) and (CheckBox2.Checked = False) //Geral - Criança 1
then begin
      excel := CreateOleObject('Excel.Application');
      if not Excel.Application.Visible then
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT02_GERAL.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //supai   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;
      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[1,2] := qGeraDadosNM1_ALE.Value;
      NomePlanilha := 'U:\CPG\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value + '_CR1';

      Showmessage('Planilha da CRIANÇA 1 foi EXPORTADA corretamente.' + #13 + 'Ver o arquivo Excel na Pasta "C:\Casos_Analisados\Planilhas\"');
      Excel.Application.Visible := true;
      Excel.ActiveWorkBook.SaveAs(NomePlanilha);
      Excel.quit;
      Excel:=unassigned;
     end;

if (RG_TipoCasaIdentifiler.ItemIndex = 1) and (CheckBox1.Checked = False) and (CheckBox2.Checked = False) //Geral Criança 1
then begin
      excel := CreateOleObject('Excel.Application');
      if not Excel.Application.Visible then
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT02_GERAL.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR2';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //supai   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[1,2] := qGeraDadosNM1_ALE.Value;
      NomePlanilha := 'U:\CPG\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value + '_CR2';

      Showmessage('Planilha da CRIANÇA 2 foi EXPORTADA corretamente.' + #13 + 'Ver o arquivo Excel na Pasta "C:\Casos_Analisados\Planilhas\"');
      Excel.Application.Visible := true;
      Excel.ActiveWorkBook.SaveAs(NomePlanilha);
      Excel.quit;
      Excel:=unassigned;
     end;

if ((RG_TipoCasaIdentifiler.ItemIndex = 1) and (CheckBox1.Checked = True) and (CheckBox2.Checked = False)) //Rui - Criança 1
then begin
      excel := CreateOleObject('Excel.Application');
      if not Excel.Application.Visible then
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT02_RUI.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //supai   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[1,2] := qGeraDadosNM1_ALE.Value;
      NomePlanilha := 'U:\CPG\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value + '_CR1_RUI';

      Showmessage('Planilha da CRIANÇA 1 - RUI foi EXPORTADA corretamente.' + #13 + 'Ver o arquivo Excel na Pasta "C:\Casos_Analisados\Planilhas\"');
      Excel.Application.Visible := true;
      Excel.ActiveWorkBook.SaveAs(NomePlanilha);
      Excel.quit;
      Excel:=unassigned;
     end;

if (RG_TipoCasaIdentifiler.ItemIndex = 1) and (CheckBox1.Checked = True) and (CheckBox2.Checked = False) //Rui - Criança 2
then begin
      excel := CreateOleObject('Excel.Application');
      if not Excel.Application.Visible then
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT02_RUI.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR2';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //supai   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[1,2] := qGeraDadosNM1_ALE.Value;
      NomePlanilha := 'U:\CPG\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value + '_CR2_RUI';

      Showmessage('Planilha da CRIANÇA 2 - RUI foi EXPORTADA corretamente.' + #13 + 'Ver o arquivo Excel na Pasta "C:\Casos_Analisados\Planilhas\"');
      Excel.Application.Visible := true;
      Excel.ActiveWorkBook.SaveAs(NomePlanilha);
      Excel.quit;
      Excel:=unassigned;
     end;

if ((RG_TipoCasaIdentifiler.ItemIndex = 1) and (CheckBox1.Checked = False) and (CheckBox2.Checked = True)) //Manaus - Criança 1
then begin
      excel := CreateOleObject('Excel.Application');
      if not Excel.Application.Visible then
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT02_MANAUS.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //supai   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[1,2] := qGeraDadosNM1_ALE.Value;
      NomePlanilha := 'U:\CPG\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value + '_CR1_MANAUS';

      Showmessage('Planilha da CRIANÇA 1 - MANAUS foi EXPORTADA corretamente.' + #13 + 'Ver o arquivo Excel na Pasta "C:\Casos_Analisados\Planilhas\"');
      Excel.Application.Visible := true;
      Excel.ActiveWorkBook.SaveAs(NomePlanilha);
      Excel.quit;
      Excel:=unassigned;
     end;

if (RG_TipoCasaIdentifiler.ItemIndex = 1) and (CheckBox1.Checked = False) and (CheckBox2.Checked = True) //Manaus - Criança 2
then begin
      excel := CreateOleObject('Excel.Application');
      if not Excel.Application.Visible then
      Excel.WorkBooks.Open('U:\CPG\SCPG\Modelos\Planilhas\CT02_MANAUS.xls');
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'CR2';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      //supai   = Coluna 6 e 7 e Linha 4 a 19
      NumeroSheets := 1;
      Linha := 4;
      qGeraDados.Close;
      qGeraDados.Parameters.ParamByName('Pessoa').Value := 'SP1';
      qGeraDados.Parameters.ParamByName('Numero').Value := NumeroCaso;
      qGeraDados.Open;
      qGeraDados.First;
        while not qGeraDados.Eof
        do begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6] := qGeraDadosAL1_ALE.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7] := qGeraDadosAL2_ALE.Value;
        Linha:=Linha+1;
        qGeraDados.Next;
        end;

      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[1,2] := qGeraDadosNM1_ALE.Value;
      NomePlanilha := 'U:\CPG\SCPG\Documentos_Gerados\Planilhas_Geradas\' + qGeraDadosNM1_ALE.Value + '_CR2_MANAUS';

      Showmessage('Planilha da CRIANÇA 2 - MANAUS foi EXPORTADA corretamente.' + #13 + 'Ver o arquivo Excel na Pasta "C:\Casos_Analisados\Planilhas\"');
      Excel.Application.Visible := true;
      Excel.ActiveWorkBook.SaveAs(NomePlanilha);
      Excel.quit;
      Excel:=unassigned;
     end;

end;

function TfAlelos.VerificaRepeticaoAlelos(Valor : String): String;
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


function TfAlelos.DuplicacaoAlelos;
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

          if qSelecionaPessoa.Locate('MAR_ALE', 'D8S1179', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D8S1179';
                sp_BuscaAlelos.Open;
               end;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D21S11', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D21S11';
                sp_BuscaAlelos.Open;
               end;


          if qSelecionaPessoa.Locate('MAR_ALE', 'D7S820', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D7S820';
                sp_BuscaAlelos.Open;
               end;


          if qSelecionaPessoa.Locate('MAR_ALE', 'CSF1PO', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'CSF1PO';
                sp_BuscaAlelos.Open;
               end;


          if qSelecionaPessoa.Locate('MAR_ALE', 'D3S1358', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D3S1358';
                sp_BuscaAlelos.Open;
               end;



          if qSelecionaPessoa.Locate('MAR_ALE', 'TH01', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'TH01';
                sp_BuscaAlelos.Open;
               end;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D13S317', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D13S317';
                sp_BuscaAlelos.Open;
               end;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D16S539', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D16S539';
                sp_BuscaAlelos.Open;
               end;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D2S1338', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D2S1338';
                sp_BuscaAlelos.Open;
               end;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D19S433', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D19S433';
                sp_BuscaAlelos.Open;
               end;

          if qSelecionaPessoa.Locate('MAR_ALE', 'vWA', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'vWA';
                sp_BuscaAlelos.Open;
               end;

          if qSelecionaPessoa.Locate('MAR_ALE', 'TPOX', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'TPOX';
                sp_BuscaAlelos.Open;
               end;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D18S51', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D18S51';
                sp_BuscaAlelos.Open;
               end;

          if qSelecionaPessoa.Locate('MAR_ALE', 'AMEL', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'AMEL';
                sp_BuscaAlelos.Open;
               end;

          if qSelecionaPessoa.Locate('MAR_ALE', 'D5S818', []) = True
          then begin
                sp_BuscaAlelos.Close;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
                sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D5S818';
                sp_BuscaAlelos.Open;
               end;

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

           qSelecionaPessoa.First;
           while qSelecionaPessoa.Eof = False do
           begin
             qGuardaAlelos.Close;
             qGuardaAlelos.SQL.Clear;
             qGuardaAlelos.SQL.Add(' insert into tb_contaalelo (qtd_codigo) ');
             qGuardaAlelos.SQL.Add(' select distinct nm1_ale from tb_alelos where NM1_ALE = :Numero and al1_ale = :valormarcador1 and al2_ale = :ValorMarcador2 and mar_ale = :Marcador ');
             qGuardaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
             qGuardaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
             qGuardaAlelos.Parameters.ParamByName('MARCADOR').Value       := qSelecionaPessoaMAR_ALE.Value;
             qGuardaAlelos.Parameters.ParamByName('Numero').Value       := NumeroCaso;
             qGuardaAlelos.ExecSQL;

             qSelecionaPessoa.Next;
           end;

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

procedure TfAlelos.RG_TipoClick(Sender: TObject);
begin
if (RG_Tipo.ItemIndex = 0)
then begin
      RG_TipoCasaIdentifiler.Visible := True;
      RG_TipoCasaFusion.Visible      := False;
     end else begin
               RG_TipoCasaIdentifiler.Visible := False;
               RG_TipoCasaFusion.Visible      := True;
              end;
end;

procedure TfAlelos.FormShow(Sender: TObject);
begin
qInsereDados.Open;
end;

end.
