unit main;

{$WARN UNSAFE_TYPE OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmodtypes, ExtCtrls, ComCtrls, spectrum;

const
  MAX_SONGS = 512;

type
  TSongType = record
    Module: PFMusicModule;
    Stream: PFSoundStream;
    Channel: Integer;
    Playing: Boolean;
  end;

  TfrmMain = class(TForm)
    dlgOpen: TOpenDialog;
    grpFiles: TGroupBox;
    lbxFiles: TListBox;
    btnLoad: TButton;
    btnDelete: TButton;
    btnPlay: TButton;
    btnStop: TButton;
    btnExit: TButton;
    btnAbout: TButton;
    btnConfig: TButton;
    grpCD: TGroupBox;
    grpFilters: TGroupBox;
    pnlChannels: TPanel;
    pnlCPU: TPanel;
    chkLowPass: TCheckBox;
    chkEcho: TCheckBox;
    chkReverb: TCheckBox;
    chkPreverb: TCheckBox;
    Label9: TLabel;
    Label10: TLabel;
    btnPlayCD: TButton;
    btnPauseCD: TButton;
    btnStopCD: TButton;
    btnPrevTrack: TButton;
    btnNextTrack: TButton;
    btnEjectCD: TButton;
    lblChannels: TLabel;
    lblCPU: TLabel;
    rdoContinuous: TRadioButton;
    rdoRandom: TRadioButton;
    rdoLooping: TRadioButton;
    Label21: TLabel;
    lblCDTrack: TLabel;
    lblCDStatus: TLabel;
    tmrMain: TTimer;
    chkPlaylist: TCheckBox;
    grpSongInfo: TGroupBox;
    Label1: TLabel;
    lblSongName: TLabel;
    Label2: TLabel;
    lblSongType: TLabel;
    Label3: TLabel;
    lblSongSpeed: TLabel;
    Label4: TLabel;
    lblSongBPM: TLabel;
    Label5: TLabel;
    lblSongOrder: TLabel;
    btnPrevOrder: TButton;
    btnNextOrder: TButton;
    Label6: TLabel;
    lblSongPattern: TLabel;
    Label7: TLabel;
    lblSongRow: TLabel;
    Label8: TLabel;
    lblSongMasterVolume: TLabel;
    trkMasterVolume: TTrackBar;
    pgrSong: TProgressBar;
    pnlSpectrum: TPanel;
    procedure btnLoadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrMainTimer(Sender: TObject);
    procedure lbxFilesClick(Sender: TObject);
    procedure trkMasterVolumeChange(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure btnPrevOrderClick(Sender: TObject);
    procedure btnNextOrderClick(Sender: TObject);
    procedure btnConfigClick(Sender: TObject);
    procedure btnEjectCDClick(Sender: TObject);
    procedure btnPlayCDClick(Sender: TObject);
    procedure btnStopCDClick(Sender: TObject);
    procedure btnPauseCDClick(Sender: TObject);
    procedure btnPrevTrackClick(Sender: TObject);
    procedure btnNextTrackClick(Sender: TObject);
    procedure pnlSpectrumClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    FSongs: array [0..MAX_SONGS - 1] of TSongType;
    FSettingMasterVolume: Boolean;
    FTrackNumber: Integer;
    FCDPaused: Boolean;
    FCDPlaying: Boolean;
    FNumTracks: Integer;
    FSpectrum: TMiniSpectrum;
    procedure ShowStaticSongInfo(Index: Integer);
    procedure ShowDynamicSongInfo(Index: Integer);
    procedure ShowCDInfo;
    procedure ShowSpectrum;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}

uses
  fmod, fmoderrors, about, config;

const
  MusicTypes: array [TFMusicTypes] of String =
    ('None', 'Protracker/FastTracker', 'ScreamTracker 3', 'FastTracker 2', 'Impulse Tracker', 'Midi', 'FMOD Sample Bank');

procedure TfrmMain.btnLoadClick(Sender: TObject);
var
  Index: Integer;
  Module: PFMusicModule;
  Stream: PFSoundStream;
  SongCount: Integer;
begin
  if dlgOpen.Execute then
  begin
    for Index := 0 to dlgOpen.Files.Count - 1 do
    begin
      SongCount := lbxFiles.Items.Count;

      if SongCount = MAX_SONGS then
      begin
        Application.MessageBox(PChar(Format('Limit of %d songs reached', [MAX_SONGS])), 'Load error', MB_OK or MB_ICONHAND);
        Exit;
      end;

      Stream := nil;
      Module := FMUSIC_LoadSong(PChar(dlgOpen.Files[Index]));
      if Module = nil then
      begin
        Stream := FSOUND_Stream_Open(PChar(dlgOpen.Files[Index]), FSOUND_NORMAL or FSOUND_LOOP_NORMAL, 0, 0);
      end;

      if (Module = nil) and (Stream = nil) then
      begin
        Application.MessageBox(FMOD_ErrorString(FSOUND_GetError), 'Load error', MB_OK or MB_ICONHAND);
        Continue;
      end;

      if Module <> nil then
      begin
        FMUSIC_SetMasterVolume(Module, 255);
        if (FMUSIC_GetType(Module) = FMUSIC_TYPE_MOD) or (FMUSIC_GetType(Module) = FMUSIC_TYPE_S3M) then
          FMUSIC_SetPanSeperation(Module, 0.15);  // 15% crossover
      end;

      FSongs[SongCount].Module := Module;
      FSongs[SongCount].Stream := Stream;
      FSongs[SongCount].Playing := False;

      lbxFiles.Items.Add(ExtractFileName(dlgOpen.Files[Index]));
      lbxFiles.ItemIndex := SongCount;
    end;
  end;
  lbxFilesClick(nil);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  Index: Integer;
begin
  DesktopFont := True;

  FMOD_Load(nil);

  { Check version numbers }
  if FMOD_VERSION > FSOUND_GetVersion then
  begin
    Application.MessageBox(PChar(Format('API version %3.2f is newer than DLL version %3.2f', [FMOD_VERSION, FSOUND_GetVersion])), 'Version mismatch', MB_OK or MB_ICONERROR);
    Halt;
  end;

  { Initialize FSOUND }
  try
    if not FSOUND_SetOutput(FSOUND_OUTPUT_DSOUND) then
      raise Exception.Create('FSOUND_SetOutput failed');
    if not FSOUND_SetDriver(0) then
      raise Exception.Create('FSOUND_SetDriver failed');
    if not FSOUND_SetMixer(FSOUND_MIXER_QUALITY_AUTODETECT) then
      raise Exception.Create('FSOUND_SetMixer failed');
    if not FSOUND_SetHWND(Handle) then
      raise Exception.Create('FSOUND_SetHWND failed');
  except
    Application.MessageBox(FMOD_ErrorString(FSOUND_GetError), 'Initialization', MB_OK or MB_ICONHAND);
    raise;
  end;

  if not FSOUND_Init(22050, 128, 0) then
  begin
    Application.MessageBox(FMOD_ErrorString(FSOUND_GetError), 'FSOUND_Init', MB_OK or MB_ICONHAND);
    Halt;
  end;

  { Initialize song list to empty }
  for Index := 0 to MAX_SONGS - 1 do
  begin
    FSongs[Index].Module := nil;
    FSongs[Index].Stream := nil;
    FSongs[Index].Channel := -1;
  end;

  FTrackNumber := 0;
  FNumTracks := 0;
  FCDPaused := False;
  FCDPlaying := False;

  FSpectrum := TMiniSpectrum.Create(nil);
  FSpectrum.Parent := pnlSpectrum;
  FSpectrum.Align := alClient;
  FSpectrum.Enabled := False;
  FSpectrum.OnClick := pnlSpectrumClick;

  ShowStaticSongInfo(-1);
  ShowDynamicSongInfo(-1);
  ShowCDInfo;

  dlgOpen.Filter := 'All song types|*.MOD;*.S3M;*.XM;*.IT;*.MID;*.RMI;*.SGT;*.WAV;*.MP2;*.MP3;*.OGG;*.WMA;*.ASF|Microsoft WAV (*.WAV)|*.WAV|MP2/MP3 (*.MP3 *.MP2)|*.MP2;*.MP3|Ogg Vorbis (*.OGG)|*.OGG|Windows Media Format (*.WMA *.ASF)|*.WMA;*.ASF' +
    '|MIDI/DirectMusic Files (*.MID,*.RMI,*.SGT)|*.MID;*.RMI;*.SGT|Impulse Tracker (*.IT)|*.IT|FastTracker2 (*.XM)|*.XM|ScreamTracker 3 (*.S3M)|*.S3M|Protracker/FastTracker (*.MOD)|*.MOD|All files (*.*)|*.*';
end;

procedure TfrmMain.btnPlayClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := lbxFiles.ItemIndex;

  if Index < 0 then
    Exit;

  if FSongs[Index].Playing then
    btnStopClick(Sender);

  if FSongs[Index].Module <> nil then
  begin
    FSongs[Index].Playing := FMUSIC_PlaySong(FSongs[Index].Module);
    if not FSongs[Index].Playing then
      Application.MessageBox(FMOD_ErrorString(FSOUND_GetError), 'Play song', MB_OK or MB_ICONHAND);
  end
  else if FSongs[Index].Stream <> nil then
  begin
    FSongs[Index].Channel := FSOUND_Stream_Play(FSOUND_FREE, FSongs[Index].Stream);
    FSongs[Index].Playing := FSongs[Index].Channel >= 0;
    if not FSongs[Index].Playing then
    begin
      Application.MessageBox(FMOD_ErrorString(FSOUND_GetError), 'Play stream', MB_OK or MB_ICONHAND);
    end
    else
    begin
      FSOUND_SetPan(FSongs[Index].Channel, FSOUND_STEREOPAN);
      FSOUND_SetVolume(FSongs[Index].Channel, 255);
    end;
  end;
  ShowStaticSongInfo(Index);
end;

procedure TfrmMain.btnStopClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := lbxFiles.ItemIndex;

  if Index < 0 then
    Exit;

  if FSongs[Index].Module <> nil then
    FMUSIC_StopSong(FSongs[Index].Module)
  else if FSongs[Index].Stream <> nil then
    FSOUND_Stream_Stop(FSongs[Index].Stream);
  FSongs[Index].Channel := -1;
  FSongs[Index].Playing := False;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Index: Integer;
begin
  FMUSIC_StopAllSongs();
  for Index := 0 to MAX_SONGS - 1 do
  begin
    if FSongs[Index].Module <> nil then
    begin
      FMUSIC_FreeSong(FSongs[Index].Module);
    end
    else if FSongs[Index].Stream <> nil then
    begin
      FSOUND_Stream_Stop(FSongs[Index].Stream);
      FSOUND_Stream_Close(FSongs[Index].Stream);
    end;
  end;
  FSpectrum.Free;

  FMOD_Unload;
end;

procedure TfrmMain.ShowStaticSongInfo(Index: Integer);
var
  Module: PFMusicModule;
  Stream: PFSoundStream;
begin
  if Index < 0 then
  begin
    lblSongName.Caption := '';
    lblSongType.Caption := '';
    lblSongMasterVolume.Caption := '';
    pgrSong.Position := 0;
  end
  else
  begin
    Module := FSongs[Index].Module;
    Stream := FSongs[Index].Stream;
    if Module <> nil then
    begin
      lblSongName.Caption := FMUSIC_GetName(Module);
      lblSongType.Caption := MusicTypes[FMUSIC_GetType(Module)] + Format(' (%d channel)', [FMUSIC_GetNumChannels(Module)]);
      lblSongMasterVolume.Caption := Format('%3.3d', [FMUSIC_GetMasterVolume(Module)]);
      FSettingMasterVolume := True;
      trkMasterVolume.Position := FMUSIC_GetMasterVolume(Module);
      FSettingMasterVolume := False;
      pgrSong.Max := FMUSIC_GetNumOrders(Module);
    end
    else if Stream <> nil then
    begin
      lblSongName.Caption := lbxFiles.Items[Index];
      lblSongType.Caption := 'Stream';
      lblSongMasterVolume.Caption := Format('%3.3d', [FSOUND_GetVolume(FSongs[Index].Channel)]);
      FSettingMasterVolume := True;
      trkMasterVolume.Position := FSOUND_GetVolume(FSongs[Index].Channel);
      FSettingMasterVolume := False;
      pgrSong.Max := FSOUND_Stream_GetLength(Stream);
      lblSongSpeed.Caption := '';
      lblSongBPM.Caption := '';
      lblSongOrder.Caption := '';
      lblSongPattern.Caption := '';
      lblSongRow.Caption := '';
    end
  end;
end;

procedure TfrmMain.tmrMainTimer(Sender: TObject);
var
  Index: Integer;
begin
  lblCPU.Caption := Format('%.1f%%', [FSOUND_GetCPUUsage]);
  lblChannels.Caption := Format('%3.3d', [FSOUND_GetChannelsPlaying]);
  Index := lbxFiles.ItemIndex;
  if Index > -1 then
  begin
    ShowSpectrum;
    ShowDynamicSongInfo(Index);
    if FMUSIC_IsFinished(FSongs[Index].Module) and chkPlaylist.Checked then
    begin
      btnStopClick(nil);
      Inc(Index);
      if Index >= lbxFiles.Items.Count then
        Index := 0;
      lbxFiles.ItemIndex := Index;
      lbxFilesClick(nil);
      btnPlayClick(nil);
    end;
  end;
  { Update CD info }
  TTimer(Sender).Tag := TTimer(Sender).Tag + LongInt(TTimer(Sender).Interval);
  if TTimer(Sender).Tag > 1000 then
  begin
    TTimer(Sender).Tag := 0;
    ShowCDInfo;
  end;
end;

procedure TfrmMain.lbxFilesClick(Sender: TObject);
begin
  ShowStaticSongInfo(lbxFiles.ItemIndex);
end;

procedure TfrmMain.ShowDynamicSongInfo(Index: Integer);
var
  Module: PFMusicModule;
  Stream: PFSoundStream;
  Channel: Integer;
begin
  if Index < 0 then
  begin
    lblSongSpeed.Caption := '';
    lblSongBPM.Caption := '';
    lblSongOrder.Caption := '';
    lblSongPattern.Caption := '';
    lblSongRow.Caption := '';
    pgrSong.Position := 0;
  end
  else
  begin
    Module := FSongs[Index].Module;
    Stream := FSongs[Index].Stream;
    Channel := FSongs[Index].Channel;
    if (Module <> nil) and (FMUSIC_IsPlaying(Module)) then
    begin
      lblSongSpeed.Caption := Format('%3.3d', [FMUSIC_GetSpeed(Module)]);
      lblSongBPM.Caption := Format('%3.3d', [FMUSIC_GetBPM(Module)]);
      lblSongOrder.Caption := Format('%3.3d/%3.3d', [FMUSIC_GetOrder(Module), FMUSIC_GetNumOrders(Module)]);
      lblSongPattern.Caption := Format('%3.3d/%3.3d', [FMUSIC_GetPattern(Module), FMUSIC_GetNumPatterns(Module)]);
      lblSongRow.Caption := Format('%3.3d/%3.3d', [FMUSIC_GetRow(Module), 64]);
      pgrSong.Position := FMUSIC_GetOrder(Module);
    end
    else if (Stream <> nil) and (FSOUND_IsPlaying(Channel)) then
    begin
      pgrSong.Position := FSOUND_Stream_GetPosition(Stream);
    end
  end;
end;

procedure TfrmMain.trkMasterVolumeChange(Sender: TObject);
var
  Index: Integer;
begin
  if not FSettingMasterVolume then
  begin
    Index := lbxFiles.ItemIndex;
    if Index > -1 then
    begin
      if FSongs[Index].Module <> nil then
      begin
        FMUSIC_SetMasterVolume(FSongs[Index].Module, trkMasterVolume.Position);
        lblSongMasterVolume.Caption := Format('%3.3d', [trkMasterVolume.Position]);
      end
      else if FSongs[Index].Stream <> nil then
      begin
        FSOUND_SetVolume(FSongs[Index].Channel, trkMasterVolume.Position);
        lblSongMasterVolume.Caption := Format('%3.3d', [trkMasterVolume.Position]);
      end;
    end;
  end;
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnAboutClick(Sender: TObject);
begin
  frmAbout := TfrmAbout.Create(nil);
  try
    frmAbout.ShowModal;
  finally
    frmAbout.Free;
  end;
end;

procedure TfrmMain.btnPrevOrderClick(Sender: TObject);
var
  Index: Integer;
  Order: DWORD;
begin
  Index := lbxFiles.ItemIndex;
  if Index < 0 then
    Exit;
  if FSongs[Index].Module = nil then
    Exit;
  Order := FMUSIC_GetOrder(FSongs[Index].Module);
  if Order > 0 then
    FMUSIC_SetOrder(FSongs[Index].Module, Order - 1);
end;

procedure TfrmMain.btnNextOrderClick(Sender: TObject);
var
  Index: Integer;
  Order: Integer;
begin
  Index := lbxFiles.ItemIndex;
  if Index < 0 then
    Exit;
  if FSongs[Index].Module = nil then
    Exit;
  Order := FMUSIC_GetOrder(FSongs[Index].Module);
  if Order < FMUSIC_GetNumOrders(FSongs[Index].Module) then
    FMUSIC_SetOrder(FSongs[Index].Module, Order + 1);
end;

procedure TfrmMain.btnConfigClick(Sender: TObject);
var
  SpectrumEnabled: Boolean;
begin
  SpectrumEnabled := FSpectrum.Enabled;
  FSpectrum.Enabled := False;
  frmConfig := TfrmConfig.Create(nil);
  try
    frmConfig.ShowModal;
  finally
    frmConfig.Free;
  end;
  FSpectrum.Enabled := SpectrumEnabled;
end;

procedure TfrmMain.btnEjectCDClick(Sender: TObject);
begin
  FSOUND_CD_OpenTray(0, 1);
  FTrackNumber := 0;
  FCDPaused := False;
  FCDPlaying := False;
  FNumTracks := 0;
end;

procedure TfrmMain.btnPlayCDClick(Sender: TObject);
begin
  if FTrackNumber > 0 then
  begin
    if FCDPaused then
      FSOUND_CD_SetPaused(0, False)
    else
      FSOUND_CD_Play(0, FTrackNumber);
    FCDPaused := False;
    FCDPlaying := True;
  end;
end;

procedure TfrmMain.ShowCDInfo;
begin
  FTrackNumber := FSOUND_CD_GetTrack(0);
  FNumTracks := FSOUND_CD_GetNumTracks(0);
  lblCDTrack.Caption := Format('%02d/%02d', [FTrackNumber, FNumTracks]);
  tmrMain.Tag := 0;
end;

procedure TfrmMain.btnStopCDClick(Sender: TObject);
begin
  FSOUND_CD_Stop(0);
  FCDPaused := False;
  FCDPlaying := False;
end;

procedure TfrmMain.btnPauseCDClick(Sender: TObject);
begin
  if FCDPlaying then
  begin
    FSOUND_CD_SetPaused(0, not FCDPaused);
    FCDPaused := FSOUND_CD_GetPaused(0);
  end;
end;

procedure TfrmMain.btnPrevTrackClick(Sender: TObject);
begin
  if FTrackNumber > 1 then
  begin
    Dec(FTrackNumber);
    if FCDPlaying then
      FSOUND_CD_Play(0, FTrackNumber);
    ShowCDInfo;
  end;
end;

procedure TfrmMain.btnNextTrackClick(Sender: TObject);
begin
  if FTrackNumber < FNumTracks then
  begin
    Inc(FTrackNumber);
    if FCDPlaying then
      FSOUND_CD_Play(0, FTrackNumber);
    ShowCDInfo;
  end;
end;

procedure TfrmMain.ShowSpectrum;
begin
  if FSpectrum.Enabled then
    FSpectrum.Draw;
end;

procedure TfrmMain.pnlSpectrumClick(Sender: TObject);
begin
  if FSpectrum.Enabled then
  begin
    if FSpectrum.Style = ssSmooth then
      FSpectrum.Style := ssBlock
    else
      FSpectrum.Enabled := False;
  end
  else
  begin
    FSpectrum.Enabled := True;
    FSpectrum.Style := ssSmooth;
  end;
end;

procedure TfrmMain.btnDeleteClick(Sender: TObject);
var
  Index, Index2: Integer;
begin
  Index := lbxFiles.ItemIndex;
  if Index < 0 then
    Exit;

  btnStopClick(nil);
  lbxFiles.Items.Delete(Index);
  // Move all following items up one position
  if lbxFiles.Items.Count > 0 then
  begin
    if Index < lbxFiles.Items.Count - 1 then
    begin
      for Index2 := Index to lbxFiles.Items.Count - 2 do
        FSongs[Index2] := FSongs[Index2 + 1];
    end;
    if Index < lbxFiles.Items.Count then
      lbxFiles.ItemIndex := Index
    else
      lbxFiles.ItemIndex := lbxFiles.Items.Count - 1;
  end;
  lbxFilesClick(nil);
end;

end.
