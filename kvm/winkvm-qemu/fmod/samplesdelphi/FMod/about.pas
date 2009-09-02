unit about;

{$WARN UNSAFE_TYPE OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmAbout = class(TForm)
    lblCopyright: TLabel;
    imgLogo: TImage;
    Label1: TLabel;
    btnClose: TButton;
    lblAPIVersion: TLabel;
    Label3: TLabel;
    lblDLLVersion: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblEmail: TLabel;
    lblWeb: TLabel;
    Label10: TLabel;
    lblOutput: TLabel;
    lblMixer: TLabel;
    lblFastCD: TLabel;
    Label2: TLabel;
    lblDriver: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblEmailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.DFM}

uses
  fmod, fmodtypes, ShellApi;

const
  OutputTypes: array [TFSoundOutputTypes] of String =
    (
      'FSOUND_OUTPUT_NOSOUND',
      'FSOUND_OUTPUT_WINMM',
      'FSOUND_OUTPUT_DSOUND',
      'FSOUND_OUTPUT_A3D',
      'FSOUND_OUTPUT_OSS',
      'FSOUND_OUTPUT_ESD',
      'FSOUND_OUTPUT_ALSA',
      'FSOUND_OUTPUT_ASIO',
      'FSOUND_OUTPUT_XBOX',
      'FSOUND_OUTPUT_PS2',
      'FSOUND_OUTPUT_MAC',
      'FSOUND_OUTPUT_GC',
      'FSOUND_OUTPUT_NOSOUND_REALTIME'
    );

  MixerTypes: array [TFSoundMixerTypes] of String =
    (
      'FSOUND_MIXER_AUTODETECT',
      'FSOUND_MIXER_BLENDMODE',
      'FSOUND_MIXER_MMXP5',
      'FSOUND_MIXER_MMXP6',

      'FSOUND_MIXER_QUALITY_AUTODETECT',
      'FSOUND_MIXER_QUALITY_FPU',
      'FSOUND_MIXER_QUALITY_MMXP5',
      'FSOUND_MIXER_QUALITY_MMXP6',

      'FSOUND_MIXER_MONO',
      'FSOUND_MIXER_QUALITY_MONO',

      'FSOUND_MIXER_MAX'
    );

procedure TfrmAbout.FormShow(Sender: TObject);
var
  Channels2D, Channels3D, ChannelsTotal: Integer;
begin
  FSOUND_GetNumHWChannels(Channels2D, Channels3D, ChannelsTotal);
  lblAPIVersion.Caption := Format('%3.2f', [FMOD_VERSION]);
  lblDLLVersion.Caption := Format('%3.2f', [FSOUND_GetVersion]);
  lblDriver.Caption := FSOUND_GetDriverName(FSOUND_GetDriver);
  lblOutput.Caption := Format('%s at %dHz', [OutputTypes[FSOUND_GetOutput], FSOUND_GetOutputRate]);
  lblMixer.Caption := Format('%s using up to %d channels (%d in hardware)', [MixerTypes[FSOUND_GetMixer], FSOUND_GetMaxChannels, ChannelsTotal]);
end;

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
  DesktopFont := True;
end;

procedure TfrmAbout.lblEmailClick(Sender: TObject);
begin
  ShellExecute(Application.MainForm.Handle, 'open', PChar((Sender as TLabel).Caption), nil, nil, SW_SHOWNORMAL);
end;

end.
