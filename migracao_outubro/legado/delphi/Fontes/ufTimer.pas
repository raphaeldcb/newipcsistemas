unit ufTimer;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, RLReport, Vcl.StdCtrls;

type
  TfTimer = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTimer: TfTimer;

implementation

{$R *.DFM}

procedure TfTimer.Timer1Timer(Sender: TObject);
begin
  close;
end;

end.
