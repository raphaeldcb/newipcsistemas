unit ufAbertura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, jpeg, StdCtrls;

type
  TfrmAbertura = class(TForm)
    Image1: TImage;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbertura: TfrmAbertura;

implementation

{$R *.dfm}

procedure TfrmAbertura.Timer1Timer(Sender: TObject);
begin
 ProgressBar1.Position:=ProgressBar1.Position+1;
 if ProgressBar1.Position=100 then
 Timer1.Enabled := False;
end;

procedure TfrmAbertura.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
CanClose := Not Timer1.Enabled;
end;

end.
