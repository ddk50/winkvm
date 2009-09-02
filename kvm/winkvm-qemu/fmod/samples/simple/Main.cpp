/*===============================================================================================
 SIMPLE.EXE
 Copyright (c), Firelight Technologies Pty, Ltd 1999-2004.

 This example demonstrates some fundamental FMOD usage, including device enumeration, output
 mode selection, user file I/O callbacks, loading and playing samples and a music file, and
 calling some runtime manipulation and information functions.
===============================================================================================*/

#include <stdio.h>
#if defined(WIN32) || defined(_WIN64) || defined(__WATCOMC__)
  #include <conio.h>
  #include <windows.h>
#elif defined(__linux__)
  #include "../../api/inc/wincompat.h"
#endif
#include <stdlib.h>

#include "../../api/inc/fmod.h"
#include "../../api/inc/fmod_errors.h"    /* optional */

/*
    File callbacks
*/
void * F_CALLBACKAPI myopen(const char *name)
{
    return fopen(name, "rb");
}

void F_CALLBACKAPI myclose(void *handle)
{
    fclose((FILE *)handle);
}

int F_CALLBACKAPI myread(void *buffer, int size, void *handle)
{
    return (int)fread(buffer, 1, size, (FILE *)handle);
}

int F_CALLBACKAPI myseek(void *handle, int pos, signed char mode)
{
    return fseek((FILE *)handle, pos, mode);
}

int F_CALLBACKAPI mytell(void *handle)
{
    return ftell((FILE *)handle);
}

/*
    Memory allocation callbacks
*/
void * F_CALLBACKAPI myalloc(unsigned int size)
{
    printf("FMOD Malloc'ed %d bytes\n", size);

    return malloc(size);
}

void * F_CALLBACKAPI myrealloc(void *data, unsigned int size)
{
    printf("FMOD Realloced'ed %d bytes\n", size);

    return realloc(data, size);
}

void  F_CALLBACKAPI myfree(void *ptr)
{
    printf("FMOD freed some memory\n");

    free(ptr);
}



void F_CALLBACKAPI ordercallback(FMUSIC_MODULE *mod, unsigned char param)
{
    printf("\nOrder Callback : param %d\n", param);
}

void F_CALLBACKAPI instcallback(FMUSIC_MODULE *mod, unsigned char param)
{
    printf("\nInst Callback : param %d\n", param);
}


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
    FMUSIC_MODULE *mod = 0;
    FSOUND_SAMPLE *samp1 = 0, *samp2 = 0, *samp3 = 0;
    int key;
    int driver, i;
 
    if (FSOUND_GetVersion() < FMOD_VERSION)
    {
        printf("Error : You are using the wrong DLL version!  You should be using FMOD %.02f\n", FMOD_VERSION);
        return 1;
    }

    /*
        SELECT OUTPUT METHOD
    */
    
    printf("---------------------------------------------------------\n");    
    printf("Output Type\n");    
    printf("---------------------------------------------------------\n");
#if defined(WIN32) || defined(_WIN64) || defined(__CYGWIN32__) || defined(__WATCOMC__)
    printf("1 - Direct Sound\n");
    printf("2 - Windows Multimedia Waveout\n");
    printf("3 - ASIO\n");
#elif defined(__linux__)
    printf("1 - OSS - Open Sound System\n");
    printf("2 - ESD - Elightment Sound Daemon\n");
    printf("3 - ALSA 0.9 - Advanced Linux Sound Architecture\n");   
#endif
   
    printf("4 - NoSound\n");   
    printf("---------------------------------------------------------\n");    /* print driver names */
    printf("Press a corresponding number or ESC to quit\n");

   
    do
    {
        key = getch();
    } while (key != 27 && key < '1' && key > '4');

    switch (key)
    {
#if defined(WIN32) || defined(_WIN64) || defined(__CYGWIN32__) || defined(__WATCOMC__)
        case '1' :  FSOUND_SetOutput(FSOUND_OUTPUT_DSOUND);
                    break;
        case '2' :  FSOUND_SetOutput(FSOUND_OUTPUT_WINMM);
                    break;
        case '3' :  FSOUND_SetOutput(FSOUND_OUTPUT_ASIO);
                    break;
#elif defined(__linux__)
        case '1' :  FSOUND_SetOutput(FSOUND_OUTPUT_OSS);
                    break;
        case '2' :  FSOUND_SetOutput(FSOUND_OUTPUT_ESD);
                    break;
        case '3' :  FSOUND_SetOutput(FSOUND_OUTPUT_ALSA);
                    break;
#endif        
        case '4' :  FSOUND_SetOutput(FSOUND_OUTPUT_NOSOUND);
                    break;       
       
        default :   return 1;
    }

    /*
        Set custom file callbacks?  This doesnt have to be done, its just here as an example.
        Not MIDI files do not use file callbacks so midi loading will fail.  FMUSIC_LoadSongMemory could be used to load the midi.
    */
#if 0
    FSOUND_File_SetCallbacks(myopen, myclose, myread, myseek, mytell);
#endif

    /*
        Set custom memory callbacks?  This is optional as well of course.
    */
#if 0
    /* user callbacks */
    if (!FSOUND_SetMemorySystem(NULL, 0, myalloc, myrealloc, myfree))
#else
    /* internal memory management - give it 1 mb and no more mallocs will come from fmod */
    if (!FSOUND_SetMemorySystem(malloc(4*1024*1024), 4*1024*1024, NULL, NULL, NULL)) 
#endif
    {
        printf("Error!\n");
        printf("%s\n", FMOD_ErrorString(FSOUND_GetError()));
        return 1;
    }

    /*
        SELECT DRIVER
    */

    /*
        The following list are the drivers for the output method selected above.
    */
    printf("---------------------------------------------------------\n");    
    switch (FSOUND_GetOutput())
    {
        case FSOUND_OUTPUT_NOSOUND:    printf("NoSound"); break;     
#if defined(WIN32) || defined(_WIN64) || defined(__CYGWIN32__) || defined(__WATCOMC__)
        case FSOUND_OUTPUT_WINMM:      printf("Windows Multimedia Waveout"); break;
        case FSOUND_OUTPUT_DSOUND:     printf("Direct Sound"); break;
        case FSOUND_OUTPUT_ASIO:       printf("ASIO"); break;
#elif defined(__linux__)
        case FSOUND_OUTPUT_OSS:        printf("Open Sound System"); break;
        case FSOUND_OUTPUT_ESD:        printf("Enlightment Sound Daemon"); break;
        case FSOUND_OUTPUT_ALSA:       printf("ALSA"); break;       
#endif
       
    };

    printf(" Driver list\n");    
    printf("---------------------------------------------------------\n");    

    for (i=0; i < FSOUND_GetNumDrivers(); i++) 
    {
        printf("%d - %s\n", i+1, FSOUND_GetDriverName(i));    /* print driver names */
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
    } while (driver < 0 || driver >= FSOUND_GetNumDrivers());

    FSOUND_SetDriver(driver);                    /* Select sound card (0 = default) */

    /*
        INITIALIZE
    */
    if (!FSOUND_Init(44100, 32, FSOUND_INIT_USEDEFAULTMIDISYNTH))
    {
        printf("Error!\n");
        printf("%s\n", FMOD_ErrorString(FSOUND_GetError()));
        return 1;
    }

    /*
        LOAD SONG
    */

    /*
        The following list are the drivers for the output method selected above.
    */
    printf("---------------------------------------------------------\n");    
    printf(" Select Music Type\n");    
    printf("---------------------------------------------------------\n");    
    printf("1 - MOD\n");
    printf("2 - MIDI (Using Default Software Synth)\n");
    printf("---------------------------------------------------------\n");
    printf("Press a corresponding number or ESC to quit\n");

    do
    {
        key = getch();
    } while (key != 27 && key < '1' && key > '2');

    switch (key)
    {
        case '1' :    mod = FMUSIC_LoadSong("../../media/invtro94.s3m");
                      break;
        case '2' :    mod = FMUSIC_LoadSong("../../media/canyon.mid");
                      break;
        default  :    return 1;
    }

    if (!mod)
    {
        printf("Error!\n");
        printf("%s\n", FMOD_ErrorString(FSOUND_GetError()));
        return 1;
    }
    /*
        LOAD SAMPLES
    */

    /* PCM,44,100 Hz, 8 Bit, Mono */
    samp1 = FSOUND_Sample_Load(FSOUND_UNMANAGED, "../../media/drumloop.wav", FSOUND_NORMAL | FSOUND_HW2D, 0, 0);   /* hardware? why not, just to show it can be done */
    if (!samp1)
    {
        printf("Error!\n");
        printf("%s\n", FMOD_ErrorString(FSOUND_GetError()));
        return 1;
    }
    FSOUND_Sample_SetMode(samp1, FSOUND_LOOP_OFF);  /* this wav has loop points in it which turns looping on.. turn it off! */

    /* PCM,22,050 Hz, 16 Bit, Mono */
    samp2 = FSOUND_Sample_Load(FSOUND_UNMANAGED, "../../media/jaguar.wav", FSOUND_NORMAL, 0, 0);
    if (!samp2)
    {
        printf("Error!\n");
        printf("%s\n", FMOD_ErrorString(FSOUND_GetError()));
        return 1;
    }

    /* PCM,22,050 Hz, 8 Bit, Stereo */
    samp3 = FSOUND_Sample_Load(FSOUND_UNMANAGED, "../../media/chimes.wav", FSOUND_NORMAL, 0, 0);
    if (!samp3)
    {
        printf("Error!\n");
        printf("%s\n", FMOD_ErrorString(FSOUND_GetError()));
        return 1;
    }

    /*
        DISPLAY HELP
    */

    printf("FSOUND Output Method : ");
    switch (FSOUND_GetOutput())
    {
        case FSOUND_OUTPUT_NOSOUND: printf("FSOUND_OUTPUT_NOSOUND\n"); break;
        case FSOUND_OUTPUT_WINMM:   printf("FSOUND_OUTPUT_WINMM\n"); break;
        case FSOUND_OUTPUT_DSOUND:  printf("FSOUND_OUTPUT_DSOUND\n"); break;
        case FSOUND_OUTPUT_ASIO:    printf("FSOUND_OUTPUT_ASIO\n"); break;
        case FSOUND_OUTPUT_OSS:     printf("FSOUND_OUTPUT_OSS\n"); break;
        case FSOUND_OUTPUT_ESD:     printf("FSOUND_OUTPUT_ESD\n"); break;
        case FSOUND_OUTPUT_ALSA:    printf("FSOUND_OUTPUT_ALSA\n"); break;       
    };

    printf("FSOUND Mixer         : ");
    switch (FSOUND_GetMixer())
    {
        case FSOUND_MIXER_BLENDMODE:      printf("FSOUND_MIXER_BLENDMODE\n"); break;
        case FSOUND_MIXER_MMXP5:          printf("FSOUND_MIXER_MMXP5\n"); break;
        case FSOUND_MIXER_MMXP6:          printf("FSOUND_MIXER_MMXP6\n"); break;
        case FSOUND_MIXER_QUALITY_FPU:    printf("FSOUND_MIXER_QUALITY_FPU\n"); break;
        case FSOUND_MIXER_QUALITY_MMXP5:  printf("FSOUND_MIXER_QUALITY_MMXP5\n"); break;
        case FSOUND_MIXER_QUALITY_MMXP6:  printf("FSOUND_MIXER_QUALITY_MMXP6\n"); break;
    };
    printf("FSOUND Driver        : %s\n", FSOUND_GetDriverName(FSOUND_GetDriver()));

    printf("=========================================================================\n");
    printf("Press 1       Play 16bit sound at any time\n");
    printf("      2       Play 8bit sound at any time (limited to 3 at a time using FSOUND_Sample_SetMaxPlaybacks)\n");
    printf("      3       Play 16bit STEREO sound at any time\n");
    printf("      <       Rewind mod back 1 order\n");
    printf("      >       FastForward mod forward 1 order\n");
    printf("      SPACE   Pause/unpause music at any time\n");
    printf("      ESC     Quit\n");
    printf("=========================================================================\n");
    printf("Playing \"%s\"...\n", FMUSIC_GetName(mod));

    {
        int count;
        for (count=0; count < FMUSIC_GetNumSamples(mod) && count < 20; count+=2)
        {
            const char *a,*b;
            a = FSOUND_Sample_GetName(FMUSIC_GetSample(mod, count));
            b = FSOUND_Sample_GetName(FMUSIC_GetSample(mod, count+1));
            if (!a)
                a = "";
            if (!b)
                b = "";
            printf("%02d %-33s ", count, a);
            printf("%02d %-33s\n", count+1, b);
        }
    }

    FSOUND_Sample_SetMaxPlaybacks(samp2, 3);

    /*
        START PLAYING MUSIC!
    */
    FMUSIC_SetOrderCallback(mod, ordercallback, 1);
    FMUSIC_SetInstCallback(mod, instcallback, 5);
    FMUSIC_SetMasterVolume(mod, 192);
    FMUSIC_SetLooping(mod, FALSE);
    FMUSIC_PlaySong(mod);

    do
    {
        key = 0;

        printf("order = %d/%d, row = %d/%d time = %d.%02d finished %d channels = %d cpu = %.02f%%   \r", 
                FMUSIC_GetOrder(mod), 
                FMUSIC_GetNumOrders(mod), 
                FMUSIC_GetRow(mod), 
                FMUSIC_GetPatternLength(mod, FMUSIC_GetOrder(mod)), 
                FMUSIC_GetTime(mod) / 1000,  
                FMUSIC_GetTime(mod) % 1000 / 10, 
                FMUSIC_IsFinished(mod), 
                FSOUND_GetChannelsPlaying(), 
                FSOUND_GetCPUUsage());

        if (kbhit())
        {
            key = getch();

            if (key == ' ') 
            {
                FMUSIC_SetPaused(mod, !FMUSIC_GetPaused(mod));
            }
            if (key == '1') 
            {
                FSOUND_PlaySound(FSOUND_FREE, samp1);
            }
            if (key == '2') 
            {
                int channel;

                channel = FSOUND_PlaySoundEx(FSOUND_FREE, samp2, NULL, TRUE);
                FSOUND_SetCurrentPosition(channel, FSOUND_Sample_GetLength(samp2)-1);
                FSOUND_SetFrequency(channel, -22050);   /* Play it backwards! */
                FSOUND_SetVolume(channel, 255);
                FSOUND_SetPan(channel, 255);            /* pan it all the way to the right */
                FSOUND_SetPaused(channel, FALSE);
            }
            if (key == '3') 
            {
                int channel;

                channel = FSOUND_PlaySoundEx(FSOUND_FREE, samp3, NULL, TRUE);
                FSOUND_SetPaused(channel, FALSE);
            }
            if (key == '>') 
            {
                FMUSIC_SetOrder(mod, FMUSIC_GetOrder(mod)+1);
            }
            if (key == '<') 
            {
                FMUSIC_SetOrder(mod, FMUSIC_GetOrder(mod)-1);
            }
        }

        Sleep(10);       

    } while (key != 27);

    FMUSIC_StopSong(mod);

    printf("\n");

    /*
        CLEANUP AND SHUTDOWN
    */
    FSOUND_Sample_Free(samp1);
    FSOUND_Sample_Free(samp2);
    FSOUND_Sample_Free(samp3);
    FMUSIC_FreeSong(mod);

    FSOUND_Close();
  

    return 0;
}


