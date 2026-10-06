program qrcodegenerator;

uses
  Vcl.Forms,
  ufrmPrinc in 'ufrmPrinc.pas' {frmPrinc},
  DelphiZXIngQRCode in '..\src\dependencies\DelphiZXIngQRCode.pas',
  QRCODE in '..\src\QRCODE.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrinc, frmPrinc);
  Application.Run;
end.
