//===============================================================================================
// FSB.EXE
// Copyright (c), Firelight Technologies Pty, Ltd, 1999-2004.
//
// This example demonstrates use of the FMOD Sample Bank format and also usage of the 
// FSOUND_Sample_SetDefaultsEx function.
//===============================================================================================

#include <string.h>
#include <stdio.h>

#if defined(WIN32) || defined(_WIN64) || defined(__WATCOMC__)
  #include <windows.h>
  #include <conio.h>
#else
  #include "../../api/inc/wincompat.h"
#endif

#include "../../api/inc/fmod.h"
#include "../../api/inc/fmod_errors.h"    // optional



/*
[
    [DESCRIPTION]

    [PARAMETERS]
 
    [RETURN_VALUE]

    [REMARKS]

    [SEE_ALSO]
]
*/
int main(int argc, char *argv[])
{
    FSOUND_SAMPLE  *sample;
    FMUSIC_MODULE  *mod;
    char            key;
    int             sampleindex = 0, variation = 1, lastopenstate = -1;

    if (FSOUND_GetVersion() < FMOD_VERSION)
    {
        printf("Error : You are using the wrong DLL version!  You should be using FMOD %.02f\n", FMOD_VERSION);
        return 1;
    }

#if defined(WIN32) || defined(_WIN64) || defined(__CYGWIN32__) || defined(__WATCOMC__)
    FSOUND_SetOutput(FSOUND_OUTPUT_WINMM);
#elif defined(__linux__)
    FSOUND_SetOutput(FSOUND_OUTPUT_OSS);
#endif

    // ==========================================================================================
    // SELECT DRIVER
    // ==========================================================================================
    {
        long i,driver=0;
        char key;

        // The following list are the drivers for the output method selected above.
        printf("---------------------------------------------------------\n");    
        switch (FSOUND_GetOutput())
        {
            case FSOUND_OUTPUT_NOSOUND:    printf("NoSound"); break;
            case FSOUND_OUTPUT_WINMM:      printf("Windows Multimedia Waveout"); break;
            case FSOUND_OUTPUT_DSOUND:     printf("Direct Sound"); break;
            case FSOUND_OUTPUT_A3D:        printf("A3D"); break;
            case FSOUND_OUTPUT_OSS:        printf("Open Sound System"); break;
            case FSOUND_OUTPUT_ESD:        printf("Enlightenment Sound Daemon"); break;
            case FSOUND_OUTPUT_ALSA:       printf("ALSA"); break;
        };
        printf(" Driver list\n");    
        printf("---------------------------------------------------------\n");    

        for (i=0; i < FSOUND_GetNumDrivers(); i++) 
        {
            printf("%d - %s\n", i+1, FSOUND_GetDriverName(i));    // print driver names
        }
        printf("---------------------------------------------------------\n");    // print driver names
        printf("Press a corresponding number or ESC to quit\n");

        do
        {
            key = getch();
            if (key == 27) exit(0);

            driver = key - '1';
        } while (driver < 0 || driver >= FSOUND_GetNumDrivers());

        FSOUND_SetDriver(driver);                    // Select sound card (0 = default)
    }

    // ==========================================================================================
    // INITIALIZE
    // ==========================================================================================
    if (!FSOUND_Init(44100, 32, 0))
    {
        printf("Error!\n");
        printf("%s\n", FMOD_ErrorString(FSOUND_GetError()));
        FSOUND_Close();
        return 1;
    }

    // ==========================================================================================
    // OPEN FSB
    // ==========================================================================================
    mod = FMUSIC_LoadSongEx("../../media/footsteps.fsb", 0, 0, FSOUND_NONBLOCKING, 0, 0);
    if (!mod)
    {
        printf("Error!\n");
        printf("%s\n", FMOD_ErrorString(FSOUND_GetError()));
        FSOUND_Close();
        return 1;
    }

    printf("=========================================================================\n");
    printf("Press SPACE to toggle pitch/volume variation\n");
    printf("Press ESC   to quit\n");
    printf("=========================================================================\n");
    printf("\n");
  
    key = 0;
    do
    {
        printf("Pitch/volume variation: %s   \r", variation ? "on" : "off");
        fflush(stdout);

        /*
            Set initial defaults for both samples. Do this only once as soon as the FSB has finished loading.
        */
        if ((lastopenstate != 0) && (FMUSIC_GetOpenState(mod) == 0))
        {
            sample = FMUSIC_GetSample(mod, 0);
            FSOUND_Sample_SetDefaultsEx(sample, -1, -1, -1, -1, 2000, 128, -1);
            sample = FMUSIC_GetSample(mod, 1);
            FSOUND_Sample_SetDefaultsEx(sample, -1, -1, -1, -1, 2000, 128, -1);
            lastopenstate = 0;
        }

        /*
            Play a sample from the FSB. Do this once every frame when the FSB has finished loading.
        */
        if (FMUSIC_GetOpenState(mod) == 0)
        {
            sample  = FMUSIC_GetSample(mod, sampleindex++ & 1);
            FSOUND_PlaySound(FSOUND_FREE, sample);
        }

        if (kbhit())
        {
            key = getch();
            if (key == ' ')
            {
                variation ^= 1;
            }

            /*
                Change the defaults/variations on both samples.
            */
            if (variation)
            {
                sample = FMUSIC_GetSample(mod, 0);
                FSOUND_Sample_SetDefaultsEx(sample, -1, -1, -1, -1, 2000, 128, -1);
                sample = FMUSIC_GetSample(mod, 1);
                FSOUND_Sample_SetDefaultsEx(sample, -1, -1, -1, -1, 2000, 128, -1);
            }
            else
            {
                sample = FMUSIC_GetSample(mod, 0);
                FSOUND_Sample_SetDefaultsEx(sample, -1, -1, -1, -1, 0, 0, 0);
                sample = FMUSIC_GetSample(mod, 1);
                FSOUND_Sample_SetDefaultsEx(sample, -1, -1, -1, -1, 0, 0, 0);
            }
        }

        Sleep(600 + (variation ? (rand() % 100) : 50));
    
    } while (key != 27);

    printf("\n");

    FMUSIC_FreeSong(mod);
    FSOUND_Close();

    return 0;
}
