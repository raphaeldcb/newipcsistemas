unit ufRelFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RLReport;

type
  TfRelFinanceiro = class(TForm)
    qrp_Geral: TRLReport;
    QRBand8: TRLBand;
    QRLabel37: TRLLabel;
    QRSysData3: TRLSystemInfo;
    QRLabel38: TRLLabel;
    QRLabel39: TRLLabel;
    QRLabel40: TRLLabel;
    QuickRep2: TRLReport;
    QRBand3: TRLBand;
    QRLabel4: TRLLabel;
    QRLabel5: TRLLabel;
    QRLabel10: TRLLabel;
    QRDBText4: TRLDBText;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand1: TRLBand;
    QRLabel21: TRLLabel;
    QRDBText18: TRLDBText;
    QRLabel3: TRLLabel;
    QRLabel2: TRLLabel;
    QRBand1: TRLBand;
    QRDBText1: TRLDBText;
    QRDBText2: TRLDBText;
    QRBand2: TRLBand;
    QRLabel1: TRLLabel;
    RLGroup2: TRLGroup;
    QRBand5: TRLBand;
    QRLabel8: TRLLabel;
    QRDBText5: TRLDBText;
    QRLabel9: TRLLabel;
    QRBand4: TRLBand;
    QRDBText3: TRLDBText;
    RLDBResult1: TRLDBResult;
    qrp_Dados: TRLReport;
    RLBand2: TRLBand;
    RLLabel3: TRLLabel;
    RLL_Titulo: TRLLabel;
    RLLabel5: TRLLabel;
    RLSystemInfo4: TRLSystemInfo;
    RLSystemInfo5: TRLSystemInfo;
    RLLabel6: TRLLabel;
    RLBand3: TRLBand;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLBand4: TRLBand;
    RLDBText2: TRLDBText;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLLabel4: TRLLabel;
    RLDBText8: TRLDBText;
    procedure QRDBText18Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelFinanceiro: TfRelFinanceiro;

implementation

uses ufDMR;

{$R *.dfm}

procedure TfRelFinanceiro.QRDBText18Print(sender: TObject;
  var Value: String);
begin
{    if Value = '1' then
        value := 'Cheque OK'
    else if Value = '2' then
        value := 'Cheque Devolvido'
    else if Value = '3' then
        value := 'Cheque Não fornecido'
    else
        value := '<não informado>';}
end;

end.
