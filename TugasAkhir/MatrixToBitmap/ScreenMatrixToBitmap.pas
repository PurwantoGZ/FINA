// Sample of how to read matrix of real values from a text file,
// create in-memory bitmap, and display in image.
//
// Convert each real value to a pixel.  A radiobox selection determines
// whether a shades-of-gray scheme or a color spectrum is used.
//
// Requires D4 or later for dynamic memory allocation using
// ARRAY OF ARRAY construct.
//
// efg, September 2000, www.efg2.com/Lab

unit ScreenMatrixToBitmap;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TFormMatrixToBitmap = class(TForm)
    ButtonLoad: TButton;
    OpenDialog: TOpenDialog;
    LabelMin: TLabel;
    ImageShow: TImage;
    Memo: TMemo;
    RadioGroupColorScheme: TRadioGroup;
    LabelMax: TLabel;
    ImageScale: TImage;
    procedure ButtonLoadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMatrixToBitmap: TFormMatrixToBitmap;

implementation
{$R *.DFM}

USES
  SpectraLibrary,   // RainbowColor
  TokenLibrary;     // Tokens

procedure TFormMatrixToBitmap.ButtonLoadClick(Sender: TObject);
  TYPE
    TRGBTripleArray = ARRAY[WORD] OF TRGBTriple;
    pRGBTripleArray = ^TRGBTripleArray;

  VAR
    Bitmap     :  TBitmap;
    ColumnCount:  INTEGER;
    i          :  INTEGER;
    j          :  INTEGER;
    Row        :  pRGBTripleArray;
    RowCount   :  INTEGER;
    s          :  STRING;
    StringList :  TStringList;
    Tokens     :  TTokens;
    x          :  ARRAY OF ARRAY OF Double;
    xMax       :  Double;
    xMin       :  Double;
    value      :  BYTE;
begin
  OpenDialog.InitialDir := ExtractFilePath(ParamStr(0));

  IF   OpenDialog.Execute
  THEN BEGIN
    StringList := TStringList.Create;
    TRY
      StringList.LoadFromFile(OpenDialog.Filename);

      // Display contents of file
      Memo.Lines := StringList;

      // Get size dimensions of matrix
      Tokens := TTokens.Create(StringList.Strings[0], ', ', '"', '"', '\',
                                 tsMultipleSeparatorsBetweenTokens);
      TRY
        ASSERT (Tokens.Count >= 2, 'Matrix dimensions missing or invalid');
        ColumnCount := StrToIntDef(Tokens[0], 0);   // 0-origin
        RowCount    := StrToIntDef(Tokens[1], 0);

        // If either of the StrToIntDef's above fail in their conversion,
        // a zero value will be returned.  If one value is zero, the
        // product below will be zero and the assertion will fail.
        ASSERT(ColumnCount*RowCount > 0, 'Incorrect matrix dimensions');

        // Check for consistency between number of lines read in StringGrid
        // and the number of row specified to be present.
        ASSERT(RowCount = StringList.Count-1, 'Wrong number of rows in matrix')
      FINALLY
        Tokens.Free
      END;

      // Dynamic allocation of matrix "x"
      SetLength(x, ColumnCount, RowCount);

      // Convert rows of strings to matrix of numbers
      FOR j := 0 TO RowCount-1 DO
      BEGIN
        Tokens := TTokens.Create(StringList.Strings[1+j], ', ', '"', '"', '\',
                                 tsMultipleSeparatorsBetweenTokens);
        TRY
          ASSERT(Tokens.Count = ColumnCount, 'Wrong number of columns in matrix');

          FOR i := 0 To ColumnCount-1 DO
          BEGIN
            TRY
              x[i,j] := StrToFloat(Tokens[i]);
            EXCEPT
              ON EConvertError DO x[i,j] := 0.0
            END
          END

        FINALLY
          Tokens.Free
        END
      END

    FINALLY
      StringList.Free
    END;

    // Display matrix "x" to verify it was read correctly
    Memo.Lines.Add('');
    FOR j := 0 TO RowCount-1 DO
    BEGIN
      s := '';
      FOR i := 0 TO ColumnCount-1 DO
      BEGIN
        s := s + Format('%5.2f  ', [x[i,j]]);
      END;

      Memo.Lines.Add(s)
    END;

    // Find min and max values in "x" matrix
    xMin := x[0,0];
    xMax := x[0,0];
    FOR j := 0 TO RowCount-1 DO
    BEGIN
      FOR i := 0 TO ColumnCount-1 DO
      BEGIN
        IF   x[i,j] < xMin
        THEN xMin := x[i,j]
        ELSE
          IF   x[i,j] > xMax
          THEN xMax := x[i,j]
      END
    END;
    LabelMin.Caption := Format('Min=%.2f', [xMin]);
    LabelMax.Caption := Format('Max=%.2f', [xMax]);

    // Create one-to-one bitmap.  Convert each matrix element to gray-scale
    // pixel.  xMin = RGB(0,0,0) or black, and xMax = RGB(255,255,255) or
    // white.
    Bitmap := TBitmap.Create;
    TRY
      Bitmap.Width  := ColumnCount;
      Bitmap.Height := RowCount;
      Bitmap.PixelFormat := pf24bit;

      // Use a separate set of nested loops for each method for efficiency.
      IF   RadioGroupColorScheme.ItemIndex = 0
      THEN BEGIN

        // gray scale
        FOR j := 0 TO RowCount-1 DO
        BEGIN
          row := Bitmap.Scanline[j];
          FOR i := 0 TO ColumnCount-1 DO
          BEGIN
            // value = 0 for xMin and 255 for xMax
            value := Round(255*(x[i,j] - xMin)/(xMax - xMin));

            // Assign R=G=B for shades of gray
            Row[i].rgbtRed   := value;
            Row[i].rgbtGreen := value;
            Row[i].rgbtBlue  := value
          END
        END

      END
      ELSE BEGIN

        // rainbow colors
        FOR j := 0 TO RowCount-1 DO
        BEGIN
          row := Bitmap.Scanline[j];
          FOR i := 0 TO ColumnCount-1 DO
          BEGIN
            RainbowColor((x[i,j] - xMin)/(xMax - xMin),
                         Row[i].rgbtRed,
                         Row[i].rgbtGreen,
                         Row[i].rgbtBlue)
          END
        END

      END;

      // Display Bitmap in ImageShow.  Each Bitmap pixel becomes a 20-by-20
      // square in the stretched ImageShow.
      ImageShow.Width  := 20*ColumnCount;
      ImageShow.Height := 20*RowCount;
      ImageShow.Stretch := TRUE;

      ImageShow.Picture.Graphic := Bitmap
    FINALLY
      Bitmap.Free
    END;

    // Show color scale
    Bitmap := TBitmap.Create;
    TRY
      Bitmap.Width  := ImageScale.Width;
      Bitmap.Height := ImageScale.Height;
      Bitmap.PixelFormat := pf24bit;

      // Don't bother trying to optimize this since only needed once
      FOR j := 0 TO Bitmap.Height-1 DO
      BEGIN

        Row := Bitmap.ScanLine[j];

        FOR i := 0 TO Bitmap.Width-1 DO
        BEGIN


          IF   RadioGroupColorScheme.ItemIndex = 0
          THEN BEGIN
            // value = 0 for xMin and 255 for xMax
            value := Round(255*i/(Bitmap.Width-1));

            // Assign R=G=B for shades of gray
            Row[i].rgbtRed   := value;
            Row[i].rgbtGreen := value;
            Row[i].rgbtBlue  := value
          END
          ELSE RainbowColor(i/(Bitmap.Width-1),
                           Row[i].rgbtRed,
                           Row[i].rgbtGreen,
                           Row[i].rgbtBlue)
        END
      END;

      ImageScale.Picture.Graphic := Bitmap

    FINALLY
      Bitmap.Free
    END

  END
end;

end.
