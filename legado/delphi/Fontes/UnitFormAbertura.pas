unit UnitFormAbertura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, jpeg, StdCtrls, ComCtrls;

type
  TfAbertura = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAbertura: TfAbertura;

implementation

{$R *.DFM}

procedure TfAbertura.FormCreate(Sender: TObject);
begin
Brush.Style := bsclear;
end;

end.
