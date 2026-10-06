unit ufResultadoFiltro;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, SpeedBar,
  Menus, DB, DBTables,RXCtrls, DBCtrls, ADODB;
type
  TfResultadoFiltroCPG = class(TForm)
    SpeedBar2: TSpeedBar;
    SpeedItemSair: TSpeedItem;
    SpeedItemAjuda: TSpeedItem;
    SpeedItemImprimir: TSpeedItem;
    SpeedItemFiltro: TSpeedItem;
    SpeedItemFimFiltro: TSpeedItem;
    SpeedbarSection2: TSpeedbarSection;
    SpeedbarSection3: TSpeedbarSection;
    SpeedbarSection4: TSpeedbarSection;
    PanelStatus: TPanel;
    ItemRel: TComboBox;
    Label2: TLabel;
    procedure SpeedItemSairClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fResultadoFiltroCPG: TfResultadoFiltroCPG;

implementation

uses ufFiltroPesquisa, ufDM;


{$R *.DFM}


procedure TfResultadoFiltroCPG.SpeedItemSairClick(Sender: TObject);
begin
 Close;
end;

end.



