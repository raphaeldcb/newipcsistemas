unit ufGeradorRelFinanceiro;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, Mask, Buttons, JvExMask, JvToolEdit,
  Data.DB, Data.Win.ADODB, Variants, ComObj, Math, DateUtils;

type
  TfEmissaoRelFinanceiro = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    bbtConsultar: TBitBtn;
    bbtFechar: TBitBtn;
    Label20: TLabel;
    ComboBoxTipoPagamento: TComboBox;
    DateEditInicial: TJvDateEdit;
    DateEditFinal: TJvDateEdit;
    rg_Tipo: TRadioGroup;
    cb_Obs: TCheckBox;
    qRelFinanceiroDadosExportador: TADOQuery;
    edtDestino: TJvDirectoryEdit;
    qRelFinanceiroDadosExportadorPES_NOME: TStringField;
    qRelFinanceiroDadosExportadorSIT_NM: TStringField;
    qRelFinanceiroDadosExportadorPRO_COD: TIntegerField;
    qRelFinanceiroDadosExportadorPRO_AUTO: TStringField;
    qRelFinanceiroDadosExportadorPRO_DREC: TDateField;
    qRelFinanceiroDadosExportadorVAR_DESC: TStringField;
    qRelFinanceiroDadosExportadorCIDADE: TStringField;
    qRelFinanceiroDadosExportadorESTADO: TStringField;
    qRelFinanceiroDadosExportadorLCO_LABT: TStringField;
    qRelFinanceiroDadosExportadorPAR_OBS: TStringField;
    qRelFinanceiroDadosExportadorPAR_VLR: TBCDField;
    procedure bbtFecharClick(Sender: TObject);
    procedure bbtConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEmissaoRelFinanceiro: TfEmissaoRelFinanceiro;
  excel :variant;
  MesGerando, NomePlanilha, NumeroCaso, Data_Mapa, AnoA, MesA, DiaA : String;
  Linha, NumeroSheets, i, NumeroCasoVerificacao : Integer;
  Ano, Mes, Dia : Word;

implementation

uses ufDMR, ufRelConsulta, ufRelFinanceiro, ufDM;

{$R *.DFM}


procedure TfEmissaoRelFinanceiro.bbtFecharClick(Sender: TObject);
begin
	close;
end;

procedure TfEmissaoRelFinanceiro.bbtConsultarClick(Sender: TObject);
var Contador : Integer;
    Data : TDateTime;
begin
DecodeDate (Date, Ano, Mes, Dia);
AnoA := IntToStr(Ano);
MesA := IntToStr(Mes);
DiaA := IntToStr(Dia);

Contador := 0;
if (rg_Tipo.ItemIndex = 0)
then begin
      if ((DateEditInicial.Date = 0) and (DateEditFinal.Date = 0)) and (ComboBoxTipoPagamento.ItemIndex = -1) then
      begin
        ShowMessage('Pelo menos um parâmetro tem que ser informado.');
      end else begin
                DMR.qRelFinanceiro.Close;
                DMR.qRelFinanceiro.SQL.Clear;
                DMR.qRelFinanceiro.SQL.Add('select pa.par_tppg, p.pro_cod, SUM(pa.par_vlr) as Valor_Total from tb_parcelas pa JOIN tb_processo p on pa.pro_cod = p.pro_cod and pa.par_sit = 1');
                DMR.qRelFinanceiro.SQL.Add(' where ');

                DMR.qRelFinanceiroSum.Close;
                DMR.qRelFinanceiroSum.SQL.Clear;
                DMR.qRelFinanceiroSum.SQL.Add('select SUM(pa.par_vlr) as Valor_Total_Geral from tb_parcelas pa JOIN tb_processo p on pa.pro_cod = p.pro_cod and pa.par_sit = 1');
                DMR.qRelFinanceiroSum.SQL.Add(' where ');

                if (DateEditInicial.Date > 0) and (DateEditFinal.Date > 0)
                then begin
                      Contador := Contador + 1;
                      DMR.qRelFinanceiro.SQL.Add(' pa.par_data >= :DT1 and pa.par_data <= :DT2 ');
                      DMR.qRelFinanceiro.Parameters.ParamByName('DT1').Value := DateEditInicial.Date;
                      DMR.qRelFinanceiro.Parameters.ParamByName('DT2').Value := DateEditFinal.Date;

                      DMR.qRelFinanceiroSum.SQL.Add(' pa.par_data >= :DT1 and pa.par_data <= :DT2 ');
                      DMR.qRelFinanceiroSum.Parameters.ParamByName('DT1').Value := DateEditInicial.Date;
                      DMR.qRelFinanceiroSum.Parameters.ParamByName('DT2').Value := DateEditFinal.Date;
                     end;


                if (ComboBoxTipoPagamento.ItemIndex >= 0)
                then begin
                      if Contador > 0
                      then begin
                            DMR.qRelFinanceiro.SQL.Add(' and pa.par_tppg = :p1 ');
                            DMR.qRelFinanceiro.Parameters.ParamByName('p1').Value := ComboBoxTipoPagamento.Text;

                            DMR.qRelFinanceiroSum.SQL.Add(' and pa.par_tppg = :p1 ');
                            DMR.qRelFinanceiroSum.Parameters.ParamByName('p1').Value := ComboBoxTipoPagamento.Text;
                           end else begin
                                     DMR.qRelFinanceiro.SQL.Add(' pa.par_tppg = :p1 ');
                                     DMR.qRelFinanceiro.Parameters.ParamByName('p1').Value := ComboBoxTipoPagamento.Text;

                                     DMR.qRelFinanceiroSum.SQL.Add(' pa.par_tppg = :p1 ');
                                     DMR.qRelFinanceiroSum.Parameters.ParamByName('p1').Value := ComboBoxTipoPagamento.Text;
                                    end;
                     end;
                DMR.qRelFinanceiro.SQL.Add(' group by pa.par_tppg, p.pro_cod ');
                DMR.qRelFinanceiro.Open;
                DMR.qRelFinanceiroSum.Open;

                if DMR.qRelFinanceiro.RecordCount > 0
                then begin
                      Application.CreateForm(TfRelFinanceiro,fRelFinanceiro);
                      fRelFinanceiro.qrp_Geral.Preview(nil);;
                      fRelFinanceiro.Free;
                     end else begin
                               ShowMessage('Não foram encontrados dados para geração desse relatório.');
                              end;

               end;
     end;
if (rg_Tipo.ItemIndex = 1) // Dados dos Processos
then begin
      if ((DateEditInicial.Date = 0) and (DateEditFinal.Date = 0)) and (ComboBoxTipoPagamento.ItemIndex = -1) then
      begin
        ShowMessage('Pelo menos um parâmetro tem que ser informado.');
      end else begin
                DMR.qRelFinanceiroDados.Close;
                DMR.qRelFinanceiroDados.SQL.Clear;
                DMR.qRelFinanceiroDados.SQL.Add(' SELECT DISTINCT P.PRO_COD,p.PRO_AUTO,p.PRO_DREC,v.VAR_DESC,c.COM_DESC CIDADE,U.UF_SIGLA ESTADO,	l.LCO_LABT,h.HIS_DATA, pa.PAR_OBS');
                DMR.qRelFinanceiroDados.SQL.Add(' from tb_processo p join tb_parcelas pa on p.pro_cod = pa.pro_cod  ');
                DMR.qRelFinanceiroDados.SQL.Add('                    join tb_lcoleta l on l.lco_cod = p.lco_cod  ');
                DMR.qRelFinanceiroDados.SQL.Add('         LEFT OUTER JOIN tb_comarca c ON c.COM_COD=p.COM_COD AND c.UF_SIGLA=p.UF_SIGLA  ');
                DMR.qRelFinanceiroDados.SQL.Add('         LEFT OUTER JOIN tb_varas v ON p.VAR_COD=v.VAR_COD AND v.COM_COD=p.COM_COD AND v.UF_SIGLA=p.UF_SIGLA  ');
                DMR.qRelFinanceiroDados.SQL.Add('         LEFT OUTER JOIN tb_uf u ON u.UF_SIGLA=p.UF_SIGLA  ');
                DMR.qRelFinanceiroDados.SQL.Add('         LEFT OUTER JOIN tb_historico h ON h.PRO_COD = p.PRO_COD AND h.ITE_COD = 6 ');
                DMR.qRelFinanceiroDados.SQL.Add(' where ');

                if (DateEditInicial.Date > 0) and (DateEditFinal.Date > 0)
                then begin
                      Contador := Contador + 1;
                      DMR.qRelFinanceiroDados.SQL.Add(' pa.par_data >= :DT1 and pa.par_data <= :DT2 ');
                      DMR.qRelFinanceiroDados.Parameters.ParamByName('DT1').Value := DateEditInicial.Date;
                      DMR.qRelFinanceiroDados.Parameters.ParamByName('DT2').Value := DateEditFinal.Date;
                     end;


                if (ComboBoxTipoPagamento.ItemIndex >= 0)
                then begin
                      if Contador > 0
                      then begin
                            DMR.qRelFinanceiroDados.SQL.Add(' and pa.par_tppg = :p1 ');
                            DMR.qRelFinanceiroDados.Parameters.ParamByName('p1').Value := ComboBoxTipoPagamento.Text;
                           end else begin
                                     DMR.qRelFinanceiroDados.SQL.Add(' pa.par_tppg = :p1 ');
                                     DMR.qRelFinanceiroDados.Parameters.ParamByName('p1').Value := ComboBoxTipoPagamento.Text;
                                    end;
                     end;
                if (cb_Obs.Checked = True)
                then begin
                      if Contador > 0
                      then begin
                            DMR.qRelFinanceiroDados.SQL.Add(' and trim(pa.PAR_OBS) <> :p2 ');
                            DMR.qRelFinanceiroDados.Parameters.ParamByName('p2').Value := '';
                           end else begin
                                     DMR.qRelFinanceiroDados.SQL.Add(' trim(pa.PAR_OBS) <> :p2 ');
                                     DMR.qRelFinanceiroDados.Parameters.ParamByName('p2').Value := '';
                                    end;
                     end;

                DMR.qRelFinanceiroDados.Open;

                if DMR.qRelFinanceiroDados.RecordCount > 0
                then begin
                      Application.CreateForm(TfRelFinanceiro,fRelFinanceiro);
                      fRelFinanceiro.RLL_Titulo.Caption := 'Relatório dos Processos com informações financeiras. TIPO DO PAGAMENTO: ' + ComboBoxTipoPagamento.Text;
                      fRelFinanceiro.qrp_Dados.Preview(nil);;
                      fRelFinanceiro.Free;
                     end else begin
                               ShowMessage('Não foram encontrados dados para geração desse relatório.');
                              end;

               end;
     end;
if (rg_Tipo.ItemIndex = 2) // Dados dos Processos - Exporta
then begin
      if ((DateEditInicial.Date = 0) and (DateEditFinal.Date = 0)) and (ComboBoxTipoPagamento.ItemIndex = -1) then
      begin
        ShowMessage('Pelo menos um parâmetro tem que ser informado.');
      end else begin
                qRelFinanceiroDadosExportador.Close;
                qRelFinanceiroDadosExportador.SQL.Clear;
                qRelFinanceiroDadosExportador.SQL.Add(' SELECT P.PRO_COD,p.PRO_AUTO,p.PRO_DREC,v.VAR_DESC,c.COM_DESC CIDADE,U.UF_SIGLA ESTADO,	l.LCO_LABT, pa.PAR_OBS,ps.PES_NOME,s.SIT_NM, sum(pa.PAR_VLR) PAR_VLR ');
                qRelFinanceiroDadosExportador.SQL.Add(' from tb_processo p join tb_parcelas pa on p.pro_cod = pa.pro_cod  ');
                qRelFinanceiroDadosExportador.SQL.Add('                    join tb_lcoleta l on l.lco_cod = p.lco_cod  ');
                qRelFinanceiroDadosExportador.SQL.Add('         LEFT OUTER JOIN tb_comarca c ON c.COM_COD=p.COM_COD AND c.UF_SIGLA=p.UF_SIGLA  ');
                qRelFinanceiroDadosExportador.SQL.Add('         LEFT OUTER JOIN tb_varas v ON p.VAR_COD=v.VAR_COD AND v.COM_COD=p.COM_COD AND v.UF_SIGLA=p.UF_SIGLA  ');
                qRelFinanceiroDadosExportador.SQL.Add('         LEFT OUTER JOIN tb_uf u ON u.UF_SIGLA=p.UF_SIGLA  ');
                qRelFinanceiroDadosExportador.SQL.Add('         LEFT OUTER JOIN TB_PESSOAS ps ON p.PRO_COD = ps.PRO_COD ');
                qRelFinanceiroDadosExportador.SQL.Add('         LEFT OUTER JOIN tb_situacao s ON s.SIT_COD = ps.PES_SIT ');
                qRelFinanceiroDadosExportador.SQL.Add(' where ');

                if (DateEditInicial.Date > 0) and (DateEditFinal.Date > 0)
                then begin
                      Contador := Contador + 1;
                      qRelFinanceiroDadosExportador.SQL.Add(' p.PRO_DREC >= :DT1 and p.PRO_DREC <= :DT2 ');
                      qRelFinanceiroDadosExportador.Parameters.ParamByName('DT1').Value := DateEditInicial.Date;
                      qRelFinanceiroDadosExportador.Parameters.ParamByName('DT2').Value := DateEditFinal.Date;
                     end;


                if (ComboBoxTipoPagamento.ItemIndex >= 0)
                then begin
                      if Contador > 0
                      then begin
                            qRelFinanceiroDadosExportador.SQL.Add(' and pa.par_tppg = :p1 ');
                            qRelFinanceiroDadosExportador.Parameters.ParamByName('p1').Value := ComboBoxTipoPagamento.Text;
                           end else begin
                                     qRelFinanceiroDadosExportador.SQL.Add(' pa.par_tppg = :p1 ');
                                     qRelFinanceiroDadosExportador.Parameters.ParamByName('p1').Value := ComboBoxTipoPagamento.Text;
                                    end;
                     end;
                if (cb_Obs.Checked = True)
                then begin
                      if Contador > 0
                      then begin
                            qRelFinanceiroDadosExportador.SQL.Add(' and trim(pa.PAR_OBS) <> :p2 ');
                            qRelFinanceiroDadosExportador.Parameters.ParamByName('p2').Value := '';
                           end else begin
                                     qRelFinanceiroDadosExportador.SQL.Add(' trim(pa.PAR_OBS) <> :p2 ');
                                     qRelFinanceiroDadosExportador.Parameters.ParamByName('p2').Value := '';
                                    end;
                     end;

                qRelFinanceiroDadosExportador.SQL.Add(' group by P.PRO_COD,p.PRO_AUTO,p.PRO_DREC,v.VAR_DESC,c.COM_DESC,U.UF_SIGLA,	l.LCO_LABT, pa.PAR_OBS,ps.PES_NOME,s.SIT_NM  ');
                qRelFinanceiroDadosExportador.Open;

                if qRelFinanceiroDadosExportador.RecordCount > 0
                then begin
                      excel := CreateOleObject('Excel.Application');
                      if not Excel.Application.Visible then
                      Excel.WorkBooks.Open(DM.qParametrosPAM_DPADR.Value + 'Modelo_Exporta_Excel_DadosProcessos.xls');
                      NomePlanilha := edtDestino.Text + '\DadosProcessos_' + DiaA + MesA + AnoA + '.xls';
                      //NomePlanilha := 'C:\SCPG\Documentos_Gerados\DadosProcessos_' + DiaA + MesA + AnoA + '.xls';
                      NumeroSheets := 1;
                      Linha := 2;
                      qRelFinanceiroDadosExportador.First;
                      while not qRelFinanceiroDadosExportador.Eof do
                      begin

                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]   := qRelFinanceiroDadosExportadorPRO_COD.Value;
                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2]   := qRelFinanceiroDadosExportadorPRO_AUTO.Value;
                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,3]   := qRelFinanceiroDadosExportadorPRO_DREC.Value;
                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,4]   := qRelFinanceiroDadosExportadorVAR_DESC.Value;
                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,5]   := qRelFinanceiroDadosExportadorCIDADE.Value;
                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,6]   := qRelFinanceiroDadosExportadorESTADO.Value;
                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,7]   := qRelFinanceiroDadosExportadorLCO_LABT.Value;
                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,8]   := qRelFinanceiroDadosExportadorPES_NOME.Value;
                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,9]   := qRelFinanceiroDadosExportadorSIT_NM.Value;
                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,10]   := qRelFinanceiroDadosExportadorPAR_VLR.Value;
                       Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,11]  := qRelFinanceiroDadosExportadorPAR_OBS.Value;

                       Linha:=Linha+1;
                       qRelFinanceiroDadosExportador.Next;
                      end;
                     Excel.Application.Visible := true;
                     Excel.ActiveWorkBook.SaveAs(NomePlanilha);
                     Excel.quit;
                     Excel:=unassigned;
                     ShowMessage('Arquivo gerado na pasta U:\CPG\SCPG\Documentos_Gerados\');
                     end else begin
                               ShowMessage('Não foram encontrados dados para geração desse relatório.');
                              end;

               end;
     end;

end;

procedure TfEmissaoRelFinanceiro.FormShow(Sender: TObject);
begin
 ComboBoxTipoPagamento.SetFocus;
end;

end.

