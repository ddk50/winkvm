//===============================================================================================
// STREAM2.EXE
// Copyright (c), Firelight Multimedia, 1999-2000.
//
// This sample specifically demonstrates the user callback streaming facility, and generates a
// very strange noise! :)
// Converted to Delphi by Steve 'Sly' Williams
//===============================================================================================
//  History
//
//  2001/09/09 by Steve 'Sly' Williams
//  - Updated to version 3.40
//
//  2000/12/15 by Steve 'Sly' Williams
//  - Updated to version 3.30
//
//  2000/11/13 by Steve 'Sly' Williams
//  - Fixed version check
//  - Updated to use FMODErrors.pas
//  - Added check for Delphi 4 to change wVirtualKeyCode to wVirtualScanCode
//
//  2000/06/04 by Steve 'Sly' Williams
//  - Conversion of stream2
//
//  2002/02/13 by Steve 'Sly' Williams
//  - Updated for Delphi 6 compatability (writeable constants)
//
//  2002/12/19 by Steve 'Sly' Williams
//  - Updated to version 3.61
//===============================================================================================

program stream2;

uses
  Windows, fmod, fmodtypes, fmoderrors, SysUtils;

{$APPTYPE CONSOLE}

{$IFDEF VER140}
{$DEFINE COMPILER6_UP}
{$ELSE}
  {$IFDEF VER150}
  {$DEFINE COMPILER6_UP}
  {$ENDIF}
{$ENDIF}

type
  PSmallInt = ^SmallInt;

var
  h: THandle;
  dw: DWORD;
  Status, Time, CPU, LenStr, BuffStr: String;

function StreamCallback(Stream: PFSoundStream; Buff: Pointer; Len, Param: Integer): ByteBool; stdcall;
{$IFDEF COMPILER6_UP}{$J+}{$ENDIF}
const
  Time1: Single = 0.0;
  Time2: Single = 0.0;
  Velocity1: Single = 0.0;
  Velocity2: Single = 0.0;
{$IFDEF COMPILER6_UP}{$J-}{$ENDIF}
var
  Count: Integer;
  Buffer: PChar;
begin
  Buffer := PChar(Buff);
  Count := 0;

	while Count < (Len shr 2) do		{ >>2 = 16bit stereo (4 bytes per sample) }
	begin
    PSmallInt(Buffer)^ := Trunc(Sin(Time1) * 32767.0);    { Left channel }
    Inc(Buffer, 2);
    PSmallInt(Buffer)^ := Trunc(Sin(Time2) * 32767.0);   { Right channel }
    Inc(Buffer, 2);

		Time1 := Time1 + 0.1 + Velocity1;
		Time2 := Time2 + 0.142 + Velocity2;
		Velocity1 := Velocity1 + (Sin(Time1) * 0.02);
		Velocity2 := Velocity2 + (Sin(Time2) * 0.02);

    Inc(Count);
	end;

  Str(FSOUND_Stream_GetTime(Stream) / 1000: 6: 3, Time);
  Str(FSOUND_GetCPUUsage: 7: 5, CPU);
  Str(Integer(Buff), BuffStr);
  Str(Len, LenStr);
  Status := 'Callback: Buff=' + BuffStr + ' Len=' + LenStr + ' Time=' + Time + ' CPU=' + CPU;
  WriteLn(Status);

  // Must return true for the stream to continue
  Result := True;
end;

const
  OutputTypes: array [0..3] of String =
    ('Direct Sound', 'Windows Multimedia Waveout', 'A3D', 'NoSound');
var
  Stream: PFSoundStream;
  Channel: Integer;
  Key: DWORD;
  Output, Driver: Integer;
  Index: Longint;
  Buf: input_record;
begin
  SetConsoleTitle('Example Stream2 (streaming callback)');
  h := GetStdHandle(STD_INPUT_HANDLE);
  Buf.EventType := Key_Event;
  if FMOD_VERSION > FSOUND_GetVersion then
  begin
    WriteLn('Error: You are using FMOD version ', FSOUND_GetVersion:3:2, '.  You should be using version ', FMOD_VERSION:3:2);
    Exit;
  end;

  WriteLn('-------------------------------------------------------------');
  WriteLn('FSOUND Streamer example.');
  WriteLn('Copyright (c) Firelight Multimedia, 1999.');
  WriteLn('-------------------------------------------------------------');

// ==========================================================================================
// SELECT OUTPUT
// ==========================================================================================

  WriteLn('---------------------------------------------------------');
  WriteLn('Output Type');
  WriteLn('---------------------------------------------------------');
  WriteLn('1 - ', OutputTypes[0]);
  WriteLn('2 - ', OutputTypes[1]);
  WriteLn('3 - ', OutputTypes[2]);
  WriteLn('4 - ', OutputTypes[3]);
  WriteLn('---------------------------------------------------------');
  WriteLn('Press a corresponding number or ESC to quit');

  Output := High(Output);
  repeat
    FlushConsoleInputBuffer(h);
    repeat
      ReadConsoleInput(h, buf, 1, dw);
    until not buf.Event.KeyEvent.bKeyDown;
{$IFDEF VER120}
    Key := buf.Event.KeyEvent.wVirtualScanCode;
{$ELSE}
    Key := buf.Event.KeyEvent.wVirtualKeyCode;
{$ENDIF}
    if Ord(Key) = 27 then
      Exit;
    if Key >= Ord('1') then
    begin
      Output := Ord(Key) - Ord('1');
      case Output of
        0: FSOUND_SetOutput(FSOUND_OUTPUT_DSOUND);
        1: FSOUND_SetOutput(FSOUND_OUTPUT_WINMM);
        2: FSOUND_SetOutput(FSOUND_OUTPUT_A3D);
        3: FSOUND_SetOutput(FSOUND_OUTPUT_NOSOUND);
      end;
    end;
  until Output < 4;

// ==========================================================================================
// SELECT DRIVER
// ==========================================================================================

// The following list are the drivers for the output method selected above.
  WriteLn('---------------------------------------------------------');
  case FSOUND_GetOutput of
    FSOUND_OUTPUT_NOSOUND: Write(OutputTypes[3]);
    FSOUND_OUTPUT_WINMM: Write(OutputTypes[1]);
    FSOUND_OUTPUT_DSOUND: Write(OutputTypes[0]);
    FSOUND_OUTPUT_A3D: Write(OutputTypes[2]);
  end;
  WriteLn(' Driver list');
  WriteLn('---------------------------------------------------------');
  for Index := 0 to FSOUND_GetNumDrivers - 1 do
    WriteLn(Index + 1, ' - ', FSOUND_GetDriverName(Index)); // print driver names
  WriteLn('---------------------------------------------------------'); // print driver names
  WriteLn('Press a corresponding number or ESC to quit');

  Driver := High(Driver);
  repeat
    FlushConsoleInputBuffer(h);
    repeat
      ReadConsoleInput(h, buf, 1, dw);
    until not buf.Event.KeyEvent.bKeyDown;
{$IFDEF VER120}
    Key := buf.Event.KeyEvent.wVirtualScanCode;
{$ELSE}
    Key := buf.Event.KeyEvent.wVirtualKeyCode;
{$ENDIF}
    if Ord(Key) = 27 then
      Exit;
    if Key >= Ord('1') then
    begin
      Driver := Ord(Key) - Ord('1');
      if Driver < FSOUND_GetNumDrivers then
        FSOUND_SetDriver(Driver); // Select sound card (0 = default)
    end;
  until Driver < FSOUND_GetNumDrivers;

// ==========================================================================================
// INITIALIZE
// ==========================================================================================
  if not FSOUND_Init(44100, 16, 0) then
  begin
    WriteLn('Error! Initializing');
    WriteLn(FMOD_ErrorString(FSOUND_GetError));
    FSOUND_Close;
    Exit;
  end;

// ==========================================================================================
// OPEN STREAM
// ==========================================================================================
	Stream := FSOUND_Stream_Create(StreamCallback, 1000 * 2 * 2, FSOUND_NORMAL or FSOUND_16BITS or FSOUND_STEREO, 22050, 12345);
  if Stream = nil then
  begin
    WriteLn('Error! Opening stream');
    WriteLn(FMOD_ErrorString(FSOUND_GetError));
    FSOUND_Close;
    Exit;
  end;

// ==========================================================================================
// PLAY STREAM
// ==========================================================================================
  WriteLn;
  WriteLn('=========================================================================');
  WriteLn('Press SPACE to pause/unpause');
  WriteLn('Press ESC to quit');
  WriteLn('=========================================================================');
  WriteLn('Playing stream...');

  Channel := FSOUND_Stream_Play(FSOUND_FREE, Stream);
  if Channel < 0 then
  begin
    WriteLn;
    WriteLn('Error! Play');
    WriteLn(FMOD_ErrorString(FSOUND_GetError));
    FSOUND_Close;
    Exit;
  end;

  GetConsoleMode(h, dw);
  SetConsoleMode(h, dw or ENABLE_PROCESSED_OUTPUT or ENABLE_PROCESSED_INPUT);
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
      begin
        if Key = 32 then
        begin
          FSOUND_SetPaused(Channel, not FSOUND_GetPaused(Channel));
          Key := 0;
        end;
      end;
    end;
  until Key = 27;
  WriteLn;
  FSOUND_Stream_Close(Stream);
  FSOUND_Close;
end.

