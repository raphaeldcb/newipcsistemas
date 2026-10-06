unit ufAlteraSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Sockets, DB, ADODB, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient;

type
  TfAlteraSenha = class(TForm)
    bbtAlterar: TBitBtn;
    bbFechar: TBitBtn;
    EdtSenha: TEdit;
    Label1: TLabel;
    L_Usuario: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtConfirmaSenha: TEdit;
    qControlaAuditoria: TADOQuery;
    TcpClient: TIdTCPClient;
    qAlteraSenha: TADOQuery;
    procedure bbFecharClick(Sender: TObject);
    procedure bbtAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtSenhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    SenhaAntiga : String;
    { Public declarations }
  end;

var
  fAlteraSenha: TfAlteraSenha;


implementation

{$R *.dfm}

procedure TfAlteraSenha.bbFecharClick(Sender: TObject);
begin
Close;
end;

procedure TfAlteraSenha.bbtAlterarClick(Sender: TObject);
begin
if (Trim(EdtSenha.Text) = Trim(EdtConfirmaSenha.Text))
then begin
      if (Trim(EdtSenha.Text) <> SenhaAntiga)
      then begin
            with qAlteraSenha do
            begin
            Close;
            SQL.Clear;
            SQL.Add('update TB_HOSTS h set h.HOS_SENHA = :Senha, h.HOS_DTULTALT = :Data where h.HOS_USUA = :Usuario');
            Parameters.ParamByName('Senha').Value    := Trim(EdtSenha.Text);
            Parameters.ParamByName('Data').Value     := Date;
            Parameters.ParamByName('Usuario').Value  := L_Usuario.Caption;
            ExecSQL;
            end;


            with qControlaAuditoria do
            begin
            Close;
            SQL.Clear;
            SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
            Parameters.ParamByName('Processo').Value := 99999;
            Parameters.ParamByName('Usuario').Value  := L_Usuario.Caption + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
            Parameters.ParamByName('Data').Value     := Date;
            Parameters.ParamByName('Hora').Value     := TimeToStr(Time);
            Parameters.ParamByName('Execucao').Value := 'Apertou o Botão ALTEROU A SENHA';
            ExecSQL;
            end;
            ShowMessage('Senha alterada com sucesso!');
            Close;
          end else ShowMessage('Senha NÃO pode ser igual a ANTIGA!');
     end else ShowMessage('Senha NÃO são iguais. Informe novamente as senhas!');
end;

procedure TfAlteraSenha.FormShow(Sender: TObject);
begin
EdtSenha.SetFocus;
end;

procedure TfAlteraSenha.EdtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
key:=#0;
Perform(WM_NEXTDLGCTL,0,0);
end;
end;

end.
