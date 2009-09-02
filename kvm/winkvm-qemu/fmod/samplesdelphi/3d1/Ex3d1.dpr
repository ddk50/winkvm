//===============================================================================================
// ex3D1.exe
// Copyright (c), Firelight Multimedia, 1999.
//
// This test shows EAX, DS3D, A3D and Software all being used together.  For vortex cards
// geometry will obstruct and relfect sounds.
// This refreshes the scene every frame.
// To see how to use geometry lists, see sample Ex3D2 which is a slight variation on this one.
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
program ex3d1;

uses
  fmod, fmodtypes, fmoderrors, fmodpresets
{$IFDEF MSWINDOWS}
  , Windows
{$ENDIF}
  ;

{$APPTYPE CONSOLE}

const
  UPDATETIME = 50;  // 50ms update for interface
  NUMPOLYS = 4;

procedure Close(samp1, samp2, samp3: PFSoundSample);
begin
  // you dont need to free samples if you let fsound's sample manager look after samples, as
  // it will free them all for you.
  FSOUND_Sample_Free(samp1);
  FSOUND_Sample_Free(samp2);
  FSOUND_Sample_Free(samp3);

  FSOUND_Close();
end;

var
  stream: PFSoundStream;
  key, dw: DWORD;
  driver: Integer;
  enm: TFSoundOutputTypes;
  h, h1: THandle;
  buf: input_record;
  c: coord;
  s: String;
  samp1: PFSoundSample = nil;
  samp2: PFSoundSample = nil;
  samp3: PFSoundSample = nil;
  openflag, listenerflag: Boolean;
  i, channel1, channel2: Longint;
  listenerpos: array[0..2] of Single;
  lastpos: array[0..2] of Single = (0, 0, 0);
  t: Single;
  pos, vel: TFSoundVector;
  caps: Cardinal;
  Channels2D, Channels3D, ChannelsTotal: Integer;
    // COORDINATE SYSTEM : X = right, Y = up, Z = forwards. (Left handed)
  poly: array[0..NUMPOLYS - 1, 0..3, 0..2] of Single =
  (
    (// left wall
    (-35.0, -20.0, -20.0),
    (-35.0, 20.0, -20.0),
    (-35.0, 20.0, 20.0),
    (-35.0, -20.0, 20.0)
    ),
    (// front wall
    (-35.0, 20.0, 20.0),
    (10.0, 20.0, 20.0),
    (10.0, -20.0, 20.0),
    (-35.0, -20.0, 20.0)
    ),
    (// back wall
    (-35.0, -20.0, -20.0),
    (10.0, -20.0, -20.0),
    (10.0, 20.0, -20.0),
    (-35.0, 20.0, -20.0)
    ),
    (// right wall
    (10.0, -20.0, -20.0),
    (10.0, -20.0, 20.0),
    (10.0, 20.0, 20.0),
    (10.0, 20.0, -20.0)
    )
    );
  doorpoly: array[0..3, 0..2] of Single =
  (// hole in right wall
    (10.0, -20.0, -5.0),
    (10.0, -20.0, 5.0),
    (10.0, 20.0, 5.0),
    (10.0, 20.0, -5.0)
    );
  normal: array[0..NUMPOLYS - 1, 0..2] of Single =
  (
    (1.0, 0.0, 0.0), // left wall
    (-1.0, 0.0, 0.0), // right wall
    (0.0, 0.0, -1.0), // front wall
    (0.0, 0.0, 1.0) // back wall
    );
begin
  openflag := False;
  listenerflag := True;
  listenerpos[0] := 0;
  listenerpos[1] := 0;
  listenerpos[2] := 0;
  t := 0;
  SetLength(s, 80);
  SetConsoleTitle('Example Ex3D1 (3d enviroment)');
  h := GetStdHandle(STD_INPUT_HANDLE);
  h1 := GetStdHandle(STD_OUTPUT_HANDLE);
  Buf.EventType := Key_Event;
  c.X := 1;
  c.Y := 23;
  if FMOD_VERSION > FSOUND_GetVersion then
  begin
    WriteLn('Error: You are using FMOD version ', FSOUND_GetVersion: 3: 2, '.  You should be using version ', FMOD_VERSION: 3: 2);
    Exit;
  end;

// ==========================================================================================
// SELECT OUTPUT METHOD
// ==========================================================================================

  writeln;
  writeln('---------------------------------------------------------');
  writeln('Output Type');
  writeln('---------------------------------------------------------');
{$IFDEF MSWINDOWS}
  writeln('1 - Direct Sound');
  writeln('2 - Windows Multimedia Waveout');
  writeln('3 - A3D');
{$ENDIF}
{$IFDEF LINUX}
  writeln('1 - Open Sound System (OSS) (Linux, Solaris, freebsd)');
  writeln('2 - Enlightment Sound Daemon (ESD, Linux, more ...)');
  writeln('3 - Alsa Sound System (Linux)');
{$ENDIF}
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
{$IFDEF MSWINDOWS}
      ord('1'): FSOUND_SetOutput(FSOUND_OUTPUT_DSOUND);
      ord('2'): FSOUND_SetOutput(FSOUND_OUTPUT_WINMM);
      ord('3'): FSOUND_SetOutput(FSOUND_OUTPUT_A3D);
{$ENDIF}
{$IFDEF LINUX}
      ord('1'): FSOUND_SetOutput(FSOUND_OUTPUT_OSS);
      ord('2'): FSOUND_SetOutput(FSOUND_OUTPUT_ESD);
      ord('3'): FSOUND_SetOutput(FSOUND_OUTPUT_ALSA);
{$ENDIF}
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
{$IFDEF MSWINDOWS}
    FSOUND_OUTPUT_WINMM:    write('Windows Multimedia Waveout');
    FSOUND_OUTPUT_DSOUND:   write('Direct Sound');
    FSOUND_OUTPUT_A3D:      write('A3D');
{$ENDIF}
{$IFDEF LINUX}
    FSOUND_OUTPUT_OSS:      write('Open Sound System');
    FSOUND_OUTPUT_ESD:      write('Enlightenment Sound Daemon');
    FSOUND_OUTPUT_ALSA:     write('Alsa');
{$ENDIF}
    FSOUND_OUTPUT_NOSOUND:  write('NoSound');
  end;
  writeln(' Driver list');
  writeln('---------------------------------------------------------');
  for i := 0 to FSOUND_GetNumDrivers() - 1 do
  begin
    writeln(i + 1, ' - ', FSOUND_GetDriverName(i)); // print driver names

    FSOUND_GetDriverCaps(i, caps);

    if caps and FSOUND_CAPS_HARDWARE <> 0 then
      writeln('  * Driver supports hardware 3D sound!');
  end;
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

  FSOUND_GetDriverCaps(FSOUND_GetDriver(), caps);

  writeln('---------------------------------------------------------');
  writeln('Driver capabilities');
  writeln('---------------------------------------------------------');
  if caps = 0 then
  begin
    WriteLn('- This driver will support software mode only.');
    WriteLn('  It does not properly support 3D sound hardware.');
  end
  else if caps and FSOUND_CAPS_HARDWARE <> 0 then
  begin
    WriteLn('  * Driver supports hardware 3D sound!');
  end;

// ==========================================================================================
// INITIALIZE
// ==========================================================================================
  if not FSOUND_Init(44100, 32, 0) then
  begin
    writeln('Error! Initializing');
    writeln(FMOD_ErrorString(FSOUND_GetError()));
    FSOUND_Close();
    Close(samp1, samp2, samp3);
    Exit;
  end;

// ==========================================================================================
// LOAD SAMPLES
// ==========================================================================================

// ==========================================================================================
// 3D MONO
// ==========================================================================================
  samp1 := FSOUND_Sample_Load(FSOUND_FREE, '../../media/drumloop.wav', FSOUND_HW3D, 0, 0);
  if samp1 = nil then
  begin
    writeln('Error! Loading sample1');
    writeln(FMOD_ErrorString(FSOUND_GetError()));
    Close(samp1, samp2, samp3);
    Exit;
  end;
 // increasing mindistance makes it louder in 3d space
  FSOUND_Sample_SetMinMaxDistance(samp1, 4.0, 1000.0);
  FSOUND_Sample_SetMode(samp1, FSOUND_LOOP_NORMAL);

// ==========================================================================================
// 3D MONO
// ==========================================================================================
  samp2 := FSOUND_Sample_Load(FSOUND_UNMANAGED, '../../media/jaguar.wav', FSOUND_HW3D, 0, 0);
  if samp2 = nil then
  begin
    writeln('Error! Loading sample2');
    writeln(FMOD_ErrorString(FSOUND_GetError()));
    Close(samp1, samp2, samp3);
    Exit;
  end;
 // increasing mindistance makes it louder in 3d space
  FSOUND_Sample_SetMinMaxDistance(samp2, 3.0, 1000.0);
  FSOUND_Sample_SetMode(samp2, FSOUND_LOOP_NORMAL);

// ==========================================================================================
// 3D STEREO
// ==========================================================================================
  samp3 := FSOUND_Sample_Load(FSOUND_UNMANAGED, '../../media/chimes.wav', FSOUND_2D, 0, 0);
  if samp3 = nil then
  begin
    writeln('Error! Loading 16bit Stereo sample');
    writeln(FMOD_ErrorString(FSOUND_GetError()));
    Close(samp1, samp2, samp3);
    Exit;
  end;

// ==========================================================================================
// DISPLAY HELP
// ==========================================================================================

  write('FSOUND Output Method : ');
  case (FSOUND_GetOutput()) of
{$IFDEF MSWINDOWS}
    FSOUND_OUTPUT_WINMM:    writeln('FSOUND_OUTPUT_WINMM');
    FSOUND_OUTPUT_DSOUND:   writeln('FSOUND_OUTPUT_DSOUND');
    FSOUND_OUTPUT_A3D:      writeln('FSOUND_OUTPUT_A3D');
{$ENDIF}
{$IFDEF LINUX}
    FSOUND_OUTPUT_OSS:      writeln('FSOUND_OUTPUT_OSS');
    FSOUND_OUTPUT_ESD:      writeln('FSOUND_OUTPUT_ESD');
    FSOUND_OUTPUT_ALSA:     writeln('FSOUND_OUTPUT_ALSA');
{$ENDIF}
    FSOUND_OUTPUT_NOSOUND:  writeln('FSOUND_OUTPUT_NOSOUND');
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
  write('FSOUND Driver        : ');
  writeln(FSOUND_GetDriverName(FSOUND_GetDriver()));
  FSOUND_GetNumHWChannels(Channels2D, Channels3D, ChannelsTotal);
  writeln('Hardware 3D channels : ', Channels3D);

  writeln('=========================================================================');
  writeln('Press 1		Pause/Unpause 16bit 3D sound at any time');
  writeln('      2		Pause/Unpause 8bit 3D sound at any time');
  writeln('      3		Play 16bit STEREO 2D sound at any time');
  writeln('      4		Change to reverb mode CONCERTHALL (DirectSound/SBLive only)');
  writeln('      5		Change to reverb mode SEWERPIPE (DirectSound/SBLive only)');
  writeln('      6		Change to reverb mode PSYCHOTIC (DirectSound/SBLive only)');
  writeln('      7		Open/Close door on right wall (affects A3D only)');
  writeln('      <-		Move listener left (in still mode)');
  writeln('      ->		Move listener right (in still mode)');
  writeln('      SPACE SPACE to stop/start listener automatic movement');
  writeln('      ESC	Quit');
  writeln('=========================================================================');

// ==========================================================================================
// PLAY 2 LOOPING SOUNDS
// ==========================================================================================


  pos.x := -10; pos.y := -0; pos.z := 0;
  vel.x := 0; vel.y := 0; vel.z := 0;
  channel1 := FSOUND_PlaySoundEx(FSOUND_FREE, samp1, nil, True);
  FSOUND_3D_SetAttributes(channel1, @pos, @vel);
  FSOUND_SetPaused(channel1, False);

  pos.x := 15; pos.y := -0; pos.z := -0;
  vel.x := 0; vel.y := 0; vel.z := 0;
  channel2 := FSOUND_PlaySoundEx(FSOUND_FREE, samp2, nil, True);
  FSOUND_3D_SetAttributes(channel2, @pos, @vel);
  FSOUND_SetPaused(channel2, False);

// ==========================================================================================
// MAIN LOOP
// ==========================================================================================

	FSOUND_Reverb_SetProperties(FSOUND_PRESET_CONCERTHALL);
//	FSOUND_Reverb_SetEnvironmentAdvanced(FSOUND_ENVIRONMENT_HALLWAY, -10000, 0, 0.0, 1.0, 0.5, -10000, .02, -10000, .04, 100.0, 100.0, 5000.0);

  repeat
    FlushConsoleInputBuffer(h);
    Sleep(50);
    PeekConsoleInput(h, buf, 1, dw);
    if dw > 0 then
    begin
{$IFDEF VER120}
      Key := buf.Event.KeyEvent.wVirtualScanCode;
{$ELSE}
      Key := buf.Event.KeyEvent.wVirtualKeyCode;
{$ENDIF}
      if (key = ord('1')) then
        FSOUND_SetPaused(channel1, not FSOUND_GetPaused(channel1));
      if (key = ord('2')) then
        FSOUND_SetPaused(channel2, not FSOUND_GetPaused(channel2));
      if (key = ord('3')) then
        FSOUND_PlaySoundEx(FSOUND_FREE, samp3, nil, False);
      if (key = ord('4')) then
        FSOUND_Reverb_SetProperties(FSOUND_PRESET_CONCERTHALL);
      if (key = ord('5')) then
        FSOUND_Reverb_SetProperties(FSOUND_PRESET_SEWERPIPE);
      if (key = ord('6')) then
        FSOUND_Reverb_SetProperties(FSOUND_PRESET_PSYCHOTIC);
      if (key = ord('7')) then
        openflag := not openflag;
      if (key = ord(' ')) then
        listenerflag := not listenerflag;
      if key = 27 then exit;
      if not listenerflag then
      begin
        if (key = vk_left) then
        begin
          listenerpos[0] := listenerpos[0] - 1.0;
          if (listenerpos[0] < -35) then
            listenerpos[0] := -35;
        end;
        if (key = vk_right) then
        begin
          listenerpos[0] := listenerpos[0] + 1.0;
          if (listenerpos[0] > 30) then
            listenerpos[0] := 30;
        end;
      end;
    end;

// ==========================================================================================
// UPDATE THE LISTENER
// ==========================================================================================
    if (listenerflag) then
      listenerpos[0] := (sin(t * 0.05) * 33.0); // left right pingpong

 // vel = how far we moved last FRAME (m/f), then time compensate it to SECONDS (m/s).
    vel.x := (listenerpos[0] - lastpos[0]) * (1000 / UPDATETIME);
    vel.y := (listenerpos[1] - lastpos[1]) * (1000 / UPDATETIME);
    vel.z := (listenerpos[2] - lastpos[2]) * (1000 / UPDATETIME);
 // store pos for next time
    lastpos[0] := listenerpos[0];
    lastpos[1] := listenerpos[1];
    lastpos[2] := listenerpos[2];
    FSOUND_3D_Listener_SetAttributes(@listenerpos[0], @vel.x, 0, 0, 1.0, 0, 1.0, 0);
    t := t + (30 * (1.0 / UPDATETIME)); // 50m/s

      // print out a small visual display
    SetConsoleCursorPosition(h1, c);
    if openflag then
      s := '|.......................<1>..................|   <2>               Door: Open    '
    else
      s := '|.......................<1>..................|   <2>               Door: Closed ';
    s[trunc(listenerpos[0] + 35)] := 'L';
    if (openflag) then
      s[10 + 35] := ':';
    SetConsoleCursorPosition(h1, c);
    WriteConsole(h1, pchar(s), length(s) - 1, dw, nil);
    s := '                                                                                ';

    FSOUND_Update();
  until false;

  WriteLn;
  FSOUND_Stream_Close(stream);

  Close(samp1, samp2, samp3);
end.

