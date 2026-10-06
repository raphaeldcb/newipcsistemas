unit ufParcelamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons,
  DB, Grids, DBGrids, ExtCtrls, ComCtrls, Menus, ImgList, ADODB, Sockets,
  JvExStdCtrls, JvCombobox, JvDBCombobox, JvExMask, JvToolEdit, JvDBControls;

type
  TfParcelamento = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label26: TLabel;
    Label3: TLabel;
    DBTextnParc: TDBText;
    DBEditValor: TDBEdit;
    DBDateEditDtParc: TJvDBDateEdit;
    RxDBComboBox1: TJvDBComboBox;
    Label1: TLabel;
    RxDBComboBoxSituParc: TJvDBComboBox;
    DBEdit1: TDBEdit;
    qControlaAuditoria: TADOQuery;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    procedure CancelBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Function  AuditoriaAlteracao: String;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fParcelamento: TfParcelamento;

  PRO_COD, PAR_NPARC, PAR_SIT, CONTROLE : Integer;
  PAR_OBS,PAR_TPPG,PAR_NMFOR : String;
  PAR_DATA : TDate;
  PAR_HORA : TTime;
  PAR_VLR  : Real;

implementation

uses ufDM, ufProcesso;

{$R *.dfm}

procedure TfParcelamento.CancelBtnClick(Sender: TObject);
begin
 Close;
end;

procedure TfParcelamento.OKBtnClick(Sender: TObject);
begin
      if RxDBComboBoxSituParc.ItemIndex = 0
      then begin
            DM.qParcelamentoPAR_SIT.Value := 1;
           end;
      if RxDBComboBoxSituParc.ItemIndex = 1
      then begin
            DM.qParcelamentoPAR_SIT.Value := 2;
           end;
      if RxDBComboBoxSituParc.ItemIndex = 2
      then begin
            DM.qParcelamentoPAR_SIT.Value := 3;
           end;
      fProcessos.ds_Parcelamento.DataSet.Post;

      AuditoriaAlteracao;


end;

procedure TfParcelamento.FormShow(Sender: TObject);
begin
if DM.qParcelamentoPAR_SIT.Value = 1
then begin
      RxDBComboBoxSituParc.ItemIndex := 0;
     end;
if DM.qParcelamentoPAR_SIT.Value = 2
then begin
      RxDBComboBoxSituParc.ItemIndex := 1;
     end;
if DM.qParcelamentoPAR_SIT.Value = 3
then begin
      RxDBComboBoxSituParc.ItemIndex := 2;
     end;


with qControlaAuditoria do
begin
  Close;
  SQL.Clear;
  SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
  Parameters.ParamByName('Processo').Value := DM.qParcelamentoPRO_COD.Value;
  Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
  Parameters.ParamByName('Data').Value     := Date;
  Parameters.ParamByName('Hora').Value     := Time;
  Parameters.ParamByName('Execucao').Value := 'Apertou o Botão EDITAR do FINANCEIRO';
  ExecSQL;
end;

  PRO_COD   := 0;
  PAR_NPARC := 0;
  PAR_SIT   := 0;
  PAR_TPPG  := '';
  CONTROLE  := 0;
  PAR_OBS   := '';
  PAR_DATA  := 0;
  PAR_HORA  := 0;
  PAR_VLR   := 0;

// Auditoria de Alteração

  PRO_COD   := DM.qParcelamentoPRO_COD.Value;
  PAR_NPARC := DM.qParcelamentoPAR_NPARC.Value;
  PAR_SIT   := DM.qParcelamentoPAR_SIT.Value;
  PAR_TPPG  := DM.qParcelamentoPAR_TPPG.Value;
  CONTROLE  := DM.qParcelamentoCONTROLE.Value;
  PAR_OBS   := DM.qParcelamentoPAR_OBS.Value;
  PAR_DATA  := DM.qParcelamentoPAR_DATA.Value;
  PAR_HORA  := DM.qParcelamentoPRO_COD.Value;
  PAR_VLR   := DM.qParcelamentoPAR_VLR.Value;
  PAR_NMFOR := DM.qParcelamentoPAR_NMFOR.Value;
//Fim


end;



Function TfParcelamento.AuditoriaAlteracao;
begin
if not (DM.qParcelamentoPRO_COD.Value = PRO_COD)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := DM.qParcelamentoPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Código';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + IntToStr(DM.qParcelamentoPRO_COD.Value) + ' / ' + 'Original: ' + IntToStr(PRO_COD);
       ExecSQL;
      end;
     end;
if not (DM.qParcelamentoPAR_NPARC.Value = PAR_NPARC)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := DM.qParcelamentoPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Número de Parcelas';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + IntToStr(DM.qParcelamentoPAR_NPARC.Value) + ' / ' + 'Original: ' + IntToStr(PAR_NPARC);
       ExecSQL;
      end;
     end;
if not (DM.qParcelamentoPAR_SIT.Value = PAR_SIT)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := DM.qParcelamentoPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Situação';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + IntToStr(DM.qParcelamentoPAR_SIT.Value) + ' / ' + 'Original: ' + IntToStr(PAR_SIT);
       ExecSQL;
      end;
     end;
if not (DM.qParcelamentoPAR_TPPG.Value = PAR_TPPG)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := DM.qParcelamentoPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Tipo de Pagamento';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + (DM.qParcelamentoPAR_TPPG.Value) + ' / ' + 'Original: ' + (PAR_TPPG);
       ExecSQL;
      end;
     end;
if not (DM.qParcelamentoCONTROLE.Value = CONTROLE)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := DM.qParcelamentoPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Controle';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + IntToStr(DM.qParcelamentoCONTROLE.Value) + ' / ' + 'Original: ' + IntToStr(CONTROLE);
       ExecSQL;
      end;
     end;
if not (DM.qParcelamentoPAR_OBS.Value = PAR_OBS)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := DM.qParcelamentoPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Observação';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + (DM.qParcelamentoPAR_OBS.Value) + ' / ' + 'Original: ' + (PAR_OBS);
       ExecSQL;
      end;
     end;
if not (DM.qParcelamentoPAR_DATA.Value = PAR_DATA)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := DM.qParcelamentoPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Data';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + DateToStr(DM.qParcelamentoPAR_DATA.Value) + ' / ' + 'Original: ' + DateToStr(PAR_DATA);
       ExecSQL;
      end;
     end;

 if not (DM.qParcelamentoPAR_HORA.Value = PAR_HORA)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := DM.qParcelamentoPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Hora';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + TimeToStr(DM.qParcelamentoPAR_HORA.Value) + ' / ' + 'Original: ' + TimeToStr(PAR_HORA);
       ExecSQL;
      end;
     end;
if not (DM.qParcelamentoPAR_VLR.Value = PAR_VLR)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := DM.qParcelamentoPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Valor';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + FloatToStr(DM.qParcelamentoPAR_VLR.Value) + ' / ' + 'Original: ' + FloatToStr(PAR_VLR);
       ExecSQL;
      end;
     end;
if not (DM.qParcelamentoPAR_NMFOR.Value = PAR_NMFOR)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := DM.qParcelamentoPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Valor';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + DM.qParcelamentoPAR_NMFOR.Value + ' / ' + 'Original: ' + PAR_NMFOR;
       ExecSQL;
      end;
     end;



end;

end.
