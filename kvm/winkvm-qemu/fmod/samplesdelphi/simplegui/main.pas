unit main;

{ Disable warning for unsafe types in Delphi 7 }
{$IFDEF VER150}
{$WARN UNSAFE_TYPE OFF}
{$ENDIF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, fmod, fmodtypes;

type
  TfrmMain = class(TForm)
    pnlButtons: TPanel;
    btnClose: TButton;
    bvlButtons: TBevel;
    lblOutput: TLabel;
    lbxOutput: TListBox;
    lbxDriver: TListBox;
    lblDriver: TLabel;
    btnInit: TButton;
    btnDeinit: TButton;
    btnPlay: TButton;
    btnStop: TButton;
    lblCPUUsage: TLabel;
    lblCPU: TLabel;
    tmrMain: TTimer;
    btn16bit: TButton;
    btn8bit: TButton;
    btn16bitstereo: TButton;
    lblPlaySound: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure lbxOutputClick(Sender: TObject);
    procedure btnInitClick(Sender: TObject);
    procedure btnDeinitClick(Sender: TObject);
    procedure tmrMainTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPlayClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btn16bitClick(Sender: TObject);
    procedure btn8bitClick(Sender: TObject);
    procedure btn16bitstereoClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    FInitialised: Boolean;
    FPlaying: Boolean;
    FMusic: PFMusicModule;
    FSound1: PFSoundSample;
    FSound2: PFSoundSample;
    FSound3: PFSoundSample;
    function Load: Boolean;
    procedure Unload;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  fmoderrors;

{$R *.dfm}

type
  TOutput = record
    Value: TFSoundOutputTypes;
    Name: String;
  end;

const
{$IFDEF MSWINDOWS}
  Output: array [0..4] of TOutput =
  (
    ( Value: FSOUND_OUTPUT_DSOUND;  Name: 'DirectSound' ),
    ( Value: FSOUND_OUTPUT_WINMM;   Name: 'Windows Multimedia' ),
    ( Value: FSOUND_OUTPUT_A3D;     Name: 'A3D' ),
    ( Value: FSOUND_OUTPUT_ASIO;    Name: 'ASIO' ),
    ( Value: FSOUND_OUTPUT_NOSOUND; Name: 'No sound' )
  );
{$ELSE}
{$IFDEF LINUX}
  Output: array [0..3] of TOutput =
  (
    ( Value: FSOUND_OUTPUT_OSS;     Name: 'Open Sound System' ),
    ( Value: FSOUND_OUTPUT_ESD;     Name: 'Enlightenment Sound Daemon' ),
    ( Value: FSOUND_OUTPUT_ALSA;    Name: 'ALSA' ),
    ( Value: FSOUND_OUTPUT_NOSOUND; Name: 'No sound' )
  );
{$ENDIF}
{$ENDIF}

procedure TfrmMain.FormCreate(Sender: TObject);
var
  Index: Integer;
begin
  { Use the default Windows desktop font }
  DesktopFont := True;

  FMOD_Load(nil);

  { Populate the list of output types with both the name and enumeration value }
  { Use a typecasting trick to store an integer value as an object }
  for Index := Low(Output) to High(Output) do
    lbxOutput.Items.AddObject(Output[Index].Name, TObject(Output[Index].Value));

  { Pre-select the first output type in the list }
  lbxOutput.ItemIndex := 0;
  lbxOutputClick(nil);
end;

procedure TfrmMain.lbxOutputClick(Sender: TObject);
var
  Index: Integer;
begin
  { Clear the existing list }
  lbxDriver.Items.Clear;

  { If no output type is selected, then exit }
  if lbxOutput.ItemIndex < 0 then
    Exit;

  { Set the output type }
  FSOUND_SetOutput(TFSoundOutputTypes(lbxOutput.Items.Objects[lbxOutput.ItemIndex]));

  { Get the list of available drivers }
  for Index := 0 to FSOUND_GetNumDrivers - 1 do
    lbxDriver.Items.Add(FSOUND_GetDriverName(Index));

  { Select the first driver in the list }
  if lbxDriver.Items.Count > 0 then
    lbxDriver.ItemIndex := 0;
end;

procedure TfrmMain.btnInitClick(Sender: TObject);
begin
  { Make sure an output type is selected }
  if lbxOutput.ItemIndex < 0 then
  begin
    MessageDlg('Must select an output type', mtError, [mbOk], 0);
    lbxOutput.SetFocus;
    Exit;
  end;

  { Make sure a driver is selected }
  if lbxDriver.ItemIndex < 0 then
  begin
    MessageDlg('Must select a driver', mtError, [mbOk], 0);
    lbxDriver.SetFocus;
    Exit;
  end;

  { Set the output type }
  FSOUND_SetOutput(TFSoundOutputTypes(lbxOutput.Items.Objects[lbxOutput.ItemIndex]));

  { Set the driver }
  FSOUND_SetDriver(lbxDriver.ItemIndex);

  { Set the mixer }
  FSOUND_SetMixer(FSOUND_MIXER_QUALITY_AUTODETECT);

  { Initialise FMOD at 22.5kHz, 32 software channels and no special flags }
  FInitialised := FSOUND_Init(22500, 32, 0);

  if not FInitialised then
  begin
    MessageDlg('FMOD initialisation failed'#13 + FMOD_ErrorString(FSOUND_GetError), mtError, [mbOk], 0);
    Exit;
  end;

  { Set the enabled state of the buttons }
  btnInit.Enabled := False;
  btnDeinit.Enabled := True;
  btnPlay.Enabled := True;
  btnStop.Enabled := False;
  lbxOutput.Enabled := False;
  lbxDriver.Enabled := False;

  { Enable the timer to display song and CPU usage information }
  tmrMain.Enabled := True;
end;

procedure TfrmMain.btnDeinitClick(Sender: TObject);
begin
  if not FInitialised then
    Exit;

  { Press the stop button }
  btnStopClick(nil);

  { Close FMOD }
  FSOUND_Close;
  FInitialised := False;

  { Set the enabled state of the buttons }
  btnInit.Enabled := True;
  btnDeinit.Enabled := False;
  btnPlay.Enabled := False;
  btnStop.Enabled := False;
  lbxOutput.Enabled := True;
  lbxDriver.Enabled := True;

  { Stop the timer since we do not need the song and CPU information any more }
  tmrMain.Enabled := False;
  lblCPU.Caption := '';
end;

procedure TfrmMain.tmrMainTimer(Sender: TObject);
begin
  { What percentage of CPU is FMOD using? }
  lblCPU.Caption := Format('%0.1f%%', [FSOUND_GetCPUUsage]);
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  { If the form is being closed, then act as if the stop and deinit buttons
    have been pressed }
  btnStopClick(nil);
  btnDeinitClick(nil);
end;

procedure TfrmMain.btnPlayClick(Sender: TObject);
begin
  if FPlaying then
    Exit;

  { Load the music and samples }
  if not Load then
    Exit;

  { Play the music }
  FMUSIC_PlaySong(FMusic);
  FMUSIC_SetPanSeperation(FMusic, 0.15); { 15% crossover }

  FPlaying := True;

  { Set the enabled state of the buttons }
  btnPlay.Enabled := False;
  btnStop.Enabled := True;
  btn16bit.Enabled := True;
  btn8bit.Enabled := True;
  btn16bitstereo.Enabled := True;
end;

procedure TfrmMain.btnStopClick(Sender: TObject);
begin
  if not FPlaying then
    Exit;

  { Unload the music and samples }
  Unload;

  FPlaying := False;

  { Set the enabled state of the buttons }
  btnPlay.Enabled := True;
  btnStop.Enabled := False;
  btn16bit.Enabled := False;
  btn8bit.Enabled := False;
  btn16bitstereo.Enabled := False;
end;

function TfrmMain.Load: Boolean;
begin
  { Assume it will fail }
  Result := False;

  { Music }
  FMusic := FMUSIC_LoadSong('../../media/invtro94.s3m');
  if FMusic = nil then
  begin
    MessageDlg('Failed to load music'#13 + FMOD_ErrorString(FSOUND_GetError), mtError, [mbOk], 0);
    Unload;
    Exit;
  end;

  { 16bit sound }
  FSound1 := FSOUND_Sample_Load(FSOUND_FREE, '../../media/jaguar.wav', FSOUND_2D, 0, 0);
  if FSound1 = nil then
  begin
    MessageDlg('Failed to load jaguar.wav'#13 + FMOD_ErrorString(FSOUND_GetError), mtError, [mbOk], 0);
    Unload;
    Exit;
  end;

  { 8bit sound }
  FSound2 := FSOUND_Sample_Load(FSOUND_FREE, '../../media/drumloop.wav', FSOUND_2D, 0, 0);
  if FSound2 = nil then
  begin
    MessageDlg('Failed to load drumloop.wav'#13 + FMOD_ErrorString(FSOUND_GetError), mtError, [mbOk], 0);
    Unload;
    Exit;
  end;

  { 16bit stereo sound }
  FSound3 := FSOUND_Sample_Load(FSOUND_FREE, '../../media/chimes.wav', FSOUND_2D, 0, 0);
  if FSound3 = nil then
  begin
    MessageDlg('Failed to load chimes.wav'#13 + FMOD_ErrorString(FSOUND_GetError), mtError, [mbOk], 0);
    Unload;
    Exit;
  end;

  { We got this far, so it all succeeded }
  Result := True;
end;

procedure TfrmMain.Unload;
begin
  { Free the music }
  if FMusic <> nil then
  begin
    FMUSIC_FreeSong(FMusic);
    FMusic := nil;
  end;

  { Free the 16bit sample }
  if FSound1 <> nil then
  begin
    FSOUND_Sample_Free(FSound1);
    FSound1 := nil;
  end;

  { Free the 8bit sample }
  if FSound2 <> nil then
  begin
    FSOUND_Sample_Free(FSound2);
    FSound2 := nil;
  end;

  { Free the 16bit stereo sample }
  if FSound2 <> nil then
  begin
    FSOUND_Sample_Free(FSound2);
    FSound2 := nil;
  end;
end;

procedure TfrmMain.btn16bitClick(Sender: TObject);
begin
  { Play the 16bit sound }
  FSOUND_PlaySound(FSOUND_FREE, FSound1)
end;

procedure TfrmMain.btn8bitClick(Sender: TObject);
begin
  { Play the 8bit sound }
  FSOUND_PlaySound(FSOUND_FREE, FSound2)
end;

procedure TfrmMain.btn16bitstereoClick(Sender: TObject);
var
  Channel: Integer;
begin
  { Play the 16bit stereo sound }
  Channel := FSOUND_PlaySound(FSOUND_FREE, FSound3);
  FSOUND_SetPan(Channel, FSOUND_STEREOPAN);
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
