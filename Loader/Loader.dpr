program Loader;

uses
  Vcl.Forms,
  UtMain in 'UtMain.pas' {frmLoader};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLoader, frmLoader);
  Application.Run;
end.
