unit ufImportaProcedimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls, Buttons, DB, ADODB, Math,
  Menus, Grids, DBGrids, COMobj, ExtCtrls, JvExControls, JvDBLookup, JvExMask,
  JvToolEdit;

type
  TfImportaFacil = class(TForm)
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
    Label25: TLabel;
    RxDBLookupComboColeta: TJvDBLookupCombo;
    sbCLocal: TSpeedButton;
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
    cb_Prazo: TComboBox;
    Label1: TLabel;
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
    qConsultaPedidosWebPWB_CONVENIO: TStringField;
    qConsultaPedidosWebPWB_PRAZO: TStringField;
    qConsultaPedidosWebPWB_CLAORI: TStringField;
    qPedidosWebPWB_CONVENIO: TStringField;
    qPedidosWebPWB_PRAZO: TStringField;
    qPedidosWebPWB_CLAORI: TStringField;
    qConsultaPedidosWebPWB_NUNCAR: TStringField;
    qPedidosWebPWB_NUNCAR: TStringField;
    qPedidosWebGeraPWB_CONVENIO: TStringField;
    qPedidosWebGeraPWB_PRAZO: TStringField;
    qPedidosWebGeraPWB_CLAORI: TStringField;
    qPedidosWebGeraPWB_NUNCAR: TStringField;
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
    qConsultaPedidosWebPWB_RESULTADO: TStringField;
    rg_Tipo: TRadioGroup;
    qPedidosWebPWB_RESULTADO: TStringField;
    qPedidosWebPWB_RACA: TStringField;
    qPedidosWebPWB_NUNEND: TStringField;
    qPedidosWebPWB_CEP: TStringField;
    qPedidosWebPWB_BAIRRO: TStringField;
    qPedidosWebPWB_SINTOMAS: TStringField;
    qPedidosWebPWB_UF: TStringField;
    qConsultaPedidosWebPWB_RACA: TStringField;
    qConsultaPedidosWebPWB_NUNEND: TStringField;
    qConsultaPedidosWebPWB_CEP: TStringField;
    qConsultaPedidosWebPWB_BAIRRO: TStringField;
    qConsultaPedidosWebPWB_SINTOMAS: TStringField;
    qConsultaPedidosWebPWB_UF: TStringField;
    qConsultaPedidosWebPWB_END: TStringField;
    qPedidosWebPWB_END: TStringField;
    qPedidosWebPWB_CIES: TStringField;
    qConsultaPedidosWebPWB_CIES: TStringField;
    qPedidosWebGeraPWB_RESULTADO: TStringField;
    qPedidosWebGeraPWB_RACA: TStringField;
    qPedidosWebGeraPWB_NUNEND: TStringField;
    qPedidosWebGeraPWB_CEP: TStringField;
    qPedidosWebGeraPWB_BAIRRO: TStringField;
    qPedidosWebGeraPWB_SINTOMAS: TStringField;
    qPedidosWebGeraPWB_UF: TStringField;
    qPedidosWebGeraPWB_END: TStringField;
    qPedidosWebGeraPWB_CIES: TStringField;
    qAtualizaCodigo: TADOQuery;
    Label2: TLabel;
    EdtProcotolo: TEdit;
    qPedidosWebPWB_ESCV: TStringField;
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
    qValorAcordo: TADOQuery;
    qValorAcordoVALOR: TBCDField;
    qPedidosWebPWB_AUTOMA: TIntegerField;
    qPedidosWebPWB_EXAME: TSmallintField;
    qPedidosWebGeraPWB_AUTOMA: TIntegerField;
    qPedidosWebGeraPWB_EXAME: TSmallintField;
    Label3: TLabel;
    RxDBLookupComboExame: TJvDBLookupCombo;
    qSelExames: TADOQuery;
    qSelExamesEXA_COD: TStringField;
    qSelExamesEXA_DESC: TStringField;
    qSelExamesEXA_UNM: TIntegerField;
    qSelExamesEXA_SIN: TStringField;
    qSelExamesEXA_MET: TStringField;
    qSelExamesEXA_VRE: TStringField;
    qSelExamesEXA_RECM: TStringField;
    qSelExamesEXA_MATE: TStringField;
    qSelExamesEXA_VPAC: TBCDField;
    qSelExamesEXA_VLAB: TBCDField;
    qSelExamesEXA_OBSERV: TStringField;
    ds_SelExames: TDataSource;
    qContadorExames: TADOQuery;
    qContadorExamesQUANTIDADE: TIntegerField;
    edtOrigem: TJvDirectoryEdit;
    DBGrid: TDBGrid;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbConsultarClick(Sender: TObject);
    function GetStrNumber(const S: string): string;
    function RemoveNumeros(Const Texto:String):String;
    procedure qConsultaPedidosWebPWB_FG_RESULGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbCLocalClick(Sender: TObject);
    procedure sbCaminhoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rg_TipoClick(Sender: TObject);
    procedure Cadastra_COVID19;
    procedure Cadastra_INFLUENZA;
    procedure Cadastra_COVID_INFLUENZA;
    procedure Cadastra_PAINELVIRAL;
    procedure DBGridDblClick(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImportaFacil: TfImportaFacil;
  ProximoPaciente, ProximoProcedimento, Numero: Integer;
  ValorAcordo, ValorExame : Real;
  Sequencial : String;

implementation

uses ufDM, ufDMI, ufImprimeMapa, ufConsultaLaboratorios;

{$R *.dfm}

procedure TfImportaFacil.SpeedButton1Click(Sender: TObject);
begin
with qLimpaXMarcados do
begin
Close;
SQL.Clear;
SQL.Add(' update TB_PEDIDOS_WEB p set p.PWB_FG_RESUL = :Valor ');
Parameters.ParamByName('Valor').Value := 0;
ExecSQL;
end;

with qDeletaPedidos do
begin
Close;
SQL.Clear;
SQL.Add(' delete from TB_PEDIDOS_WEB ');
ExecSQL;
end;


DMI.qProcedimentos.Open;
DMI.qPacientes.Open;
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


procedure TfImportaFacil.SpeedButton2Click(Sender: TObject);
var AnoS, Letra, Caixa, Posicao, CPF, MesFinal, SequencialFinal, AnoFinal : String;
    Ano, Mes, Dia, anoatual, mesatual, diaatual, anoi, mesi, diai, idade : word;

begin
DECODEDATE(Date, Ano, Mes, Dia);

if MessageDlg(' Confirma a GeraÁ„o dos Cadastros em Lote? ',mtconfirmation,[mbyes,mbno],0) = mryes
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


        if (qConsultaPedidos.RecordCount > 0)
        then begin
              ShowMessage(' ::::: ATEN«√O ::::::  Paciente j· foi importado!   ::::: ATEN«√O :::::: ');
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
                                 DMI.qPacientesPES_NOME.Value    := RemoveAcento(UpperCase(qPedidosWebGeraPWB_NOME.Value));
                                 if (Length(GetStrNumber(qPedidosWebGeraPWB_CPF.Value)) > 6)
                                 then begin
                                       DMI.qPacientesPES_CPF.Value     := trim(qPedidosWebGeraPWB_CPF.Value);
                                      end;
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
                                               SQL.Add(' INSERT INTO rdcbco37_resultados.tb_usuarios_ipcms (login, senha, nome, passaporte,senhapass) VALUES (:usuario,password(:senha),:nome,:passaporte,password(:senhapass))');
                                               if (Length(GetStrNumber(qPedidosWebGeraPWB_CPF.Value)) > 6)
                                               then begin
                                                     Parameters.ParamByName('usuario').Value      := GetStrNumber(qPedidosWebGeraPWB_CPF.Value);
                                                     Parameters.ParamByName('senha').Value        := Copy(trim(GetStrNumber(qPedidosWebGeraPWB_CPF.Value)),1,5) ;
                                                    end;
                                               Parameters.ParamByName('nome').Value         := qPedidosWebGeraPWB_NOME.Value;
                                               Parameters.ParamByName('passaporte').Value   := trim(qPedidosWebGeraPWB_PASS.Value);
                                               Parameters.ParamByName('senhapass').Value    := Copy(trim(qPedidosWebGeraPWB_PASS.Value),1,5) ;
                                               ExecSQL;
                                             end;
                                          end;
                                          
                                      DMI.ADOC_MYSQL.Connected := False;
                                    end;
                                //


                               end else ProximoPaciente := qConsultaPacientesPES_COD.Value;
                          // Fecha Paciente


                          if (qPedidosWebGeraPWB_EXAME.Value = 1) // COVID-19
                          then begin
                                 Cadastra_COVID19;
                               end;
                          if (qPedidosWebGeraPWB_EXAME.Value = 2) // Influenza A e B Teste R·pido
                          then begin
                                 Cadastra_INFLUENZA;
                               end;
                          if (qPedidosWebGeraPWB_EXAME.Value = 3)  // COVID-19 e Influenza A e B Teste R·pido
                          then begin
                                 Cadastra_COVID_INFLUENZA;
                               end;
                          if (qPedidosWebGeraPWB_EXAME.Value = 4)  // RT-PCR Painel Viral
                          then begin
                                 Cadastra_PAINELVIRAL;
                               end;

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
        ShowMessage('GeraÁ„o de cadastros finalizada!');
        DMI.qPacientes.Open;
      end;
end;

procedure TfImportaFacil.Cadastra_COVID19;
begin
    //VALORES

    qContadorExames.Close;
    qContadorExames.Parameters.ParamByName('Labo').Value    := qPedidosWebGeraPWB_CVN.Value;
    qContadorExames.Parameters.ParamByName('DataIni').Value := '01/' + Copy(DateToStr(Date),4,10);
    qContadorExames.Parameters.ParamByName('DataFim').Value := Date;
    qContadorExames.Open;
    ValorExame  := 0;

    if (qPedidosWebGeraPWB_CVN.Value = 8)
    then begin
          ValorExame := 80;
         end else begin
                   if ((qContadorExamesQUANTIDADE.Value >=  0) and (qContadorExamesQUANTIDADE.Value <= 10))  then ValorExame := 110;
                   if ((qContadorExamesQUANTIDADE.Value >= 11) and (qContadorExamesQUANTIDADE.Value <= 50))  then ValorExame := 100;
                   if ((qContadorExamesQUANTIDADE.Value >= 51) and (qContadorExamesQUANTIDADE.Value <= 200)) then ValorExame := 90;
                   if ((qContadorExamesQUANTIDADE.Value >= 201)) then ValorExame := 85;
                  end;

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
  DMI.qProcedimentosPRO_PRAZO.Value := cb_Prazo.Text;
  DMI.qProcedimentosLAB_COD.Value   := qPedidosWebGeraPWB_CVN.Value;
  if (RxDBLookupComboColeta.KeyValue = 1)
  then begin
         DMI.qProcedimentosPRO_TIPPAG.Value:= 'DINHEIRO';
         if (cb_Prazo.Text = 'MESMO DIA') then DMI.qProcedimentosPRO_VALOR.Value := 780;
         if (cb_Prazo.Text = '24 HORAS')  then DMI.qProcedimentosPRO_VALOR.Value := 550;
         if (cb_Prazo.Text = '6 HORAS')  then DMI.qProcedimentosPRO_VALOR.Value  := 780;
         if (cb_Prazo.Text = '48 HORAS')  then DMI.qProcedimentosPRO_VALOR.Value := 420;
         if (cb_Prazo.Text = '72 HORAS')  then DMI.qProcedimentosPRO_VALOR.Value := 350;
       end else begin
                 DMI.qProcedimentosPRO_TIPPAG.Value := 'FATURADO';
                 DMI.qProcedimentosPRO_VALOR.Value  := ValorExame;
                end;
  DMI.qProcedimentosPRO_ATEND.Value := dm.qHostsHOS_USUA.Value;
  DMI.qProcedimentos.Post;

  //inherited;

  DMI.qStatusProcedimentos.Close;
  DMI.qStatusProcedimentos.Open;
  DMI.qStatusProcedimentos.Append;
  DMI.qStatusProcedimentosPRO_COD.Value    := DMI.qProcedimentosPRO_COD.Value;
  DMI.qStatusProcedimentosSTP_DATA.Value   := Date;
  DMI.qStatusProcedimentosSTP_STATUS.Value := 1;
  DMI.qStatusProcedimentosSTP_DESC.Value   := 'Cadastramento realizado';
  DMI.qStatusProcedimentos.Post;

  //PARCELAMENTO

  qValorAcordo.Close;
  qValorAcordo.Parameters.ParamByName('Labo').Value := DMI.qProcedimentosLAB_COD.Value;
  qValorAcordo.Open;

  DMI.qParcelamento_Infe.Open;
  DMI.qParcelamento_Infe.Last;
  DMI.qParcelamento_Infe.Append;
  DMI.qParcelamento_InfePRO_COD.Value          := DMI.qProcedimentosPRO_COD.Value;
  DMI.qParcelamento_InfePAR_ONDE.Value         := 'Infecciosas';
  DMI.qParcelamento_InfePAR_VLR.Value          := DMI.qProcedimentosPRO_VALOR.Value;
  DMI.qParcelamento_InfePAR_OBS.Value          := '';
  DMI.qParcelamento_InfePAR_DATA.Value         := Date;
  DMI.qParcelamento_InfePAR_DATAPREVISTA.Value := Date;
  DMI.qParcelamento_InfePAR_SIT.Value          := 1;
  DMI.qParcelamento_Infe.Post;

end;

procedure TfImportaFacil.Cadastra_INFLUENZA;
begin
    //VALORES

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
  DMI.qProcedimentosEXA_COD.Value   := 'INFLUENZA';
  DMI.qProcedimentosLAB_COD.Value   := 1;
  DMI.qProcedimentosPES_COD.Value   := ProximoPaciente;
  DMI.qProcedimentosMED_CRM.Value   := '1';
  DMI.qProcedimentosPRO_APA.Value   := 'Sim';
  DMI.qProcedimentosPRO_PRAZO.Value := cb_Prazo.Text;
  DMI.qProcedimentosLAB_COD.Value   := qPedidosWebGeraPWB_CVN.Value;
  if (RxDBLookupComboColeta.KeyValue = 1)
  then begin
         DMI.qProcedimentosPRO_TIPPAG.Value:= 'DINHEIRO';
         if (cb_Prazo.Text = 'MESMO DIA') then DMI.qProcedimentosPRO_VALOR.Value := 150;
       end;
  DMI.qProcedimentosPRO_ATEND.Value := dm.qHostsHOS_USUA.Value;
  DMI.qProcedimentos.Post;

  //inherited;

  DMI.qStatusProcedimentos.Close;
  DMI.qStatusProcedimentos.Open;
  DMI.qStatusProcedimentos.Append;
  DMI.qStatusProcedimentosPRO_COD.Value    := DMI.qProcedimentosPRO_COD.Value;
  DMI.qStatusProcedimentosSTP_DATA.Value   := Date;
  DMI.qStatusProcedimentosSTP_STATUS.Value := 1;
  DMI.qStatusProcedimentosSTP_DESC.Value   := 'Cadastramento realizado';
  DMI.qStatusProcedimentos.Post;

  //PARCELAMENTO

  qValorAcordo.Close;
  qValorAcordo.Parameters.ParamByName('Labo').Value := DMI.qProcedimentosLAB_COD.Value;
  qValorAcordo.Open;

  DMI.qParcelamento_Infe.Open;
  DMI.qParcelamento_Infe.Last;
  DMI.qParcelamento_Infe.Append;
  DMI.qParcelamento_InfePRO_COD.Value          := DMI.qProcedimentosPRO_COD.Value;
  DMI.qParcelamento_InfePAR_ONDE.Value         := 'Infecciosas';
  DMI.qParcelamento_InfePAR_VLR.Value          := DMI.qProcedimentosPRO_VALOR.Value;
  DMI.qParcelamento_InfePAR_OBS.Value          := '';
  DMI.qParcelamento_InfePAR_DATA.Value         := Date;
  DMI.qParcelamento_InfePAR_DATAPREVISTA.Value := Date;
  DMI.qParcelamento_InfePAR_SIT.Value          := 1;
  DMI.qParcelamento_Infe.Post;

end;

procedure TfImportaFacil.Cadastra_COVID_INFLUENZA;
begin
    //VALORES

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
  DMI.qProcedimentosEXA_COD.Value   := 'COVIDINFLU';
  DMI.qProcedimentosLAB_COD.Value   := 1;
  DMI.qProcedimentosPES_COD.Value   := ProximoPaciente;
  DMI.qProcedimentosMED_CRM.Value   := '1';
  DMI.qProcedimentosPRO_APA.Value   := 'Sim';
  DMI.qProcedimentosPRO_PRAZO.Value := cb_Prazo.Text;
  DMI.qProcedimentosLAB_COD.Value   := qPedidosWebGeraPWB_CVN.Value;
  if (RxDBLookupComboColeta.KeyValue = 1)
  then begin
         DMI.qProcedimentosPRO_TIPPAG.Value:= 'DINHEIRO';
         if (cb_Prazo.Text = 'MESMO DIA') then DMI.qProcedimentosPRO_VALOR.Value := 450;
         if (cb_Prazo.Text = '24 HORAS')  then DMI.qProcedimentosPRO_VALOR.Value := 300;
      end;
  DMI.qProcedimentosPRO_ATEND.Value := dm.qHostsHOS_USUA.Value;
  DMI.qProcedimentos.Post;

  //inherited;

  DMI.qStatusProcedimentos.Close;
  DMI.qStatusProcedimentos.Open;
  DMI.qStatusProcedimentos.Append;
  DMI.qStatusProcedimentosPRO_COD.Value    := DMI.qProcedimentosPRO_COD.Value;
  DMI.qStatusProcedimentosSTP_DATA.Value   := Date;
  DMI.qStatusProcedimentosSTP_STATUS.Value := 1;
  DMI.qStatusProcedimentosSTP_DESC.Value   := 'Cadastramento realizado';
  DMI.qStatusProcedimentos.Post;

  //PARCELAMENTO

  DMI.qParcelamento_Infe.Open;
  DMI.qParcelamento_Infe.Last;
  DMI.qParcelamento_Infe.Append;
  DMI.qParcelamento_InfePRO_COD.Value          := DMI.qProcedimentosPRO_COD.Value;
  DMI.qParcelamento_InfePAR_ONDE.Value         := 'Infecciosas';
  DMI.qParcelamento_InfePAR_VLR.Value          := DMI.qProcedimentosPRO_VALOR.Value;
  DMI.qParcelamento_InfePAR_OBS.Value          := '';
  DMI.qParcelamento_InfePAR_DATA.Value         := Date;
  DMI.qParcelamento_InfePAR_DATAPREVISTA.Value := Date;
  DMI.qParcelamento_InfePAR_SIT.Value          := 1;
  DMI.qParcelamento_Infe.Post;

end;

procedure TfImportaFacil.Cadastra_PAINELVIRAL;
begin
    //VALORES

    if (qPedidosWebGeraPWB_CVN.Value = 8)
    then begin
          ValorExame := 135;
         end else ValorExame := 180;

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
  DMI.qProcedimentosEXA_COD.Value   := 'PNLVIRAL';
  DMI.qProcedimentosLAB_COD.Value   := 1;
  DMI.qProcedimentosPES_COD.Value   := ProximoPaciente;
  DMI.qProcedimentosMED_CRM.Value   := '1';
  DMI.qProcedimentosPRO_APA.Value   := 'Sim';
  DMI.qProcedimentosPRO_PRAZO.Value := cb_Prazo.Text;
  DMI.qProcedimentosLAB_COD.Value   := qPedidosWebGeraPWB_CVN.Value;
  if (RxDBLookupComboColeta.KeyValue = 1)
  then begin
         DMI.qProcedimentosPRO_TIPPAG.Value:= 'DINHEIRO';
         if (cb_Prazo.Text = 'MESMO DIA') then DMI.qProcedimentosPRO_VALOR.Value := 520;
         if (cb_Prazo.Text = '24 HORAS')  then DMI.qProcedimentosPRO_VALOR.Value := 450;
         if (cb_Prazo.Text = 'URGENTE (3H)')  then DMI.qProcedimentosPRO_VALOR.Value := 1000;
         if (cb_Prazo.Text = 'S¡BADO (3H)')  then DMI.qProcedimentosPRO_VALOR.Value := 1300;
         if (cb_Prazo.Text = 'FINAL SEMANA (3H)')  then DMI.qProcedimentosPRO_VALOR.Value := 1700;
       end else begin
                 DMI.qProcedimentosPRO_TIPPAG.Value := 'FATURADO';
                 DMI.qProcedimentosPRO_VALOR.Value  := ValorExame;
                end;
  DMI.qProcedimentosPRO_ATEND.Value := dm.qHostsHOS_USUA.Value;
  DMI.qProcedimentos.Post;

  //inherited;

  DMI.qStatusProcedimentos.Close;
  DMI.qStatusProcedimentos.Open;
  DMI.qStatusProcedimentos.Append;
  DMI.qStatusProcedimentosPRO_COD.Value    := DMI.qProcedimentosPRO_COD.Value;
  DMI.qStatusProcedimentosSTP_DATA.Value   := Date;
  DMI.qStatusProcedimentosSTP_STATUS.Value := 1;
  DMI.qStatusProcedimentosSTP_DESC.Value   := 'Cadastramento realizado';
  DMI.qStatusProcedimentos.Post;

  //PARCELAMENTO

  DMI.qParcelamento_Infe.Open;
  DMI.qParcelamento_Infe.Last;
  DMI.qParcelamento_Infe.Append;
  DMI.qParcelamento_InfePRO_COD.Value          := DMI.qProcedimentosPRO_COD.Value;
  DMI.qParcelamento_InfePAR_ONDE.Value         := 'Infecciosas';
  DMI.qParcelamento_InfePAR_VLR.Value          := DMI.qProcedimentosPRO_VALOR.Value;
  DMI.qParcelamento_InfePAR_OBS.Value          := '';
  DMI.qParcelamento_InfePAR_DATA.Value         := Date;
  DMI.qParcelamento_InfePAR_DATAPREVISTA.Value := Date;
  DMI.qParcelamento_InfePAR_SIT.Value          := 1;
  DMI.qParcelamento_Infe.Post;

end;



procedure TfImportaFacil.DBGridDblClick(Sender: TObject);
begin
  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  (Sender as TDBGrid).DataSource.Dataset.Edit;

  (Sender as TDBGrid).DataSource.Dataset.FieldByName('PWB_FG_RESUL').AsInteger :=
    IfThen((Sender as TDBGrid).DataSource.Dataset.FieldByName('PWB_FG_RESUL').AsInteger = 1, 0, 1);

  (Sender as TDBGrid).DataSource.Dataset.Post;
end;

procedure TfImportaFacil.DBGridDrawColumnCell(Sender: TObject;
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

function TfImportaFacil.RemoveNumeros(Const Texto:String):String;
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

function TfImportaFacil.GetStrNumber(const S: string): string;
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

procedure TfImportaFacil.qConsultaPedidosWebPWB_FG_RESULGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
Text := EmptyStr;
end;

procedure TfImportaFacil.sbConsultarClick(Sender: TObject);
var excel :variant;
    MesGerando, VerificaMensagem, Probabilidade, Arquivo, f_NomePDF, TemValor, DataNas, CPF, Sexo : String;
    i, Linha, NumeroSheets, Proximo  : Integer ;
begin
with qDeletaPedidos do
begin
Close;
SQL.Clear;
SQL.Add(' delete from TB_PEDIDOS_WEB ');
ExecSQL;
end;

if (rg_Tipo.ItemIndex = 0)
then begin

      try
      excel := CreateOleObject('Excel.Application');
      if not Excel.Application.Visible then
      Arquivo := edtOrigem.Text;
      if FileExists(Arquivo)
      then begin
            Excel.WorkBooks.Open(Arquivo);
           end;

      NumeroSheets := 1;

      Linha := 3;
      qPedidosWeb.Open;
      for i := 1 to 120 do
      begin
        TemValor := '';
        TemValor := Trim(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]);
        if (Length(TemValor) >= 8)
        then begin
              Proximo:= 0;
              qPedidosWebMax.Close;
              qPedidosWebMax.Open;
              Proximo:=qPedidosWebMaxULTIMO.Value + 1;

              qPedidosWeb.Append;
              qPedidosWebPWB_COD.Value    := Proximo;
              qPedidosWebPWB_DCAD.Value   := Date;
              qPedidosWebPWB_NOME.Value   := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1];
              DataNas := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2];
              if ( DataNas <> '')
              then begin
                    qPedidosWebPWB_DNAS.Value   := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2];
                   end;
              CPF := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3];
              if (CPF <> '')
              then begin
                    qPedidosWebPWB_CPF.Value    := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3];
                   end;
              qPedidosWebPWB_CVN.Value     := RxDBLookupComboColeta.KeyValue;
              if (RxDBLookupComboExame.KeyValue = 'COVID-19')
              then begin
                    qPedidosWebPWB_EXAME.Value  := 1;
                   end;
              if (RxDBLookupComboExame.KeyValue = 'INFLUENZA')
              then begin
                    qPedidosWebPWB_EXAME.Value  := 2;
                   end;
              if (RxDBLookupComboExame.KeyValue = 'COVIDINFLU')
              then begin
                    qPedidosWebPWB_EXAME.Value  := 3;
                   end;
              if (RxDBLookupComboExame.KeyValue = 'PNLVIRAL')
              then begin
                    qPedidosWebPWB_EXAME.Value  := 4;
                   end;
              if ((qPedidosWebPWB_CVN.Value = 20) or (qPedidosWebPWB_CVN.Value = 5))
              then begin
                    qPedidosWebPWB_NUNCAR.Value := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4];
                    if ((qPedidosWebPWB_NUNCAR.Value <> '') and (Copy(qPedidosWebPWB_NUNCAR.Value,1,4) = '0051'))
                    then begin
                          qPedidosWebPWB_CLAORI.Value := 'LOCAL';
                         end else qPedidosWebPWB_CLAORI.Value := 'INTERC¬MBIO';
                   end;

              qPedidosWeb.Post;
            end;
        Linha:=Linha+1;
      end;
      showmessage('ImportaÁ„o Finalizada');
      Excel.quit;
      Excel:=unassigned;
      except
       showmessage('Erro Linha : ' + IntToStr(Linha));
       Excel.quit;
       Excel:=unassigned;
      end;

    end; // Fim Simples

if (rg_Tipo.ItemIndex = 1)
then begin

      try
      excel := CreateOleObject('Excel.Application');
      if not Excel.Application.Visible then
      Arquivo := edtOrigem.Text;
      if FileExists(Arquivo)
      then begin
            Excel.WorkBooks.Open(Arquivo);
           end;

      NumeroSheets := 1;

      Linha := 2;
      qPedidosWeb.Open;
      for i := 1 to 120 do
      begin
        TemValor := '';
        TemValor := Trim(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2]);
        if (Length(TemValor) >= 8)
        then begin
              Proximo:= 0;
              qPedidosWebMax.Close;
              qPedidosWebMax.Open;
              Proximo:=qPedidosWebMaxULTIMO.Value + 1;

              qPedidosWeb.Append;
              qPedidosWebPWB_COD.Value    := Proximo;
              qPedidosWebPWB_DCAD.Value   := Date;
              qPedidosWebPWB_NOME.Value   := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2];
              DataNas := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3];
              if ( DataNas <> '')
              then begin
                    qPedidosWebPWB_DNAS.Value   := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3];
                   end;
              CPF := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1];
              if (CPF <> '')
              then begin
                    qPedidosWebPWB_CPF.Value    := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1];
                   end;
              qPedidosWebPWB_CVN.Value    := RxDBLookupComboColeta.KeyValue;
              if (RxDBLookupComboExame.KeyValue = 'COVID-19')
              then begin
                    qPedidosWebPWB_EXAME.Value  := 1;
                   end;
              if (RxDBLookupComboExame.KeyValue = 'INFLUENZA')
              then begin
                    qPedidosWebPWB_EXAME.Value  := 2;
                   end;
              if (RxDBLookupComboExame.KeyValue = 'COVIDINFLU')
              then begin
                    qPedidosWebPWB_EXAME.Value  := 3;
                   end;
              if (RxDBLookupComboExame.KeyValue = 'PNLVIRAL')
              then begin
                    qPedidosWebPWB_EXAME.Value  := 4;
                   end;
              Sexo := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4];
              if (Sexo = 'MASCULINO')
              then begin
                    qPedidosWebPWB_SEXO.Value   := 'Masculino';
                   end else qPedidosWebPWB_SEXO.Value   := 'Feminino';

              qPedidosWebPWB_RACA.Value    := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5];
              qPedidosWebPWB_CEP.Value     := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6];
              qPedidosWebPWB_END.Value     := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7];
              qPedidosWebPWB_NUNEND.Value  := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,8];
              qPedidosWebPWB_BAIRRO.Value  := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,9];
              qPedidosWebPWB_UF.Value      := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,10];
              qPedidosWebPWB_CIES.Value    := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,11];
              qPedidosWebPWB_TELE.Value    := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,12];
              qPedidosWebPWB_SINTOMAS.Value:= Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,13];

              qPedidosWeb.Post;
            end;
        Linha:=Linha+1;
      end;
      showmessage('ImportaÁ„o Finalizada');
      Excel.quit;
      Excel:=unassigned;
      except
       showmessage('Erro Linha : ' + IntToStr(Linha));
       Excel.quit;
       Excel:=unassigned;
      end;
    end; // Fim Concentrada

if (rg_Tipo.ItemIndex = 2) //WEB
then begin

      try
      DMI.ADOC_MYSQL.Connected := True;

      DMI.qPedidosWebNew.Close;
      DMI.qPedidosWebNew.Parameters.ParamByName('Protocolo').Value := trim(EdtProcotolo.Text);
      DMI.qPedidosWebNew.Open;

      if (DMI.qPedidosWebNew.RecordCount > 0)
      then begin
            if ((DMI.qPedidosWebNewcpf.Value <> '') or (DMI.qPedidosWebNewnumero_do_passaporte.Value <> ''))
            then begin
                  Proximo:= 0;
                  qPedidosWebMax.Close;
                  qPedidosWebMax.Open;
                  Proximo:=qPedidosWebMaxULTIMO.Value + 1;

                  qPedidosWeb.Open;
                  qPedidosWeb.Append;
                  qPedidosWebPWB_COD.Value    := Proximo;
                  qPedidosWebPWB_DCAD.Value   := Date;
                  qPedidosWebPWB_NOME.Value   := DMI.qPedidosWebNewnome_completo.Value;
                  DataNas := DateToStr(DMI.qPedidosWebNewdata_de_nascimento.Value);
                  if ( DataNas <> '')
                  then begin
                        qPedidosWebPWB_DNAS.Value   := DMI.qPedidosWebNewdata_de_nascimento.Value;
                       end;
                  CPF := trim(DMI.qPedidosWebNewcpf.Value);
                  if (CPF <> '')
                  then begin
                        qPedidosWebPWB_CPF.Value    := DMI.qPedidosWebNewcpf.Value;
                       end;
                  qPedidosWebPWB_CVN.Value    := RxDBLookupComboColeta.KeyValue;

                  Sexo := DMI.qPedidosWebNewsexo.Value;
                  if (Sexo = 'Masculino')
                  then begin
                        qPedidosWebPWB_SEXO.Value   := 'Masculino';
                       end else qPedidosWebPWB_SEXO.Value   := 'Feminino';

                  qPedidosWebPWB_RG.Value       := DMI.qPedidosWebNewrg.Value;
                  qPedidosWebPWB_NUNCAR.Value   := DMI.qPedidosWebNewcartao.Value;
                  qPedidosWebPWB_PASS.Value     := DMI.qPedidosWebNewnumero_do_passaporte.Value;
                  qPedidosWebPWB_END.Value      := DMI.qPedidosWebNewruadomicilio.Value;
                  qPedidosWebPWB_NUNEND.Value   := DMI.qPedidosWebNewnumerodomicilio.Value;
                  qPedidosWebPWB_BAIRRO.Value   := DMI.qPedidosWebNewbairroomicilio.Value;
                  qPedidosWebPWB_UF.Value       := DMI.qPedidosWebNewuf.Value;
                  qPedidosWebPWB_CIES.Value     := DMI.qPedidosWebNewcidade.Value;
                  qPedidosWebPWB_TELE.Value     := DMI.qPedidosWebNewtelefone.Value;
                  qPedidosWebPWB_EMAIL.Value    := DMI.qPedidosWebNewemail.Value;
                  qPedidosWebPWB_ESCV.Value     := DMI.qPedidosWebNewestadocivil.Value;
                  qPedidosWebPWB_IDPD.Value     := IntToStr(DMI.qPedidosWebNewid.Value);

                  qPedidosWebPWB_SINTOMA1.Value := StrToInt(DMI.qPedidosWebNewsintoma1.Value);
                  qPedidosWebPWB_SINTOMA2.Value := StrToInt(DMI.qPedidosWebNewsintoma2.Value);
                  qPedidosWebPWB_SINTOMA3.Value := StrToInt(DMI.qPedidosWebNewsintoma3.Value);
                  qPedidosWebPWB_SINTOMA4.Value := StrToInt(DMI.qPedidosWebNewsintoma4.Value);
                  qPedidosWebPWB_SINTOMA5.Value := StrToInt(DMI.qPedidosWebNewsintoma5.Value);
                  qPedidosWebPWB_SINTOMA6.Value := StrToInt(DMI.qPedidosWebNewsintoma6.Value);
                  qPedidosWebPWB_SINTOMA7.Value := StrToInt(DMI.qPedidosWebNewsintoma7.Value);
                  qPedidosWebPWB_SINTOMA8.Value := StrToInt(DMI.qPedidosWebNewsintoma8.Value);
                  qPedidosWebPWB_SINTOMA9.Value := StrToInt(DMI.qPedidosWebNewsintoma9.Value);
                  qPedidosWebPWB_SINTOMA10.Value:= StrToInt(DMI.qPedidosWebNewsintoma10.Value);

                  qPedidosWebPWB_EXAME.Value    := StrToInt(DMI.qPedidosWebNewexame.Value);

                  qPedidosWeb.Post;
                 end else begin
                            ShowMessage('Cadastro Web n„o possui CPF e/ou Passaporte preenchido, caso n„o ser· importado!');
                          end;
                 DMI.ADOC_MYSQL.Connected := False;
       end;

      except
        ShowMessage('Internet com problemas, erro na leitura dos dados da Web. Tente novamente!');
        DMI.ADOC_MYSQL.Connected := False;
      end;
    end; // Fim Web

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

procedure TfImportaFacil.FormClose(Sender: TObject;
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

procedure TfImportaFacil.sbCLocalClick(Sender: TObject);
begin
 Application.CreateForm(TfConsultaLaboratorios, fConsultaLaboratorios);
 fConsultaLaboratorios.Showmodal;
 RxDBLookupComboColeta.KeyValue := DMI.qConsultaLaboratoriosLAB_COD.Value;
 fConsultaLaboratorios.Free;
end;

procedure TfImportaFacil.sbCaminhoClick(Sender: TObject);
begin
  if opndlgOrigem.Execute then
     edtOrigem.Text := opndlgOrigem.FileName;
end;

procedure TfImportaFacil.FormShow(Sender: TObject);
begin
DM.qHosts.Open;
DMI.qLaboratorios.Open;
qSelExames.Open;
end;

procedure TfImportaFacil.rg_TipoClick(Sender: TObject);
begin
if (rg_Tipo.ItemIndex = 2)
then begin
      EdtProcotolo.Enabled := True;
      Label2.Enabled       := True;
      Label21.Enabled      := False;
      edtOrigem.Enabled    := False;
      sbCaminho.Enabled    := False;
     end else begin
                EdtProcotolo.Enabled := False;
                Label2.Enabled       := False;
                Label21.Enabled      := True;
                edtOrigem.Enabled    := True;
                sbCaminho.Enabled    := True;
              end;
end;

end.
