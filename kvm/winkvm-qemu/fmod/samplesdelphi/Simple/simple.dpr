//===============================================================================================
// SIMPLE.EXE
// Copyright (c), Firelight Multimedia, 1999-2000.
//
// This example demonstrates some fundamental FMOD usage, including device enumeration, output
// mode selection, loading and playing samples and a music file, and
// calling some runtime manipulation and information functions.
// Converted to Delphi by Bocevski Dragan   mailto: d_bocevski@yahoo.com
//===============================================================================================
//  History
//
//  2001/09/09 by Steve 'Sly' Williams
//  - Updated to version 3.40
//
//  2000/12/15 by Steve 'Sly' Williams
//  - Updated to version 3.30
//
//  2000/11/14 by Steve 'Sly' Williams
//  - Fixed version check
//  - Added FMODErrors to uses clause
//  - Added check for Delphi 4 to change wVirtualKeyCode to wVirtualScanCode
//
//  2002/02/13 by Steve 'Sly' Williams
//  - Updated for FMOD 3.50
//
//  2002/12/19 by Steve 'Sly' Williams
//  - Updated for FMOD 3.61
//===============================================================================================
program simple;

uses
  fmod, fmodtypes, fmoderrors, Windows;

{$APPTYPE CONSOLE}

var
  dw, key: dword;
  driver: Integer;
  i: Longint;
  enm: TFSoundOutputTypes;
  h, h1: THandle;
  buf: input_record;
  c: coord;
  s, sorder, srow, stime, schp, scpu: string;
  channel: Integer;
  samp1, samp2, samp3: PFSoundSample;
  mdl: PFMusicModule;
  paused: Boolean;
begin
  SetLength(s, 80);
  SetConsoleTitle('Example Simple (song player)');
  h := GetStdHandle(STD_INPUT_HANDLE);
  h1 := GetStdHandle(STD_OUTPUT_HANDLE);
  Buf.EventType := Key_Event;
  if FMOD_VERSION > FSOUND_GetVersion then
  begin
    WriteLn('Error: You are using FMOD version ', FSOUND_GetVersion: 3: 2, '.  You should be using version ', FMOD_VERSION: 3: 2);
    Exit;
  end;

  writeln('---------------------------------------------------------');
  writeln('Output Type');
  writeln('---------------------------------------------------------');

  writeln('1 - Direct Sound');
  writeln('2 - Windows Multimedia Waveout');
  writeln('3 - A3D');
  writeln('4 - NoSound');
  writeln('---------------------------------------------------------'); // print driver names
  writeln('Press a corresponding number or ESC to quit');
  repeat
    Sleep(50);
    FlushConsoleInputBuffer(h);
    repeat
      ReadConsoleInput(h, buf, 1, dw);
    until buf.Event.KeyEvent.bKeyDown = false;
{$IFDEF VER120}
    Key := buf.Event.KeyEvent.wVirtualScanCode;
{$ELSE}
    Key := buf.Event.KeyEvent.wVirtualKeyCode;
{$ENDIF}
    case key of
      ord('1'): FSOUND_SetOutput(FSOUND_OUTPUT_DSOUND);
      ord('2'): FSOUND_SetOutput(FSOUND_OUTPUT_WINMM);
      ord('3'): FSOUND_SetOutput(FSOUND_OUTPUT_A3D);
      ord('4'): FSOUND_SetOutput(FSOUND_OUTPUT_NOSOUND);
      27: exit;
    end;
  until ((key >= ord('1')) and (key <= ord('4')));

// ==========================================================================================
// SELECT DRIVER
// ==========================================================================================


// The following list are the drivers for the output method selected above.
  writeln('---------------------------------------------------------');
  enm := FSOUND_GetOutput();
  case enm of
    FSOUND_OUTPUT_NOSOUND: write('NoSound');
    FSOUND_OUTPUT_WINMM: write('Windows Multimedia Waveout');
    FSOUND_OUTPUT_DSOUND: write('Direct Sound');
    FSOUND_OUTPUT_A3D: write('A3D');
  end;
  writeln(' Driver list');
  writeln('---------------------------------------------------------');
  for i := 0 to FSOUND_GetNumDrivers() - 1 do
    writeln(i + 1, ' - ', FSOUND_GetDriverName(i)); // print driver names
  writeln('---------------------------------------------------------'); // print driver names
  writeln('Press a corresponding number or ESC to quit');
  repeat
    FlushConsoleInputBuffer(h);
    repeat
      ReadConsoleInput(h, buf, 1, dw);
    until buf.Event.KeyEvent.bKeyDown = false;
{$IFDEF VER120}
    Key := buf.Event.KeyEvent.wVirtualScanCode;
{$ELSE}
    Key := buf.Event.KeyEvent.wVirtualKeyCode;
{$ENDIF}
    if (ord(key) = 27) then exit;
    driver := ord(key) - ord('1');
  until ((driver > 0) or (driver <= FSOUND_GetNumDrivers()));
  FSOUND_SetDriver(driver); // Select sound card (0 = default)

// ==========================================================================================
// SELECT MIXER
// ==========================================================================================

  FSOUND_SetMixer(FSOUND_MIXER_QUALITY_AUTODETECT);

// ==========================================================================================
// INITIALIZE
// ==========================================================================================
  if not FSOUND_Init(44100, 64, 0) then
  begin
    writeln('Error! Initializing');
    writeln(FMOD_ErrorString(FSOUND_GetError()));
    FSOUND_Close();
    exit;
  end;

// ==========================================================================================
// LOAD SONG
// ==========================================================================================

  mdl := FMUSIC_LoadSong('../../media/invtro94.s3m');
  if mdl = nil then
  begin
    writeln('Error! Loading song');
    writeln(FMOD_ErrorString(FSOUND_GetError()));
    FSOUND_Close();
    exit;
  end;

// ==========================================================================================
// LOAD SAMPLES
// ==========================================================================================

   // 8bit mono
  samp1 := FSOUND_Sample_Load(FSOUND_FREE, '../../media/jaguar.wav', FSOUND_2D, 0, 0);
  if samp1 = nil then
  begin
    writeln('Error! Loading sample1');
    writeln(FMOD_ErrorString(FSOUND_GetError()));
    FSOUND_Close();
    exit;
  end;

  // 16bit mono
  samp2 := FSOUND_Sample_Load(FSOUND_FREE, '../../media/drumloop.wav', FSOUND_2D, 0, 0);
  if samp2 = nil then
  begin
    writeln('Error! Loading sample2');
    writeln(FMOD_ErrorString(FSOUND_GetError()));
    FSOUND_Close();
    exit;
  end;

   // 16bit stereo
  samp3 := FSOUND_Sample_Load(FSOUND_FREE, '../../media/chimes.wav', FSOUND_2D, 0, 0);
  if samp2 = nil then
  begin
    writeln('Error! Loading sample3');
    writeln(FMOD_ErrorString(FSOUND_GetError()));
    FSOUND_Close();
    exit;
  end;

// ==========================================================================================
// DISPLAY HELP
// ==========================================================================================

  write('FSOUND Output Method : ');
  case (FSOUND_GetOutput()) of
    FSOUND_OUTPUT_NOSOUND: writeln('FSOUND_OUTPUT_NOSOUND');
    FSOUND_OUTPUT_WINMM: writeln('FSOUND_OUTPUT_WINMM');
    FSOUND_OUTPUT_DSOUND: writeln('FSOUND_OUTPUT_DSOUND');
    FSOUND_OUTPUT_A3D: writeln('FSOUND_OUTPUT_A3D');
  end;

  write('FSOUND Mixer         : ');
  case (FSOUND_GetMixer()) of
    FSOUND_MIXER_BLENDMODE: writeln('FSOUND_MIXER_BLENDMODE');
    FSOUND_MIXER_MMXP5: writeln('FSOUND_MIXER_MMXP5');
    FSOUND_MIXER_MMXP6: writeln('FSOUND_MIXER_MMXP6');
    FSOUND_MIXER_QUALITY_FPU: writeln('FSOUND_MIXER_QUALITY_FPU');
    FSOUND_MIXER_QUALITY_MMXP5: writeln('FSOUND_MIXER_QUALITY_MMXP5');
    FSOUND_MIXER_QUALITY_MMXP6: writeln('FSOUND_MIXER_QUALITY_MMXP6');
  end;
  writeln('FSOUND Driver        : ', FSOUND_GetDriverName(FSOUND_GetDriver()));



  writeln('=========================================================================');
  writeln('   1       Play 16bit sound at any time');
  writeln('   2       Play 8bit sound at any time');
  writeln('   3       Play 16bit STEREO sound at any time');
  writeln('   Left arrow       Rewind mod back 1 order');
  writeln('   Right arrow      FastForward mod forward 1 order');
  writeln('   SPACE   Pause/unpause music at any time');
  writeln('   ESC     Quit');
  writeln('=========================================================================');
  writeln('Playing ...', FMUSIC_GetName(mdl));

// ==========================================================================================
// START PLAYING!
// ==========================================================================================
  FMUSIC_PlaySong(mdl);

  FMUSIC_SetPanSeperation(mdl, 0.15); // 15% crossover

  GetConsoleMode(h, dw);
  SetConsoleMode(h, dw or ENABLE_PROCESSED_OUTPUT or ENABLE_PROCESSED_INPUT);
  c.X := 1;
  c.Y := 24;
  repeat
    FlushConsoleInputBuffer(h);
    Sleep(50);
    dw := 0;
    PeekConsoleInput(h, buf, 1, dw);
    if buf.Event.KeyEvent.bKeyDown then
    begin
{$IFDEF VER120}
      Key := buf.Event.KeyEvent.wVirtualScanCode;
{$ELSE}
      Key := buf.Event.KeyEvent.wVirtualKeyCode;
{$ENDIF}
      if dw = 1 then
        if key <> 0 then
        begin
          if key = Ord('1') then
            FSOUND_PlaySound(FSOUND_FREE, samp1)
          else if key = Ord('2') then
            FSOUND_PlaySound(FSOUND_FREE, samp2)
          else if key = Ord('3') then
          begin
            channel := FSOUND_PlaySound(FSOUND_FREE, samp3);
            FSOUND_SetPan(channel, FSOUND_STEREOPAN);
          end
          else if key = Ord(' ') then
          begin
            paused := FMUSIC_GetPaused(mdl);
            FMUSIC_SetPaused(mdl, not paused);
          end
          else if key = VK_LEFT then
            FMUSIC_SetOrder(mdl, FMUSIC_GetOrder(mdl) - 1)
          else if key = VK_RIGHT then
            FMUSIC_SetOrder(mdl, FMUSIC_GetOrder(mdl) + 1)
          else if key = 27 then
          begin
            WriteLn;
            FSOUND_Close();
            Exit;
          end;
        end;
    end;
//         key:=0;
    SetConsoleCursorPosition(h1, c);
    str(FMUSIC_GetOrder(mdl), sorder);
    str(FMUSIC_GetRow(mdl), srow);
    str((FMUSIC_GetTime(mdl) / 1000): 6: 3, stime);
    str(FSOUND_GetChannelsPlaying(), schp);
    str(FSOUND_GetCPUUsage(): 7: 5, scpu);
    s := 'order = ' + sorder + '  row = ' + srow + '  time = ' + stime + '  channels playing = ' + schp + '  cpu usage = ' + scpu;
    WriteConsole(h1, pchar(s), length(s) - 1, dw, nil);
    s := '                                                                                ';
  until false;

// ==========================================================================================
// CLEANUP AND SHUTDOWN
// ==========================================================================================

  FSOUND_Sample_Free(samp1);
  FSOUND_Sample_Free(samp2);
  FSOUND_Sample_Free(samp3);
  FMUSIC_FreeSong(mdl);
  FSOUND_Close();
end.

