object FMain: TFMain
  Left = 260
  Top = 50
  BorderStyle = bsDialog
  Caption = 'Image Compress with Huffman Coding'
  ClientHeight = 641
  ClientWidth = 706
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Cambria'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object StatusInfo: TStatusBar
    Left = 0
    Top = 622
    Width = 706
    Height = 19
    Panels = <
      item
        Text = 'Info Citra'
        Width = 245
      end
      item
        Width = 150
      end
      item
        Width = 50
      end
      item
        Width = 300
      end>
    OnDrawPanel = StatusInfoDrawPanel
  end
  object sGroupBox1: TsGroupBox
    Left = 8
    Top = 0
    Width = 217
    Height = 289
    Caption = 'Buka Citra Asli'
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    object OriginalImage: TImage
      Left = 8
      Top = 24
      Width = 201
      Height = 217
      Stretch = True
    end
    object OpenCitra: TsBitBtn
      Left = 8
      Top = 248
      Width = 201
      Height = 33
      Caption = 'Open Image'
      TabOrder = 0
      OnClick = OpenCitraClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object GroupFCM: TsGroupBox
    Left = 240
    Top = 0
    Width = 225
    Height = 289
    Caption = 'Proses Fuzzy C-Means'
    Enabled = False
    TabOrder = 2
    SkinData.SkinSection = 'GROUPBOX'
    object sLabel1: TsLabel
      Left = 16
      Top = 24
      Width = 124
      Height = 19
      Caption = 'Jumlah Cluster(C):'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Cambria'
      Font.Style = [fsItalic]
    end
    object sLabel2: TsLabel
      Left = 16
      Top = 72
      Width = 85
      Height = 19
      Caption = 'Maks.Iterasi:'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Cambria'
      Font.Style = [fsItalic]
    end
    object sLabel3: TsLabel
      Left = 16
      Top = 120
      Width = 131
      Height = 19
      Caption = 'Besar Galat(Error):'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Cambria'
      Font.Style = [fsItalic]
    end
    object txtCluster: TsEdit
      Left = 16
      Top = 40
      Width = 185
      Height = 27
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '3'
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object txtMaxEpoch: TsEdit
      Left = 16
      Top = 88
      Width = 185
      Height = 27
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '100'
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object txtMaxError: TsEdit
      Left = 16
      Top = 136
      Width = 185
      Height = 27
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = '0.01'
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object btnFCM: TsBitBtn
      Left = 8
      Top = 248
      Width = 201
      Height = 33
      Caption = 'Proses FCM'
      TabOrder = 3
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object GroupCompress: TsGroupBox
    Left = 480
    Top = 0
    Width = 217
    Height = 289
    Caption = 'Hasil Citra Fuzzy C-Means'
    Enabled = False
    TabOrder = 3
    SkinData.SkinSection = 'GROUPBOX'
    object HasilImage: TImage
      Left = 8
      Top = 24
      Width = 201
      Height = 217
      Stretch = True
    end
    object btnCompress: TsBitBtn
      Left = 8
      Top = 248
      Width = 201
      Height = 33
      Caption = 'Kompres Gambar'
      Enabled = False
      TabOrder = 0
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object Tabulasi: TsPageControl
    Left = 8
    Top = 296
    Width = 689
    Height = 321
    ActivePage = TabMatriksData
    TabOrder = 4
    SkinData.SkinSection = 'PAGECONTROL'
    object TabTerminal: TsTabSheet
      Caption = 'Terminal'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object Terminal: TsListBox
        Left = 8
        Top = 8
        Width = 665
        Height = 273
        AutoCompleteDelay = 500
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        ItemHeight = 15
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Consolas'
        Font.Style = [fsItalic]
        ParentFont = False
        TabOrder = 0
      end
    end
    object TabMatriksData: TsTabSheet
      Caption = 'Matrik Data Citra'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object PixelDataRed: TsListBox
        Left = 8
        Top = 40
        Width = 217
        Height = 241
        AutoCompleteDelay = 500
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        ItemHeight = 14
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Cambria'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object PixelDataGreen: TsListBox
        Left = 232
        Top = 40
        Width = 217
        Height = 241
        AutoCompleteDelay = 500
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        ItemHeight = 14
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Cambria'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object PixelDataBlue: TsListBox
        Left = 456
        Top = 40
        Width = 217
        Height = 241
        AutoCompleteDelay = 500
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        ItemHeight = 14
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Cambria'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object btnTampilDataAsli: TsBitBtn
        Left = 8
        Top = 0
        Width = 113
        Height = 33
        Caption = 'Tamil Data'
        Enabled = False
        TabOrder = 3
        OnClick = btnTampilDataAsliClick
        SkinData.SkinSection = 'BUTTON'
      end
    end
    object TabPusatCluster: TsTabSheet
      Caption = 'Pusat Cluster'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object DataPusatCluster: TsListBox
        Left = 8
        Top = 8
        Width = 665
        Height = 273
        AutoCompleteDelay = 500
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        ItemHeight = 19
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Cambria'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object TabAnggota: TsTabSheet
      Caption = 'Derajat Keanggotaan'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object DataAnggota: TsListBox
        Left = 8
        Top = 8
        Width = 665
        Height = 273
        AutoCompleteDelay = 500
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        ItemHeight = 19
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Cambria'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object TabFCM: TsTabSheet
      Caption = 'Hasil FCM'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sPageControl1: TsPageControl
        Left = 8
        Top = 8
        Width = 665
        Height = 273
        ActivePage = sTabSheet1
        TabOrder = 0
        SkinData.SkinSection = 'PAGECONTROL'
        object sTabSheet1: TsTabSheet
          Caption = 'Pixel Red'
          SkinData.CustomColor = False
          SkinData.CustomFont = False
          object HasilRed: TStringGrid
            Left = 0
            Top = 0
            Width = 657
            Height = 233
            TabOrder = 0
          end
          object ProgressBar1: TProgressBar
            Left = 432
            Top = 192
            Width = 150
            Height = 17
            TabOrder = 1
          end
        end
        object sTabSheet2: TsTabSheet
          Caption = 'Pixel Green'
          SkinData.CustomColor = False
          SkinData.CustomFont = False
          object HasilGreen: TStringGrid
            Left = 0
            Top = 0
            Width = 657
            Height = 233
            TabOrder = 0
          end
        end
        object sTabSheet3: TsTabSheet
          Caption = 'Pixel Blue'
          SkinData.CustomColor = False
          SkinData.CustomFont = False
          object HasilBlue: TStringGrid
            Left = 0
            Top = 0
            Width = 657
            Height = 233
            TabOrder = 0
          end
        end
      end
    end
    object TabCompress: TsTabSheet
      Caption = 'Info Compress'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object CompressInfo: TsListBox
        Left = 8
        Top = 8
        Width = 665
        Height = 273
        AutoCompleteDelay = 500
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        ItemHeight = 19
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Cambria'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'BMP File|*.bmp'
    Left = 512
    Top = 64
  end
  object sSkinManager1: TsSkinManager
    IsDefault = False
    InternalSkins = <>
    MenuSupport.IcoLineSkin = 'ICOLINE'
    MenuSupport.ExtraLineFont.Charset = DEFAULT_CHARSET
    MenuSupport.ExtraLineFont.Color = clWindowText
    MenuSupport.ExtraLineFont.Height = -11
    MenuSupport.ExtraLineFont.Name = 'MS Sans Serif'
    MenuSupport.ExtraLineFont.Style = []
    SkinDirectory = 'C:\Program Files (x86)\Borland\Delphi7\Lib\AlphaControl\Skins'
    SkinName = 'Opus'
    SkinInfo = '6.4'
    ThirdParty.ThirdEdits = ' '
    ThirdParty.ThirdButtons = 'TButton'
    ThirdParty.ThirdBitBtns = ' '
    ThirdParty.ThirdCheckBoxes = ' '
    ThirdParty.ThirdGroupBoxes = ' '
    ThirdParty.ThirdListViews = ' '
    ThirdParty.ThirdPanels = ' '
    ThirdParty.ThirdGrids = ' '
    ThirdParty.ThirdTreeViews = ' '
    ThirdParty.ThirdComboBoxes = ' '
    ThirdParty.ThirdWWEdits = ' '
    ThirdParty.ThirdVirtualTrees = ' '
    ThirdParty.ThirdGridEh = ' '
    ThirdParty.ThirdPageControl = ' '
    ThirdParty.ThirdTabControl = ' '
    ThirdParty.ThirdToolBar = ' '
    ThirdParty.ThirdStatusBar = ' '
    ThirdParty.ThirdSpeedButton = ' '
    Left = 88
    Top = 88
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Huffman File(*.hf)|*.hf|All Files|*.*'
    Left = 584
    Top = 88
  end
end
