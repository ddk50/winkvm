unit config;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmodtypes;

type
  TfrmConfig = class(TForm)
    btnOk: TButton;
    btnCancel: TButton;
    lblOutputType: TLabel;
    cbxOutputType: TComboBox;
    lblOutputDevice: TLabel;
    cbxOutputDevice: TComboBox;
    lblMixerType: TLabel;
    cbxMixerType: TComboBox;
    lblOutputRate: TLabel;
    cbxOutputRate: TComboBox;
    chkSoftwareMIDI: TCheckBox;
    chkGlobalFocus: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cbxOutputTypeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    OldOutputType: TFSoundOutputTypes;
    OldDriverIndex: Integer;
    OldMixer: TFSoundMixerTypes;
    OldOutputRate: Integer;
    procedure PopulateDevices;
  public
  end;

var
  frmConfig: TfrmConfig;

implementation

{$R *.DFM}

uses
  fmod;

procedure TfrmConfig.FormCreate(Sender: TObject);
begin
  DesktopFont := True;
end;

const
  OutputTypes: array [0..2] of TFSoundOutputTypes =
    (FSOUND_OUTPUT_WINMM, FSOUND_OUTPUT_DSOUND, FSOUND_OUTPUT_A3D);
  OutputRates: array [0..4] of Integer = (48000, 44100, 22050, 11025, 8000);

procedure TfrmConfig.cbxOutputTypeChange(Sender: TObject);
begin
  FSOUND_SetOutput(OutputTypes[cbxOutputType.ItemIndex]);
  chkGlobalFocus.Enabled := OutputTypes[cbxOutputType.ItemIndex] = FSOUND_OUTPUT_DSOUND;
  { Repopulate device combobox }
  PopulateDevices;
end;

procedure TfrmConfig.PopulateDevices;
var
  DriverCount: Integer;
  Driver: Integer;
begin
  cbxOutputDevice.Items.Clear;
  DriverCount := FSOUND_GetNumDrivers;
  if DriverCount > 0 then
  begin
    for Driver := 0 to DriverCount - 1 do
      cbxOutputDevice.Items.Add(FSOUND_GetDriverName(Driver));
    cbxOutputDevice.ItemIndex := 0;
  end;
  btnOk.Enabled := DriverCount > 0;
end;

procedure TfrmConfig.FormShow(Sender: TObject);
begin
  OldOutputType := FSOUND_GetOutput;
  case OldOutputType of
  FSOUND_OUTPUT_NOSOUND,
  FSOUND_OUTPUT_WINMM:
    cbxOutputType.ItemIndex := 0;
  FSOUND_OUTPUT_DSOUND:
    cbxOutputType.ItemIndex := 1;
  FSOUND_OUTPUT_A3D:
    cbxOutputType.ItemIndex := 2;
  end;
  chkGlobalFocus.Enabled := OutputTypes[cbxOutputType.ItemIndex] = FSOUND_OUTPUT_DSOUND;
  PopulateDevices;
  OldDriverIndex := FSOUND_GetDriver;
  cbxOutputDevice.ItemIndex := OldDriverIndex;
  OldMixer := FSOUND_GetMixer;
  cbxMixerType.ItemIndex := Ord(OldMixer);
  case FSOUND_GetOutputRate of
  8000:
    cbxOutputRate.ItemIndex := 4;
  11025:
    cbxOutputRate.ItemIndex := 3;
  22050:
    cbxOutputRate.ItemIndex := 2;
  44100:
    cbxOutputRate.ItemIndex := 1;
  48000:
    cbxOutputRate.ItemIndex := 0;
  end;
  OldOutputRate := FSOUND_GetOutputRate;
  { Now close FMOD. }
  FSOUND_Close;
end;

procedure TfrmConfig.btnOkClick(Sender: TObject);
var
  Flags: Cardinal;
begin
  FSOUND_SetOutput(OutputTypes[cbxOutputType.ItemIndex]);
  FSOUND_SetDriver(cbxOutputDevice.ItemIndex);
  FSOUND_SetMixer(TFSoundMixerTypes(cbxMixerType.ItemIndex));
  Flags := 0;
  if chkSoftwareMIDI.Checked then
    Flags := Flags or FSOUND_INIT_USEDEFAULTMIDISYNTH;
  if chkGlobalFocus.Checked then
    Flags := Flags or FSOUND_INIT_GLOBALFOCUS;
  FSOUND_Init(OutputRates[cbxOutputRate.ItemIndex], 128, Flags);
end;

procedure TfrmConfig.btnCancelClick(Sender: TObject);
begin
  { Reset the old output type, driver and mixer. }
  FSOUND_SetOutput(OldOutputType);
  FSOUND_SetDriver(OldDriverIndex);
  FSOUND_SetMixer(OldMixer);
  FSOUND_Init(OldOutputRate, FSOUND_GetMaxChannels, 0);
end;

procedure TfrmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult <> mrOk then
    btnCancelClick(nil);
end;

end.
