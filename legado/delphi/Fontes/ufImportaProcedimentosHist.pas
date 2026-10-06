unit ufImportaProcedimentosHist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls, Buttons, DB, ADODB, Math,
  Menus, Grids, DBGrids, COMobj, JvExMask, JvToolEdit;

type
  TfImportaFacilHist = class(TForm)
    Label21: TLabel;
    SpeedButton1: TSpeedButton;
    ProgressBar1: TProgressBar;
    qConsultaPacientes: TADOQuery;
    qConsultaPedidos: TADOQuery;
    qPedidosWeb: TADOQuery;
    qPedidosWebPWB_COD: TIntegerField;
    qPedidosWebPWB_DCAD: TDateField;
    qPedidosWebPWB_PROT: TStringField;
    qPedidosWebPWB_IDPD: TStringField;
    qPedidosWebPWB_NOME: TStringField;
    qPedidosWebPWB_DNAS: TDateField;
    qPedidosWebPWB_EMAIL: TStringField;
    qPedidosWebPWB_PASS: TStringField;
    qPedidosWebPWB_CPF: TStringField;
    qPedidosWebPWB_CVN: TIntegerField;
    sbConsultar: TSpeedButton;
    qPedidosWebMax: TADOQuery;
    qPedidosWebMaxULTIMO: TIntegerField;
    qConsultaPedidosWeb: TADOQuery;
    ds_ConsultaPedidosWeb: TDataSource;
    qPedidosWebPWB_TELE: TStringField;
    qPedidosWebGera: TADOQuery;
    qValidaPedidosWeb: TADOQuery;
    qValidaPedidosWebQUANTIDADE: TIntegerField;
    qConsultaLaboratorios: TADOQuery;
    qConsultaLaboratoriosLAB_COD: TIntegerField;
    qAtualizaCPF: TADOQuery;
    qPedidosWebPWB_SEXO: TStringField;
    qPedidosWebPWB_DCOLE: TDateField;
    qPedidosWebPWB_HCOLE: TTimeField;
    qLimpaXMarcados: TADOQuery;
    qCadastraCasosLote: TADOQuery;
    qCadastraCasosLotePWB_COD: TIntegerField;
    qCadastraCasosLotePWB_DCAD: TDateField;
    qCadastraCasosLotePWB_PROT: TStringField;
    qCadastraCasosLotePWB_IDPD: TStringField;
    qCadastraCasosLotePWB_NOME: TStringField;
    qCadastraCasosLotePWB_DNAS: TDateField;
    qCadastraCasosLotePWB_EMAIL: TStringField;
    qCadastraCasosLotePWB_PASS: TStringField;
    qCadastraCasosLotePWB_CPF: TStringField;
    qCadastraCasosLotePWB_CVN: TIntegerField;
    qCadastraCasosLotePWB_TELE: TStringField;
    qCadastraCasosLotePWB_SEXO: TStringField;
    qCadastraCasosLotePWB_DCOLE: TDateField;
    qCadastraCasosLotePWB_HCOLE: TTimeField;
    qCadastraCasosLotePWB_FG_RESUL: TSmallintField;
    SpeedButton2: TSpeedButton;
    qPedidosWebPWB_FG_RESUL: TSmallintField;
    qPedidosWebPWB_RG: TStringField;
    qPedidosWebPWB_ORD: TSmallintField;
    opndlgOrigem: TOpenDialog;
    sbCaminho: TSpeedButton;
    qConsultaPedidosWebPWB_COD: TIntegerField;
    qConsultaPedidosWebPWB_DCAD: TDateField;
    qConsultaPedidosWebPWB_PROT: TStringField;
    qConsultaPedidosWebPWB_IDPD: TStringField;
    qConsultaPedidosWebPWB_NOME: TStringField;
    qConsultaPedidosWebPWB_DNAS: TDateField;
    qConsultaPedidosWebPWB_EMAIL: TStringField;
    qConsultaPedidosWebPWB_PASS: TStringField;
    qConsultaPedidosWebPWB_CPF: TStringField;
    qConsultaPedidosWebPWB_CVN: TIntegerField;
    qConsultaPedidosWebPWB_TELE: TStringField;
    qConsultaPedidosWebPWB_SEXO: TStringField;
    qConsultaPedidosWebPWB_DCOLE: TDateField;
    qConsultaPedidosWebPWB_HCOLE: TTimeField;
    qConsultaPedidosWebPWB_FG_RESUL: TSmallintField;
    qConsultaPedidosWebPWB_RG: TStringField;
    qConsultaPedidosWebPWB_ORD: TSmallintField;
    qConsultaPedidosWebLAB_LABT: TStringField;
    qPedidosWebGeraPWB_COD: TIntegerField;
    qPedidosWebGeraPWB_DCAD: TDateField;
    qPedidosWebGeraPWB_PROT: TStringField;
    qPedidosWebGeraPWB_IDPD: TStringField;
    qPedidosWebGeraPWB_NOME: TStringField;
    qPedidosWebGeraPWB_DNAS: TDateField;
    qPedidosWebGeraPWB_EMAIL: TStringField;
    qPedidosWebGeraPWB_PASS: TStringField;
    qPedidosWebGeraPWB_CPF: TStringField;
    qPedidosWebGeraPWB_CVN: TIntegerField;
    qPedidosWebGeraPWB_TELE: TStringField;
    qPedidosWebGeraPWB_SEXO: TStringField;
    qPedidosWebGeraPWB_DCOLE: TDateField;
    qPedidosWebGeraPWB_HCOLE: TTimeField;
    qPedidosWebGeraPWB_FG_RESUL: TSmallintField;
    qPedidosWebGeraPWB_RG: TStringField;
    qPedidosWebGeraPWB_ORD: TSmallintField;
    qDeletaPedidos: TADOQuery;
    qConsultaPedidosPRO_COD: TIntegerField;
    qConsultaPedidosPRO_DCAD: TDateField;
    qConsultaPedidosPES_COD: TIntegerField;
    qConsultaPedidosLAB_COD: TIntegerField;
    qConsultaPedidosMED_CRM: TStringField;
    qConsultaPedidosEXA_COD: TStringField;
    qConsultaPedidosPRO_DCOL: TDateField;
    qConsultaPedidosPRO_DENT: TDateField;
    qConsultaPedidosPRO_GENO: TStringField;
    qConsultaPedidosPRO_VLOG: TBCDField;
    qConsultaPedidosPRO_RESUL: TStringField;
    qConsultaPedidosPRO_OBS: TStringField;
    qConsultaPedidosPRO_UINT: TBCDField;
    qConsultaPedidosPRO_CMLI: TBCDField;
    qConsultaPedidosPRO_PROT: TStringField;
    qConsultaPedidosPRO_APA: TStringField;
    qConsultaPedidosPRO_DREC: TDateField;
    qConsultaPedidosPRO_ATEND: TStringField;
    qConsultaPedidosPRO_TIPR: TStringField;
    qConsultaPedidosPRO_HCAD: TStringField;
    qConsultaPedidosPRO_VALOR: TBCDField;
    qConsultaPedidosPRO_HCOL: TTimeField;
    qConsultaPedidosPRO_FG_RESUL: TSmallintField;
    qConsultaPedidosPRO_PRAZO: TStringField;
    qConsultaPedidosPRO_IDWEB: TSmallintField;
    qConsultaPedidosPES_COD_1: TIntegerField;
    qConsultaPedidosPES_NOME: TStringField;
    qConsultaPedidosPES_ESCV: TStringField;
    qConsultaPedidosPES_IDA: TIntegerField;
    qConsultaPedidosPES_SEXO: TStringField;
    qConsultaPedidosPES_DNAS: TDateField;
    qConsultaPedidosPES_END: TStringField;
    qConsultaPedidosPES_CIES: TStringField;
    qConsultaPedidosPES_FRES: TStringField;
    qConsultaPedidosPES_FCEL: TStringField;
    qConsultaPedidosPES_CPF: TStringField;
    qConsultaPedidosPES_RG: TStringField;
    qConsultaPedidosPES_COD_INTERNET: TSmallintField;
    qConsultaPedidosPES_EMAIL: TStringField;
    qConsultaPacientesPES_COD: TIntegerField;
    qConsultaPacientesPES_NOME: TStringField;
    qConsultaPacientesPES_ESCV: TStringField;
    qConsultaPacientesPES_IDA: TIntegerField;
    qConsultaPacientesPES_SEXO: TStringField;
    qConsultaPacientesPES_DNAS: TDateField;
    qConsultaPacientesPES_END: TStringField;
    qConsultaPacientesPES_CIES: TStringField;
    qConsultaPacientesPES_FRES: TStringField;
    qConsultaPacientesPES_FCEL: TStringField;
    qConsultaPacientesPES_CPF: TStringField;
    qConsultaPacientesPES_RG: TStringField;
    qConsultaPacientesPES_COD_INTERNET: TSmallintField;
    qConsultaPacientesPES_EMAIL: TStringField;
    qPedidosWebPWB_CONVENIO: TStringField;
    qPedidosWebPWB_PRAZO: TStringField;
    qConsultaPedidosWebPWB_CONVENIO: TStringField;
    qConsultaPedidosWebPWB_PRAZO: TStringField;
    BitBtn1: TBitBtn;
    qConsultaPedidosWebLAB: TIntegerField;
    qPedidosWebGeraPWB_CONVENIO: TStringField;
    qPedidosWebGeraPWB_PRAZO: TStringField;
    qPedidosWebPWB_CLAORI: TStringField;
    qPedidosWebPWB_NUNCAR: TStringField;
    qPedidosWebPWB_RESULTADO: TStringField;
    qPedidosWebGeraPWB_CLAORI: TStringField;
    qPedidosWebGeraPWB_NUNCAR: TStringField;
    qPedidosWebGeraPWB_RESULTADO: TStringField;
    qAtualizaCodigo: TADOQuery;
    edtOrigem: TJvFilenameEdit;
    DBGrid: TDBGrid;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbConsultarClick(Sender: TObject);
    function GetStrNumber(const S: string): string;
    function RemoveNumeros(Const Texto:String):String;
    procedure qConsultaPedidosWebPWB_FG_RESULGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbCaminhoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImportaFacilHist: TfImportaFacilHist;

implementation

uses ufDM, ufDMI, ufImprimeMapa, ufConsultaLaboratorios;

{$R *.dfm}

procedure TfImportaFacilHist.SpeedButton1Click(Sender: TObject);
begin
with qLimpaXMarcados do
begin
Close;
SQL.Clear;
SQL.Add(' update TB_PEDIDOS_WEB p set p.PWB_FG_RESUL = :Valor ');
Parameters.ParamByName('Valor').Value := 0;
ExecSQL;
end;

Close;
end;

function TrimStart(conteudo: string; caracter: char): string;
var
  i: integer;
begin
  for i := 0 to length(conteudo) do
    if (conteudo[i] <> caracter) and (conteudo[i] <> #0) then
      break;
  result := copy(conteudo, i, length(conteudo));
end;

procedure TfImportaFacilHist.SpeedButton2Click(Sender: TObject);
var ProximoPaciente, ProximoProcedimento, Numero: Integer;
    Sequencial, AnoS, Letra, Caixa, Posicao, CPF, MesFinal, SequencialFinal, AnoFinal : String;
    Ano, Mes, Dia, anoatual, mesatual, diaatual, anoi, mesi, diai, idade : word;
begin
DECODEDATE(Date, Ano, Mes, Dia);

if MessageDlg(' Confirma a Geração dos Cadastros em Lote? ',mtconfirmation,[mbyes,mbno],0) = mryes
then begin
      qCadastraCasosLote.Close;
      qCadastraCasosLote.SQL.Clear;
      qCadastraCasosLote.SQL.Add(' select * from TB_PEDIDOS_WEB pr');
      qCadastraCasosLote.SQL.Add(' where pr.PWB_FG_RESUL = :Valor ');
      qCadastraCasosLote.SQL.Add(' order by pr.PWB_ORD ');
      qCadastraCasosLote.Parameters.ParamByName('Valor').Value := 1;
      qCadastraCasosLote.open;

      qCadastraCasosLote.First;
      while qCadastraCasosLote.Eof = False  do
      begin
        qPedidosWebGera.Close;
        qPedidosWebGera.Parameters.ParamByName('Codigo').Value := qCadastraCasosLotePWB_COD.Value;
        qPedidosWebGera.Open;

        qConsultaPedidos.Close;
        qConsultaPedidos.Parameters.ParamByName('Id').Value   := qPedidosWebGeraPWB_COD.Value;
        qConsultaPedidos.Parameters.ParamByName('Nome').Value := trim(qPedidosWebGeraPWB_NOME.Value);
        qConsultaPedidos.Parameters.ParamByName('Data').Value := qPedidosWebGeraPWB_DCAD.Value;
        qConsultaPedidos.Open;


        if (qConsultaPedidos.RecordCount > 99999999999)
        then begin
              ShowMessage(' ::::: ATENÇÃO ::::::  Pacinete já foi importado!   ::::: ATENÇÃO :::::: ');
             end else begin

                        qPedidosWebGera.Close;
                        qPedidosWebGera.Parameters.ParamByName('Codigo').Value := qCadastraCasosLotePWB_COD.Value;;
                        qPedidosWebGera.Open;

                        ProgressBar1.Min := 0;
                        ProgressBar1.Position := ProgressBar1.Min;
                        ProgressBar1.Max := 100000;

                           // Pacientes
                           CPF := qPedidosWebGeraPWB_CPF.Value;
                           if (CPF <> '')
                           then begin
                                 CPF := CPF;
                                end else CPF := '0'; 

                           qConsultaPacientes.Close;
                           qConsultaPacientes.Parameters.ParamByName('CPF').Value := CPF;
                           qConsultaPacientes.Open;

                           if (qConsultaPacientes.RecordCount <= 0)
                           then begin
                                 ProximoPaciente:= 0;

                                 DMI.qControlaCodigoPac.Close;
                                 DMI.qControlaCodigoPac.Open;

                                 ProximoPaciente :=  DMI.qControlaCodigoPacCODIGO.Value + 1;

                                 with qAtualizaCodigo do
                                 begin
                                  Close;
                                  SQL.Clear;
                                  SQL.Add(' update TB_CONTROLE c set c.CODIGO_PACIENTE = :Valor ');
                                  Parameters.ParamByName('Valor').Value  := ProximoPaciente;
                                  ExecSQL;
                                 end;

                                 DMI.qPacientes.Open;
                                 DMI.qPacientes.Append;
                                 DMI.qPacientesPES_COD.Value     := ProximoPaciente;
                                 DMI.qPacientesPES_NOME.Value    := trim(UpperCase(qPedidosWebGeraPWB_NOME.Value));
                                 DMI.qPacientesPES_CPF.Value     := qPedidosWebGeraPWB_CPF.Value;
                                 DMI.qPacientesPES_CLAORI.Value  := qPedidosWebGeraPWB_CLAORI.Value;
                                 DMI.qPacientesPES_CPF.Value     := qPedidosWebGeraPWB_CPF.Value;
                                 DMI.qPacientesPES_NUMCAR.Value  := qPedidosWebGeraPWB_NUNCAR.Value;
                                 if (qPedidosWebGeraPWB_DNAS.Value = StrToDate('30/12/1899'))
                                 then begin
                                       DMI.qPacientesPES_DNAS.Value    := Date;
                                      end else DMI.qPacientesPES_DNAS.Value    := qPedidosWebGeraPWB_DNAS.Value;

                                 DECODEDATE(date, anoatual, mesatual, diaatual);
                                 DECODEDATE(DMI.qPacientesPES_DNAS.Value, anoi, mesi, diai);

                                 idade := anoatual - anoi;
                                 if mesatual < mesi then
                                   idade := idade - 1
                                 else
                                  if mesatual = mesi then
                                   if diaatual < diai then
                                  idade := idade - 1;

                                 DMI.qPacientesPES_IDA.Value := Idade;
                                 DMI.qPacientes.Post;
                               end else ProximoPaciente := qConsultaPacientesPES_COD.Value;
                          // Fecha Paciente

                         // Exames
                          Sequencial :='';
                              DMI.qControlaCodigoProc.Close;
                              DMI.qControlaCodigoProc.Open;

                              ProximoProcedimento :=  DMI.qControlaCodigoProcCODIGO.Value + 1;

                              with qAtualizaCodigo do
                              begin
                                Close;
                                SQL.Clear;
                                SQL.Add(' update TB_CONTROLE c set c.CODIGO_PROCEDIMENTO = :Valor ');
                                Parameters.ParamByName('Valor').Value  := ProximoProcedimento;
                                ExecSQL;
                              end;


                            DMI.qSequencial.Open;
                            Sequencial := IntToStr(DMI.qSequencialSEQUENCIAL.Value + 1);

                            DMI.qProcedimentos.Open;
                            DMI.qProcedimentos.Append;
                            DMI.qProcedimentosPRO_COD.Value   := ProximoProcedimento;
                            DMI.qProcedimentosPRO_DCAD.Value := qPedidosWebGeraPWB_DCAD.Value;
                            DMI.qProcedimentosPRO_DCOL.Value := qPedidosWebGeraPWB_DCAD.Value;
                            DMI.qProcedimentosPRO_DREC.Value := qPedidosWebGeraPWB_DCAD.Value;
                            DMI.qProcedimentosEXA_COD.Value  := 'COVID-19';
                            DMI.qProcedimentosLAB_COD.Value  := qPedidosWebGeraPWB_CVN.Value;
                            DMI.qProcedimentosPES_COD.Value  := ProximoPaciente;
                            DMI.qProcedimentosMED_CRM.Value  := '1';
                            DMI.qProcedimentosPRO_APA.Value  := 'Sim';
                            DMI.qProcedimentosPRO_PRAZO.Value:= qPedidosWebGeraPWB_PRAZO.Value;
                            DMI.qProcedimentosPRO_PROT.Value := qPedidosWebGeraPWB_PROT.Value;
                            DMI.qProcedimentosPRO_ATEND.Value:= dm.qHostsHOS_USUA.Value;
                            DMI.qProcedimentos.Post;

                            inherited;

                            DMI.qStatusProcedimentos.Close;
                            DMI.qStatusProcedimentos.Open;
                            DMI.qStatusProcedimentos.Append;
                            DMI.qStatusProcedimentosPRO_COD.Value    := DMI.qProcedimentosPRO_COD.Value;
                            DMI.qStatusProcedimentosSTP_DATA.Value   := Date;
                            DMI.qStatusProcedimentosSTP_STATUS.Value := 1;
                            DMI.qStatusProcedimentosSTP_DESC.Value   := 'Cadastramento realizado';
                            DMI.qStatusProcedimentos.Post;


                            DMI.qProcedimentos_Resultado.Close;
                            DMI.qProcedimentos_Resultado.Open;
                            DMI.qProcedimentos_Resultado.Append;
                            DMI.qProcedimentos_ResultadoPRO_COD.Value       := DMI.qProcedimentosPRO_COD.Value;
                            DMI.qProcedimentos_ResultadoPROR_DAT.Value      := Date;
                            DMI.qProcedimentos_ResultadoPRO_RESUL.Value     := qPedidosWebGeraPWB_RESULTADO.Value;
                            DMI.qProcedimentos_Resultado.Post;


                            ProgressBar1.StepIt;
                            Application.ProcessMessages;
                            end;

                        DMI.qPacientes.Close;
                        DMI.qProcedimentos.close;


       qCadastraCasosLote.Next;
      end;


        with qLimpaXMarcados do
        begin
        Close;
        SQL.Clear;
        SQL.Add(' update TB_PEDIDOS_WEB p set p.PWB_FG_RESUL = :Valor ');
        Parameters.ParamByName('Valor').Value := 0;
        ExecSQL;
        end;

        ShowMessage('Processo finalizado!');
      end;
end;

function TfImportaFacilHist.RemoveNumeros(Const Texto:String):String;
var
I: integer;
S: string;
begin
S := '';
for I := 1 To Length(Texto) Do
begin
if (Texto[I] in ['A'..'Z'])or (Texto[I] =' ') or (Texto[I] ='.') then
begin
S := S + Copy(Texto, I, 1);
end;
end;
result := S;
end;

function TfImportaFacilHist.GetStrNumber(const S: string): string;
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

procedure TfImportaFacilHist.qConsultaPedidosWebPWB_FG_RESULGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
Text := EmptyStr;
end;

procedure TfImportaFacilHist.sbConsultarClick(Sender: TObject);
var excel :variant;
    MesGerando, VerificaMensagem, Probabilidade, Arquivo, f_NomePDF, TemValor, DataNas, CPF : String;
    i, Linha, NumeroSheets, Proximo  : Integer ;
begin
with qDeletaPedidos do
begin
Close;
SQL.Clear;
SQL.Add(' delete from TB_PEDIDOS_WEB ');
ExecSQL;
end;

try
excel := CreateOleObject('Excel.Application');
if not Excel.Application.Visible then

      Arquivo := edtOrigem.FileName;
      if FileExists(Arquivo)
      then begin
            Excel.WorkBooks.Open(Arquivo);
           end;

NumeroSheets := 1;

Linha := 2;
qPedidosWeb.Open;
for i := 1 to 168 do
begin
  TemValor := '';
  TemValor := Trim(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]);
  if (TemValor <> '')
  then begin
        Proximo:= 0;
        qPedidosWebMax.Close;
        qPedidosWebMax.Open;
        Proximo:=qPedidosWebMaxULTIMO.Value + 1;

        qPedidosWeb.Append;
        qPedidosWebPWB_COD.Value      := Proximo;
        qPedidosWebPWB_DCAD.Value     := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2];
        qPedidosWebPWB_NOME.Value     := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3];
        qPedidosWebPWB_PRAZO.Value    := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6];
        qPedidosWebPWB_CVN.Value      := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7];
        qPedidosWebPWB_PROT.Value     := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1];
        qPedidosWebPWB_NUNCAR.Value   := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4];
        qPedidosWebPWB_CLAORI.Value   := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5];
        qPedidosWebPWB_RESULTADO.Value:= Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,8];
        qPedidosWeb.Post;
      end;
  Linha:=Linha+1;
end;
showmessage('Importação Finalizada');

qConsultaPedidosWeb.Close;
qConsultaPedidosWeb.Open;

except
showmessage('Erro Linha : ' + IntToStr(Linha));
end;
end;

procedure TfImportaFacilHist.DBGridDblClick(Sender: TObject);
begin
  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  (Sender as TDBGrid).DataSource.Dataset.Edit;

  (Sender as TDBGrid).DataSource.Dataset.FieldByName('PWB_FG_RESUL').AsInteger :=
    IfThen((Sender as TDBGrid).DataSource.Dataset.FieldByName('PWB_FG_RESUL').AsInteger = 1, 0, 1);

  (Sender as TDBGrid).DataSource.Dataset.Post;
end;

procedure TfImportaFacilHist.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;

  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  // Desenha um checkbox no dbgrid
  if Column.FieldName = 'PWB_FG_RESUL' then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);

    if ((Sender as TDBGrid).DataSource.Dataset.FieldByName('PWB_FG_RESUL').AsInteger = 1) then
      Check := DFCS_CHECKED
    else
      Check := 0;

    R := Rect;
    InflateRect(R, -2, -2); { Diminue o tamanho do CheckBox }
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON,
      DFCS_BUTTONCHECK or Check);
  end;


end;

procedure TfImportaFacilHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
with qLimpaXMarcados do
begin
Close;
SQL.Clear;
SQL.Add(' update TB_PEDIDOS_WEB p set p.PWB_FG_RESUL = :Valor ');
Parameters.ParamByName('Valor').Value := 0;
ExecSQL;
end;

end;

procedure TfImportaFacilHist.sbCaminhoClick(Sender: TObject);
begin
  if opndlgOrigem.Execute then
     edtOrigem.Text := opndlgOrigem.FileName;
end;

procedure TfImportaFacilHist.FormShow(Sender: TObject);
begin
DM.qHosts.Open;
DMI.qLaboratorios.Open;
end;

procedure TfImportaFacilHist.BitBtn1Click(Sender: TObject);
begin
        with qLimpaXMarcados do
        begin
        Close;
        SQL.Clear;
        SQL.Add(' update TB_PEDIDOS_WEB p set p.PWB_FG_RESUL = :Valor ');
        Parameters.ParamByName('Valor').Value := 1;
        ExecSQL;
        end;
        qConsultaPedidosWeb.Close;
qConsultaPedidosWeb.Open;
end;

end.
