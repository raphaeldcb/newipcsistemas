unit ufPacientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, DBCtrls, Buttons, ExtCtrls, StdCtrls, Mask, Grids, DBGrids,
   Math, ADODB, pngimage, ShellApi, JvExMask, JvToolEdit, JvDBControls ;

type
  TfPacientes = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    DBComboBoxSexo: TDBComboBox;
    DBComboBoxEstadoCivil: TDBComboBox;
    DBDateEdit1: TJvDBDateEdit;
    Label11: TLabel;
    DBEdit3: TDBEdit;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit11: TDBEdit;
    Label16: TLabel;
    DBEdit12: TDBEdit;
    Label17: TLabel;
    DBEdit13: TDBEdit;
    Label13: TLabel;
    DBEdit14: TDBEdit;
    Label18: TLabel;
    DBEdit15: TDBEdit;
    DBComboBox1: TDBComboBox;
    Label9: TLabel;
    gb_Sintomas: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    qAtualizaCodigo: TADOQuery;
    Label19: TLabel;
    DBEdit9: TDBEdit;
    img_whatsapp: TImage;
    procedure DBDateEdit1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BNovoClick(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    function GetStrNumber(const S: string): string;
    procedure DBEdit10Exit(Sender: TObject);
    procedure DBDateEdit1Enter(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure img_whatsappDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    VemdeOnde : String;
  end;

var
  fPacientes: TfPacientes;

implementation

uses ufDMI, ufDM;

{$R *.dfm}

procedure TfPacientes.DBDateEdit1Exit(Sender: TObject);
var anoatual, mesatual, diaatual, ano, mes, dia, idade : word;
begin
if DBDateEdit1.Date > Now
then begin
     Application.Messagebox('Data de Nascimento È posterior ‡ Data Atual.','Cadastro de Paciente',MB_ICONERROR + MB_OK);
     DBDateEdit1.SetFocus;
     end;
  DECODEDATE(date, anoatual, mesatual, diaatual);
  DECODEDATE(DMI.qPacientesPES_DNAS.Value, ano, mes, dia);

  idade := anoatual - ano;
    if mesatual < mes then
        idade := idade - 1
    else
      if mesatual = mes then
          if diaatual < dia then
               idade := idade - 1;


               DMI.qPacientes.Edit;
               DMI.qPacientesPES_IDA.Value := Idade;

        end;


procedure TfPacientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMI.qPacientes.Open;
end;

procedure TfPacientes.FormShow(Sender: TObject);
begin
  inherited;
  DMI.qPacientes.Open;
  if (VemdeOnde = 'Cadastro')
  then begin
        BNovo.Click;
      end;
end;

procedure TfPacientes.BNovoClick(Sender: TObject);
var Proximo : Integer;
begin

  DMI.qControlaCodigoPac.Close;
  DMI.qControlaCodigoPac.Open;

  Proximo :=  DMI.qControlaCodigoPacCODIGO.Value + 1;

  with qAtualizaCodigo do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' update TB_CONTROLE c set c.CODIGO_PACIENTE = :Valor ');
    Parameters.ParamByName('Valor').Value  := Proximo;
    ExecSQL;
  end;

  inherited;
  DMI.qPacientesPES_COD.Value := Proximo;
  DBEdit2.SetFocus;

end;

procedure TfPacientes.BEditarClick(Sender: TObject);
begin
  inherited;
  DMI.qPacientesPES_SINTOMA1.Value := 0;
  DMI.qPacientesPES_SINTOMA2.Value := 0;
  DMI.qPacientesPES_SINTOMA3.Value := 0;
  DMI.qPacientesPES_SINTOMA4.Value := 0;
  DMI.qPacientesPES_SINTOMA5.Value := 0;
  DMI.qPacientesPES_SINTOMA6.Value := 0;
  DMI.qPacientesPES_SINTOMA7.Value := 0;
  DMI.qPacientesPES_SINTOMA8.Value := 0;
  DMI.qPacientesPES_SINTOMA9.Value := 0;
  DMI.qPacientesPES_SINTOMA10.Value := 0;
  DBEdit2.SetFocus;
end;

function IsValidCPF(pCPF: string): Boolean;
var
  v: array [0 .. 1] of Word;
  cpf: array [0 .. 10] of Byte;
  I: Byte;
begin
  Result := False;
 
  { Verificando se tem 11 caracteres }
  if Length(pCPF) <> 11 then
  begin
    Exit;
  end;
 
  { Conferindo se todos dÌgitos s„o iguais }
  if pCPF = StringOfChar('0', 11) then
    Exit;
 
  if pCPF = StringOfChar('1', 11) then
    Exit;

  if pCPF = StringOfChar('2', 11) then
    Exit;
 
  if pCPF = StringOfChar('3', 11) then
    Exit;
 
  if pCPF = StringOfChar('4', 11) then
    Exit;
 
  if pCPF = StringOfChar('5', 11) then
    Exit;
 
  if pCPF = StringOfChar('6', 11) then
    Exit;
 
  if pCPF = StringOfChar('7', 11) then
    Exit;
 
  if pCPF = StringOfChar('8', 11) then
    Exit;
 
  if pCPF = StringOfChar('9', 11) then
    Exit;
 
  try
    for I := 1 to 11 do
      cpf[I - 1] := StrToInt(pCPF[I]);
    // Nota: Calcula o primeiro dÌgito de verificaÁ„o.
    v[0] := 10 * cpf[0] + 9 * cpf[1] + 8 * cpf[2];
    v[0] := v[0] + 7 * cpf[3] + 6 * cpf[4] + 5 * cpf[5];
    v[0] := v[0] + 4 * cpf[6] + 3 * cpf[7] + 2 * cpf[8];
    v[0] := 11 - v[0] mod 11;
    v[0] := IfThen(v[0] >= 10, 0, v[0]);
    // Nota: Calcula o segundo dÌgito de verificaÁ„o.
    v[1] := 11 * cpf[0] + 10 * cpf[1] + 9 * cpf[2];
    v[1] := v[1] + 8 * cpf[3] + 7 * cpf[4] + 6 * cpf[5];
    v[1] := v[1] + 5 * cpf[6] + 4 * cpf[7] + 3 * cpf[8];
    v[1] := v[1] + 2 * v[0];
    v[1] := 11 - v[1] mod 11;
    v[1] := IfThen(v[1] >= 10, 0, v[1]);
    // Nota: Verdadeiro se os dÌgitos de verificaÁ„o s„o os esperados.
    Result := ((v[0] = cpf[9]) and (v[1] = cpf[10]));
  except
    on E: Exception do
      Result := False;
  end;

end;

function TfPacientes.GetStrNumber(const S: string): string;
var
  vText : PChar;
begin
  vText := PChar(S);
  Result := '';

  while (vText^ <> #0) do
  begin
    {$IFDEF UNICODE}
    if CharInSet(vText^, ['0'..'9']) then
    {$ELSE}
    if vText^ in ['0'..'9'] then
    {$ENDIF}
      Result := Result + vText^;

    Inc(vText);
  end;
end;

procedure TfPacientes.DBEdit3Exit(Sender: TObject);
begin

  if ((IsValidCPF(GetStrNumber(DMI.qPacientesPES_CPF.Value))) or (DMI.qPacientesPES_CPF.Value = ''))
  then begin
          inherited;
       end else begin
                 ShowMessage('O CPF n„o È v·lido.');
                 DBEdit3.SetFocus;
                end;
end;

procedure TfPacientes.DBEdit10Exit(Sender: TObject);
begin
DMI.qPacientesPES_FCEL.Value := GetStrNumber(DMI.qPacientesPES_FCEL.Value);
inherited;

end;

procedure TfPacientes.DBDateEdit1Enter(Sender: TObject);
begin
DBDateEdit1.Selstart:= 0;
  inherited;

end;

procedure TfPacientes.DBEdit7Exit(Sender: TObject);
begin
  DMI.qPacientesPES_CIES.Value     := 'CAMPO GRANDE';
  DMI.qPacientesPES_UF.Value       := 'UF';
  inherited;

end;

function RemoveAcento(aText : string) : string;
const
  ComAcento = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸Ò˝¿¬ ‘€√’¡…Õ”⁄«‹—›';
  SemAcento = 'aaeouaoaeioucunyAAEOUAOAEIOUCUNY';
var
  x: Cardinal;
begin;
  for x := 1 to Length(aText) do
  try
    if (Pos(aText[x], ComAcento) <> 0) then
      aText[x] := SemAcento[ Pos(aText[x], ComAcento) ];
  except on E: Exception do
    raise Exception.Create('Erro no processo.');
  end;

  Result := aText;
end;

procedure TfPacientes.BSalvarClick(Sender: TObject);
begin
dmi.qPacientesPES_NOME.Value := trim(RemoveAcento(trim(DBEdit2.Text)));
inherited;

// SITE
if ((DMI.qPacientesPES_CPF.Value <> '') or (DMI.qPacientesPES_PASS.Value <> ''))
then begin

      try
        DMI.ADOC_MYSQL.Connected := True;

        if ((Length(trim(DMI.qPacientesPES_CPF.Value)) > 4) or (DMI.qPacientesPES_PASS.Value <> ''))
        then begin
              DMI.qConsultaUsuarioWeb.Close;
              DMI.qConsultaUsuarioWeb.Parameters.ParamByName('login').Value := GetStrNumber(DMI.qPacientesPES_CPF.Value);
              DMI.qConsultaUsuarioWeb.Open;

              if (DMI.qConsultaUsuarioWeb.RecordCount <= 0)
              then begin
                    DMI.qConsultaUsuarioWebPASS.Close;
                    DMI.qConsultaUsuarioWebPASS.Parameters.ParamByName('login').Value  := trim(DMI.qPacientesPES_PASS.Value);
                    DMI.qConsultaUsuarioWebPASS.Open;

                    if (DMI.qConsultaUsuarioWebPASS.RecordCount <= 0)
                    then begin
                          with DMI.qUsuarioWeb do
                          begin
                            Close;
                            SQL.Clear;
                            SQL.Add(' INSERT INTO rdcbco37_resultados.tb_usuarios_ipcms (login, senha, nome, passaporte,senhapass) VALUES (:usuario,old_password(:senha),:nome,:passaporte,old_password(:senhapass))');
                            if (Length(GetStrNumber(DMI.qPacientesPES_CPF.Value)) > 6)
                            then begin
                                  Parameters.ParamByName('usuario').Value      := GetStrNumber(DMI.qPacientesPES_CPF.Value);
                                  Parameters.ParamByName('senha').Value        := Copy(trim(GetStrNumber(DMI.qPacientesPES_CPF.Value)),1,5) ;
                                 end;
                            Parameters.ParamByName('nome').Value         := DMI.qPacientesPES_NOME.Value;
                            Parameters.ParamByName('passaporte').Value   := trim(DMI.qPacientesPES_PASS.Value);
                            Parameters.ParamByName('senhapass').Value    := Copy(trim(DMI.qPacientesPES_PASS.Value),1,5) ;
                            ExecSQL;
                          end;
                        end;
                   end;

            DMI.ADOC_MYSQL.Connected := False;
          end;
      Except
        ShowMessage('Internet com problemas. Pode dar OK e continuar o processo normal!');
        DMI.ADOC_MYSQL.Connected := False;
      end;
    end;

end;

procedure TfPacientes.img_whatsappDblClick(Sender: TObject);
var Telefone : AnsiString;
begin
Telefone :='https://api.whatsapp.com/send?phone=55' + trim(DMI.qPacientesPES_FCEL.Value);

ShellExecute(Handle, 'open', PChar(Telefone), '', '', 1);
  inherited;

end;

end.
