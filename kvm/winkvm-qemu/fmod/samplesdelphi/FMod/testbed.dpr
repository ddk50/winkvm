program testbed;

uses
  Forms,
  main in 'main.pas' {frmMain},
  about in 'about.pas' {frmAbout},
  config in 'config.pas' {frmConfig},
  spectrum in 'spectrum.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'FMOD';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
