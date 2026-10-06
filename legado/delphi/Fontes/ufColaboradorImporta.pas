unit ufColaboradorImporta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, StdCtrls, DB, SqlExpr, Grids, DBGrids,
  ComObj, Buttons, ADODB,
  ExtCtrls, ComCtrls;

type
  TfColaboradorPonto = class(TForm)
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
    qTipoPessoas: TADOQuery;
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
    qTipoPessoasCLB_COD: TIntegerField;
    qTipoPessoasCLB_PIS: TStringField;
    qTipoPessoasCLB_NOME: TStringField;
    qInsereDadosRGP_SEQ: TIntegerField;
    qInsereDadosRGP_PIS: TStringField;
    qInsereDadosRGP_DTREG: TDateField;
    qInsereDadosRGP_HRREG: TTimeField;
    qInsereDadosRGP_DTIMP: TDateField;
    qBuscaDados: TADOQuery;
    qBuscaDadosRGP_SEQ: TIntegerField;
    qBuscaDadosRGP_PIS: TStringField;
    qBuscaDadosRGP_DTREG: TDateField;
    qBuscaDadosRGP_HRREG: TTimeField;
    qBuscaDadosRGP_DTIMP: TDateField;
    procedure btnOrigemClick(Sender: TObject);
    procedure edtTelResKeyPress(Sender: TObject; var Key: Char);
    procedure sbProcessamentoClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fColaboradorPonto: TfColaboradorPonto;
  excel :variant;
  MesGerando, NomePlanilha, NumeroCaso : String;
  Linha, NumeroSheets, i, NumeroCasoVerificacao : Integer;


implementation

uses ufuncoes, Math, ufDM, ufDMR;

{$R *.dfm}

procedure TfColaboradorPonto.btnOrigemClick(Sender: TObject);
begin
  if opndlgOrigem.Execute then
     edtOrigem.Text := opndlgOrigem.FileName;
end;

procedure TfColaboradorPonto.edtTelResKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
     key := #0;
end;

procedure TfColaboradorPonto.sbProcessamentoClick(Sender: TObject);
var
  Arq : TextFile;
  ArqOrigem, Linha, Verificou: String;
  vPIS, vData, vHora, vDigito  : String;
  Contador, vControle : Integer;
begin

if (Trim(edtOrigem.Text) <> '') and (FileExists(Trim(edtOrigem.Text)))
then begin
       ArqOrigem := Trim(edtOrigem.Text);
       AssignFile(Arq,ArqOrigem);
       Reset(Arq);
       while not Eof(Arq) do
         begin
           Try
             Readln(Arq,Linha);
             vDigito := Trim(Copy(Linha,10,1));
             if (vDigito = '3')
             then begin
                   vControle := StrToInt(Copy(Linha,1,9));
                   vPIS      := Copy(Linha,24,11);
                   vData     := Copy(Linha,11,8);
                   vHora     := Copy(Linha,19,4);

                   qBuscaDados.Open;
                   qBuscaDados.First;
                   if (qBuscaDados.Locate('RGP_SEQ',vControle,[]) = False)
                   then begin
                         qInsereDados.Append;
                         qInsereDadosRGP_SEQ.Value    := vControle;
                         qInsereDadosRGP_PIS.Value    := vPIS;
                         qInsereDadosRGP_DTREG.Value  := StrToDate(Copy(vData,1,2) + '/' + Copy(vData,3,2) + '/' + Copy(vData,5,4));
                         qInsereDadosRGP_HRREG.Value  := StrToTime(Copy(vHora,1,2) + ':' + Copy(vHora,3,2));
                         qInsereDadosRGP_DTIMP.Value  := Date;
                         qInsereDados.Post;
                        end; 
                  end;
           Except
             Showmessage('Erro na importação!');
           end;
         end;
      Showmessage('Registros IMPORTADOS com Sucesso!');
      CloseFile(Arq);

     end;
end;

procedure TfColaboradorPonto.sbFecharClick(Sender: TObject);
begin
 Close;
end;
procedure TfColaboradorPonto.FormShow(Sender: TObject);
begin
qInsereDados.Open;
end;

end.
