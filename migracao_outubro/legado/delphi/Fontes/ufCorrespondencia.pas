unit ufCorrespondencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, Buttons, ExtCtrls, DBCtrls,
  StdCtrls, Mask, WordXP, OleServer, ADODB;

type
  TfCorrespondencia = class(TfPadrao)
    DBEdit3: TDBEdit;
    Label7: TLabel;
    wdDoc: TWordDocument;
    waWord: TWordApplication;
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
    DBComboBox1: TDBComboBox;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label1: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBComboBox2: TDBComboBox;
    Panel1: TPanel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    bbtBuscaEnderecos: TBitBtn;
    pn_GeraRel: TPanel;
    RadioGroup1: TRadioGroup;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    DS_BuscaCidade: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BCnsultarClick(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure BNovoClick(Sender: TObject);
    procedure bbtBuscaEnderecosClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCorrespondencia: TfCorrespondencia;
  f_false, f_true, f_NomeDoc, f_Troca, f_Var, f_NomeSalva :OleVariant;

implementation

uses ufDM, ufProcesso, ufDMR, ufConsultaEnderecos;

{$R *.dfm}

procedure TfCorrespondencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qCorrespondencia.Close;
DM.qEnderecos.Close;
end;

procedure TfCorrespondencia.FormShow(Sender: TObject);
begin
  inherited;
  DM.qCorrespondencia.Open;
  DM.qEnderecos.Open;
end;

procedure TfCorrespondencia.BCnsultarClick(Sender: TObject);
begin
pn_GeraRel.Visible := True;

end;

procedure TfCorrespondencia.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
if DBComboBox1.ItemIndex = 0
then begin
      DM.qCorrespondenciaREGCORREIO.Value := 'SX000000000BR';
     end else DM.qCorrespondenciaREGCORREIO.Value := 'RB000000000BR';
end;

procedure TfCorrespondencia.BNovoClick(Sender: TObject);
begin
  inherited;
  dm.qCorrespondenciaCORR_USU.Value := DM.qHostsHOS_USUA.Value;
  dm.qCorrespondenciaEND_COD.Value := 0;
  dm.qCorrespondenciaCORR_DATA.Value := Date;
  DBLookupComboBox1.SetFocus;
end;

procedure TfCorrespondencia.bbtBuscaEnderecosClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfConsultaEnderecos, fConsultaEnderecos);
  fConsultaEnderecos.bbtSelecionar.Enabled := True;
  fConsultaEnderecos.Tela := 'Envio';
  fConsultaEnderecos.ShowModal;
  fConsultaEnderecos.bbtSelecionar.Enabled := False;
  fConsultaEnderecos.Free;
  DBEdit2.SetFocus;

end;

procedure TfCorrespondencia.RadioGroup1Click(Sender: TObject);
var Contador, i : Integer;
begin
if RadioGroup1.ItemIndex = 0
then begin
        DMR.qRelCorrespondenciaComJudicial.Close;
        DMR.qRelCorrespondenciaComJudicial.Parameters.ParamByName('Usuario').Value := DBComboBox2.Text;
        DMR.qRelCorrespondenciaComJudicial.Open;
        Contador := DMR.qRelCorrespondenciaComJudicial.RecordCount;

        //  inherited;
        // f_NomeDoc := DM.qParametrosPAM_DPADR.Value + 'CORRESPONDENCIA.DOC';

         f_NomeDoc := 'C:\SCPG\Modelos\' + 'CORRESPONDENCIA.DOC';
        try
          waWord.Connect;
          waWord.Visible := True;
          wdDoc.ConnectTo(waWord.Documents.Open2000(f_NomeDoc, EmptyParam, f_True,
          EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam));

          DMR.qRelCorrespondenciaComJudicial.First;
          for i := 1 to Contador do
          begin
            if DM.qEnderecos.Locate('END_COD', DMR.qRelCorrespondenciaComJudicialEND_COD.Value, []) = True
            then begin
                  f_Var   := '<LOCAL'+ IntToStr(i) + '>';
                  f_Troca := DM.qEnderecosEND_LOC.Value;
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;

                  f_Var   := '<RESPONSAVEL'+ IntToStr(i) + '>';
                  f_Troca := DM.qEnderecosEND_NMR.Value;
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;

                  f_Var   := '<LOGRADOURO'+ IntToStr(i) + '>';
                  f_Troca := DM.qEnderecosEND_END.Value;
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;

                  f_Var   := '<BAIRRO'+ IntToStr(i) + '>';
                  f_Troca := DM.qEnderecosEND_BAI.Value;
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;

                  f_Var   := '<CEP'+ IntToStr(i) + '>';
                  f_Troca := DM.qEnderecosEND_CEP.Value;
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;

                  f_Var   := '<CIDADE'+ IntToStr(i) + '>';
                  f_Troca := DM.qEnderecosEND_CID.Value;
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;

                  f_Var   := '<UF'+ IntToStr(i) + '>';
                  f_Troca := DM.qEnderecosUF_SIGLA.Value;
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;
                end;

                  f_Var   := '<OBSERVACAO'+ IntToStr(i) + '>';
                  f_Troca := DMR.qRelCorrespondenciaComJudicialOBS.Value;
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;

            if fProcessos.qProcessoCPG.Locate('PRO_COD', DMR.qRelCorrespondenciaComJudicialPRO_COD.Value, []) = True
            then begin
                  f_Var   := '<AUTOS'+ IntToStr(i) + '>';
                  f_Troca := fProcessos.qProcessoCPGPRO_AUTO.Value;
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;
                 end;

                 qBuscaDadosPessoas.Close;
                 qBuscaDadosPessoas.Parameters.ParamByName('PROCESSO').Value  := fProcessos.qProcessoCPGPRO_COD.Value;
                 qBuscaDadosPessoas.Open;

                  if qBuscaDadosPessoas.Locate('PES_SIT', 1, []) = True
                  then begin
                        f_Var   := '<MAE'+ IntToStr(i) + '>';
                        f_Troca := qBuscaDadosPessoasPES_NOME.Value;
                        while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                        f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                        f_Var := f_Var;
                       end;
                  if qBuscaDadosPessoas.Locate('PES_SIT', 2, []) = True
                  then begin
                        f_Var   := '<CRIANCA'+ IntToStr(i) + '>';
                        f_Troca := qBuscaDadosPessoasPES_NOME.Value;
                        while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                        f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                        f_Var := f_Var;
                       end;

                   if qBuscaDadosPessoas.Locate('PES_SIT', 0, []) = True
                   then begin
                         f_Var   := '<SUPAI'+ IntToStr(i) + '>';
                         f_Troca := qBuscaDadosPessoasPES_NOME.Value;
                         while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                         f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                         f_Var := f_Var;
                        end;

                 qBuscaDadosHistorico.Close;
                 qBuscaDadosHistorico.Parameters.ParamByName('Codigo').Value  := fProcessos.qProcessoCPGPRO_COD.Value;
                 qBuscaDadosHistorico.Open;

                  f_Var   := '<HISTORICO'+ IntToStr(i) + '>';
                  f_Troca := qBuscaDadosHistoricoHIS_DOC.Value;
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;
           DMR.qRelCorrespondenciaComJudicial.Next;
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

if RadioGroup1.ItemIndex = 1
then begin
        DMR.qRelCorrespondenciaSemJudicial.Close;
        DMR.qRelCorrespondenciaSemJudicial.Parameters.ParamByName('Usuario').Value := DBComboBox2.Text;
        DMR.qRelCorrespondenciaSemJudicial.Open;
        Contador := DMR.qRelCorrespondenciaSemJudicial.RecordCount;

        //  inherited;
        // f_NomeDoc := DM.qParametrosPAM_DPADR.Value + 'CORRESPONDENCIASEMJUSTICA.DOC';

         f_NomeDoc := 'C:\SCPG\Modelos\' + 'CORRESPONDENCIASEMJUSTICA.DOC';
        try
          waWord.Connect;
          waWord.Visible := True;
          wdDoc.ConnectTo(waWord.Documents.Open2000(f_NomeDoc, EmptyParam, f_True,
          EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam));

          DMR.qRelCorrespondenciaSemJudicial.First;
          for i := 1 to Contador do
          begin
            if DM.qEnderecos.Locate('END_COD', DMR.qRelCorrespondenciaSemJudicialEND_COD.Value, []) = True
            then begin
                  f_Var   := '<LOCAL'+ IntToStr(i) + '>';
                  f_Troca := DM.qEnderecosEND_LOC.Value;
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;

                  f_Var   := '<RESPONSAVEL'+ IntToStr(i) + '>';
                  f_Troca := DM.qEnderecosEND_NMR.Value;
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;

                  f_Var   := '<LOGRADOURO'+ IntToStr(i) + '>';
                  f_Troca := DM.qEnderecosEND_END.Value;
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;

                  f_Var   := '<BAIRRO'+ IntToStr(i) + '>';
                  f_Troca := DM.qEnderecosEND_BAI.Value;
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;

                  f_Var   := '<CEP'+ IntToStr(i) + '>';
                  f_Troca := DM.qEnderecosEND_CEP.Value;
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;

                  f_Var   := '<CIDADE'+ IntToStr(i) + '>';
                  f_Troca := DM.qEnderecosEND_CID.Value;
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;

                  f_Var   := '<UF'+ IntToStr(i) + '>';
                  f_Troca := DM.qEnderecosUF_SIGLA.Value;
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;
                end;

                  f_Var   := '<OBSERVACAO'+ IntToStr(i) + '>';
                  f_Troca := DMR.qRelCorrespondenciaSemJudicialOBS.Value;
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;

            if fProcessos.qProcessoCPG.Locate('PRO_COD', DMR.qRelCorrespondenciaSemJudicialPRO_COD.Value, []) = True
            then begin
                  f_Var   := '<AUTOS'+ IntToStr(i) + '>';
                  f_Troca := fProcessos.qProcessoCPGPRO_AUTO.Value;
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;
                 end;

                 qBuscaDadosPessoas.Close;
                 qBuscaDadosPessoas.Parameters.ParamByName('PROCESSO').Value  := fProcessos.qProcessoCPGPRO_COD.Value;
                 qBuscaDadosPessoas.Open;

                  if qBuscaDadosPessoas.Locate('PES_SIT', 1, []) = True
                  then begin
                        f_Var   := '<MAE'+ IntToStr(i) + '>';
                        f_Troca := qBuscaDadosPessoasPES_NOME.Value;
                        while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                        f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                        f_Var := f_Var;
                       end;
                  if qBuscaDadosPessoas.Locate('PES_SIT', 2, []) = True
                  then begin
                        f_Var   := '<CRIANCA'+ IntToStr(i) + '>';
                        f_Troca := qBuscaDadosPessoasPES_NOME.Value;
                        while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                        f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                        f_Var := f_Var;
                       end;

                   if qBuscaDadosPessoas.Locate('PES_SIT', 0, []) = True
                   then begin
                         f_Var   := '<SUPAI'+ IntToStr(i) + '>';
                         f_Troca := qBuscaDadosPessoasPES_NOME.Value;
                         while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                         f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                         f_Var := f_Var;
                        end;

                 qBuscaDadosHistorico.Close;
                 qBuscaDadosHistorico.Parameters.ParamByName('Codigo').Value  := fProcessos.qProcessoCPGPRO_COD.Value;
                 qBuscaDadosHistorico.Open;

                  f_Var   := '<HISTORICO'+ IntToStr(i) + '>';
                  f_Troca := qBuscaDadosHistoricoHIS_DOC.Value;
                  while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                  f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                  f_Var := f_Var;
           DMR.qRelCorrespondenciaSemJudicial.Next;
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

pn_GeraRel.Visible := False;
  inherited;

end;

procedure TfCorrespondencia.DBEdit1Exit(Sender: TObject);
begin
DMR.qCorrespodenciaBuscaCidadeUF.Close;
DMR.qCorrespodenciaBuscaCidadeUF.Parameters.ParamByName('Codigo').Value  := DM.qCorrespondenciaEND_COD.Value;
DMR.qCorrespodenciaBuscaCidadeUF.Open;
  inherited;

end;

procedure TfCorrespondencia.DBLookupComboBox1Exit(Sender: TObject);
begin
DMR.qCorrespodenciaBuscaCidadeUF.Close;
DMR.qCorrespodenciaBuscaCidadeUF.Parameters.ParamByName('Codigo').Value  := DM.qCorrespondenciaEND_COD.Value;
DMR.qCorrespodenciaBuscaCidadeUF.Open;

inherited;

end;

procedure TfCorrespondencia.DBEdit2Exit(Sender: TObject);
begin
if DBEdit2.Text <> ''
then begin
      if fProcessos.qProcessoCPG.Locate('PRO_COD', StrToInt(DBEdit2.Text), []) = True
      then begin
             DM.qCorrespondenciaREGCORREIO.Value := fProcessos.qProcessoCPGPRO_RASTREAR.Value;
           end;
     end;
inherited;

end;

end.
