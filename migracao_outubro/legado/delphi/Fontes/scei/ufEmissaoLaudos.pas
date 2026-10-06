
unit ufEmissaoLaudos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls, Sockets, DB, ADODB,
  RLReport, Grids, DBGrids, RLFilters, RLPDFFilter, RLRichText, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient;

type
  TfEmissaoLaudo = class(TForm)
    sbEmitir: TSpeedButton;
    SpeedButton4: TSpeedButton;
    PrinterSetupDialog1: TPrinterSetupDialog;
    RadioGroup1: TRadioGroup;
    gbResultado: TGroupBox;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    RLReport_New: TRLReport;
    RLBand4: TRLBand;
    RLLabel50: TRLLabel;
    RLLabel65: TRLLabel;
    RLLabel66: TRLLabel;
    RLDBText30: TRLDBText;
    RLDBText36: TRLDBText;
    RLDBText37: TRLDBText;
    RLDBText38: TRLDBText;
    RLDBText44: TRLDBText;
    RLDataHoje: TRLLabel;
    RLLabel69: TRLLabel;
    RLLabel70: TRLLabel;
    RLLabel71: TRLLabel;
    RLLabel72: TRLLabel;
    RLLabel73: TRLLabel;
    RLLabel74: TRLLabel;
    RLLabel75: TRLLabel;
    RLDBText47: TRLDBText;
    RLDBMemo3: TRLDBMemo;
    RLLabel76: TRLLabel;
    RLLabel77: TRLLabel;
    RLLabel78: TRLLabel;
    RLBand10: TRLBand;
    RLImage5: TRLImage;
    qRelLaudo: TADOQuery;
    dsRelLaudo: TDataSource;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLL_Sensibilidade: TRLLabel;
    DBGrid_Resultados: TDBGrid;
    RLPDFFilter1: TRLPDFFilter;
    RLDBMemo1: TRLDBMemo;
    RLImage6: TRLImage;
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
    RLL_Resultado: TRLMemo;
    TcpClient: TIdTCPClient;
    procedure SpeedButton4Click(Sender: TObject);
    procedure sbEmitirClick(Sender: TObject);
    Function MesExtenso( Mes:Word ) : string;
    Function DataExtenso (dData : TDateTime) : string;
    Function extenso (valor: real): string;
    procedure FormShow(Sender: TObject);
private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEmissaoLaudo: TfEmissaoLaudo;

implementation

uses ufDMI, ufImprimeLaudo, ufImprimeLaudoImpressora;

{$R *.dfm}

procedure TfEmissaoLaudo.SpeedButton4Click(Sender: TObject);
begin
 Close;
end;

procedure TfEmissaoLaudo.sbEmitirClick(Sender: TObject);
var DataHoje, AnoA, MesA, DiaA, NomeLaudoPDF, Desc_Sensibilidade, Resultado : String;
    Linha : Integer;
    Ano, Mes, Dia : Word;
begin
  inherited;
  DecodeDate (Date, Ano, Mes, Dia);
  AnoA := IntToStr(Ano);
  MesA := MesExtenso(Mes);
  DiaA := IntToStr(Dia);
  if DiaA = IntToStr(1)
  then begin
  DiaA := 'Primeiro';
  end;
  DataHoje := DiaA +' de '+ MesA +' de '+ AnoA + '.';


  qRelLaudo.Close;
  qRelLaudo.Parameters.ParamByName('CODIGO').Value := DMI.qProcedimentosPRO_COD.Value;
  qRelLaudo.Open;
  if (qRelLaudo.RecordCount <=0)
  then begin
        ShowMessage('Problema na Emissão do Laudo!!!');
       end else begin
                  if not ((DMI.qProcedimentosEXA_COD.Value = 'HBVq') or (DMI.qProcedimentosEXA_COD.Value = 'HCVq') or (DMI.qProcedimentosEXA_COD.Value = 'HIVq'))
                  then begin

                         //Mais de um resultado
                         Resultado := qRelLaudoPRO_RESUL.Value;
                         if (qRelLaudo.RecordCount > 1)
                         then begin

                                Resultado := '';
                                Linha     := 0;
                                qRelLaudo.First;
                                while not qRelLaudo.Eof do
                                begin
                                 if (Linha = 0)
                                 then begin
                                       Resultado := qRelLaudoPRO_RESUL.Value;
                                      end else Resultado := Resultado + ', ' + qRelLaudoPRO_RESUL.Value;
                                 Linha := Linha + 1;
                                 qRelLaudo.Next;
                                end;

                              end;
                         //Mais de um resultado

                         RLLabel76.Visible         := False;
                         RLLabel77.Visible         := False;
                         RLLabel78.Visible         := False;
                         RLDBText1.Visible         := False;
                         RLDBText2.Visible         := False;
                         RLDBText3.Visible         := False;
                         RLL_Sensibilidade.Visible := False;

                         RLDataHoje.Caption    := DataHoje;
                         RLL_Resultado.Lines.Add(Resultado);
                         if (UpperCase(GetEnvironmentVariable('COMPUTERNAME')) = 'MCPESEDE00212') or (UpperCase(GetEnvironmentVariable('COMPUTERNAME')) = 'NOTE-RAPHAEL')
                         then begin
                                NomeLaudoPDF := 'C:\SCPG\Documentos_Gerados\' + IntToStr(qRelLaudoPRO_COD.Value) + '_' + qRelLaudoPES_NOME.Value + '.pdf';
                              end else NomeLaudoPDF := 'U:\CPG\SCPG\Documentos_Gerados\LaudosInf\' + IntToStr(qRelLaudoPRO_COD.Value) + '_' + qRelLaudoPES_NOME.Value + '.pdf';
                        RLReport_New.SaveToFile(NomeLaudoPDF) ;
                        //RLReport_New.Preview(nil);
                       end else begin

                                 //Mais de um resultado
                                 Resultado := qRelLaudoPRO_RESUL.Value;
                                 if (qRelLaudo.RecordCount > 1)
                                 then begin

                                        Resultado := '';
                                        Linha     := 0;
                                        qRelLaudo.First;
                                        while not qRelLaudo.Eof do
                                        begin
                                         if (Linha = 0)
                                         then begin
                                               Resultado := qRelLaudoPRO_RESUL.Value;
                                              end else Resultado := Resultado + ', ' + qRelLaudoPRO_RESUL.Value;
                                         Linha := Linha + 1;
                                         qRelLaudo.Next;
                                        end;

                                      end;
                                 //Mais de um resultado

                                 RLLabel76.Visible  := True;
                                 RLLabel77.Visible  := True;
                                 RLLabel78.Visible  := True;
                                 RLDBText1.Visible  := True;
                                 RLDBText2.Visible  := True;
                                 RLDBText3.Visible  := True;

                                 RLDataHoje.Caption        := DataHoje;
                                 RLL_Resultado.Lines.Add(Resultado);
                                 Desc_Sensibilidade        := 'Sensibilidade mínima de ' + IntToStr(qRelLaudoEXA_UNM.Value) + ' Unidade Internacionais por mililitro (' + IntToStr(qRelLaudoEXA_UNM.Value) + ' UI/ml).';
                                 RLL_Sensibilidade.Caption := Desc_Sensibilidade;
                                 if (UpperCase(GetEnvironmentVariable('COMPUTERNAME')) = 'MCPESEDE00212') or (UpperCase(GetEnvironmentVariable('COMPUTERNAME')) = 'NOTE-RAPHAEL')
                                 then begin
                                        NomeLaudoPDF := 'C:\SCPG\Documentos_Gerados\' + IntToStr(qRelLaudoPRO_COD.Value) + '_' + qRelLaudoPES_NOME.Value + '.pdf';
                                      end else NomeLaudoPDF := 'U:\CPG\SCPG\Documentos_Gerados\LaudosInf\' + IntToStr(qRelLaudoPRO_COD.Value) + '_' + qRelLaudoPES_NOME.Value + '.pdf';
                                 RLReport_New.SaveToFile(NomeLaudoPDF) ;
                                 //RLReport_New.Preview(nil);
                              end;
               end;               


      DMI.qStatusProcedimentos.Close;
      DMI.qStatusProcedimentos.Open;
      DMI.qStatusProcedimentos.Append;
      DMI.qStatusProcedimentosPRO_COD.Value    := DMI.qProcedimentosPRO_COD.Value;
      DMI.qStatusProcedimentosSTP_DATA.Value   := Date;
      DMI.qStatusProcedimentosSTP_STATUS.Value := 4;
      DMI.qStatusProcedimentosSTP_DESC.Value   := 'Laudo já foi impresso';
      DMI.qStatusProcedimentos.Post;

      Close;
end;


function TfEmissaoLaudo.MesExtenso( Mes:Word ) : string; const meses : array[0..11] of PChar = ('Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro','Outubro', 'Novembro', 'Dezembro');
begin
result := meses[mes-1];
End;

Function TfEmissaoLaudo.DataExtenso (dData : TDateTime) : string;
var
Ano, Mes, Dia : word;
Dias, Meses : String;


begin
DecodeDate(dData, Ano, Mes, Dia);
Meses := IntToStr(Mes);
Dias  := IntToStr(Dia);

if Dia = 1 then
 begin
  Dias := 'Primeiro';
 end;

DataExtenso := Dias + ' de ' {+ MesExtenso(Meses) }+ ' de ' + IntToStr(Ano);
end;

function TfEmissaoLaudo.extenso (valor: real): string;
var
Centavos, Centena, Milhar, Milhao, Texto, msg: string;
const
Unidades: array[1..9] of string = ('Um', 'Dois', 'Três', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove');
Dez: array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
Dezenas: array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta', 'Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa');
Centenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');
function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: String): String;
begin
if Expressao
then Result:=CasoVerdadeiro
else Result:=CasoFalso;
end;

function MiniExtenso (trio: string): string;
var
Unidade, Dezena, Centena: string;
begin
Unidade:='';
Dezena:='';
Centena:='';
if (trio[2]='1') and (trio[3]<>'0') then
  begin
  Unidade:=Dez[strtoint(trio[3])];
  Dezena:='';
end
else
 begin
  if trio[2]<>'0' then Dezena:=Dezenas[strtoint(trio[2])];
  if trio[3]<>'0' then Unidade:=Unidades[strtoint(trio[3])];
 end;
if (trio[1]='1') and (Unidade='') and (Dezena='')
 then Centena:='cem'
else
 if trio[1]<>'0'
  then Centena:=Centenas[strtoint(trio[1])]
  else Centena:='';
 Result:= Centena + ifs((Centena<>'') and ((Dezena<>'') or (Unidade<>'')), ' e ', '')
  + Dezena + ifs((Dezena<>'') and (Unidade<>''),' e ', '') + Unidade;
end;
begin
if (valor>999999.99) or (valor<0) then
 begin
  msg:='O valor está fora do intervalo permitido.';
  msg:=msg+'O número deve ser maior ou igual a zero e menor que 999.999,99.';
  msg:=msg+' Se não for corrigido o número não será escrito por extenso.';
  showmessage(msg);
  Result:='';
  exit;
 end;
if valor=0 then
 begin
  Result:='';
  Exit;
 end;
Texto:=formatfloat('000000.00',valor);
Milhar:=MiniExtenso(Copy(Texto,1,3));
Centena:=MiniExtenso(Copy(Texto,4,3));
Centavos:=MiniExtenso('0'+Copy(Texto,8,2));
Result:=Milhar;
if Milhar<>'' then
  if copy(texto,4,3)='000' then
  Result:=Result+' Mil Reais'
  else
  Result:=Result+' Mil, ';
if (((copy(texto,4,2)='00') and (Milhar<>'')
  and (copy(texto,6,1)<>'0')) or (centavos=''))
  and (Centena<>'') then Result:=Result+'';
if (Milhar+Centena <>'') then Result:=Result+Centena;
if (Milhar='') and (copy(texto,4,3)='001') then
  Result:=Result+' Real'
 else
  if (copy(texto,4,3)<>'000') then Result:=Result+'';
if Centavos='' then
 begin
  Result:=Result+'';
  Exit;
 end
else
 begin
  if Milhar+Centena='' then
  Result:=Centavos
  else
  Result:=Result+', e '+Centavos;
if (copy(texto,8,2)='01') and (Centavos<>'') then
  Result:=Result+' Centavo.'
 else
  Result:=Result+' Centavos.';
end;
end;

procedure TfEmissaoLaudo.FormShow(Sender: TObject);
begin
DMI.qRelLaudo.Close;
DMI.qRelLaudo.Parameters.ParamByName('CODIGO').Value := DMI.qProcedimentosPRO_COD.Value;
DMI.qRelLaudo.Open;

end;

end.

{
                 if RadioGroup1.ItemIndex = 1
                 then begin
                       if (DMI.qRelLaudoEXA_COD.Value = 'HBVd') or (DMI.qRelLaudoEXA_COD.Value = 'HCVd') or (DMI.qRelLaudoEXA_COD.Value = 'HIVd') or  (DMI.qRelLaudoEXA_COD.Value = 'HIVcm')
                       then begin
                             Application.CreateForm(TfImprimeLaudoImpressora,fImprimeLaudoImpressora);
                             if DMI.qRelLaudoPRO_RESUL.Value = 'DETECTADO'
                             then begin
                                   fImprimeLaudoImpressora.RLDBText19.Visible := True;
                                   fImprimeLaudoImpressora.RLLabel27.Visible  := True;

                                   fImprimeLaudoImpressora.RLLabel43.Visible  := False;
                                   fImprimeLaudoImpressora.RLLabel53.Visible  := False;
                                   fImprimeLaudoImpressora.RLLabel55.Visible  := False;
                                   fImprimeLaudoImpressora.RLDBText23.Visible := False;

                                  end else begin
                                            fImprimeLaudoImpressora.RLDBText19.Visible := False;
                                            fImprimeLaudoImpressora.RLLabel27.Visible  := False;

                                            fImprimeLaudoImpressora.RLLabel43.Visible  := True;
                                            fImprimeLaudoImpressora.RLLabel53.Visible  := True;
                                            fImprimeLaudoImpressora.RLLabel55.Visible  := True;
                                            fImprimeLaudoImpressora.RLDBText23.Visible := True;
                                           end;
                             fImprimeLaudoImpressora.RLDataHoje_Primeiro.Caption := DataHoje;
                             fImprimeLaudoImpressora.RLReport_Primeiro.Preview(nil);
                             fImprimeLaudoImpressora.Free;
                            end;

                      if (DMI.qRelLaudoEXA_COD.Value = 'HBVq') or (DMI.qRelLaudoEXA_COD.Value = 'HIVq')
                      then begin
                             Application.CreateForm(TfImprimeLaudoImpressora,fImprimeLaudoImpressora);
                             if DMI.qRelLaudoPRO_RESUL.Value = 'DETECTADO'
                             then begin
                                   fImprimeLaudoImpressora.RLDBText6.Visible := False;
                                   fImprimeLaudoImpressora.RLDBText8.Visible := False;
                                   fImprimeLaudoImpressora.RLLabel10.Visible := False;

                                   fImprimeLaudoImpressora.RLLabel36.Visible  := True;
                                   fImprimeLaudoImpressora.RLLabel37.Visible  := True;
                                   fImprimeLaudoImpressora.RLDBText25.Visible := True;
                                   fImprimeLaudoImpressora.RLDBText26.Visible := True;
                                  end else begin
                                            fImprimeLaudoImpressora.RLDBText6.Visible := True;

                                            fImprimeLaudoImpressora.RLDBText8.Visible  := False;
                                            fImprimeLaudoImpressora.RLLabel10.Visible  := False;
                                            fImprimeLaudoImpressora.RLLabel36.Visible  := False;
                                            fImprimeLaudoImpressora.RLLabel37.Visible  := False;
                                            fImprimeLaudoImpressora.RLDBText25.Visible := False;
                                            fImprimeLaudoImpressora.RLDBText26.Visible := False;
                                           end;
                             fImprimeLaudoImpressora.RLDataHoje_Segundo.Caption := DataHoje;
                             fImprimeLaudoImpressora.RLReport_Segundo.Preview(nil);
                             fImprimeLaudoImpressora.Free;
                           end;

                      if (DMI.qRelLaudoEXA_COD.Value = 'HCVq')
                      then begin
                             Application.CreateForm(TfImprimeLaudoImpressora,fImprimeLaudoImpressora);
                             if DMI.qRelLaudoPRO_RESUL.Value = 'DETECTADO'
                             then begin
                                   fImprimeLaudoImpressora.RLDBText33.Visible := False;
                                   fImprimeLaudoImpressora.RLDBText31.Visible := False;
                                   fImprimeLaudoImpressora.RLLabel47.Visible  := False;

                                   fImprimeLaudoImpressora.RLLabel56.Visible   := True;
                                   fImprimeLaudoImpressora.RLLabel57.Visible   := True;
                                   fImprimeLaudoImpressora.RLDBText39.Visible  := True;
                                   fImprimeLaudoImpressora.RLDBText40.Visible  := True;
                                  end else begin
                                            fImprimeLaudoImpressora.RLDBText31.Visible := True;

                                            fImprimeLaudoImpressora.RLDBText33.Visible  := False;
                                            fImprimeLaudoImpressora.RLLabel47.Visible   := False;
                                            fImprimeLaudoImpressora.RLLabel56.Visible   := False;
                                            fImprimeLaudoImpressora.RLLabel57.Visible   := False;
                                            fImprimeLaudoImpressora.RLDBText39.Visible  := False;
                                            fImprimeLaudoImpressora.RLDBText40.Visible  := False;
                                           end;
                             fImprimeLaudoImpressora.RLDataHoje_Terceiro.Caption := DataHoje;
                             fImprimeLaudoImpressora.RLReport_Terceiro.Preview(nil);
                             fImprimeLaudoImpressora.Free;
                           end;

                      if (DMI.qRelLaudoEXA_COD.Value = 'HCVg')
                      then begin
                             Application.CreateForm(TfImprimeLaudoImpressora,fImprimeLaudoImpressora);
                             fImprimeLaudoImpressora.RLDataHoje_Quarto.Caption := DataHoje;
                             fImprimeLaudoImpressora.RLReport_Quarto.Preview(nil);
                             fImprimeLaudoImpressora.Free;
                           end;
                    end; //Fim Impressora

                 if RadioGroup1.ItemIndex = 0
                 then begin
                       if (DMI.qRelLaudoEXA_COD.Value = 'HBVd') or (DMI.qRelLaudoEXA_COD.Value = 'HCVd') or (DMI.qRelLaudoEXA_COD.Value = 'HIVd') or  (DMI.qRelLaudoEXA_COD.Value = 'HIVcm')
                       then begin
                             Application.CreateForm(TfImprimeLaudo,fImprimeLaudo);
                             if DMI.qRelLaudoPRO_RESUL.Value = 'DETECTADO'
                             then begin
                                   fImprimeLaudo.RLDBText19.Visible := True;
                                   fImprimeLaudo.RLLabel27.Visible  := True;

                                   fImprimeLaudo.RLLabel43.Visible  := False;
                                   fImprimeLaudo.RLLabel53.Visible  := False;
                                   fImprimeLaudo.RLLabel55.Visible  := False;
                                   fImprimeLaudo.RLDBText23.Visible := False;

                                  end else begin
                                            fImprimeLaudo.RLDBText19.Visible := False;
                                            fImprimeLaudo.RLLabel27.Visible  := False;
                                            
                                            fImprimeLaudo.RLLabel43.Visible  := True;
                                            fImprimeLaudo.RLLabel53.Visible  := True;
                                            fImprimeLaudo.RLLabel55.Visible  := True;
                                            fImprimeLaudo.RLDBText23.Visible := True;
                                           end;
                             fImprimeLaudo.RLDataHoje_Primeiro.Caption := DataHoje;
                            if (UpperCase(TcpClient.LocalHostName) = 'MCPESEDE00212') or (UpperCase(TcpClient.LocalHostName) = 'NOTE-RAPHAEL')
                            then begin
                                   NomeLaudoPDF := 'C:\SCPG\Documentos_Gerados\' + IntToStr(DMI.qRelLaudoPRO_COD.Value) + '_' + DMI.qRelLaudoPES_NOME.Value + '.pdf';
                                 end else NomeLaudoPDF := 'U:\CPG\SCPG\Documentos_Gerados\LaudosInf\' + IntToStr(DMI.qRelLaudoPRO_COD.Value) + '_' + DMI.qRelLaudoPES_NOME.Value + '.pdf';

                             fImprimeLaudo.RLReport_Primeiro.SaveToFile(NomeLaudoPDF) ;
                             fImprimeLaudo.Free;
                            end;

                      if (DMI.qRelLaudoEXA_COD.Value = 'HBVq') or (DMI.qRelLaudoEXA_COD.Value = 'HIVq')
                      then begin
                             Application.CreateForm(TfImprimeLaudo,fImprimeLaudo);
                             {if DMI.qRelLaudoPRO_RESUL.Value = 'DETECTADO'
                             then begin
                                   fImprimeLaudo.RLDBText6.Visible := False;
                                   fImprimeLaudo.RLDBText8.Visible := False;
                                   fImprimeLaudo.RLLabel10.Visible := False;

                                   fImprimeLaudo.RLLabel36.Visible  := True;
                                   fImprimeLaudo.RLLabel37.Visible  := True;
                                   fImprimeLaudo.RLDBText25.Visible := True;
                                   fImprimeLaudo.RLDBText26.Visible := True;
                                  end else begin
                                            fImprimeLaudo.RLDBText6.Visible := True;

                                            fImprimeLaudo.RLDBText8.Visible  := False;
                                            fImprimeLaudo.RLLabel10.Visible  := False;
                                            fImprimeLaudo.RLLabel36.Visible  := False;
                                            fImprimeLaudo.RLLabel37.Visible  := False;
                                            fImprimeLaudo.RLDBText25.Visible := False;
                                            fImprimeLaudo.RLDBText26.Visible := False;
                                           end;
                             fImprimeLaudo.RLDataHoje_Segundo.Caption := DataHoje;
                             if (UpperCase(TcpClient.LocalHostName) = 'MCPESEDE00212') or (UpperCase(TcpClient.LocalHostName) = 'NOTE-RAPHAEL')
                             then begin
                                    NomeLaudoPDF := 'C:\SCPG\Documentos_Gerados\' + IntToStr(DMI.qRelLaudoPRO_COD.Value) + '_' + DMI.qRelLaudoPES_NOME.Value + '.pdf';
                                  end else NomeLaudoPDF := 'U:\CPG\SCPG\Documentos_Gerados\LaudosInf\' + IntToStr(DMI.qRelLaudoPRO_COD.Value) + '_' + DMI.qRelLaudoPES_NOME.Value + '.pdf';
                             fImprimeLaudo.RLReport_Segundo.SaveToFile(NomeLaudoPDF) ;
                             fImprimeLaudo.Free;
                           end;

                      if ((DMI.qRelLaudoEXA_COD.Value = 'HCVq'))
                      then begin
                             Application.CreateForm(TfImprimeLaudo,fImprimeLaudo);
                            { if DMI.qRelLaudoPRO_RESUL.Value = 'DETECTADO'
                             then begin
                                   fImprimeLaudo.RLDBText33.Visible := False;
                                   fImprimeLaudo.RLDBText31.Visible := False;
                                   fImprimeLaudo.RLLabel47.Visible  := False;

                                   fImprimeLaudo.RLLabel56.Visible   := True;
                                   fImprimeLaudo.RLLabel57.Visible   := True;
                                   fImprimeLaudo.RLDBText39.Visible  := True;
                                   fImprimeLaudo.RLDBText40.Visible  := True;
                                  end else begin
                                            fImprimeLaudo.RLDBText31.Visible := True;

                                            fImprimeLaudo.RLDBText33.Visible  := False;
                                            fImprimeLaudo.RLLabel47.Visible   := False;
                                            fImprimeLaudo.RLLabel56.Visible   := False;
                                            fImprimeLaudo.RLLabel57.Visible   := False;
                                            fImprimeLaudo.RLDBText39.Visible  := False;
                                            fImprimeLaudo.RLDBText40.Visible  := False;
                                           end; 
                             fImprimeLaudo.RLDataHoje_Terceiro.Caption := DataHoje;
                             if (UpperCase(TcpClient.LocalHostName) = 'MCPESEDE00212') or (UpperCase(TcpClient.LocalHostName) = 'NOTE-RAPHAEL')
                             then begin
                                    NomeLaudoPDF := 'C:\SCPG\Documentos_Gerados\' + IntToStr(DMI.qRelLaudoPRO_COD.Value) + '_' + DMI.qRelLaudoPES_NOME.Value + '.pdf';
                                  end else NomeLaudoPDF := 'U:\CPG\SCPG\Documentos_Gerados\LaudosInf\' + IntToStr(DMI.qRelLaudoPRO_COD.Value) + '_' + DMI.qRelLaudoPES_NOME.Value + '.pdf';
                             fImprimeLaudo.RLReport_Terceiro.SaveToFile(NomeLaudoPDF) ;
                             fImprimeLaudo.Free;
                           end;


                      if ((DMI.qRelLaudoEXA_COD.Value = 'ZIKAd'))
                      then begin
                             Application.CreateForm(TfImprimeLaudo,fImprimeLaudo);
                             fImprimeLaudo.RLLabel13.Visible   := False;
                             fImprimeLaudo.RLLabel14.Visible   := False;
                             fImprimeLaudo.RLLabel15.Visible   := False;
                             fImprimeLaudo.RLDBText9.Visible  := False;
                             fImprimeLaudo.RLDBText10.Visible  := False;
                             
                             fImprimeLaudo.RLDataHoje_Terceiro.Caption := DataHoje;
                             if (UpperCase(TcpClient.LocalHostName) = 'MCPESEDE00212') or (UpperCase(TcpClient.LocalHostName) = 'NOTE-RAPHAEL')
                             then begin
                                    NomeLaudoPDF := 'C:\SCPG\Documentos_Gerados\' + IntToStr(DMI.qRelLaudoPRO_COD.Value) + '_' + DMI.qRelLaudoPES_NOME.Value + '.pdf';
                                  end else NomeLaudoPDF := 'U:\CPG\SCPG\Documentos_Gerados\LaudosInf\' + IntToStr(DMI.qRelLaudoPRO_COD.Value) + '_' + DMI.qRelLaudoPES_NOME.Value + '.pdf';
                             fImprimeLaudo.RLReport_Terceiro.SaveToFile(NomeLaudoPDF) ;
                             fImprimeLaudo.Free;
                           end;


                      if (DMI.qRelLaudoEXA_COD.Value = 'HCVg')
                      then begin
                             Application.CreateForm(TfImprimeLaudo,fImprimeLaudo);
                             fImprimeLaudo.RLDataHoje_Quarto.Caption := DataHoje;
                             if (UpperCase(TcpClient.LocalHostName) = 'MCPESEDE00212') or (UpperCase(TcpClient.LocalHostName) = 'NOTE-RAPHAEL')
                             then begin
                                    NomeLaudoPDF := 'C:\SCPG\Documentos_Gerados\' + IntToStr(DMI.qRelLaudoPRO_COD.Value) + '_' + DMI.qRelLaudoPES_NOME.Value + '.pdf';
                                  end else NomeLaudoPDF := 'U:\CPG\SCPG\Documentos_Gerados\LaudosInf\' + IntToStr(DMI.qRelLaudoPRO_COD.Value) + '_' + DMI.qRelLaudoPES_NOME.Value + '.pdf';
                             fImprimeLaudo.RLReport_Quarto.SaveToFile(NomeLaudoPDF) ;
                             fImprimeLaudo.Free;
                           end;
                            if (UpperCase(TcpClient.LocalHostName) = 'MCPESEDE00212') or (UpperCase(TcpClient.LocalHostName) = 'NOTE-RAPHAEL')
                      then begin
                            ShowMessage('Arquivo gerado com Sucesso, verificar na Pasta C:\SCPG\Documentos_Gerados\');
                           end else ShowMessage('Arquivo gerado com Sucesso, verificar na Pasta U:\CPG\SCPG\Documentos_Gerados\LaudosInf\');
                    end;

           end;
      DMI.qStatusProcedimentos.Close;
      DMI.qStatusProcedimentos.Open;
      DMI.qStatusProcedimentos.Append;
      DMI.qStatusProcedimentosPRO_COD.Value    := DMI.qProcedimentosPRO_COD.Value;
      DMI.qStatusProcedimentosSTP_DATA.Value   := Date;
      DMI.qStatusProcedimentosSTP_STATUS.Value := 4;
      DMI.qStatusProcedimentosSTP_DESC.Value   := 'Laudo já foi impresso';
      DMI.qStatusProcedimentos.Post;

      Close;

}
