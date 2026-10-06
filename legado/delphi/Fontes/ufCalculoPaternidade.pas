unit ufCalculoPaternidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids, Comobj;

type
  TfCalculaPaternidade = class(TForm)
    EdtPai1: TEdit;
    Label1: TLabel;
    EdtPai2: TEdit;
    EdtCrianca1: TEdit;
    Label2: TLabel;
    EdtCrianca2: TEdit;
    EdtMae1: TEdit;
    Label3: TLabel;
    EdtMae2: TEdit;
    sbDescobreOrigemAlelos: TSpeedButton;
    EdtMarcadorPai: TEdit;
    Label4: TLabel;
    EdtMarcadorMae: TEdit;
    Label5: TLabel;
    sbBuscaFrequencia: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    EdtFreqPai: TEdit;
    EdtFreqMae: TEdit;
    ds_Resultados: TDataSource;
    Label8: TLabel;
    Label9: TLabel;
    EdtFreqCalcPai: TEdit;
    EdtFreqCalcPMae: TEdit;
    Label10: TLabel;
    EdtPI: TEdit;
    EdtProbalidade: TEdit;
    Label13: TLabel;
    EdtCaso: TEdit;
    DBGrid2: TDBGrid;
    Label11: TLabel;
    ds_AlelosConferencia: TDataSource;
    DBGrid1: TDBGrid;
    sbFechar: TSpeedButton;
    bProcessar: TSpeedButton;
    procedure sbDescobreOrigemAlelosClick(Sender: TObject);
    procedure sbBuscaFrequenciaClick(Sender: TObject);
    procedure bProcessarClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCalculaPaternidade: TfCalculaPaternidade;

implementation

uses ufDM, ufDMD;

{$R *.dfm}

procedure TfCalculaPaternidade.sbDescobreOrigemAlelosClick(Sender: TObject);
begin
// Mãe
if (EdtMae1.Text = EdtCrianca1.Text)
then begin
      EdtMarcadorMae.Text := EdtMae1.Text;
     end;
if (EdtMae2.Text = EdtCrianca1.Text)
then begin
      EdtMarcadorMae.Text := EdtMae2.Text;
     end;
if (EdtMae1.Text = EdtCrianca2.Text)
then begin
      EdtMarcadorMae.Text := EdtMae1.Text;
     end;
if (EdtMae2.Text = EdtCrianca2.Text)
then begin
      EdtMarcadorMae.Text := EdtMae2.Text;
     end;
// Pai
if (EdtPai1.Text = EdtCrianca1.Text)
then begin
      EdtMarcadorPai.Text := EdtPai1.Text;
     end;
if (EdtPai2.Text = EdtCrianca1.Text)
then begin
      EdtMarcadorPai.Text := EdtPai2.Text;
     end;
if (EdtPai1.Text = EdtCrianca2.Text)
then begin
      EdtMarcadorPai.Text := EdtPai1.Text;
     end;
if (EdtPai2.Text = EdtCrianca2.Text)
then begin
      EdtMarcadorPai.Text := EdtPai2.Text;
     end;
end;

procedure TfCalculaPaternidade.sbBuscaFrequenciaClick(Sender: TObject);
begin
{
   qBuscaFrequencia.Close;
   qBuscaFrequencia.Parameters.ParamByName('Marcador').Value := 'D3S1358';
   qBuscaFrequencia.Parameters.ParamByName('Alelo').Value    := EdtMarcadorPai.Text;
   qBuscaFrequencia.Open;
   if ( qBuscaFrequenciaFRE_FREQUENCIA_PERCENTUAL.Value > 5 )
   then begin
         EdtFreqPai.Text     := FloatTostr(qBuscaFrequenciaFRE_FREQUENCIA.Value);
         EdtFreqCalcPai.Text := FloatTostr(qBuscaFrequenciaFRE_FREQUENCIA_PERCENTUAL.Value);
       end else begin
                 EdtFreqPai.Text     := FloatTostr(qBuscaFrequenciaFRE_FREQUENCIA.Value);
                 EdtFreqCalcPai.Text := '5,00';
                end;

   qBuscaFrequencia.Close;
   qBuscaFrequencia.Parameters.ParamByName('Marcador').Value := 'D3S1358';
   qBuscaFrequencia.Parameters.ParamByName('Alelo').Value    := EdtMarcadorMae.Text;
   qBuscaFrequencia.Open;
   if ( qBuscaFrequenciaFRE_FREQUENCIA_PERCENTUAL.Value > 5 )
   then begin
         EdtFreqMae.Text      := FloatTostr(qBuscaFrequenciaFRE_FREQUENCIA.Value);
         EdtFreqCalcPMae.Text := FloatTostr(qBuscaFrequenciaFRE_FREQUENCIA_PERCENTUAL.Value);
       end else begin
                 EdtFreqMae.Text     := FloatTostr(qBuscaFrequenciaFRE_FREQUENCIA.Value);
                 EdtFreqCalcPMae.Text := '5,00';
                end;

   if ((EdtPai1.Text = EdtCrianca1.Text) or (EdtPai1.Text = EdtCrianca2.Text) or (EdtPai2.Text = EdtCrianca1.Text) or (EdtPai2.Text = EdtCrianca2.Text))
   then begin
         EdtPI.Text := FloatToStr(1/(2*StrToFloat(EdtFreqCalcPai.Text))*100);
        end else EdtPI.Text := FloatToStr(1/StrToFloat(EdtFreqCalcPai.Text)*100);

   EdtProbalidade.Text :=  FloatToStr(StrToFloat(EdtPI.Text)/(StrToFloat(EdtPI.Text)+1)*100);
   }

end;
procedure TfCalculaPaternidade.bProcessarClick(Sender: TObject);

var ALE1_MAE, ALE2_MAE, ALE1_CRI, ALE2_CRI, ALE1_SUPAI, ALE2_SUPAI, DOMINANTE_PAI, DOMINANTE_MAE,
    FREQUENCIA_PAI, FREQUENCIA_CALC_PAI, FREQUENCIA_MAE, FREQUENCIA_CALC_MAE, VALOR_PI, VALOR_PROBABILIDADE : Real;
    SQL1, SQL2 : String;

begin

if (EdtCaso.Text = '')
then begin
      ShowMessage('Informar o Número do Caso!');
     end else begin
                DMD.qExcluirCaso.Close;
                DMD.qExcluirCaso.Parameters.ParamByName('Codigo').Value := EdtCaso.Text;
                DMD.qExcluirCaso.ExecSQL;

                DMD.qConsultaCaso.Close;
                DMD.qConsultaCaso.Parameters.ParamByName('Codigo').Value := EdtCaso.Text;
                DMD.qConsultaCaso.Open;

                DMD.qConsultaAlelosConferencia.Close;
                DMD.qConsultaAlelosConferencia.Parameters.ParamByName('Codigo').Value := EdtCaso.Text;
                DMD.qConsultaAlelosConferencia.Open;


                DMD.qConsultaMarcadores.Close;
                DMD.qConsultaMarcadores.Parameters.ParamByName('Codigo').Value := EdtCaso.Text;
                DMD.qConsultaMarcadores.Open;


                DMD.qConsultaMarcadores.First;
                while not DMD.qConsultaMarcadores.Eof do
                begin
                   DMD.qConsultaLimites.Close;
                   DMD.qConsultaLimites.Parameters.ParamByName('Marcador').Value := DMD.qConsultaMarcadoresMAR_ALE.Value;
                   DMD.qConsultaLimites.Open;

                  if (DMD.qConsultaCasoCAS_CODIGO.Value = 'PD0101')
                  then begin
                        DMD.qConsultaAlelos.Close;
                        DMD.qConsultaAlelos.Parameters.ParamByName('Codigo').Value   := DMD.qConsultaCasoPRO_COD.Value;
                        DMD.qConsultaAlelos.Parameters.ParamByName('Pessoa').Value   := 'MA1';
                        DMD.qConsultaAlelos.Parameters.ParamByName('Marcador').Value := DMD.qConsultaMarcadoresMAR_ALE.Value;
                        DMD.qConsultaAlelos.Open;

                        ALE1_MAE := StrToFloat(StringReplace(DMD.qConsultaAlelosAL1_ALE.Value,'.',',',[]));
                        ALE2_MAE := StrToFloat(StringReplace(DMD.qConsultaAlelosAL2_ALE.Value,'.',',',[]));

                        if (ALE1_MAE < DMD.qConsultaLimitesVAL_MARCADOR_MIN.Value) then ALE1_MAE := DMD.qConsultaLimitesVAL_MARCADOR_MIN.Value;
                        if (ALE1_MAE > DMD.qConsultaLimitesVAL_MARCADOR_MAX.Value) then ALE1_MAE := DMD.qConsultaLimitesVAL_MARCADOR_MAX.Value;
                        if (ALE2_MAE < DMD.qConsultaLimitesVAL_MARCADOR_MIN.Value) then ALE2_MAE := DMD.qConsultaLimitesVAL_MARCADOR_MIN.Value;
                        if (ALE2_MAE > DMD.qConsultaLimitesVAL_MARCADOR_MAX.Value) then ALE2_MAE := DMD.qConsultaLimitesVAL_MARCADOR_MAX.Value;

                        DMD.qConsultaAlelos.Close;
                        DMD.qConsultaAlelos.Parameters.ParamByName('Codigo').Value   := DMD.qConsultaCasoPRO_COD.Value;
                        DMD.qConsultaAlelos.Parameters.ParamByName('Pessoa').Value   := 'CR1';
                        DMD.qConsultaAlelos.Parameters.ParamByName('Marcador').Value := DMD.qConsultaMarcadoresMAR_ALE.Value;
                        DMD.qConsultaAlelos.Open;

                        ALE1_CRI := StrToFloat(StringReplace(DMD.qConsultaAlelosAL1_ALE.Value,'.',',',[]));
                        ALE2_CRI := StrToFloat(StringReplace(DMD.qConsultaAlelosAL2_ALE.Value,'.',',',[]));

                        if (ALE1_CRI < DMD.qConsultaLimitesVAL_MARCADOR_MIN.Value) then ALE1_CRI := DMD.qConsultaLimitesVAL_MARCADOR_MIN.Value;
                        if (ALE1_CRI > DMD.qConsultaLimitesVAL_MARCADOR_MAX.Value) then ALE1_CRI := DMD.qConsultaLimitesVAL_MARCADOR_MAX.Value;
                        if (ALE2_CRI < DMD.qConsultaLimitesVAL_MARCADOR_MIN.Value) then ALE2_CRI := DMD.qConsultaLimitesVAL_MARCADOR_MIN.Value;
                        if (ALE2_CRI > DMD.qConsultaLimitesVAL_MARCADOR_MAX.Value) then ALE2_CRI := DMD.qConsultaLimitesVAL_MARCADOR_MAX.Value;


                        DMD.qConsultaAlelos.Close;
                        DMD.qConsultaAlelos.Parameters.ParamByName('Codigo').Value   := DMD.qConsultaCasoPRO_COD.Value;
                        DMD.qConsultaAlelos.Parameters.ParamByName('Pessoa').Value   := 'SP1';
                        DMD.qConsultaAlelos.Parameters.ParamByName('Marcador').Value := DMD.qConsultaMarcadoresMAR_ALE.Value;
                        DMD.qConsultaAlelos.Open;

                        ALE1_SUPAI := StrToFloat(StringReplace(DMD.qConsultaAlelosAL1_ALE.Value,'.',',',[]));
                        ALE2_SUPAI := StrToFloat(StringReplace(DMD.qConsultaAlelosAL2_ALE.Value,'.',',',[]));

                        if (ALE1_SUPAI < DMD.qConsultaLimitesVAL_MARCADOR_MIN.Value) then ALE1_SUPAI := DMD.qConsultaLimitesVAL_MARCADOR_MIN.Value;
                        if (ALE1_SUPAI > DMD.qConsultaLimitesVAL_MARCADOR_MAX.Value) then ALE1_SUPAI := DMD.qConsultaLimitesVAL_MARCADOR_MAX.Value;
                        if (ALE2_SUPAI < DMD.qConsultaLimitesVAL_MARCADOR_MIN.Value) then ALE2_SUPAI := DMD.qConsultaLimitesVAL_MARCADOR_MIN.Value;
                        if (ALE2_SUPAI > DMD.qConsultaLimitesVAL_MARCADOR_MAX.Value) then ALE2_SUPAI := DMD.qConsultaLimitesVAL_MARCADOR_MAX.Value;
                    end;

                  if (DMD.qConsultaCasoCAS_CODIGO.Value = 'PD0201')
                  then begin
                        DMD.qConsultaAlelos.Close;
                        DMD.qConsultaAlelos.Parameters.ParamByName('Codigo').Value   := DMD.qConsultaCasoPRO_COD.Value;
                        DMD.qConsultaAlelos.Parameters.ParamByName('Pessoa').Value   := 'CR1';
                        DMD.qConsultaAlelos.Parameters.ParamByName('Marcador').Value := DMD.qConsultaMarcadoresMAR_ALE.Value;
                        DMD.qConsultaAlelos.Open;

                        ALE1_CRI := StrToFloat(StringReplace(DMD.qConsultaAlelosAL1_ALE.Value,'.',',',[]));
                        ALE2_CRI := StrToFloat(StringReplace(DMD.qConsultaAlelosAL2_ALE.Value,'.',',',[]));


                        if (ALE1_CRI < DMD.qConsultaLimitesVAL_MARCADOR_MIN.Value) then ALE1_CRI := DMD.qConsultaLimitesVAL_MARCADOR_MIN.Value;
                        if (ALE1_CRI > DMD.qConsultaLimitesVAL_MARCADOR_MAX.Value) then ALE1_CRI := DMD.qConsultaLimitesVAL_MARCADOR_MAX.Value;
                        if (ALE2_CRI < DMD.qConsultaLimitesVAL_MARCADOR_MIN.Value) then ALE2_CRI := DMD.qConsultaLimitesVAL_MARCADOR_MIN.Value;
                        if (ALE2_CRI > DMD.qConsultaLimitesVAL_MARCADOR_MAX.Value) then ALE2_CRI := DMD.qConsultaLimitesVAL_MARCADOR_MAX.Value;


                        DMD.qConsultaAlelos.Close;
                        DMD.qConsultaAlelos.Parameters.ParamByName('Codigo').Value   := DMD.qConsultaCasoPRO_COD.Value;
                        DMD.qConsultaAlelos.Parameters.ParamByName('Pessoa').Value   := 'SP1';
                        DMD.qConsultaAlelos.Parameters.ParamByName('Marcador').Value := DMD.qConsultaMarcadoresMAR_ALE.Value;
                        DMD.qConsultaAlelos.Open;

                        ALE1_SUPAI := StrToFloat(StringReplace(DMD.qConsultaAlelosAL1_ALE.Value,'.',',',[]));
                        ALE2_SUPAI := StrToFloat(StringReplace(DMD.qConsultaAlelosAL2_ALE.Value,'.',',',[]));

                        if (ALE1_SUPAI < DMD.qConsultaLimitesVAL_MARCADOR_MIN.Value) then ALE1_SUPAI := DMD.qConsultaLimitesVAL_MARCADOR_MIN.Value;
                        if (ALE1_SUPAI > DMD.qConsultaLimitesVAL_MARCADOR_MAX.Value) then ALE1_SUPAI := DMD.qConsultaLimitesVAL_MARCADOR_MAX.Value;
                        if (ALE2_SUPAI < DMD.qConsultaLimitesVAL_MARCADOR_MIN.Value) then ALE2_SUPAI := DMD.qConsultaLimitesVAL_MARCADOR_MIN.Value;
                        if (ALE2_SUPAI > DMD.qConsultaLimitesVAL_MARCADOR_MAX.Value) then ALE2_SUPAI := DMD.qConsultaLimitesVAL_MARCADOR_MAX.Value;


                    end;

                    // Descobre Alelos Dominantes

                    // Mãe
                    if (ALE1_MAE = ALE1_CRI) then begin DOMINANTE_MAE := ALE1_MAE; end;
                    if (ALE2_MAE = ALE1_CRI) then begin DOMINANTE_MAE := ALE2_MAE;  end;
                    if (ALE1_MAE = ALE2_CRI) then begin DOMINANTE_MAE := ALE1_MAE; end;
                    if (ALE2_MAE = ALE2_CRI) then begin DOMINANTE_MAE := ALE2_MAE; end;
                    // Pai
                    if (ALE1_SUPAI = ALE1_CRI) then begin DOMINANTE_PAI := ALE1_SUPAI; end;
                    if (ALE2_SUPAI = ALE1_CRI) then begin DOMINANTE_PAI := ALE2_SUPAI; end;
                    if (ALE1_SUPAI = ALE2_CRI) then begin DOMINANTE_PAI := ALE1_SUPAI; end;
                    if (ALE2_SUPAI = ALE2_CRI) then begin DOMINANTE_PAI := ALE2_SUPAI; end;


                   // Cálculos

                   DMD.qBuscaFrequencia.Close;
                   DMD.qBuscaFrequencia.Parameters.ParamByName('Marcador').Value := DMD.qConsultaMarcadoresMAR_ALE.Value;
                   DMD.qBuscaFrequencia.Parameters.ParamByName('Alelo').Value    := DOMINANTE_PAI;
                   DMD.qBuscaFrequencia.Open;
                   if ( DMD.qBuscaFrequenciaFRE_FREQUENCIA_PERCENTUAL.Value > 5 )
                   then begin
                         FREQUENCIA_PAI      := DMD.qBuscaFrequenciaFRE_FREQUENCIA.Value;
                         FREQUENCIA_CALC_PAI := DMD.qBuscaFrequenciaFRE_FREQUENCIA_PERCENTUAL.Value;
                        end else begin
                                  FREQUENCIA_PAI      := DMD.qBuscaFrequenciaFRE_FREQUENCIA.Value;
                                  FREQUENCIA_CALC_PAI := 5;
                                 end;

                   DMD.qBuscaFrequencia.Close;
                   DMD.qBuscaFrequencia.Parameters.ParamByName('Marcador').Value := DMD.qConsultaMarcadoresMAR_ALE.Value;
                   DMD.qBuscaFrequencia.Parameters.ParamByName('Alelo').Value    := DOMINANTE_MAE;
                   DMD.qBuscaFrequencia.Open;
                   if ( DMD.qBuscaFrequenciaFRE_FREQUENCIA_PERCENTUAL.Value > 5 )
                   then begin
                         FREQUENCIA_MAE      := DMD.qBuscaFrequenciaFRE_FREQUENCIA.Value;
                         FREQUENCIA_CALC_MAE := DMD.qBuscaFrequenciaFRE_FREQUENCIA_PERCENTUAL.Value;
                        end else begin
                                  FREQUENCIA_MAE      := DMD.qBuscaFrequenciaFRE_FREQUENCIA.Value;
                                  FREQUENCIA_CALC_MAE := 5;
                                 end;

                   // Calcula PI / Probabilidade

                   if ((ALE1_SUPAI = ALE1_CRI) or (ALE1_SUPAI = ALE2_CRI) or (ALE2_SUPAI = ALE1_CRI) or (ALE2_SUPAI = ALE2_CRI))
                   then begin
                         VALOR_PI := 1/(2*FREQUENCIA_CALC_PAI)*100;
                        end else VALOR_PI := 1/(FREQUENCIA_CALC_PAI)*100;

                   VALOR_PROBABILIDADE :=  VALOR_PI/(VALOR_PI+1)*100;


                  // Grvar na Tabela os resultados


                    with DMD.qResultadosPaternidade do
                    begin
                      SQL1 := '';
                      SQL2 := '';
                      SQL1 := 'INSERT INTO TB_ALELOS_RESULTADOS (ARE_MARCADOR, ARE_AL1_MAE, ARE_AL2_MAE, ARE_AL1_CRI, ARE_AL2_CRI, ARE_AL1_SPA, ARE_AL2_SPA, ARE_FREQUENCIA, ARE_PI, ARE_PROBA, PRO_COD) VALUES';
                      SQL2 := SQL1 +  ' (:marcador, :al1_mae, :al2_mae, :al1_cri, :al2_cri, :al1_supai, :al2_supai, :frequencia, :pi, :probabilidade, :codigo)';
                      Close;
                      SQL.Clear;
                      SQL.Add(SQL2);
                      Parameters.ParamByName('marcador').Value      := DMD.qConsultaMarcadoresMAR_ALE.Value;
                      Parameters.ParamByName('al1_mae').Value       := ALE1_MAE;
                      Parameters.ParamByName('al2_mae').Value       := ALE2_MAE;
                      Parameters.ParamByName('al1_cri').Value       := ALE1_CRI;
                      Parameters.ParamByName('al2_cri').Value       := ALE2_CRI;
                      Parameters.ParamByName('al1_supai').Value     := ALE1_SUPAI;
                      Parameters.ParamByName('al2_supai').Value     := ALE2_SUPAI;
                      Parameters.ParamByName('frequencia').Value    := FREQUENCIA_CALC_PAI;
                      Parameters.ParamByName('pi').Value            := VALOR_PI;
                      Parameters.ParamByName('probabilidade').Value := VALOR_PROBABILIDADE;
                      Parameters.ParamByName('codigo').Value        := DMD.qConsultaCasoPRO_COD.Value;
                      ExecSQL;
                    end;

                 DMD.qConsultaMarcadores.Next;
                end;

                DMD.qConsultaResultados.Close;
                DMD.qConsultaResultados.Parameters.ParamByName('Codigo').Value := EdtCaso.Text;
                DMD.qConsultaResultados.Open;
             end;

end;

procedure TfCalculaPaternidade.sbFecharClick(Sender: TObject);
begin
Close;
end;

end.
