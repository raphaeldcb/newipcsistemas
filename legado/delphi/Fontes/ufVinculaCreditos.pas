unit ufVinculaCreditos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, ADODB, Grids,
  DBGrids, Menus, JvExMask, JvToolEdit;

type
  TfVinculaCreditos = class(TForm)
    DS_BuscaDados: TDataSource;
    qAtualizaCadastroProcessos: TADOQuery;
    qAtualizaCadastroProcessosID_CREDITO: TIntegerField;
    qAtualizaCadastroProcessosJUI_COD: TIntegerField;
    qAtualizaCadastroProcessosPRO_COD: TIntegerField;
    qAtualizaCadastroProcessosCRE_DATA: TDateField;
    qExcluir_Temporaria: TADOQuery;
    qContaCreditos: TADOQuery;
    qAtualizaCadastroProcessosPRO_DTREC: TDateField;
    qAtualizaCadastroProcessosCRED_QDCRE: TStringField;
    qBuscaDados: TADOQuery;
    Label4: TLabel;
    qBuscaDadosCOUNT: TIntegerField;
    qBuscaDadosPRO_COD: TIntegerField;
    qBuscaDadosPRO_NPERC: TStringField;
    qBuscaDadosLCO_NOME: TStringField;
    qBuscaDadosUF_SIGLA: TStringField;
    qBuscaDadosDESCRICAOCASO: TStringField;
    qBuscaDadosPRO_DREC: TDateField;
    qBuscaDadosPRO_TIPO: TIntegerField;
    qBuscaDadosPRO_AUTO: TStringField;
    qBuscaDadosVARA: TStringField;
    qBuscaDadosCOMARCA: TStringField;
    qBuscaDadosJUI_COD: TIntegerField;
    qBuscaDadosJUI_DESC: TStringField;
    qBuscaJuiz: TADOQuery;
    qBuscaJuizJUI_COD: TIntegerField;
    DS_VisualizaDados: TDataSource;
    qVisualizaDados: TADOQuery;
    qVisualizaDadosCOUNT: TIntegerField;
    qVisualizaDadosPRO_COD: TIntegerField;
    qVisualizaDadosPRO_NPERC: TStringField;
    qVisualizaDadosLCO_NOME: TStringField;
    qVisualizaDadosUF_SIGLA: TStringField;
    qVisualizaDadosDESCRICAOCASO: TStringField;
    qVisualizaDadosPRO_DREC: TDateField;
    qVisualizaDadosPRO_TIPO: TIntegerField;
    qVisualizaDadosPRO_AUTO: TStringField;
    qVisualizaDadosVARA: TStringField;
    qVisualizaDadosCOMARCA: TStringField;
    qVisualizaDadosJUI_COD: TIntegerField;
    qVisualizaDadosJUI_DESC: TStringField;
    qVisualizaDadosCRED_QDCRE: TStringField;
    PopupMenu_Excluir: TPopupMenu;
    RetiraProcesso1: TMenuItem;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    bbtConsultar: TSpeedButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    sbFechar: TSpeedButton;
    bbtConfirma: TSpeedButton;
    qContaCreditos_Temporario: TADOQuery;
    qContaCreditos_TemporarioULTIMOUTILIZADO: TIntegerField;
    Label2: TLabel;
    Label6: TLabel;
    qContaCreditosULTIMOUTILIZADO: TIntegerField;
    qAtualizaProcessos: TADOQuery;
    DateEditInicial: TJvDateEdit;
    DateEditFim: TJvDateEdit;
    procedure bbtConfirmaClick(Sender: TObject);
    procedure RetiraProcesso1Click(Sender: TObject);
    procedure bbtConsultarClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fVinculaCreditos: TfVinculaCreditos;

implementation

uses ufDMR, ufRelFinanceiro, ufDM, ufProcesso;

{$R *.dfm}

procedure TfVinculaCreditos.bbtConfirmaClick(Sender: TObject);
var Credito : String;
    CreditoValor : Integer;
begin
if MessageDlg('Deseja realmente CONFIRMAR a OPERAÇÃO. Os campos em branco serem excluídos. Confirma?',mtconfirmation,[mbyes,mbno],0) = mryes
then begin
        qVisualizaDados.Close;
        qVisualizaDados.Parameters.ParamByName('Data').Value   := Date;
        qVisualizaDados.Open;

        DM.qCreditos.Open;

        qVisualizaDados.First;
        while qVisualizaDados.Eof = False do
        begin
          qContaCreditos.Close;
          qContaCreditos.Open;
          CreditoValor := qContaCreditosULTIMOUTILIZADO.Value;

          DM.qCreditos.Append;
          DM.qCreditosJUI_COD.Value  := qVisualizaDadosJUI_COD.Value;
          DM.qCreditosPRO_COD.Value  := qVisualizaDadosPRO_COD.Value;
          DM.qCreditosCRE_DATA.Value := Date;
          qContaCreditos.Close;
          if (CreditoValor < 99)
          then begin
                Credito := '0' + IntToStr(CreditoValor + 1);
               end else Credito := IntToStr(CreditoValor + 1);
          DM.qCreditosCRED_QDCRE.Value := Credito;
          DM.qCreditosPRO_DTREC.Value  := qVisualizaDadosPRO_DREC.Value;
          DM.qCreditos.Post;
          Credito := '';

         qVisualizaDados.Next;
        end;

      qAtualizaCadastroProcessos.Close;
      qAtualizaCadastroProcessos.Parameters.ParamByName('DataAtual').Value   := Date;
      qAtualizaCadastroProcessos.Open;
      qAtualizaCadastroProcessos.RecordCount;

      qAtualizaCadastroProcessos.First;
      while qAtualizaCadastroProcessos.Eof = False do
      begin

       qAtualizaProcessos.Close;
       qAtualizaProcessos.Parameters.ParamByName('Codigo').Value := qAtualizaCadastroProcessosPRO_COD.Value;
       qAtualizaProcessos.ExecSQL;
       
       qAtualizaCadastroProcessos.Next;
      end;

      qExcluir_Temporaria.ExecSQL;

      ShowMessage('Dados atualizados no Cadastro de Processos!');
      ShowMessage('Para visualizar os dados basta ir ao Menu - Utilitários - Créditos dos Magistrados.');

      Close;
     end;
end;

procedure TfVinculaCreditos.RetiraProcesso1Click(Sender: TObject);
begin
if MessageDlg('Confirma a exclusão?',mtconfirmation,[mbyes,mbno],0) = mryes
then begin
      DM.qCreditos_Temporario.Delete;
      qVisualizaDados.Close;
      qVisualizaDados.Parameters.ParamByName('Data').Value   := Date;
      qVisualizaDados.Open;
     end;
end;

procedure TfVinculaCreditos.bbtConsultarClick(Sender: TObject);
var Credito : String;
    Proximo  : Integer;
begin
if (DateEditInicial.Date > 0) and (DateEditFim.Date > 0)
then begin
      qBuscaJuiz.Close;
      qBuscaJuiz.Open;
      while qBuscaJuiz.Eof = False do
      begin
        qBuscaDados.Close;
        qBuscaDados.Parameters.ParamByName('DataInicial').Value := DateEditInicial.Date;
        qBuscaDados.Parameters.ParamByName('DataFinal').Value   := DateEditFim.Date;
        qBuscaDados.Parameters.ParamByName('Juiz').Value        := qBuscaJuizJUI_COD.Value;
        qBuscaDados.Open;

        qContaCreditos.Close;
        qContaCreditos.Open;

        if (qBuscaDados.RecordCount > 0)
        then begin
              DM.qCreditos_Temporario.Open;
              qBuscaDados.First;
              while qBuscaDados.Eof = False do
              begin
                DM.qCreditos_Temporario.Last;
                Proximo := DM.qCreditos_TemporarioID_CREDITO.Value + 1;
                DM.qCreditos_Temporario.Append;
                DM.qCreditos_TemporarioID_CREDITO.Value  := Proximo;
                DM.qCreditos_TemporarioJUI_COD.Value     := qBuscaDadosJUI_COD.Value;
                DM.qCreditos_TemporarioPRO_COD.Value     := qBuscaDadosPRO_COD.Value;
                DM.qCreditos_TemporarioCRE_DATA.Value    := Date;

                qContaCreditos_Temporario.Close;
                qContaCreditos_Temporario.Open;
                if ((qContaCreditosULTIMOUTILIZADO.Value)=qContaCreditos_TemporarioULTIMOUTILIZADO.Value) or (qContaCreditos_TemporarioULTIMOUTILIZADO.Value = 0)
                then begin
                      if ((qContaCreditosULTIMOUTILIZADO.Value) < 99)
                      then begin
                            Credito := '0' + IntToStr((qContaCreditosULTIMOUTILIZADO.Value) + 1);
                            Label2.Caption := 'Último Crédito: ' + IntToStr((qContaCreditosULTIMOUTILIZADO.Value));
                           end else begin
                                     Credito := IntToStr((qContaCreditosULTIMOUTILIZADO.Value) + 1);
                                     Label2.Caption := 'Último Crédito: ' + IntToStr((qContaCreditosULTIMOUTILIZADO.Value));
                                    end; 
                     end else begin
                                if (qContaCreditos_TemporarioULTIMOUTILIZADO.Value < 99)
                                then begin
                                      Credito := '0' + IntToStr(qContaCreditos_TemporarioULTIMOUTILIZADO.Value + 1);
                                     end else Credito := IntToStr(qContaCreditos_TemporarioULTIMOUTILIZADO.Value + 1);
                              end;
                DM.qCreditos_TemporarioCRED_QDCRE.Value := Credito;
                DM.qCreditos_TemporarioPRO_DTREC.Value  := qBuscaDadosPRO_DREC.Value;
                DM.qCreditos_Temporario.Post;
                Credito := '';

               qBuscaDados.Next;
              end;
              bbtConsultar.Enabled := False;
             end else bbtConsultar.Enabled := True;
         qBuscaJuiz.Next;
         bbtConfirma.Enabled := True;
         qVisualizaDados.Close;
         qVisualizaDados.Parameters.ParamByName('Data').Value   := Date;
         qVisualizaDados.Open;
         Label6.Caption := 'Quantidade de registros selecionados: ' + IntToStr(qVisualizaDados.RecordCount);;
        end;
     end else begin
               ShowMessage('Informar todos os parâmetros para concluir a consulta.');
              end;
end;

procedure TfVinculaCreditos.sbFecharClick(Sender: TObject);
begin
 qExcluir_Temporaria.ExecSQL;
 Close;
end;

procedure TfVinculaCreditos.FormShow(Sender: TObject);
begin
 qExcluir_Temporaria.ExecSQL;
end;

end.
