unit ufCompraKits;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, Buttons, ExtCtrls,
  StdCtrls, DBCtrls, Mask, WordXP, OleServer, Word2010, JvExMask,
  JvToolEdit, JvDBControls;

type
  TfCompraKits = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    DBDateEdit1: TJvDBDateEdit;
    bbtWord: TSpeedButton;
    waWord: TWordApplication;
    wdDoc: TWordDocument;
    procedure bbtWordClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BNovoClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCompraKits: TfCompraKits;
  f_false, f_true, f_NomeDoc, f_Troca, f_Var, f_NomeSalva :OleVariant;
  Ano, Mes, Dia : Word;
  DataDiaColeta, AnoA, MesA, DiaA, NovaDataResultado, AnoB, MesB, DiaB, DataAtual, ArquivoOriginal, NomeArquivo : String;

implementation

uses ufDM;

{$R *.dfm}

procedure TfCompraKits.bbtWordClick(Sender: TObject);
var s : String;
begin
f_NomeDoc := DM.qParametrosPAM_DPADR.Value +'\COMPRA_KITS.DOC';
if not FileExists( f_NomeDoc )
 then begin
       ShowMessage('::::::::::::::::::::::::::::: ATENÇÃO :::::::::::::::::::::::::::::' + #13+ 'Modelo para geração de dados NÃO existe.' + #13 + 'O caminho correto seria ' + f_NomeDoc);
      end else begin
                  try
                   waWord.Connect;
                   waWord.Visible := True;
                   wdDoc.ConnectTo(waWord.Documents.Open2000(f_NomeDoc, EmptyParam, f_True,
                   EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam));


                   DecodeDate (DM.qCompraKitsDATA_CADASTRO.Value, Ano, Mes, Dia);
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
                   NovaDataResultado := (DiaA + '/' + MesA + '/'+ AnoA);


                   f_Var   := '<DATACADASTRO>';
                   f_Troca := NovaDataResultado;
                   while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                   f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                   f_Var := f_Var;


                    f_Var   := '<NOME>';
                    f_Troca :=  DM.qCompraKitsNOME_SUPAI.Value ;
                    while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                    f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                    f_Var := f_Var;

                    f_Var   := '<CPF>';
                    f_Troca :=  DM.qCompraKitsCPF_SUPAI.Value ;
                    while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                    f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                    f_Var := f_Var;


                    f_Var   := '<ENDERECO>';
                    f_Troca :=  DM.qCompraKitsENDE_SUPAI.Value ;
                    while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                    f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                    f_Var := f_Var;

                    f_Var   := '<NUMEROKIT>';
                    f_Troca :=  DM.qCompraKitsNUMERO_KIT.Value ;
                    while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                    f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                    f_Var := f_Var;


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

procedure TfCompraKits.FormShow(Sender: TObject);
begin
dm.qCompraKits.Open;
dm.qParametros.Open;
  inherited;
end;

procedure TfCompraKits.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dm.qCompraKits.Close;
dm.qParametros.Close;

  inherited;

end;

procedure TfCompraKits.BNovoClick(Sender: TObject);
var proximo:integer;
begin
DM.qCompraKits.Close;
DM.qCompraKits.Open;
DM.qCompraKits.Last;
Proximo:=DM.qCompraKitsNUMERO_KIT.Value + 1;
inherited;
DM.qCompraKitsNUMERO_KIT.Value    := proximo;
DM.qCompraKitsDATA_CADASTRO.Value := Date;
DBEdit1.SetFocus;
bbtWord.Enabled := False;
end;

procedure TfCompraKits.BSalvarClick(Sender: TObject);
begin
if ((DBEdit1.Text = '') or (DBEdit3.Text = '') or (DBEdit3.Text = '') or (DBMemo1.Text = ''))
then begin
      ShowMessage('Informe dados em todos os campos!');
      DBEdit1.SetFocus;
     end else begin
               bbtWord.Enabled := True;
               inherited;
              end;

end;

procedure TfCompraKits.BCancelarClick(Sender: TObject);
begin
bbtWord.Enabled := True;
  inherited;

end;

procedure TfCompraKits.BEditarClick(Sender: TObject);
begin
bbtWord.Enabled := False;
  inherited;

end;

end.
