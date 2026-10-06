unit ufEnderecos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, Buttons, ExtCtrls, StdCtrls, Mask,
  DBCtrls;

type
  TfEnderecos = class(TfPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBComboBox1: TDBComboBox;
    Label7: TLabel;
    DBComboBox2: TDBComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BNovoClick(Sender: TObject);
    procedure BCnsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    VemCadastro, Nome : String;
  end;

var
  fEnderecos: TfEnderecos;

implementation

uses ufDM, ufConsultaEnderecos;

{$R *.dfm}

procedure TfEnderecos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DM.qEnderecos.Close;
end;

procedure TfEnderecos.FormShow(Sender: TObject);
begin
  inherited;
  DM.qEnderecos.Open;
  if (VemCadastro = 'Sim')
  then begin
        BNovo.Click;
       end;
end;

procedure TfEnderecos.BNovoClick(Sender: TObject);
begin
  inherited;
   DM.qEnderecosEND_CEP.Value := '00.000-000';
   if (VemCadastro = 'Sim')
   then begin
         DM.qEnderecosEND_NMR.Value := Nome;
        end;
   VemCadastro := '';
   Nome        := '';
end;

procedure TfEnderecos.BCnsultarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfConsultaEnderecos, fConsultaEnderecos);
  fConsultaEnderecos.bbtSelecionar.Enabled := False;
  fConsultaEnderecos.ShowModal;
  fConsultaEnderecos.bbtSelecionar.Enabled := True;
  fConsultaEnderecos.Free;
  DM.qEnderecos.Open;
end;

end.
