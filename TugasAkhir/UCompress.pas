unit UCompress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, sGroupBox, ExtCtrls, Buttons, sBitBtn,
  sTabControl, sPageControl, sAlphaListBox;

type
  TFCompress = class(TForm)
    sGroupBox1: TsGroupBox;
    sGroupBox2: TsGroupBox;
    Image1: TImage;
    OpenCitra: TsBitBtn;
    TabControlKu: TsPageControl;
    TabTerminal: TsTabSheet;
    TabMatriksData: TsTabSheet;
    TabPusatCluster: TsTabSheet;
    TabHasilFCM: TsTabSheet;
    TabHuffmanInfo: TsTabSheet;
    Status: TStatusBar;
    Terminal: TsListBox;
    sGroupBox3: TsGroupBox;
    sGroupBox4: TsGroupBox;
    sGroupBox5: TsGroupBox;
    sListBox1: TsListBox;
    sListBox2: TsListBox;
    sListBox3: TsListBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCompress: TFCompress;

implementation

{$R *.dfm}

end.
