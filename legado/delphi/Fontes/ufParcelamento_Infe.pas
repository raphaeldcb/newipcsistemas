unit ufParcelamento_Infe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  Mask, DBCtrls, Buttons,
  DB, Grids, DBGrids, ExtCtrls, ComCtrls, Menus, ImgList, ADODB,  Sockets,
  JvExStdCtrls, JvCombobox, JvDBCombobox, JvExMask, JvToolEdit, JvDBControls;

type
  TfParcelamento_Infe = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label26: TLabel;
    Label3: TLabel;
    DBTextnParc: TDBText;
    DBEditValor: TDBEdit;
    DBDateEditDtParc: TJvDBDateEdit;
    RxDBComboBox1: TJvDBComboBox;
    Label1: TLabel;
    RxDBComboBoxSituParc: TJvDBComboBox;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    procedure CancelBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fParcelamento_Infe: TfParcelamento_Infe;

implementation

uses ufDM, ufProcedimentos, ufDMI;

{$R *.dfm}

procedure TfParcelamento_Infe.CancelBtnClick(Sender: TObject);
begin
 Close;
end;

procedure TfParcelamento_Infe.OKBtnClick(Sender: TObject);
begin
DMI.qParcelamento_Infe.Edit;
fProcedimentos.ds_Parcelamento.DataSet.Post;
end;

end.
