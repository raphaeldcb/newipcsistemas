unit ufServicoAutoma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, DB, ADODB, ExtCtrls;

type
  TfServicoAutoma = class(TForm)
    bbtAutormatico: TSpeedButton;
    qPedidosWebMax: TADOQuery;
    qPedidosWebMaxULTIMO: TIntegerField;
    qPedidosWebGera: TADOQuery;
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
    qPedidosWebGeraPWB_CONVENIO: TStringField;
    qPedidosWebGeraPWB_PRAZO: TStringField;
    qPedidosWebGeraPWB_CLAORI: TStringField;
    qPedidosWebGeraPWB_NUNCAR: TStringField;
    qPedidosWebGeraPWB_RESULTADO: TStringField;
    qPedidosWebGeraPWB_RACA: TStringField;
    qPedidosWebGeraPWB_NUNEND: TStringField;
    qPedidosWebGeraPWB_CEP: TStringField;
    qPedidosWebGeraPWB_BAIRRO: TStringField;
    qPedidosWebGeraPWB_SINTOMAS: TStringField;
    qPedidosWebGeraPWB_UF: TStringField;
    qPedidosWebGeraPWB_END: TStringField;
    qPedidosWebGeraPWB_CIES: TStringField;
    qPedidosWebGeraPWB_ESCV: TStringField;
    qPedidosWebGeraPWB_SINTOMA1: TSmallintField;
    qPedidosWebGeraPWB_SINTOMA2: TSmallintField;
    qPedidosWebGeraPWB_SINTOMA3: TSmallintField;
    qPedidosWebGeraPWB_SINTOMA4: TSmallintField;
    qPedidosWebGeraPWB_SINTOMA5: TSmallintField;
    qPedidosWebGeraPWB_SINTOMA6: TSmallintField;
    qPedidosWebGeraPWB_SINTOMA7: TSmallintField;
    qPedidosWebGeraPWB_SINTOMA8: TSmallintField;
    qPedidosWebGeraPWB_SINTOMA9: TSmallintField;
    qPedidosWebGeraPWB_SINTOMA10: TSmallintField;
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
    qPedidosWebPWB_TELE: TStringField;
    qPedidosWebPWB_SEXO: TStringField;
    qPedidosWebPWB_DCOLE: TDateField;
    qPedidosWebPWB_HCOLE: TTimeField;
    qPedidosWebPWB_FG_RESUL: TSmallintField;
    qPedidosWebPWB_RG: TStringField;
    qPedidosWebPWB_ORD: TSmallintField;
    qPedidosWebPWB_CONVENIO: TStringField;
    qPedidosWebPWB_PRAZO: TStringField;
    qPedidosWebPWB_CLAORI: TStringField;
    qPedidosWebPWB_NUNCAR: TStringField;
    qPedidosWebPWB_RESULTADO: TStringField;
    qPedidosWebPWB_RACA: TStringField;
    qPedidosWebPWB_NUNEND: TStringField;
    qPedidosWebPWB_CEP: TStringField;
    qPedidosWebPWB_BAIRRO: TStringField;
    qPedidosWebPWB_SINTOMAS: TStringField;
    qPedidosWebPWB_UF: TStringField;
    qPedidosWebPWB_END: TStringField;
    qPedidosWebPWB_CIES: TStringField;
    qPedidosWebPWB_ESCV: TStringField;
    qPedidosWebPWB_SINTOMA1: TSmallintField;
    qPedidosWebPWB_SINTOMA2: TSmallintField;
    qPedidosWebPWB_SINTOMA3: TSmallintField;
    qPedidosWebPWB_SINTOMA4: TSmallintField;
    qPedidosWebPWB_SINTOMA5: TSmallintField;
    qPedidosWebPWB_SINTOMA6: TSmallintField;
    qPedidosWebPWB_SINTOMA7: TSmallintField;
    qPedidosWebPWB_SINTOMA8: TSmallintField;
    qPedidosWebPWB_SINTOMA9: TSmallintField;
    qPedidosWebPWB_SINTOMA10: TSmallintField;
    qPedidosWebPWB_AUTOMA: TIntegerField;
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
    qConsultaPedidosWeb: TADOQuery;
    qConsultaPedidosWebPWB_DCAD: TDateField;
    qConsultaPedidosWebPWB_NOME: TStringField;
    qConsultaPedidosWebPWB_DNAS: TDateField;
    qConsultaPedidosWebPWB_CPF: TStringField;
    qConsultaPedidosWebLAB_LABT: TStringField;
    qConsultaPedidosWebPWB_FG_RESUL: TSmallintField;
    qConsultaPedidosWebPWB_NUNCAR: TStringField;
    qConsultaPedidosWebPWB_RACA: TStringField;
    qConsultaPedidosWebPWB_NUNEND: TStringField;
    qConsultaPedidosWebPWB_CEP: TStringField;
    qConsultaPedidosWebPWB_BAIRRO: TStringField;
    qConsultaPedidosWebPWB_SINTOMAS: TStringField;
    qConsultaPedidosWebPWB_UF: TStringField;
    qConsultaPedidosWebPWB_END: TStringField;
    qConsultaPedidosWebPWB_CIES: TStringField;
    qConsultaPedidosWebPWB_COD: TIntegerField;
    qConsultaPedidosWebPWB_PROT: TStringField;
    qConsultaPedidosWebPWB_IDPD: TStringField;
    qConsultaPedidosWebPWB_EMAIL: TStringField;
    qConsultaPedidosWebPWB_PASS: TStringField;
    qConsultaPedidosWebPWB_CVN: TIntegerField;
    qConsultaPedidosWebPWB_TELE: TStringField;
    qConsultaPedidosWebPWB_SEXO: TStringField;
    qConsultaPedidosWebPWB_DCOLE: TDateField;
    qConsultaPedidosWebPWB_HCOLE: TTimeField;
    qConsultaPedidosWebPWB_RG: TStringField;
    qConsultaPedidosWebPWB_ORD: TSmallintField;
    qConsultaPedidosWebPWB_CONVENIO: TStringField;
    qConsultaPedidosWebPWB_PRAZO: TStringField;
    qConsultaPedidosWebPWB_CLAORI: TStringField;
    qConsultaPedidosWebPWB_RESULTADO: TStringField;
    ds_ConsultaPedidosWeb: TDataSource;
    qConsultaPedidos: TADOQuery;
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
    qConsultaPedidosPES_NUMCAR: TStringField;
    qConsultaPedidosPES_CLAORI: TStringField;
    qValorAcordo: TADOQuery;
    qValorAcordoVALOR: TBCDField;
    qConsultaPacientes: TADOQuery;
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
    qLimpaXMarcados: TADOQuery;
    qAtualizaCodigo: TADOQuery;
    Timer3: TTimer;
    procedure CadastroAutoma;
    function GetStrNumber(const S: string): string;
    procedure Timer3Timer(Sender: TObject);
    procedure bbtAutormaticoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fServicoAutoma: TfServicoAutoma;

implementation

uses ufDMI, ufDM, ufImprimeComprovante;

{$R *.dfm}

function TfServicoAutoma.GetStrNumber(const S: string): string;
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

procedure TfServicoAutoma.CadastroAutoma;
var ProximoPaciente, ProximoProcedimento, Numero: Integer;
    Sequencial, AnoS, Letra, Caixa, Posicao, CPF, MesFinal, SequencialFinal, AnoFinal : String;
    Ano, Mes, Dia, anoatual, mesatual, diaatual, anoi, mesi, diai, idade : word;
begin
DECODEDATE(Date, Ano, Mes, Dia);

qCadastraCasosLote.Close;
qCadastraCasosLote.SQL.Clear;
qCadastraCasosLote.SQL.Add(' select * from TB_PEDIDOS_WEB pr');
qCadastraCasosLote.SQL.Add(' where pr.PWB_AUTOMA = :Valor ');
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


  if (qConsultaPedidos.RecordCount > 0)
  then begin
         qCadastraCasosLote.Next;
       end else begin

                  qPedidosWebGera.Close;
                  qPedidosWebGera.Parameters.ParamByName('Codigo').Value := qCadastraCasosLotePWB_COD.Value;;
                  qPedidosWebGera.Open;

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
                           DMI.qPacientesPES_NOME.Value    := RemoveAcento(UpperCase(qPedidosWebGeraPWB_NOME.Value));
                           DMI.qPacientesPES_CPF.Value     := qPedidosWebGeraPWB_CPF.Value;
                           DMI.qPacientesPES_NUMCAR.Value  := qPedidosWebGeraPWB_NUNCAR.Value;
                           DMI.qPacientesPES_CLAORI.Value  := qPedidosWebGeraPWB_CLAORI.Value;

                           DMI.qPacientesPES_RG.Value      := qPedidosWebGeraPWB_RG.Value;
                           DMI.qPacientesPES_END.Value     := qPedidosWebGeraPWB_END.Value;
                           DMI.qPacientesPES_NUNEND.Value  := qPedidosWebGeraPWB_NUNEND.Value;
                           DMI.qPacientesPES_BAIRRO.Value  := qPedidosWebGeraPWB_BAIRRO.Value;
                           DMI.qPacientesPES_CIES.Value    := qPedidosWebGeraPWB_CIES.Value;
                           DMI.qPacientesPES_UF.Value      := qPedidosWebGeraPWB_UF.Value;
                           DMI.qPacientesPES_SINTOMAS.Value:= qPedidosWebGeraPWB_SINTOMAS.Value;
                           DMI.qPacientesPES_RACA.Value    := qPedidosWebGeraPWB_RACA.Value;
                           DMI.qPacientesPES_SEXO.Value    := qPedidosWebGeraPWB_SEXO.Value;
                           DMI.qPacientesPES_FCEL.Value    := qPedidosWebGeraPWB_TELE.Value;
                           DMI.qPacientesPES_ESCV.Value    := qPedidosWebGeraPWB_ESCV.Value;
                           DMI.qPacientesPES_PASS.Value    := qPedidosWebGeraPWB_PASS.Value;

                           DMI.qPacientesPES_SINTOMA1.Value:= qPedidosWebGeraPWB_SINTOMA1.Value;
                           DMI.qPacientesPES_SINTOMA2.Value:= qPedidosWebGeraPWB_SINTOMA2.Value;
                           DMI.qPacientesPES_SINTOMA3.Value:= qPedidosWebGeraPWB_SINTOMA3.Value;
                           DMI.qPacientesPES_SINTOMA4.Value:= qPedidosWebGeraPWB_SINTOMA4.Value;
                           DMI.qPacientesPES_SINTOMA5.Value:= qPedidosWebGeraPWB_SINTOMA5.Value;
                           DMI.qPacientesPES_SINTOMA6.Value:= qPedidosWebGeraPWB_SINTOMA6.Value;
                           DMI.qPacientesPES_SINTOMA7.Value:= qPedidosWebGeraPWB_SINTOMA7.Value;
                           DMI.qPacientesPES_SINTOMA8.Value:= qPedidosWebGeraPWB_SINTOMA8.Value;
                           DMI.qPacientesPES_SINTOMA9.Value:= qPedidosWebGeraPWB_SINTOMA9.Value;
                           DMI.qPacientesPES_SINTOMA10.Value:= qPedidosWebGeraPWB_SINTOMA10.Value;


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

                          // SITE
                          if (qPedidosWebGeraPWB_CPF.Value <> '')
                          then begin

                                DMI.ADOC_MYSQL.Connected := True;

                                DMI.qConsultaUsuarioWeb.Close;
                                DMI.qConsultaUsuarioWeb.Parameters.ParamByName('login').Value := GetStrNumber(qPedidosWebGeraPWB_CPF.Value);
                                DMI.qConsultaUsuarioWeb.Open;

                                if (DMI.qConsultaUsuarioWeb.RecordCount <= 0)
                                then begin
                                       with DMI.qUsuarioWeb do
                                       begin
                                         Close;
                                         SQL.Clear;
                                         SQL.Add(' INSERT INTO rdcbco37_resultados.tb_usuarios_ipcms (login, senha, nome) VALUES (:usuario,old_password(:senha),:nome) ');
                                         Parameters.ParamByName('usuario').Value      := GetStrNumber(qPedidosWebGeraPWB_CPF.Value);
                                         Parameters.ParamByName('senha').Value        := Copy(trim(GetStrNumber(qPedidosWebGeraPWB_CPF.Value)),1,5) ;
                                         Parameters.ParamByName('nome').Value         := qPedidosWebGeraPWB_NOME.Value;
                                         ExecSQL;
                                       end;
                                    end;

                                DMI.ADOC_MYSQL.Connected := False;
                              end;
                          //


                         end else ProximoPaciente := qConsultaPacientesPES_COD.Value;
                    // Fecha Paciente

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
                      DMI.qProcedimentosPRO_DCAD.Value  := Date;
                      DMI.qProcedimentosPRO_DCOL.Value  := Date;
                      DMI.qProcedimentosPRO_DREC.Value  := Date;
                      //DMI.qProcedimentosPRO_HCOL.Value  := Time;
                      DMI.qProcedimentosPRO_DENT.Value  := Date + 3;
                      DMI.qProcedimentosPRO_HCAD.Value  := TimeToStr(Time);
                      DMI.qProcedimentosEXA_COD.Value   := 'COVID-19';
                      DMI.qProcedimentosLAB_COD.Value   := 1;
                      DMI.qProcedimentosPES_COD.Value   := ProximoPaciente;
                      DMI.qProcedimentosMED_CRM.Value   := '1';
                      DMI.qProcedimentosPRO_APA.Value   := 'Sim';
                      DMI.qProcedimentosPRO_PRAZO.Value := '48 HORAS';
                      DMI.qProcedimentosLAB_COD.Value   := qPedidosWebGeraPWB_CVN.Value;
                      DMI.qProcedimentosPRO_TIPPAG.Value:= 'DINHEIRO';
                      DMI.qProcedimentosPRO_VALOR.Value := 420;
                      DMI.qProcedimentosPRO_ATEND.Value := dm.qHostsHOS_USUA.Value;
                      DMI.qProcedimentosPRO_IDWEB.Value := StrToInt(qPedidosWebGeraPWB_IDPD.Value);
                      DMI.qProcedimentos.Post;

                      DMI.qStatusProcedimentos.Close;
                      DMI.qStatusProcedimentos.Open;
                      DMI.qStatusProcedimentos.Append;
                      DMI.qStatusProcedimentosPRO_COD.Value    := DMI.qProcedimentosPRO_COD.Value;
                      DMI.qStatusProcedimentosSTP_DATA.Value   := Date;
                      DMI.qStatusProcedimentosSTP_STATUS.Value := 1;
                      DMI.qStatusProcedimentosSTP_DESC.Value   := 'Cadastramento realizado';
                      DMI.qStatusProcedimentos.Post;



                      if (DM.qParametrosPAM_IMPETQ.Value = 1)
                      then begin
                            try
                              //Imprime Etiqueta
                              DMI.qInfecto.Close;
                              DMI.qInfecto.Parameters.ParamByName('Codigo').Value := DMI.qProcedimentosPRO_COD.Value;
                              DMI.qInfecto.Open;

                              Application.CreateForm(TfImprimeComprovante,fImprimeComprovante);
                              fImprimeComprovante.RLA_NOME_2.Caption      :=  DMI.qInfectoPES_NOME.Value;
                              fImprimeComprovante.RLA_CASODATA_2.Caption  :=  'Caso: ' + IntToStr(DMI.qInfectoPRO_COD.Value) + ' / Dt. Amostra: ' + DateToStr(DMI.qInfectoPRO_DCOL.Value);
                              fImprimeComprovante.RLA_PRAZO_2.Caption     :=  'Prazo: ' + DMI.qInfectoPRO_PRAZO.Value;
                              fImprimeComprovante.RLA_CONVENIO_2.Caption  :=  'Origem: ' + DMI.qInfectoLAB_LABT.Value;
                              fImprimeComprovante.RLBcode.Caption         :=  IntToStr(DMI.qInfectoPRO_COD.Value);
                              fImprimeComprovante.RLR_Infecto2.PrintDialog := false;
                              fImprimeComprovante.RLR_Infecto2.Print;
                              fImprimeComprovante.Free;
                              //Fim
                            Except
                            end;  
                           end;

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
  SQL.Add(' delete from TB_PEDIDOS_WEB where PWB_AUTOMA = :Valor ');
  Parameters.ParamByName('Valor').Value := 1;
  ExecSQL;
end;
end;


procedure TfServicoAutoma.Timer3Timer(Sender: TObject);
begin
Timer3.Enabled := False;
try
 //Configura para 1800000 = 30 minutos
 bbtAutormatico.Enabled := True;
 bbtAutormatico.Click;
 finally
 Timer3.Enabled := True;
 bbtAutormatico.Enabled := False;
 

end;
end;

procedure TfServicoAutoma.bbtAutormaticoClick(Sender: TObject);
var  i, Linha, NumeroSheets, Proximo  : Integer ;
     MesGerando, VerificaMensagem, Probabilidade, Arquivo, f_NomePDF, TemValor, DataNas, CPF, Sexo : String;
begin
// Web
try
  DMI.ADOC_MYSQL.Connected := True;
  DMI.qPedidosWebLista.Close;
  DMI.qPedidosWebLista.Open;
  DMI.qPedidosWebLista.RecordCount;
  DMI.qPedidosWebLista.First;
  while not DMI.qPedidosWebLista.Eof do
  begin
    Proximo:= 0;
    qPedidosWebMax.Close;
    qPedidosWebMax.Open;
    Proximo:=qPedidosWebMaxULTIMO.Value + 1;

    qPedidosWeb.Append;
    qPedidosWebPWB_COD.Value    := Proximo;
    qPedidosWebPWB_DCAD.Value   := Date;
    qPedidosWebPWB_NOME.Value   := DMI.qPedidosWebListanome_completo.Value;
    DataNas := DateToStr(DMI.qPedidosWebListadata_de_nascimento.Value);
    if ( DataNas <> '')
    then begin
          qPedidosWebPWB_DNAS.Value   := DMI.qPedidosWebListadata_de_nascimento.Value;
         end;
    CPF := DMI.qPedidosWebListacpf.Value;
    if (CPF <> '')
    then begin
          qPedidosWebPWB_CPF.Value    := DMI.qPedidosWebListacpf.Value;
         end;
    qPedidosWebPWB_CVN.Value    := 1;

    Sexo := DMI.qPedidosWebListasexo.Value;
    if (Sexo = 'Masculino')
    then begin
          qPedidosWebPWB_SEXO.Value   := 'Masculino';
         end else qPedidosWebPWB_SEXO.Value   := 'Feminino';

    qPedidosWebPWB_RG.Value      := DMI.qPedidosWebListarg.Value;
    qPedidosWebPWB_NUNCAR.Value  := DMI.qPedidosWebListacartao.Value;
    qPedidosWebPWB_PASS.Value    := DMI.qPedidosWebListanumero_do_passaporte.Value;
    qPedidosWebPWB_END.Value     := DMI.qPedidosWebListaruadomicilio.Value;
    qPedidosWebPWB_NUNEND.Value  := DMI.qPedidosWebListanumerodomicilio.Value;
    qPedidosWebPWB_BAIRRO.Value  := DMI.qPedidosWebListabairroomicilio.Value;
    qPedidosWebPWB_UF.Value      := DMI.qPedidosWebListauf.Value;
    qPedidosWebPWB_CIES.Value    := DMI.qPedidosWebListacidade.Value;
    qPedidosWebPWB_TELE.Value    := DMI.qPedidosWebListatelefone.Value;
    qPedidosWebPWB_EMAIL.Value   := DMI.qPedidosWebListaemail.Value;
    qPedidosWebPWB_ESCV.Value    := DMI.qPedidosWebListaestadocivil.Value;
    qPedidosWebPWB_IDPD.Value    := IntToStr(DMI.qPedidosWebListaid.Value);
    qPedidosWebPWB_AUTOMA.Value  := 1;

    qPedidosWebPWB_SINTOMA1.Value:= StrToInt(DMI.qPedidosWebListasintoma1.Value);
    qPedidosWebPWB_SINTOMA2.Value:= StrToInt(DMI.qPedidosWebListasintoma2.Value);
    qPedidosWebPWB_SINTOMA3.Value:= StrToInt(DMI.qPedidosWebListasintoma3.Value);
    qPedidosWebPWB_SINTOMA4.Value:= StrToInt(DMI.qPedidosWebListasintoma4.Value);
    qPedidosWebPWB_SINTOMA5.Value:= StrToInt(DMI.qPedidosWebListasintoma5.Value);
    qPedidosWebPWB_SINTOMA6.Value:= StrToInt(DMI.qPedidosWebListasintoma6.Value);
    qPedidosWebPWB_SINTOMA7.Value:= StrToInt(DMI.qPedidosWebListasintoma7.Value);
    qPedidosWebPWB_SINTOMA8.Value:= StrToInt(DMI.qPedidosWebListasintoma8.Value);
    qPedidosWebPWB_SINTOMA9.Value:= StrToInt(DMI.qPedidosWebListasintoma9.Value);
    qPedidosWebPWB_SINTOMA10.Value:= StrToInt(DMI.qPedidosWebListasintoma10.Value);
    qPedidosWeb.Post;

    DMI.qPedidosWebLista.Next;
   end;
   DMI.ADOC_MYSQL.Connected := False;

   CadastroAutoma;

except
//  ShowMessage('Internet com problemas, erro na leitura dos dados da Web. Tente novamente!');
  DMI.ADOC_MYSQL.Connected := False;
end;
end; // Fim Web


procedure TfServicoAutoma.FormShow(Sender: TObject);
begin
qPedidosWeb.Open;
DMI.qProcedimentos.Open;
DMI.qProcedimentos_Resultado.Open;
DMI.qProcedimentos_Carga.Open;
DMI.qParcelamento_Infe.Open;
DM.qParametros.Open;
DMI.qPacientes.Open;
DMI.qExames.Open;
DMI.qLaboratorios.Open;
DMI.qMedico.Open;
DMI.qConsultaPacientes.Open;
DMI.qSequencial.Open;
end;

end.
