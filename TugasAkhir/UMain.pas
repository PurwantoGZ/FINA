unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, sGroupBox, sBitBtn,
  sAlphaListBox, sLabel, sEdit, sPageControl, sSkinManager, Grids;
//----------------------------- CLASS FCM ------------------------------------//

type
  T1Citra=array of  byte;
  T2Citra=array of array of byte;
  TFMain = class(TForm)
    OpenDialog1: TOpenDialog;
    StatusInfo: TStatusBar;
    sGroupBox1: TsGroupBox;
    OriginalImage: TImage;
    OpenCitra: TsBitBtn;
    GroupFCM: TsGroupBox;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    txtCluster: TsEdit;
    txtMaxEpoch: TsEdit;
    txtMaxError: TsEdit;
    btnFCM: TsBitBtn;
    GroupCompress: TsGroupBox;
    HasilImage: TImage;
    btnCompress: TsBitBtn;
    Tabulasi: TsPageControl;
    sSkinManager1: TsSkinManager;
    TabTerminal: TsTabSheet;
    TabMatriksData: TsTabSheet;
    TabPusatCluster: TsTabSheet;
    TabFCM: TsTabSheet;
    TabCompress: TsTabSheet;
    PixelDataRed: TsListBox;
    PixelDataGreen: TsListBox;
    PixelDataBlue: TsListBox;
    Terminal: TsListBox;
    DataPusatCluster: TsListBox;
    TabAnggota: TsTabSheet;
    DataAnggota: TsListBox;
    CompressInfo: TsListBox;
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sTabSheet2: TsTabSheet;
    sTabSheet3: TsTabSheet;
    HasilRed: TStringGrid;
    HasilGreen: TStringGrid;
    HasilBlue: TStringGrid;
    ProgressBar1: TProgressBar;
    SaveDialog1: TSaveDialog;
    btnTampilDataAsli: TsBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure StatusInfoDrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure OpenCitraClick(Sender: TObject);
    procedure btnTampilDataAsliClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;
  dataR,dataG,dataB:T2Citra;
  witdhImage,heightImage:integer;
implementation

uses Math;

{$R *.dfm}

procedure TFMain.FormCreate(Sender: TObject);
var
  ProgressBarStyle: integer;
begin
StatusInfo.Panels[3].Style := psOwnerDraw;
 ProgressBar1.Parent:=StatusInfo;
 ProgressBarStyle := GetWindowLong(ProgressBar1.Handle,
                                    GWL_EXSTYLE);
  ProgressBarStyle := ProgressBarStyle
                      - WS_EX_STATICEDGE;
  SetWindowLong(ProgressBar1.Handle,
                GWL_EXSTYLE,
                ProgressBarStyle);
end;

procedure TFMain.StatusInfoDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  if Panel = StatusBar.Panels[3] then
  with ProgressBar1 do begin
    Top := Rect.Top;
    Left := Rect.Left;
    Width := Rect.Right - Rect.Left - 15;
    Height := Rect.Bottom - Rect.Top;
  end;
end;

procedure  getDataPixel;
var
 Baris,kolom,i,j,jumBaris,jumKolom:integer;
 R,G,B:byte;
 Warna:longint;
 PDataBaris:PByteArray;
 Indeks:Integer;
begin
   jumBaris:=FMain.OriginalImage.Picture.Bitmap.Height;
   jumKolom:=FMain.OriginalImage.Picture.Bitmap.Width;
   witdhImage:=FMain.OriginalImage.Picture.Bitmap.Width;
    heightImage:= FMain.OriginalImage.Picture.Bitmap.Height;
   SetLength(dataR,jumBaris,jumKolom);
   SetLength(dataG,jumBaris,jumKolom);
   SetLength(dataB,jumBaris,jumKolom);

   for Baris:=0 to jumBaris-1 do
   begin
      PDataBaris:=FMain.OriginalImage.Picture.Bitmap.ScanLine[Baris];
      for kolom:=0 to jumKolom-1 do
      begin
          //Indeks:=3 *kolom;
          //dataR[Baris,kolom]:=PDataBaris[Indeks];
          //dataG[Baris,kolom]:=PDataBaris[Indeks+1];
          //dataB[Baris,kolom]:=PDataBaris[Indeks+2];
         Warna:=FMain.OriginalImage.Picture.Bitmap.Canvas.Pixels[kolom,Baris];
         dataR[Baris,kolom]:=GetRValue(Warna);
         dataG[Baris,kolom]:=GetGValue(Warna);
         dataB[Baris,kolom]:=GetBValue(Warna);
      end;
   end;

end;

procedure RekonstruksiCitra;
var i,j:integer;
R,G,B:byte;
begin
  FMain.HasilImage.Picture.Bitmap.Height:=heightImage;
  FMain.HasilImage.Picture.Bitmap.Width:=witdhImage;
  for i:=0 to heightImage-1 do 
  begin
    for j:=0 to witdhImage-1 do
    begin
         R:=dataR[i,j];
         G:=dataG[i,j];
         B:=dataB[i,j];
         FMain.HasilImage.Picture.Bitmap.Canvas.Pixels[j,i]:=RGB(R,G,B);
    end;
  end;
end;

procedure viewDataCitra(firstRows:integer;firstColms:integer;endRows:integer;endColms:integer);
var
i,j:integer;
strt,green,blue:String;
begin
for i:=firstRows to endRows-1 do
begin
    strt:='';
    green:='';
    blue:='';
    for j:=firstColms to endColms-1 do
    begin
         strt:=strt+floattostr(dataR[i,j])+' , ';
         green:=green+floattostr(dataG[i,j])+' , ';
         blue:=blue+floattostr(dataB[i,j])+' , ';
    end;
    FMain.PixelDataRed.Items.Add(strt);
    FMain.PixelDataBlue.Items.Add(blue);
    FMain.PixelDataGreen.Items.Add(green);
end;
end;

procedure TampilDataAsli;
var i,j,k:integer;
begin
FMain.PixelDataRed.Items.Clear;
FMain.PixelDataGreen.Items.Clear;
FMain.PixelDataBlue.Items.Clear;
FMain.PixelDataRed.Items.Add('----------------Matriks Pixel Red-----------------------');
FMain.PixelDataGreen.Items.Add('----------------Matriks Pixel Green-----------------------');
FMain.PixelDataBlue.Items.Add('----------------Matriks Pixel Blue-----------------------');

i:=0;
k:=1;
repeat
  j:=0;
  repeat
          FMain.PixelDataRed.Items.Add('----------------Data Blok-'+inttostr(k)+'---------------');
          FMain.PixelDataGreen.Items.Add('----------------Data Blok-'+inttostr(k)+'---------------');
          FMain.PixelDataBlue.Items.Add('----------------Data Blok-'+inttostr(k)+'---------------');
          viewDataCitra(i,j,i+8,j+8);
          FMain.PixelDataRed.Items.Add('-------------------------------------------------');
          FMain.PixelDataGreen.Items.Add('-------------------------------------------------');
          FMain.PixelDataBlue.Items.Add('-------------------------------------------------');
      j:=j+8;
      inc(k);
  until j=heightImage;
  i:=i+8;
until i=witdhImage;
end;

procedure TFMain.OpenCitraClick(Sender: TObject);
begin
btnTampilDataAsli.Enabled:=false;
PixelDataRed.Items.Clear;
PixelDataGreen.Items.Clear;
PixelDataBlue.Items.Clear;
  if  OpenDialog1.Execute then
  begin
      // ambil Citra
      OriginalImage.Picture.LoadFromFile(OpenDialog1.FileName);
      // Cek Citra
      if OriginalImage.Picture.Bitmap.PixelFormat<>pf24bit then
      begin
          ShowMessage('Pilihlah Citra Berwarna 24 Bit');
          OriginalImage :=nil;
          Exit;
      end;
  end;
getDataPixel;
RekonstruksiCitra;
btnTampilDataAsli.Enabled:=true;
GroupFCM.Enabled:=true;
end;

procedure TFMain.btnTampilDataAsliClick(Sender: TObject);
begin
   TampilDataAsli;
end;

end.
