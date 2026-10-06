unit ufGeradorRelInfecciosas;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, Mask, Buttons,
  DBCtrls, DB, ADODB, RLReport, ComObj, Sockets, Variants, JvExMask, JvToolEdit ;

type
  TfEmissaoRelInfecciosas = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    qLaboratorios: TADOQuery;
    qLaboratoriosLAB_COD: TIntegerField;
    qLaboratoriosLAB_NOME: TStringField;
    qLaboratoriosLAB_CRM: TStringField;
    qLaboratoriosLAB_LABT: TStringField;
    qLaboratoriosLAB_FONE: TStringField;
    qLaboratoriosLAB_END: TStringField;
    qLaboratoriosLAB_CID: TStringField;
    qLaboratoriosUF_SIGLA: TStringField;
    qExames: TADOQuery;
    qExamesEXA_COD: TStringField;
    qExamesEXA_DESC: TStringField;
    qExamesEXA_UNM: TIntegerField;
    qExamesEXA_SIN: TStringField;
    qExamesEXA_MET: TStringField;
    qExamesEXA_VRE: TStringField;
    qExamesEXA_RECM: TStringField;
    qExamesEXA_MATE: TStringField;
    qMedico: TADOQuery;
    qMedicoMED_CRM: TStringField;
    qMedicoMED_NOME: TStringField;
    qMedicoMED_CID: TStringField;
    ds_Laboratorios: TDataSource;
    ds_Exames: TDataSource;
    ds_Medicos: TDataSource;
    qRelLaudo: TADOQuery;
    qRelLaudoPRO_COD: TIntegerField;
    qRelLaudoPES_NOME: TStringField;
    qRelLaudoPRO_PROT: TStringField;
    qRelLaudoMED_NOME: TStringField;
    qRelLaudoLAB_LABT: TStringField;
    qRelLaudoEXA_DESC: TStringField;
    qRelLaudoEXA_SIN: TStringField;
    qRelLaudoEXA_MET: TStringField;
    qRelLaudoEXA_OBSERV: TStringField;
    qRelLaudoEXA_UNM: TIntegerField;
    qRelLaudoPRO_RESUL: TStringField;
    qRelLaudoPRO_UINT: TBCDField;
    qRelLaudoPRO_CMLI: TBCDField;
    qRelLaudoPRO_VLOG: TBCDField;
    RLReport1: TRLReport;
    RLGroup1: TRLGroup;
    RLBand1: TRLBand;
    RLLabel6: TRLLabel;
    RLDBText2: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLBand2: TRLBand;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    QRBand11: TRLBand;
    RLLabel7: TRLLabel;
    RLDBResult4: TRLDBResult;
    RLBand3: TRLBand;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLImage2: TRLImage;
    qRelExamesFaturaGrupo: TADOQuery;
    DS_RelExamesFaturaGrupo: TDataSource;
    qRelExamesFaturaGrupoPRO_COD: TIntegerField;
    qRelExamesFaturaGrupoPRO_DCAD: TDateField;
    qRelExamesFaturaGrupoPRO_PROT: TStringField;
    qRelExamesFaturaGrupoPES_NOME: TStringField;
    qRelExamesFaturaGrupoEXA_COD: TStringField;
    qRelExamesFaturaGrupoLAB_LABT: TStringField;
    RLSystemInfo1: TRLSystemInfo;
    sbExportar: TSpeedButton;
    sbFechar: TSpeedButton;
    sbLimpar: TSpeedButton;
    sbConsultar: TSpeedButton;
    rg_Relatorios: TRadioGroup;
    qRelControle: TADOQuery;
    ds_RelControle: TDataSource;
    RLReport2: TRLReport;
    RLBand4: TRLBand;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLBand5: TRLBand;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLBand6: TRLBand;
    RLLabel19: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLBand7: TRLBand;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLImage1: TRLImage;
    RLSystemInfo2: TRLSystemInfo;
    qRelControlePRO_COD: TIntegerField;
    qRelControlePRO_DCAD: TDateField;
    qRelControlePES_COD: TIntegerField;
    qRelControleLAB_COD: TIntegerField;
    qRelControleMED_CRM: TStringField;
    qRelControleEXA_COD: TStringField;
    qRelControlePRO_DCOL: TDateField;
    qRelControlePRO_DENT: TDateField;
    qRelControlePRO_GENO: TStringField;
    qRelControlePRO_VLOG: TBCDField;
    qRelControlePRO_RESUL: TStringField;
    qRelControlePRO_OBS: TStringField;
    qRelControlePRO_UINT: TBCDField;
    qRelControlePRO_CMLI: TBCDField;
    qRelControlePRO_PROT: TStringField;
    qRelControlePRO_APA: TStringField;
    qRelControlePRO_DREC: TDateField;
    qRelControlePRO_ATEND: TStringField;
    qRelControlePRO_TIPR: TStringField;
    qRelControlePRO_HCAD: TStringField;
    qRelControlePRO_VALOR: TBCDField;
    qRelControlePRO_HCOL: TTimeField;
    qRelControlePRO_FG_RESUL: TSmallintField;
    qRelControlePRO_PRAZO: TStringField;
    qRelControlePRO_IDWEB: TSmallintField;
    qRelControlePES_COD_1: TIntegerField;
    qRelControlePES_NOME: TStringField;
    qRelControlePES_ESCV: TStringField;
    qRelControlePES_IDA: TIntegerField;
    qRelControlePES_SEXO: TStringField;
    qRelControlePES_DNAS: TDateField;
    qRelControlePES_END: TStringField;
    qRelControlePES_CIES: TStringField;
    qRelControlePES_FRES: TStringField;
    qRelControlePES_FCEL: TStringField;
    qRelControlePES_CPF: TStringField;
    qRelControlePES_RG: TStringField;
    qRelControlePES_COD_INTERNET: TSmallintField;
    qRelControlePES_EMAIL: TStringField;
    qRelControlePES_NUMCAR: TStringField;
    qRelControlePES_CLAORI: TStringField;
    qRelControleLAB_COD_1: TIntegerField;
    qRelControleLAB_NOME: TStringField;
    qRelControleLAB_SEXO: TStringField;
    qRelControleLAB_CRM: TStringField;
    qRelControleLAB_LABT: TStringField;
    qRelControleLAB_FONE: TStringField;
    qRelControleLAB_END: TStringField;
    qRelControleLAB_CID: TStringField;
    qRelControleUF_SIGLA: TStringField;
    qRelControleLAB_INTEXT: TStringField;
    qRelControleLAB_FGVLR: TStringField;
    qRelControleLAB_FGBOLETO: TStringField;
    qRelControleCOM_COD: TIntegerField;
    qRelControleLAB_FG_EXPORTA: TIntegerField;
    qRelControleLAB_COD_INTERNET: TSmallintField;
    qRelControleLAB_RESUL_INTERNET: TSmallintField;
    RLReport3: TRLReport;
    RLBand8: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel27: TRLLabel;
    RLBand9: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText11: TRLDBText;
    RLBand10: TRLBand;
    RLLabel28: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLBand11: TRLBand;
    RLLabel29: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    RLLabel35: TRLLabel;
    RLImage3: TRLImage;
    RLSystemInfo3: TRLSystemInfo;
    qRelControleLab: TADOQuery;
    ds_RelControleLab: TDataSource;
    qRelControleLabPRO_COD: TIntegerField;
    qRelControleLabPRO_DCAD: TDateField;
    qRelControleLabPES_COD: TIntegerField;
    qRelControleLabLAB_COD: TIntegerField;
    qRelControleLabMED_CRM: TStringField;
    qRelControleLabEXA_COD: TStringField;
    qRelControleLabPRO_DCOL: TDateField;
    qRelControleLabPRO_DENT: TDateField;
    qRelControleLabPRO_GENO: TStringField;
    qRelControleLabPRO_VLOG: TBCDField;
    qRelControleLabPRO_RESUL: TStringField;
    qRelControleLabPRO_OBS: TStringField;
    qRelControleLabPRO_UINT: TBCDField;
    qRelControleLabPRO_CMLI: TBCDField;
    qRelControleLabPRO_PROT: TStringField;
    qRelControleLabPRO_APA: TStringField;
    qRelControleLabPRO_DREC: TDateField;
    qRelControleLabPRO_ATEND: TStringField;
    qRelControleLabPRO_TIPR: TStringField;
    qRelControleLabPRO_HCAD: TStringField;
    qRelControleLabPRO_VALOR: TBCDField;
    qRelControleLabPRO_HCOL: TTimeField;
    qRelControleLabPRO_FG_RESUL: TSmallintField;
    qRelControleLabPRO_PRAZO: TStringField;
    qRelControleLabPRO_IDWEB: TSmallintField;
    qRelControleLabPRO_TIPPAG: TStringField;
    qRelControleLabPES_COD_1: TIntegerField;
    qRelControleLabPES_NOME: TStringField;
    qRelControleLabPES_ESCV: TStringField;
    qRelControleLabPES_IDA: TIntegerField;
    qRelControleLabPES_SEXO: TStringField;
    qRelControleLabPES_DNAS: TDateField;
    qRelControleLabPES_END: TStringField;
    qRelControleLabPES_CIES: TStringField;
    qRelControleLabPES_FRES: TStringField;
    qRelControleLabPES_FCEL: TStringField;
    qRelControleLabPES_CPF: TStringField;
    qRelControleLabPES_RG: TStringField;
    qRelControleLabPES_COD_INTERNET: TSmallintField;
    qRelControleLabPES_EMAIL: TStringField;
    qRelControleLabPES_NUMCAR: TStringField;
    qRelControleLabPES_CLAORI: TStringField;
    qRelControleLabPES_RACA: TStringField;
    qRelControleLabPES_NUNEND: TStringField;
    qRelControleLabPES_CEP: TStringField;
    qRelControleLabPES_BAIRRO: TStringField;
    qRelControleLabPES_SINTOMAS: TStringField;
    qRelControleLabPES_UF: TStringField;
    qRelControleLabPES_SINTOMA1: TSmallintField;
    qRelControleLabPES_SINTOMA2: TSmallintField;
    qRelControleLabPES_SINTOMA3: TSmallintField;
    qRelControleLabPES_SINTOMA4: TSmallintField;
    qRelControleLabPES_SINTOMA5: TSmallintField;
    qRelControleLabPES_SINTOMA6: TSmallintField;
    qRelControleLabPES_SINTOMA7: TSmallintField;
    qRelControleLabPES_SINTOMA8: TSmallintField;
    qRelControleLabPES_SINTOMA9: TSmallintField;
    qRelControleLabPES_SINTOMA10: TSmallintField;
    qRelControleLabLAB_COD_1: TIntegerField;
    qRelControleLabLAB_NOME: TStringField;
    qRelControleLabLAB_SEXO: TStringField;
    qRelControleLabLAB_CRM: TStringField;
    qRelControleLabLAB_LABT: TStringField;
    qRelControleLabLAB_FONE: TStringField;
    qRelControleLabLAB_END: TStringField;
    qRelControleLabLAB_CID: TStringField;
    qRelControleLabUF_SIGLA: TStringField;
    qRelControleLabLAB_INTEXT: TStringField;
    qRelControleLabLAB_FGVLR: TStringField;
    qRelControleLabLAB_FGBOLETO: TStringField;
    qRelControleLabCOM_COD: TIntegerField;
    qRelControleLabLAB_FG_EXPORTA: TIntegerField;
    qRelControleLabLAB_COD_INTERNET: TSmallintField;
    qRelControleLabLAB_RESUL_INTERNET: TSmallintField;
    Label3: TLabel;
    cb_Forma: TComboBox;
    qRelExamesFaturaGrupoPRO_VALOR: TBCDField;
    RLLabel18: TRLLabel;
    RLDBText5: TRLDBText;
    RLDBResult3: TRLDBResult;
    qRelCasosResultados: TADOQuery;
    ds_RelCasosResultados: TDataSource;
    qRelCasosResultadosPRO_PROT: TStringField;
    qRelCasosResultadosLAB_LABT: TStringField;
    qRelCasosResultadosPRO_DCOL: TDateField;
    qRelCasosResultadosPES_NOME: TStringField;
    qRelCasosResultadosPRO_RESUL: TStringField;
    RLReport4: TRLReport;
    RLBand12: TRLBand;
    RLLabel36: TRLLabel;
    RLLabel37: TRLLabel;
    RLLabel38: TRLLabel;
    RLBand13: TRLBand;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLBand14: TRLBand;
    RLLabel39: TRLLabel;
    RLDBResult5: TRLDBResult;
    RLBand15: TRLBand;
    RLLabel40: TRLLabel;
    RLLabel41: TRLLabel;
    RLLabel42: TRLLabel;
    RLLabel43: TRLLabel;
    RLLabel44: TRLLabel;
    RLLabel45: TRLLabel;
    RLLabel46: TRLLabel;
    RLImage4: TRLImage;
    RLSystemInfo4: TRLSystemInfo;
    RLLabel47: TRLLabel;
    RLDBText15: TRLDBText;
    RLLabel48: TRLLabel;
    RLDBText16: TRLDBText;
    RLReportFG: TRLReport;
    RLBand16: TRLBand;
    RLLabel49: TRLLabel;
    RLLabel51: TRLLabel;
    RLBand17: TRLBand;
    RLDBText17: TRLDBText;
    RLDBText19: TRLDBText;
    RLBand18: TRLBand;
    RLLabel52: TRLLabel;
    RLBand19: TRLBand;
    RLLabel53: TRLLabel;
    RLLabel54: TRLLabel;
    RLLabel55: TRLLabel;
    RLLabel56: TRLLabel;
    RLLabel57: TRLLabel;
    RLLabel58: TRLLabel;
    RLLabel59: TRLLabel;
    RLImage5: TRLImage;
    RLSystemInfo5: TRLSystemInfo;
    RLDBResult6: TRLDBResult;
    RLDBText20: TRLDBText;
    RLLabel60: TRLLabel;
    DateEditInicial: TJvDateEdit;
    DateEditFinal: TJvDateEdit;
    procedure bbtConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure sbLimparClick(Sender: TObject);
    procedure sbConsultarClick(Sender: TObject);
    procedure rg_RelatoriosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEmissaoRelInfecciosas: TfEmissaoRelInfecciosas;

implementation

uses ufDMR, ufRelConsulta, ufRelFinanceiro, ufDMI, ufDMRI, ufDM, Math;

{$R *.DFM}


procedure TfEmissaoRelInfecciosas.bbtConsultarClick(Sender: TObject);
var Contador  : Integer;
begin
Contador := 0;
if (DateEditInicial.Date < 0) then
begin
  ShowMessage('Pelo menos um parâmetro tem que ser informado.');
end else begin
          qRelExamesFaturaGrupo.Close;
          qRelExamesFaturaGrupo.SQL.Clear;
          qRelExamesFaturaGrupo.SQL.Add(' select pr.pro_cod, pr.pro_dcad, pr.pro_prot, pa.pes_nome, pr.exa_cod, l.LAB_LABT ');
          qRelExamesFaturaGrupo.SQL.Add(' from tb_PROCEDIMENTOS pr JOIN tb_PACIENTES pa ON pr.pes_cod = pa.pes_cod ');
          qRelExamesFaturaGrupo.SQL.Add(' JOIN tb_laboratorios l ON pr.lab_cod = l.lab_cod ');
          qRelExamesFaturaGrupo.SQL.Add(' where ');


          if (DateEditInicial.Date > 0) and (DateEditFinal.Date > 0)
          then begin
                Contador := Contador + 1;
                qRelExamesFaturaGrupo.SQL.Add(' pr.pro_dcad >= :DT1 and pr.pro_dcad <= :DT2 ');
                qRelExamesFaturaGrupo.Parameters.ParamByName('DT1').Value := DateEditInicial.Date;
                qRelExamesFaturaGrupo.Parameters.ParamByName('DT2').Value := DateEditFinal.Date;
               end;


          if (DBLookupComboBox3.Text <> '')
          then begin
                if Contador > 0
                then begin
                      qRelExamesFaturaGrupo.SQL.Add(' and pr.lab_cod = :p3 ');
                      qRelExamesFaturaGrupo.Parameters.ParamByName('p3').Value := DBLookupComboBox3.KeyValue;
                     end else begin
                               qRelExamesFaturaGrupo.SQL.Add(' pr.lab_cod = :p3 ');
                               qRelExamesFaturaGrupo.Parameters.ParamByName('p3').Value := DBLookupComboBox3.KeyValue;
                              end;
               end;
          qRelExamesFaturaGrupo.SQL.Add(' order by pr.pro_prot ');
          qRelExamesFaturaGrupo.Open;

          if qRelExamesFaturaGrupo.RecordCount > 0
          then begin
                RLReport1.Preview(nil);
               end else begin
                         ShowMessage('Não foram encontrados dados para geração desse relatório.');
                        end;

         end;
end;

procedure TfEmissaoRelInfecciosas.FormShow(Sender: TObject);
begin
qLaboratorios.Open;
DM.qParametros.Open;
end;

procedure TfEmissaoRelInfecciosas.sbExportarClick(Sender: TObject);
var
  excel :variant;
  MesGerando, NomePlanilha, NumeroCaso, Data_Mapa, AnoA, MesA, DiaA : String;
  Linha, NumeroSheets, i, NumeroCasoVerificacao, Contador : Integer;
  Ano, Mes, Dia : Word;
begin
if (rg_Relatorios.ItemIndex = 1)
then begin

      DecodeDate (Date, Ano, Mes, Dia);
      AnoA := IntToStr(Ano);
      MesA := IntToStr(Mes);
      DiaA := IntToStr(Dia);

      if (UpperCase(GetEnvironmentVariable('COMPUTERNAME')) = 'NCPESEDE008306') or (UpperCase(GetEnvironmentVariable('COMPUTERNAME')) = 'NCPESEDE008306')
      then begin
            NomePlanilha := 'C:\SCPG\Documentos_Gerados\CASOS_' + DiaA + MesA + AnoA + '.xls';
          end else NomePlanilha := 'U:\Laboratorio\Infecciosas\COVID-19\CASOS_' + DiaA + MesA + AnoA + '.xls';

      excel := CreateOleObject('Excel.Application');
      if not Excel.Application.Visible then
      Excel.WorkBooks.Open(DM.qParametrosPAM_DPADR.Value + 'MODELO_COVID19_EXPORTA_CASOS.xls');
      NumeroSheets := 1;
      Linha := 2;

      Contador := 0;
      if (DateEditInicial.Date < 0) then
      begin
        ShowMessage('Pelo menos um parâmetro tem que ser informado.');
      end else begin
                qRelExamesFaturaGrupo.Close;
                qRelExamesFaturaGrupo.SQL.Clear;
                qRelExamesFaturaGrupo.SQL.Add(' select pr.pro_cod, pr.pro_dcad, pr.pro_prot, pa.pes_nome, pr.exa_cod, l.LAB_LABT, pr.PRO_VALOR ');
                qRelExamesFaturaGrupo.SQL.Add(' from tb_PROCEDIMENTOS pr JOIN tb_PACIENTES pa ON pr.pes_cod = pa.pes_cod ');
                qRelExamesFaturaGrupo.SQL.Add(' JOIN tb_laboratorios l ON pr.lab_cod = l.lab_cod ');
                qRelExamesFaturaGrupo.SQL.Add(' where ');


                if (DateEditInicial.Date > 0) and (DateEditFinal.Date > 0)
                then begin
                      Contador := Contador + 1;
                      qRelExamesFaturaGrupo.SQL.Add(' pr.pro_dcad >= :DT1 and pr.pro_dcad <= :DT2 ');
                      qRelExamesFaturaGrupo.Parameters.ParamByName('DT1').Value := DateEditInicial.Date;
                      qRelExamesFaturaGrupo.Parameters.ParamByName('DT2').Value := DateEditFinal.Date;
                     end;


                if (DBLookupComboBox3.Text <> '')
                then begin
                      if Contador > 0
                      then begin
                            qRelExamesFaturaGrupo.SQL.Add(' and pr.lab_cod = :p3 ');
                            qRelExamesFaturaGrupo.Parameters.ParamByName('p3').Value := DBLookupComboBox3.KeyValue;
                           end else begin
                                     qRelExamesFaturaGrupo.SQL.Add(' pr.lab_cod = :p3 ');
                                     qRelExamesFaturaGrupo.Parameters.ParamByName('p3').Value := DBLookupComboBox3.KeyValue;
                                    end;
                     end;
                if (cb_Forma.Text <> '')
                then begin
                      if Contador > 0
                      then begin
                            qRelExamesFaturaGrupo.SQL.Add(' and pr.PRO_TIPPAG = :p4 ');
                            qRelExamesFaturaGrupo.Parameters.ParamByName('p4').Value := cb_Forma.Text;
                           end else begin
                                     qRelExamesFaturaGrupo.SQL.Add(' pr.PRO_TIPPAG = :p4 ');
                                     qRelExamesFaturaGrupo.Parameters.ParamByName('p4').Value := cb_Forma.Text;
                                    end;
                     end;

                qRelExamesFaturaGrupo.SQL.Add(' order by pr.pro_prot ');
                qRelExamesFaturaGrupo.Open;
             end;

      qRelExamesFaturaGrupo.First;
      while not qRelExamesFaturaGrupo.Eof do
      begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]  := qRelExamesFaturaGrupoPRO_DCAD.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2]  := qRelExamesFaturaGrupoPRO_PROT.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3]  := qRelExamesFaturaGrupoEXA_COD.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4]  := qRelExamesFaturaGrupoPES_NOME.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5]  := qRelExamesFaturaGrupoLAB_LABT.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6]  := qRelExamesFaturaGrupoPRO_VALOR.Value;

        Linha:=Linha+1;
        qRelExamesFaturaGrupo.Next;
      end;
      Excel.Application.Visible := true;
      Excel.ActiveWorkBook.SaveAs(NomePlanilha);
      Excel.quit;
      Excel:=unassigned;

      ShowMessage('Exportação finalizada. Verificar na no Servidor (U:)');
   end;
if (rg_Relatorios.ItemIndex = 0)
then begin
       ShowMessage('Esse relatório não exposta dados para excel.');
     end;

if (rg_Relatorios.ItemIndex = 3)
then begin

      DecodeDate (Date, Ano, Mes, Dia);
      AnoA := IntToStr(Ano);
      MesA := IntToStr(Mes);
      DiaA := IntToStr(Dia);

      if (UpperCase(GetEnvironmentVariable('COMPUTERNAME')) = 'NCPESEDE008306') or (UpperCase(GetEnvironmentVariable('COMPUTERNAME')) = 'NCPESEDE008306')
      then begin
            NomePlanilha := 'C:\SCPG\Documentos_Gerados\CASOSRESULTADOS_' + DiaA + MesA + AnoA + '.xls';
          end else NomePlanilha := 'U:\Laboratorio\Infecciosas\COVID-19\CASOSRESULTADOS_' + DiaA + MesA + AnoA + '.xls';

      excel := CreateOleObject('Excel.Application');
      if not Excel.Application.Visible then
      Excel.WorkBooks.Open(DM.qParametrosPAM_DPADR.Value + 'MODELO_COVID19_EXPORTA_CASOSRESULTADOS.xls');
      NumeroSheets := 1;
      Linha := 2;

      Contador := 0;
      if (DateEditInicial.Date < 0) then
      begin
        ShowMessage('Pelo menos um parâmetro tem que ser informado.');
      end else begin
                qRelCasosResultados.Close;
                qRelCasosResultados.SQL.Clear;
                qRelCasosResultados.SQL.Add(' select pr.pro_prot, l.lab_labt, pr.pro_dcol, pa.pes_nome, pre.pro_resul ');
                qRelCasosResultados.SQL.Add(' from tb_PROCEDIMENTOS pr JOIN tb_procedimentos_resultado pre ON pr.pro_cod = pre.pro_cod ');
                qRelCasosResultados.SQL.Add(' JOIN tb_PACIENTES pa ON pr.pes_cod = pa.pes_cod ');
                qRelCasosResultados.SQL.Add(' JOIN tb_laboratorios l ON pr.lab_cod = l.lab_cod ');
                qRelCasosResultados.SQL.Add(' where ');


                if (DateEditInicial.Date > 0) and (DateEditFinal.Date > 0)
                then begin
                      Contador := Contador + 1;
                      qRelCasosResultados.SQL.Add(' pr.PRO_DCOL >= :DT1 and pr.PRO_DCOL <= :DT2 ');
                      qRelCasosResultados.Parameters.ParamByName('DT1').Value := DateEditInicial.Date;
                      qRelCasosResultados.Parameters.ParamByName('DT2').Value := DateEditFinal.Date;
                     end;


                if (DBLookupComboBox3.Text <> '')
                then begin
                      if Contador > 0
                      then begin
                            qRelCasosResultados.SQL.Add(' and pr.lab_cod = :p3 ');
                            qRelCasosResultados.Parameters.ParamByName('p3').Value := DBLookupComboBox3.KeyValue;
                           end else begin
                                     qRelCasosResultados.SQL.Add(' pr.lab_cod = :p3 ');
                                     qRelCasosResultados.Parameters.ParamByName('p3').Value := DBLookupComboBox3.KeyValue;
                                    end;
                     end;
                qRelCasosResultados.SQL.Add(' order by pre.pro_resul, pr.pro_dcol ');
                qRelCasosResultados.Open;
              end;

      qRelCasosResultados.First;
      while not qRelCasosResultados.Eof do
      begin
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]  := qRelCasosResultadosPRO_DCOL.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2]  := qRelCasosResultadosPRO_PROT.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3]  := qRelCasosResultadosPES_NOME.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4]  := qRelCasosResultadosPRO_RESUL.Value;
        Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5]  := qRelCasosResultadosLAB_LABT.Value;

        Linha:=Linha+1;
        qRelCasosResultados.Next;
      end;
      Excel.Application.Visible := true;
      Excel.ActiveWorkBook.SaveAs(NomePlanilha);
      Excel.quit;
      Excel:=unassigned;

      ShowMessage('Exportação finalizada. Verificar na no Servidor (U:)');
   end;

end;

procedure TfEmissaoRelInfecciosas.sbFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfEmissaoRelInfecciosas.sbLimparClick(Sender: TObject);
begin
DBLookupComboBox3.KeyValue := -1;
DateEditInicial.Date := 0;
DateEditFinal.Date := 0;
DateEditInicial.SetFocus;
end;

procedure TfEmissaoRelInfecciosas.sbConsultarClick(Sender: TObject);
var Contador  : Integer;
begin
if (rg_Relatorios.ItemIndex = 1)
then begin

      Contador := 0;
      if (DateEditInicial.Date < 0) then
      begin
        ShowMessage('Pelo menos um parâmetro tem que ser informado.');
      end else begin
                qRelExamesFaturaGrupo.Close;
                qRelExamesFaturaGrupo.SQL.Clear;
                qRelExamesFaturaGrupo.SQL.Add(' select pr.pro_cod, pr.pro_dcad, pr.pro_prot, pa.pes_nome, pr.exa_cod, l.LAB_LABT, ');
                qRelExamesFaturaGrupo.SQL.Add(' case when pr.pro_valor <=0 then (select sum(pv.par_vlr) from tb_parcelas pv where pv.par_onde = :Tipo and pv.pro_cod=pr.pro_cod) else pr.pro_valor end pro_valor ');
                qRelExamesFaturaGrupo.SQL.Add(' from tb_PROCEDIMENTOS pr JOIN tb_PACIENTES pa ON pr.pes_cod = pa.pes_cod ');
                qRelExamesFaturaGrupo.SQL.Add(' JOIN tb_laboratorios l ON pr.lab_cod = l.lab_cod ');
                qRelExamesFaturaGrupo.SQL.Add(' where ');

                if (DateEditInicial.Date > 0) and (DateEditFinal.Date > 0)
                then begin
                      Contador := Contador + 1;
                      qRelExamesFaturaGrupo.SQL.Add(' pr.pro_dcad >= :DT1 and pr.pro_dcad <= :DT2 ');
                      qRelExamesFaturaGrupo.Parameters.ParamByName('DT1').Value := DateEditInicial.Date;
                      qRelExamesFaturaGrupo.Parameters.ParamByName('DT2').Value := DateEditFinal.Date;
                     end;


                if (DBLookupComboBox3.Text <> '')
                then begin
                      if Contador > 0
                      then begin
                            qRelExamesFaturaGrupo.SQL.Add(' and pr.lab_cod = :p3 ');
                            qRelExamesFaturaGrupo.Parameters.ParamByName('p3').Value := DBLookupComboBox3.KeyValue;
                           end else begin
                                     qRelExamesFaturaGrupo.SQL.Add(' pr.lab_cod = :p3 ');
                                     qRelExamesFaturaGrupo.Parameters.ParamByName('p3').Value := DBLookupComboBox3.KeyValue;
                                    end;
                     end;

                if (cb_Forma.Text <> '')
                then begin
                      if Contador > 0
                      then begin
                            qRelExamesFaturaGrupo.SQL.Add(' and pr.PRO_TIPPAG = :p4 ');
                            qRelExamesFaturaGrupo.Parameters.ParamByName('p4').Value := cb_Forma.Text;
                           end else begin
                                     qRelExamesFaturaGrupo.SQL.Add(' pr.PRO_TIPPAG = :p4 ');
                                     qRelExamesFaturaGrupo.Parameters.ParamByName('p4').Value := cb_Forma.Text;
                                    end;
                     end;

                qRelExamesFaturaGrupo.Parameters.ParamByName('Tipo').Value := 'Infecciosas';
                qRelExamesFaturaGrupo.SQL.Add(' order by pr.pro_prot ');
                qRelExamesFaturaGrupo.Open;

                if qRelExamesFaturaGrupo.RecordCount > 0
                then begin
                      RLReport1.Preview(nil);
                     end else begin
                               ShowMessage('Não foram encontrados dados para geração desse relatório.');
                              end;

               end;
    end;
if (rg_Relatorios.ItemIndex = 0)
then begin
       qRelControle.Close;
       qRelControle.Parameters.ParamByName('DataIni').Value := DateEditInicial.Date;
       qRelControle.Parameters.ParamByName('DataFim').Value := DateEditFinal.Date;
       qRelControle.Open;
       if qRelControle.RecordCount > 0
       then begin
             RLReport2.Preview(nil);
            end else begin
                      ShowMessage('Não foram encontrados dados para geração desse relatório.');
                     end;
     end;
if (rg_Relatorios.ItemIndex = 2)
then begin
      qRelControleLab.Close;
      qRelControleLab.SQL.Clear;
      qRelControleLab.SQL.Add(' select * ');
      qRelControleLab.SQL.Add(' from tb_PROCEDIMENTOS pr JOIN tb_PACIENTES pa ON pr.pes_cod = pa.pes_cod ');
      qRelControleLab.SQL.Add(' JOIN tb_laboratorios l ON pr.lab_cod = l.lab_cod ');
      qRelControleLab.SQL.Add(' where ');


      if (DateEditInicial.Date > 0) and (DateEditFinal.Date > 0)
      then begin
            Contador := Contador + 1;
            qRelControleLab.SQL.Add(' pr.PRO_DCOL >= :DT1 and pr.PRO_DCOL <= :DT2 ');
            qRelControleLab.Parameters.ParamByName('DT1').Value := DateEditInicial.Date;
            qRelControleLab.Parameters.ParamByName('DT2').Value := DateEditFinal.Date;
           end;


      if (DBLookupComboBox3.Text <> '')
      then begin
            if Contador > 0
            then begin
                  qRelControleLab.SQL.Add(' and pr.lab_cod = :p3 ');
                  qRelControleLab.Parameters.ParamByName('p3').Value := DBLookupComboBox3.KeyValue;
                 end else begin
                           qRelControleLab.SQL.Add(' pr.lab_cod = :p3 ');
                           qRelControleLab.Parameters.ParamByName('p3').Value := DBLookupComboBox3.KeyValue;
                          end;
           end;
      qRelControleLab.SQL.Add(' and pr.pro_prot is not null ');
      qRelControleLab.SQL.Add(' order by pr.pro_prot ');
      qRelControleLab.Open;

       if qRelControleLab.RecordCount > 0
       then begin
             RLReport3.Preview(nil);
            end else begin
                      ShowMessage('Não foram encontrados dados para geração desse relatório.');
                     end;
     end;
if (rg_Relatorios.ItemIndex = 3)
then begin
      qRelCasosResultados.Close;
      qRelCasosResultados.SQL.Clear;
      qRelCasosResultados.SQL.Add(' select pr.pro_prot, l.lab_labt, pr.pro_dcol, pa.pes_nome, pre.pro_resul ');
      qRelCasosResultados.SQL.Add(' from tb_PROCEDIMENTOS pr JOIN tb_procedimentos_resultado pre ON pr.pro_cod = pre.pro_cod ');
      qRelCasosResultados.SQL.Add(' JOIN tb_PACIENTES pa ON pr.pes_cod = pa.pes_cod ');
      qRelCasosResultados.SQL.Add(' JOIN tb_laboratorios l ON pr.lab_cod = l.lab_cod ');
      qRelCasosResultados.SQL.Add(' where ');


      if (DateEditInicial.Date > 0) and (DateEditFinal.Date > 0)
      then begin
            Contador := Contador + 1;
            qRelCasosResultados.SQL.Add(' pr.PRO_DCOL >= :DT1 and pr.PRO_DCOL <= :DT2 ');
            qRelCasosResultados.Parameters.ParamByName('DT1').Value := DateEditInicial.Date;
            qRelCasosResultados.Parameters.ParamByName('DT2').Value := DateEditFinal.Date;
           end;


      if (DBLookupComboBox3.Text <> '')
      then begin
            if Contador > 0
            then begin
                  qRelCasosResultados.SQL.Add(' and pr.lab_cod = :p3 ');
                  qRelCasosResultados.Parameters.ParamByName('p3').Value := DBLookupComboBox3.KeyValue;
                 end else begin
                           qRelCasosResultados.SQL.Add(' pr.lab_cod = :p3 ');
                           qRelCasosResultados.Parameters.ParamByName('p3').Value := DBLookupComboBox3.KeyValue;
                          end;
           end;
      qRelCasosResultados.SQL.Add(' order by pre.pro_resul, pr.pro_dcol ');
      qRelCasosResultados.Open;

       if qRelCasosResultados.RecordCount > 0
       then begin
             RLReport4.Preview(nil);
            end else begin
                      ShowMessage('Não foram encontrados dados para geração desse relatório.');
                     end;
     end;

if (rg_Relatorios.ItemIndex = 4)
then begin

      Contador := 0;
      if (DateEditInicial.Date < 0) then
      begin
        ShowMessage('Pelo menos um parâmetro tem que ser informado.');
      end else begin
                qRelExamesFaturaGrupo.Close;
                qRelExamesFaturaGrupo.SQL.Clear;
                qRelExamesFaturaGrupo.SQL.Add(' select pr.pro_cod, pr.pro_dcad, pr.pro_prot, pa.pes_nome, pr.exa_cod, l.LAB_LABT, ');
                qRelExamesFaturaGrupo.SQL.Add(' case when pr.pro_valor <=0 then (select sum(pv.par_vlr) from tb_parcelas pv where pv.par_onde = :Tipo and pv.pro_cod=pr.pro_cod) else pr.pro_valor end pro_valor ');
                qRelExamesFaturaGrupo.SQL.Add(' from tb_PROCEDIMENTOS pr JOIN tb_PACIENTES pa ON pr.pes_cod = pa.pes_cod ');
                qRelExamesFaturaGrupo.SQL.Add(' JOIN tb_laboratorios l ON pr.lab_cod = l.lab_cod ');
                qRelExamesFaturaGrupo.SQL.Add(' where ');

                if (DateEditInicial.Date > 0) and (DateEditFinal.Date > 0)
                then begin
                      Contador := Contador + 1;
                      qRelExamesFaturaGrupo.SQL.Add(' pr.pro_dcad >= :DT1 and pr.pro_dcad <= :DT2 ');
                      qRelExamesFaturaGrupo.Parameters.ParamByName('DT1').Value := DateEditInicial.Date;
                      qRelExamesFaturaGrupo.Parameters.ParamByName('DT2').Value := DateEditFinal.Date;
                     end;


                if (DBLookupComboBox3.Text <> '')
                then begin
                      if Contador > 0
                      then begin
                            qRelExamesFaturaGrupo.SQL.Add(' and pr.lab_cod = :p3 ');
                            qRelExamesFaturaGrupo.Parameters.ParamByName('p3').Value := DBLookupComboBox3.KeyValue;
                           end else begin
                                     qRelExamesFaturaGrupo.SQL.Add(' pr.lab_cod = :p3 ');
                                     qRelExamesFaturaGrupo.Parameters.ParamByName('p3').Value := DBLookupComboBox3.KeyValue;
                                    end;
                     end;

                if (cb_Forma.Text <> '')
                then begin
                      if Contador > 0
                      then begin
                            qRelExamesFaturaGrupo.SQL.Add(' and pr.PRO_TIPPAG = :p4 ');
                            qRelExamesFaturaGrupo.Parameters.ParamByName('p4').Value := cb_Forma.Text;
                           end else begin
                                     qRelExamesFaturaGrupo.SQL.Add(' pr.PRO_TIPPAG = :p4 ');
                                     qRelExamesFaturaGrupo.Parameters.ParamByName('p4').Value := cb_Forma.Text;
                                    end;
                     end;

                qRelExamesFaturaGrupo.Parameters.ParamByName('Tipo').Value := 'Infecciosas';
                qRelExamesFaturaGrupo.SQL.Add(' order by pr.pro_prot ');
                qRelExamesFaturaGrupo.Open;

                if qRelExamesFaturaGrupo.RecordCount > 0
                then begin
                      RLLabel58.Caption := 'Financeito Geral - Período : '  + DateEditInicial.Text + ' até ' + DateEditFinal.Text;
                      RLReportFG.Preview(nil);
                     end else begin
                               ShowMessage('Não foram encontrados dados para geração desse relatório.');
                              end;

               end;
    end;


end;


procedure TfEmissaoRelInfecciosas.rg_RelatoriosClick(Sender: TObject);
begin
if ((rg_Relatorios.ItemIndex = 1) or (rg_Relatorios.ItemIndex = 4))
then begin
      Label3.Enabled   := True;
      cb_Forma.Enabled := True;
     end else begin
                Label3.Enabled   := False;
                cb_Forma.Enabled := False;
              end;




end;

end.

