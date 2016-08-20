object FCompress: TFCompress
  Left = 217
  Top = 42
  Width = 928
  Height = 687
  Caption = 'FCompress'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Cambria'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 19
  object sGroupBox1: TsGroupBox
    Left = 8
    Top = 8
    Width = 209
    Height = 281
    Caption = 'Citra Asli'
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object Image1: TImage
      Left = 8
      Top = 16
      Width = 185
      Height = 201
    end
    object OpenCitra: TsBitBtn
      Left = 8
      Top = 224
      Width = 185
      Height = 49
      Caption = 'OpenCitra'
      TabOrder = 0
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sGroupBox2: TsGroupBox
    Left = 256
    Top = 8
    Width = 217
    Height = 265
    Caption = 'sGroupBox2'
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
  end
  object TabControlKu: TsPageControl
    Left = 8
    Top = 296
    Width = 889
    Height = 321
    ActivePage = TabMatriksData
    TabOrder = 2
    SkinData.SkinSection = 'PAGECONTROL'
    object TabTerminal: TsTabSheet
      Caption = 'Terminal'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object Terminal: TsListBox
        Left = 0
        Top = 0
        Width = 881
        Height = 289
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
        Color = clMenuText
        TabOrder = 0
      end
    end
    object TabMatriksData: TsTabSheet
      Caption = 'Matriks Data Citra'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sGroupBox3: TsGroupBox
        Left = 8
        Top = 8
        Width = 265
        Height = 273
        Caption = 'Matriks Data Red'
        Color = clBtnHighlight
        ParentColor = False
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object sListBox1: TsListBox
          Left = 8
          Top = 16
          Width = 249
          Height = 249
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
          TabOrder = 0
        end
      end
      object sGroupBox4: TsGroupBox
        Left = 304
        Top = 8
        Width = 265
        Height = 273
        Caption = 'Matriks Data Green'
        Color = clBtnHighlight
        ParentColor = False
        TabOrder = 1
        SkinData.SkinSection = 'GROUPBOX'
        object sListBox2: TsListBox
          Left = 8
          Top = 16
          Width = 249
          Height = 249
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
      object sGroupBox5: TsGroupBox
        Left = 592
        Top = 8
        Width = 265
        Height = 273
        Caption = 'Matriks Data Blue'
        Color = clBtnHighlight
        ParentColor = False
        TabOrder = 2
        SkinData.SkinSection = 'GROUPBOX'
        object sListBox3: TsListBox
          Left = 8
          Top = 16
          Width = 249
          Height = 249
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
    object TabPusatCluster: TsTabSheet
      Caption = 'Pusat Cluster'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
    end
    object TabHasilFCM: TsTabSheet
      Caption = 'Hasil Pergitungan Fuzzy C-Means'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
    end
    object TabHuffmanInfo: TsTabSheet
      Caption = 'Informasi Compress Citra'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
    end
  end
  object Status: TStatusBar
    Left = 0
    Top = 625
    Width = 912
    Height = 23
    Panels = <>
  end
end
