unit ufPessoas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, Buttons, ExtCtrls, StdCtrls,
  DBCtrls,  Mask, ADODB, ComCtrls,
  Sockets, RLReport, JvExControls, JvDBLookup, JvExStdCtrls,
  JvCombobox, JvDBCombobox, JvExMask, JvToolEdit, JvDBControls;

type
  TfPessoas = class(TfPadrao)
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    Label26: TLabel;
    DBEdit10: TDBEdit;
    DBDateEdit4: TJvDBDateEdit;
    Label8: TLabel;
    Label27: TLabel;
    RxDBComboBox6: TJvDBComboBox;
    RxDBComboBox7: TJvDBComboBox;
    Label28: TLabel;
    DBEdit21: TDBEdit;
    Label30: TLabel;
    qSituacaoPessoas: TADOQuery;
    RxDBLookupCombo1: TJvDBLookupCombo;
    ds_SituacaoPessoas: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    qSituacaoPessoasSIT_COD: TIntegerField;
    qSituacaoPessoasSIT_NM: TStringField;
    qSituacaoPessoasSIT_SIGLA: TStringField;
    qSituacaoPessoasSIT_ORDEM: TIntegerField;
    qControlaAuditoria: TADOQuery;
    StatusBar1: TStatusBar;
    Label2: TLabel;
    bbtEnderecos: TBitBtn;
    ds_Pessoas: TDataSource;
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
    DS_ConsultaNomeDuplicados: TDataSource;
    qConsultaNomeDuplicados: TADOQuery;
    pn_Pessoas: TPanel;
    DBGrid2: TDBGrid;
    qConsultaNomeDuplicadosPRO_COD: TIntegerField;
    qConsultaNomeDuplicadosPES_COD: TIntegerField;
    qConsultaNomeDuplicadosPES_NOME: TStringField;
    qConsultaNomeDuplicadosPES_INICIAIS: TStringField;
    qConsultaNomeDuplicadosPES_SIT: TIntegerField;
    qConsultaNomeDuplicadosPES_DTNAS: TDateField;
    qConsultaNomeDuplicadosPES_LCNAS: TStringField;
    qConsultaNomeDuplicadosPES_SEXO: TStringField;
    qConsultaNomeDuplicadosPES_TDOC: TStringField;
    qConsultaNomeDuplicadosPES_NDOC: TStringField;
    qConsultaNomeDuplicadosPRO_COD_1: TIntegerField;
    qConsultaNomeDuplicadosPRO_ANO: TIntegerField;
    qConsultaNomeDuplicadosPRO_NPERC: TStringField;
    qConsultaNomeDuplicadosPRO_TIPO: TIntegerField;
    qConsultaNomeDuplicadosPRO_AUTO: TStringField;
    qConsultaNomeDuplicadosUF_SIGLA: TStringField;
    qConsultaNomeDuplicadosCAS_CODIGO: TStringField;
    qConsultaNomeDuplicadosCOM_COD: TIntegerField;
    qConsultaNomeDuplicadosVAR_COD: TIntegerField;
    qConsultaNomeDuplicadosLCO_COD: TIntegerField;
    qConsultaNomeDuplicadosPRO_HCOLE: TStringField;
    qConsultaNomeDuplicadosPRO_DCOLE: TDateField;
    qConsultaNomeDuplicadosPRO_HREC: TStringField;
    qConsultaNomeDuplicadosPRO_DREC: TDateField;
    qConsultaNomeDuplicadosPRO_DRESU: TDateField;
    qConsultaNomeDuplicadosPRO_SIT: TIntegerField;
    qConsultaNomeDuplicadosPRO_NCOMP: TIntegerField;
    qConsultaNomeDuplicadosPRO_RESUL: TIntegerField;
    qConsultaNomeDuplicadosPRO_PROB: TStringField;
    qConsultaNomeDuplicadosPRO_ARETI: TStringField;
    qConsultaNomeDuplicadosJUI_COD: TIntegerField;
    qConsultaNomeDuplicadosFG_PROP: TStringField;
    qConsultaNomeDuplicadosPRO_USUCAD: TStringField;
    qConsultaNomeDuplicadosPRO_NUMLAUDO: TStringField;
    qConsultaNomeDuplicadosPRO_RASTREAR: TStringField;
    qConsultaNomeDuplicadosPRO_CARREGACREDITO: TStringField;
    bbtImprimir: TBitBtn;
    bbtFechar: TBitBtn;
    QuickRep1: TRLReport;
    QRBand6: TRLBand;
    QRBand8: TRLBand;
    QRSysData3: TRLSystemInfo;
    QRBand1: TRLBand;
    QRDBText1: TRLDBText;
    QRDBText3: TRLDBText;
    QRDBText4: TRLDBText;
    QRBand2: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    CASO: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    function  CaixaMista(Texto: string): string;
    Function  AuditoriaAlteracao: String;
    procedure BNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BExcluirClick(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure DBEdit4Enter(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit10Enter(Sender: TObject);
    procedure DBDateEdit4Enter(Sender: TObject);
    procedure DBEdit21Enter(Sender: TObject);
    procedure RxDBComboBox7Enter(Sender: TObject);
    procedure RxDBComboBox6Enter(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtEnderecosClick(Sender: TObject);
    procedure bbtFecharClick(Sender: TObject);
    procedure bbtImprimirClick(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    function LimitaNome(Nome: String): String;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPessoas: TfPessoas;
  PRO_COD, PES_COD, PES_SIT : Integer;
  PES_DTNAS : TDate;
  PES_NOME, PES_INICIAIS, PES_LCNAS, PES_SEXO, PES_TDOC, PES_NDOC : String;

implementation

uses ufDM, ufProcesso, ufEnderecos;

{$R *.dfm}

procedure TfPessoas.BNovoClick(Sender: TObject);
var proximo:integer;
begin
 DM.qMaxPessoa.Close;
 DM.qMaxPessoa.Open;
 Proximo:=DM.qMaxPessoaMAX.Value + 1;
 inherited;
 DM.qPessoasPRO_COD.Value  := fProcessos.qProcessoCPGPRO_COD.Value;
 DM.qPessoasPES_COD.Value  := proximo;
 RxDBLookupCombo1.SetFocus;

with qControlaAuditoria do
begin
 Close;
 SQL.Clear;
 SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
 Parameters.ParamByName('Processo').Value := fProcessos.qProcessoCPGPRO_COD.Value;
 Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
 Parameters.ParamByName('Data').Value     := Date;
 Parameters.ParamByName('Hora').Value     := TimeToStr(Time);
 Parameters.ParamByName('Execucao').Value := 'Apertou o Botão NOVo do CADASTRO DE PESSOAS';
 ExecSQL;
end;

end;

procedure TfPessoas.FormShow(Sender: TObject);
begin
  DM.qPessoas.Open;
  qSituacaoPessoas.Open;
end;

procedure TfPessoas.BSalvarClick(Sender: TObject);
begin
DM.qPessoasPES_INICIAIS.Value := CaixaMista(DM.qPessoasPES_NOME.Value);
if (DM.qPessoasPES_SIT.Value = 2) and (RxDBComboBox6.Text = '')
then begin
      ShowMessage('Para cada CRIANÇA cadastrada no SCPG, é OBRIGATÓRIO informar o SEXO da mesma!!!!!');
      RxDBComboBox6.SetFocus;
     end else begin
               DBEdit21.SetFocus;
               DM.qPessoasPES_INICIAIS.Value := CaixaMista(DM.qPessoasPES_NOME.Value);
               inherited;

               with qControlaAuditoria do
               begin
                Close;
                SQL.Clear;
                SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
                Parameters.ParamByName('Processo').Value := DM.qPessoasPRO_COD.Value;
                Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
                Parameters.ParamByName('Data').Value     := Date;
                Parameters.ParamByName('Hora').Value     := Time;
                Parameters.ParamByName('Execucao').Value := 'Apertou o Botão SALVAR do CADASTRO DE PESSOAS';
                ExecSQL;

                AuditoriaAlteracao;
                end;
               end;


qConsultaNomeDuplicados.Close;
qConsultaNomeDuplicados.SQL.Clear;
qConsultaNomeDuplicados.SQL.Add(' select * from tb_pessoas pa, tb_processo p ');
qConsultaNomeDuplicados.SQL.Add(' where pa.pro_cod=p.pro_cod ');
qConsultaNomeDuplicados.SQL.Add(' and pa.pes_nome like :Nome and pa.pro_cod <> :Codigo ');
qConsultaNomeDuplicados.Parameters.ParamByName('Nome').Value   := '%' + DM.qPessoasPES_NOME.Value + '%';
qConsultaNomeDuplicados.Parameters.ParamByName('Codigo').Value := DM.qPessoasPRO_COD.Value;
qConsultaNomeDuplicados.Open;

if (qConsultaNomeDuplicados.RecordCount > 0)
then begin
       pn_Pessoas.Visible := True;
     end


end;

function TfPessoas.CaixaMista(Texto: string): string;
var
  i: integer;
  Iniciais, ValidaDEDA1, ValidaDEDA2, ValidaDEDA3, ValidaE1, ValidaE2, SimRN : String;
begin
  Iniciais := '';
  Texto := ' ' + LowerCase(Trim(Texto));

  for i := 1 to Length(Texto) do
   if ( Copy(Texto,i,1) = ' ') and ( Copy(Texto,i+1,1) <> ' ')
   then begin
         ValidaE1 := Copy(Texto,i+1,1);
         ValidaE2 := Copy(Texto,i+2,1);
         if not (ValidaE1+ValidaE2 = 'e ' )
         then begin
               ValidaDEDA1 := Copy(Texto,i+1,1);
               ValidaDEDA2 := Copy(Texto,i+2,1);
               ValidaDEDA3 := Copy(Texto,i+3,1);
               if not ((ValidaDEDA1+ValidaDEDA2+ValidaDEDA3 = 'de ' ) or (ValidaDEDA1+ValidaDEDA2+ValidaDEDA3 = 'da ' ) or (ValidaDEDA1+ValidaDEDA2+ValidaDEDA3 = 'das') or (ValidaDEDA1+ValidaDEDA2+ValidaDEDA3 = 'dos') or (ValidaDEDA1+ValidaDEDA2+ValidaDEDA3 = 'do '))
               then begin
                     if not ((ValidaDEDA1+ValidaDEDA2+ValidaDEDA3 = 'rn ' ))
                     then begin
                           Iniciais := Iniciais + (Copy(Texto,i+1,1));
                          end else begin
                                    SimRN := 'Sim';
                                  end;
                    end;
              end;
        end;
   if SimRN = 'Sim'
   then begin
         Result:= 'Rn' + UpperCase(Trim(Iniciais));
         SimRN := '';
        end else  Result:= UpperCase(Trim(Iniciais));
end;


procedure TfPessoas.BEditarClick(Sender: TObject);
begin
  inherited;

with qControlaAuditoria do
begin
 Close;
 SQL.Clear;
 SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
 Parameters.ParamByName('Processo').Value := dm.qPessoasPRO_COD.Value;
 Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
 Parameters.ParamByName('Data').Value     := Date;
 Parameters.ParamByName('Hora').Value     := Time;
 Parameters.ParamByName('Execucao').Value := 'Apertou o Botão EDITAR do CADASTRO DE PESSOAS';
 ExecSQL;
end;

PRO_COD      :=0;
PES_COD      :=0;
PES_NOME     :='';
PES_INICIAIS :='';
PES_SIT      :=0;
PES_DTNAS    :=0;
PES_LCNAS    :='';
PES_SEXO     :='';
PES_TDOC     :='';
PES_NDOC     :='';

// Auditoria de Alteração

PRO_COD      :=DM.qPessoasPRO_COD.Value;
PES_COD      :=DM.qPessoasPES_COD.Value;
PES_NOME     :=DM.qPessoasPES_NOME.Value;
PES_INICIAIS :=DM.qPessoasPES_INICIAIS.Value;
PES_SIT      :=DM.qPessoasPES_SIT.Value;
PES_DTNAS    :=DM.qPessoasPES_DTNAS.Value;
PES_LCNAS    :=DM.qPessoasPES_LCNAS.Value;
PES_SEXO     :=DM.qPessoasPES_SEXO.Value;
PES_TDOC     :=DM.qPessoasPES_TDOC.Value;
PES_NDOC     :=DM.qPessoasPES_NDOC.Value;
//Fim

end;


Function TfPessoas.AuditoriaAlteracao;
begin
if not (DM.qPessoasPRO_COD.Value = PRO_COD)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := DM.qPessoasPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Código do Cadastro do Processo';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + IntToStr(dM.qPessoasPRO_COD.Value) + ' / ' + 'Original: ' + IntToStr(PRO_COD);
       ExecSQL;
      end;
     end;

if not (DM.qPessoasPES_COD.Value = PES_COD)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := DM.qPessoasPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Código';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + IntToStr(dM.qPessoasPES_COD.Value) + ' / ' + 'Original: ' + IntToStr(PES_COD);
       ExecSQL;
      end;
     end;

if not (DM.qPessoasPES_SIT.Value = PES_SIT)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := DM.qPessoasPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Situação';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + IntToStr(dM.qPessoasPES_SIT.Value) + ' / ' + 'Original: ' + IntToStr(PES_SIT);
       ExecSQL;
      end;
     end;

if not (Dm.qPessoasPES_DTNAS.Value  = PES_DTNAS)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := DM.qPessoasPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Data de Nascimento';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + DateToStr(DM.qPessoasPES_DTNAS.Value) + ' / ' + 'Original: ' + DateToStr(PES_DTNAS);
       ExecSQL;
      end;
     end;

if not (DM.qPessoasPES_NOME.Value   = PES_NOME)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := DM.qPessoasPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Nome da Pessoa';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + DM.qPessoasPES_NOME.Value + ' / ' + 'Original: ' + PES_NOME;
       ExecSQL;
      end;
     end;

if not (DM.qPessoasPES_INICIAIS.Value   = PES_INICIAIS)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := DM.qPessoasPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Iniciais da Pessoa';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + DM.qPessoasPES_INICIAIS.Value + ' / ' + 'Original: ' + PES_INICIAIS;
       ExecSQL;
      end;
     end;

if not (DM.qPessoasPES_LCNAS.Value   = PES_LCNAS)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := DM.qPessoasPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Local de Nascimento';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + DM.qPessoasPES_LCNAS.Value + ' / ' + 'Original: ' + PES_LCNAS;
       ExecSQL;
      end;
     end;

if not (DM.qPessoasPES_SEXO.Value   = PES_SEXO)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := DM.qPessoasPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Sexo';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + DM.qPessoasPES_SEXO.Value + ' / ' + 'Original: ' + PES_SEXO;
       ExecSQL;
      end;
     end;

if not (DM.qPessoasPES_TDOC.Value   = PES_TDOC)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := DM.qPessoasPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Tipo do Documento';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + DM.qPessoasPES_TDOC.Value + ' / ' + 'Original: ' + PES_TDOC;
       ExecSQL;
      end;
     end;

if not (DM.qPessoasPES_NDOC.Value   = PES_NDOC)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := DM.qPessoasPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Tipo do Documento';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + DM.qPessoasPES_NDOC.Value + ' / ' + 'Original: ' + PES_NDOC;
       ExecSQL;
      end;
     end;
end;


procedure TfPessoas.BCancelarClick(Sender: TObject);
begin
  inherited;
with qControlaAuditoria do
 begin
  Close;
  SQL.Clear;
  SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
  Parameters.ParamByName('Processo').Value := dm.qPessoasPRO_COD.Value;
  Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
  Parameters.ParamByName('Data').Value     := Date;
  Parameters.ParamByName('Hora').Value     := Time;
  Parameters.ParamByName('Execucao').Value := 'Apertou o Botão CANCELAR do CADASTRO DE PESSOAS';
  ExecSQL;
 end;
end;

procedure TfPessoas.BExcluirClick(Sender: TObject);
var NomedaPessoa: String;
begin
//  inherited;
if messagedlg('Deseja realmente excluir?',mtconfirmation,[mbyes,mbno],0) = mryes
then begin
       NomedaPessoa := DM.qPessoasPES_NOME.Value;
       dsp.DataSet.delete;
       pcampos.Enabled:=true;
       pgrid.Enabled:=false;
       bsalvar.Enabled:=false;
       bcancelar.Enabled:=false;
       bnovo.Enabled:=true;
       beditar.Enabled:=true;
       bsair.Enabled:=true;
       bexcluir.Enabled:=true;

        with qControlaAuditoria do
         begin
          Close;
          SQL.Clear;
          SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
          Parameters.ParamByName('Processo').Value := dm.qPessoasPRO_COD.Value;
          Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
          Parameters.ParamByName('Data').Value     := Date;
          Parameters.ParamByName('Hora').Value     := Time;
          Parameters.ParamByName('Execucao').Value := 'Fez a EXCLUSÃO no CADASTRO DE PESSOAS / Nome da Pessoa: ' + NomedaPessoa;
          ExecSQL;
          NomedaPessoa := '';
         end;

    end;

end;

procedure TfPessoas.RxDBLookupCombo1Enter(Sender: TObject);
begin
  inherited;
StatusBar1.Panels.Items[1].Text := 'Selecione a relação familiar da PARTE no contexto do Exame';
end;

procedure TfPessoas.DBEdit4Enter(Sender: TObject);
begin

  inherited;
StatusBar1.Panels.Items[1].Text := 'Digite o NOME DA PESSOA envolvida no Exame';

end;

procedure TfPessoas.DBEdit1Enter(Sender: TObject);
begin
  inherited;
StatusBar1.Panels.Items[1].Text := 'INICIAIS do NOME DA PESSOA é gerado automático ao salvar a PARTE';

end;

procedure TfPessoas.DBEdit10Enter(Sender: TObject);
begin
  inherited;
StatusBar1.Panels.Items[1].Text := 'Digite o LOCAL DE NASCIMENTO DA PESSOA envolvida no Exame';
end;

procedure TfPessoas.DBDateEdit4Enter(Sender: TObject);
begin
  inherited;
StatusBar1.Panels.Items[1].Text := 'Digite a DATA DE NASCIMENTO DA PESSOA envolvida no Exame';

end;

procedure TfPessoas.DBEdit21Enter(Sender: TObject);
begin
  inherited;
StatusBar1.Panels.Items[1].Text := 'Digite o NÚMERO DO DOCUMENTO DA PESSOA envolvida no Exame, de acordo com o Tipo do Documento';
end;

procedure TfPessoas.RxDBComboBox7Enter(Sender: TObject);
begin
  inherited;
StatusBar1.Panels.Items[1].Text := 'Selecione o TIPO DO DOCUMENTO da PESSOA envolvida no Exame';
end;

procedure TfPessoas.RxDBComboBox6Enter(Sender: TObject);
begin
  inherited;
StatusBar1.Panels.Items[1].Text := 'Selecione o SEXO da PARTE envolvida no Exame';

end;

procedure TfPessoas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 case Key of
  VK_F10     :   bbtEnderecos.Click;
 end;
end;

procedure TfPessoas.bbtEnderecosClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfEnderecos,fEnderecos);
  fEnderecos.VemCadastro := 'Sim';
  fEnderecos.Nome        := DM.qPessoasPES_NOME.Value;
  fEnderecos.ShowModal;
  fEnderecos.Free;
end;

procedure TfPessoas.bbtFecharClick(Sender: TObject);
begin
  inherited;
  pn_Pessoas.Visible := False;
end;

procedure TfPessoas.bbtImprimirClick(Sender: TObject);
begin
  inherited;
   CASO.Caption := IntToStr(DM.qPessoasPRO_COD.Value);
   QuickRep1.Preview;
end;

procedure TfPessoas.DBEdit4Exit(Sender: TObject);
var ParteNome : String;
begin
ParteNome := '';
ParteNome := UpperCase(Copy(LimitaNome(DM.qPessoasPES_NOME.Value),length(LimitaNome(DM.qPessoasPES_NOME.Value)),1));
if (ParteNome = 'A')
then begin
      DM.qPessoasPES_SEXO.Value := '2';
     end;
if (ParteNome = 'O')
then begin
      DM.qPessoasPES_SEXO.Value := '1';
     end;
  inherited;

end;

function TfPessoas.LimitaNome(Nome: String): String;
var
PNome : String;
begin
PNome := '';
if pos (' ', Nome) <> 0 then
PNome := copy (Nome, 1, pos (' ', Nome) - 1);
Result := trim(PNome);
end;


end.
