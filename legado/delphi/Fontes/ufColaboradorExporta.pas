unit ufColaboradorExporta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, DB, ADODB, ComObj, Mask, JvExMask, JvToolEdit;

type
  TfColaboradorExporta = class(TForm)
    sbExportar: TSpeedButton;
    sbFechar: TSpeedButton;
    lbOrigem: TLabel;
    qExportaPonto: TADOQuery;
    Label2: TLabel;
    Label1: TLabel;
    qExportaPontoRGP_PIS: TStringField;
    qExportaPontoCLB_NOME: TStringField;
    ADOQuery1: TADOQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    DateField1: TDateField;
    TimeField1: TTimeField;
    DateField2: TDateField;
    StringField2: TStringField;
    qImprimeRegistro: TADOQuery;
    qImprimeRegistroRGP_SEQ: TIntegerField;
    qImprimeRegistroRGP_PIS: TStringField;
    qImprimeRegistroRGP_DTREG: TDateField;
    qImprimeRegistroRGP_HRREG: TTimeField;
    qImprimeRegistroRGP_DTIMP: TDateField;
    qImprimeRegistroDIADASEMANA: TStringField;
    qValidadeQuantReg: TADOQuery;
    qValidadeQuantRegRGP_PIS: TStringField;
    qValidadeQuantRegRGP_DTREG: TDateField;
    qValidadeQuantRegCOUNT: TIntegerField;
    DateEditInicial: TJvDateEdit;
    DateEditFinal: TJvDateEdit;
    edtDestino: TJvDirectoryEdit;
    procedure sbExportarClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fColaboradorExporta: TfColaboradorExporta;
  excel :variant;
  MesGerando, NomePlanilha, NumeroCaso, Data_Mapa, AnoA, MesA, DiaA, HoraNome : String;
  Linha, LinhaInt, NumeroSheets, i, NumeroCasoVerificacao, ControlaQuant : Integer;
  Ano, Mes, Dia : Word;

implementation

uses ufDM, Math;

{$R *.dfm}

procedure TfColaboradorExporta.sbExportarClick(Sender: TObject);
begin
DecodeDate (Date, Ano, Mes, Dia);
AnoA := IntToStr(Ano);
MesA := IntToStr(Mes);
DiaA := IntToStr(Dia);
HoraNome := StringReplace(TimeToStr(Time), ':', '', [rfReplaceAll]);


if (edtDestino.Text = '')
then begin
      ShowMessage('Informe o local de exportação do arquivo!');
     end else begin
                excel := CreateOleObject('Excel.Application');
                if not Excel.Application.Visible then
                Excel.WorkBooks.Open(DM.qParametrosPAM_DPADR.Value + 'Modelo_Exporta_Ponto.xls');
                NomePlanilha := edtDestino.Text + '\Ponto_DATA_' + DiaA + '_' + MesA + '_' + AnoA + '_' + HoraNome + '.xls';
                NumeroSheets := 1;
                Linha := 4;

                qExportaPonto.Close;
                qExportaPonto.Parameters.ParamByName('DataIni').Value := DateEditInicial.Date;
                qExportaPonto.Parameters.ParamByName('DataFim').Value := DateEditFinal.Date;
                qExportaPonto.Open;
                qExportaPonto.First;


                while not qExportaPonto.Eof do
                begin
                 Linha := 4;
                 //Validade Quantidade de Registros
                 qValidadeQuantReg.Close;
                 qValidadeQuantReg.Parameters.ParamByName('Pis').Value     := qExportaPontoRGP_PIS.Value;
                 qValidadeQuantReg.Parameters.ParamByName('DataIni').Value := DateEditInicial.Date;
                 qValidadeQuantReg.Parameters.ParamByName('DataFim').Value := DateEditFinal.Date;
                 qValidadeQuantReg.Open;
                 qValidadeQuantReg.First;

                 while not qValidadeQuantReg.Eof do
                 begin
                   if (qValidadeQuantRegCOUNT.Value = 4)
                   then begin
                         qImprimeRegistro.Close;
                         qImprimeRegistro.Parameters.ParamByName('Pis').Value   := qValidadeQuantRegRGP_PIS.Value;
                         qImprimeRegistro.Parameters.ParamByName('Data').Value  := qValidadeQuantRegRGP_DTREG.Value;
                         qImprimeRegistro.Open;
                         qImprimeRegistro.First;

                         Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[2,2]      := qExportaPontoRGP_PIS.Value + ' - ' + qExportaPontoCLB_NOME.Value;

                         while not qImprimeRegistro.Eof do
                         begin
                           Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]  := qImprimeRegistroRGP_DTREG.Value;
                           Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2]  := qImprimeRegistroDIADASEMANA.Value;
                           LinhaInt := 3;
                           qImprimeRegistro.First;
                           while not qImprimeRegistro.Eof do
                           begin
                            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,LinhaInt]  := TimeToStr(qImprimeRegistroRGP_HRREG.Value);
                            LinhaInt := LinhaInt + 1;
                            qImprimeRegistro.Next;
                           end;
                         end;
                         Linha := Linha + 1;
                         qValidadeQuantReg.Next;
                        end else begin
                                  qImprimeRegistro.Close;
                                  qImprimeRegistro.Parameters.ParamByName('Pis').Value   := qValidadeQuantRegRGP_PIS.Value;
                                  qImprimeRegistro.Parameters.ParamByName('Data').Value  := qValidadeQuantRegRGP_DTREG.Value;
                                  qImprimeRegistro.Open;
                                  qImprimeRegistro.First;

                                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[2,2]      := qExportaPontoRGP_PIS.Value + ' - ' + qExportaPontoCLB_NOME.Value;

                                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,1]  := qImprimeRegistroRGP_DTREG.Value;
                                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,2]  := qImprimeRegistroDIADASEMANA.Value;
                                  LinhaInt := 3;
                                  qImprimeRegistro.First;
                                  while not qImprimeRegistro.Eof do
                                  begin
                                   Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,LinhaInt]  := TimeToStr(qImprimeRegistroRGP_HRREG.Value);
                                   LinhaInt := LinhaInt + 1;
                                   qImprimeRegistro.Next;
                                  end;
                                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,10]            := 'MARCAÇÕES INVÁLIDAS';
                                  Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[Linha,10].Font.Color := $f50000;
                                  Linha := Linha + 1;
                                  qValidadeQuantReg.Next;
                                 end;
                 end;
                 NumeroSheets := NumeroSheets + 1;
                 qExportaPonto.Next;

               end;
               Excel.Application.Visible := true;
                Excel.ActiveWorkBook.SaveAs(NomePlanilha);
               Excel.quit;
               Excel:=unassigned;
             end;
ShowMessage('Exportação finalizada!');
end;


procedure TfColaboradorExporta.sbFecharClick(Sender: TObject);
begin
 Close;
end;

end.
