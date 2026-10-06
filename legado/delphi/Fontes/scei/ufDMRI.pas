unit ufDMRI;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMRI = class(TDataModule)
    ds_qRelExamesPaternidadeFatura: TDataSource;
    qRelExamesPaternidadeFatura: TADOQuery;
    DS_RelExamesPaternidadeGeral: TDataSource;
    qRelExamesPaternidadeGeral: TADOQuery;
    qRelExamesPaternidadeGeralSUM: TADOQuery;
    qRelExamesFatura: TADOQuery;
    qRelExamesFaturaPRO_COD: TIntegerField;
    qRelExamesFaturaPRO_DCAD: TDateField;
    qRelExamesFaturaPES_COD: TIntegerField;
    qRelExamesFaturaLAB_COD: TIntegerField;
    qRelExamesFaturaMED_CRM: TStringField;
    qRelExamesFaturaEXA_COD: TStringField;
    qRelExamesFaturaPRO_DCOL: TDateField;
    qRelExamesFaturaPRO_DENT: TDateField;
    qRelExamesFaturaPRO_GENO: TStringField;
    qRelExamesFaturaPRO_VLOG: TBCDField;
    qRelExamesFaturaPRO_RESUL: TStringField;
    qRelExamesFaturaPRO_OBS: TStringField;
    qRelExamesFaturaPRO_UINT: TBCDField;
    qRelExamesFaturaPRO_CMLI: TBCDField;
    qRelExamesFaturaPES_COD_1: TIntegerField;
    qRelExamesFaturaPES_NOME: TStringField;
    qRelExamesFaturaPES_ESCV: TStringField;
    qRelExamesFaturaPES_IDA: TIntegerField;
    qRelExamesFaturaPES_SEXO: TStringField;
    qRelExamesFaturaPES_DNAS: TDateField;
    qRelExamesFaturaPES_END: TStringField;
    qRelExamesFaturaPES_CIES: TStringField;
    qRelExamesFaturaPES_FRES: TStringField;
    qRelExamesFaturaPES_FCEL: TStringField;
    qRelExamesFaturaEXA_COD_1: TStringField;
    qRelExamesFaturaEXA_DESC: TStringField;
    qRelExamesFaturaEXA_UNM: TIntegerField;
    qRelExamesFaturaEXA_SIN: TStringField;
    qRelExamesFaturaEXA_MET: TStringField;
    qRelExamesFaturaEXA_VRE: TStringField;
    qRelExamesFaturaEXA_VLAB: TBCDField;
    qRelExamesFaturaEXA_VPAC: TBCDField;
    qRelExamesFaturaEXA_RECM: TStringField;
    qRelExamesFaturaEXA_MATE: TStringField;
    qRelExamesFaturaMED_CRM_1: TStringField;
    qRelExamesFaturaMED_NOME: TStringField;
    qRelExamesFaturaMED_CID: TStringField;
    qRelExamesFaturaLAB_COD_1: TIntegerField;
    qRelExamesFaturaLAB_NOME: TStringField;
    qRelExamesFaturaLAB_SEXO: TStringField;
    qRelExamesFaturaLAB_CRM: TStringField;
    qRelExamesFaturaLAB_LABT: TStringField;
    qRelExamesFaturaLAB_FONE: TStringField;
    qRelExamesFaturaLAB_END: TStringField;
    qRelExamesFaturaLAB_CID: TStringField;
    qRelExamesFaturaUF_SIGLA: TStringField;
    qRelExamesFaturaPRO_PROT: TStringField;
    qRelExamesFaturaLAB_INTEXT: TStringField;
    qRelExamesFaturaPRO_APA: TStringField;
    DSRelExamesFatura: TDataSource;
    qRelExamesFaturaSUM: TADOQuery;
    qRelExamesFaturaLAB_FGVLR: TStringField;
    qRelFinanceiroMesAno: TADOQuery;
    qRelFinanceiroMesAnoLAB_LABT: TStringField;
    qRelFinanceiroMesAnoCOM_DESC: TStringField;
    qRelFinanceiroMesAnoVAR_DESC: TStringField;
    qRelFinanceiroMesAnoQUANTIDADE_ATENDIMENTOS: TIntegerField;
    qRelFinanceiroMesAnoSOMA_VALOR: TBCDField;
    qRelFinanceiroMesAnoProcedimentos: TADOQuery;
    qRelFinanceiroMesAnoProcedimentosLAB_LABT: TStringField;
    qRelFinanceiroMesAnoProcedimentosQUANTIDADE_ATENDIMENTOS: TIntegerField;
    qRelFinanceiroMesAnoProcedimentosSOMA_VALOR: TBCDField;
    qRelExamesFaturaPRO_COD_1: TIntegerField;
    qRelExamesFaturaPAR_NPARC: TIntegerField;
    qRelExamesFaturaPAR_VLR: TBCDField;
    qRelExamesFaturaPAR_DATA: TDateField;
    qRelExamesFaturaPAR_SIT: TIntegerField;
    qRelExamesFaturaPAR_TPPG: TStringField;
    qRelExamesFaturaCONTROLE: TIntegerField;
    qRelExamesFaturaPAR_OBS: TStringField;
    qRelExamesFaturaPAR_DATAPREVISTA: TDateField;
    qRelExamesFaturaPAR_ONDE: TStringField;
    qRelExamesFaturaPRO_DREC: TDateField;
    qRelExamesFaturaLAB_FGBOLETO: TStringField;
    qRelExamesFaturaCOM_COD: TIntegerField;
    qRelExamesPaternidadeFaturaSUM: TADOQuery;
    qRelExamesFaturaSUMVALORTOTAL: TBCDField;
    qRelExamesPaternidadeGeralSUMVALOR: TBCDField;
    qRelExamesPaternidadeGeralPRO_DCOLE: TDateField;
    qRelExamesPaternidadeGeralPRO_NPERC: TStringField;
    qRelExamesPaternidadeGeralCAS_DESC: TStringField;
    qRelExamesPaternidadeGeralPRO_RESUL: TIntegerField;
    qRelExamesPaternidadeGeralPRO_DRESU: TDateField;
    qRelExamesPaternidadeGeralLAB_NOME: TStringField;
    qRelExamesPaternidadeGeralVALOR: TBCDField;
    qRelCasosMesAno: TADOQuery;
    qRelCasosMesAnoLAB_LABT: TStringField;
    qRelCasosMesAnoCOM_DESC: TStringField;
    qRelCasosMesAnoVAR_DESC: TStringField;
    qRelCasosMesAnoQUANTIDADE_ATENDIMENTOS: TIntegerField;
    qRelCasosMesAnoSOMA_VALOR: TBCDField;
    qRelExamesPaternidadeFaturaPRO_DCOLE: TDateField;
    qRelExamesPaternidadeFaturaPRO_NPERC: TStringField;
    qRelExamesPaternidadeFaturaCAS_DESC: TStringField;
    qRelExamesPaternidadeFaturaLAB_LABT: TStringField;
    qRelExamesPaternidadeFaturaCAS_VLRIM: TBCDField;
    qRelExamesPaternidadeFaturaSUMVALOR: TBCDField;
    qRelInfecciosas: TADOQuery;
    qRelInfecciosasPRO_COD: TIntegerField;
    qRelInfecciosasPRO_DCAD: TDateField;
    qRelInfecciosasPES_NOME: TStringField;
    qRelInfecciosasEXA_COD: TStringField;
    qRelInfecciosasPRO_VALOR: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRI: TDMRI;

implementation

uses ufDM;

{$R *.dfm}

end.
