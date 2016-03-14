object Form1: TForm1
  Left = 192
  Top = 107
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Tetris'
  ClientHeight = 412
  ClientWidth = 476
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 400
    Top = 104
    Width = 65
    Height = 17
    AutoSize = False
    Caption = 'Caption 1'
  end
  object Label2: TLabel
    Left = 384
    Top = 128
    Width = 89
    Height = 17
    AutoSize = False
    Caption = 'Caption 2'
  end
  object Label3: TLabel
    Left = 376
    Top = 214
    Width = 77
    Height = 17
    AutoSize = False
  end
  object pnlFirst: TPanel
    Left = 16
    Top = 16
    Width = 153
    Height = 217
    BevelInner = bvLowered
    TabOrder = 0
    object imgFirst: TImage
      Left = 13
      Top = 9
      Width = 124
      Height = 192
    end
  end
  object pnlNextFigure: TPanel
    Left = 379
    Top = 9
    Width = 89
    Height = 89
    BevelInner = bvLowered
    TabOrder = 1
    object imgNextFigure: TImage
      Left = 8
      Top = 8
      Width = 65
      Height = 73
    end
  end
  object pnlSecond: TPanel
    Left = 197
    Top = 19
    Width = 148
    Height = 212
    Align = alCustom
    BevelInner = bvLowered
    TabOrder = 2
    object imgSecond: TImage
      Left = 13
      Top = 6
      Width = 124
      Height = 192
    end
  end
  object pnlNextFigureSecond: TPanel
    Left = 379
    Top = 231
    Width = 89
    Height = 89
    BevelInner = bvLowered
    TabOrder = 3
    object imgNextFigureSecond: TImage
      Left = 8
      Top = 6
      Width = 65
      Height = 73
    end
  end
  object MainMenu1: TMainMenu
    Left = 376
    Top = 160
    object mnuGame: TMenuItem
      Caption = 'Caption 1 M'
      object mnuNew: TMenuItem
        Caption = 'Caption 2 M'
        ShortCut = 113
        OnClick = mnuNewClick
      end
      object mnuS1: TMenuItem
        Caption = '-'
      end
      object mnuExit: TMenuItem
        Caption = 'Caption 3 m'
        OnClick = mnuExitClick
      end
    end
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 304
    Top = 264
  end
  object Timer2: TTimer
    Interval = 500
    OnTimer = Timer2Timer
    Left = 256
    Top = 264
  end
end
