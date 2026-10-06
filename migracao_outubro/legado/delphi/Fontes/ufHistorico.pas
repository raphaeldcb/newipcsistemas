unit ufHistorico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, DBCtrls, StdCtrls, Buttons,
  ExtCtrls, Mask, JvExMask, JvToolEdit, JvDBControls, Data.Win.ADODB;

type
  TfHistorico = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBMemoObs: TDBMemo;
    DBDateEditDtHist: TJvDBDateEdit;
    qConsultaQuantOficios: TADOQuery;
    qConsultaQuantOficiosQUANTOFICIO: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BNovoClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure SequencialPastaIntegracaoOficio;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fHistorico: TfHistorico;
  UltimoNumeroPasta : Integer;
  AnoAtual : String;

implementation

uses ufDM, ufProcesso;

{$R *.dfm}

procedure TfHistorico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
DM.qHistorico.Open;
DM.qItem.Open;
end;

procedure TfHistorico.FormShow(Sender: TObject);
begin
  inherited;
DM.qHistorico.Open;
dm.qItem.Open;
end;

procedure TfHistorico.BNovoClick(Sender: TObject);
var proximo:integer;
begin
  DM.qMaxHistorico.Close;
  DM.qMaxHistorico.Open;
  Proximo:=DM.qMaxHistoricoMAX.Value + 1;
  inherited;
  DM.qHistoricoHIS_CONTR.Value := Proximo;
  DM.qHistoricoHIS_DATA.Value  := Date;
  DM.qHistoricoPRO_COD.Value   := fProcessos.qProcessoCPGPRO_COD.Value;
  DBEdit1.SetFocus;
end;

procedure TfHistorico.BSalvarClick(Sender: TObject);
var TipoCasoIntegracao : String;
begin
  DecodeDate(Date, Ano, Mes, Dia);
  AnoAtual := '';
  AnoAtual := IntToStr(Ano);

  TipoCasoIntegracao := '';
  if (fProcessos.qProcessoCPGPRO_TIPO.Value = 2)
  then begin
        TipoCasoIntegracao := 'EX'
       end else TipoCasoIntegracao := 'JD';

  qConsultaQuantOficios.Close;
  qConsultaQuantOficios.Parameters.ParamByName('Codigo').Value := fProcessos.qProcessoCPGPRO_COD.Value;
  qConsultaQuantOficios.Open;

  if (DM.qItemITE_ORG.Value = '')
  then begin
        SequencialPastaIntegracaoOficio;
        DM.qHistoricoHIS_DOC.Value := formatfloat('#0000',UltimoNumeroPasta+1) + '.' + Copy(AnoAtual,3,2) + '.20.' + TipoCasoIntegracao + '.' +  formatfloat('#00',qConsultaQuantOficiosQUANTOFICIO.Value+1);
       end else DM.qHistoricoHIS_DOC.Value := IntToStr(fProcessos.qProcessoCPGPRO_COD.Value);

  inherited;
  DM.qHistorico.Open;
end;

function TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

procedure TfHistorico.SequencialPastaIntegracaoOficio;
var
  F : TSearchRec;
  Index, Retorno : Integer;
  Arr: array of Integer; // Define um array dinâmico          6
begin
  UltimoNumeroPasta := 0;
  //Inicia Busca
  Retorno := FindFirst( DM.qParametrosPAM_DIRINTEGRAOF.Value + '\*.*', faAnyFile, F );
//  Retorno := FindFirst( DM.qParametrosPAM_DIRINTEGRAOF.Value + ' ' + AnoAtual + '\*.*', faAnyFile, F );
  try
    while Retorno = 0 do
    begin
        if  (F.Attr <> faDirectory)
          then begin
                // Aumenta o tamanho do array
                SetLength(Arr, Index + 1);
                // Adiciona o valor ao array
                if ((Copy(F.Name,1,1) = '0') or (Copy(F.Name,1,1) = '1') or (Copy(F.Name,1,1) = '2') or (Copy(F.Name,1,1) = '3')
                 or (Copy(F.Name,1,1) = '4') or (Copy(F.Name,1,1) = '5') or (Copy(F.Name,1,1) = '6') or (Copy(F.Name,1,1) = '7')
                  or (Copy(F.Name,1,1) = '8') or (Copy(F.Name,1,1) = '9'))
                then begin
                      Arr[Index] := StrToInt(Copy(F.Name,1,4));
                     end;
                // Ver o Maior
                if Arr[Index] > UltimoNumeroPasta then UltimoNumeroPasta := Arr[Index]; // Atualiza o maior valor, se necessário
                // Incrementa o índice
                Inc(Index);
          end;
        Retorno := FindNext( F );
    end;
  finally
    SysUtils.FindClose(F);
  end;
end;
end.
