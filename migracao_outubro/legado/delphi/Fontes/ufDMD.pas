unit ufDMD;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMD = class(TDataModule)
    qFrequencias: TADOQuery;
    qFrequenciasFRE_MARCADOR: TStringField;
    qFrequenciasFRE_ALELO: TBCDField;
    qFrequenciasFRE_FREQUENCIA: TBCDField;
    qResultadosPaternidade: TADOQuery;
    qResultadosPaternidadeARE_MARCADOR: TStringField;
    qResultadosPaternidadeARE_AL1_MAE: TBCDField;
    qResultadosPaternidadeARE_AL2_MAE: TBCDField;
    qResultadosPaternidadeARE_AL1_CRI: TBCDField;
    qResultadosPaternidadeARE_AL2_CRI: TBCDField;
    qResultadosPaternidadeARE_AL1_SPA: TBCDField;
    qResultadosPaternidadeARE_AL2_SPA: TBCDField;
    qResultadosPaternidadeARE_FREQUENCIA: TBCDField;
    qResultadosPaternidadeARE_PI: TBCDField;
    qResultadosPaternidadeARE_PROBA: TBCDField;
    qResultadosPaternidadePRO_COD: TIntegerField;
    qConsultaAlelos: TADOQuery;
    qConsultaAlelosCOD_ALE: TIntegerField;
    qConsultaAlelosNM1_ALE: TStringField;
    qConsultaAlelosNM2_ALE: TStringField;
    qConsultaAlelosNM3_ALE: TStringField;
    qConsultaAlelosNM4_ALE: TStringField;
    qConsultaAlelosMAR_ALE: TStringField;
    qConsultaAlelosAL1_ALE: TStringField;
    qConsultaAlelosAL2_ALE: TStringField;
    qConsultaAlelosORD_ALE: TIntegerField;
    qConsultaCaso: TADOQuery;
    qConsultaCasoPRO_COD: TIntegerField;
    qConsultaCasoPRO_ANO: TIntegerField;
    qConsultaCasoPRO_NPERC: TStringField;
    qConsultaCasoPRO_TIPO: TIntegerField;
    qConsultaCasoPRO_AUTO: TStringField;
    qConsultaCasoUF_SIGLA: TStringField;
    qConsultaCasoCAS_CODIGO: TStringField;
    qConsultaCasoCOM_COD: TIntegerField;
    qConsultaCasoVAR_COD: TIntegerField;
    qConsultaCasoLCO_COD: TIntegerField;
    qConsultaCasoPRO_HCOLE: TStringField;
    qConsultaCasoPRO_DCOLE: TDateField;
    qConsultaCasoPRO_HREC: TStringField;
    qConsultaCasoPRO_DREC: TDateField;
    qConsultaCasoPRO_DRESU: TDateField;
    qConsultaCasoPRO_SIT: TIntegerField;
    qConsultaCasoPRO_NCOMP: TIntegerField;
    qConsultaCasoPRO_RESUL: TIntegerField;
    qConsultaCasoPRO_PROB: TStringField;
    qConsultaCasoPRO_ARETI: TStringField;
    qConsultaCasoJUI_COD: TIntegerField;
    qConsultaCasoFG_PROP: TStringField;
    qConsultaCasoPRO_USUCAD: TStringField;
    qConsultaCasoPRO_NUMLAUDO: TStringField;
    qConsultaCasoPRO_RASTREAR: TStringField;
    qConsultaCasoPRO_CARREGACREDITO: TStringField;
    qConsultaCasoPRO_CREDITODNA: TStringField;
    qConsultaCasoPRO_HTREC: TStringField;
    qConsultaCasoPRO_LACRE: TStringField;
    qConsultaMarcadores: TADOQuery;
    qConsultaMarcadoresMAR_ALE: TStringField;
    qBuscaFrequencia: TADOQuery;
    qBuscaFrequenciaFRE_FREQUENCIA: TBCDField;
    qBuscaFrequenciaFRE_FREQUENCIA_PERCENTUAL: TBCDField;
    qConsultaLimites: TADOQuery;
    qConsultaResultados: TADOQuery;
    qConsultaResultadosARE_MARCADOR: TStringField;
    qConsultaResultadosARE_AL1_MAE: TBCDField;
    qConsultaResultadosARE_AL2_MAE: TBCDField;
    qConsultaResultadosARE_AL1_CRI: TBCDField;
    qConsultaResultadosARE_AL2_CRI: TBCDField;
    qConsultaResultadosARE_AL1_SPA: TBCDField;
    qConsultaResultadosARE_AL2_SPA: TBCDField;
    qConsultaResultadosARE_FREQUENCIA: TBCDField;
    qConsultaResultadosARE_PI: TBCDField;
    qConsultaResultadosARE_PROBA: TBCDField;
    qConsultaResultadosPRO_COD: TIntegerField;
    qConsultaAlelosConferencia: TADOQuery;
    qConsultaAlelosConferenciaCOD_ALE: TIntegerField;
    qConsultaAlelosConferenciaNM1_ALE: TStringField;
    qConsultaAlelosConferenciaNM2_ALE: TStringField;
    qConsultaAlelosConferenciaNM3_ALE: TStringField;
    qConsultaAlelosConferenciaNM4_ALE: TStringField;
    qConsultaAlelosConferenciaMAR_ALE: TStringField;
    qConsultaAlelosConferenciaAL1_ALE: TStringField;
    qConsultaAlelosConferenciaAL2_ALE: TStringField;
    qConsultaAlelosConferenciaORD_ALE: TIntegerField;
    qExcluirCaso: TADOQuery;
    qConsultaLimitesVAL_MARCADOR_MIN: TBCDField;
    qConsultaLimitesVAL_MARCADOR_MAX: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMD: TDMD;

implementation

uses ufDM;

{$R *.dfm}

end.
