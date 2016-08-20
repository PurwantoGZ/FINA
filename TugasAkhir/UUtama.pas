unit UUtama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinManager, Buttons, sSpeedButton, StdCtrls, sBitBtn;

type
  TFUtama = class(TForm)
    sSkinManager1: TsSkinManager;
    btnCompress: TsBitBtn;
    btnDecompress: TsBitBtn;
    btnHelp: TsBitBtn;
    btnExit: TsBitBtn;
    sSkinManager2: TsSkinManager;
    procedure btnCompressClick(Sender: TObject);
    procedure btnDecompressClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUtama: TFUtama;

implementation

uses
  UMain, UDecompress, UHelp;

{$R *.dfm}

procedure TFUtama.btnCompressClick(Sender: TObject);
begin
Hide;
FMain.ShowModal;
show;
end;

procedure TFUtama.btnDecompressClick(Sender: TObject);
begin
Hide;
FDecomppress.ShowModal;
show;
end;

procedure TFUtama.btnExitClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TFUtama.btnHelpClick(Sender: TObject);
begin
FHelp.Show;
end;

end.
