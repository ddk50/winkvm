object frmConfig: TfrmConfig
  Left = 191
  Top = 107
  ActiveControl = cbxOutputType
  BorderStyle = bsDialog
  Caption = 'FMOD Configuration'
  ClientHeight = 290
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    281
    290)
  PixelsPerInch = 96
  TextHeight = 13
  object lblOutputType: TLabel
    Left = 12
    Top = 12
    Width = 55
    Height = 13
    Caption = 'Output type'
  end
  object lblOutputDevice: TLabel
    Left = 12
    Top = 60
    Width = 67
    Height = 13
    Caption = 'Output device'
  end
  object lblMixerType: TLabel
    Left = 12
    Top = 108
    Width = 48
    Height = 13
    Caption = 'Mixer type'
  end
  object lblOutputRate: TLabel
    Left = 12
    Top = 156
    Width = 53
    Height = 13
    Caption = 'Output rate'
  end
  object btnOk: TButton
    Left = 109
    Top = 256
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 4
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 193
    Top = 256
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
    OnClick = btnCancelClick
  end
  object cbxOutputType: TComboBox
    Left = 8
    Top = 28
    Width = 258
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 0
    OnChange = cbxOutputTypeChange
    Items.Strings = (
      'Window Multimedia WaveOut'
      'DirectSound'
      'A3D')
  end
  object cbxOutputDevice: TComboBox
    Left = 8
    Top = 76
    Width = 258
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 1
  end
  object cbxMixerType: TComboBox
    Left = 8
    Top = 124
    Width = 258
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 2
    Items.Strings = (
      'Auto-detect'
      'Non-MMX blendmode mixer'
      'MMX, Pentium optimized blendmode mixer'
      'MMX, PPro/P2/P3 optimized mixer'
      'Auto-detect interpolating mixer'
      'Interpolating FPU mixer'
      'Interpolating Pentium mixer'
      'Interpolating PPro/P2/P3 mixer')
  end
  object cbxOutputRate: TComboBox
    Left = 8
    Top = 172
    Width = 258
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 3
    Items.Strings = (
      '48000Hz'
      '44100Hz'
      '22050Hz'
      '11025Hz'
      '8000Hz')
  end
  object chkSoftwareMIDI: TCheckBox
    Left = 8
    Top = 204
    Width = 257
    Height = 17
    Caption = 'Force software MIDI decoding'
    TabOrder = 6
  end
  object chkGlobalFocus: TCheckBox
    Left = 8
    Top = 228
    Width = 257
    Height = 17
    Caption = 'Global focus (DSOUND only)'
    TabOrder = 7
  end
end
