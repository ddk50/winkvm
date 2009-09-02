//===============================================================================================
// STREAM.EXE
// Copyright (c), Firelight Multimedia, 1999-2000.
//
// This example takes a command line parameter, an mp3 file, and uses the streamer system to play
// it back.
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
//  2002/12/19 by Steve 'Sly' Williams
//  - Updated to version 3.61
//===============================================================================================
program stream1;

uses
  fmod, fmodtypes, fmoderrors, Windows;

{$APPTYPE CONSOLE}

var
  stream: PFSoundStream;
  channel: Integer;
  key: DWORD;
  dw: dword;
  driver: Integer;
  i: Longint;
  enm: TFSoundOutputTypes;
  h, h1: THandle;
  buf: input_record;
  c: coord;
  s, position, time, cpu: string;
begin
  SetLength(s, 80);
  SetConsoleTitle('Example Stream1 (mp3 player)');
  h := GetStdHandle(STD_INPUT_HANDLE);
  h1 := GetStdHandle(STD_OUTPUT_HANDLE);
  Buf.EventType := Key_Event;
  if FMOD_VERSION > FSOUND_GetVersion then
  begin
    WriteLn('Error: You are using FMOD version ', FSOUND_GetVersion: 3: 2, '.  You should be using version ', FMOD_VERSION: 3: 2);
    Exit;
  end;
  if (paramcount < 1) then
  begin
    writeln('-------------------------------------------------------------');
    writeln('FMOD MP3 Streamer example.');
    writeln('Copyright (c) Firelight Multimedia, 1999.');
    writeln('-------------------------------------------------------------');
    writeln('Syntax: stream infile.mp3');
    writeln;
    exit;
  end;
//   FSOUND_SetOutput(FSOUND_OUTPUT_A3D);
//   FSOUND_SetOutput(FSOUND_OUTPUT_DSOUND);
  FSOUND_SetOutput(FSOUND_OUTPUT_WINMM);

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
// INITIALIZE
// ==========================================================================================
  if not FSOUND_Init(44100, 16, 0) then
  begin
    writeln('Error! Initializing');
    writeln(FMOD_ErrorString(FSOUND_GetError()));
    FSOUND_Close();
    exit;
  end;

// ==========================================================================================
// OPEN STREAM
// ==========================================================================================
  stream := FSOUND_Stream_Open(PChar(ParamStr(1)), FSOUND_LOOP_NORMAL or FSOUND_NORMAL, 0, 0);
  if stream = nil then
  begin
    writeln('Error! Opening file');
    writeln(FMOD_ErrorString(FSOUND_GetError()));
    FSOUND_Close();
    exit;
  end;

// ==========================================================================================
// PLAY STREAM
// ==========================================================================================
  channel := FSOUND_Stream_Play(FSOUND_FREE, stream);
  if channel < 0 then
  begin
    writeln('Error! Play');
    writeln(FMOD_ErrorString(FSOUND_GetError()));
    FSOUND_Close();
    exit;
  end;
  writeln;
  writeln('=========================================================================');
  writeln('Press SPACE to pause/unpause');
  writeln('Press ESC to quit');
  writeln('=========================================================================');
  writeln('Playing stream...');
  GetConsoleMode(h, dw);
  SetConsoleMode(h, dw or ENABLE_PROCESSED_OUTPUT or ENABLE_PROCESSED_INPUT);
  c.X := 1;
  c.Y := 20;
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
          if key = 32 then
          begin
            FSOUND_SetPaused(channel, not FSOUND_GetPaused(channel));
            key := 0;
          end else if key = 27 then
          begin
            writeln;
            FSOUND_Stream_Close(stream);
            FSOUND_Close();
            exit;
          end;
    end;
    SetConsoleCursorPosition(h1, c);
    str(FSOUND_Stream_GetPosition(stream): 7, position);
    str((FSOUND_Stream_GetTime(stream) / 1000): 6: 3, time);
    str(FSOUND_GetCPUUsage(): 7: 5, cpu);
    if FSOUND_GetPaused(channel) then
      s := 'position = ' + position + '   time = ' + time + '  PAUSED  ' + ' cpu usage = ' + cpu
    else s := 'position = ' + position + '   time = ' + time + ' cpu usage = ' + cpu + '          ';
    WriteConsole(h1, pchar(s), length(s) - 1, dw, nil);
    s := '                                                                                ';
  until key = 27;
  writeln;
  FSOUND_Stream_Close(stream);
  FSOUND_Close();
end.

