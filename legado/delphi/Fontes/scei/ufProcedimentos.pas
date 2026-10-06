unit ufProcedimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, DBCtrls, Buttons, ExtCtrls, StdCtrls, Mask,
  ComCtrls, Grids, DBGrids, ADODB, Menus,
  RLReport, RLBarcode, JvExMask, JvToolEdit,
  JvDBControls, JvBaseEdits;

type
  TfProcedimentos = class(TfPadrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit6: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    sbLaudo: TSpeedButton;
    bbtConsultaPacientes: TBitBtn;
    sbComprovante: TSpeedButton;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    sbConsultarLab: TBitBtn;
    gbResultado: TGroupBox;
    bbtConsultaLaboratorios: TBitBtn;
    ds_Parcelamento: TDataSource;
    qManutencaoParcelamento: TADOQuery;
    DBDateEdit1: TJvDBDateEdit;
    DBDateEdit6: TJvDBDateEdit;
    Label18: TLabel;
    DBEdit12: TDBEdit;
    PM_Documentos: TPopupMenu;
    Comprovante1: TMenuItem;
    N1: TMenuItem;
    EtiquetaTubo1: TMenuItem;
    N5: TMenuItem;
    Mapa1: TMenuItem;
    N7: TMenuItem;
    SenhasdeAtendimento1: TMenuItem;
    qValorExames: TADOQuery;
    qValorExamesEXA_VPAC: TBCDField;
    DBGrid_Resultados: TDBGrid;
    bbtResultados: TBitBtn;
    Label31: TLabel;
    DBEdit16: TDBEdit;
    bbtEtiqueta: TBitBtn;
    cb_Prazo: TDBComboBox;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Mdciso1: TMenuItem;
    N16: TMenuItem;
    Pacientes1: TMenuItem;
    N2: TMenuItem;
    Exames1: TMenuItem;
    N3: TMenuItem;
    LaboratriosConveniados1: TMenuItem;
    N4: TMenuItem;
    Sair2: TMenuItem;
    Procedimentos1: TMenuItem;
    Procedimentos2: TMenuItem;
    N8: TMenuItem;
    Infecciosas1: TMenuItem;
    N6: TMenuItem;
    ImportaFcil1: TMenuItem;
    Relatrios1: TMenuItem;
    Geral1: TMenuItem;
    DBLookupComboBox3: TDBLookupComboBox;
    Label7: TLabel;
    Label10: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    Label12: TLabel;
    DBLookupComboBox6: TDBLookupComboBox;
    Label14: TLabel;
    DBLookupComboBox7: TDBLookupComboBox;
    Label8: TLabel;
    DBLookupComboBox8: TDBLookupComboBox;
    qBuscaPessoa: TADOQuery;
    qBuscaPessoaPES_COD: TIntegerField;
    qBuscaPessoaPES_NOME: TStringField;
    qBuscaPessoaPES_ESCV: TStringField;
    qBuscaPessoaPES_IDA: TIntegerField;
    qBuscaPessoaPES_SEXO: TStringField;
    qBuscaPessoaPES_DNAS: TDateField;
    qBuscaPessoaPES_END: TStringField;
    qBuscaPessoaPES_CIES: TStringField;
    qBuscaPessoaPES_FRES: TStringField;
    qBuscaPessoaPES_FCEL: TStringField;
    qBuscaPessoaPES_CPF: TStringField;
    qBuscaPessoaPES_RG: TStringField;
    qBuscaPessoaPES_COD_INTERNET: TSmallintField;
    qBuscaPessoaPES_EMAIL: TStringField;
    qBuscaPessoaPES_NUMCAR: TStringField;
    qBuscaPessoaPES_CLAORI: TStringField;
    qAtualizaPessoa: TADOQuery;
    Label15: TLabel;
    DBEdit5: TDBEdit;
    Label16: TLabel;
    DBComboBox2: TDBComboBox;
    sbFinanceiro: TSpeedButton;
    tbHonorarios: TTabSheet;
    Panel1: TPanel;
    bbtNovo: TBitBtn;
    bbtExcluir: TBitBtn;
    bbtSalvar: TBitBtn;
    bbtCancelar: TBitBtn;
    BitBtn1: TBitBtn;
    GroupBox8: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label22: TLabel;
    Label41: TLabel;
    ComboBoxParcelas: TComboBox;
    ComboBoxTipoPagamento: TComboBox;
    EdtObservacao: TEdit;
    GroupBox9: TGroupBox;
    DBGridPag: TDBGrid;
    Label17: TLabel;
    DBLookupComboBox9: TDBLookupComboBox;
    Utilitrios1: TMenuItem;
    ZerarProtocolo1: TMenuItem;
    bbtPaciente: TBitBtn;
    Label19: TLabel;
    Label6: TLabel;
    Label26: TLabel;
    GroupBox1: TGroupBox;
    DBGrid2: TDBGrid;
    Carga1: TMenuItem;
    qAtualizaCodigo: TADOQuery;
    qValorAcordo: TADOQuery;
    qValorAcordoVALOR: TBCDField;
    RxCalcEditValor: TJvCalcEdit;
    DBN1: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtConsultaPacientesClick(Sender: TObject);
    procedure sbLaudoClick(Sender: TObject);
    procedure sbConsultarLabClick(Sender: TObject);
    procedure RxDBComboBox4Change(Sender: TObject);
    procedure bbtConsultaLaboratoriosClick(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure Mdciso1Click(Sender: TObject);
    procedure Pacientes1Click(Sender: TObject);
    procedure Exames1Click(Sender: TObject);
    procedure LaboratriosConveniados1Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure Procedimentos2Click(Sender: TObject);
    procedure BNovoClick(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure Comprovante1Click(Sender: TObject);
    procedure Mapa1Click(Sender: TObject);
    procedure sbComprovanteClick(Sender: TObject);
    procedure EtiquetaTubo1Click(Sender: TObject);
    procedure SenhasdeAtendimento1Click(Sender: TObject);
    function  CaixaMista(Texto: string): string;
    procedure bbtResultadosClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid_ResultadosDblClick(Sender: TObject);
    procedure bbtEtiquetaClick(Sender: TObject);
    function GetStrNumber(const S: string): string;
    procedure Infecciosas1Click(Sender: TObject);
    procedure ImportaFcil1Click(Sender: TObject);
    procedure Geral1Click(Sender: TObject);
    procedure sbFinanceiroClick(Sender: TObject);
    procedure bbtNovoClick(Sender: TObject);
    procedure bbtExcluirClick(Sender: TObject);
    procedure bbtSalvarClick(Sender: TObject);
    procedure bbtCancelarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridPagDblClick(Sender: TObject);
    procedure ZerarProtocolo1Click(Sender: TObject);
    procedure bbtPacienteClick(Sender: TObject);
    procedure Carga1Click(Sender: TObject);
    procedure cb_PrazoExit(Sender: TObject);

  private
    { Private declarations }
  public
    VemLancaResultado, AlterouAparece, Alterando, VemdeOnde : String;
    { Public declarations }
  end;

var
  fProcedimentos: TfProcedimentos;
  Sequencial, AnoS : String;

implementation

uses ufLaboratorios, ufImprimeMapa, ufConsultaPacientes,
  ufImprimeComprovante, ufEmissaoLaudos, ufMedicos, ufConsultaLaboratorios,
  ufConsultaGeralInf, ufPacientes, UFUNCOES, ufDMI, ufAcesso, ufExames,
  ufLancaProcedimentos, ufDM, Math, ufExamesResultados,
  ufRelEtiquetasAdesiva, ufEmissaoLaudosAgrupadoNew,
  ufImportaProcedimentos, ufGeradorRelInfecciosas, ufParcelamento_Infe,
  ufAjustaProcotolo, ufImportaProcedimentosHist, ufCarga;

{$R *.dfm}

procedure TfProcedimentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DMI.qProcedimentos.Close;
DMI.qProcedimentos_Resultado.Close;
DMI.qProcedimentos_Carga.Close;
DMI.qPacientes.Close;
DMI.qParcelamento_Infe.Close;
DMI.qExames.Close;
DMI.qLaboratorios.Close;
DMI.qMedico.Close;
DMI.qSequencial.Close;

end;

procedure TfProcedimentos.FormShow(Sender: TObject);
begin
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

if (VemdeOnde <> 'Consulta')
then begin
      DMI.qProcedimentos.Last;
     end;

end;

procedure TfProcedimentos.LaboratriosConveniados1Click(Sender: TObject);
begin
  inherited;
 Application.CreateForm(TfConsultaLaboratorios,fConsultaLaboratorios);
 fConsultaLaboratorios.VemdeOnde := 'Menu';
 fConsultaLaboratorios.BLancarResultado.Caption := '&Dados';
 fConsultaLaboratorios.ShowModal;
 fConsultaLaboratorios.Free;
end;

procedure TfProcedimentos.Mdciso1Click(Sender: TObject);
begin
  inherited;
 Application.CreateForm(TfMedicos,fMedicos);
 fMedicos.ShowModal;
 fMedicos.Free;

end;

procedure TfProcedimentos.Pacientes1Click(Sender: TObject);
begin
  inherited;
 Application.CreateForm(TfPacientes,fPacientes);
 fPacientes.ShowModal;
 fPacientes.Free;
end;

procedure TfProcedimentos.Procedimentos2Click(Sender: TObject);
begin
 Application.CreateForm(TfEmissaoLaudosAgrupadoNew,fEmissaoLaudosAgrupadoNew);
 fEmissaoLaudosAgrupadoNew.ShowModal;
 fEmissaoLaudosAgrupadoNew.Free;
end;

procedure TfProcedimentos.bbtConsultaPacientesClick(Sender: TObject);
begin
  inherited;
 DMI.qPacientes.Open;
 Application.CreateForm(TfPacientes, fPacientes);
 fPacientes.VemdeOnde := '';
 fPacientes.VemdeOnde := 'Cadastro';
 fPacientes.Showmodal;
 fPacientes.VemdeOnde := '';
 fPacientes.Free;
 DMI.qProcedimentosPES_COD.Value := DMI.qPacientesPES_COD.Value;
 DBLookupComboBox2.SetFocus;
end;

procedure TfProcedimentos.sbLaudoClick(Sender: TObject);
begin
  inherited;
  DMI.qStatusProcedimentos.Close;
  DMI.qStatusProcedimentos.Open;
  DMI.qStatusProcedimentos.Append;
  DMI.qStatusProcedimentosPRO_COD.Value    := (DMI.qProcedimentosPRO_COD.Value);
  DMI.qStatusProcedimentosSTP_DATA.Value   := Date;
  DMI.qStatusProcedimentosSTP_STATUS.Value := 3;
  DMI.qStatusProcedimentosSTP_DESC.Value   := 'Resultado foi lançado no sistema';;
  DMI.qStatusProcedimentos.Post;

  Application.CreateForm(TfEmissaoLaudo, fEmissaoLaudo);
  fEmissaoLaudo.ShowModal;
  fEmissaoLaudo.Free;
end;

procedure TfProcedimentos.sbConsultarLabClick(Sender: TObject);
begin
  inherited;
 Application.CreateForm(TfLaboratorios,fLaboratorios);
 fLaboratorios.ShowModal;
 fLaboratorios.Free;
end;

procedure TfProcedimentos.Exames1Click(Sender: TObject);
begin
  inherited;
 Application.CreateForm(TfExames,fExames);
 fExames.ShowModal;
 fExames.Free;
end;

procedure TfProcedimentos.RxDBComboBox4Change(Sender: TObject);
begin
  inherited;
  AlterouAparece := 'Sim';
end;

procedure TfProcedimentos.Sair2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfProcedimentos.bbtConsultaLaboratoriosClick(Sender: TObject);
begin
  inherited;
 Application.CreateForm(TfConsultaLaboratorios,fConsultaLaboratorios);
 fConsultaLaboratorios.VemdeOnde := 'Procedimentos';
 fConsultaLaboratorios.ShowModal;
 fConsultaLaboratorios.Free;
end;

procedure TfProcedimentos.DBLookupComboBox2Enter(Sender: TObject);
begin
  inherited;
//  bbtConsultaLaboratorios.Click;
end;

procedure TfProcedimentos.BNovoClick(Sender: TObject);
var Proximo : Integer;
    MesFinal, SequencialFinal, AnoFinal : String;
    Ano, Mes, Dia : Word;
begin

  DMI.qControlaCodigoProc.Close;
  DMI.qControlaCodigoProc.Open;

  Proximo :=  DMI.qControlaCodigoProcCODIGO.Value + 1;

  with qAtualizaCodigo do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' update TB_CONTROLE c set c.CODIGO_PROCEDIMENTO = :Valor ');
    Parameters.ParamByName('Valor').Value  := Proximo;
    ExecSQL;
  end;

  inherited;

  DMI.qProcedimentosPRO_COD.Value  := Proximo;
  DMI.qProcedimentosPRO_DCAD.Value := Date;
  DMI.qProcedimentosPRO_DCOL.Value := Date;
  DMI.qProcedimentosPRO_DREC.Value := Date;
//  DMI.qProcedimentosPRO_HCOL.Value := Time;
  DMI.qProcedimentosPRO_DENT.Value := Date + 3;
  DMI.qProcedimentosPRO_HCAD.Value := TimeToStr(Time);
  DMI.qProcedimentosEXA_COD.Value  := 'COVID-19';
  DMI.qProcedimentosLAB_COD.Value  := 1;
  DMI.qProcedimentosMED_CRM.Value  := '1';
  DMI.qProcedimentosPRO_APA.Value  := 'Sim';
  DBEdit3.SetFocus;
  bbtConsultaPacientes.Click;
end;

procedure TfProcedimentos.BEditarClick(Sender: TObject);
begin
  inherited;
Alterando := 'Sim';
end;

procedure TfProcedimentos.BSalvarClick(Sender: TObject);
var Cartao, Tipo : String;
begin
if ((DMI.qProcedimentosLAB_COD.Value = 20) or (DMI.qProcedimentosLAB_COD.Value = 5))
then begin
      qBuscaPessoa.Close;
      qBuscaPessoa.Parameters.ParamByName('Codigo').Value := DMI.qProcedimentosPES_COD.Value;
      qBuscaPessoa.Open;

      Cartao := Trim(qBuscaPessoaPES_NUMCAR.Value);
      if ((Cartao <> '') and (Copy(Cartao,1,4) = '0051'))
      then begin
         Tipo := 'LOCAL';
         end else Tipo := 'INTERCÂMBIO';

      with qAtualizaPessoa do
      begin
        Close;
        SQL.Clear;
        SQL.Add(' update tb_pacientes p set p.PES_CLAORI = :Valor where p.PES_COD = :Codigo ');
        Parameters.ParamByName('Valor').Value  := Tipo;
        Parameters.ParamByName('Codigo').Value :=  DMI.qProcedimentosPES_COD.Value;;
        ExecSQL;
      end;
   end;
fProcedimentos.VemLancaResultado := '';
if DBDateEdit1.Text = '' then
begin
 ShowMessage('Data de Cadastro Não Preenchido!!');
 DBDateEdit1.SetFocus;
end else
if DBEdit3.Text = '' then
begin
 ShowMessage('Paciente Não Preenchido!!');
 DBEdit3.SetFocus;
end else
if DBEdit4.Text = '' then
begin
 ShowMessage('Laboratório Não Preenchido!!');
 DBEdit4.SetFocus;
end else
if DBEdit6.Text = '' then
begin
 ShowMessage('Exame Não Preenchido!!');
 DBEdit6.SetFocus;
end else
if DBDateEdit1.Text = '' then
begin
 ShowMessage('Data da Coleta Não Preenchido!!');
 DBDateEdit1.SetFocus;
end;

  Alterando := '';
  DMI.qProcedimentosPRO_ATEND.Value := dm.qHostsHOS_USUA.Value;
  inherited;


  DMI.qStatusProcedimentos.Close;
  DMI.qStatusProcedimentos.Open;
  DMI.qStatusProcedimentos.Append;
  DMI.qStatusProcedimentosPRO_COD.Value    := DMI.qProcedimentosPRO_COD.Value;
  DMI.qStatusProcedimentosSTP_DATA.Value   := Date;
  DMI.qStatusProcedimentosSTP_STATUS.Value := 1;
  DMI.qStatusProcedimentosSTP_DESC.Value   := 'Cadastramento realizado';
  DMI.qStatusProcedimentos.Post;
end;

procedure TfProcedimentos.Comprovante1Click(Sender: TObject);
begin
  inherited;
  DMI.qComprovante.Close;
  DMI.qComprovante.Parameters.ParamByName('CODIGO').Value := DMI.qProcedimentosPRO_COD.Value;;
  DMI.qComprovante.Open;

  Application.CreateForm(TfImprimeComprovante,fImprimeComprovante);
  fImprimeComprovante.RLUsuario.Caption := GetStrNumber(DMI.qComprovantePES_CPF.Value);
  fImprimeComprovante.RLSenha.Caption   := Copy(GetStrNumber(DMI.qComprovantePES_CPF.Value),1,5);

  fImprimeComprovante.RLR_ComprovanteSimplificado.Preview(nil);
  fImprimeComprovante.Free;
end;

function TfProcedimentos.GetStrNumber(const S: string): string;
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


procedure TfProcedimentos.Mapa1Click(Sender: TObject);
begin
  inherited;
  DMI.qRelMapa.Close;
  DMI.qRelMapa.Parameters.ParamByName('CODIGO').Value := DMI.qProcedimentosPRO_COD.Value;;
  DMI.qRelMapa.Open;
  DMI.qExamesAnteriores.Close;
  DMI.qExamesAnteriores.Parameters.ParamByName('PACIENTE').Value  := DMI.qProcedimentosPES_COD.Value;;
  DMI.qExamesAnteriores.Parameters.ParamByName('DATAATUAL').Value := Date;
  DMI.qExamesAnteriores.Open;

  Application.CreateForm(TfImprimeMapa,fImprimeMapa);
  fImprimeMapa.RLReport1.Preview(nil);
  fImprimeMapa.Free;

  DMI.qStatusProcedimentos.Close;
  DMI.qStatusProcedimentos.Open;
  DMI.qStatusProcedimentos.Append;
  DMI.qStatusProcedimentosPRO_COD.Value    := DMI.qProcedimentosPRO_COD.Value;
  DMI.qStatusProcedimentosSTP_DATA.Value   := Date;
  DMI.qStatusProcedimentosSTP_STATUS.Value := 1;
  DMI.qStatusProcedimentosSTP_DESC.Value   := 'Mapa de Trabalho foi gerado';
  DMI.qStatusProcedimentos.Post;
end;

procedure TfProcedimentos.sbComprovanteClick(Sender: TObject);
begin
  inherited;
PM_Documentos.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfProcedimentos.EtiquetaTubo1Click(Sender: TObject);
begin
  inherited;
  DMI.qComprovante.Close;
  DMI.qComprovante.Parameters.ParamByName('CODIGO').Value := DMI.qProcedimentosPRO_COD.Value;;
  DMI.qComprovante.Open;
  DMI.qComprovante.RecordCount;

  Application.CreateForm(TfImprimeComprovante,fImprimeComprovante);
  fImprimeComprovante.Pessoa.Caption := CaixaMista(DMI.qComprovantePES_NOME.Value);
  fImprimeComprovante.Exame.Caption  := DMI.qComprovanteEXA_COD.Value;
  fImprimeComprovante.RLReport_Tubo.Preview(nil);
  fImprimeComprovante.Free;
end;

procedure TfProcedimentos.SenhasdeAtendimento1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfImprimeComprovante,fImprimeComprovante);
  fImprimeComprovante.qCodigoProcesso.Open;
  fImprimeComprovante.RLReport_Senhas.Preview(nil);
  fImprimeComprovante.Free;
end;

function TfProcedimentos.CaixaMista(Texto: string): string;
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


procedure TfProcedimentos.bbtResultadosClick(Sender: TObject);
begin
 if DSP.DataSet.State in [dsinsert, dsedit]
 then begin
       DMI.qProcedimentos.Post;
       Application.CreateForm(TfProcedimentosResultados, fProcedimentosResultados);
       fProcedimentosResultados.ShowModal;
       fProcedimentosResultados.Free;
       DMI.qProcedimentos.Edit;
       DMI.qProcedimentos_Resultado.Open;
      end else ShowMessage(' Tela não pode ser utilizada porque o registro não está em edição.')
end;

procedure TfProcedimentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      case Key of
        VK_F4     :   bbtResultados.Click;
        VK_F3     :   bbtEtiqueta.Click;
        VK_F5     :   bbtPaciente.Click;
     end;
       inherited;

end;

procedure TfProcedimentos.DBGrid_ResultadosDblClick(Sender: TObject);
begin
 if DSP.DataSet.State in [dsinsert, dsedit]
 then begin
       DMI.qProcedimentos.Post;
       Application.CreateForm(TfProcedimentosResultados, fProcedimentosResultados);
       fProcedimentosResultados.ShowModal;
       fProcedimentosResultados.Free;
       DMI.qProcedimentos.Edit;
       DMI.qProcedimentos_Resultado.Open;
      end else ShowMessage(' Tela não pode ser utilizada porque o registro não está em edição.');
  inherited;

end;

procedure TfProcedimentos.bbtEtiquetaClick(Sender: TObject);
begin
 DMI.qInfecto.Close;
 DMI.qInfecto.Parameters.ParamByName('Codigo').Value := DMI.qProcedimentosPRO_COD.Value;
 DMI.qInfecto.Open;

 Application.CreateForm(TfImprimeComprovante,fImprimeComprovante);
 if (Length(DMI.qInfectoPES_NOME.Value) >= 27)
 then begin
        fImprimeComprovante.RLA_NOME_2.Caption      :=  DMI.qInfectoPES_NOME.Value;
        fImprimeComprovante.RLA_NOME_2.Font.Size    :=  7;
     end else fImprimeComprovante.RLA_NOME_2.Caption      :=  DMI.qInfectoPES_NOME.Value;
 fImprimeComprovante.RLA_CASODATA_2.Caption  :=  'Caso: ' + IntToStr(DMI.qInfectoPRO_COD.Value) + ' / Dt. Amostra: ' + DateToStr(DMI.qInfectoPRO_DCOL.Value);
 fImprimeComprovante.RLA_PRAZO_2.Caption     :=  'Prazo: ' + DMI.qInfectoPRO_PRAZO.Value;
 fImprimeComprovante.RLA_CONVENIO_2.Caption  :=  'Origem: ' + DMI.qInfectoLAB_LABT.Value;
 fImprimeComprovante.RLBcode.Caption         :=  IntToStr(DMI.qInfectoPRO_COD.Value);
 fImprimeComprovante.RLBcode.Width           :=  32;
 fImprimeComprovante.RLR_Infecto2.Preview(nil);
 fImprimeComprovante.Free;

  inherited;

end;

procedure TfProcedimentos.Infecciosas1Click(Sender: TObject);
begin
 Application.CreateForm(TfConsultaGeralInf,fConsultaGeralInf);
 fConsultaGeralInf.ShowModal;
 fConsultaGeralInf.Free;
end;

procedure TfProcedimentos.ImportaFcil1Click(Sender: TObject);
begin
 Application.CreateForm(TfImportaFacil,fImportaFacil);
 fImportaFacil.ShowModal;
 fImportaFacil.Free;
end;

procedure TfProcedimentos.Geral1Click(Sender: TObject);
begin
  Application.CreateForm(TfEmissaoRelInfecciosas, fEmissaoRelInfecciosas);
  fEmissaoRelInfecciosas.ShowModal;
  fEmissaoRelInfecciosas.Free;
end;

procedure TfProcedimentos.sbFinanceiroClick(Sender: TObject);
begin
  inherited;
  pcampos.Enabled := True;
  tbHonorarios.TabVisible := True;
  PageControl1.ActivePage:= tbHonorarios;
  DMI.qParcelamento_Infe.Open;
  tbHonorarios.Enabled := True;
  with qManutencaoParcelamento do
  begin
      SQL.Clear;
      SQL.Add('SELECT * FROM tb_PARCELAS WHERE PRO_COD = '+ IntToStr(DMI.qProcedimentosPRO_COD.Value));
      Open;
      DMI.qParcelamento_Infe.Open;
  end;
end;

procedure TfProcedimentos.bbtNovoClick(Sender: TObject);
begin
  inherited;
ds_Parcelamento.DataSet.Append;

bbtsalvar.Enabled          := true;
bbtcancelar.Enabled        := true;
bbtNovo.Enabled            := false;
bbtExcluir.Enabled         := false;
ComboBoxParcelas.ItemIndex := 0;

ComboBoxTipoPagamento.ItemIndex := -1;
RxCalcEditValor.Value           := 0;
EdtObservacao.Text              := '';

ComboBoxTipoPagamento.SetFocus;
RxCalcEditValor.Value := 0;
end;

procedure TfProcedimentos.bbtExcluirClick(Sender: TObject);
begin
  inherited;
ds_Parcelamento.DataSet.Delete;

ComboBoxTipoPagamento.ItemIndex := -1;
RxCalcEditValor.Value           := 0;
EdtObservacao.Text              := '';
end;

procedure TfProcedimentos.bbtSalvarClick(Sender: TObject);
Var Contador     : Integer;
    ValorParcela : Real;
begin
//Parcelamento do Pagamento
if ComboBoxParcelas.Text <> '0'
then begin
      Contador := 1;
      ValorParcela := RxCalcEditValor.Value / StrToInt(ComboBoxParcelas.Text);
      while Contador <= StrToInt(ComboBoxParcelas.Text) do
       begin
        DMI.qParcelamento_Infe.Last;
        DMI.qParcelamento_Infe.Append;
        DMI.qParcelamento_Infe.Edit;
        DMI.qParcelamento_InfePRO_COD.Value    := DMI.qProcedimentosPRO_COD.Value;
        DMI.qParcelamento_InfePAR_ONDE.Value   := 'Infecciosas';
        DMI.qParcelamento_InfePAR_TPPG.Value   := ComboBoxTipoPagamento.Text;
        DMI.qParcelamento_InfePAR_NPARC.Value  := Contador;
        DMI.qParcelamento_InfePAR_VLR.Value    := ValorParcela;
        DMI.qParcelamento_InfePAR_OBS.Value    := EdtObservacao.Text;
        if Contador = 1
        then begin
              DMI.qParcelamento_InfePAR_DATA.Value  := Date;
             end else begin
                       DMI.qParcelamento_InfePAR_DATA.Value  := Date + (30 * Contador);
                      end;

        DMI.qParcelamento_InfePAR_SIT.Value   := 1;


        DMI.qParcelamento_Infe.Post;
        Contador := Contador + 1;
        DMI.qParcelamento_Infe.Next;
      end;
     end;
// Termino do Parcelamento

DMI.qParcelamento_Infe.Close;
DMI.qParcelamento_Infe.Open;
DMI.qParcelamento_Infe.Last;

bbtsalvar.Enabled   := false;
bbtcancelar.Enabled := false;
bbtNovo.Enabled     := true;
bbtExcluir.Enabled  := true;

ComboBoxTipoPagamento.ItemIndex := -1;
RxCalcEditValor.Value           := 0;
EdtObservacao.Text              := '';
end;


procedure TfProcedimentos.bbtCancelarClick(Sender: TObject);
begin
  inherited;
ds_Parcelamento.DataSet.Cancel;

bbtsalvar.Enabled   := false;
bbtcancelar.Enabled := false;
bbtNovo.Enabled   := true;
bbtExcluir.Enabled  := true;

ComboBoxTipoPagamento.ItemIndex := -1;
RxCalcEditValor.Value           := 0;
EdtObservacao.Text              := '';

end;

procedure TfProcedimentos.BitBtn1Click(Sender: TObject);
begin
  inherited;
PageControl1.ActivePageIndex := 0;
tbHonorarios.Enabled := False;
tbHonorarios.TabVisible := False;
PCampos.Enabled := False;
end;

procedure TfProcedimentos.DBGridPagDblClick(Sender: TObject);
begin

 Application.CreateForm(TfParcelamento_Infe, fParcelamento_Infe);
 fParcelamento_Infe.ShowModal;
 fParcelamento_Infe.Free;
end;

procedure TfProcedimentos.ZerarProtocolo1Click(Sender: TObject);
begin
if (fAcesso.Edit1.Text = 'RAPHAEL') or (fAcesso.Edit1.Text = 'BRUNO') or (fAcesso.Edit1.Text = 'JOYCE') or (fAcesso.Edit1.Text = 'MIRIAM')
then begin
       Application.CreateForm(TfAjustaProtocolo, fAjustaProtocolo);
       fAjustaProtocolo.ShowModal;
       fAjustaProtocolo.Free;
     end else ShowMessage('Usuário não autorizado!!!');
end;

procedure TfProcedimentos.bbtPacienteClick(Sender: TObject);
begin
 DMI.qPacientes.Open;
 Application.CreateForm(TfPacientes, fPacientes);
 DMI.qPacientes.Edit;
 if DMI.qPacientes.Locate('PES_COD', DMI.qProcedimentosPES_COD.Value, []) = True
 then begin
       fPacientes.Showmodal;
       fPacientes.Free;
      end;

end;

procedure TfProcedimentos.Carga1Click(Sender: TObject);
begin
Application.CreateForm(TfCarga, fCarga);
fCarga.ShowModal;
fCarga.Free;
end;

procedure TfProcedimentos.cb_PrazoExit(Sender: TObject);
var ValorAcordo : Real;
begin
//VALORES

qValorAcordo.Close;
qValorAcordo.Parameters.ParamByName('Labo').Value := DMI.qProcedimentosLAB_COD.Value;
qValorAcordo.Open;
ValorAcordo := 0;
ValorAcordo := qValorAcordoVALOR.Value;

if (DBLookupComboBox2.KeyValue = 1)
then begin
       DMI.qProcedimentosPRO_TIPPAG.Value:= 'DINHEIRO';
       if (cb_Prazo.Text = 'MESMO DIA') then DMI.qProcedimentosPRO_VALOR.Value := 780;
       if (cb_Prazo.Text = '24 HORAS')  then DMI.qProcedimentosPRO_VALOR.Value := 550;
       if (cb_Prazo.Text = '6 HORAS')  then DMI.qProcedimentosPRO_VALOR.Value  := 780;
       if (cb_Prazo.Text = '48 HORAS')  then DMI.qProcedimentosPRO_VALOR.Value := 420;
       if (cb_Prazo.Text = '72 HORAS')  then DMI.qProcedimentosPRO_VALOR.Value := 350;
     end else begin
               DMI.qProcedimentosPRO_TIPPAG.Value   := 'FATURADO';
               DMI.qProcedimentosPRO_VALOR.Value    := ValorAcordo;
              end;
end;

end.
