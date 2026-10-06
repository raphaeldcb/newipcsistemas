unit ufImprimeComprovante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RLBarcode, RLConsts, DB, ADODB,
  jpeg;

type
  TfImprimeComprovante = class(TForm)
    RLReport_Comprovante: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLDBText4: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText2: TRLDBText;
    RLLabel16: TRLLabel;
    RLDBText11: TRLDBText;
    RLLabel2: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel1: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLLabel3: TRLLabel;
    RLDBText15: TRLDBText;
    RLLabel9: TRLLabel;
    RLDBText16: TRLDBText;
    RLLabel10: TRLLabel;
    RLDBText17: TRLDBText;
    RLLabel12: TRLLabel;
    RLDBText19: TRLDBText;
    RLDBText20: TRLDBText;
    RLLabel13: TRLLabel;
    RLDBText21: TRLDBText;
    RLLabel14: TRLLabel;
    RLLabel25: TRLLabel;
    RLDBText22: TRLDBText;
    RLLabel26: TRLLabel;
    RLDBText23: TRLDBText;
    RLDBText24: TRLDBText;
    RLLabel27: TRLLabel;
    RLDBText25: TRLDBText;
    RLDBText26: TRLDBText;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLDBText27: TRLDBText;
    RLDBText28: TRLDBText;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLDBText29: TRLDBText;
    RLDBText30: TRLDBText;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    RLLabel35: TRLLabel;
    RLLabel36: TRLLabel;
    RLDBText31: TRLDBText;
    RLLabel37: TRLLabel;
    RLLabel38: TRLLabel;
    RLLabel39: TRLLabel;
    RLMemo1: TRLMemo;
    RLImage1: TRLImage;
    RLImage2: TRLImage;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel40: TRLLabel;
    RLDBText32: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBText18: TRLDBText;
    RLDBText33: TRLDBText;
    RLLabel41: TRLLabel;
    RLReport_Tubo: TRLReport;
    RLBand4: TRLBand;
    RLDBText42: TRLDBText;
    RLDBText45: TRLDBText;
    Exame: TRLAngleLabel;
    RLDBBarcode1: TRLDBBarcode;
    RLReport_Senhas: TRLReport;
    RLBand3: TRLBand;
    RLLabel42: TRLLabel;
    RLLabel43: TRLLabel;
    RLLabel44: TRLLabel;
    RLLabel45: TRLLabel;
    RLLabel46: TRLLabel;
    RLLabel47: TRLLabel;
    RLLabel48: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RLSystemInfo5: TRLSystemInfo;
    RLSystemInfo6: TRLSystemInfo;
    RLSystemInfo7: TRLSystemInfo;
    RLSystemInfo8: TRLSystemInfo;
    qCodigoProcesso: TADOQuery;
    qCodigoProcessoPRO_COD: TIntegerField;
    dsCodigoProcesso: TDataSource;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    RLDraw5: TRLDraw;
    RLDraw6: TRLDraw;
    Pessoa: TRLAngleLabel;
    RLDraw7: TRLDraw;
    RLLabel49: TRLLabel;
    RLLabel50: TRLLabel;
    RLDBText34: TRLDBText;
    RLLabel51: TRLLabel;
    RLDBText35: TRLDBText;
    RLLabel52: TRLLabel;
    RLLabel53: TRLLabel;
    RLDBText36: TRLDBText;
    RLDBText37: TRLDBText;
    RLDBText38: TRLDBText;
    RLLabel54: TRLLabel;
    RLDBText39: TRLDBText;
    RLLabel55: TRLLabel;
    RLDBText40: TRLDBText;
    RLLabel56: TRLLabel;
    RLDBText41: TRLDBText;
    RLLabel57: TRLLabel;
    RLDBText43: TRLDBText;
    RLLabel58: TRLLabel;
    RLLabel59: TRLLabel;
    RLDBText44: TRLDBText;
    RLDBText46: TRLDBText;
    RLLabel60: TRLLabel;
    RLLabel61: TRLLabel;
    RLDBText47: TRLDBText;
    RLLabel62: TRLLabel;
    RLDBText48: TRLDBText;
    RLDBText49: TRLDBText;
    RLLabel63: TRLLabel;
    RLDBText50: TRLDBText;
    RLImage3: TRLImage;
    RLDBText51: TRLDBText;
    RLLabel64: TRLLabel;
    RLLabel65: TRLLabel;
    RLLabel66: TRLLabel;
    RLR_ComprovanteSimplificado: TRLReport;
    RLBand6: TRLBand;
    RLLabel80: TRLLabel;
    RLLabel81: TRLLabel;
    RLDBText54: TRLDBText;
    RLDBText56: TRLDBText;
    RLDBText57: TRLDBText;
    RLLabel84: TRLLabel;
    RLDBText60: TRLDBText;
    RLLabel86: TRLLabel;
    RLLabel87: TRLLabel;
    RLDBText62: TRLDBText;
    RLBand5: TRLBand;
    RLLabel72: TRLLabel;
    RLLabel73: TRLLabel;
    RLDBText53: TRLDBText;
    RLLabel76: TRLLabel;
    RLLabel77: TRLLabel;
    RLLabel78: TRLLabel;
    RLUsuario: TRLLabel;
    RLSenha: TRLLabel;
    RLLabel67: TRLLabel;
    RLLabel68: TRLLabel;
    RLLabel69: TRLLabel;
    RLLabel70: TRLLabel;
    RLImage4: TRLImage;
    RLR_Infecto2: TRLReport;
    RLBand8: TRLBand;
    RLA_CONVENIO_2: TRLAngleLabel;
    RLA_PRAZO_2: TRLAngleLabel;
    RLA_CASODATA_2: TRLAngleLabel;
    RLAngleLabel6: TRLAngleLabel;
    RLA_NOME_2: TRLAngleLabel;
    RLR_Infecto3: TRLReport;
    RLBand7: TRLBand;
    convenio_3: TRLAngleLabel;
    prazo_3: TRLAngleLabel;
    casodata_3: TRLAngleLabel;
    nome_3: TRLAngleLabel;
    RLBcode: TRLBarcode;
    RLAngleLabel1: TRLAngleLabel;
    RLBcode2: TRLBarcode;
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand7BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImprimeComprovante: TfImprimeComprovante;
  valor : Integer;

implementation

uses ufDM, ufDMI;

{$R *.dfm}
procedure TfImprimeComprovante.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var i,j : Integer;
begin
  if (valor = 0)
  then begin
        j := valor + 1;
      end else j := valor + 1;
  RLLabel42.Caption := IntToStr(j);
  j := j + 1;
  RLLabel43.Caption := IntToStr(j);
  j := j + 1;
  RLLabel44.Caption := IntToStr(j);
  j := j + 1;
  RLLabel45.Caption := IntToStr(j);
  j := j + 1;
  RLLabel46.Caption := IntToStr(j);
  j := j + 1;
  RLLabel47.Caption := IntToStr(j);
  j := j + 1;
  RLLabel48.Caption := IntToStr(j);
  valor := j

end;

procedure TfImprimeComprovante.RLBand7BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
 if (Length(DMI.qInfectoEtiquetasPES_NOME.Value) >= 27)
 then begin
        fImprimeComprovante.NOME_3.Caption      :=  DMI.qInfectoEtiquetasPES_NOME.Value;
        fImprimeComprovante.NOME_3.Font.Size    :=  7;
     end else fImprimeComprovante.NOME_3.Caption      :=  DMI.qInfectoEtiquetasPES_NOME.Value;
 fImprimeComprovante.casodata_3.Caption  :=  'Caso: ' + IntToStr(DMI.qInfectoEtiquetasPRO_COD.Value) + ' / Dt. Amostra: ' + DateToStr(DMI.qInfectoEtiquetasPRO_DCOL.Value);
 fImprimeComprovante.PRAZO_3.Caption     :=  'Prazo: ' + DMI.qInfectoEtiquetasPRO_PRAZO.Value;
 fImprimeComprovante.CONVENIO_3.Caption  :=  'Origem: ' + DMI.qInfectoEtiquetasLAB_LABT.Value;
 fImprimeComprovante.RLBcode2.Caption    :=  IntToStr(DMI.qInfectoEtiquetasPRO_COD.Value);
 fImprimeComprovante.RLBcode2.Width      :=  32;
end;

initialization
end.
