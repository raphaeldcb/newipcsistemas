unit ufUsuarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufPadrao, DBCtrls, StdCtrls, Grids, DBGrids, Mask, Db, Buttons, ExtCtrls,
  JvExMask, JvToolEdit, JvDBControls;

type
  TfUsuarios = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    sbb: TSpeedButton;
    DBEdit4: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBDateEdit1: TJvDBDateEdit;
    Label6: TLabel;
    procedure sbNovoClick(Sender: TObject);
    procedure sbAlterarClick(Sender: TObject);
    procedure sbbClick(Sender: TObject);
    procedure BNovoClick(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fUsuarios: TfUsuarios;

implementation

uses ufDM, ufGrupo;

{$R *.DFM}

procedure TfUsuarios.sbNovoClick(Sender: TObject);
var Proximo : Integer;
begin
  inherited;
  DBEdit1.SetFocus;
end;

procedure TfUsuarios.sbAlterarClick(Sender: TObject);
begin
  inherited;
 DBEdit1.SetFocus;
end;

procedure TfUsuarios.sbbClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfRestricao,fRestricao);
  fRestricao.ShowModal;
  DM.qRestricao.Open;
  DM.qHosts.Open;
  DM.qHosts.Edit;
  DM.qHostsRES_COD.Value := DM.qRestricaoRES_COD.Value;
  fRestricao.Free;
end;

procedure TfUsuarios.BNovoClick(Sender: TObject);
begin
  inherited;
  DBEdit1.SetFocus;
end;

procedure TfUsuarios.BEditarClick(Sender: TObject);
begin
  inherited;
  DBEdit2.SetFocus;
end;

procedure TfUsuarios.BSalvarClick(Sender: TObject);
begin
 if TRIM(DBEdit1.text) = ''
 then begin
       showmessage('Informe o Usuário!');
       DBEdit1.SetFocus;
      end
      else begin
            if TRIM(DBEdit2.text) = ''
            then begin
                  showmessage('Informe a Senha!');
                  DBEdit2.SetFocus;
                 end
                 else begin
                       if TRIM(DBEdit3.text) = ''
                       then begin
                             showmessage('Confirme a Senha Informada!');
                             DBEdit3.SetFocus;
                            end
                            else begin
                                  if TRIM(DBEdit4.text) = ''
                                  then begin
                                        showmessage('Informe a Grupo!');
                                        DBEdit4.SetFocus;
                                       end
                                       else begin
                                             inherited;
                                            end;
                                  end;
                      end;
           end;
end;
procedure TfUsuarios.DBEdit3Exit(Sender: TObject);
begin
  if DBEdit2.Text <> DBEdit3.Text
  then begin
        ShowMessage('Senha digitada não confere com a Informada!');
        DBEdit3.SetFocus;
       end
       else begin
             inherited;
            end;
end;

procedure TfUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DM.qHosts.Open;
  DM.qRestricao.Open;
end;

procedure TfUsuarios.FormShow(Sender: TObject);
begin
  inherited;
  DM.qHosts.Open;
  DM.qRestricao.Open;

end;

end.
