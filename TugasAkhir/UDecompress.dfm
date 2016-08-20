object FDecomppress: TFDecomppress
  Left = 644
  Top = 165
  BorderStyle = bsDialog
  Caption = 'FDecomppress'
  ClientHeight = 391
  ClientWidth = 273
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Cambria'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object sGroupBox1: TsGroupBox
    Left = 8
    Top = 0
    Width = 257
    Height = 305
    Caption = 'Hasil Dekompress Citra'
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object Image1: TImage
      Left = 8
      Top = 24
      Width = 241
      Height = 273
      Stretch = True
    end
    object ProgressBar1: TProgressBar
      Left = 64
      Top = 248
      Width = 150
      Height = 17
      TabOrder = 0
    end
  end
  object StatusInfo: TsStatusBar
    Left = 0
    Top = 366
    Width = 273
    Height = 25
    Panels = <
      item
        Width = 50
      end
      item
        Width = 150
      end>
    OnDrawPanel = StatusInfoDrawPanel
    SkinData.SkinSection = 'STATUSBAR'
  end
  object btnDeCompress: TsBitBtn
    Left = 8
    Top = 312
    Width = 257
    Height = 49
    Caption = 'Kompress Citra'
    TabOrder = 2
    SkinData.SkinSection = 'BUTTON'
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Huffman File(*.hf)|*.hf'
    Left = 80
    Top = 48
  end
end
