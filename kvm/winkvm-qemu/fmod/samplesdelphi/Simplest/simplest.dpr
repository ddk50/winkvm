//===============================================================================================
// SIMPLEST.EXE
// Copyright (c), Firelight Multimedia, 1999-2000.
//
// This is the simplest way to play a song through FMOD.  It is basically Init, Load, Play!
// Converted to Delphi by Bocevski Dragan   mailto: d_bocevski@yahoo.com
//===============================================================================================
// History
//
// 2001/09/09 by Steve 'Sly' Williams
// - Updated to version 3.40
//
// 2000/11/14 by Steve 'Sly' Williams
// - Fixed version check
// - Added FMODErrors to uses clause
// - Added check for Delphi 4 to change wVirtualKeyCode to wVirtualScanCode
//
//  2002/02/13 by Steve 'Sly' Williams
//  - Updated for FMOD 3.50
//
//  2002/12/19 by Steve 'Sly' Williams
//  - Updated for FMOD 3.61
//===============================================================================================
program simplest;

uses
  fmod, fmodtypes, fmoderrors, Windows;

{$APPTYPE CONSOLE}

var
  key: DWORD;
  dw: dword;
  h, h1: THandle;
  buf: input_record;
  c: coord;
  s, sorder, srow, schp, scpu: string;
  mdl: PFMusicModule;
begin
  SetLength(s, 80);
  SetConsoleTitle(pchar('Example Simplest (song player)'));
  h := GetStdHandle(STD_INPUT_HANDLE);
  h1 := GetStdHandle(STD_OUTPUT_HANDLE);
  Buf.EventType := Key_Event;
  if FMOD_VERSION > FSOUND_GetVersion then
  begin
    WriteLn('Error: You are using FMOD version ', FSOUND_GetVersion: 3: 2, '.  You should be using version ', FMOD_VERSION: 3: 2);
    Exit;
  end;

// ==========================================================================================
// INITIALIZE
// ==========================================================================================
  if not FSOUND_Init(44100, 32, 0) then
  begin
    writeln('Error! Initializing');
    writeln(FMOD_ErrorString(FSOUND_GetError()));
    FSOUND_Close();
    exit;
  end;

// ==========================================================================================
// LOAD SONG
// ==========================================================================================

  mdl := FMUSIC_LoadSong('../../media/invtro94.s3m'); {can be xm, s3m...}
  if mdl = nil then
  begin
    writeln('Error! Loading song');
    writeln(FMOD_ErrorString(FSOUND_GetError()));
    FSOUND_Close();
    exit;
  end;

// ==========================================================================================
// START PLAYING!
// ==========================================================================================
  FMUSIC_PlaySong(mdl);
  writeln('Press ESC to quit');
  writeln('Playing ...', FMUSIC_GetName(mdl));

  GetConsoleMode(h, dw);
  SetConsoleMode(h, dw or ENABLE_PROCESSED_OUTPUT or ENABLE_PROCESSED_INPUT);
  c.X := 1;
  c.Y := 4;
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
      if dw = 1 then //can be done much more elegant cause it just
        if key <> 0 then //reads if ESC has been pressed.
        begin //don't let be confused by all the windows raw API code
          if key = 27 then //I couldn't find the READKEY function :)
          begin
            writeln;
            FSOUND_Close();
            exit;
          end;
        end;
    end;
    SetConsoleCursorPosition(h1, c);
    str(FMUSIC_GetOrder(mdl), sorder);
    str(FMUSIC_GetRow(mdl), srow);
    str(FSOUND_GetChannelsPlaying(), schp);
    str(FSOUND_GetCPUUsage(): 7: 5, scpu);
    s := 'order = ' + sorder + '  row = ' + srow + '  channels playing = ' + schp + '  cpu usage = ' + scpu;
    WriteConsole(h1, pchar(s), length(s) - 1, dw, nil);
    s := '                                                                                ';
  until false;

// ==========================================================================================
// CLEANUP AND SHUTDOWN
// ==========================================================================================

  FMUSIC_FreeSong(mdl);
  FSOUND_Close();
end.

