unit UDecompress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sGroupBox, ComCtrls, sStatusBar, Buttons, sBitBtn,
  acProgressBar, ExtCtrls;

type
  TFDecomppress = class(TForm)
    sGroupBox1: TsGroupBox;
    StatusInfo: TsStatusBar;
    btnDeCompress: TsBitBtn;
    Image1: TImage;
    OpenDialog1: TOpenDialog;
    ProgressBar1: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure StatusInfoDrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDecomppress: TFDecomppress;
   count:integer=0;
implementation

uses
  UMain;

{$R *.dfm}

procedure TFDecomppress.FormCreate(Sender: TObject);
var
  ProgressBarStyle: integer;
begin
StatusInfo.Panels[1].Style := psOwnerDraw;
 ProgressBar1.Parent:=StatusInfo;
 ProgressBarStyle := GetWindowLong(ProgressBar1.Handle,
                                    GWL_EXSTYLE);
  ProgressBarStyle := ProgressBarStyle 
                      - WS_EX_STATICEDGE;
  SetWindowLong(ProgressBar1.Handle,
                GWL_EXSTYLE,
                ProgressBarStyle);
end;

procedure TFDecomppress.StatusInfoDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
if Panel = StatusInfo.Panels[1] then
  with ProgressBar1 do begin
    Top := Rect.Top;
    Left := Rect.Left;
    Width := Rect.Right - Rect.Left - 15;
    Height := Rect.Bottom - Rect.Top;
  end;
end;


end.
