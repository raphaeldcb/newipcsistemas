unit ufAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, ComCtrls, Sockets, IniFiles,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient;

type
  TfAcesso = class(TForm)
    Panel1: TPanel;
    Image3: TImage;
    Label5: TLabel;
    Label6: TLabel;
    LabelDescSistema: TLabel;
    Label7: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    Version: TLabel;
    Label4: TLabel;
    BOk: TBitBtn;
    BFechar: TBitBtn;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    TcpClient: TIdTCPClient;
    Label1: TLabel;
    procedure BFecharClick(Sender: TObject);
    procedure BOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAcesso: TfAcesso;
  cont:integer;
  CalculaDias : Real;

implementation

uses ufDM, ufMenu, ufuncoes, ufProcesso, ufAlteraSenha, ufDMI;

{$R *.dfm}


procedure TfAcesso.BFecharClick(Sender: TObject);
begin
   close;
end;

procedure TfAcesso.BOkClick(Sender: TObject);
begin
 DM.qHosts.Close;
 DM.qHosts.Parameters.ParamByName('Usuario').value := Edit1.text;
 DM.qHosts.Parameters.ParamByName('Senha').value   := Edit2.text;
 DM.qHosts.Open;
 CalculaDias := (Date-DM.qHostsHOS_DTULTALT.Value);

 if (DM.qHosts.RecordCount > 0) and (Date <= StrToDate('31/07/2027'))
 then begin
         if ((Date-DM.qHostsHOS_DTULTALT.Value) >= 60)
         then begin
               ShowMessage('--------------##------- Usuário precisa trocar a Senha! -------##--------------');
               Application.CreateForm(TfAlteraSenha, fAlteraSenha);
               fAlteraSenha.L_Usuario.Caption := '';
               fAlteraSenha.SenhaAntiga       := '';
               fAlteraSenha.SenhaAntiga       := DM.qHostsHOS_SENHA.Value;
               fAlteraSenha.L_Usuario.Caption := DM.qHostsHOS_USUA.Value;
               fAlteraSenha.ShowModal;
               fAlteraSenha.Free;
               Edit2.Clear;
               Edit2.SetFocus;
              end else begin
                         Application.CreateForm(TfProcessos, fProcessos);
                         fAcesso.Hide;
                         fProcessos.showmodal;
                         fAcesso.Close;
                         fProcessos.Free;
                        end;
      end
 else begin
         MessageDlg('Login/Senha não autorizado. Entrar em contato com Administrador!', mtinformation,[mbok],0);
         Edit1.SetFocus;
         inc(cont);
      end;
 if cont=3
 then begin
         MessageDlg('Número de tentativas esgotadas!', mtError,[mbok],0);
         close;
      end;
end;

procedure TfAcesso.FormShow(Sender: TObject);
begin

 Label4.Caption := GetBuildInfo1();
 cont:=0;
 Edit1.SetFocus;

//edit1.text:='RAPHAEL';
//edit2.text:='123456';
end;

procedure TfAcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DM.qHosts.Close;
end;

procedure TfAcesso.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if (key = #13) then
   begin
     key := #0;
     perform(WM_NEXTDLGCTL,0,0);
   end;
end;

end.
