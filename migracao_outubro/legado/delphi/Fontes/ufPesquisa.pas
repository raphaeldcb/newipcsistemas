unit ufPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, Buttons, ExtCtrls, StdCtrls, DBCtrls, Mask, ADODB, WordXP, OleServer,
  Word2010, JvExMask, JvToolEdit, JvDBControls;

type
  TfPesquisa = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBDateEdit1: TJvDBDateEdit;
    pn_Pessoas: TPanel;
    qSelecionaPessoas: TADOQuery;
    qSelecionaPessoasPRO_COD: TIntegerField;
    qSelecionaPessoasPES_COD: TIntegerField;
    qSelecionaPessoasPES_NOME: TStringField;
    qSelecionaPessoasPES_SIT: TIntegerField;
    qSelecionaPessoasPES_DTNAS: TDateField;
    qSelecionaPessoasPES_LCNAS: TStringField;
    qSelecionaPessoasPES_SEXO: TStringField;
    qSelecionaPessoasPES_TDOC: TStringField;
    qSelecionaPessoasPES_NDOC: TStringField;
    DBGrid2: TDBGrid;
    ds_Pessoas: TDataSource;
    waWord: TWordApplication;
    wdDoc: TWordDocument;
    procedure BNovoClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BCnsultarClick(Sender: TObject);
    procedure qSelecionaPessoasPES_SITGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPesquisa: TfPesquisa;
  f_false, f_true, f_NomeDoc, f_Troca, f_Var, f_NomeSalva :OleVariant;
  Ano, Mes, Dia : Word;
  DataDiaColeta, AnoA, MesA, DiaA, NovaDataResultadoF, AnoB, MesB, DiaB, AnoC, MesC, DiaC, NovaDataResultado, DataAtual, AnoR, MesR, DiaR, DataDiaRecepcao : String;


implementation

uses ufDM, ufProcesso, ufGeraWord;

{$R *.dfm}

procedure TfPesquisa.BNovoClick(Sender: TObject);
begin
//inherited;
pcampos.Enabled:=true;
qSelecionaPessoas.Close;
qSelecionaPessoas.Parameters.ParamByName('Codigo').Value := fProcessos.qProcessoCPGPRO_COD.Value;
qSelecionaPessoas.Open;
pn_Pessoas.Visible := True;
end;

procedure TfPesquisa.DBGrid2DblClick(Sender: TObject);
begin
  inherited;
DM.qPesquisa.Append;
pcampos.Enabled:=true;
bsalvar.Enabled:=true;
pgrid.Enabled:=true;
bcancelar.Enabled:=true;
bnovo.Enabled:=false;
beditar.Enabled:=false;
bsair.Enabled:=false;
bexcluir.Enabled:=false;
DM.qPesquisaPEQ_NOME.Value  := qSelecionaPessoasPES_NOME.Value;
DM.qPesquisaPEQ_DTNAS.Value := qSelecionaPessoasPES_DTNAS.Value;
DM.qPesquisaPEQ_LCNAS.Value := qSelecionaPessoasPES_LCNAS.Value;
DM.qPesquisaPEQ_NDOC.Value  := qSelecionaPessoasPES_TDOC.Value + ' : ' + qSelecionaPessoasPES_NDOC.Value;
pn_Pessoas.Visible := False;
DBComboBox1.SetFocus;

end;

procedure TfPesquisa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DM.qPesquisa.Close;
  DM.qParametros.Open;
end;

procedure TfPesquisa.FormShow(Sender: TObject);
begin
  inherited;
  DM.qPesquisa.Open;
  DM.qParametros.Open;
end;

procedure TfPesquisa.BCnsultarClick(Sender: TObject);
begin
  inherited;
f_NomeDoc := dm.qParametrosPAM_DPADR.Value + 'TERMO_DE_CONSENTIMENTO.doc';
try
waWord.Connect;
waWord.Visible := True;
wdDoc.ConnectTo(waWord.Documents.Open2000(f_NomeDoc, EmptyParam, f_True,
EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam));

f_Var   := '<NOME>';
f_Troca := DM.qPesquisaPEQ_NOME.Value;
while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
f_Var := f_Var;

f_Var   := '<ESTADOCIVIL>';
f_Troca := DM.qPesquisaPEQ_ESTC.Value;
while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
f_Var := f_Var;

f_Var   := '<DOCUMENTO>';
f_Troca := DM.qPesquisaPEQ_NDOC.Value;
while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
f_Var := f_Var;

f_Var   := '<ENDERECO>';
f_Troca := DM.qPesquisaPEQ_LCRE.Value;
while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
f_Var := f_Var;

f_Var   := '<FONE>';
f_Troca := DM.qPesquisaPEQ_FONE.Value;
while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
f_Var := f_Var;

f_Var   := '<LOCALNASCIMENTO>';
f_Troca := DM.qPesquisaPEQ_LCNAS.Value;
while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
f_Var := f_Var;

DecodeDate (DM.qPesquisaPEQ_DTNAS.Value, Ano, Mes, Dia);
AnoA := IntToStr(Ano);
MesA := fExpWord.MesExtenso(Mes);
DiaA := IntToStr(Dia);
if Length(DiaA) = 1
then begin
      DiaA := ('0' + DiaA);
     end;
if (DiaA = IntToStr(01)) or (DiaA = IntToStr(-1))
then begin
DiaA := 'Primeiro';
end;
NovaDataResultado := DiaA +' de '+ MesA +' de '+ AnoA;

f_Var   := '<DTNASCIMENTO>';
f_Troca := NovaDataResultado;
while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
f_Var := f_Var;

DecodeDate (Date, Ano, Mes, Dia);
AnoC := IntToStr(Ano);
MesC := fExpWord.MesExtenso(Mes);
DiaC := IntToStr(Dia);
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

except
Application.MessageBox('Erro ao tentar abrir o modelo de documento.!', 'Mensagem', mb_iconInformation);
end;

ShowMessage('Nesse momento existe um DOCUMENTO gerado na barra de tarefas. ' + #13 + 'Trabalhe normalmente nele e quando terminar de editar o documento e imprimir.' +
#13 + #13 + 'Pressione OK para encerrar o documento.' + #13 + #13 + 'Atenção: Não precisa fechar o Word. Pressionando OK ele fecha automaticamente!!!');
f_false := False;
waWord.Quit(f_False, f_False, f_False);
waWord.Disconnect;
end;


procedure TfPesquisa.qSelecionaPessoasPES_SITGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
	Case qSelecionaPessoasPES_SIT.AsInteger of
        0 : Text := 'SUPAI';
        1 : Text := 'MÃE';
        2 : Text := 'CRIANÇA';
    end;

end;

end.
