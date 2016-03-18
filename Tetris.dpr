program Tetris;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  ClassArray in 'ClassArray.pas',
  splash in 'splash.pas' {splashFrm};

{$R *.RES}

begin
  Application.Initialize;
  TStyleManager.TrySetStyle('Charcoal Dark Slate');
  Application.Title := 'Titles';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TsplashFrm, splashFrm);
  Application.Run;
end.
