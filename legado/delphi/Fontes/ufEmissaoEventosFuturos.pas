unit ufEmissaoEventosFuturos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, ComCtrls, DBCtrls, Buttons,
  Mask, ToolEdit, SqlExpr, QRCtrls, QuickRpt;

type
  TfEmissaoRelatorioEventosFuturos = class(TForm)
    Periodo: TLabel;
    BConsultar: TSpeedButton;
    BImprimir: TSpeedButton;
    BFechar: TSpeedButton;
    Grid1: TDBGrid;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRSysData5: TQRSysData;
    QRSysData6: TQRSysData;
    QRImage2: TQRImage;
    PeriodoFrente: TQRLabel;
    MostraDataIni: TQRLabel;
    MostraDataFim: TQRLabel;
    QRBand2: TQRBand;
    QRLabel38: TQRLabel;
    QRBand3: TQRBand;
    QRLabel39: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRBand4: TQRBand;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText1: TQRDBText;
    QRBand6: TQRBand;
    QRBand5: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    procedure BConsultarClick(Sender: TObject);
    procedure BFecharClick(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEmissaoRelatorioEventosFuturos: TfEmissaoRelatorioEventosFuturos;
  dataIni: string;
  dataFim: string;

implementation

uses ufMenu, ufDMR;


{$R *.dfm}

procedure TfEmissaoRelatorioEventosFuturos.BConsultarClick(Sender: TObject);
begin
if (DateEdit1.Text = '  /  /    ') or (DateEdit1.Text = '  /  /    ')
then begin
      ShowMessage('Selecione o período!');
      DateEdit1.setfocus;
     end else begin
               DMR.qEventosAtual.Active := False;
               DMR.qEventosAtual.Parameters.ParamByName('DT1').Value := DateEdit1.Date;
               DMR.qEventosAtual.Parameters.ParamByName('DT2').Value := DateEdit2.Date;
               DMR.qEventosAtual.Active := True;
               if DMR.qEventosAtual.RecordCount > 0
               then begin
                     BImprimir.Enabled:=true;
                    end else MessageDlg('Não há Eventos neste período!', mtInformation, [mbOK],0);
              end;
end;

procedure TfEmissaoRelatorioEventosFuturos.BFecharClick(Sender: TObject);
begin
   close;
end;

procedure TfEmissaoRelatorioEventosFuturos.BImprimirClick(Sender: TObject);
begin
 MostraDataIni.Caption := DateEdit1.Text;
 MostraDataFim.Caption := DateEdit2.Text;
 QuickRep1.Preview;
end;

end.
