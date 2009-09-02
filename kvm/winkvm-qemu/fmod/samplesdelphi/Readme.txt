Some notes about the Delphi examples:
- The managing of the input and output (console that is) is done in a rather strange way. Don't be confused by all the Windows API calls because it's only a replacement of readkey and writeln (combined with gotoxy ...).
- The record sample has a bug in the full-duplex record stage with MMX reverb.  The bug is an access violation in the DSP callback function.  I have not tracked it down yet.
- The spectrum display in the FMOD testbed has some issues.  These are being worked on.
 
Original Delphi conversions by Dragan Bocevski
d_bocevski@yahoo.com or d_bocevski@hotpop.com.

Updated examples and maintenance by Steve 'Sly' Williams
stevewilliams@kromestudios.com
 