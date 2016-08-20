program MatrixToBitmap;

uses
  Forms,
  ScreenMatrixToBitmap in 'ScreenMatrixToBitmap.pas' {FormMatrixToBitmap},
  TokenLibrary in 'TokenLibrary.PAS',
  SpectraLibrary in 'SpectraLibrary.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormMatrixToBitmap, FormMatrixToBitmap);
  Application.Run;
end.
