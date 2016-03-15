object Form1: TForm1
  Left = 192
  Top = 107
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Tetris'
  ClientHeight = 432
  ClientWidth = 476
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 379
    Top = 177
    Width = 65
    Height = 17
    AutoSize = False
    Caption = 'Caption 1'
    Visible = False
  end
  object Label2: TLabel
    Left = 379
    Top = 200
    Width = 89
    Height = 17
    AutoSize = False
    Caption = 'Caption 2'
    Visible = False
  end
  object Label3: TLabel
    Left = 376
    Top = 214
    Width = 77
    Height = 17
    AutoSize = False
  end
  object pnlFirst: TPanel
    Left = 8
    Top = 72
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
    Top = 72
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
    Left = 189
    Top = 75
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
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 476
    Height = 22
    AutoSize = True
    ButtonWidth = 85
    Caption = 'ToolBar1'
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 4
    Wrapable = False
    object ToolButton2: TToolButton
      Left = 0
      Top = 0
      Action = Action1
      Caption = 'Einzelspieler'
      ImageIndex = 1
    end
    object ToolButton3: TToolButton
      Left = 85
      Top = 0
      Action = Action2
      Caption = 'Mehrspieler'
      ImageIndex = 2
    end
    object ToolButton1: TToolButton
      Left = 170
      Top = 0
      Action = DateiFileExit1
      Caption = 'Beenden'
      ParentShowHint = False
      ShowHint = False
    end
  end
  object pnlSightBlock: TPanel
    Left = 267
    Top = 367
    Width = 185
    Height = 41
    BorderStyle = bsSingle
    TabOrder = 5
    Visible = False
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 248
    Top = 304
  end
  object Timer2: TTimer
    Interval = 500
    OnTimer = Timer2Timer
    Left = 296
    Top = 304
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 88
    Top = 304
    object DateiFileExit1: TFileExit
      Category = 'Datei'
      Caption = '&Beenden'
      Hint = 'Beenden|Anwendung beenden'
      ImageIndex = 0
    end
    object Action1: TAction
      Category = 'Datei'
      Caption = 'Action1'
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Category = 'Datei'
      Caption = 'Action2'
      OnExecute = Action2Execute
    end
  end
  object ImageList1: TImageList
    Left = 88
    Top = 352
    Bitmap = {
      494C010103000800400010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000008686860086868600868686008686
      8600868686008686860086868600868686008686860086868600FFFFFF00C0C0
      C00086868600C0C0C000FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFFFF00FCFC
      FC00FDFDFD00FAF9FB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFF0033722800FBFFF900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5FFEE0034752A00FFFD
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008686860086868600868686008686
      860086868600868686008686860086868600868686008686860086868600FFFF
      FF0086868600FFFFFF008686860086868600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EFEFEF00E7F4E400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3FFF0000C86220025640E00FFF9
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00256D0D000D831E00E7FA
      E700F6FFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      00000000000000000000868686008686860086868600FFFFFF00FFFFFF00FFFF
      FF0080000000800000008000000080000000FFFFFF00FFFFFF00FFFFFF00FBFF
      FC0074B774001EB62F00A8C9A600FCFBFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001F630E0000972E00029D32001F64
      1400FFFFFF00FFFFFF00FFFFFF00FFFFFF00194B110002982E00019D3200166A
      0B00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000FF00000080000000000000000000000086868600FFFFFF00FFFFFF00FFFF
      FF0080000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00F7FD
      F8006BAF680000A90000109A0C002B782E00EEF3F100FEFFFD00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFFFF5000A75140005A3380014A4
      3B00A0C79A00FFFFFF00FFFFFF00FFFFFF00FFFCFF0028701600009D330004AB
      3E001E6E1300FFFFFE00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      000080000000FF0000008000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00F7FD
      F8006BAF680000C8000006BA07000496020004780700FDFBFB00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE001A5014000DA93E000BB2
      4300066D0C00FBFDFD00FFFFFF00FFFFFF00FFFFFF00F8FFF400056A08000BAE
      42001DB4470020531900FFFEFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000FF00000080000000FF00000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FBFC
      FF0070AE7A0000D4040003BA040004A50300018901001E911800E5FDDD00FCFC
      FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001E73070000BB
      46000EC04F0024650F00FFF9FF00FFFFFF00FFFFFF00FFFFFF00A4CAA00013B2
      44000AC04A00007E1500FDFFF500F4FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      000080000000FF0000008000000000000000FFFFFF00FFFF0000FFFFFF00FFFF
      000080000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00F7FE
      FB006EAB6B0003C5000003B3020002A10500018D0000007B00001973130082C1
      8F00FCFDFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFDF9001C70
      120014C6550021D362002D692300FFFFFF00FFFFFF00FFFFFF00FDFFFF00206D
      120008C24B0013CB5900246C1200FFFBFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000FF00000080000000FF00000000000000FFFF0000FFFFFF00FFFF0000FFFF
      FF0080000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00F7FE
      FB006EAB6B0006B9060003A402000694050000810200006D0100005D02000045
      090035712B00FAF7F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDFF
      F00019A43C0015D65E0031C25600EBFCE700FFFFFF00FFFFFF00FFFFFF00FFFD
      FF00236C160015D15A0018DA62001A6810000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      000080000000FF0000008000000000000000FFFFFF00FFFF0000FFFFFF00FFFF
      000080000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FC0071AB71001FA41E0024A41F0028A029002A9429002B8D2D00358435003376
      3F0042783500F5F7F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E6FF
      EB001897310019DB630042C96200F4FFF400FFFFFF00FFFFFF00FFFFFF00FFFC
      FF00276E170018D85D0014DF66002A6E15000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000FF00000080000000FF00000000000000FFFF0000FFFFFF00FFFF0000FFFF
      FF0080000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FEFF
      FB006CA66C0035A736003AA93D0040A44500439F40004A9C4A00408B41008AB9
      9300FBFFF900F5FBFA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0F4EF001167
      090015D65E0019E16C0024601A00FFFFFF00FFFFFF00FFFFFF00FAFFFD001465
      08001BD65C001EDA63001A6C0D00FBFEFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000800000008000000080000000800000008000000080000000800000008000
      000080000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FDFF
      FC0070A3710050AC530056AC540058AC5A005AA35D00296E2300ECFCEB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE0020720F0013D1
      5C0019DA62001A6F1300FFFAFF00FFFFFF00FFFFFF00FFFFFF00D4F5D00024C8
      5C001BD760000A871A00F3FFF800FFFEFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FAFF
      FE006E9A710064B062005DAB570077BE7B0000380000E2EAE900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE002B5F230015CD5B0019D7
      60001F6A0E00FAFFFB00FFFFFF00FFFFFF00FFFFFF00FEFFF800066F0E0013D4
      5C0025D9630034632500FDFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FE006F946C0081C584008AD0910028562800FBFCFA00FFFDFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4F4E9000066040014D25B0032D7
      680099C19100FFFFFF00FFFFFF00FFFFFF00FFFDFF002D721B0012CD590011DA
      6100116C0F00F9FDFE00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000800000008000000080000000800000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FE007392710090D193009AA99400F6FBFA00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0033711F0015CE5A0004CF58001C64
      1200FFFFFF00FFFFFF00FFFFFF00FFFFFF00245C1B000DCE560013D45C00186C
      0D00FDFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00ECECEC00EBEBEB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006E92660024CC5B00166B0F00FFFA
      FF00FEFEFE00FEFEFE00FEFEFE00FFFFFF00FAFEFF001B6D0E002DB84900F3FE
      EE00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F8F8F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFDFF0010620900F7FFF700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1FFEB0024651A00FDFF
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000E007000000000000E007000000000000E007000000000000
      E007000000000000E007000000000000E007000000000000E007000000000000
      E007000000000000FFFF000000000000F81F000000000000F81F000000000000
      F81F000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
end
