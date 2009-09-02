/*===============================================================================================
 SIMPLEST.EXE
 Copyright (c), Firelight Technologies Pty, Ltd, 1999,2000.

 This is the simplest way to play a song through FMOD.  It is basically Init, Load, Play!
===============================================================================================*/

#include <stdio.h>
#include <stdlib.h>
#if defined(WIN32) || defined(_WIN64) || defined(__WATCOMC__)
    #include <windows.h>
    #include <conio.h>
#else
    #include "../../api/inc/wincompat.h"
#endif

#include "../../api/inc/fmod.h"
#include "../../api/inc/fmod_errors.h"    /* optional */

int main()
{
    FMUSIC_MODULE *mod = NULL;

    if (FSOUND_GetVersion() < FMOD_VERSION)
    {
        printf("Error : You are using the wrong DLL version!  You should be using FMOD %.02f\n", FMOD_VERSION);
        exit(1);
    }
    
    /*
        INITIALIZE
    */
    if (!FSOUND_Init(32000, 64, 0))
    {
        printf("%s\n", FMOD_ErrorString(FSOUND_GetError()));
        exit(1);
    }

  
    /*
        LOAD SONG
    */
    mod = FMUSIC_LoadSong("../../media/invtro94.s3m");
    if (!mod)
    {
        printf("%s\n", FMOD_ErrorString(FSOUND_GetError()));
        exit(1);
    }
    FMUSIC_PlaySong(mod);   

    /*
        UPDATE INTERFACE
    */

    printf("Press any key to quit\n");
    printf("=========================================================================\n");
    printf("Playing %s...\n", FMUSIC_GetName(mod));
    do
    {
        printf("order = %d/%d, row = %d/%d channels playing = %d cpu usage = %.02f%%     \r", FMUSIC_GetOrder(mod), FMUSIC_GetNumOrders(mod), FMUSIC_GetRow(mod), FMUSIC_GetPatternLength(mod, FMUSIC_GetOrder(mod)), FSOUND_GetChannelsPlaying(), FSOUND_GetCPUUsage());
        Sleep(10);
    } while (!kbhit());

    getch();

    printf("\n");

    /*
        FREE SONG AND SHUT DOWN
    */

    FMUSIC_FreeSong(mod);
    FSOUND_Close();

    return 0;
}
