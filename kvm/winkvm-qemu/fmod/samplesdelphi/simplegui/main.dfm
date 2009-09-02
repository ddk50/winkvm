object frmMain: TfrmMain
  Left = 206
  Top = 122
  ActiveControl = lbxOutput
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FMOD Simple Sample'
  ClientHeight = 320
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblOutput: TLabel
    Left = 12
    Top = 12
    Width = 32
    Height = 13
    Caption = '&Output'
    FocusControl = lbxOutput
  end
  object lblDriver: TLabel
    Left = 184
    Top = 12
    Width = 28
    Height = 13
    Caption = '&Driver'
    FocusControl = lbxDriver
  end
  object lblCPUUsage: TLabel
    Left = 12
    Top = 260
    Width = 25
    Height = 13
    Caption = 'CPU:'
  end
  object lblCPU: TLabel
    Left = 52
    Top = 260
    Width = 3
    Height = 13
  end
  object lblPlaySound: TLabel
    Left = 16
    Top = 172
    Width = 57
    Height = 13
    Caption = 'Play sounds'
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 279
    Width = 353
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 6
    object bvlButtons: TBevel
      Left = 0
      Top = 0
      Width = 353
      Height = 2
      Align = alTop
    end
    object btnClose: TButton
      Left = 260
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Close'
      TabOrder = 0
      OnClick = btnCloseClick
    end
  end
  object lbxOutput: TListBox
    Left = 8
    Top = 28
    Width = 161
    Height = 97
    ItemHeight = 13
    TabOrder = 0
    OnClick = lbxOutputClick
  end
  object lbxDriver: TListBox
    Left = 180
    Top = 28
    Width = 161
    Height = 97
    ItemHeight = 13
    TabOrder = 1
  end
  object btnInit: TButton
    Left = 12
    Top = 136
    Width = 75
    Height = 25
    Caption = '&Init'
    TabOrder = 2
    OnClick = btnInitClick
  end
  object btnDeinit: TButton
    Left = 96
    Top = 136
    Width = 75
    Height = 25
    Caption = 'D&einit'
    Enabled = False
    TabOrder = 3
    OnClick = btnDeinitClick
  end
  object btnPlay: TButton
    Left = 180
    Top = 136
    Width = 75
    Height = 25
    Caption = '&Play'
    Enabled = False
    TabOrder = 4
    OnClick = btnPlayClick
  end
  object btnStop: TButton
    Left = 264
    Top = 136
    Width = 75
    Height = 25
    Caption = '&Stop'
    Enabled = False
    TabOrder = 5
    OnClick = btnStopClick
  end
  object btn16bit: TButton
    Left = 12
    Top = 192
    Width = 75
    Height = 25
    Caption = '16bit'
    Enabled = False
    TabOrder = 7
    OnClick = btn16bitClick
  end
  object btn8bit: TButton
    Left = 96
    Top = 192
    Width = 75
    Height = 25
    Caption = '8bit'
    Enabled = False
    TabOrder = 8
    OnClick = btn8bitClick
  end
  object btn16bitstereo: TButton
    Left = 180
    Top = 192
    Width = 75
    Height = 25
    Caption = '16bit stereo'
    Enabled = False
    TabOrder = 9
    OnClick = btn16bitstereoClick
  end
  object tmrMain: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrMainTimer
    Left = 304
    Top = 180
  end
end
