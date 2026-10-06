unit ufExportaExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, DB, ADODB, ComObj, Mask,
  JvExMask, JvToolEdit, DateUtils;

type
  TfExportaExcel = class(TForm)
    RadioGroup1: TRadioGroup;
    sbExportar: TSpeedButton;
    sbFechar: TSpeedButton;
    lbOrigem: TLabel;
    qExportaLocais: TADOQuery;
    qExportaLocaisLCO_COD: TIntegerField;
    qExportaLocaisLCO_NOME: TStringField;
    qExportaLocaisLCO_SEXO: TIntegerField;
    qExportaLocaisLCO_CRM: TStringField;
    qExportaLocaisLCO_LABT: TStringField;
    qExportaLocaisLCO_FONE: TStringField;
    qExportaLocaisLCO_END: TStringField;
    qExportaLocaisLCO_CID: TStringField;
    qExportaLocaisUF_SIGLA: TStringField;
    qExportaLocaisLCO_TLIE: TIntegerField;
    qExportaLocaisLCO_CATE: TIntegerField;
    qExportaLocaisLCO_TRAT: TIntegerField;
    qExportaLocaisLCO_CEL: TStringField;
    qExportaLocaisLCO_RES: TStringField;
    qExportaLocaisLCO_EMAIL: TStringField;
    qExportaLocaisLCO_SITE: TStringField;
    qExportaLocaisLCO_CEP: TStringField;
    qExportaLocaisLCO_DTRE: TDateField;
    qExportaLocaisLCO_DCAD: TDateField;
    qExportaLocaisLCO_NUMCARTCORREIO: TIntegerField;
    qExportaComarcas: TADOQuery;
    qExportaComarcasCOM_COD: TIntegerField;
    qExportaComarcasCOM_DESC: TStringField;
    qExportaComarcasCOM_SIGLA: TStringField;
    qExportaComarcasUF_SIGLA: TStringField;
    qExportaComarcasDESCRICAOESTADO: TStringField;
    qExportaCasos: TADOQuery;
    Label2: TLabel;
    Label1: TLabel;
    qExportaCasosPRO_COD: TIntegerField;
    qExportaCasosCAS_CODIGO: TStringField;
    qExportaCasosPRO_DCOLE: TDateField;
    qExportaCasosPRO_RESUL: TIntegerField;
    qExportaComarcasJuizes: TADOQuery;
    qExportaComarcasJuizesUF_SIGLA: TStringField;
    qExportaComarcasJuizesUF_DESC: TStringField;
    qExportaComarcasJuizesCOM_COD: TIntegerField;
    qExportaComarcasJuizesCOM_DESC: TStringField;
    qExportaComarcasJuizesVAR_COD: TIntegerField;
    qExportaComarcasJuizesVAR_DESC: TStringField;
    qExportaComarcasJuizesVAR_SIGLA: TStringField;
    qExportaComarcasJuizesJUI_COD: TIntegerField;
    qExportaComarcasJuizesJUI_DESC: TStringField;
    qExportaValores: TADOQuery;
    qExportaValoresPRO_NPERC: TStringField;
    qExportaValoresLCO_COD: TIntegerField;
    qExportaValoresPAR_VLR: TBCDField;
    qExportaValoresPAR_TPPG: TStringField;
    qExportaValoresNOME: TStringField;
    qExportaValoresPAR_DATA: TDateField;
    qExportaValoresANO: TStringField;
    qExportaValoresCIDADE: TStringField;
    qExportaValoresESTADO: TStringField;
    qExportaValoresPRO_COD: TIntegerField;
    qExportaValoresPRO_DREC: TDateField;
    qExportaValoresResumido: TADOQuery;
    qExportaValoresResumidoPRO_COD: TIntegerField;
    qExportaValoresResumidoCIDADE: TStringField;
    qExportaValoresResumidoESTADO: TStringField;
    qExportaValoresResumidoPAR_VLR: TBCDField;
    qExportaValoresResumidoPAR_TPPG: TStringField;
    qExportaValoresResumidoPAR_DATA: TDateField;
    qExportaValoresResumidoTIPO: TStringField;
    qExportaValoresResumidoPRO_DREC: TDateField;
    qQuantExamesCidade: TADOQuery;
    qQuantExamesCidadeCIDADE: TStringField;
    qQuantExamesCidadeESTADO: TStringField;
    qQuantExamesCidadeTIPO: TStringField;
    qQuantExamesCidadeANO_MES: TStringField;
    qQuantExamesCidadeQUANTIDADE: TIntegerField;
    qExportaLocaisLCO_SITUACAO: TStringField;
    qExportaLocaisLCO_DNASC: TDateField;
    qExportaLocaisLCO_CPFCNPJ: TStringField;
    qExportaLocaisLCO_BANCO: TStringField;
    qExportaLocaisLCO_AGENCIA: TStringField;
    qExportaLocaisLCO_CONTA: TStringField;
    qExportaLocaisLCO_MINKIT: TIntegerField;
    DateEditInicial: TJvDateEdit;
    DateEditFinal: TJvDateEdit;
    edtDestino: TJvDirectoryEdit;
    qExportaFluxo2: TADOQuery;
    qExportaFluxo1: TADOQuery;
    qExportaFluxo1PRO_TIPO: TIntegerField;
    qExportaFluxo1PAR_TPPG_NEW: TStringField;
    qExportaFluxo1PRO_COD: TIntegerField;
    qExportaFluxo1PAR_NMFOR: TStringField;
    qExportaFluxo1PRO_DREC: TDateField;
    qExportaFluxo1PAR_TPPG: TStringField;
    qExportaFluxo1PAR_VLR: TBCDField;
    qExportaFluxo2PRO_TIPO: TIntegerField;
    qExportaFluxo2PAR_TPPG_NEW: TStringField;
    qExportaFluxo2PRO_COD: TIntegerField;
    qExportaFluxo2PAR_NMFOR: TStringField;
    qExportaFluxo2PRO_DREC: TDateField;
    qExportaFluxo2PAR_TPPG: TStringField;
    qExportaFluxo2PAR_VLR: TBCDField;
    qExportaFluxo2PAR_DATA: TDateField;
    qExportaControleFinanceiro: TADOQuery;
    qExportaControleFinanceiroSETOR: TStringField;
    qExportaControleFinanceiroDOCUMENTO: TIntegerField;
    qExportaControleFinanceiroORIGEM: TStringField;
    qExportaControleFinanceiroCIDADE: TStringField;
    qExportaControleFinanceiroESTADO: TStringField;
    qExportaControleFinanceiroDATA_CADASTRO: TDateField;
    qExportaControleFinanceiroFORMA_PAG: TStringField;
    qExportaControleFinanceiroVALOR_TOTAL: TBCDField;
    qExportaControleFinanceiroPARCELAS: TIntegerField;
    qExportaControleFinanceiroDATA_DEP: TDateField;
    qExportaControleFinanceiroVALOR_DEP: TBCDField;
    qExportaControleFinanceiroOBSERVACAO: TStringField;
    procedure sbExportarClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fExportaExcel: TfExportaExcel;
  excel :variant;
  MesGerando, NomePlanilha, NumeroCaso, Data_Mapa, AnoA, MesA, DiaA : String;
  Linha, NumeroSheets, i, NumeroCasoVerificacao : Integer;
  Ano, Mes, Dia : Word;

implementation

uses ufDM, Math;

{$R *.dfm}

procedure TfExportaExcel.sbExportarClick(Sender: TObject);
 var Data : TDateTime;
begin
DecodeDate (Date, Ano, Mes, Dia);
AnoA := IntToStr(Ano);
MesA := IntToStr(Mes);
DiaA := IntToStr(Dia);


if (edtDestino.Text = '')
then begin
      ShowMessage('Informe o local de exportação do arquivo!');
     end else begin
                excel := CreateOleObject('Excel.Application');
                if not Excel.Application.Visible then
                if (RadioGroup1.ItemIndex = 0)
                then begin
                        Excel.WorkBooks.Open(DM.qParametrosPAM_DPADR.Value + 'Modelo_Exporta_Excel_Comarcas.xls');
                        NomePlanilha := edtDestino.Text + '\Comarca_' + DiaA + MesA + AnoA + '.xls';
                        NumeroSheets := 1;
                        Linha := 2;
                        qExportaComarcas.Close;
                        qExportaComarcas.Open;
                        qExportaComarcas.First;
                        while not qExportaComarcas.Eof do
                        begin
                         Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]  := qExportaComarcasCOM_COD.Value;
                         Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2]  := qExportaComarcasCOM_DESC.Value;
                         Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3]  := qExportaComarcasCOM_SIGLA.Value;

                         Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4]  := qExportaComarcasUF_SIGLA.Value;
                         Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5]  := qExportaComarcasDESCRICAOESTADO.Value;

                         Linha:=Linha+1;
                         qExportaComarcas.Next;
                        end;
                       Excel.Application.Visible := true;
                       Excel.ActiveWorkBook.SaveAs(NomePlanilha);
                       Excel.quit;
                       Excel:=unassigned;
                     end;
                      if (RadioGroup1.ItemIndex = 1)
                      then begin
                                Excel.WorkBooks.Open(DM.qParametrosPAM_DPADR.Value + 'Modelo_Exporta_Excel_Locais.xls');
                                NomePlanilha := edtDestino.Text + '\Locais_Coleta_' + DiaA + MesA + AnoA + '.xls';
                                NumeroSheets := 1;
                                Linha := 2;
                                qExportaLocais.Close;
                                qExportaLocais.Open;
                                qExportaLocais.First;
                                while not qExportaLocais.Eof do
                                begin
                                 Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]  := qExportaLocaisLCO_NOME.Value;
                                 Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2]  := qExportaLocaisLCO_CRM.Value;
                                 Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3]  := qExportaLocaisLCO_LABT.Value;
                                 Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4]  := qExportaLocaisLCO_FONE.Value;
                                 Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5]  := qExportaLocaisLCO_END.Value;
                                 Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6]  := qExportaLocaisLCO_CID.Value;
                                 Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7]  := qExportaLocaisLCO_CEP.Value;
                                 Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,8]  := qExportaLocaisUF_SIGLA.Value;
                                 Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,9]  := qExportaLocaisLCO_CEL.Value;
                                 Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,10] := qExportaLocaisLCO_RES.Value;
                                 Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,11] := qExportaLocaisLCO_EMAIL.Value;

                                 Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,12] := qExportaLocaisLCO_CPFCNPJ.Value;
                                 Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,13] := qExportaLocaisLCO_COD.Value;

                                 Linha:=Linha+1;
                                 qExportaLocais.Next;
                                end;
                               Excel.Application.Visible := true;
                               Excel.ActiveWorkBook.SaveAs(NomePlanilha);
                               Excel.quit;
                               Excel:=unassigned;
                             end;
                              if (RadioGroup1.ItemIndex = 2)
                              then begin
                                      Excel.WorkBooks.Open(DM.qParametrosPAM_DPADR.Value + 'Modelo_Exporta_Excel_Casos.xls');
                                      NomePlanilha := edtDestino.Text + '\Casos_' + DiaA + MesA + AnoA + '.xls';
                                      NumeroSheets := 1;
                                      Linha := 2;
                                      qExportaCasos.Close;
                                      qExportaCasos.Parameters.ParamByName('DataIni').Value := DateEditInicial.Date;
                                      qExportaCasos.Parameters.ParamByName('DataFim').Value := DateEditFinal.Date;
                                      qExportaCasos.Open;
                                      qExportaCasos.First;
                                      while not qExportaCasos.Eof do
                                      begin
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]  := qExportaCasosPRO_COD.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2]  := qExportaCasosCAS_CODIGO.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3]  := qExportaCasosPRO_DCOLE.Value;
                                       if (qExportaCasosPRO_RESUL.Value = 1) then Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4]  := 'Positivo';
                                       if (qExportaCasosPRO_RESUL.Value = 2) then Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4]  := 'Negativo';
                                       if (qExportaCasosPRO_RESUL.Value = 3) then Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4]  := 'Cancelado';
                                       if (qExportaCasosPRO_RESUL.Value = 4) then Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4]  := 'Andamento';
                                       if (qExportaCasosPRO_RESUL.Value = 5) then Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4]  := 'Proposta';
                                       if (qExportaCasosPRO_RESUL.Value = 6) then Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4]  := 'Inconclusivo';
                                       Linha:=Linha+1;
                                       qExportaCasos.Next;
                                      end;
                                     Excel.Application.Visible := true;
                                     Excel.ActiveWorkBook.SaveAs(NomePlanilha);
                                     Excel.quit;
                                     Excel:=unassigned;
                                    end;
                              if (RadioGroup1.ItemIndex = 3)
                              then begin
                                      Excel.WorkBooks.Open(DM.qParametrosPAM_DPADR.Value + 'Modelo_Exporta_Excel_Comarcas_Juizes.xls');
                                      NomePlanilha := edtDestino.Text + '\ComarcasJuizes_' + DiaA + MesA + AnoA + '.xls';
                                      NumeroSheets := 1;
                                      Linha := 2;
                                      qExportaComarcasJuizes.Close;
                                      qExportaComarcasJuizes.Open;
                                      qExportaComarcasJuizes.First;
                                      while not qExportaComarcasJuizes.Eof do
                                      begin
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]  := qExportaComarcasJuizesUF_SIGLA.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2]  := qExportaComarcasJuizesUF_DESC.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3]  := qExportaComarcasJuizesCOM_COD.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4]  := qExportaComarcasJuizesCOM_DESC.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5]  := qExportaComarcasJuizesVAR_COD.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6]  := qExportaComarcasJuizesVAR_DESC.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7]  := qExportaComarcasJuizesVAR_SIGLA.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,8]  := qExportaComarcasJuizesJUI_COD.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,9]  := qExportaComarcasJuizesJUI_DESC.Value;
                                       Linha:=Linha+1;
                                       qExportaComarcasJuizes.Next;
                                      end;
                                     Excel.Application.Visible := true;
                                     Excel.ActiveWorkBook.SaveAs(NomePlanilha);
                                     Excel.quit;
                                     Excel:=unassigned;
                                    end;
                              if (RadioGroup1.ItemIndex = 5)
                              then begin
                                      Excel.WorkBooks.Open(DM.qParametrosPAM_DPADR.Value + 'Modelo_Exporta_Excel_Casos_Valores_Resumido.xls');
                                      NomePlanilha := edtDestino.Text + '\Casos_Valores_Resumido_Mes_' + MesA + '.xls';
                                      NumeroSheets := 1;
                                      Linha := 2;
                                      qExportaValoresResumido.Close;
                                      qExportaValoresResumido.Parameters.ParamByName('DataIni').Value := DateEditInicial.Date;
                                      qExportaValoresResumido.Parameters.ParamByName('DataFim').Value := DateEditFinal.Date;
                                      qExportaValoresResumido.Open;
                                      qExportaValoresResumido.First;
                                      while not qExportaValoresResumido.Eof do
                                      begin

                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]  := qExportaValoresResumidoPRO_COD.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2]  := trim(qExportaValoresResumidoTIPO.Value);
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3]  := qExportaValoresResumidoCIDADE.Value;

                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4]  := qExportaValoresResumidoESTADO.Value;;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5]  := qExportaValoresResumidoPRO_DREC.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6]  := qExportaValoresResumidoPAR_VLR.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7]  := qExportaValoresResumidoPAR_TPPG.Value;

                                       Linha:=Linha+1;
                                       qExportaValoresResumido.Next;
                                      end;
                                     Excel.Application.Visible := true;
                                     Excel.ActiveWorkBook.SaveAs(NomePlanilha);
                                     Excel.quit;
                                     Excel:=unassigned;
                                    end;
                              if (RadioGroup1.ItemIndex = 4)
                              then begin
                                      Excel.WorkBooks.Open(DM.qParametrosPAM_DPADR.Value + 'Modelo_Exporta_Excel_Casos_Valores.xls');
                                      NomePlanilha := edtDestino.Text + '\Casos_Valores_Mes_' + MesA + '.xls';
                                      NumeroSheets := 1;
                                      Linha := 2;
                                      qExportaValores.Close;
                                      qExportaValores.Parameters.ParamByName('DataIni').Value := DateEditInicial.Date;
                                      qExportaValores.Parameters.ParamByName('DataFim').Value := DateEditFinal.Date;
                                      qExportaValores.Open;
                                      qExportaValores.First;
                                      while not qExportaValores.Eof do
                                      begin

                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]  := qExportaValoresANO.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2]  := qExportaValoresCIDADE.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3]  := qExportaValoresESTADO.Value;

                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4]  := qExportaValoresPRO_COD.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5]  := qExportaValoresLCO_COD.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6]  := qExportaValoresNOME.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7]  := qExportaValoresPRO_DREC.Value;
                                       if (qExportaValoresPAR_TPPG.Value = 'DINHEIRO')
                                       then begin
                                             Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,8]  := qExportaValoresPAR_VLR.Value;
                                             Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,11]  := qExportaValoresPAR_TPPG.Value;
                                            end else begin
                                                      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,9]  := qExportaValoresPAR_VLR.Value;
                                                      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,11]  := qExportaValoresPAR_TPPG.Value;
                                                      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,10]  := qExportaValoresPAR_DATA.Value;
                                                     end;


                                       Linha:=Linha+1;
                                       qExportaValores.Next;
                                      end;
                                     Excel.Application.Visible := true;
                                     Excel.ActiveWorkBook.SaveAs(NomePlanilha);
                                     Excel.quit;
                                     Excel:=unassigned;
                                    end;
                              if (RadioGroup1.ItemIndex = 6)
                              then begin
                                      Excel.WorkBooks.Open(DM.qParametrosPAM_DPADR.Value + 'Modelo_Exporta_Excel_Quantidade.xls');
                                      NomePlanilha := edtDestino.Text + '\Quantidade_Casos_geradoem_' + AnoA + MesA + '.xls';
                                      NumeroSheets := 1;
                                      Linha := 2;
                                      qQuantExamesCidade.Close;
                                      qQuantExamesCidade.Parameters.ParamByName('DataIni').Value := DateEditInicial.Date;
                                      qQuantExamesCidade.Parameters.ParamByName('DataFim').Value := DateEditFinal.Date;
                                      qQuantExamesCidade.Open;
                                      qQuantExamesCidade.First;
                                      while not qQuantExamesCidade.Eof do
                                      begin

                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]  := qQuantExamesCidadeESTADO.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2]  := qQuantExamesCidadeCIDADE.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3]  := qQuantExamesCidadeTIPO.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4]  := qQuantExamesCidadeANO_MES.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5]  := qQuantExamesCidadeQUANTIDADE.Value;
                                       Linha:=Linha+1;

                                       qQuantExamesCidade.Next;
                                      end;
                                     Excel.Application.Visible := true;
                                     Excel.ActiveWorkBook.SaveAs(NomePlanilha);
                                     Excel.quit;
                                     Excel:=unassigned;
                                    end;
                              if (RadioGroup1.ItemIndex = 7) // Fluxo Caixa
                              then begin
                                      Excel.WorkBooks.Open(DM.qParametrosPAM_DPADR.Value + 'Modelo_Exporta_Excel_Fluxo_1.xls');
                                      NomePlanilha := edtDestino.Text + '\Valores_FluxoCaixa_' + DiaA + MesA + AnoA + '.xls';
                                      NumeroSheets := 1;
                                      Linha := 2;
                                      qExportaFluxo1.Close;
                                      qExportaFluxo1.Parameters.ParamByName('DataIni').Value := DateEditInicial.Date;
                                      qExportaFluxo1.Parameters.ParamByName('DataFim').Value := DateEditFinal.Date;
                                      qExportaFluxo1.Open;
                                      qExportaFluxo1.First;
                                      while not qExportaFluxo1.Eof do
                                      begin

                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]  := qExportaFluxo1PRO_DREC.Value;

                                       if (qExportaFluxo1PRO_TIPO.Value = 2)
                                       then begin
                                             Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2]  :='3.2.1 Exames Extra';
                                             end else Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2]  :='3.2.2 Exames Judicial';

                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3]  :='DNA';
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4]  := qExportaFluxo1PAR_NMFOR.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5]  := qExportaFluxo1PRO_COD.Value;

                                       if ((Trim(qExportaFluxo1PAR_TPPG_NEW.Value) = 'CRÉDITO') or (Trim(qExportaFluxo1PAR_TPPG_NEW.Value) = 'HONORÁRIOS') or (Trim(qExportaFluxo1PAR_TPPG_NEW.Value) = 'PENDENTE'))
                                       then begin
                                             Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6]  := qExportaFluxo1PAR_VLR.Value;
                                            end else Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7]  := qExportaFluxo1PAR_VLR.Value;

                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,8]  := Trim(qExportaFluxo1PAR_TPPG_NEW.Value);


                                       Linha:=Linha+1;
                                       qExportaFluxo1.Next;
                                      end;
                                     Excel.Application.Visible := true;
                                     Excel.ActiveWorkBook.SaveAs(NomePlanilha);
                                     Excel.quit;
                                     Excel:=unassigned;
                                    end;

                              if (RadioGroup1.ItemIndex = 8) // Fluxo Caixa 2
                              then begin
                                      Excel.WorkBooks.Open(DM.qParametrosPAM_DPADR.Value + 'Modelo_Exporta_Excel_Fluxo_1.xls');
                                      NomePlanilha := edtDestino.Text + '\Valores_FluxoCaixa_' + DiaA + MesA + AnoA + '.xls';
                                      NumeroSheets := 1;
                                      Linha := 2;
                                      qExportaFluxo2.Close;
                                      qExportaFluxo2.Parameters.ParamByName('DataIni').Value := DateEditInicial.Date;
                                      qExportaFluxo2.Parameters.ParamByName('DataFim').Value := DateEditFinal.Date;
                                      qExportaFluxo2.Open;
                                      qExportaFluxo2.First;
                                      while not qExportaFluxo2.Eof do
                                      begin

                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]  := qExportaFluxo2PRO_DREC.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]  := qExportaFluxo2PRO_DREC.Value;

                                       if (qExportaFluxo2PRO_TIPO.Value = 2)
                                       then begin
                                             Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2]  :='3.2.1 Exames Extra';
                                             end else Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2]  :='3.2.2 Exames Judicial';

                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3]  :='DNA';
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4]  := qExportaFluxo2PAR_NMFOR.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5]  := qExportaFluxo2PRO_COD.Value;

                                       if ((Trim(qExportaFluxo2PAR_TPPG_NEW.Value) = 'CRÉDITO') or (Trim(qExportaFluxo2PAR_TPPG_NEW.Value) = 'HONORÁRIOS') or (Trim(qExportaFluxo2PAR_TPPG_NEW.Value) = 'PENDENTE'))
                                       then begin
                                             Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6]  :=qExportaFluxo2PAR_VLR.Value;
                                            end else Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7]  :=qExportaFluxo2PAR_VLR.Value;

                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,8]  := Trim(qExportaFluxo2PAR_TPPG_NEW.Value);
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,9]  := qExportaFluxo2PAR_DATA.Value;


                                       Linha:=Linha+1;
                                       qExportaFluxo2.Next;
                                      end;
                                     Excel.Application.Visible := true;
                                     Excel.ActiveWorkBook.SaveAs(NomePlanilha);
                                     Excel.quit;
                                     Excel:=unassigned;
                                    end;
                              if (RadioGroup1.ItemIndex = 9) // Controle Financeiro Bruno
                              then begin
                                      Excel.WorkBooks.Open(DM.qParametrosPAM_DPADR.Value + 'Modelo_Exporta_Excel_Controle_Financeiro.xls');
                                      NomePlanilha := edtDestino.Text + '\Valores_ControleFinanceiro_' + DiaA + MesA + AnoA + '.xls';
                                      NumeroSheets := 1;
                                      Linha := 2;
                                      qExportaControleFinanceiro.Close;
                                      qExportaControleFinanceiro.Parameters.ParamByName('DataIni').Value := DateEditInicial.Date;
                                      qExportaControleFinanceiro.Parameters.ParamByName('DataFim').Value := DateEditFinal.Date;
                                      qExportaControleFinanceiro.Open;
                                      qExportaControleFinanceiro.First;
                                      while not qExportaControleFinanceiro.Eof do
                                      begin

                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]   := qExportaControleFinanceiroSETOR.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2]   := qExportaControleFinanceiroDOCUMENTO.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3]   := qExportaControleFinanceiroORIGEM.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4]   := qExportaControleFinanceiroCIDADE.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5]   := qExportaControleFinanceiroESTADO.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6]   := qExportaControleFinanceiroDATA_CADASTRO.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7]   := qExportaControleFinanceiroVALOR_TOTAL.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,8]   := qExportaControleFinanceiroFORMA_PAG.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,9]   := qExportaControleFinanceiroPARCELAS.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,10]  := qExportaControleFinanceiroDATA_DEP.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,11]  := qExportaControleFinanceiroVALOR_DEP.Value;
                                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,12]  := qExportaControleFinanceiroOBSERVACAO.Value;

                                       Linha:=Linha+1;
                                       qExportaControleFinanceiro.Next;
                                      end;
                                     Excel.Application.Visible := true;
                                     Excel.ActiveWorkBook.SaveAs(NomePlanilha);
                                     Excel.quit;
                                     Excel:=unassigned;
                                    end;

end;
ShowMessage('Exportação finalizada!');
end;


procedure TfExportaExcel.sbFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfExportaExcel.RadioGroup1Click(Sender: TObject);
begin
if (RadioGroup1.ItemIndex = 2) or (RadioGroup1.ItemIndex = 4)  or (RadioGroup1.ItemIndex = 5) or (RadioGroup1.ItemIndex = 6) or (RadioGroup1.ItemIndex = 7) or (RadioGroup1.ItemIndex = 8) or (RadioGroup1.ItemIndex = 9)
then begin
      Label1.Enabled          := True;
      Label2.Enabled          := True;
      DateEditInicial.Enabled := True;
      DateEditFinal.Enabled   := True;
     end else begin
               Label1.Enabled          := False;
               Label2.Enabled          := False;
               DateEditInicial.Enabled := False;
               DateEditFinal.Enabled   := False;
              end;

end;

end.


