unit ufProcesso;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, DBCtrls, StdCtrls, Buttons, WordXP,
  ExtCtrls, Mask, ComCtrls, Menus, ImgList, ADODB,Sockets, OleServer, ComObj, jpeg,
  System.ImageList, JvBaseEdits, JvExControls, JvDBLookup, Vcl.Imaging.GIFImg, JvExMask,
  JvToolEdit, JvDBControls, JvExStdCtrls, JvCombobox, JvDBCombobox,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  Vcl.Imaging.pngimage, Word2000, ActiveX, ShlObj, JvMaskEdit;

type
  PLastInputInfo=^TLastInputInfo;
(*******************************************************************************
  typedef struct tagLASTINPUTINFO {
    UINT  cbSize;
    DWORD dwTime;
  } LASTINPUTINFO, *PLASTINPUTINFO;
*******************************************************************************)
  {$EXTERNALSYM tagLASTINPUTINFO}
  tagLASTINPUTINFO=record
    cbSize: Integer;   // The size of the structure, in bytes. This member must be set to sizeof(LASTINPUTINFO)
    dwTime: Cardinal;  // The tick count when the last input event was received.
  end;
  TLastInputInfo = tagLASTINPUTINFO;

(*******************************************************************************
  BOOL WINAPI GetLastInputInfo(
    __out  PLASTINPUTINFO plii
  );
*******************************************************************************)

  {$EXTERNALSYM GetLastInputInfo}
  function GetLastInputInfo(var ALastInputInfo: TLastInputInfo): Integer; stdcall;

  

type
  TfProcessos = class(TForm)
    PBotoes: TPanel;
    pc: TPageControl;
    tbCampos: TTabSheet;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    DBEdit11: TDBEdit;
    RxDBComboBox3: TJvDBComboBox;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit15: TDBEdit;
    DBDateEdit1: TJvDBDateEdit;
    DBDateEdit2: TJvDBDateEdit;
    RxDBComboBox1: TJvDBComboBox;
    GroupBox5: TGroupBox;
    Label13: TLabel;
    Label21: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit7: TDBEdit;
    GroupBox2: TGroupBox;
    tbHistorico: TTabSheet;
    GroupBox6: TGroupBox;
    gbGrid: TGroupBox;
    ImageList1: TImageList;
    StatusBar1: TStatusBar;
    MainMenu: TMainMenu;
    Cadastros1: TMenuItem;
    Comarca1: TMenuItem;
    Varas1: TMenuItem;
    LocaisdeColeta1: TMenuItem;
    N2: TMenuItem;
    ItensdoHistrico1: TMenuItem;
    N3: TMenuItem;
    ipodeCasoPreo1: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    N1: TMenuItem;
    Parmetros1: TMenuItem;
    qSelecionaSiglaVara: TADOQuery;
    qSelComarca: TADOQuery;
    qSelEstado: TADOQuery;
    DS_SelEstado: TDataSource;
    DS_SelComarca: TDataSource;
    qSelVaras: TADOQuery;
    DS_SelVaras: TDataSource;
    qSelColeta: TADOQuery;
    qSelCaso: TADOQuery;
    DS_SelColeta: TDataSource;
    DS_SelCaso: TDataSource;
    DBText1: TDBText;
    dsp: TDataSource;
    qProcessoCPG: TADOQuery;
    DBDateEdit3: TJvDBDateEdit;
    DBGrid1: TDBGrid;
    N4: TMenuItem;
    Regras1: TMenuItem;
    qGeraDocumentoWord: TADOQuery;
    tbHonorarios: TTabSheet;
    GroupBox8: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    GroupBox9: TGroupBox;
    DBGridPag: TDBGrid;
    Panel1: TPanel;
    bbtNovo: TBitBtn;
    bbtExcluir: TBitBtn;
    bbtSalvar: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    bbtCancelar: TBitBtn;
    ds_Parcelamento: TDataSource;
    N5: TMenuItem;
    PagamentoColetadores1: TMenuItem;
    Timer1: TTimer;
    qVencidosSemPessoa: TADOQuery;
    qManutencaoParcelamento: TADOQuery;
    BitBtn1: TBitBtn;
    Label39: TLabel;
    DBEdit16: TDBEdit;
    Label1: TLabel;
    Label40: TLabel;
    DBEdit32: TDBEdit;
    BCancelar: TSpeedButton;
    BSair: TSpeedButton;
    BSalvar: TSpeedButton;
    BExcluir: TSpeedButton;
    BEditar: TSpeedButton;
    BNovo: TSpeedButton;
    bbtAbrir: TSpeedButton;
    bbtConsultar: TSpeedButton;
    bbtWord: TSpeedButton;
    bbtPagamento: TSpeedButton;
    sbLaudosPendendes: TSpeedButton;
    bbtPrimeiro: TSpeedButton;
    bbtAnterior: TSpeedButton;
    bbtProximo: TSpeedButton;
    bbtUltimo: TSpeedButton;
    N6: TMenuItem;
    LaudosVencendoHoje1: TMenuItem;
    qProcessoCPGPRO_COD: TIntegerField;
    qProcessoCPGPRO_ANO: TIntegerField;
    qProcessoCPGPRO_TIPO: TIntegerField;
    qProcessoCPGPRO_AUTO: TStringField;
    qProcessoCPGUF_SIGLA: TStringField;
    qProcessoCPGCOM_COD: TIntegerField;
    qProcessoCPGVAR_COD: TIntegerField;
    qProcessoCPGLCO_COD: TIntegerField;
    qProcessoCPGPRO_HCOLE: TStringField;
    qProcessoCPGPRO_DCOLE: TDateField;
    qProcessoCPGPRO_HREC: TStringField;
    qProcessoCPGPRO_DREC: TDateField;
    qProcessoCPGPRO_DRESU: TDateField;
    qProcessoCPGPRO_SIT: TIntegerField;
    qProcessoCPGPRO_NCOMP: TIntegerField;
    qProcessoCPGPRO_RESUL: TIntegerField;
    qProcessoCPGPRO_PROB: TStringField;
    qProcessoCPGPRO_ARETI: TStringField;
    qSelEstadoUF_SIGLA: TStringField;
    qSelEstadoUF_DESC: TStringField;
    qSelComarcaUF_SIGLA: TStringField;
    qSelComarcaCOM_COD: TIntegerField;
    qSelComarcaCOM_DESC: TStringField;
    qSelComarcaCOM_SIGLA: TStringField;
    qSelVarasUF_SIGLA: TStringField;
    qSelVarasCOM_COD: TIntegerField;
    qSelVarasVAR_COD: TIntegerField;
    qSelVarasVAR_DESC: TStringField;
    qSelVarasVAR_SIGLA: TStringField;
    qSelVarasJUI_COD: TIntegerField;
    qSelColetaLCO_COD: TIntegerField;
    qSelColetaLCO_NOME: TStringField;
    qSelColetaLCO_SEXO: TIntegerField;
    qSelColetaLCO_CRM: TStringField;
    qSelColetaLCO_LABT: TStringField;
    qSelColetaLCO_FONE: TStringField;
    qSelColetaLCO_END: TStringField;
    qSelColetaLCO_CID: TStringField;
    qSelColetaUF_SIGLA: TStringField;
    qSelColetaLCO_TLIE: TIntegerField;
    qSelColetaLCO_CATE: TIntegerField;
    qSelColetaLCO_TRAT: TIntegerField;
    qSelCasoCAS_CONTR: TIntegerField;
    qSelCasoCAS_CODIGO: TStringField;
    qSelCasoCAS_DESC: TStringField;
    qSelCasoCAS_VLR: TBCDField;
    qSelCasoCAS_NOME0: TStringField;
    qSelCasoCAS_NOME1: TStringField;
    qSelCasoCAS_NOME2: TStringField;
    qSelCasoCAS_NOME3: TStringField;
    qSelCasoCAS_NOME4: TStringField;
    qSelCasoCAS_SIG1: TStringField;
    qSelCasoCAS_SIG2: TStringField;
    qSelCasoCAS_SIG3: TStringField;
    qSelCasoCAS_SIG4: TStringField;
    RxCalcEditValor: TJvCalcEdit;
    ComboBoxParcelas: TComboBox;
    Label38: TLabel;
    GroupBox11: TGroupBox;
    DBGrid3: TDBGrid;
    Label23: TLabel;
    DBEdit5: TDBEdit;
    Label24: TLabel;
    DBEdit6: TDBEdit;
    RxDBLookupCombo1: TJvDBLookupCombo;
    Label25: TLabel;
    DBEdit14: TDBEdit;
    GroupBox7: TGroupBox;
    DBText2: TDBText;
    DBLookupComboBox1: TDBLookupComboBox;
    Label29: TLabel;
    DBEdit17: TDBEdit;
    qProcessoCPGCAS_CODIGO: TStringField;
    qProcessoCPGJUI_COD: TIntegerField;
    Label31: TLabel;
    DBEdit18: TDBEdit;
    TabSheet1: TTabSheet;
    Label32: TLabel;
    Label33: TLabel;
    DBEdit20: TDBEdit;
    Label34: TLabel;
    DBEdit22: TDBEdit;
    DBGrid4: TDBGrid;
    DBComboBox1: TDBComboBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    qGeraDocumentoWordPRO_COD: TIntegerField;
    qGeraDocumentoWordPRO_ANO: TIntegerField;
    qGeraDocumentoWordPRO_NPERC: TStringField;
    qGeraDocumentoWordPRO_TIPO: TIntegerField;
    qGeraDocumentoWordPRO_AUTO: TStringField;
    qGeraDocumentoWordUF_SIGLA: TStringField;
    qGeraDocumentoWordCAS_CODIGO: TStringField;
    qGeraDocumentoWordCOM_COD: TIntegerField;
    qGeraDocumentoWordVAR_COD: TIntegerField;
    qGeraDocumentoWordLCO_COD: TIntegerField;
    qGeraDocumentoWordPRO_HCOLE: TStringField;
    qGeraDocumentoWordPRO_DCOLE: TDateField;
    qGeraDocumentoWordPRO_HREC: TStringField;
    qGeraDocumentoWordPRO_DREC: TDateField;
    qGeraDocumentoWordPRO_DRESU: TDateField;
    qGeraDocumentoWordPRO_SIT: TIntegerField;
    qGeraDocumentoWordPRO_NCOMP: TIntegerField;
    qGeraDocumentoWordPRO_RESUL: TIntegerField;
    qGeraDocumentoWordPRO_PROB: TStringField;
    qGeraDocumentoWordPRO_ARETI: TStringField;
    qGeraDocumentoWordJUI_COD: TIntegerField;
    RxDBComboBoxResultado: TJvDBComboBox;
    qSelJuiz: TADOQuery;
    DS_SelJuiz: TDataSource;
    RxDBLookupComboComarca: TDBLookupComboBox;
    RxDBLookupComboVara: TDBLookupComboBox;
    RxDBLookupCombo3: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    RxDBLookupComboTipoCaso: TDBLookupComboBox;
    Controle1: TMenuItem;
    Kits1: TMenuItem;
    EmissodeKits1: TMenuItem;
    N7: TMenuItem;
    BaixadeKits1: TMenuItem;
    Image4: TImage;
    qGeraCapa: TADOQuery;
    qGeraCapaCAS_CODIGO: TStringField;
    qGeraCapaPRO_DCOLE: TDateField;
    qGeraCapaCOM_DESC: TStringField;
    qGeraCapaVAR_DESC: TStringField;
    qGeraCapaUF_SIGLA: TStringField;
    qGeraCapaLCO_NOME: TStringField;
    qGeraCapaLCO_CATE: TIntegerField;
    qGeraCapaPRO_DREC: TDateField;
    qGeraCapaPRO_HREC: TStringField;
    Label20: TLabel;
    ComboBoxTipoPagamento: TComboBox;
    Label35: TLabel;
    RxCalcEdit1: TJvCalcEdit;
    qParcelasCapa: TADOQuery;
    qParcelasCapaPAR_VLR: TBCDField;
    qParcelasCapaPAR_TPPG: TStringField;
    qBuscaDadosPessoasCapa: TADOQuery;
    qBuscaDadosPessoasCapaPRO_COD: TIntegerField;
    qBuscaDadosPessoasCapaPES_COD: TIntegerField;
    qBuscaDadosPessoasCapaPES_NOME: TStringField;
    qBuscaDadosPessoasCapaPES_SIT: TIntegerField;
    qBuscaDadosPessoasCapaPES_DTNAS: TDateField;
    qBuscaDadosPessoasCapaPES_LCNAS: TStringField;
    qBuscaDadosPessoasCapaPES_SEXO: TStringField;
    qBuscaDadosPessoasCapaPES_TDOC: TStringField;
    qBuscaDadosPessoasCapaPES_NDOC: TStringField;
    Label41: TLabel;
    EdtObservacao: TEdit;
    qParcelasCapaPAR_OBS: TStringField;
    RxDBLookupCombo2: TDBLookupComboBox;
    qSelecionaSiglaVaraCOM_SIGLA: TStringField;
    Label6: TLabel;
    bbtPessoas: TBitBtn;
    DBGrid2: TDBGrid;
    Label7: TLabel;
    qVencidosSemPessoaPRO_COD: TIntegerField;
    qVencidosSemPessoaPRO_ANO: TIntegerField;
    qVencidosSemPessoaPRO_NPERC: TStringField;
    qVencidosSemPessoaPRO_TIPO: TIntegerField;
    qVencidosSemPessoaPRO_AUTO: TStringField;
    qVencidosSemPessoaUF_SIGLA: TStringField;
    qVencidosSemPessoaCAS_CODIGO: TStringField;
    qVencidosSemPessoaCOM_COD: TIntegerField;
    qVencidosSemPessoaVAR_COD: TIntegerField;
    qVencidosSemPessoaLCO_COD: TIntegerField;
    qVencidosSemPessoaPRO_HCOLE: TStringField;
    qVencidosSemPessoaPRO_DCOLE: TDateField;
    qVencidosSemPessoaPRO_HREC: TStringField;
    qVencidosSemPessoaPRO_DREC: TDateField;
    qVencidosSemPessoaPRO_DRESU: TDateField;
    qVencidosSemPessoaPRO_SIT: TIntegerField;
    qVencidosSemPessoaPRO_NCOMP: TIntegerField;
    qVencidosSemPessoaPRO_RESUL: TIntegerField;
    qVencidosSemPessoaPRO_PROB: TStringField;
    qVencidosSemPessoaPRO_ARETI: TStringField;
    qVencidosSemPessoaJUI_COD: TIntegerField;
    bbtJuiz: TBitBtn;
    qSelecionaSiglaComarca: TADOQuery;
    qSelecionaSiglaComarcaCOM_SIGLA: TStringField;
    Pesquisa1: TMenuItem;
    N8: TMenuItem;
    QuantidadedeExames1: TMenuItem;
    qSelecionaSiglaVaraVAR_SIGLA: TStringField;
    qDeclaracaoComparecimento: TADOQuery;
    DS_DeclaracaoComparecimento: TDataSource;
    qDeclaracaoComparecimentoPES_NOME: TStringField;
    qDeclaracaoComparecimentoSIT_NM: TStringField;
    qDeclaracaoComparecimentoPRO_DCOLE: TDateField;
    qDeclaracaoComparecimentoPRO_HCOLE: TStringField;
    Image5: TImage;
    sbResultadoExcel: TSpeedButton;
    qCodigoProcesso: TADOQuery;
    qCodigoProcessoCODIGO: TIntegerField;
    qManutencaoCodigo: TADOQuery;
    RxDBComboBox2: TJvDBComboBox;
    qProcessoCPGPRO_NPERC: TStringField;
    Label26: TLabel;
    Label27: TLabel;
    Laboratrio1: TMenuItem;
    MapadeExtraoAplificao1: TMenuItem;
    qControlaAuditoria: TADOQuery;
    qProcessoCPGFG_PROP: TStringField;
    CB_Proposta: TDBCheckBox;
    N12: TMenuItem;
    LaudosEmitidosporPerodo1: TMenuItem;
    N13: TMenuItem;
    ConsultadeLotes1: TMenuItem;
    Mapas1: TMenuItem;
    N14: TMenuItem;
    GeraodasPlanilhas1: TMenuItem;
    N15: TMenuItem;
    Juzes1: TMenuItem;
    N16: TMenuItem;
    ConsultaTestesAlelos1: TMenuItem;
    bbtAlelosDuplicados: TBitBtn;
    qProcessoCPGPRO_USUCAD: TStringField;
    DBText3: TDBText;
    Label30: TLabel;
    Label42: TLabel;
    N17: TMenuItem;
    Auditoria1: TMenuItem;
    qProcessoCPGPRO_NUMLAUDO: TStringField;
    Label43: TLabel;
    DBEdit4: TDBEdit;
    qUsuarioCapa: TADOQuery;
    qUsuarioCapaHOS_USUA: TStringField;
    qParcelasCapaPAR_DATA: TDateField;
    qGeraCapaPRO_NPERC: TStringField;
    qProcessoCPGPRO_RASTREAR: TStringField;
    Label44: TLabel;
    DBEdit10: TDBEdit;
    bbtCorreios: TBitBtn;
    N18: TMenuItem;
    RastreamentodeKits1: TMenuItem;
    qProcessoCPGPRO_CARREGACREDITO: TStringField;
    N19: TMenuItem;
    CrditosJuiz1: TMenuItem;
    Vinculao1: TMenuItem;
    N20: TMenuItem;
    Relatrio1: TMenuItem;
    Label45: TLabel;
    DBEdit19: TDBEdit;
    N21: TMenuItem;
    HabilitarJuzesparaCrditos1: TMenuItem;
    GeraodasPlanilhas2: TMenuItem;
    N22: TMenuItem;
    GeraPlanilhas1: TMenuItem;
    Image6: TImage;
    N24: TMenuItem;
    Exportaes1: TMenuItem;
    qManutencaoParcelamento2: TADOQuery;
    qManutencaoParcelamento2QUANTIDADE: TLargeintField;
    N25: TMenuItem;
    Compradekits1: TMenuItem;
    Image7: TImage;
    sbEnderecos: TSpeedButton;
    qGeraCapaPRO_AUTO: TStringField;
    N26: TMenuItem;
    ColetadoresSemEnvio1: TMenuItem;
    qProcessoCPGPRO_CREDITODNA: TStringField;
    Label46: TLabel;
    DBEdit21: TDBEdit;
    qVerificaExisteAlelo: TADOQuery;
    qVerificaExisteAleloCONTADOR: TIntegerField;
    qGeraCapaPRO_CREDITODNA: TStringField;
    Label47: TLabel;
    DBEdit23: TDBEdit;
    Label48: TLabel;
    sbHTermino: TSpeedButton;
    qProcessoCPGPRO_HTREC: TStringField;
    Infecciosas1: TMenuItem;
    Cadastro1: TMenuItem;
    Timer2: TTimer;
    Timer3: TTimer;
    N27: TMenuItem;
    EtiquetasBruno1: TMenuItem;
    N28: TMenuItem;
    Relatrios1: TMenuItem;
    N29: TMenuItem;
    AnlisedasExtraes1: TMenuItem;
    Image8: TImage;
    Label18: TLabel;
    N30: TMenuItem;
    ColetadoresMnimoKits1: TMenuItem;
    LaborriosTESTE1: TMenuItem;
    N9: TMenuItem;
    Importao1: TMenuItem;
    qTipoPlanilha: TADOQuery;
    qTipoPlanilhaTIPO: TStringField;
    N10: TMenuItem;
    PlanilhasUnificado1: TMenuItem;
    N11: TMenuItem;
    RelatriodeEtiquetasAdesivoBrather1: TMenuItem;
    N23: TMenuItem;
    MapaAmplificaoNovo1: TMenuItem;
    N31: TMenuItem;
    RecebimentosCasos1: TMenuItem;
    sbStatus: TSpeedButton;
    N32: TMenuItem;
    ControledePonto1: TMenuItem;
    Colaboradores1: TMenuItem;
    N33: TMenuItem;
    Importador1: TMenuItem;
    N34: TMenuItem;
    eXPORTADOR1: TMenuItem;
    N35: TMenuItem;
    ConsultadeProcedimentos1: TMenuItem;
    N36: TMenuItem;
    ResultadosLiberacao1: TMenuItem;
    ImportaFcil1: TMenuItem;
    N38: TMenuItem;
    Automa1: TMenuItem;
    N39: TMenuItem;
    Cadastro2: TMenuItem;
    N40: TMenuItem;
    CalculaPaternidade1: TMenuItem;
    Label49: TLabel;
    DBEdit24: TDBEdit;
    qProcessoCPGPRO_LACRE: TStringField;
    Image9: TImage;
    RadioGroup1: TRadioGroup;
    TcpClient: TIdTCPClient;
    ds_VencidosSemPessoa: TDataSource;
    ds_GeraCapa: TDataSource;
    ds_ParcelasCapa: TDataSource;
    qConsultaUsuarioCAD: TADOQuery;
    ds_ConsultaUsuarioCAD: TDataSource;
    qConsultaUsuarioCADMIN: TDateField;
    qConsultaUsuarioCADHOS_USUA: TStringField;
    qGeraCapaPRO_COD: TIntegerField;
    qImprimeComprovante: TADOQuery;
    ds_ImprimeComprovante: TDataSource;
    qImprimeComprovantePRO_COD: TIntegerField;
    qImprimeComprovantePRO_NPERC: TStringField;
    qImprimeComprovantePRO_DREC: TDateField;
    tbColetadorAdiocional: TTabSheet;
    GroupBox10: TGroupBox;
    Label51: TLabel;
    DBGrid_COA: TDBGrid;
    qColetadorAdicional: TADOQuery;
    qColetadorAdicionalCOA_ID: TIntegerField;
    qColetadorAdicionalPRO_COD: TIntegerField;
    qColetadorAdicionalCOA_DATA: TDateField;
    qColetadorAdicionalCOA_HORA: TStringField;
    qColetadorAdicionalCOA_OBS: TStringField;
    qColetadorAdicionalLCO_COD: TIntegerField;
    qColetadorAdicionalLkp_Coletador: TStringField;
    ds_ColetadorAdicional: TDataSource;
    sbGeraLaudo: TSpeedButton;
    qNovoLaudo: TADOQuery;
    qNovoLaudoNOVOLAUDO: TStringField;
    qColetadorAdicionalCOA_DATREC: TDateField;
    Label52: TLabel;
    EdtFornecedor: TEdit;
    qConsultaAutos: TADOQuery;
    qConsultaAutosPRO_COD: TIntegerField;
    waWord: TWordApplication;
    wdDoc: TWordDocument;
    N41: TMenuItem;
    EnvioLaboratrioExterno1: TMenuItem;
    Label53: TLabel;
    qProcessoCPGPRO_FG_RESUL: TIntegerField;
    qProcessoCPGPRO_FG_EXTERNO: TIntegerField;
    JvDBComboBoxExterno: TJvDBComboBox;
    qGeraDocumentoWordFG_PROP: TStringField;
    qGeraDocumentoWordPRO_USUCAD: TStringField;
    qGeraDocumentoWordPRO_NUMLAUDO: TStringField;
    qGeraDocumentoWordPRO_RASTREAR: TStringField;
    qGeraDocumentoWordPRO_CARREGACREDITO: TStringField;
    qGeraDocumentoWordPRO_CREDITODNA: TStringField;
    qGeraDocumentoWordPRO_HTREC: TStringField;
    qGeraDocumentoWordPRO_LACRE: TStringField;
    qGeraDocumentoWordPRO_FG_EXTERNO: TIntegerField;
    qGeraDocumentoWordPRO_FG_RESUL: TIntegerField;
    qGeraDocumentoWordPRO_DATA_EXTERNO: TDateField;
    pn_Declaracao: TPanel;
    Label8: TLabel;
    Label50: TLabel;
    DBGrid5: TDBGrid;
    JvDBMaskEdit_Auto: TJvDBMaskEdit;
    N42: TMenuItem;
    CrditosNovo1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BNovoClick(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
    procedure BExcluirClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure BSairClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure bbtPrimeiroClick(Sender: TObject);
    procedure bbtAnteriorClick(Sender: TObject);
    procedure bbtProximoClick(Sender: TObject);
    procedure bbtUltimoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Usurios1Click(Sender: TObject);
    procedure GruposdeUsurios1Click(Sender: TObject);
    procedure Comarca1Click(Sender: TObject);
    procedure Varas1Click(Sender: TObject);
    procedure LocaisdeColeta1Click(Sender: TObject);
    procedure ItensdoHistrico1Click(Sender: TObject);
    procedure Parmetros1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Regras1Click(Sender: TObject);
    procedure bbtWordClick(Sender: TObject);
    procedure tbHistoricoShow(Sender: TObject);
    procedure tbCamposShow(Sender: TObject);
    procedure bbtConsultarClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure bbtNovoClick(Sender: TObject);
    procedure bbtSalvarClick(Sender: TObject);
    procedure bbtCancelarClick(Sender: TObject);
    procedure bbtExcluirClick(Sender: TObject);
    procedure bbtPagamentoClick(Sender: TObject);
    procedure DBGridPagDblClick(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure PagamentoColetadores1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ipodeCasoPreo1Click(Sender: TObject);
    procedure sbLaudosPendendesClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bbtAbrirClick(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure RxDBComboBox3Exit(Sender: TObject);
    procedure RxDBComboBoxResultadoExit(Sender: TObject);
    procedure EmissodeKits1Click(Sender: TObject);
    procedure BaixadeKits1Click(Sender: TObject);
    Function DoisAnteriorDiaUtil (dData : TDateTime) : TDateTime;
    procedure RxDBLookupComboVaraExit(Sender: TObject);
    procedure bbtPessoasClick(Sender: TObject);
    procedure RxDBComboBoxResultadoClick(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure RxDBLookupComboComarcaExit(Sender: TObject);
    procedure bbtJuizClick(Sender: TObject);
    procedure RxDBComboBox3Click(Sender: TObject);
    procedure Pesquisa1Click(Sender: TObject);
    function  VerificaData(Valor :String) :String;
    procedure QuantidadedeExames1Click(Sender: TObject);
    procedure qGeraCapaLCO_CATEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DBGrid5DblClick(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure sbResultadoExcelClick(Sender: TObject);
    Function  Excel_CasoPD0101: String;
    Function  Excel_CasoPD0201: String;
    Function  Excel_CasoRD0301: String;
    Function  AuditoriaAlteracao: String;
    procedure CadastrodeEndereos1Click(Sender: TObject);
    procedure EmissodeCorrespondncias1Click(Sender: TObject);
    procedure RelatriodeGuiadePostagem1Click(Sender: TObject);
    procedure tbHonorariosShow(Sender: TObject);
    procedure RxDBComboBox2Exit(Sender: TObject);
    procedure MapadeExtraoAplificao1Click(Sender: TObject);
    procedure CB_PropostaExit(Sender: TObject);
    procedure LaudosEmitidosporPerodo1Click(Sender: TObject);
    procedure ConsultadeLotes1Click(Sender: TObject);
    procedure FinalizarEmissodoDIa1Click(Sender: TObject);
    procedure LaudosVencendoHoje1Click(Sender: TObject);
    procedure Juzes1Click(Sender: TObject);
    procedure bbtAlelosDuplicadosClick(Sender: TObject);
    procedure DBEdit7Enter(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure DBEdit3Enter(Sender: TObject);
    procedure RxDBLookupComboTipoCasoEnter(Sender: TObject);
    procedure RxDBComboBox3Enter(Sender: TObject);
    procedure RxDBLookupComboComarcaEnter(Sender: TObject);
    procedure RxDBLookupComboVaraEnter(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBComboBox1Enter(Sender: TObject);
    procedure RxDBComboBox2Enter(Sender: TObject);
    procedure RxDBComboBoxResultadoEnter(Sender: TObject);
    procedure DBEdit16Enter(Sender: TObject);
    procedure DBEdit32Enter(Sender: TObject);
    procedure DBDateEdit3Enter(Sender: TObject);
    procedure DBDateEdit2Enter(Sender: TObject);
    procedure DBEdit15Enter(Sender: TObject);
    procedure DBEdit13Enter(Sender: TObject);
    procedure DBDateEdit1Enter(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure DBEdit12Enter(Sender: TObject);
    procedure DBEdit18Enter(Sender: TObject);
    procedure DBEdit11Enter(Sender: TObject);
    procedure DBEdit8Enter(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure CB_PropostaEnter(Sender: TObject);
    procedure DBGrid2Enter(Sender: TObject);
    procedure Auditoria1Click(Sender: TObject);
    procedure bbtCorreiosClick(Sender: TObject);
    procedure RastreamentodeKits1Click(Sender: TObject);
    procedure Vinculao1Click(Sender: TObject);
    procedure Relatrio1Click(Sender: TObject);
    procedure qProcessoCPGPRO_CARREGACREDITOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure HabilitarJuzesparaCrditos1Click(Sender: TObject);
    procedure GeraodasPlanilhas2Click(Sender: TObject);
    procedure GeraPlanilhas1Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    Function MesExtenso( Mes:Word ) : string;
    procedure Timer1Timer(Sender: TObject);
    procedure Exportaes1Click(Sender: TObject);
    procedure Compradekits1Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure sbEnderecosClick(Sender: TObject);
    procedure ColetadoresSemEnvio1Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure sbHTerminoClick(Sender: TObject);
    procedure Cadastro1Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure EtiquetasBruno1Click(Sender: TObject);
    procedure AnlisedasExtraes1Click(Sender: TObject);
    procedure AnlisedasExtraesCASOS1Click(Sender: TObject);
    procedure CriarDiretorioIntegracao;
    procedure Image8Click(Sender: TObject);
    procedure ColetadoresMnimoKits1Click(Sender: TObject);
    procedure Importao1Click(Sender: TObject);
    procedure PlanilhasUnificado1Click(Sender: TObject);
    procedure RelatriodeEtiquetasAdesivoBrather1Click(Sender: TObject);
    procedure MapaAmplificaoNovo1Click(Sender: TObject);
    procedure RecebimentosCasos1Click(Sender: TObject);
    procedure sbStatusClick(Sender: TObject);
    procedure Colaboradores1Click(Sender: TObject);
    procedure Importador1Click(Sender: TObject);
    procedure eXPORTADOR1Click(Sender: TObject);
    procedure ConsultadeProcedimentos1Click(Sender: TObject);
    procedure ImportaFcil1Click(Sender: TObject);
    procedure Automa1Click(Sender: TObject);
    procedure Cadastro2Click(Sender: TObject);
    procedure CalculaPaternidade1Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure DBGrid_COADblClick(Sender: TObject);
    procedure sbGeraLaudoClick(Sender: TObject);
    procedure EnvioLaboratrioExterno1Click(Sender: TObject);
    procedure SequencialPastaIntegracao;
    procedure GerarCreditos;
    procedure CriarAtalhosPastaIntegracao (Arquivo:String;Caminho:String;Descricao:String);
    procedure JvDBMaskEdit_AutoEnter(Sender: TObject);
    procedure JvDBMaskEdit_AutoExit(Sender: TObject);
    procedure CrditosNovo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
// 	function NomesAdic : boolean;
  GeraDocumento, TipoItem, Abertura, CodigoBarras : String;
  procedure ShowIdleTime;
  end;

var
  fProcessos: TfProcessos;
  SituacaoForm : String;
  Nome : array[1..4] of string[15];

  PRO_COD, PRO_ANO, PRO_TIPO, COM_COD, VAR_COD, LCO_COD, PRO_SIT, PRO_NCOMP, PRO_RESUL, JUI_COD : Integer;
  PRO_NPERC, PRO_AUTO, UF_SIGLA, CAS_CODIGO, PRO_HREC, PRO_HCOLE, PRO_PROB, PRO_ARETI, FG_PROP, PRO_USUCAD : String;
  PRO_DCOLE, PRO_DREC, PRO_DRESU : TDate;

  Ano, Mes, Dia : Word;
  Data_Mapa, AnoA, MesA, DiaA, DefinePastaGravacao, CaminhoPastaGravacao : String;
  UltimoNumeroPasta : Integer;


implementation
uses Word2010, ufDM, ufHistorico, ufUsuarios, ufGrupo, ufLocaisColeta,
  ufItemHistorico, ufComarca, ufEstado, ufVara, ufParametros, ufRegras,
  ufGeraWord, ufConsultaPericia, ufConsultaCPG, ufParcelamento,
  ufGeraValorColetadores, ufGeradorRelFinanceiro, ufGeradorRelEtiquetas,
  ufTipoCasoPreco, ufTimer, ufRelLaudosPendentes, ufAcesso, ufuncoes,
  ufNomes, ufDMR, ufBits, ufEmissaoKits, ufConsultaKits, ufImportaDados,
  ufRelCapa, ufPessoas, ufJuiz, ufPesquisa, ufEmissaoRelQuantidades,
  StrUtils, Math, ufEnderecos, ufCorrespondencia, ufRelGuiaPostagem,
  ufMapa_ExtAmpli, DateUtils, ufEmissaoLaudosEmitidos, ufConsultaLotes,
  ufExcluiCorrenpondencia, ufImpressoes, ufLaudosVencendoPeriodo,
  ufGeraDocLab, ufConsultaJuiz, ufConsultaAlelosDuplicados,
  ufConsultaAuditoria, ufRastrearKits, ufConsultaDadosparaCredito,
  ufRelCreditosJuiz, ufVinculaCreditos, ufImportaAlelos,
  ufExportaAlelosPlanilhas, ufImprimeFolhaResultados, ufExportaExcel,
  ufCompraKits, ufCasoEndereco, ufRelCapa2, ufEmissaoLColetaExames,
  ufProcedimentos, ufRelEtiquetas, ufGeradorRelInfecciosas, ufExtracao,
  ufExtracaoCasos, ufMergePDFs, ufRelMinimoKits, ufGeraDocLabTipos,
  ufRelEtiquetasAdesiva, ufMapa_ExtAmpliNew, ufRecebimentoLaboratorio,
  ufConsultaStatus, ufColaborador, ufColaboradorImporta,
  ufColaboradorExporta, ufConsultaGeralInf, ufEmissaoLaudosAgrupadoNew,
  ufImportaProcedimentos, ufImportaProcedimentosHist, ufServicoAutoma,
  ufCreditosJuiz, ufCalculoPaternidade, ufDMI, ufImprimeComprovantePaternidade,
  ufColetadorAdicional, ufEnvioCasosExternos, ufGeracaoCreditoNew;

function GetLastInputInfo; stdcall; external 'user32.dll';



{$R *.dfm}

procedure TfProcessos.ShowIdleTime;
var
  vLastInput: TLastInputInfo;
  vIdleTime : Cardinal;
  vHours    : Cardinal;
  vMinutes  : Cardinal;
  vSeconds  : Cardinal;
begin
  vLastInput.cbSize := SizeOf(TLastInputInfo);
  vLastInput.dwTime := 0;
  
  if GetLastInputInfo(vLastInput) <> 0 then
    vIdleTime := GetTickCount - vLastInput.dwTime
  else
    vIdleTime := 0;

  vHours := vIdleTime div (60 * 60 * 1000);
  if vHours > 0 then
    vIdleTime := vIdleTime - (vHours * 60 * 60 * 1000);

  vMinutes := vIdleTime div (60 * 1000);
  if vMinutes > 0 then
    vIdleTime := vIdleTime - (vMinutes * 60 * 1000);

  vSeconds := vIdleTime div 1000;
end;

procedure TfProcessos.FormShow(Sender: TObject);
begin
    qSelEstado.Open;
    qSelComarca.Open;
    qSelVaras.Open;
    qSelColeta.Open;
    qSelCaso.Open;
    qSelJuiz.Open;
    qProcessoCPG.Open;
    qColetadorAdicional.Open;
    DM.qItem.Open;
    DM.qHistorico.Open;
    DM.qPessoas.Open;
    DM.qPessoasGrid.Open;
    DM.qParcelamento.Open;
    DM.qParametros.Open;
    DM.qCasos.Open;
    DM.qJuiz.Open;
    DM.qDadosProcesso.Open;
    DM.qLocalColeta.Open;

    SituacaoForm := '';
    pc.ActivePageIndex := 0;
    bbtUltimo.Click;


    StatusBar1.Panels[3].Text := 'Usuário: ' + fAcesso.Edit1.Text;
    StatusBar1.Panels[4].Text := 'Ver.: ' + GetBuildInfo1();

    GerarCreditos;

    {Se houver laudos pendenstes chama o formTimer*****************}
    qVencidosSemPessoa.Active := False;
    qVencidosSemPessoa.Parameters.ParamByName('DTRESULTADO').Value := Date;
    qVencidosSemPessoa.Active := True;

    If qVencidosSemPessoa.RecordCount >0 then
      begin
        Label38.Caption := 'Existem laudos pendentes';
        sbLaudosPendendes.Visible := True;
        Application.CreateForm(TfTimer,fTimer);
        fTimer.ShowModal;
        fTimer.Free;
      end
    Else
      Begin
        Label38.Caption := '';
        sbLaudosPendendes.Visible := False;
      End;

      // Kits abaixo do mínimo 19/05/2017
    dmr.qQuantMinimoKits.Active := False;
    dmr.qQuantMinimoKits.Active := True;

    If dmr.qQuantMinimoKits.RecordCount >0 then
      begin
        Label18.Caption := 'Coletador precisando de Kits';
        Application.CreateForm(TfTimer,fTimer);
        fTimer.ShowModal;
        fTimer.Free;
      end
    Else
      Begin
        Label18.Caption := '';
      End;

    qSelComarca.Close;
    qSelComarca.Parameters.ParamByName('UF_SIGLA').Value := qProcessoCPGUF_SIGLA.Value;
    qSelComarca.Open;

    qSelVaras.Close;
    qSelVaras.Parameters.ParamByName('UF_SIGLA').Value := qProcessoCPGUF_SIGLA.Value;
    qSelVaras.Parameters.ParamByName('COM_COD').Value  := qProcessoCPGCOM_COD.Value;
    qSelVaras.Open;

    qConsultaUsuarioCAD.Close;
    qConsultaUsuarioCAD.Parameters.ParamByName('Codigo').Value := qProcessoCPGPRO_COD.Value;
    qConsultaUsuarioCAD.Open;
 end;

procedure TfProcessos.DBGrid2DblClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfHistorico,fHistorico);
  fHistorico.ShowModal;
  fHistorico.Free;
end;

procedure TfProcessos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
qSelEstado.Close;
qSelComarca.Close;
qSelVaras.Close;
qSelColeta.Close;
qSelCaso.Close;
qProcessoCPG.Close;
DM.qItem.Close;
DM.qHistorico.Close;
qColetadorAdicional.Close;
DM.qPessoas.Close;
DM.qParcelamento.Close;
DM.qParametros.Close;
DM.qCasos.Close;
DM.qJuiz.Close;
DM.qDadosProcesso.Close;
end;

procedure TfProcessos.BNovoClick(Sender: TObject);
var proximo:integer;
    Ano, Mes, Dia : Word;
begin
//Gerando Código do Processo - Novo (18/06/2007)
  qCodigoProcesso.Close;
  qCodigoProcesso.Open;
  proximo := qCodigoProcessoCODIGO.Value;
//Fim

if not (proximo = 0)
then begin
      qManutencaoParcelamento2.Close;
      qManutencaoParcelamento2.Open;
      if qManutencaoParcelamento2QUANTIDADE.Value > 0
      then begin
            if messagedlg('              :::::::::::::: ATENÇÃO ::::::::::::::::::' + #13 + #13 + 'Existem Casos sem lançamento no Controle Financeiro' + '.' + #13 + #13 + 'Deseja realmente incluir outro caso?',mtconfirmation,[mbyes,mbno],0) = mryes
            then begin
                  DecodeDate(Date, Ano, Mes, Dia);

                  with qManutencaoCodigo do
                  begin
                  Close;
                  SQL.Clear;
                  SQL.Add('update tb_codigo c set c.status = :Status ');
                  SQL.Add(' where c.pro_cod = :Codigo ');
                  Parameters.ParamByName('Status').Value := 'U';
                  Parameters.ParamByName('Codigo').Value := proximo;
                  ExecSQL;
                  end;

                  with qControlaAuditoria do
                  begin
                  Close;
                  SQL.Clear;
                  SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
                  Parameters.ParamByName('Processo').Value := proximo;
                  Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
                  Parameters.ParamByName('Data').Value     := Date;
                  Parameters.ParamByName('Hora').Value     := TimeToStr(Time);
                  Parameters.ParamByName('Execucao').Value := 'Apertou o Botão NOVO do CADASTRO DE PROCESSO. Deu Sim na Falta de Financeiro';
                  ExecSQL;
                  end;

                  dsp.DataSet.Append;
                  tbCampos.Enabled := True;
                  tbHistorico.Enabled := True;
                  gbGrid.Enabled := True;
                  bsalvar.Enabled:=true;
                  bcancelar.Enabled:=true;
                  bnovo.Enabled:=false;
                  beditar.Enabled:=false;
                  bsair.Enabled:=false;
                  bexcluir.Enabled:=false;
                  qProcessoCPGPRO_COD.Value   := proximo;
                  qProcessoCPGPRO_ANO.Value   := Ano;
                  qProcessoCPGPRO_DRESU.Value := Date + 7;
                  if ((DayOfWeek(qProcessoCPGPRO_DRESU.Value) = 1))
                  then begin
                        qProcessoCPGPRO_DRESU.Value := Date + 8;
                       end else begin
                                 if ((DayOfWeek(qProcessoCPGPRO_DRESU.Value) = 1))
                                 then begin
                                       qProcessoCPGPRO_DRESU.Value := Date + 9;
                                      end else qProcessoCPGPRO_DRESU.Value := Date + 7;
                                end;
                  qProcessoCPGPRO_HREC.Value  := TimeToStr(Time);

                  qProcessoCPGPRO_RESUL.Value := 4;
                  qProcessoCPGFG_PROP.Value   := 'N';
                  DBEdit7.SetFocus;
                  SituacaoForm := 'Insercao';
                end;
             end else begin
                        DecodeDate(Date, Ano, Mes, Dia);

                        with qManutencaoCodigo do
                        begin
                         Close;
                         SQL.Clear;
                         SQL.Add('update tb_codigo c set c.status = :Status ');
                         SQL.Add(' where c.pro_cod = :Codigo ');
                         Parameters.ParamByName('Status').Value := 'U';
                         Parameters.ParamByName('Codigo').Value := proximo;
                         ExecSQL;
                        end;

                        with qControlaAuditoria do
                        begin
                        Close;
                        SQL.Clear;
                        SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
                        Parameters.ParamByName('Processo').Value := proximo;
                        Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value;
                        Parameters.ParamByName('Data').Value     := Date;
                        Parameters.ParamByName('Hora').Value     := Time;
                        Parameters.ParamByName('Execucao').Value := 'Apertou o Botão NOVO do CADASTRO DE PROCESSO';
                        ExecSQL;
                        end;

                        dsp.DataSet.Append;
                        tbCampos.Enabled := True;
                        gbGrid.Enabled := True;
                        bsalvar.Enabled:=true;
                        bcancelar.Enabled:=true;
                        bnovo.Enabled:=false;
                        beditar.Enabled:=false;
                        bsair.Enabled:=false;
                        bexcluir.Enabled:=false;
                        qProcessoCPGPRO_COD.Value   := proximo;
                        qProcessoCPGPRO_ANO.Value   := Ano;
                        qProcessoCPGPRO_DRESU.Value := Date + 15;
                        qProcessoCPGPRO_RESUL.Value := 4;
                        //Pedido do Bruno em 05/05/2009
                        qProcessoCPGPRO_DREC.Value  := Date;
                        qProcessoCPGPRO_HREC.Value  := TimeToStr(Time);
                        
                        qProcessoCPGFG_PROP.Value   := 'N';
                        DBEdit7.SetFocus;
                        SituacaoForm := 'Insercao';
                      end;
     end else begin
                ShowMessage('Quantidade de Códigos disponíveis para uso chegou ao fim.' + #13 + #13 + 'Chame o Administrador para a correção do problema.')
               end;
//Libera Campo Autos
 Label10.Enabled           := True;
 JvDBMaskEdit_Auto.Enabled := True;
 //
end;

procedure TfProcessos.BEditarClick(Sender: TObject);
begin
   //CriarDiretorio;

   qProcessoCPG.Edit;
   SituacaoForm := 'Edicao';

   dsp.DataSet.Edit;
   tbCampos.Enabled := True;
   tbHistorico.Enabled := True;
   gbGrid.Enabled := True;
   bsalvar.Enabled:=true;
   bcancelar.Enabled:=true;
   bnovo.Enabled:=false;
   beditar.Enabled:=false;
   bsair.Enabled:=false;
   bexcluir.Enabled:=false;

   with qControlaAuditoria do
   begin
    Close;
    SQL.Clear;
    SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
    Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
    Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
    Parameters.ParamByName('Data').Value     := Date;
    Parameters.ParamByName('Hora').Value     := Time;
    Parameters.ParamByName('Execucao').Value := 'Apertou o Botão EDITAR do CADASTRO DE PROCESSO';
    ExecSQL;
   end;

// Limpa Campos

PRO_COD    :=0;
PRO_ANO    :=0;
PRO_NPERC  :='';
PRO_TIPO   :=0;
PRO_AUTO   :='';
UF_SIGLA   :='';
CAS_CODIGO :='';
COM_COD    :=0;
VAR_COD    :=0;
LCO_COD    :=0;
PRO_HCOLE  :='';
PRO_DCOLE  :=0;
PRO_HREC   :='';
PRO_DREC   :=0;
PRO_DRESU  :=0;
PRO_SIT    :=0;
PRO_NCOMP  :=0;
PRO_RESUL  :=0;
PRO_PROB   :='';
PRO_ARETI  :='';
JUI_COD    :=0;
FG_PROP    :='';
PRO_USUCAD :='';

// Auditoria de Alteração
    PRO_COD   := qProcessoCPGPRO_COD.Value;
    PRO_ANO   := qProcessoCPGPRO_ANO.Value;
    PRO_NPERC := qProcessoCPGPRO_NPERC.Value;
    PRO_TIPO  := qProcessoCPGPRO_TIPO.Value;
    PRO_AUTO  := qProcessoCPGPRO_AUTO.Value;
    UF_SIGLA  := qProcessoCPGUF_SIGLA.Value;
    CAS_CODIGO:= qProcessoCPGCAS_CODIGO.Value;
    COM_COD   := qProcessoCPGCOM_COD.Value;
    VAR_COD   := qProcessoCPGVAR_COD.Value;
    LCO_COD   := qProcessoCPGLCO_COD.Value;
    PRO_HCOLE := qProcessoCPGPRO_HCOLE.Value;
    PRO_DCOLE := qProcessoCPGPRO_DCOLE.Value;
    PRO_HREC  := qProcessoCPGPRO_HREC.Value;
    PRO_DREC  := qProcessoCPGPRO_DREC.Value;
    PRO_DRESU := qProcessoCPGPRO_DRESU.Value;
    PRO_SIT   := qProcessoCPGPRO_SIT.Value;
    PRO_NCOMP := qProcessoCPGPRO_NCOMP.Value;
    PRO_RESUL := qProcessoCPGPRO_RESUL.Value;
    PRO_PROB  := qProcessoCPGPRO_PROB.Value;
    PRO_ARETI := qProcessoCPGPRO_ARETI.Value;
    JUI_COD   := qProcessoCPGJUI_COD.Value;
    FG_PROP   := qProcessoCPGFG_PROP.Value;
    PRO_USUCAD:= qProcessoCPGPRO_USUCAD.Value;
// Fim


if RxDBComboBox3.ItemIndex = 0
then begin
      Label10.Enabled           := True;
      JvDBMaskEdit_Auto.Enabled := True;
      Label40.Enabled   := False;
      DBEdit32.Enabled  := False;
      DBEdit8.SetFocus;
     end else begin
               Label10.Enabled           := False;
               JvDBMaskEdit_Auto.Enabled := False;
               Label40.Enabled  := True;
               DBEdit32.Enabled := True;
              end;


end;

procedure TfProcessos.BExcluirClick(Sender: TObject);
var Pericia : String;
    Coletador : Integer;
begin
   if messagedlg('              :::::::::::::: ATENÇÃO ::::::::::::::::::' + #13 + #13 + 'Esse procedimento exclui a Perícia:' + qProcessoCPGPRO_NPERC.Value + '.' + #13 + #13 + 'Deseja realmente excluir?',mtconfirmation,[mbyes,mbno],0) = mryes
   then begin
           Pericia   := qProcessoCPGPRO_NPERC.Value;
           Coletador := qProcessoCPGLCO_COD.Value;
           dsp.DataSet.delete;
           tbCampos.Enabled := True;
           tbHistorico.Enabled := True;           
           gbGrid.Enabled := False;
           bsalvar.Enabled:=false;
           bcancelar.Enabled:=false;
           bnovo.Enabled:=true;
           beditar.Enabled:=true;
           bsair.Enabled:=true;
           bexcluir.Enabled:=true;

            with qControlaAuditoria do
             begin
              Close;
              SQL.Clear;
              SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
              Parameters.ParamByName('Processo').Value := dm.qPessoasPRO_COD.Value;
              Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
              Parameters.ParamByName('Data').Value     := Date;
              Parameters.ParamByName('Hora').Value     := Time;
              Parameters.ParamByName('Execucao').Value := 'Fez a EXCLUSÃO no CADASTRO DE PROCESSOS / Código da Perícia: ' + Pericia + ' e Código do Coletador: ' + IntToStr(Coletador);
              ExecSQL;
              Pericia   := '';
              Coletador := 0;
             end;



        end;
end;

procedure TfProcessos.BSalvarClick(Sender: TObject);
var Ano, Mes, Dia : Word;
    AnoAtual      : String;
    Contador      : Integer;
    ValorParcela  : Real;
begin
//CriarDiretorio;
CriarDiretorioIntegracao;


if qProcessoCPGUF_SIGLA.Value = ''
then begin
      ShowMessage('Informe o Estado. Pois é um campo obrigatório para no cadastramento.');
      DBEdit7.SetFocus;
     end else begin
               if qProcessoCPGCOM_COD.Value <= 0
               then begin
                     ShowMessage('Informe a Comarca. Pois é um campo obrigatório para no cadastramento.');
                     DBEdit8.SetFocus;
                    end else begin
                              if ((RxDBComboBox3.ItemIndex <> 1) and (qProcessoCPGJUI_COD.Value <= 0))
                              then begin
                                    ShowMessage('Informe o Juiz. Pois é um campo obrigatório para no cadastramento.');
                                    DBEdit18.SetFocus;
                                   end else begin
                                             if (trim(DBEdit13.Text) = ':')
                                             then begin
                                                   ShowMessage('Informe a Hora da Coleta. Pois é um campo obrigatório para no cadastramento.');
                                                   DBEdit13.SetFocus;
                                                  end else begin
                                                           if RxDBComboBox3.ItemIndex < 0
                                                           then begin
                                                                 ShowMessage('Informe o Tipo do Caso. Pois é um campo obrigatório para no cadastramento.');
                                                                 RxDBComboBox3.SetFocus;
                                                                end else begin
                                                                          if VerificaData('Padrao') = 'Negado'
                                                                          then begin
                                                                                ShowMessage('Datas tem que possuir uma ordem cronológica. Por favor verifique as datas lançadas.');
                                                                                DBDateEdit1.SetFocus;
                                                                               end else begin
                                                                                         if qProcessoCPG.State in [dsInsert, dsEdit]
                                                                                         then begin
                                                                                               //Rotina Gera Código da Perícia
                                                                                                if (qProcessoCPGPRO_DREC.Value <= 0) and (qProcessoCPGPRO_DREC.Value > 0)
                                                                                                then begin
                                                                                                      DecodeDate(qProcessoCPGPRO_DCOLE.Value, Ano, Mes, Dia);
                                                                                                      AnoAtual := IntToStr(Ano);
                                                                                                     end else begin
                                                                                                               if (qProcessoCPGPRO_DREC.Value > 0) and (qProcessoCPGPRO_DREC.Value <= 0)
                                                                                                               then begin
                                                                                                                     DecodeDate(qProcessoCPGPRO_DREC.Value, Ano, Mes, Dia);
                                                                                                                     AnoAtual := IntToStr(Ano);
                                                                                                                    end else begin
                                                                                                                              DecodeDate(Date, Ano, Mes, Dia);
                                                                                                                              AnoAtual := IntToStr(Ano);
                                                                                                                             end;

                                                                                                              end;

                                                                                                qSelecionaSiglaComarca.Close;
                                                                                                qSelecionaSiglaComarca.Parameters.ParamByName('Estado').Value := qProcessoCPGUF_SIGLA.Value;
                                                                                                qSelecionaSiglaComarca.Parameters.ParamByName('Comarca').Value := qProcessoCPGCOM_COD.Value;
                                                                                                qSelecionaSiglaComarca.Open;

                                                                                                qSelecionaSiglaVara.Close;
                                                                                                qSelecionaSiglaVara.Parameters.ParamByName('Estado').Value := qProcessoCPGUF_SIGLA.Value;
                                                                                                qSelecionaSiglaVara.Parameters.ParamByName('Comarca').Value := qProcessoCPGCOM_COD.Value;
                                                                                                qSelecionaSiglaVara.Parameters.ParamByName('Vara').Value := qProcessoCPGVAR_COD.Value;
                                                                                                qSelecionaSiglaVara.Open;
                                                                                                if qProcessoCPGPRO_TIPO.Value = 9
                                                                                                then begin
                                                                                                      qProcessoCPGPRO_NPERC.Value := AnoAtual + '.' + 'PR' + qSelecionaSiglaComarcaCOM_SIGLA.Value + DBEdit7.Text + DBEdit1.Text;
                                                                                                     end else begin
                                                                                                               if (qProcessoCPGPRO_TIPO.Value = 2) or (RxDBComboBox3.Text = 'ExtraJudicial')
                                                                                                               then begin
                                                                                                                     qProcessoCPGPRO_NPERC.Value := AnoAtual + '.' + 'EX' + qSelecionaSiglaComarcaCOM_SIGLA.Value + DBEdit7.Text + DBEdit1.Text;
                                                                                                                    end else qProcessoCPGPRO_NPERC.Value := AnoAtual + '.' + qSelecionaSiglaVaraVAR_SIGLA.Value + qSelecionaSiglaVaraCOM_SIGLA.Value + DBEdit7.Text + DBEdit1.Text;
                                                                                                              end;
                                                                                                //Termina Rotina de Geração aqui
                                                                                               end;

                                                                                             SituacaoForm := '';
                                                                                             if qProcessoCPG.State in [dsInsert]
                                                                                             then begin
                                                                                                   qProcessoCPGPRO_USUCAD.Value := DM.qHostsHOS_USUA.Value;
                                                                                                  end;
                                                                                             if qProcessoCPG.State in [dsinsert, dsedit]
                                                                                             then begin
                                                                                                     //Libera Campo Autos
                                                                                                      Label10.Enabled           := True;
                                                                                                      JvDBMaskEdit_Auto.Enabled := True;
                                                                                                     //
                                                                                                     tbCampos.Enabled := False;
                                                                                                     tbHistorico.Enabled := False;
                                                                                                     gbGrid.Enabled := False;
                                                                                                     bsalvar.Enabled:=false;
                                                                                                     bcancelar.Enabled:=false;
                                                                                                     bnovo.Enabled:=true;
                                                                                                     beditar.Enabled:=true;
                                                                                                     bsair.Enabled:=true;
                                                                                                     bexcluir.Enabled:=true;
                                                                                                     qProcessoCPG.Post;
                                                                                                     Showmessage ('Dados gravados com sucesso!');

                                                                                                     with qControlaAuditoria do
                                                                                                     begin
                                                                                                      Close;
                                                                                                      SQL.Clear;
                                                                                                      SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
                                                                                                      Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
                                                                                                      Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
                                                                                                      Parameters.ParamByName('Data').Value     := Date;
                                                                                                      Parameters.ParamByName('Hora').Value     := Time;
                                                                                                      Parameters.ParamByName('Execucao').Value := 'Apertou o Botão SALVAR do CADASTRO DE PROCESSO';
                                                                                                      ExecSQL;

                                                                                                      AuditoriaAlteracao;
                                                                                                     end;
                                                                                                      qConsultaAutos.Close;
                                                                                                      qConsultaAutos.Parameters.ParamByName('Auto').Value   := qProcessoCPGPRO_AUTO.Value;
                                                                                                      qConsultaAutos.Parameters.ParamByName('Codigo').Value := qProcessoCPGPRO_COD.Value;
                                                                                                      qConsultaAutos.Open;
                                                                                                      if (qConsultaAutos.RecordCount >= 1)
                                                                                                      then begin
                                                                                                            messageDLG('ATENÇÃO! Já existe outro Caso com esse Número de Processo (Autos).' + #13 + #13 + 'Verificar o Caso: ' + IntToStr(qConsultaAutosPRO_COD.Value)  + '!',mtError,[mbOK],0);
                                                                                                            JvDBMaskEdit_Auto.Color      := clRed;
                                                                                                            JvDBMaskEdit_Auto.Font.Color := clWindow;
                                                                                                           end;

                                                                                                  end else begin
                                                                                                           //Libera Campo Autos
                                                                                                            Label10.Enabled           := True;
                                                                                                            JvDBMaskEdit_Auto.Enabled := True;
                                                                                                           //
                                                                                                            showmessage('Dados já gravados!');
                                                                                                            tbCampos.Enabled := False;
                                                                                                            gbGrid.Enabled := False;
                                                                                                            bsalvar.Enabled:=false;
                                                                                                            bcancelar.Enabled:=false;
                                                                                                            bnovo.Enabled:=true;
                                                                                                            beditar.Enabled:=true;
                                                                                                            bsair.Enabled:=true;
                                                                                                            bexcluir.Enabled:=true;

                                                                                                            with qControlaAuditoria do
                                                                                                            begin
                                                                                                             Close;
                                                                                                             SQL.Clear;
                                                                                                             SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
                                                                                                             Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
                                                                                                             Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
                                                                                                             Parameters.ParamByName('Data').Value     := Date;
                                                                                                             Parameters.ParamByName('Hora').Value     := Time;
                                                                                                             Parameters.ParamByName('Execucao').Value := 'Apertou o Botão SALVAR do CADASTRO DE PROCESSO';
                                                                                                             ExecSQL;

                                                                                                             AuditoriaAlteracao;
                                                                                                            end;

                                                                                                            qConsultaAutos.Close;
                                                                                                            qConsultaAutos.Parameters.ParamByName('Auto').Value   := qProcessoCPGPRO_AUTO.Value;
                                                                                                            qConsultaAutos.Parameters.ParamByName('Codigo').Value := qProcessoCPGPRO_COD.Value;
                                                                                                            qConsultaAutos.Open;
                                                                                                            if (qConsultaAutos.RecordCount >= 1)
                                                                                                            then begin
                                                                                                                  messageDLG('ATENÇÃO! Já existe outro Caso com esse Número de Processo (Autos).' + #13 + #13 + 'Verificar o Caso: ' + IntToStr(qConsultaAutosPRO_COD.Value)  + '!',mtError,[mbOK],0);
                                                                                                                  JvDBMaskEdit_Auto.Color      := clRed;
                                                                                                                  JvDBMaskEdit_Auto.Font.Color := clWindow;
                                                                                                                 end;
                                                                                                           end;
                                                                                        end;
                                                                         end;
                                                          end;
                                                  end;

                                           end;

                            end;
end;

procedure TfProcessos.BSairClick(Sender: TObject);
begin
 if MessageDlg('Deseja realmente sair do CPG?',mtconfirmation,[mbyes,mbno],0) = mryes
   then begin
           close;
        end;
end;

function TfProcessos.VerificaData(Valor : String): String;
var Atende1, Atende2 : String;
begin
if not (qProcessoCPGFG_PROP.Value = 'S')
then begin
      if (qProcessoCPGLCO_COD.Value = 36) and (RxDBComboBox2.ItemIndex = -1)
      then begin
           if (qProcessoCPGPRO_DCOLE.Value > qProcessoCPGPRO_DRESU.Value) or (qProcessoCPGFG_PROP.Value = 'S')
           then begin
                 Result := 'Negado';
                end else Result := 'Permitido';
           end else begin
                     if (RxDBComboBox2.ItemIndex <> -1)
                     then begin
                          if (qProcessoCPGPRO_DCOLE.Value <= 0) or (qProcessoCPGFG_PROP.Value = 'S')
                          then begin
                                Result := 'Negado';
                               end else Result := 'Permitido';
                          end else begin
                                    if (qProcessoCPGPRO_DCOLE.Value > qProcessoCPGPRO_DREC.Value) or (qProcessoCPGPRO_DREC.Value > qProcessoCPGPRO_DRESU.Value) or (qProcessoCPGFG_PROP.Value = 'S')
                                    then begin
                                          Result := 'Negado';
                                         end else Result := 'Permitido';
                                   end;
                   end;
    end else Result := 'Permitido';
end;



procedure TfProcessos.BCancelarClick(Sender: TObject);
begin
 SituacaoForm := '';
 if messagedlg('Deseja realmente cancelar?',mtconfirmation,[mbyes,mbno],0) = mryes
   then begin
           //Libera Campo Autos
            Label10.Enabled           := True;
            JvDBMaskEdit_Auto.Enabled := True;
            //
           dsp.DataSet.Cancel;
           tbCampos.Enabled := False;
           tbHistorico.Enabled := False;
           gbGrid.Enabled := False;
           bsalvar.Enabled:=false;
           bcancelar.Enabled:=false;
           bnovo.Enabled:=true;
           beditar.Enabled:=true;
           bsair.Enabled:=true;
           bexcluir.Enabled:=true;

           with qControlaAuditoria do
           begin
            Close;
            SQL.Clear;
            SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
            Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
            Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
            Parameters.ParamByName('Data').Value     := Date;
            Parameters.ParamByName('Hora').Value     := Time;
            Parameters.ParamByName('Execucao').Value := 'Apertou o Botão CANCELAR do CADASTRO DE PROCESSO';
            ExecSQL;
           end;

        end;
end;

procedure TfProcessos.bbtPrimeiroClick(Sender: TObject);
begin
DSP.DataSet.First;

qSelVaras.Close;
qSelVaras.Parameters.ParamByName('UF_SIGLA').Value := qProcessoCPGUF_SIGLA.Value;
qSelVaras.Parameters.ParamByName('COM_COD').Value  := qProcessoCPGCOM_COD.Value;
qSelVaras.Open;

qSelComarca.Close;
qSelComarca.Parameters.ParamByName('UF_SIGLA').Value := qProcessoCPGUF_SIGLA.Value;
qSelComarca.Open;

qConsultaUsuarioCAD.Close;
qConsultaUsuarioCAD.Parameters.ParamByName('Codigo').Value := qProcessoCPGPRO_COD.Value;
qConsultaUsuarioCAD.Open;
end;

procedure TfProcessos.bbtAnteriorClick(Sender: TObject);
begin
DSP.DataSet.Prior;

qSelComarca.Close;
qSelComarca.Parameters.ParamByName('UF_SIGLA').Value := qProcessoCPGUF_SIGLA.Value;
qSelComarca.Open;

qSelVaras.Close;
qSelVaras.Parameters.ParamByName('UF_SIGLA').Value := qProcessoCPGUF_SIGLA.Value;
qSelVaras.Parameters.ParamByName('COM_COD').Value  := qProcessoCPGCOM_COD.Value;
qSelVaras.Open;

qConsultaUsuarioCAD.Close;
qConsultaUsuarioCAD.Parameters.ParamByName('Codigo').Value := qProcessoCPGPRO_COD.Value;
qConsultaUsuarioCAD.Open;
end;

procedure TfProcessos.bbtProximoClick(Sender: TObject);
begin
DSP.DataSet.Next;

qSelComarca.Close;
qSelComarca.Parameters.ParamByName('UF_SIGLA').Value := qProcessoCPGUF_SIGLA.Value;
qSelComarca.Open;

qSelVaras.Close;
qSelVaras.Parameters.ParamByName('UF_SIGLA').Value := qProcessoCPGUF_SIGLA.Value;
qSelVaras.Parameters.ParamByName('COM_COD').Value  := qProcessoCPGCOM_COD.Value;
qSelVaras.Open;

qConsultaUsuarioCAD.Close;
qConsultaUsuarioCAD.Parameters.ParamByName('Codigo').Value := qProcessoCPGPRO_COD.Value;
qConsultaUsuarioCAD.Open;
end;

procedure TfProcessos.bbtUltimoClick(Sender: TObject);
begin
DSP.DataSet.Last;

qSelComarca.Close;
qSelComarca.Parameters.ParamByName('UF_SIGLA').Value := qProcessoCPGUF_SIGLA.Value;
qSelComarca.Open;

qSelVaras.Close;
qSelVaras.Parameters.ParamByName('UF_SIGLA').Value := qProcessoCPGUF_SIGLA.Value;
qSelVaras.Parameters.ParamByName('COM_COD').Value  := qProcessoCPGCOM_COD.Value;
qSelVaras.Open;

qConsultaUsuarioCAD.Close;
qConsultaUsuarioCAD.Parameters.ParamByName('Codigo').Value := qProcessoCPGPRO_COD.Value;
qConsultaUsuarioCAD.Open;
end;

procedure TfProcessos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if not ((SituacaoForm = 'Edicao') and (SituacaoForm = 'Insercao'))
then begin
      case Key of
        VK_F4     :   bbtPessoas.Click;
        VK_F5     :   bbtPrimeiro.Click;
        VK_F3     :   bbtAlelosDuplicados.Click;
        VK_F6     :   bbtAnterior.Click;
        VK_F7     :   bbtProximo.Click;
        VK_F8     :   bbtUltimo.Click;
        VK_F10    :   bbtAbrir.Click;
        $53       :   if (Shift = [ssCtrl]) then bSair.Click;  {VK_S:}
        $54       :  	if (Shift = [ssCtrl]) then bbtConsultar.Click; {VK_T:}
        $57       :   if (Shift = [ssCtrl]) then bbtWord.Click;  {VK_W:}
      end;
     end;

end;

procedure TfProcessos.Usurios1Click(Sender: TObject);
begin
  Application.CreateForm(TfUsuarios,fUsuarios);
  fUsuarios.ShowModal;
  fUsuarios.Free;
end;

procedure TfProcessos.GruposdeUsurios1Click(Sender: TObject);
begin
  Application.CreateForm(TfRestricao,fRestricao);
  fRestricao.ShowModal;
  fRestricao.Free;
end;

procedure TfProcessos.Comarca1Click(Sender: TObject);
begin
  Application.CreateForm(TfComarca,fComarca);
  fComarca.ShowModal;
  fComarca.Free;
end;

procedure TfProcessos.Varas1Click(Sender: TObject);
begin
  Application.CreateForm(TfVara,fVara);
  fVara.ShowModal;
  fVara.Free;
end;

procedure TfProcessos.LocaisdeColeta1Click(Sender: TObject);
begin
  Application.CreateForm(TfLocaisColeta,fLocaisColeta);
  fLocaisColeta.ShowModal;
  fLocaisColeta.Free;
  qSelColeta.Close;
  qSelColeta.Open;
end;

procedure TfProcessos.ItensdoHistrico1Click(Sender: TObject);
begin
  Application.CreateForm(TfItemHist,fItemHist);
  fItemHist.ShowModal;
  fItemHist.Free;
end;

procedure TfProcessos.Parmetros1Click(Sender: TObject);
begin
  Application.CreateForm(TfParametros,fParametros);
  fParametros.ShowModal;
  fParametros.Free;
end;

procedure TfProcessos.DBGrid1DblClick(Sender: TObject);
begin
 if qProcessoCPG.State in [dsEdit, dsInsert]
 then begin
       CriarDiretorioIntegracao;
       qProcessoCPG.Post;
       Application.CreateForm(TfHistorico, fHistorico);
       fHistorico.ShowModal;
       fHistorico.Free;
      end else begin
                Application.CreateForm(TfHistorico, fHistorico);
                fHistorico.ShowModal;
                fHistorico.Free;
               end;
end;
procedure TfProcessos.Regras1Click(Sender: TObject);
begin
 Application.CreateForm(TfRegras, fRegras);
 fRegras.ShowModal;
 fRegras.Free;
end;

procedure TfProcessos.bbtWordClick(Sender: TObject);
var Pasta, Destino, ParteModelo, Documento, TipoJuridico, Resultado, Complemento : String;
    Ano, Mes, Dia : word;

    Item                      : integer;
    i                         : byte;
    s,ArqOr,ArqDest,AnoS      : string;
    Compl,TipoJur,ResultadoS  : string[1];
    TipoCaso                  : string[6];
    Codigo,DocumentoS         : string[30];
begin
DM.qItem.Open;

qGeraDocumentoWord.Close;
qGeraDocumentoWord.Parameters.ParamByName('PRO_COD').Value := qProcessoCPGPRO_COD.Value;
qGeraDocumentoWord.Open;


DecodeDate (Date, Ano, Mes, Dia);
AnoA := IntToStr(Ano);
MesA := MesExtenso(Mes);
DiaA := IntToStr(Dia);

if DM.qItem.Locate('ITE_COD', DM.qHistoricoITE_COD.Value, []) = True
then begin
      Item        := DM.qItemITE_COD.Value;
      DocumentoS  := DM.qHistoricoHIS_DOC.Value;
      TipoItem    := DM.qItemITE_ORG.Value;
     end;
ArqDest    := '';
AnoS       := '';
AnoS       := IntToStr(qGeraDocumentoWordPRO_ANO.Value);


if DM.qLocalColeta.Locate('LCO_COD', qProcessoCPGLCO_COD.Value, []) = True
then begin
      if DM.qLocalColetaLCO_TLIE.Value = 2
      then begin
            Compl := 'F'
           end else Compl := '';
    end;

with qGeraDocumentoWord do
begin
  Codigo   := StrZero(FieldbyName('PRO_COD').AsString,5);
  TipoCaso := FieldbyName('CAS_CODIGO').AsString;

  if FieldbyName('PRO_TIPO').AsInteger = 1
  then begin
        TipoJur := 'J'
       end;
  if FieldbyName('PRO_TIPO').AsInteger = 2
  then begin
        TipoJur := 'E'
       end;
  if FieldbyName('PRO_TIPO').AsInteger = 3
  then begin
        TipoJur := 'M'
       end;
  if FieldbyName('PRO_TIPO').AsInteger = 4
  then begin
        TipoJur := 'D'
       end;
  if FieldbyName('PRO_TIPO').AsInteger = 5
  then begin
        TipoJur := 'P'
       end;
  if FieldbyName('PRO_TIPO').AsInteger = 6
  then begin
        TipoJur := 'U'
       end;
  if FieldbyName('PRO_TIPO').AsInteger = 7
  then begin
        TipoJur := 'S'
       end;
  if FieldbyName('PRO_TIPO').AsInteger = 8
  then begin
        TipoJur := 'T'
       end;
  if FieldbyName('PRO_TIPO').AsInteger = 9
  then begin
        TipoJur := 'H'
       end;
  if FieldbyName('PRO_TIPO').AsInteger = 10
  then begin
        TipoJur := 'N'
       end;

      if FieldbyName('PRO_RESUL').AsInteger = 1 then
        ResultadoS := 'P'
      else
        ResultadoS := 'N';

      Case Item of
        1 : ArqOr := 'OFPR'+TipoCaso+Compl; { Proposta de Honorários }
        2 : ArqOr := 'OFCOLETA';            { Designação de Data de Coleta }
        3 : begin { Identificaçao das partes e autor. exame }
             ArqOr := 'AUTO'+TipoJur+TipoCaso+Compl;
             ArqDest := 'AUT'+DocumentoS;
           end;
        4 : ArqOr := 'OFCOLREA'; { Termo de comparecimento }
        5 : ArqOr := 'OFNAOCP';  { Termo de NAO comparecimento }
        6 : begin { Laudo }
             ArqOr   := 'L'+TipoJur+ResultadoS+TipoCaso+Compl;
             ArqDest := qGeraDocumentoWordPRO_NUMLAUDO.Value;
           end;
        7 : begin { Termo de Recebimento (EXJD) }
             ArqOr := 'ENTREGA';
             ArqDest := 'ENT'+Codigo;
           end;
        8 : begin { Recibo de pagamento (EXJD) }
             ArqOr := 'RECIBO';
             ArqDest := 'REC'+Codigo;
           end;
        9 : ArqOr := 'OFPRM';    { Proposta com data marcada com juiz }
        10: ArqOr := 'OFRECMAT'; { OF. REC. DE Material colhido fora }
        11: ArqOr := 'OFPRMF';   { Proposta com data e perito auxiliar }
        12: ArqOr := 'OFPRBSB';  { Proposta de honorarios - Brasilia }
        14: ArqOr := 'OFICIO14'; { OFÍCIO DE NEGATIVA DE MARCAÇÃO }
        17: ArqOr := 'OFICIO17'; { OFÍCIOS C/ OBJETIVOS DIVERSOS }
        62: begin
             ArqOr   := 'OFICIO62';
             ArqDest := DocumentoS;
            end; { AGAMENTO PELO ESTADO APÓS ENTREGA DE LAUDO }
        63: begin
             ArqOr   := 'OFICIO63';
             ArqDest := DocumentoS;
            end; { AGAMENTO PELO ESTADO APÓS ENTREGA DE LAUDO }
        51: begin
             ArqOr   := 'SUP051';
             ArqDest := 'SUP' + qGeraDocumentoWordPRO_NUMLAUDO.Value + '_' + DiaA+MesA+AnoA;
            end; //Re-análise para puxar no nome 14/10/2010
        52: ArqOr := 'OFICIOEXUMACAO'; { OFÍCIOS EXUMACAO }
        53: ArqOr := 'ofexdevolucao'; { OFÍCIOS EXUMACAO DEVOLUÇÃO DOS OSSOS }
        66 : begin { Laudo }
             ArqOr   := 'L'+ResultadoS+'RESUMIDO';
             ArqDest := qGeraDocumentoWordPRO_NUMLAUDO.Value;
           end;
        18: begin                { Laudo Eritrocitario }
              ArqOr   := 'L'+TipoJur+'ERIT'+Compl;
              ArqDest := DocumentoS;
            end;
        999: begin { Resultado }
               ArqOr   := 'RES01';
               ArqDest := 'RES'+qGeraDocumentoWordPRO_NUMLAUDO.Value;
             end
             else
            ArqOr   := 'SUP'+Strzero(InttoStr(Item),3);
            ArqDest := 'SUP'+qGeraDocumentoWordPRO_NUMLAUDO.Value;
       end;
    end;

    if (ArqDest = '') then
    begin
     ArqDest := 'OUT' + DocumentoS;
    end;

    DefinePastaGravacao := '';

    CaminhoPastaGravacao:= '';
    Application.CreateForm(TfExpWord, fExpWord);
    with fExpWord do
    begin
      if DM.qItem.Locate('ITE_COD', DM.qHistoricoITE_COD.Value, []) = True
      then begin
            fExpWord.LabelItem.Caption := DM.qItemITE_DESC.Value;
            DefinePastaGravacao        := DM.qItemITE_ORG.Value;
           end;
      //Modelos a ser utilizado
  	  LabelDoc.Caption  := ArqOr + '.DOC';

      if (DefinePastaGravacao = '')
      then begin
            CaminhoPastaGravacao := DM.qParametrosPAM_DIRINTEGRAOF.Value + DocumentoS;
            CriarAtalhosPastaIntegracao(CaminhoPastaGravacao +'.DOC', DM.qParametrosPAM_DIRINTEGRADOC.Value + qGeraDocumentoWordPRO_NUMLAUDO.Value + '\',DocumentoS);
           end else CaminhoPastaGravacao := DM.qParametrosPAM_DIRINTEGRADOC.Value + qGeraDocumentoWordPRO_NUMLAUDO.Value + '\' + ArqDest;

      fExpWord.NomeMuda := '';
      EditArqDest.Text  := CaminhoPastaGravacao +'.DOC';
      fExpWord.NomeMuda := CaminhoPastaGravacao +'.DOCX';

      fExpWord.ShowModal;
      fExpWord.Free;
    end;
end;

procedure TfProcessos.tbHistoricoShow(Sender: TObject);
begin
//  CriarDiretorio;
  bbtWord.Enabled      := True;
  tbHonorarios.Enabled := False;
  gbGrid.Enabled       := True;
end;

procedure TfProcessos.tbCamposShow(Sender: TObject);
begin
  bbtWord.Enabled := False;
  tbHonorarios.Enabled := False;

  qProcessoCPG.Open;
  qSelEstado.Open;

  qSelComarca.Close;
  qSelComarca.Parameters.ParamByName('UF_SIGLA').Value := qProcessoCPGUF_SIGLA.Value;
  qSelComarca.Open;

  qSelVaras.Close;
  qSelVaras.Parameters.ParamByName('UF_SIGLA').Value := qProcessoCPGUF_SIGLA.Value;
  qSelVaras.Parameters.ParamByName('COM_COD').Value  := qProcessoCPGCOM_COD.Value;
  qSelVaras.Open;

  qSelJuiz.Open;
end;

procedure TfProcessos.bbtConsultarClick(Sender: TObject);
begin
  Application.CreateForm(TfConsultaCPG,fConsultaCPG);
  fConsultaCPG.ShowModal;
  fConsultaCPG.Free;
end;

procedure TfProcessos.BitBtn6Click(Sender: TObject);
begin
ds_Parcelamento.DataSet.First;
end;

procedure TfProcessos.BitBtn7Click(Sender: TObject);
begin
ds_Parcelamento.DataSet.Prior;
end;

procedure TfProcessos.BitBtn8Click(Sender: TObject);
begin
ds_Parcelamento.DataSet.Next;
end;

procedure TfProcessos.BitBtn9Click(Sender: TObject);
begin
ds_Parcelamento.DataSet.Last;
end;

procedure TfProcessos.bbtNovoClick(Sender: TObject);
begin

with qControlaAuditoria do
begin
Close;
SQL.Clear;
SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;;
Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
Parameters.ParamByName('Data').Value     := Date;
Parameters.ParamByName('Hora').Value     := TimeToStr(Time);
Parameters.ParamByName('Execucao').Value := 'Apertou o Botão NOVO FINANCEIRO';
ExecSQL;
end;

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
end;

procedure TfProcessos.bbtSalvarClick(Sender: TObject);
Var Contador     : Integer;
    ValorParcela : Real;
begin
//Parcelamento do Pagamento
if ComboBoxParcelas.Text <> '0'
then begin
      Contador := 1;
      if (ComboBoxTipoPagamento.Text = 'GRATUITO')
      then begin
            ValorParcela := 0;
           end else begin
                      ValorParcela := (RxCalcEditValor.Value) / StrToInt(ComboBoxParcelas.Text);
                    end;
      while Contador <= StrToInt(ComboBoxParcelas.Text) do
       begin
        DM.qParcelamento.Last;
        DM.qParcelamento.Append;
        DM.qParcelamentoPRO_COD.Value    := qProcessoCPGPRO_COD.Value;
        DM.qParcelamentoPAR_TPPG.Value   := ComboBoxTipoPagamento.Text;
        DM.qParcelamentoPAR_NPARC.Value  := Contador;
        DM.qParcelamentoPAR_VLR.Value    := ValorParcela;
        DM.qParcelamentoPAR_OBS.Value    := EdtObservacao.Text;
        DM.qParcelamentoPAR_NMFOR.Value  := EdtFornecedor.Text;
        if Contador = 1
        then begin
              DM.qParcelamentoPAR_DATA.Value  := Date;
             end else begin
                       DM.qParcelamentoPAR_DATA.Value  := Date + (30 * (Contador - 1));
                      end;

        DM.qParcelamentoPAR_SIT.Value   := 1;

        DM.qParcelamento.Post;
        Contador := Contador + 1;
        DM.qParcelamento.Next;
      end;
     end;
// Termino do Parcelamento

DM.qParcelamento.Close;
DM.qParcelamento.Open;
DM.qParcelamento.Last;

bbtsalvar.Enabled   := false;
bbtcancelar.Enabled := false;
bbtNovo.Enabled     := true;
bbtExcluir.Enabled  := true;

ComboBoxTipoPagamento.ItemIndex := -1;
RxCalcEditValor.Value           := 0;
EdtObservacao.Text              := '';


end;

procedure TfProcessos.bbtCancelarClick(Sender: TObject);
begin
ds_Parcelamento.DataSet.Cancel;

bbtsalvar.Enabled   := false;
bbtcancelar.Enabled := false;
bbtNovo.Enabled   := true;
bbtExcluir.Enabled  := true;

ComboBoxTipoPagamento.ItemIndex := -1;
RxCalcEditValor.Value           := 0;
EdtObservacao.Text              := '';
end;

procedure TfProcessos.bbtExcluirClick(Sender: TObject);
begin

with qControlaAuditoria do
begin
 Close;
 SQL.Clear;
 SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
 Parameters.ParamByName('Processo').Value := DM.qParcelamentoPRO_COD.Value;
 Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
 Parameters.ParamByName('Data').Value     := Date;
 Parameters.ParamByName('Hora').Value     := Time;
 Parameters.ParamByName('Execucao').Value := 'EXCLUI DADOS DO FINANCEIRO';
 Parameters.ParamByName('Campo').Value    := 'Caso: ' + IntToStr(DM.qParcelamentoPRO_COD.Value) + ' / ' + 'Parcela: ' + IntToStr(DM.qParcelamentoPAR_NPARC.Value) + ' / ' + 'Valor: ' + FloatToStr(DM.qParcelamentoPAR_VLR.Value) + ' / ' + 'Tipo Pagamento: ' + (DM.qParcelamentoPAR_TPPG.Value);
 ExecSQL;
end;


ds_Parcelamento.DataSet.Delete;

ComboBoxTipoPagamento.ItemIndex := -1;
RxCalcEditValor.Value           := 0;
EdtObservacao.Text              := '';

end;

procedure TfProcessos.bbtPagamentoClick(Sender: TObject);
begin
  tbHonorarios.TabVisible := True;
  pc.ActivePageIndex := 2;
  DM.qParcelamento.Open;
  tbHonorarios.Enabled := True;
  with qManutencaoParcelamento do
  begin
      SQL.Clear;
      SQL.Add('SELECT * FROM tb_PARCELAS WHERE PRO_COD = '+ IntToStr(qProcessoCPGPRO_COD.Value));
      Open;
      DM.qParcelamento.Open;
  end;

  if DM.qCasos.Locate('CAS_CODIGO', qProcessoCPGCAS_CODIGO.Value, []) = True
  then begin
        RxCalcEdit1.Enabled := True;
        RxCalcEdit1.Value   := (DM.qCasosCAS_VLR.Value);
        RxCalcEdit1.Enabled := False;
        bbtNovo.SetFocus;
       end;
end;

procedure TfProcessos.DBGridPagDblClick(Sender: TObject);
begin
 Application.CreateForm(TfParcelamento, fParcelamento);
 fParcelamento.ShowModal;
 fParcelamento.Free;
end;

procedure TfProcessos.DBGrid_COADblClick(Sender: TObject);
begin
 if qProcessoCPG.State in [dsEdit, dsInsert]
 then begin
       qProcessoCPG.Post;
       Application.CreateForm(TfColetadorAdicional, fColetadorAdicional);
       fColetadorAdicional.ShowModal;
       fColetadorAdicional.Free;
      end else begin
                Application.CreateForm(TfColetadorAdicional, fColetadorAdicional);
                fColetadorAdicional.ShowModal;
                fColetadorAdicional.Free;
               end;
end;

procedure TfProcessos.MenuItem4Click(Sender: TObject);
begin
 Application.CreateForm(TfEmissaoRelFinanceiro, fEmissaoRelFinanceiro);
 fEmissaoRelFinanceiro.ShowModal;
 fEmissaoRelFinanceiro.Free;
end;

procedure TfProcessos.MenuItem2Click(Sender: TObject);
begin
 Application.CreateForm(TfEmissaoEtiquetas, fEmissaoEtiquetas);
 fEmissaoEtiquetas.ShowModal;
 fEmissaoEtiquetas.Free;
end;

procedure TfProcessos.PagamentoColetadores1Click(Sender: TObject);
begin
 Application.CreateForm(TfGeraValorColetadores, fGeraValorColetadores);
 fGeraValorColetadores.ShowModal;
 fGeraValorColetadores.Free;
end;

procedure TfProcessos.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
key:=#0;
Perform(WM_NEXTDLGCTL,0,0);
end;
end;

procedure TfProcessos.ipodeCasoPreo1Click(Sender: TObject);
begin
 Application.CreateForm(TfCasoPreco, fCasoPreco);
 fCasoPreco.ShowModal;
 fCasoPreco.Free;
end;

procedure TfProcessos.sbLaudosPendendesClick(Sender: TObject);
begin
 Application.CreateForm(TfRelLaudosPendentes, fRelLaudosPendentes);
 fRelLaudosPendentes.VemdeOnde := 'Processo';
 fRelLaudosPendentes.QuickRep1.Preview;
 fRelLaudosPendentes.Free;
end;

procedure TfProcessos.BitBtn1Click(Sender: TObject);
begin
pc.ActivePageIndex := 0;
tbHonorarios.Enabled := False;
tbHonorarios.TabVisible := False;
end;

procedure TfProcessos.bbtAbrirClick(Sender: TObject);
begin
  Application.CreateForm(TfConsultaPericia,fConsultaPericia);
  fConsultaPericia.ShowModal;
  fConsultaPericia.Free;

  qSelComarca.Close;
  qSelComarca.Parameters.ParamByName('UF_SIGLA').Value := qProcessoCPGUF_SIGLA.Value;
  qSelComarca.Open;

  qSelVaras.Close;
  qSelVaras.Parameters.ParamByName('UF_SIGLA').Value := qProcessoCPGUF_SIGLA.Value;
  qSelVaras.Parameters.ParamByName('COM_COD').Value  := qProcessoCPGCOM_COD.Value;
  qSelVaras.Open;
end;

procedure TfProcessos.DBEdit11Exit(Sender: TObject);
begin
qSelJuiz.Close;
qSelJuiz.Open;

if qProcessoCPGVAR_COD.Value = 0
then begin
      qProcessoCPGJUI_COD.Value := 0;
     end else qProcessoCPGJUI_COD.Value := qSelVarasJUI_COD.Value;
end;

procedure TfProcessos.BitBtn4Click(Sender: TObject);
begin
pc.ActivePageIndex := 0;
end;

procedure TfProcessos.BitBtn13Click(Sender: TObject);
var proximo:integer;
begin
  DM.qMaxDadosProcesso.Close;
  DM.qMaxDadosProcesso.Open;
  Proximo:=DM.qMaxDadosProcessoMAX.Value + 1;
  DM.DS_DadosProcesso.DataSet.Append;
  DM.qDadosProcessoDPR_COD.Value := proximo;
  DM.qDadosProcessoPRO_COD.Value := qProcessoCPGPRO_COD.Value;
  DBComboBox1.SetFocus;

  BitBtn13.Enabled := False;
  BitBtn2.Enabled  := False;
  BitBtn4.Enabled  := False;
  BitBtn3.Enabled  := True;
end;
procedure TfProcessos.BitBtn2Click(Sender: TObject);
begin
  DM.DS_DadosProcesso.DataSet.Edit;
  BitBtn13.Enabled := False;
  BitBtn2.Enabled  := False; //editar
  BitBtn4.Enabled  := False;
  BitBtn3.Enabled  := True;
end;

procedure TfProcessos.BitBtn3Click(Sender: TObject);
begin
  DM.DS_DadosProcesso.DataSet.Post;
  BitBtn13.Enabled := True;
  BitBtn2.Enabled  := True; //editar
  BitBtn4.Enabled  := True;
  BitBtn3.Enabled  := False;

end;

procedure TfProcessos.DBComboBox1Exit(Sender: TObject);
begin
DMR.qBuscaDadosPessoasProcesso.Close;
DMR.qBuscaDadosPessoasProcesso.Parameters.ParamByName('PROCESSO').Value  := qProcessoCPGPRO_COD.Value;
DMR.qBuscaDadosPessoasProcesso.Open;

if DBComboBox1.ItemIndex = 0
then begin
      if DMR.qBuscaDadosPessoasProcesso.Locate('PES_SIT', 2, []) = True
      then begin
            DM.qDadosProcessoREQTE.Value := DMR.qBuscaDadosPessoasProcessoPES_NOME.Value;
           end;
      if DMR.qBuscaDadosPessoasProcesso.Locate('PES_SIT', 0, []) = True
      then begin
            DM.qDadosProcessoREQDO.Value := DMR.qBuscaDadosPessoasProcessoPES_NOME.Value;
           end;
     end;

if DBComboBox1.ItemIndex = 1
then begin
      if DMR.qBuscaDadosPessoasProcesso.Locate('PES_SIT', 0, []) = True
      then begin
            DM.qDadosProcessoREQTE.Value := DMR.qBuscaDadosPessoasProcessoPES_NOME.Value;
           end;
      if DMR.qBuscaDadosPessoasProcesso.Locate('PES_SIT', 2, []) = True
      then begin
            DM.qDadosProcessoREQDO.Value := DMR.qBuscaDadosPessoasProcessoPES_NOME.Value;
           end;
     end;

if DBComboBox1.ItemIndex = 2
then begin
      if DMR.qBuscaDadosPessoasProcesso.Locate('PES_SIT', 0, []) = True
      then begin
            DM.qDadosProcessoREQTE.Value := DMR.qBuscaDadosPessoasProcessoPES_NOME.Value;
           end;
      if DMR.qBuscaDadosPessoasProcesso.Locate('PES_SIT', 2, []) = True
      then begin
            DM.qDadosProcessoREQDO.Value := DMR.qBuscaDadosPessoasProcessoPES_NOME.Value;
           end;
     end;

if DBComboBox1.ItemIndex = 3
then begin
      DM.qDadosProcessoREQTE.Value := 'MINISTÉRIO PÚBLICO';
      if DMR.qBuscaDadosPessoasProcesso.Locate('PES_SIT', 0, []) = True
      then begin
            DM.qDadosProcessoREQDO.Value := DMR.qBuscaDadosPessoasProcessoPES_NOME.Value;
           end;
     end;

end;

procedure TfProcessos.TabSheet1Show(Sender: TObject);
begin
 bbtWord.Enabled := False;
 tbHonorarios.Enabled := False;
 BitBtn13.SetFocus;
end;

procedure TfProcessos.Image1Click(Sender: TObject);
var proximo:integer;
begin
  DM.qMaxHistorico.Close;
  DM.qMaxHistorico.Open;
  Proximo:=DM.qMaxHistoricoMAX.Value + 1;
  DM.qHistorico.Append;
  DM.qHistoricoHIS_CONTR.Value := Proximo;
  DM.qHistoricoHIS_DATA.Value  := Date;
  DM.qHistoricoPRO_COD.Value   := qProcessoCPGPRO_COD.Value;
  DM.qHistoricoITE_COD.Value   := 3;
  DM.qHistoricoHIS_DOC.Value   := IntToStr(qProcessoCPGPRO_COD.Value);
  DM.qHistorico.Post;

  if messagedlg('Dados já foram gravados no Histórico. Deseja emitir o Documento??',mtconfirmation,[mbyes,mbno],0) = mryes
  then begin
        GeraDocumento := 'Sim';
        with qControlaAuditoria do
        begin
        Close;
        SQL.Clear;
        SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
        Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;;
        Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
        Parameters.ParamByName('Data').Value     := Date;
        Parameters.ParamByName('Hora').Value     := TimeToStr(Time);
        Parameters.ParamByName('Execucao').Value := 'Apertou o Botão GERAR TERMO DE IDENTIFICAÇÃO';
        ExecSQL;
        end;
        bbtWord.Click;
       end;

end;

procedure TfProcessos.Image2Click(Sender: TObject);
var proximo:integer;
begin
if qProcessoCPGCAS_CODIGO.Value = 'PD0101'
then begin
      DM.qMaxHistorico.Close;
      DM.qMaxHistorico.Open;
      Proximo:=DM.qMaxHistoricoMAX.Value + 1;
      DM.qHistorico.Append;
      DM.qHistoricoHIS_CONTR.Value := Proximo;
      DM.qHistoricoHIS_DATA.Value  := Date;
      DM.qHistoricoPRO_COD.Value   := qProcessoCPGPRO_COD.Value;
      if qProcessoCPGLCO_COD.Value = 208
      then begin
            DM.qHistoricoITE_COD.Value   := 48;
           end else DM.qHistoricoITE_COD.Value   := 26;
      DM.qHistoricoHIS_DOC.Value   := IntToStr(qProcessoCPGPRO_COD.Value);
      DM.qHistorico.Post;

      if messagedlg('Dados já foram gravados no Histórico. Deseja emitir o Documento??',mtconfirmation,[mbyes,mbno],0) = mryes
      then begin
            GeraDocumento := 'Sim';
            with qControlaAuditoria do
            begin
            Close;
            SQL.Clear;
            SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
            Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;;
            Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
            Parameters.ParamByName('Data').Value     := Date;
            Parameters.ParamByName('Hora').Value     := TimeToStr(Time);
            Parameters.ParamByName('Execucao').Value := 'Apertou o Botão GERAR FOLHA DE RESULTADOS';
            ExecSQL;
            end;
            bbtWord.Click;
           end;
    end else begin
              if qProcessoCPGCAS_CODIGO.Value = 'PD0201'
              then begin
                    DM.qMaxHistorico.Close;
                    DM.qMaxHistorico.Open;
                    Proximo:=DM.qMaxHistoricoMAX.Value + 1;
                    DM.qHistorico.Append;
                    DM.qHistoricoHIS_CONTR.Value := Proximo;
                    DM.qHistoricoHIS_DATA.Value  := Date;
                    DM.qHistoricoPRO_COD.Value   := qProcessoCPGPRO_COD.Value;
                    if qProcessoCPGLCO_COD.Value = 208
                    then begin
                          DM.qHistoricoITE_COD.Value   := 49;
                         end else DM.qHistoricoITE_COD.Value   := 27;
                    DM.qHistoricoHIS_DOC.Value   := IntToStr(qProcessoCPGPRO_COD.Value);
                    DM.qHistorico.Post;

                    if messagedlg('Dados já foram gravados no Histórico. Deseja emitir o Documento??',mtconfirmation,[mbyes,mbno],0) = mryes
                    then begin
                          GeraDocumento := 'Sim';
                          bbtWord.Click;
                         end;
                   end else ShowMessage('Favor incluir manualmente, porque é um tipo de folha de resultados diferente');
            end;

end;

procedure TfProcessos.Image3Click(Sender: TObject);
var proximo:integer;
    Ano, Mes, Dia : Word;
    AnoAtual : String;
begin

DecodeDate(Date, Ano, Mes, Dia);
AnoAtual := IntToStr(Ano);

if (qProcessoCPGPRO_RESUL.Value = 3) or (qProcessoCPGPRO_RESUL.Value = 4)
then begin
      ShowMessage('Laudo não pde ser emitido. Favor verificar o Campo RESULTADO!!!!!.')
     end else begin
               DM.qMaxHistorico.Close;
               DM.qMaxHistorico.Open;
               Proximo:=DM.qMaxHistoricoMAX.Value + 1;
               DM.qHistorico.Append;
               DM.qHistoricoHIS_CONTR.Value := Proximo;
               DM.qHistoricoHIS_DATA.Value  := Date;
               DM.qHistoricoPRO_COD.Value   := qProcessoCPGPRO_COD.Value;
               DM.qHistoricoITE_COD.Value   := 6;
               DM.qHistoricoHIS_DOC.Value   := qProcessoCPGPRO_NUMLAUDO.Value;
               DM.qHistorico.Post;

               if messagedlg('Dados já foram gravados no Histórico. Deseja emitir o Documento??',mtconfirmation,[mbyes,mbno],0) = mryes
               then begin
                     GeraDocumento := 'Sim';
                     with qControlaAuditoria do
                     begin
                     Close;
                     SQL.Clear;
                     SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
                     Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;;
                     Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
                     Parameters.ParamByName('Data').Value     := Date;
                     Parameters.ParamByName('Hora').Value     := TimeToStr(Time);
                     Parameters.ParamByName('Execucao').Value := 'Apertou o Botão GERAR LAUDO';
                     ExecSQL;
                     end;
                     bbtWord.Click;
                    end;
             end;
end;

procedure TfProcessos.RxDBComboBox3Exit(Sender: TObject);
begin
if RxDBComboBox3.ItemIndex = 7
then begin
      ShowMessage('O Tipo "PROMOTORIA DE JUSTIÇA" NÃO deve ser mais usado, e sim "MINISTÉRIO PÚBLICO"');
      RxDBComboBox3.ItemIndex := 2;
     end;
if RxDBComboBox3.ItemIndex = 0
then begin
      Label10.Enabled           := True;
      JvDBMaskEdit_Auto.Enabled := True;
      Label40.Enabled   := False;
      DBEdit32.Enabled  := False;
      DBEdit8.SetFocus;
     end else begin
               Label10.Enabled           := False;
               JvDBMaskEdit_Auto.Enabled := False;
               Label40.Enabled  := True;
               DBEdit32.Enabled := True;
              end;
end;

procedure TfProcessos.RxDBComboBoxResultadoExit(Sender: TObject);
begin
if RxDBComboBoxResultado.ItemIndex =  0
then begin
      Label1.Enabled   := True;
      DBEdit16.Enabled := True;
      qProcessoCPGPRO_PROB.Value := '99,999999XXX';
      DBEdit16.SetFocus;
     end else begin
               Label1.Enabled   := False;
               DBEdit16.Enabled := False;
              end;
end;

procedure TfProcessos.EmissodeKits1Click(Sender: TObject);
begin
  Application.CreateForm(TfEmissaoKits,fEmissaoKits);
  fEmissaoKits.ShowModal;
  fEmissaoKits.Free;
end;

procedure TfProcessos.EnvioLaboratrioExterno1Click(Sender: TObject);
begin
  Application.CreateForm(TfEnvioCasosExternos,fEnvioCasosExternos);
  fEnvioCasosExternos.ShowModal;
  fEnvioCasosExternos.Free;
end;

procedure TfProcessos.BaixadeKits1Click(Sender: TObject);
begin
  Application.CreateForm(TfConsultaKits,fConsultaKits);
  fConsultaKits.ShowModal;
  fConsultaKits.Free;
end;

Function TfProcessos.DoisAnteriorDiaUtil (dData : TDateTime) : TDateTime;
begin
if DayOfWeek(dData) = 7 then
dData := dData + 2
else
if DayOfWeek(dData) = 1 then
dData := dData + 1;
DoisAnteriorDiaUtil := dData;
end;

procedure TfProcessos.RxDBLookupComboVaraExit(Sender: TObject);
begin
qSelJuiz.Close;
qSelJuiz.Open;

if qProcessoCPGVAR_COD.Value = 0
then begin
      qProcessoCPGJUI_COD.Value := 0;
     end else qProcessoCPGJUI_COD.Value := qSelVarasJUI_COD.Value;
end;

procedure TfProcessos.bbtPessoasClick(Sender: TObject);
begin
 if DSP.DataSet.State in [dsinsert, dsedit]
 then begin
       qProcessoCPG.Post;
       Application.CreateForm(TfPessoas, fPessoas);
       fPessoas.ShowModal;
       fPessoas.Free;
       DM.qPessoas.Open;
       DM.qPessoasGrid.Close;
       DM.qPessoasGrid.Open;
       qProcessoCPG.Edit;
      end else ShowMessage(' Tela não pode ser utilizada porque o registro não está em edição.')
      end;

procedure TfProcessos.RxDBComboBoxResultadoClick(Sender: TObject);
begin
if RxDBComboBoxResultado.ItemIndex =  0
then begin
      Label1.Enabled   := True;
      DBEdit16.Enabled := True;
      qProcessoCPGPRO_PROB.Value := '99,999999XXX';
      DBEdit16.SetFocus;
     end else begin
               Label1.Enabled   := False;
               DBEdit16.Enabled := False;
              end;
end;

procedure TfProcessos.DBEdit7Exit(Sender: TObject);
begin
 qSelComarca.Close;
 qSelComarca.Open;
end;

procedure TfProcessos.DBLookupComboBox2Exit(Sender: TObject);
begin
 qSelComarca.Close;
 qSelComarca.Open;
end;

procedure TfProcessos.DBEdit8Exit(Sender: TObject);
begin
qSelVaras.Close;
qSelVaras.Open;
end;

procedure TfProcessos.RxDBLookupComboComarcaExit(Sender: TObject);
begin
qSelVaras.Close;
qSelVaras.Open;
end;

procedure TfProcessos.bbtJuizClick(Sender: TObject);
begin
  Application.CreateForm(TfConsultaJuizes, fConsultaJuizes);
  fConsultaJuizes.Tela := '';
  fConsultaJuizes.Tela := 'Processos';
  fConsultaJuizes.ShowModal;
  fConsultaJuizes.Free;
  DM.qJuiz.Open;
  qSelJuiz.Open;
end;

procedure TfProcessos.RxDBComboBox3Click(Sender: TObject);
begin
if RxDBComboBox3.ItemIndex = 0
then begin
      Label10.Enabled           := True;
      JvDBMaskEdit_Auto.Enabled := True;
      Label40.Enabled   := False;
      DBEdit32.Enabled  := False;
      DBEdit8.SetFocus;
     end else begin
               Label10.Enabled           := False;
               JvDBMaskEdit_Auto.Enabled := False;
               Label40.Enabled  := True;
               DBEdit32.Enabled := True;
              end;
end;

procedure TfProcessos.Pesquisa1Click(Sender: TObject);
begin
  Application.CreateForm(TfPesquisa, fPesquisa);
  fPesquisa.ShowModal;
  fPesquisa.Free;
end;

procedure TfProcessos.QuantidadedeExames1Click(Sender: TObject);
begin
 Application.CreateForm(TfEmissaoRelEnviados, fEmissaoRelEnviados);
 fEmissaoRelEnviados.ShowModal;
 fEmissaoRelEnviados.Free;
end;

procedure TfProcessos.qGeraCapaLCO_CATEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	Case qGeraCapaLCO_CATE.AsInteger of
        0 : Text := 'GERAL';
        1 : Text := 'CONVENIADO ESPECIAL (Lista dos que recebem remuneração)';
        2 : Text := 'LABORATÓRIOS CONVENIADOS (Preços normais e não recebem remuneração)';
        3 : Text := 'LABORATÓRIOS CONVENIADOS ESPECIAIS (Preços especiais e não recebe remuneração)';
        4 : Text := 'OUTROS COLETADORES (Preços normais e não recebem remuneração)';
    end;
end;

procedure TfProcessos.DBGrid5DblClick(Sender: TObject);
var HoraFinal, MinutoFinal, f_NomeSalva : String;
    HoraSoma,  MinutoSoma  : Integer;

begin
  pn_Declaracao.Visible := False;
  f_NomeDoc   := DM.qParametrosPAM_DPADR.Value + 'Declaracao.DOC';
  f_NomeSalva := DM.qParametrosPAM_DIRINTEGRADOC.Value + '\' + qProcessoCPGPRO_NUMLAUDO.Value + '\ATESTADO_'+ qDeclaracaoComparecimentoPES_NOME.Value + '_' + IntToStr(qProcessoCPGPRO_COD.Value) + '.DOC';
//  f_NomeSalva := DM.qParametrosPAM_DIRINTEGRADOC.Value + ' ' + IntToStr(qProcessoCPGPRO_ANO.Value) + '_\' + qProcessoCPGPRO_NUMLAUDO.Value + '\ATESTADO_'+ qDeclaracaoComparecimentoPES_NOME.Value + '_' + IntToStr(qProcessoCPGPRO_COD.Value) + '.DOC';

  DecodeDate (qDeclaracaoComparecimentoPRO_DCOLE.Value, Ano, Mes, Dia);
  AnoA := IntToStr(Ano);
  MesA := fExpWord.MesExtenso(Mes);
  DiaA := IntToStr(Dia);
  if DiaA = IntToStr(1)
  then begin
       DiaA := 'Primeiro';
      end;
     DataDiaColeta := DiaA +' de '+ MesA +' de '+ AnoA;

 if not FileExists( f_NomeDoc )
 then begin
       ShowMessage('::::::::::::::::::::::::::::: ATENÇÃO :::::::::::::::::::::::::::::' + #13+ 'Modelo para geração de dados NÃO existe.' + #13 + 'O caminho correto seria ' + f_NomeDoc);
      end else begin
                      try
                       waWord.Connect;
                       waWord.Visible := True;
                       wdDoc.ConnectTo(waWord.Documents.Open(f_NomeDoc, EmptyParam, f_True, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam));

                       wdDoc.SaveAs(f_NomeSalva);

                       f_Var   := '<DTCOLETA>';
                       f_Troca := DataDiaColeta;
                       while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                       f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                       f_Var := f_Var;

                       f_Var   := '<PESSOAS>';
                       f_Troca := qDeclaracaoComparecimentoPES_NOME.Value;
                       while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                       f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                       f_Var := f_Var;

                       f_Var   := '<TIPO>';
                       if qDeclaracaoComparecimentoSIT_NM.Value = 'MÃE'
                       then begin
                             f_Troca := 'a Senhora';
                            end else begin
                                      if qDeclaracaoComparecimentoSIT_NM.Value = 'SUPAI'
                                      then begin
                                            f_Troca := 'o Senhor';
                                           end else begin
                                                     if qDeclaracaoComparecimentoSIT_NM.Value = 'CRIANÇA'
                                                     then begin
                                                           f_Troca := 'a criança';
                                                          end else f_Troca := 'o(a) Senhor(a)';
                                                    end;      
                                     end;

                       while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                       f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                       f_Var := f_Var;

                       HoraFinal := qDeclaracaoComparecimentoPRO_HCOLE.Value[1] + qDeclaracaoComparecimentoPRO_HCOLE.Value[2];
                       HoraSoma  := StrToInt(HoraFinal) + 1;

                       f_Var   := '<HORA>';
                       f_Troca := qDeclaracaoComparecimentoPRO_HCOLE.Value[1] + qDeclaracaoComparecimentoPRO_HCOLE.Value[2];
                       while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                       f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                       f_Var := f_Var;

                       f_Var   := '<MINUTO>';
                       f_Troca := qDeclaracaoComparecimentoPRO_HCOLE.Value[4] + qDeclaracaoComparecimentoPRO_HCOLE.Value[5];
                       while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                       f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                       f_Var := f_Var;

                       f_Var   := '<HORAFINAL>';
                       f_Troca := IntToStr(HoraSoma);
                       while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                       f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                       f_Var := f_Var;

                       f_Var   := '<MINUTOFINAL>';
                       f_Troca := qDeclaracaoComparecimentoPRO_HCOLE.Value[4] + qDeclaracaoComparecimentoPRO_HCOLE.Value[5];
                       while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                       f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                       f_Var := f_Var;

                       f_Var   := '<RESPONSAVEL>';
                       f_Troca := UpperCase(InputBox('Geração da Atestado de Comparecimento', 'Nome do RESPONSÁVEL pela Assinatura:', ''));
                       while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
                       f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
                       f_Var := f_Var;

                       wdDoc.Save;

                     except
                      wdDoc.PrintOut(f_False, f_False, f_False);
                      waWord.Quit(f_False, f_False, f_False);
                      Application.MessageBox('Erro ao tentar abrir o modelo de documento.!', 'Mensagem', mb_iconInformation);
                      end;

                    { Retirado em 13/05/2026
                    ShowMessage('Nesse momento existe um DOCUMENTO gerado na barra de tarefas. ' + #13 + 'Trabalhe normalmente nele e quando terminar de editar o documento e imprimir.' +
                    #13 + #13 + 'Pressione OK para encerrar o documento.' + #13 + #13 + 'Atenção: Não precisa fechar o Word. Pressionando OK ele fecha automaticamente!!!');
                    f_false := False;
                    waWord.Quit(f_False, f_False, f_False);
                    waWord.Disconnect;
                    }
       end;
end;

procedure TfProcessos.Image5Click(Sender: TObject);
begin
  qDeclaracaoComparecimento.Close;
  qDeclaracaoComparecimento.Parameters.ParamByName('Pericia').Value := qProcessoCPGPRO_COD.Value;
  qDeclaracaoComparecimento.Open;

  with qControlaAuditoria do
  begin
  Close;
  SQL.Clear;
  SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
  Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;;
  Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
  Parameters.ParamByName('Data').Value     := Date;
  Parameters.ParamByName('Hora').Value     := TimeToStr(Time);
  Parameters.ParamByName('Execucao').Value := 'Apertou o Botão GERAR ATESTADO';
  ExecSQL;
  end;

  pn_Declaracao.Visible := True;
end;

procedure TfProcessos.sbResultadoExcelClick(Sender: TObject);
var excel :variant;
    MesGerando, VerificaMensagem, Probabilidade : String;
    i, Linha, NumeroSheets  : Integer ;
begin
try
if qProcessoCPGCAS_CODIGO.Value = 'PD0101'
then begin
      Excel_CasoPD0101;
     end else begin
               if qProcessoCPGCAS_CODIGO.Value = 'PD0201'
               then begin
                     Excel_CasoPD0201;
                    end else begin
                              if qProcessoCPGCAS_CODIGO.Value = 'RD0301'
                              then begin
                                    Excel_CasoRD0301;
                                   end else showmessage(' Não existe implementação para esse Tipo de Casos');
                             end;
              end;
except
showmessage('         :::::::::::::::: Problema na criação/leitura do arquivo XLS/XLSX ::::::::::::::::::::');
end;
end;

Function TfProcessos.Excel_CasoPD0101;
var excel :variant;
    MesGerando, VerificaMensagem, Probabilidade, Arquivo, f_NomePDF : String;
    i, Linha, NumeroSheets  : Integer ;
begin

excel := CreateOleObject('Excel.Application');
if not Excel.Application.Visible then

Arquivo := DM.qParametrosPAM_DREXCEL.Value + IntToStr(qProcessoCPGPRO_COD.Value) + '.xls';
if FileExists(Arquivo)
then begin
      Excel.WorkBooks.Open(DM.qParametrosPAM_DREXCEL.Value + IntToStr(qProcessoCPGPRO_COD.Value) + '.xls');
     end else begin
               Arquivo := DM.qParametrosPAM_DREXCEL.Value + IntToStr(qProcessoCPGPRO_COD.Value) + '.xlsx';
               if FileExists(Arquivo)
               then begin
                     Excel.WorkBooks.Open(DM.qParametrosPAM_DREXCEL.Value + IntToStr(qProcessoCPGPRO_COD.Value) + '.xlsx');
                    end else  Excel.WorkBooks.Open(DM.qParametrosPAM_DREXCEL.Value + IntToStr(qProcessoCPGPRO_COD.Value) + '.xlsm');
             end;

qVerificaExisteAlelo.Close;
qVerificaExisteAlelo.Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
qVerificaExisteAlelo.Open;

qTipoPlanilha.Close;
qTipoPlanilha.Parameters.ParamByName('Numero').Value := qProcessoCPGPRO_COD.Value;
qTipoPlanilha.Open;

//FUSION 6C
if ((Trim(qTipoPlanilhaTIPO.Value) = 'FUSION') or (Trim(qTipoPlanilhaTIPO.Value) = 'FUSION6C'))
then begin
      NumeroSheets := 2;

      //Busca Dados EXCEL
      VerificaMensagem := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[46,33];
      if (VerificaMensagem = 'VÍNCULO BIOLOGICAMENTE PROVADO') or (VerificaMensagem = 'POSITIVO')
      then begin
            qProcessoCPG.Edit;
            qProcessoCPGPRO_RESUL.Value := 1;
            Probabilidade := FloatToStr(StrToFloat(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[44,33])*100);
            if Length(Probabilidade) < 12
            then begin
                   if Length(Probabilidade) = 11
                   then begin
                         Probabilidade := Probabilidade + '0';
                        end;
                   if Length(Probabilidade) = 10
                   then begin
                         Probabilidade := Probabilidade + '00';
                        end;
                   if Length(Probabilidade) = 9
                   then begin
                         Probabilidade := Probabilidade + '000';
                        end;
                   if Length(Probabilidade) = 8
                   then begin
                         Probabilidade := Probabilidade + '0000';
                        end;
                 end;

            qProcessoCPGPRO_PROB.Value  := Probabilidade;
            qProcessoCPG.Post;
           end else begin
                     qProcessoCPG.Edit;
                     qProcessoCPGPRO_RESUL.Value := 2;
                     qProcessoCPG.Post;
                   end;
      // Fim Busca Dados EXCEL

      //Joga Dados EXCEL
      qDeclaracaoComparecimento.Close;
      qDeclaracaoComparecimento.Parameters.ParamByName('Pericia').Value := qProcessoCPGPRO_COD.Value;
      qDeclaracaoComparecimento.Open;

      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[3,2] := qProcessoCPGPRO_NPERC.Value;

      if qDeclaracaoComparecimento.Locate('SIT_NM', 'MÃE', []) = True
      then begin
            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[4,2] := qDeclaracaoComparecimentoPES_NOME.Value;
           end;

      if qDeclaracaoComparecimento.Locate('SIT_NM', 'SUPAI', []) = True
      then begin
            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[6,2] := qDeclaracaoComparecimentoPES_NOME.Value;
           end;

           if qDeclaracaoComparecimento.Locate('SIT_NM', 'CRIANÇA', []) = True
      then begin
            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[5,2] := qDeclaracaoComparecimentoPES_NOME.Value;
           end;
      //Fim Joga Dados EXCEL
      showmessage('         :::::::::::::::: ATENÇÃO ::::::::::::::::::::' + #13 + #13 + ' Verifique se o campo Probabilidade está correto!!!!');
      f_NomePDF := DM.qParametrosPAM_DRPDF.Value + '\' + IntToStr(qProcessoCPGPRO_COD.Value) + '\' + 'PLANILHA_' + IntToStr(qProcessoCPGPRO_COD.Value) + '.pdf';
      Excel.WorkBooks[1].ExportAsFixedFormat(0, f_NomePDF, EmptyParam, EmptyParam,  EmptyParam, 2, 2, EmptyParam, EmptyParam);
      Excel.Application.Visible := true;
    end;

if ((qVerificaExisteAleloCONTADOR.Value<=0) and (Trim(qTipoPlanilhaTIPO.Value) <> 'FUSION6C'))
then begin
      NumeroSheets := 2;

      //Busca Dados EXCEL
      VerificaMensagem := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[27,33];
      if (VerificaMensagem = 'VÍNCULO BIOLOGICAMENTE PROVADO') or (VerificaMensagem = 'POSITIVO')
      then begin
            qProcessoCPG.Edit;
            qProcessoCPGPRO_RESUL.Value := 1;
            Probabilidade := FloatToStr(StrToFloat(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[25,33])*100);
            if Length(Probabilidade) < 12
            then begin
                   if Length(Probabilidade) = 11
                   then begin
                         Probabilidade := Probabilidade + '0';
                        end;
                   if Length(Probabilidade) = 10
                   then begin
                         Probabilidade := Probabilidade + '00';
                        end;
                   if Length(Probabilidade) = 9
                   then begin
                         Probabilidade := Probabilidade + '000';
                        end;
                   if Length(Probabilidade) = 8
                   then begin
                         Probabilidade := Probabilidade + '0000';
                        end;
                 end;

            qProcessoCPGPRO_PROB.Value  := Probabilidade;
            qProcessoCPG.Post;
           end else begin
                     qProcessoCPG.Edit;
                     qProcessoCPGPRO_RESUL.Value := 2;
                     qProcessoCPG.Post;
                   end;
      // Fim Busca Dados EXCEL

      //Joga Dados EXCEL
      qDeclaracaoComparecimento.Close;
      qDeclaracaoComparecimento.Parameters.ParamByName('Pericia').Value := qProcessoCPGPRO_COD.Value;
      qDeclaracaoComparecimento.Open;

      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[3,2] := qProcessoCPGPRO_NPERC.Value;

      if qDeclaracaoComparecimento.Locate('SIT_NM', 'MÃE', []) = True
      then begin
            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[4,2] := qDeclaracaoComparecimentoPES_NOME.Value;
           end;

      if qDeclaracaoComparecimento.Locate('SIT_NM', 'SUPAI', []) = True
      then begin
            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[6,2] := qDeclaracaoComparecimentoPES_NOME.Value;
           end;

           if qDeclaracaoComparecimento.Locate('SIT_NM', 'CRIANÇA', []) = True
      then begin
            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[5,2] := qDeclaracaoComparecimentoPES_NOME.Value;
           end;
      //Fim Joga Dados EXCEL
      showmessage('         :::::::::::::::: ATENÇÃO ::::::::::::::::::::' + #13 + #13 + ' Verifique se o campo Probabilidade está correto!!!!');
      f_NomePDF := DM.qParametrosPAM_DRPDF.Value + '\' + IntToStr(qProcessoCPGPRO_COD.Value) + '\' + 'PLANILHA_' + IntToStr(qProcessoCPGPRO_COD.Value) + '.pdf';
      Excel.WorkBooks[1].ExportAsFixedFormat(0, f_NomePDF, EmptyParam, EmptyParam,  EmptyParam, 2, 2, EmptyParam, EmptyParam);
      Excel.Application.Visible := true;
// FUSION
    end;

    if (Trim(qTipoPlanilhaTIPO.Value) = 'FUSIONA')
    then begin
              NumeroSheets := 7;

                    //Busca Dados EXCEL
                    VerificaMensagem := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[34,33];
                    if (VerificaMensagem = 'VÍNCULO BIOLOGICAMENTE PROVADO') or (VerificaMensagem = 'POSITIVO')
                    then begin
                          qProcessoCPG.Edit;
                          qProcessoCPGPRO_RESUL.Value := 1;
                          Probabilidade := FloatToStr(StrToFloat(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[32,33])*100);
                          if Length(Probabilidade) < 12
                          then begin
                                 if Length(Probabilidade) = 11
                                 then begin
                                       Probabilidade := Probabilidade + '0';
                                      end;
                                 if Length(Probabilidade) = 10
                                 then begin
                                       Probabilidade := Probabilidade + '00';
                                      end;
                                 if Length(Probabilidade) = 9
                                 then begin
                                       Probabilidade := Probabilidade + '000';
                                      end;
                                 if Length(Probabilidade) = 8
                                 then begin
                                       Probabilidade := Probabilidade + '0000';
                                      end;
                               end;

                          qProcessoCPGPRO_PROB.Value  := Probabilidade;
                          qProcessoCPG.Post;
                         end else begin
                                   qProcessoCPG.Edit;
                                   qProcessoCPGPRO_RESUL.Value := 2;
                                   qProcessoCPG.Post;
                                 end;
                    // Fim Busca Dados EXCEL

                    //Joga Dados EXCEL
                    qDeclaracaoComparecimento.Close;
                    qDeclaracaoComparecimento.Parameters.ParamByName('Pericia').Value := qProcessoCPGPRO_COD.Value;
                    qDeclaracaoComparecimento.Open;

                    Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[3,2] := qProcessoCPGPRO_NPERC.Value;

                    if qDeclaracaoComparecimento.Locate('SIT_NM', 'MÃE', []) = True
                    then begin
                          Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[4,2] := qDeclaracaoComparecimentoPES_NOME.Value;
                         end;

                    if qDeclaracaoComparecimento.Locate('SIT_NM', 'SUPAI', []) = True
                    then begin
                          Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[6,2] := qDeclaracaoComparecimentoPES_NOME.Value;
                         end;

                         if qDeclaracaoComparecimento.Locate('SIT_NM', 'CRIANÇA', []) = True
                    then begin
                          Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[5,2] := qDeclaracaoComparecimentoPES_NOME.Value;
                         end;
                    //Fim Joga Dados EXCEL
                    showmessage('         :::::::::::::::: ATENÇÃO ::::::::::::::::::::' + #13 + #13 + ' Verifique se o campo Probabilidade está correto!!!!');
                    f_NomePDF := DM.qParametrosPAM_DRPDF.Value + '\' + IntToStr(qProcessoCPGPRO_COD.Value) + '\' + 'PLANILHA_' + IntToStr(qProcessoCPGPRO_COD.Value) + '.pdf';
                    Excel.WorkBooks[1].ExportAsFixedFormat(0, f_NomePDF, EmptyParam, EmptyParam,  EmptyParam, 2, 2, EmptyParam, EmptyParam);
                    Excel.Application.Visible := true;

             end;
end;

Function TfProcessos.Excel_CasoPD0201;
var excel :variant;
    MesGerando, VerificaMensagem, Probabilidade, Arquivo, f_NomePDF : String;
    i, Linha, NumeroSheets  : Integer ;
begin
//try
excel := CreateOleObject('Excel.Application');
if not Excel.Application.Visible then


Arquivo := DM.qParametrosPAM_DREXCEL.Value + IntToStr(qProcessoCPGPRO_COD.Value) + '.xls';
if FileExists(Arquivo)
then begin
      Excel.WorkBooks.Open(DM.qParametrosPAM_DREXCEL.Value + IntToStr(qProcessoCPGPRO_COD.Value) + '.xls');
     end else begin
               Arquivo := DM.qParametrosPAM_DREXCEL.Value + IntToStr(qProcessoCPGPRO_COD.Value) + '.xlsx';
               if FileExists(Arquivo)
               then begin
                     Excel.WorkBooks.Open(DM.qParametrosPAM_DREXCEL.Value + IntToStr(qProcessoCPGPRO_COD.Value) + '.xlsx');
                    end else  Excel.WorkBooks.Open(DM.qParametrosPAM_DREXCEL.Value + IntToStr(qProcessoCPGPRO_COD.Value) + '.xlsm');
             end;

qVerificaExisteAlelo.Close;
qVerificaExisteAlelo.Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
qVerificaExisteAlelo.Open;

qTipoPlanilha.Close;
qTipoPlanilha.Parameters.ParamByName('Numero').Value := qProcessoCPGPRO_COD.Value;
qTipoPlanilha.Open;

//FUSION 6C
if ((Trim(qTipoPlanilhaTIPO.Value) = 'FUSION') or (Trim(qTipoPlanilhaTIPO.Value) = 'FUSION6C'))
then begin
      NumeroSheets := 2;

      //Busca Dados EXCEL
      VerificaMensagem := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[49,25];
      if (VerificaMensagem = 'VÍNCULO BIOLOGICAMENTE PROVADO') or (VerificaMensagem = 'POSITIVO')
      then begin
            qProcessoCPG.Edit;
            qProcessoCPGPRO_RESUL.Value := 1;
            Probabilidade := FloatToStr(StrToFloat(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[47,25])*100);
            if Length(Probabilidade) < 12
            then begin
                   if Length(Probabilidade) = 11
                   then begin
                         Probabilidade := Probabilidade + '0';
                        end;
                   if Length(Probabilidade) = 10
                   then begin
                         Probabilidade := Probabilidade + '00';
                        end;
                   if Length(Probabilidade) = 9
                   then begin
                         Probabilidade := Probabilidade + '000';
                        end;
                   if Length(Probabilidade) = 8
                   then begin
                         Probabilidade := Probabilidade + '0000';
                        end;
                 end;

            qProcessoCPGPRO_PROB.Value  := Probabilidade;
            qProcessoCPG.Post;
           end else begin
                     qProcessoCPG.Edit;
                     qProcessoCPGPRO_RESUL.Value := 2;
                     qProcessoCPG.Post;
                   end;
      // Fim Busca Dados EXCEL

      //Joga Dados EXCEL
      qDeclaracaoComparecimento.Close;
      qDeclaracaoComparecimento.Parameters.ParamByName('Pericia').Value := qProcessoCPGPRO_COD.Value;
      qDeclaracaoComparecimento.Open;

      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[5,2] := qProcessoCPGPRO_NPERC.Value;

      if qDeclaracaoComparecimento.Locate('SIT_NM', 'SUPAI', []) = True
      then begin
            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[8,2] := qDeclaracaoComparecimentoPES_NOME.Value;
           end;

           if qDeclaracaoComparecimento.Locate('SIT_NM', 'CRIANÇA', []) = True
      then begin
            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[7,2] := qDeclaracaoComparecimentoPES_NOME.Value;
           end;
      //Fim Joga Dados EXCEL
      showmessage('         :::::::::::::::: ATENÇÃO ::::::::::::::::::::' + #13 + #13 + ' Verifique se o campo Probabilidade está correto!!!!');
      f_NomePDF := DM.qParametrosPAM_DRPDF.Value + '\' + IntToStr(qProcessoCPGPRO_COD.Value) + '\' + 'PLANILHA_' + IntToStr(qProcessoCPGPRO_COD.Value) + '.pdf';
      Excel.WorkBooks[1].ExportAsFixedFormat(0, f_NomePDF, EmptyParam, EmptyParam,  EmptyParam, 2, 2, EmptyParam, EmptyParam);
      Excel.Application.Visible := true;
    end;

if ((qVerificaExisteAleloCONTADOR.Value<=0) and (Trim(qTipoPlanilhaTIPO.Value) <> 'FUSION6C'))
then begin
      NumeroSheets := 2;
      //Busca Dados EXCEL
      VerificaMensagem := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[31,25];
      if (VerificaMensagem = 'VÍNCULO BIOLOGICAMENTE PROVADO') or (VerificaMensagem = 'POSITIVO')
      then begin
            qProcessoCPG.Edit;
            qProcessoCPGPRO_RESUL.Value := 1;
            Probabilidade := FloatToStr(StrToFloat(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[29,25])*100);
            if Length(Probabilidade) < 12
            then begin
                   if Length(Probabilidade) = 11
                   then begin
                         Probabilidade := Probabilidade + '0';
                        end;
                   if Length(Probabilidade) = 10
                   then begin
                         Probabilidade := Probabilidade + '00';
                        end;
                   if Length(Probabilidade) = 9
                   then begin
                         Probabilidade := Probabilidade + '000';
                        end;
                   if Length(Probabilidade) = 8
                   then begin
                         Probabilidade := Probabilidade + '0000';
                        end;
                 end;

            qProcessoCPGPRO_PROB.Value  := Probabilidade;
            qProcessoCPG.Post;
           end else begin
                     qProcessoCPG.Edit;
                     qProcessoCPGPRO_RESUL.Value := 2;
                     qProcessoCPG.Post;
                   end;
      // Fim Busca Dados EXCEL

      //Joga Dados EXCEL
      qDeclaracaoComparecimento.Close;
      qDeclaracaoComparecimento.Parameters.ParamByName('Pericia').Value := qProcessoCPGPRO_COD.Value;
      qDeclaracaoComparecimento.Open;

      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[6,2] := qProcessoCPGPRO_NPERC.Value;

      if qDeclaracaoComparecimento.Locate('SIT_NM', 'SUPAI', []) = True
      then begin
            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[9,2] := qDeclaracaoComparecimentoPES_NOME.Value;
           end;

           if qDeclaracaoComparecimento.Locate('SIT_NM', 'CRIANÇA', []) = True
      then begin
            Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[8,2] := qDeclaracaoComparecimentoPES_NOME.Value;
           end;
      //Fim Joga Dados EXCEL
      showmessage('         :::::::::::::::: ATENÇÃO ::::::::::::::::::::' + #13 + #13 + ' Verifique se o campo Probabilidade está correto!!!!');
      f_NomePDF := DM.qParametrosPAM_DRPDF.Value + '\' + IntToStr(qProcessoCPGPRO_COD.Value) + '\' + 'PLANILHA_' + IntToStr(qProcessoCPGPRO_COD.Value) + '.pdf';
      Excel.WorkBooks[1].ExportAsFixedFormat(0, f_NomePDF, EmptyParam, EmptyParam,  EmptyParam, 2, 2, EmptyParam, EmptyParam);
      Excel.Application.Visible := true;


    // FUSION
    end;

    if (Trim(qTipoPlanilhaTIPO.Value) = 'FUSIONA')
    then begin
              NumeroSheets := 3;
              //Busca Dados EXCEL
              VerificaMensagem := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[38,25];
              if (VerificaMensagem = 'VÍNCULO BIOLOGICAMENTE PROVADO') or (VerificaMensagem = 'POSITIVO')
              then begin
                    qProcessoCPG.Edit;
                    qProcessoCPGPRO_RESUL.Value := 1;
                    Probabilidade := FloatToStr(StrToFloat(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[36,25])*100);
                    if Length(Probabilidade) < 12
                    then begin
                           if Length(Probabilidade) = 11
                           then begin
                                 Probabilidade := Probabilidade + '0';
                                end;
                           if Length(Probabilidade) = 10
                           then begin
                                 Probabilidade := Probabilidade + '00';
                                end;
                           if Length(Probabilidade) = 9
                           then begin
                                 Probabilidade := Probabilidade + '000';
                                end;
                           if Length(Probabilidade) = 8
                           then begin
                                 Probabilidade := Probabilidade + '0000';
                                end;
                         end;

                    qProcessoCPGPRO_PROB.Value  := Probabilidade;
                    qProcessoCPG.Post;
                   end else begin
                             qProcessoCPG.Edit;
                             qProcessoCPGPRO_RESUL.Value := 2;
                             qProcessoCPG.Post;
                           end;
              // Fim Busca Dados EXCEL

              //Joga Dados EXCEL
              qDeclaracaoComparecimento.Close;
              qDeclaracaoComparecimento.Parameters.ParamByName('Pericia').Value := qProcessoCPGPRO_COD.Value;
              qDeclaracaoComparecimento.Open;

              Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[6,2] := qProcessoCPGPRO_NPERC.Value;

              if qDeclaracaoComparecimento.Locate('SIT_NM', 'SUPAI', []) = True
              then begin
                    Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[9,2] := qDeclaracaoComparecimentoPES_NOME.Value;
                   end;

                   if qDeclaracaoComparecimento.Locate('SIT_NM', 'CRIANÇA', []) = True
              then begin
                    Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[8,2] := qDeclaracaoComparecimentoPES_NOME.Value;
                   end;
              //Fim Joga Dados EXCEL
              showmessage('         :::::::::::::::: ATENÇÃO ::::::::::::::::::::' + #13 + #13 + ' Verifique se o campo Probabilidade está correto!!!!');
              f_NomePDF := DM.qParametrosPAM_DRPDF.Value + '\' + IntToStr(qProcessoCPGPRO_COD.Value) + '\' + 'PLANILHA_' + IntToStr(qProcessoCPGPRO_COD.Value) + '.pdf';
              Excel.WorkBooks[1].ExportAsFixedFormat(0, f_NomePDF, EmptyParam, EmptyParam,  EmptyParam, 2, 2, EmptyParam, EmptyParam);
              Excel.Application.Visible := true;
     end;
end;

Function TfProcessos.Excel_CasoRD0301;
var excel :variant;
    MesGerando, VerificaMensagem, Probabilidade, Arquivo, f_NomePDF : String;
    i, Linha, NumeroSheets  : Integer ;
begin
try
excel := CreateOleObject('Excel.Application');
if not Excel.Application.Visible then

Arquivo := DM.qParametrosPAM_DREXCEL.Value + IntToStr(qProcessoCPGPRO_COD.Value) + '.xls';
if FileExists(Arquivo)
then begin
      Excel.WorkBooks.Open(DM.qParametrosPAM_DREXCEL.Value + IntToStr(qProcessoCPGPRO_COD.Value) + '.xls');
     end else Excel.WorkBooks.Open(DM.qParametrosPAM_DREXCEL.Value + IntToStr(qProcessoCPGPRO_COD.Value) + '.xlsx');

qVerificaExisteAlelo.Close;
qVerificaExisteAlelo.Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
qVerificaExisteAlelo.Open;

if (qVerificaExisteAleloCONTADOR.Value<=0)
then begin
      NumeroSheets := 2;
      //Busca Dados EXCEL
      VerificaMensagem := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[28,8];
      if (VerificaMensagem = 'VÍNCULO BIOLOGICAMENTE PROVADO') or (VerificaMensagem = 'PARTERNIDADE PROVADA') or (VerificaMensagem = 'PARTERNIDADE PROVÁVEL') or (VerificaMensagem = 'PATERNIDADE MUITO PROVÁVEL') or (VerificaMensagem = 'PATERNIDADE POSSÍVEL')
      then begin
            qProcessoCPG.Edit;
            qProcessoCPGPRO_RESUL.Value := 1;
            Probabilidade := FloatToStr(StrToFloat(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[26,8])*100);
            if Length(Probabilidade) < 12
            then begin
                   if Length(Probabilidade) = 11
                   then begin
                         Probabilidade := Probabilidade + '0';
                        end;
                   if Length(Probabilidade) = 10
                   then begin
                         Probabilidade := Probabilidade + '00';
                        end;
                   if Length(Probabilidade) = 9
                   then begin
                         Probabilidade := Probabilidade + '000';
                        end;
                   if Length(Probabilidade) = 8
                   then begin
                         Probabilidade := Probabilidade + '0000';
                        end;
                 end;

            qProcessoCPGPRO_PROB.Value  := Probabilidade;
            qProcessoCPG.Post;
           end else begin
                      if (VerificaMensagem = 'PATERNIDADE MUITO REMOTA') or (VerificaMensagem = 'IMPOSSIBILIDADE DE ANÁLISE') or (VerificaMensagem = 'PATERNIDADE POUCO POSSÍVEL')
                      then begin
                            qProcessoCPG.Edit;
                            qProcessoCPGPRO_RESUL.Value := 6;
                            Probabilidade := FloatToStr(StrToFloat(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[26,8])*100);
                            if Length(Probabilidade) < 12
                            then begin
                                   if Length(Probabilidade) = 11
                                   then begin
                                         Probabilidade := Probabilidade + '0';
                                        end;
                                   if Length(Probabilidade) = 10
                                   then begin
                                         Probabilidade := Probabilidade + '00';
                                        end;
                                   if Length(Probabilidade) = 9
                                   then begin
                                         Probabilidade := Probabilidade + '000';
                                        end;
                                   if Length(Probabilidade) = 8
                                   then begin
                                         Probabilidade := Probabilidade + '0000';
                                        end;
                                 end;

                            qProcessoCPGPRO_PROB.Value  := Probabilidade;
                            qProcessoCPG.Post;
                           end else begin
                                     qProcessoCPG.Edit;
                                     qProcessoCPGPRO_RESUL.Value := 2;
                                     qProcessoCPG.Post;
                                   end;
                      // Fim Busca Dados EXCEL
                  end;
     end else begin
                NumeroSheets := 2;
                //Busca Dados EXCEL
                VerificaMensagem := Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[35,8];
                if (VerificaMensagem = 'VÍNCULO BIOLOGICAMENTE PROVADO') or (VerificaMensagem = 'PARTERNIDADE PROVADA') or (VerificaMensagem = 'PARTERNIDADE PROVÁVEL') or (VerificaMensagem = 'PATERNIDADE MUITO PROVÁVEL') or (VerificaMensagem = 'PATERNIDADE POSSÍVEL')
                then begin
                      qProcessoCPG.Edit;
                      qProcessoCPGPRO_RESUL.Value := 1;
                      Probabilidade := FloatToStr(StrToFloat(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[33,8])*100);
                      if Length(Probabilidade) < 12
                      then begin
                             if Length(Probabilidade) = 11
                             then begin
                                   Probabilidade := Probabilidade + '0';
                                  end;
                             if Length(Probabilidade) = 10
                             then begin
                                   Probabilidade := Probabilidade + '00';
                                  end;
                             if Length(Probabilidade) = 9
                             then begin
                                   Probabilidade := Probabilidade + '000';
                                  end;
                             if Length(Probabilidade) = 8
                             then begin
                                   Probabilidade := Probabilidade + '0000';
                                  end;
                           end;

                      qProcessoCPGPRO_PROB.Value  := Probabilidade;
                      qProcessoCPG.Post;
                     end else begin
                                if (VerificaMensagem = 'PATERNIDADE MUITO REMOTA') or (VerificaMensagem = 'IMPOSSIBILIDADE DE ANÁLISE') or (VerificaMensagem = 'PATERNIDADE POUCO POSSÍVEL')
                                then begin
                                      qProcessoCPG.Edit;
                                      qProcessoCPGPRO_RESUL.Value := 6;
                                      Probabilidade := FloatToStr(StrToFloat(Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[33,8])*100);
                                      if Length(Probabilidade) < 12
                                      then begin
                                             if Length(Probabilidade) = 11
                                             then begin
                                                   Probabilidade := Probabilidade + '0';
                                                  end;
                                             if Length(Probabilidade) = 10
                                             then begin
                                                   Probabilidade := Probabilidade + '00';
                                                  end;
                                             if Length(Probabilidade) = 9
                                             then begin
                                                   Probabilidade := Probabilidade + '000';
                                                  end;
                                             if Length(Probabilidade) = 8
                                             then begin
                                                   Probabilidade := Probabilidade + '0000';
                                                  end;
                                           end;

                                      qProcessoCPGPRO_PROB.Value  := Probabilidade;
                                      qProcessoCPG.Post;
                                     end else begin
                                               qProcessoCPG.Edit;
                                               qProcessoCPGPRO_RESUL.Value := 2;
                                               qProcessoCPG.Post;
                                             end;
                                // Fim Busca Dados EXCEL
                            end;
                   end;

//Joga Dados EXCEL
qDeclaracaoComparecimento.Close;
qDeclaracaoComparecimento.Parameters.ParamByName('Pericia').Value := qProcessoCPGPRO_COD.Value;
qDeclaracaoComparecimento.Open;

Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[3,2] := qProcessoCPGPRO_NPERC.Value;

if qDeclaracaoComparecimento.Locate('SIT_NM', 'MÃE', []) = True
then begin
      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[4,2] := qDeclaracaoComparecimentoPES_NOME.Value;
     end;

if qDeclaracaoComparecimento.Locate('SIT_NM', 'CRIANÇA', []) = True
then begin
      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[5,2] := qDeclaracaoComparecimentoPES_NOME.Value;
     end;

if qDeclaracaoComparecimento.Locate('SIT_NM', 'SUPOSTO AVÔ', []) = True
then begin
      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[6,2] := qDeclaracaoComparecimentoPES_NOME.Value;
     end;

if qDeclaracaoComparecimento.Locate('SIT_NM', 'SUPOSTA AVÓ', []) = True
then begin
      Excel.WorkBooks[1].Sheets[NumeroSheets].Cells[7,2] := qDeclaracaoComparecimentoPES_NOME.Value;
     end;


     //Fim Joga Dados EXCEL
showmessage('         :::::::::::::::: ATENÇÃO ::::::::::::::::::::' + #13 + #13 + ' Verifique se o campo Probabilidade está correto!!!!');
f_NomePDF := DM.qParametrosPAM_DRPDF.Value + '\' + IntToStr(qProcessoCPGPRO_COD.Value) + '\' + 'PLANILHA_' + IntToStr(qProcessoCPGPRO_COD.Value) + '.pdf';
Excel.WorkBooks[1].ExportAsFixedFormat(0, f_NomePDF, EmptyParam, EmptyParam,  EmptyParam, 2, 2, EmptyParam, EmptyParam);
Excel.Application.Visible := true;
except
showmessage(' Planilha gerada com problemas ou não encontrada! ');
end;
end;


procedure TfProcessos.CadastrodeEndereos1Click(Sender: TObject);
begin
  Application.CreateForm(TfEnderecos, fEnderecos);
  fEnderecos.ShowModal;
  fEnderecos.Free;
end;

procedure TfProcessos.EmissodeCorrespondncias1Click(Sender: TObject);
begin
  Application.CreateForm(TfCorrespondencia, fCorrespondencia);
  fCorrespondencia.ShowModal;
  fCorrespondencia.Free;
end;

procedure TfProcessos.RelatriodeGuiadePostagem1Click(Sender: TObject);
begin
  Application.CreateForm(TfRelGuiaPostagem, fRelGuiaPostagem);
  fRelGuiaPostagem.ShowModal;
  fRelGuiaPostagem.Free;
end;

procedure TfProcessos.tbHonorariosShow(Sender: TObject);
begin
ComboBoxTipoPagamento.ItemIndex := -1;
RxCalcEditValor.Value           := 0;
EdtObservacao.Text              := '';
end;

procedure TfProcessos.RxDBComboBox2Exit(Sender: TObject);
begin
if qProcessoCPGPRO_NCOMP.Value > 0
then begin
      qProcessoCPGPRO_DRESU.Value := 0;
      qProcessoCPGPRO_RESUL.Value := 3;
    end;
end;

procedure TfProcessos.MapadeExtraoAplificao1Click(Sender: TObject);
begin
  Application.CreateForm(TfMapa_ExtAmpli, fMapa_ExtAmpli);
  fMapa_ExtAmpli.ShowModal;
  fMapa_ExtAmpli.Free;
end;

procedure TfProcessos.CB_PropostaExit(Sender: TObject);
begin
if (CB_Proposta.Checked = True)
then begin
      qProcessoCPGPRO_DCOLE.Value := 0;
      qProcessoCPGPRO_DREC.Value  := 0;
      qProcessoCPGPRO_DRESU.Value := 0;
      qProcessoCPGPRO_RESUL.Value := 5;
    end;
end;

procedure TfProcessos.LaudosEmitidosporPerodo1Click(Sender: TObject);
begin
  Application.CreateForm(TfEmissaoRelLaudosEmitidos, fEmissaoRelLaudosEmitidos);
  fEmissaoRelLaudosEmitidos.ShowModal;
  fEmissaoRelLaudosEmitidos.Free;
end;


procedure TfProcessos.ConsultadeLotes1Click(Sender: TObject);
begin
  Application.CreateForm(TfConsultaLotes, fConsultaLotes);
  fConsultaLotes.ShowModal;
  fConsultaLotes.Free;
end;

procedure TfProcessos.FinalizarEmissodoDIa1Click(Sender: TObject);
begin
  Application.CreateForm(TfExcluirCorrespondencias, fExcluirCorrespondencias);
  fExcluirCorrespondencias.ShowModal;
  fExcluirCorrespondencias.Free;
end;

procedure TfProcessos.LaudosVencendoHoje1Click(Sender: TObject);
begin
 Application.CreateForm(TfLaudosVencendoPeriodo, fLaudosVencendoPeriodo);
 fLaudosVencendoPeriodo.ShowModal;
 fLaudosVencendoPeriodo.Free;
end;

procedure TfProcessos.Juzes1Click(Sender: TObject);
begin
 Application.CreateForm(TfConsultaJuizes, fConsultaJuizes);
 fConsultaJuizes.Tela := '';
 fConsultaJuizes.Tela := 'Menu';
 fConsultaJuizes.ShowModal;
 fConsultaJuizes.Free;
end;

procedure TfProcessos.JvDBMaskEdit_AutoEnter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Digite o NÚMERO DO PROCESSO referente ao pedido do Exame (Judicial)';
end;

procedure TfProcessos.JvDBMaskEdit_AutoExit(Sender: TObject);
begin
if (Length(Trim(JvDBMaskEdit_Auto.Text)) < 25)
then begin
       Showmessage(' Informar corretamente o Número do Autos! ');
       JvDBMaskEdit_Auto.SetFocus;
     end;
end;

procedure TfProcessos.bbtAlelosDuplicadosClick(Sender: TObject);
begin
 Application.CreateForm(TfConsultaAlelosDuplicados, fConsultaAlelosDuplicados);
 fConsultaAlelosDuplicados.ShowModal;
 fConsultaAlelosDuplicados.Free;
end;


Function TfProcessos.AuditoriaAlteracao;
begin
if not (qProcessoCPGPRO_COD.Value = PRO_COD)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Código';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + IntToStr(qProcessoCPGPRO_COD.Value) + ' / ' + 'Original: ' + IntToStr(PRO_COD);
       ExecSQL;
      end;
     end;

if not (qProcessoCPGPRO_ANO.Value = PRO_ANO)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Ano';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + IntToStr(qProcessoCPGPRO_ANO.Value) + ' / ' + 'Original: ' + IntToStr(PRO_ANO);
       ExecSQL;
      end;
     end;

if not (qProcessoCPGPRO_NPERC.Value  = PRO_NPERC)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Número da Perícia';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + qProcessoCPGPRO_NPERC.Value + ' / ' + 'Original: ' + PRO_NPERC;
       ExecSQL;
      end;
     end;

if not (qProcessoCPGPRO_TIPO.Value   = PRO_TIPO)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Tipo';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + IntToStr(qProcessoCPGPRO_TIPO.Value) + ' / ' + 'Original: ' + IntToStr(PRO_TIPO);
       ExecSQL;
      end;
     end;

if not (qProcessoCPGPRO_AUTO.Value   = PRO_AUTO)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Autos';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + qProcessoCPGPRO_AUTO.Value + ' / ' + 'Original: ' + PRO_AUTO;
       ExecSQL;
      end;
     end;

if not (qProcessoCPGUF_SIGLA.Value   = UF_SIGLA)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Estado (UF)';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + qProcessoCPGUF_SIGLA.Value + ' / ' + 'Original: ' + UF_SIGLA;
       ExecSQL;
      end;
     end;

 if not (qProcessoCPGCAS_CODIGO.Value = CAS_CODIGO)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Caso';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + qProcessoCPGCAS_CODIGO.Value + ' / ' + 'Original: ' + CAS_CODIGO;
       ExecSQL;
      end;
     end;

if not (qProcessoCPGCOM_COD.Value    = COM_COD)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Comarca';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + IntToStr(qProcessoCPGCOM_COD.Value) + ' / ' + 'Original: ' + IntToStr(COM_COD);
       ExecSQL;
      end;
     end;

if not (qProcessoCPGVAR_COD.Value    = VAR_COD)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Vara';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + IntToStr(qProcessoCPGVAR_COD.Value) + ' / ' + 'Original: ' + IntToStr(VAR_COD);
       ExecSQL;
      end;
     end;

if not (qProcessoCPGLCO_COD.Value    = LCO_COD)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Local de Coleta';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + IntToStr(qProcessoCPGLCO_COD.Value) + ' / ' + 'Original: ' + IntToStr(LCO_COD);
       ExecSQL;
      end;
     end;

if not (qProcessoCPGPRO_HCOLE.Value  = PRO_HCOLE)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Hora da Coleta';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + qProcessoCPGPRO_HCOLE.Value + ' / ' + 'Original: ' + PRO_HCOLE;
       ExecSQL;
      end;
     end;

if not (qProcessoCPGPRO_DCOLE.Value  = PRO_DCOLE)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Data da Coleta';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + DateToStr(qProcessoCPGPRO_DCOLE.Value) + ' / ' + 'Original: ' + DateToStr(PRO_DCOLE);
       ExecSQL;
      end;
     end;

if not (qProcessoCPGPRO_HREC.Value   = PRO_HREC)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Hora da Recepção';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + qProcessoCPGPRO_HREC.Value + ' / ' + 'Original: ' + PRO_HCOLE;
       ExecSQL;
      end;
     end;

if not (qProcessoCPGPRO_DREC.Value   = PRO_DREC)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Data da Recepção';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + DateToStr(qProcessoCPGPRO_DREC.Value) + ' / ' + 'Original: ' + DateToStr(PRO_DREC);
       ExecSQL;
      end;
     end;

if not (qProcessoCPGPRO_DRESU.Value  = PRO_DRESU)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Data do Resultado';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + DateToStr(qProcessoCPGPRO_DRESU.Value) + ' / ' + 'Original: ' + DateToStr(PRO_DRESU);
       ExecSQL;
      end;
     end;

if not (qProcessoCPGPRO_SIT.Value    = PRO_SIT)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Situação';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + IntToStr(qProcessoCPGPRO_SIT.Value) + ' / ' + 'Original: ' + IntToStr(PRO_SIT);
       ExecSQL;
      end;
     end;

if not (qProcessoCPGPRO_NCOMP.Value  = PRO_NCOMP)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Não Comparecimento';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + IntToStr(qProcessoCPGPRO_NCOMP.Value) + ' / ' + 'Original: ' + IntToStr(PRO_NCOMP);
       ExecSQL;
      end;
     end;

if not (qProcessoCPGPRO_RESUL.Value  = PRO_RESUL)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Resultado';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + IntToStr(qProcessoCPGPRO_RESUL.Value) + ' / ' + 'Original: ' + IntToStr(PRO_RESUL);
       ExecSQL;
      end;
     end;

if not (qProcessoCPGPRO_PROB.Value   = PRO_PROB)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Probabilidade';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + qProcessoCPGPRO_PROB.Value + ' / ' + 'Original: ' + PRO_PROB;
       ExecSQL;
      end;
     end;

if not (qProcessoCPGPRO_ARETI.Value  = PRO_ARETI)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Autorizados a Retirar';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + qProcessoCPGPRO_ARETI.Value + ' / ' + 'Original: ' + PRO_ARETI;
       ExecSQL;
      end;
     end;

if not (qProcessoCPGJUI_COD.Value    = JUI_COD)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Juiz';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + IntToStr(qProcessoCPGJUI_COD.Value) + ' / ' + 'Original: ' + IntToStr(JUI_COD);
       ExecSQL;
      end;
     end;
if not (qProcessoCPGFG_PROP.Value    = FG_PROP)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Check de Proposta';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + qProcessoCPGFG_PROP.Value + ' / ' + 'Original: ' + FG_PROP;
       ExecSQL;
      end;
     end;

if not (qProcessoCPGPRO_USUCAD.Value = PRO_USUCAD)
then begin
      with qControlaAuditoria do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO,AUD_CAM_ORIALT) values (:Processo, :Usuario, :Data, :Hora, :Execucao, :Campo) ');
       Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;
       Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
       Parameters.ParamByName('Data').Value     := Date;
       Parameters.ParamByName('Hora').Value     := Time;
       Parameters.ParamByName('Execucao').Value := 'Alterou dados do Campo Usuário de Cadastro';
       Parameters.ParamByName('Campo').Value    := 'Novo (Alterado): ' + qProcessoCPGPRO_USUCAD.Value + ' / ' + 'Original: ' + PRO_USUCAD;
       ExecSQL;
      end;
     end;
// Limpa Campos

PRO_COD    :=0;
PRO_ANO    :=0;
PRO_NPERC  :='';
PRO_TIPO   :=0;
PRO_AUTO   :='';
UF_SIGLA   :='';
CAS_CODIGO :='';
COM_COD    :=0;
VAR_COD    :=0;
LCO_COD    :=0;
PRO_HCOLE  :='';
PRO_DCOLE  :=0;
PRO_HREC   :='';
PRO_DREC   :=0;
PRO_DRESU  :=0;
PRO_SIT    :=0;
PRO_NCOMP  :=0;
PRO_RESUL  :=0;
PRO_PROB   :='';
PRO_ARETI  :='';
JUI_COD    :=0;
FG_PROP    :='';
PRO_USUCAD :='';
end;

procedure TfProcessos.DBEdit7Enter(Sender: TObject);
begin
 StatusBar1.Panels.Items[1].Text := 'Digite a Sigla do ESTADO DE ORIGEM';
end;

procedure TfProcessos.DBLookupComboBox2Enter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Selecione o Nome do ESTADO DE ORIGEM do Exame';
end;

procedure TfProcessos.DBEdit3Enter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Digite o Código do TIPO DO CASO';
end;

procedure TfProcessos.RxDBLookupComboTipoCasoEnter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Selecione o Nome do TIPO DO CASO';
end;

procedure TfProcessos.RxDBComboBox3Enter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Selecione o Nome do TIPO';
end;

procedure TfProcessos.RxDBLookupComboComarcaEnter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Selecione o Nome da COMARCA DE ORIGEM do Exame';
end;

procedure TfProcessos.RxDBLookupComboVaraEnter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Selecione o Nome da VARA DE ORIGEM do Exame';
end;

procedure TfProcessos.RxDBLookupCombo3Enter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Selecione o Nome do JUIZ';
end;

procedure TfProcessos.RxDBComboBox1Enter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Selecione a SITUAÇÃO DA PERÍCIA';
end;

procedure TfProcessos.RxDBComboBox2Enter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Informe QUEM NÃO COMPARECEU PARA REALIZAÇÃO DO EXAME';
end;

procedure TfProcessos.RxDBComboBoxResultadoEnter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Selecione o RESULTADO DO EXAME';
end;

procedure TfProcessos.DBEdit16Enter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Digite / Confira a PROBABILIDADE gerada pelo Resultado';
end;

procedure TfProcessos.DBEdit32Enter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Digite a PESSOA RESPONSÁVEL PELA RETIRADA DO EXAME (Extrajudicial)';
end;

procedure TfProcessos.DBDateEdit3Enter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Digite a DATA PROVÁVEL DO RESULTADO (Padrão: 15 Dias)';
end;

procedure TfProcessos.DBDateEdit2Enter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Digite a DATA DA RECEPÇÃO DO EXAMES no IPCMS';
end;

procedure TfProcessos.DBEdit15Enter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Digite a HORA DA RECEPÇÃO DO EXAMES no IPCMS'
end;

procedure TfProcessos.DBEdit13Enter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Digite a HORA DA COLETA do Material para EXAMES no IPCMS'
end;

procedure TfProcessos.DBDateEdit1Enter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Digite a DATA DA COLETA do Material para EXAMES no IPCMS'
end;

procedure TfProcessos.RxDBLookupCombo2Enter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Selecione o NOME DO COLETADOR dos Materiais para EXAME no IPCMS';
end;

procedure TfProcessos.DBEdit12Enter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Digite o CÓDIGO DO COLETADOR dos Materiais para EXAME no IPCMS';
end;

procedure TfProcessos.DBEdit18Enter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Digite o CÓDIGO DO JUIZ que fez o pedido do Exame (Judicial)';
end;

procedure TfProcessos.DBEdit11Enter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Digite o CÓDIGO DA VARA DE ORIGEM do Exame';
end;

procedure TfProcessos.DBEdit8Enter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Digite o CÓDIGO DA COMARCA DE ORIGEM do Exame';
end;

procedure TfProcessos.DBEdit1Enter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'CÓDIGO do Exame (Gerado Automático)';
end;

procedure TfProcessos.DBEdit2Enter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'ANO DE REALIZAÇÃO DO EXAME (Recuperado do Sistema Operacional)';
end;

procedure TfProcessos.CB_PropostaEnter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'Determina se o Exame é uma PROPOSTA';
end;

procedure TfProcessos.DBGrid2Enter(Sender: TObject);
begin
StatusBar1.Panels.Items[1].Text := 'PESSOAS envolvidas no Exame';
end;

procedure TfProcessos.Auditoria1Click(Sender: TObject);
begin
  Application.CreateForm(TfConsultaAuditoria,fConsultaAuditoria);
  fConsultaAuditoria.ShowModal;
  fConsultaAuditoria.Free;
end;

procedure TfProcessos.bbtCorreiosClick(Sender: TObject);
var IEApp : Variant;
begin
if (qProcessoCPGPRO_RASTREAR.Value = '')
then begin
      ShowMessage('Não é possível verificar o andamento da entrega, pois, não existe número para rastreamento!!');
     end else begin
                IEApp := CreateOLEObject('InternetExplorer.Application');
                IEApp.visible := true;
                IEApp.Navigate('http://websro.correios.com.br/sro_bin/txect01$.QueryList?P_LINGUA=001&P_TIPO=001&P_COD_UNI=' + trim(qProcessoCPGPRO_RASTREAR.Value));
              end;
end;

procedure TfProcessos.RastreamentodeKits1Click(Sender: TObject);
begin
  Application.CreateForm(TfRastrearKits,fRastrearKits);
  fRastrearKits.ShowModal;
  fRastrearKits.Free;
end;

procedure TfProcessos.Vinculao1Click(Sender: TObject);
begin
if (fAcesso.Edit1.Text = 'RAPHAEL') or (fAcesso.Edit1.Text = 'BRUNO') or (fAcesso.Edit1.Text = 'HELDER') or (fAcesso.Edit1.Text = 'THATY')
then begin
      Application.CreateForm(TfVinculaCreditos,fVinculaCreditos);
      fVinculaCreditos.ShowModal;
      fVinculaCreditos.Free;
     end else ShowMessage('Usuário não autorizado!!!');
end;

procedure TfProcessos.Relatrio1Click(Sender: TObject);
begin
if (fAcesso.Edit1.Text = 'RAPHAEL') or (fAcesso.Edit1.Text = 'BRUNO') or (fAcesso.Edit1.Text = 'HELDER') or (fAcesso.Edit1.Text = 'THATY')
then begin
      Application.CreateForm(TfRelCreditosporJuiz,fRelCreditosporJuiz);
      fRelCreditosporJuiz.ShowModal;
      fRelCreditosporJuiz.Free;
     end else ShowMessage('Usuário não autorizado!!!');
end;

procedure TfProcessos.qProcessoCPGPRO_CARREGACREDITOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
if (qProcessoCPGPRO_CARREGACREDITO.Value = 'S') then
Text := 'Sim'
else Text := 'Não';

end;

procedure TfProcessos.HabilitarJuzesparaCrditos1Click(Sender: TObject);
begin
if (fAcesso.Edit1.Text = 'RAPHAEL') or (fAcesso.Edit1.Text = 'BRUNO') or (fAcesso.Edit1.Text = 'HELDER') or (fAcesso.Edit1.Text = 'THATY')
then begin
      Application.CreateForm(TfCreditoHabilitacao,fCreditoHabilitacao);
      fCreditoHabilitacao.ShowModal;
      fCreditoHabilitacao.Free;
     end else ShowMessage('Usuário não autorizado!!!');

end;

procedure TfProcessos.GeraodasPlanilhas2Click(Sender: TObject);
begin
  Application.CreateForm(TfAlelos,fAlelos);
  fAlelos.ShowModal;
  fAlelos.Free;
end;

procedure TfProcessos.GeraPlanilhas1Click(Sender: TObject);
begin
  Application.CreateForm(TfExportacaoAlelos,fExportacaoAlelos);
  fExportacaoAlelos.ShowModal;
  fExportacaoAlelos.Free;
end;


function TfProcessos.MesExtenso( Mes:Word ) : string; const meses : array[0..11] of PChar = ('janeiro', 'fevereiro', 'março', 'abril', 'maio', 'junho', 'julho', 'agosto', 'setembro','outubro', 'novembro', 'dezembro');
begin
result := meses[mes-1];
End;

procedure TfProcessos.Image6Click(Sender: TObject);
var proximo:integer;
begin
  DM.qMaxHistorico.Close;
  DM.qMaxHistorico.Open;
  Proximo:=DM.qMaxHistoricoMAX.Value + 1;
  DM.qHistorico.Append;
  DM.qHistoricoHIS_CONTR.Value := Proximo;
  DM.qHistoricoHIS_DATA.Value  := Date;
  DM.qHistoricoPRO_COD.Value   := qProcessoCPGPRO_COD.Value;
  if qProcessoCPGLCO_COD.Value = 208
  then begin
        DM.qHistoricoITE_COD.Value   := 48;
       end else begin
                 if qProcessoCPGLCO_COD.Value = 42
                 then begin
                       DM.qHistoricoITE_COD.Value   := 31;
                      end else DM.qHistoricoITE_COD.Value   := 26;
                end;
  DM.qHistoricoHIS_DOC.Value   := IntToStr(qProcessoCPGPRO_COD.Value);
  DM.qHistorico.Post;

  fImprimeFolhaResultados.qFolhaResultados.Close;
  fImprimeFolhaResultados.qFolhaResultados.Parameters.ParamByName('Codigo').Value  := qProcessoCPGPRO_COD.Value;
  fImprimeFolhaResultados.qFolhaResultados.Open;

  with qControlaAuditoria do
  begin
  Close;
  SQL.Clear;
  SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
  Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;;
  Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
  Parameters.ParamByName('Data').Value     := Date;
  Parameters.ParamByName('Hora').Value     := TimeToStr(Time);
  Parameters.ParamByName('Execucao').Value := 'Apertou o Botão GERAR FOLHA DE RESULTADOS - NOVA';
  ExecSQL;
  end;

 DecodeDate (fImprimeFolhaResultados.qFolhaResultadosPRO_DCOLE.Value, Ano, Mes, Dia);
 AnoA := IntToStr(Ano);
 MesA := MesExtenso(Mes);
 DiaA := IntToStr(Dia);
 if DiaA = '0'
 then begin
       DiaA:= '01';
      end;
 if Length(DiaA) = 1
 then begin
       DiaA := ('0' + DiaA);
      end;
 if (DiaA = IntToStr(01)) or (DiaA = IntToStr(-1))
 then begin
       DiaA := 'Primeiro';
      end;
 DataDiaColeta := DiaA +' de '+ MesA +' de '+ AnoA;

 fImprimeFolhaResultados.DATA_EXTENSO_COLETA.Caption := DataDiaColeta;
 fImprimeFolhaResultados.Barra_Codigo.Caption        :=   (IntToStr(qProcessoCPGPRO_COD.Value) + 'N');
 fImprimeFolhaResultados.QuickRep1.Preview;
end;


procedure TfProcessos.Timer1Timer(Sender: TObject);
begin
 begin
  If Label38.visible = true then
    begin
      If Label38.Tag = 0 then
        Begin
          Label38.font.color := clRed;
          Label38.Tag := 1;
        end
      else
        Begin
          Label38.font.color := clBtnFace;
          Label38.Tag := 0;
        end;
    end
end;

 begin
  If Label18.visible = true then
    begin
      If Label18.Tag = 0 then
        Begin
          Label18.font.color := clRed;
          Label18.Tag := 1;
        end
      else
        Begin
          Label18.font.color := clBtnFace;
          Label18.Tag := 0;
        end;
    end
end;

end;

procedure TfProcessos.Exportaes1Click(Sender: TObject);
begin
  Application.CreateForm(TfExportaExcel,fExportaExcel);
  fExportaExcel.ShowModal;
  fExportaExcel.Free;
end;

procedure TfProcessos.Compradekits1Click(Sender: TObject);
begin
  Application.CreateForm(TfCompraKits,fCompraKits);
  fCompraKits.ShowModal;
  fCompraKits.Free;
end;

procedure TfProcessos.Image7Click(Sender: TObject);
var proximo:integer;
    Ano, Mes, Dia : Word;
    AnoAtual : String;
begin

DecodeDate(Date, Ano, Mes, Dia);
AnoAtual := IntToStr(Ano);

if not (qProcessoCPGCAS_CODIGO.Value = 'PD0101')
then begin
      ShowMessage('Laudo Resumido disponível só para Casos PD0101 - Judiciais!');
     end else begin
                if (qProcessoCPGPRO_RESUL.Value = 3) or (qProcessoCPGPRO_RESUL.Value = 4)
                then begin
                      ShowMessage('Laudo não pde ser emitido. Favor verificar o Campo RESULTADO!!!!!.')
                     end else begin
                               DM.qMaxHistorico.Close;
                               DM.qMaxHistorico.Open;
                               Proximo:=DM.qMaxHistoricoMAX.Value + 1;
                               DM.qHistorico.Append;
                               DM.qHistoricoHIS_CONTR.Value := Proximo;
                               DM.qHistoricoHIS_DATA.Value  := Date;
                               DM.qHistoricoPRO_COD.Value   := qProcessoCPGPRO_COD.Value;
                               DM.qHistoricoITE_COD.Value   := 66;
//                               DM.qHistoricoHIS_DOC.Value   := InputBox('Inclusão de Dados no Histórico : Laudo', 'Informe o Número do Laudo:', ''+ AnoAtual +'.'); Descontinuado em 29.01.2025
                               DM.qHistoricoHIS_DOC.Value   := qProcessoCPGPRO_NUMLAUDO.Value;
                               DM.qHistorico.Post;

                               if messagedlg('Dados já foram gravados no Histórico. Deseja emitir o Documento??',mtconfirmation,[mbyes,mbno],0) = mryes
                               then begin
                                     GeraDocumento := 'Sim';
                                     with qControlaAuditoria do
                                     begin
                                     Close;
                                     SQL.Clear;
                                     SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
                                     Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;;
                                     Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
                                     Parameters.ParamByName('Data').Value     := Date;
                                     Parameters.ParamByName('Hora').Value     := TimeToStr(Time);
                                     Parameters.ParamByName('Execucao').Value := 'Apertou o Botão GERAR LAUDO RESUMIDO';
                                     ExecSQL;
                                    end;
                                     bbtWord.Click;
                                    end;
                             end;
            end;
end;

procedure TfProcessos.sbEnderecosClick(Sender: TObject);
begin
  Application.CreateForm(TfCasoEndereco,fCasoEndereco);
  fCasoEndereco.ShowModal;
  fCasoEndereco.Free;
end;

procedure TfProcessos.ColetadoresSemEnvio1Click(Sender: TObject);
begin
  Application.CreateForm(TfEmissaoLColetaExames, fEmissaoLColetaExames);
  fEmissaoLColetaExames.ShowModal;
  fEmissaoLColetaExames.Free;
end;

procedure TfProcessos.Image4Click(Sender: TObject);
var NovaDataResultado, Hora, Minuto, HoraCol, MinutoCol, Estado, Correio, Financeiro, Codigo : String;

begin

with qControlaAuditoria do
begin
Close;
SQL.Clear;
SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;;
Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
Parameters.ParamByName('Data').Value     := Date;
Parameters.ParamByName('Hora').Value     := TimeToStr(Time);
Parameters.ParamByName('Execucao').Value := 'Apertou o Botão GERAR CAPA EXAME';
ExecSQL;
end;
    
qGeraCapa.Close;
qGeraCapa.Parameters.ParamByName('Codigo').Value  := qProcessoCPGPRO_COD.Value;
qGeraCapa.Open;

qParcelasCapa.Close;
qParcelasCapa.Parameters.ParamByName('Codigo').Value  := qProcessoCPGPRO_COD.Value;
qParcelasCapa.Open;

qBuscaDadosPessoasCapa.Close;
qBuscaDadosPessoasCapa.Parameters.ParamByName('PROCESSO').Value  := qProcessoCPGPRO_COD.Value;
qBuscaDadosPessoasCapa.Open;

qUsuarioCapa.Close;
qUsuarioCapa.Parameters.ParamByName('Processo').Value  := qProcessoCPGPRO_COD.Value;
qUsuarioCapa.Open;

  Estado := fProcessos.qProcessoCPGUF_SIGLA.Value;

  Hora   := fProcessos.qProcessoCPGPRO_HREC.Value[1] + fProcessos.qProcessoCPGPRO_HREC.Value[2];
  Minuto := fProcessos.qProcessoCPGPRO_HREC.Value[4] + fProcessos.qProcessoCPGPRO_HREC.Value[5];

  HoraCol   := fProcessos.qProcessoCPGPRO_HCOLE.Value[1] + fProcessos.qProcessoCPGPRO_HCOLE.Value[2];
  MinutoCol := fProcessos.qProcessoCPGPRO_HCOLE.Value[4] + fProcessos.qProcessoCPGPRO_HCOLE.Value[5];

  DecodeDate (DoisAnteriorDiaUtil(fProcessos.qProcessoCPGPRO_DRESU.Value), Ano, Mes, Dia);
  AnoA := IntToStr(Ano);
  MesA := IntToStr(Mes);
  DiaA := IntToStr(Dia);
  if DiaA = IntToStr(1)
  then begin
  DiaA := '01';
  end;
  NovaDataResultado := (DiaA + '/' + MesA + '/'+ AnoA);

  Correio    := (IntToStr(qProcessoCPGPRO_COD.Value) + 'C');
  Financeiro := (IntToStr(qProcessoCPGPRO_COD.Value) + 'F');
  Codigo     := (IntToStr(qProcessoCPGPRO_COD.Value) + 'N');

if qBuscaDadosPessoasCapa.Locate('PES_SIT', 2, []) = True
then begin
      Application.CreateForm(TfRelCapa2,fRelCapa2);
      fRelCapa2.Crianca.Caption        := UpperCase(qBuscaDadosPessoasCapaPES_NOME.Value);
      fRelCapa2.DataLimite.Caption     := NovaDataResultado;
      fRelCapa2.Hora.Caption           := Hora;
      fRelCapa2.Minuto.Caption         := Minuto;
      fRelCapa2.HORACOL.Caption        := HoraCol;
      fRelCapa2.ESTADO.Caption         := Estado;
      fRelCapa2.MINUTOCOL.Caption      := MinutoCol;
      fRelCapa2.Cadastrador.Caption    := qUsuarioCapaHOS_USUA.Value;
      fRelCapa2.NumLaudo.Caption       := qProcessoCPGPRO_NUMLAUDO.Value;
      fRelCapa2.BarraCodigo.Caption    := Codigo;
      fRelCapa2.QuickRep1.Preview;
      fRelCapa2.Free;
     end;
end;


procedure TfProcessos.sbHTerminoClick(Sender: TObject);
begin
qProcessoCPGPRO_HTREC.Value  := TimeToStr(Time);
end;

procedure TfProcessos.Cadastro1Click(Sender: TObject);
begin
  Application.CreateForm(TfProcedimentos, fProcedimentos);
  fProcedimentos.ShowModal;
  fProcedimentos.Free;
end;

procedure TfProcessos.Timer3Timer(Sender: TObject);
begin
  ShowIdleTime;
end;

procedure TfProcessos.EtiquetasBruno1Click(Sender: TObject);
begin
  Application.CreateForm(TfRelEtiquetas, fRelEtiquetas);
  fRelEtiquetas.ShowModal;
  fRelEtiquetas.Free;
end;

procedure TfProcessos.AnlisedasExtraes1Click(Sender: TObject);
begin
  Application.CreateForm(TfExtracao, fExtracao);
  fExtracao.ShowModal;
  fExtracao.Free;
end;

procedure TfProcessos.AnlisedasExtraesCASOS1Click(Sender: TObject);
begin
 Application.CreateForm(TfExtracaoCasos,fExtracaoCasos);
 fExtracaoCasos.ShowModal;
 fExtracaoCasos.Free;
end;

procedure TfProcessos.Image8Click(Sender: TObject);
var Arquivo1, Arquivo2, Arquivo3, Final, Comando : String;
begin
  with qControlaAuditoria do
  begin
  Close;
  SQL.Clear;
  SQL.Add('insert into tb_auditoria (PRO_COD, HOS_USUA, AUD_DATA, AUD_HORA, AUD_EXECUCAO) values (:Processo, :Usuario, :Data, :Hora, :Execucao) ');
  Parameters.ParamByName('Processo').Value := qProcessoCPGPRO_COD.Value;;
  Parameters.ParamByName('Usuario').Value  := DM.qHostsHOS_USUA.Value + ' / ' + UpperCase(GetEnvironmentVariable('COMPUTERNAME'));
  Parameters.ParamByName('Data').Value     := Date;
  Parameters.ParamByName('Hora').Value     := TimeToStr(Time);
  Parameters.ParamByName('Execucao').Value := 'Apertou o Botão UNIFICAÇÃO DO LAUDOS';
  ExecSQL;
  end;

  Arquivo1 := '';
  Arquivo2 := '';
  Arquivo3 := '';
  Comando  := '';
  Final    := '';

  Arquivo1 := DM.qParametrosPAM_DRPDF.Value + '\' + IntToStr(fProcessos.qProcessoCPGPRO_COD.Value) + '\LAUDO_' + IntToStr(fProcessos.qProcessoCPGPRO_COD.Value) + '.PDF';
  Arquivo2 := DM.qParametrosPAM_DRPDF.Value + '\' + IntToStr(fProcessos.qProcessoCPGPRO_COD.Value) + '\PLANILHA_' + IntToStr(fProcessos.qProcessoCPGPRO_COD.Value) + '.PDF';
  Arquivo3 := DM.qParametrosPAM_DRPDF.Value + '\' + IntToStr(fProcessos.qProcessoCPGPRO_COD.Value) + '\TERMO_' + IntToStr(fProcessos.qProcessoCPGPRO_COD.Value) + '.PDF';
  Final    := DM.qParametrosPAM_DRPDF.Value + '\' + IntToStr(fProcessos.qProcessoCPGPRO_COD.Value) + '\FINAL_' + IntToStr(fProcessos.qProcessoCPGPRO_COD.Value) + '.PDF';

  if ((FileExists(Arquivo1)) and (FileExists(Arquivo2)) and (FileExists(Arquivo3)))
  then begin
        Comando  := 'gswin64 -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=' + Final + ' ' + Arquivo1 + ' ' + Arquivo2 + ' ' + Arquivo3;
        WinExec(PAnsiChar('cmd.exe /c ' + Comando), sw_normal);
      end else ShowMessage('Não é possivel mesclar os arquivos, é obrigatório que o Termo, Planilha e Laudo estejam gerados seus PDFs!');
end;

procedure TfProcessos.Image9Click(Sender: TObject);
begin
qImprimeComprovante.Close;
qImprimeComprovante.Parameters.ParamByName('Codigo').Value  := qProcessoCPGPRO_COD.Value;
qImprimeComprovante.Open;
qImprimeComprovante.RecordCount;

Application.CreateForm(TfImprimeComprExaPater, fImprimeComprExaPater);
fImprimeComprExaPater.RLReport.Preview(nil);
fImprimeComprExaPater.Free;
end;

procedure TfProcessos.ColetadoresMnimoKits1Click(Sender: TObject);
begin
dmr.qQuantMinimoKits.Close;
dmr.qQuantMinimoKits.Open;
Application.CreateForm(TfRelMinimoKits, fRelMinimoKits);
fRelMinimoKits.QuickRep2.Preview;
fRelMinimoKits.Free;
end;

procedure TfProcessos.Importao1Click(Sender: TObject);
begin
 Application.CreateForm(TfAlelosTipos,fAlelosTipos);
 fAlelosTipos.ShowModal;
 fAlelosTipos.Free;
end;

procedure TfProcessos.PlanilhasUnificado1Click(Sender: TObject);
begin
  Application.CreateForm(TfExportacaoAlelos,fExportacaoAlelos);
  fExportacaoAlelos.ShowModal;
  qProcessoCPG.Close;
  qProcessoCPG.Open;
  bbtUltimo.Click;
  fExportacaoAlelos.Free;
end;

procedure TfProcessos.RelatriodeEtiquetasAdesivoBrather1Click(
  Sender: TObject);
begin
  Application.CreateForm(TfRelEtiquetasAdesiva,fRelEtiquetasAdesiva);
  fRelEtiquetasAdesiva.ShowModal;
  fRelEtiquetasAdesiva.Free;
end;

procedure TfProcessos.MapaAmplificaoNovo1Click(Sender: TObject);
begin
  Application.CreateForm(TfMapa_ExtAmpliNew,fMapa_ExtAmpliNew);
  fMapa_ExtAmpliNew.ShowModal;
  fMapa_ExtAmpliNew.Free;
end;

procedure TfProcessos.RecebimentosCasos1Click(Sender: TObject);
begin
  Application.CreateForm(TfRecebimentoLaboratorio,fRecebimentoLaboratorio);
  fRecebimentoLaboratorio.ShowModal;
  fRecebimentoLaboratorio.Free;
end;

procedure TfProcessos.sbStatusClick(Sender: TObject);
begin
  Application.CreateForm(TfConsultaStatus,fConsultaStatus);
  fConsultaStatus.ShowModal;
  fConsultaStatus.Free;
end;

procedure TfProcessos.Colaboradores1Click(Sender: TObject);
begin
  Application.CreateForm(TfColaborador,fColaborador);
  fColaborador.ShowModal;
  fColaborador.Free;
end;

procedure TfProcessos.Importador1Click(Sender: TObject);
begin
  Application.CreateForm(TfColaboradorPonto,fColaboradorPonto);
  fColaboradorPonto.ShowModal;
  fColaboradorPonto.Free;
end;

procedure TfProcessos.eXPORTADOR1Click(Sender: TObject);
begin
  Application.CreateForm(TfColaboradorExporta,fColaboradorExporta);
  fColaboradorExporta.ShowModal;
  fColaboradorExporta.Free;
end;

procedure TfProcessos.ConsultadeProcedimentos1Click(Sender: TObject);
begin
 Application.CreateForm(TfConsultaGeralInf,fConsultaGeralInf);
 fConsultaGeralInf.ShowModal;
 fConsultaGeralInf.Free;
end;

procedure TfProcessos.ImportaFcil1Click(Sender: TObject);
begin
 Application.CreateForm(TfImportaFacilHist,fImportaFacilHist);
 fImportaFacilHist.ShowModal;
 fImportaFacilHist.Free;
end;

procedure TfProcessos.Automa1Click(Sender: TObject);
begin
if (fAcesso.Edit1.Text = 'RAPHAEL') or (fAcesso.Edit1.Text = 'BRUNO')
then begin
       Application.CreateForm(TfServicoAutoma,fServicoAutoma);
       fServicoAutoma.ShowModal;
       fServicoAutoma.Free;
     end else ShowMessage('Usuário não autorizado!!!');

end;

procedure TfProcessos.Cadastro2Click(Sender: TObject);
begin
 Application.CreateForm(TfCreditosGeracao,fCreditosGeracao);
 fCreditosGeracao.ShowModal;
 fCreditosGeracao.Free;
end;

procedure TfProcessos.CalculaPaternidade1Click(Sender: TObject);
begin
 Application.CreateForm(TfCalculaPaternidade,fCalculaPaternidade);
 fCalculaPaternidade.ShowModal;
 fCalculaPaternidade.Free;
end;

procedure TfProcessos.CriarDiretorioIntegracao;
var Diretorio, TipoCasoIntegracao : String;
begin
if (qProcessoCPGPRO_NUMLAUDO.Value = '')
then begin
      TipoCasoIntegracao := '';
      if (qProcessoCPGPRO_TIPO.Value = 2) or (RxDBComboBox3.Text = 'ExtraJudicial')
      then begin
            TipoCasoIntegracao := 'EX';
           end else TipoCasoIntegracao := 'JD';

      SequencialPastaIntegracao;
      Diretorio := DM.qParametrosPAM_DIRINTEGRADOC.Value + '\' +  formatfloat('#0000',UltimoNumeroPasta+1) + '.' + Copy(IntToStr(qProcessoCPGPRO_ANO.Value),3,2) + '.20.' + TipoCasoIntegracao + '.' + IntToStr(qProcessoCPGLCO_COD.Value);

      if not DirectoryExists(Diretorio)
      then begin
            ForceDirectories(Diretorio);
          end;
      qProcessoCPGPRO_NUMLAUDO.Value := formatfloat('#0000',UltimoNumeroPasta+1) + '.' + Copy(IntToStr(qProcessoCPGPRO_ANO.Value),3,2) + '.20.' + TipoCasoIntegracao + '.' + IntToStr(qProcessoCPGLCO_COD.Value);
     end;
if (qProcessoCPGPRO_NUMLAUDO.Value <> '')
then begin
      Diretorio := DM.qParametrosPAM_DIRINTEGRADOC.Value + '\' + qProcessoCPGPRO_NUMLAUDO.Value;
      if not DirectoryExists(Diretorio)
      then begin
            ForceDirectories(Diretorio);
          end;
     end;

end;


procedure TfProcessos.sbGeraLaudoClick(Sender: TObject);
var TipoCasoIntegracao : String;
begin
end;

function TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

procedure TfProcessos.SequencialPastaIntegracao;
var
  F : TSearchRec;
  Index, Retorno : Integer;
  Arr: array of Integer; // Define um array dinâmico
begin
  UltimoNumeroPasta := 0;
  //Inicia Busca
  Retorno := FindFirst( DM.qParametrosPAM_DIRINTEGRADOC.Value  + '\*.*.*', faAnyFile, F );
  try
    while Retorno = 0 do
    begin
      if  (F.Name <> '.') and (F.Name <> '..') then
        begin
          if  TemAtributo( F.Attr, faDirectory )
          then begin
                // Aumenta o tamanho do array
                SetLength(Arr, Index + 1);
                // Adiciona o valor ao array
                Arr[Index] := StrToInt(Copy(F.Name,1,4));
                // Ver o Maior
                if (Arr[Index] <= 2002) // Número do Laudo não pode ser Maior de 2002
                then begin
                      if (Arr[Index] > UltimoNumeroPasta)
                      then begin
                            UltimoNumeroPasta := Arr[Index]; // Atualiza o maior valor, se necessário
                           end;
                      // Incrementa o índice
                      Inc(Index);
                     end;
          end;
        end;
        Retorno := FindNext( F );
    end;
  finally
    SysUtils.FindClose(F);
  end;
end;

procedure TfProcessos.CrditosNovo1Click(Sender: TObject);
begin
 Application.CreateForm(TfGeracaoCreditos,fGeracaoCreditos);
 fGeracaoCreditos.ShowModal;
 fGeracaoCreditos.Free;
end;

procedure TfProcessos.CriarAtalhosPastaIntegracao (Arquivo:String;Caminho:String; Descricao:String);
var ShellLink : IShellLink;
PersistFile : IPersistFile;
NomeLnk : WideString;
begin
        ShellLink := CreateComObject(CLSID_ShellLink) as IShellLink;
        PersistFile := ShellLink as IPersistFile;
        with ShellLink do begin
                // Informe o Título do ícone
                SetDescription(PChar(Descricao));

                // Informe o Caminho e o Arquivo
                SetPath(PChar(Arquivo));

                // Argumentos para linha de comando, caso existam
                SetArguments(PChar(''));

                // Informe o Caminho e o Arquivo
                SetWorkingDirectory(
                    PChar(ExtractFilePath(Arquivo)));
        end;

        // Informe o nome do Atalho
        //NomeLnk := Caminho + ' ' + ChangeFileExt(Descricao,'.lnk');
        NomeLnk := Caminho + Descricao + '.lnk';
        PersistFile.Save(PWideChar(NomeLnk),False);
end;

procedure TfProcessos.GerarCreditos;
begin
//Gerador de Créditos
DM.qCalcCred_Insere.Open;

DM.qCalcCred_BuscaProcessos.Close;
DM.qCalcCred_BuscaProcessos.Open;

DM.qCalcCred_BuscaProcessos.First;
while DM.qCalcCred_BuscaProcessos.Eof = False do
 begin
  DM.qCalcCred_Insere.Append;
  DM.qCalcCred_InserePRO_COD.Value  := DM.qCalcCred_BuscaProcessosPRO_COD.Value;
  DM.qCalcCred_InsereUF_SIGLA.Value := DM.qCalcCred_BuscaProcessosUF_SIGLA.Value;
  DM.qCalcCred_InsereCOM_COD.Value  := DM.qCalcCred_BuscaProcessosCOM_COD.Value;
  DM.qCalcCred_InsereVAR_COD.Value  := DM.qCalcCred_BuscaProcessosVAR_COD.Value;
  DM.qCalcCred_Insere.Post;

  with DM.qCalcCred_AjustaProcesso do
  begin
    Close;
    SQL.Clear;
    SQL.Add('update tb_processo set fg_calccred = 1 where pro_cod = :Processo ');
    Parameters.ParamByName('Processo').Value := DM.qCalcCred_BuscaProcessosPRO_COD.Value;
    ExecSQL;
  end;

  DM.qCalcCred_BuscaProcessos.Next;
 end;


// Termino do Gerador de Créditos
end;

end.

