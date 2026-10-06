unit ufRelLaudosPendentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, RLReport;

type
  TfRelLaudosPendentes = class(TForm)
    QuickRep1: TRLReport;
    QRBand1: TRLBand;
    QRBand2: TRLBand;
    QRBand3: TRLBand;
    QRBand4: TRLBand;
    QRLabel1: TRLLabel;
    QRLabel2: TRLLabel;
    QRLabel3: TRLLabel;
    QRLabel4: TRLLabel;
    QRLabel7: TRLLabel;
    QRLabel8: TRLLabel;
    QRLabel9: TRLLabel;
    QRLabel10: TRLLabel;
    QRLabel11: TRLLabel;
    QRDBText1: TRLDBText;
    QRDBText2: TRLDBText;
    LabelTipo: TRLLabel;
    LabelResultado: TRLLabel;
    QuickRep2: TRLReport;
    QRBand5: TRLBand;
    QRLabel13: TRLLabel;
    QRLabel14: TRLLabel;
    QRLabel15: TRLLabel;
    QRBand6: TRLBand;
    QRBand8: TRLBand;
    LabelCrianca: TRLLabel;
    qBuscaCrianca: TADOQuery;
    qBuscaCriancaPES_NOME: TStringField;
    QRLabel23: TRLLabel;
    QRLabel24: TRLLabel;
    QRLabel18: TRLLabel;
    QRLabel19: TRLLabel;
    QRLabel20: TRLLabel;
    QRLabel21: TRLLabel;
    QRLabel22: TRLLabel;
    QRLabel25: TRLLabel;
    QRLabel26: TRLLabel;
    QRBand9: TRLBand;
    QRDBText3: TRLDBText;
    QRDBText4: TRLDBText;
    LabelTipo_1: TRLLabel;
    LabelResultado_1: TRLLabel;
    LabelCrianca_1: TRLLabel;
    qBuscaCorreio: TADOQuery;
    qBuscaEmitido: TADOQuery;
    QRLabel12: TRLLabel;
    QRDBText6: TRLDBText;
    QRDBText8: TRLDBText;
    qBuscaCorreioSIT: TStringField;
    qBuscaEmitidoSITE: TIntegerField;
    SitE_1: TRLLabel;
    SitE_2: TRLLabel;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    DS_BuscaCorreio: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure QRBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
  VemdeOnde : String;
 { Public declarations }
  end;

var
  fRelLaudosPendentes: TfRelLaudosPendentes;


implementation

uses ufProcesso, ufDMR, ufDM;

{$R *.dfm}

procedure TfRelLaudosPendentes.FormShow(Sender: TObject);
begin
 DM.qPessoas.Open;
end;

procedure TfRelLaudosPendentes.QRBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
if VemdeOnde = 'Processo'
then begin
      qBuscaCrianca.Close;
      qBuscaCrianca.Parameters.ParamByName('PRO_COD').Value  := fProcessos.qVencidosSemPessoaPRO_COD.Value;
      qBuscaCrianca.Open;

      qBuscaCorreio.Close;
      qBuscaCorreio.Parameters.ParamByName('PRO_COD').Value  := fProcessos.qVencidosSemPessoaPRO_COD.Value;
      qBuscaCorreio.Open;

      qBuscaEmitido.Close;
      qBuscaEmitido.Parameters.ParamByName('PRO_COD').Value  := fProcessos.qVencidosSemPessoaPRO_COD.Value;
      qBuscaEmitido.Open;

      LabelCrianca.Caption := qBuscaCriancaPES_NOME.Value;

      case fProcessos.qVencidosSemPessoaPRO_TIPO.Value of
        1: Labeltipo.Caption := 'Judicial';
        2: Labeltipo.Caption := 'ExtraJudicial';
        3: Labeltipo.Caption := 'Minist. Público';
        4: Labeltipo.Caption := 'Defens. Pública';
      end;
      case fProcessos.qVencidosSemPessoaPRO_RESUL.Value of
        1: LabelResultado.Caption := 'Positivo';
        2: LabelResultado.Caption := 'Negativo';
        3: LabelResultado.Caption := 'Cancelado';
        4: LabelResultado.Caption := 'Em andamento';
      end;
      if (qBuscaEmitidoSITE.Value = 0)
      then begin
            SitE_1.Caption := 'Não';
           end else SitE_1.Caption := 'Sim';

     end else begin
               qBuscaCrianca.Close;
               qBuscaCrianca.Parameters.ParamByName('PRO_COD').Value  := DMR.qRelLaudosHojeSemPessoaPRO_COD.Value;
               qBuscaCrianca.Open;

               qBuscaCorreio.Close;
               qBuscaCorreio.Parameters.ParamByName('PRO_COD').Value  := fProcessos.qVencidosSemPessoaPRO_COD.Value;
               qBuscaCorreio.Open;

               qBuscaEmitido.Close;
               qBuscaEmitido.Parameters.ParamByName('PRO_COD').Value  := fProcessos.qVencidosSemPessoaPRO_COD.Value;
               qBuscaEmitido.Open;

               LabelCrianca_1.Caption := qBuscaCriancaPES_NOME.Value;
               case DMR.qRelLaudosHojeSemPessoaPRO_TIPO.Value of
                 1: Labeltipo_1.Caption := 'Judicial';
                 2: Labeltipo_1.Caption := 'ExtraJudicial';
                 3: Labeltipo_1.Caption := 'Minist. Público';
                 4: Labeltipo_1.Caption := 'Defens. Pública';
               end;
               case DMR.qRelLaudosHojeSemPessoaPRO_RESUL.Value of
                 1: LabelResultado_1.Caption := 'Positivo';
                 2: LabelResultado_1.Caption := 'Negativo';
                 3: LabelResultado_1.Caption := 'Cancelado';
                 4: LabelResultado_1.Caption := 'Em andamento';
               end;
                if (qBuscaEmitidoSITE.Value = 0)
                then begin
                      SitE_2.Caption := 'Não';
                     end else SitE_2.Caption := 'Sim';

              end;


end;

end.
