program HuffCompress;

uses
  Forms,
  UMain in 'UMain.pas' {FMain},
  UUtama in 'UUtama.pas' {FUtama},
  UCompress in 'UCompress.pas' {FCompress},
  UDecompress in 'UDecompress.pas' {FDecomppress},
  UHelp in 'UHelp.pas' {FHelp};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFUtama, FUtama);
  Application.CreateForm(TFDecomppress, FDecomppress);
  Application.CreateForm(TFHelp, FHelp);
  Application.Run;
end.
