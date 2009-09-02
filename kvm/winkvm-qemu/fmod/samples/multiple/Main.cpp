/*===============================================================================================
 MULTIPLE.EXE
 Copyright (c), Firelight Technologies Pty, Ltd 1999-2004.

 This example demonstrates how to use dynamic loading of fmod.dll to achieve multiple soundcard
 output at the same time.  If you do not have 2 soundcards you will have to select the same
 device twice.
 Besides this, it is a good helper to display how fmod.dll can be loaded dynamically without 
 having to link an import library.

 IMPORTANT!!! You must copy fmod.dll to fmod2.dll or libfmod-3.63.so to libfmod-3.63_2.so to
 avoid operating systems caching the dll!
===============================================================================================*/

#include <stdio.h>

#if defined(WIN32) || defined(_WIN64) || defined(__WATCOMC__)
  #include <windows.h>
  #include <conio.h>
#else
  #include "../../api/inc/wincompat.h"
#endif

#include "../../api/inc/fmoddyn.h"
#include "../../api/inc/fmod.h"
#include "../../api/inc/fmod_errors.h"    /* optional */

#if defined(WIN32) || defined(_WIN64) || defined(__CYGWIN32__)  || defined(__WATCOMC__)
  #define FMOD_LIB  "fmod.dll"
  #define FMOD_LIB2 "fmod2.dll"
#else
  #define FMOD_LIB  "libfmod-3.70.so"
  #define FMOD_LIB2 "libfmod-3.70_2.so"
#endif

#define FMOD_LIB_PATH  "../../api/" ## FMOD_LIB
#define FMOD_LIB_PATH2 "../../api/" ## FMOD_LIB2


/*
[
    [DESCRIPTION]

    [PARAMETERS]
 
    [RETURN_VALUE]

    [REMARKS]

    [SEE_ALSO]
]
*/
int main()
{
    FMOD_INSTANCE *fmod1, *fmod2;
    FSOUND_SAMPLE *samp1, *samp2;
    int key;
    int driver, i;

/*    system("copy ..\\..\\api\\fmod.dll ..\\..\\api\\fmod2.dll"); */

    fmod1 = FMOD_CreateInstance(FMOD_LIB_PATH);
    fmod2 = FMOD_CreateInstance(FMOD_LIB_PATH2);

    if (!fmod1)
    {
        printf("Error : Cannot find %s!\n", FMOD_LIB);
        return 1;
    }
    if (!fmod2)
    {
        printf("Error : Cannot find %s!\n", FMOD_LIB2);
        printf("You have to copy %s to %s first to make this work\n", FMOD_LIB, FMOD_LIB2);
        return 1;
    }

    if (fmod1->FSOUND_GetVersion() < FMOD_VERSION)
    {
        printf("Error : You are using the wrong DLL version!  You should be using FMOD %.02f\n", FMOD_VERSION);
        return 1;
    }

    if (fmod2->FSOUND_GetVersion() < FMOD_VERSION)
    {
        printf("Error : You are using the wrong DLL version!  You should be using FMOD %.02f\n", FMOD_VERSION);
        return 1;
    }

#if defined(WIN32) || defined(_WIN64) || defined(__CYGWIN32__) || defined(__WATCOMC__)
    fmod1->FSOUND_SetOutput(FSOUND_OUTPUT_DSOUND);
    fmod2->FSOUND_SetOutput(FSOUND_OUTPUT_DSOUND);
#else
    fmod1->FSOUND_SetOutput(FSOUND_OUTPUT_OSS);
    fmod2->FSOUND_SetOutput(FSOUND_OUTPUT_OSS);
#endif

    /*
        SELECT DRIVER 1
    */

    /*
        The following list are the drivers for the output method selected above.
    */
    printf("---------------------------------------------------------\n");    
    printf("Select soundcard #1\n");    
    printf("---------------------------------------------------------\n");    

    for (i=0; i < fmod1->FSOUND_GetNumDrivers(); i++) 
    {
        printf("%d - %s\n", i+1, fmod1->FSOUND_GetDriverName(i));    /* print driver names */
    }
    printf("---------------------------------------------------------\n");    
    printf("Press a corresponding number or ESC to quit\n");

    do
    {
        key = getch();
        if (key == 27) 
        {
            return 0;
        }
        driver = key - '1';
    } while (driver < 0 || driver >= fmod1->FSOUND_GetNumDrivers());

    fmod1->FSOUND_SetDriver(driver);                    /* Select sound card (0 = default) */

    printf("---------------------------------------------------------\n");    
    printf("Select soundcard #2\n");    
    printf("---------------------------------------------------------\n");    

    for (i=0; i < fmod2->FSOUND_GetNumDrivers(); i++) 
    {
        printf("%d - %s\n", i+1, fmod2->FSOUND_GetDriverName(i));    /* print driver names */
    }
    printf("---------------------------------------------------------\n");    
    printf("Press a corresponding number or ESC to quit\n");

    do
    {
        key = getch();
        if (key == 27) 
        {
            return 0;
        }
        driver = key - '1';
    } while (driver < 0 || driver >= fmod2->FSOUND_GetNumDrivers());

    fmod2->FSOUND_SetDriver(driver);                    /* Select sound card (0 = default) */

    /*
        INITIALIZE
    */
    if (!fmod1->FSOUND_Init(44100, 32, FSOUND_INIT_USEDEFAULTMIDISYNTH))
    {
        printf("Error!\n");
        printf("%s\n", FMOD_ErrorString(fmod1->FSOUND_GetError()));
        return 1;
    }

    /*
        INITIALIZE
    */
    if (!fmod2->FSOUND_Init(44100, 32, FSOUND_INIT_USEDEFAULTMIDISYNTH))
    {
        printf("Error!\n");
        printf("%s\n", FMOD_ErrorString(fmod2->FSOUND_GetError()));
        return 1;
    }

    /*
        LOAD SAMPLE (twice)
    */

    samp1 = fmod1->FSOUND_Sample_Load(FSOUND_UNMANAGED, "../../media/drumloop.wav", FSOUND_NORMAL | FSOUND_2D, 0, 0);
    if (!samp1)
    {
        printf("Error!\n");
        printf("%s\n", FMOD_ErrorString(fmod1->FSOUND_GetError()));
        return 1;
    }
    fmod1->FSOUND_Sample_SetMode(samp1, FSOUND_LOOP_OFF);  /* this wav has loop points in it which turns looping on.. turn it off! */

    samp2 = fmod2->FSOUND_Sample_Load(FSOUND_UNMANAGED, "../../media/drumloop.wav", FSOUND_NORMAL | FSOUND_2D, 0, 0);
    if (!samp1)
    {
        printf("Error!\n");
        printf("%s\n", FMOD_ErrorString(fmod2->FSOUND_GetError()));
        return 1;
    }
    fmod2->FSOUND_Sample_SetMode(samp2, FSOUND_LOOP_OFF);  /* this wav has loop points in it which turns looping on.. turn it off! */

    /*
        DISPLAY HELP
    */

    printf("=========================================================================\n");
    printf("Press 1       Play 16bit sound on soundcard #1\n");
    printf("      2       Play 16bit sound on soundcard #2\n");
    printf("      ESC     Quit\n");
    printf("=========================================================================\n");

    do
    {
        key = 0;

        if (kbhit())
        {
            key = getch();

            if (key == '1') 
            {
                fmod1->FSOUND_PlaySound(FSOUND_FREE, samp1);
            }
            if (key == '2') 
            {
                fmod2->FSOUND_PlaySound(FSOUND_FREE, samp2);
            }
        }

        Sleep(10);

    } while (key != 27);

    printf("\n");

    /*
        CLEANUP AND SHUTDOWN
    */

    fmod1->FSOUND_Sample_Free(samp1);
    fmod2->FSOUND_Sample_Free(samp2);

    fmod1->FSOUND_Close();
    fmod2->FSOUND_Close();

    FMOD_FreeInstance(fmod1);
    FMOD_FreeInstance(fmod2);

    return 0;
}

