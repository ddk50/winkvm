//===============================================================================================
// USERSTREAM.EXE
// Copyright (c), Firelight Technologies Pty, Ltd, 1999-2004.
//
// This sample specifically demonstrates the user callback streaming facility, and generates a
// very strange noise! :)
//===============================================================================================

#include <stdio.h>
#include <math.h>

#if defined(WIN32) || defined(_WIN64) || defined(__WATCOMC__)
  #include <conio.h>
  #include <windows.h>
#else
  #include "../../api/inc/wincompat.h"
#endif

#include "../../api/inc/fmod.h"
#include "../../api/inc/fmod_errors.h"    // optional


/*
[
    [DESCRIPTION]
    User dsp callback for a stream!

    [PARAMETERS]
 
    [RETURN_VALUE]

    [REMARKS]

    [SEE_ALSO]
]
*/
void * F_CALLBACKAPI dspcallback(void *originalbuffer, void *newbuffer, int length, void *param)
{
    int                count;
    signed short      *stereo16bitbuffer = (signed short *)newbuffer;

    for (count=0; count<length; count++)        // >>2 = 16bit stereo (4 bytes per sample)
    {
        *stereo16bitbuffer >>= 1;
        *(stereo16bitbuffer+1) >>= 1;
        
        stereo16bitbuffer+=2;
    }

    return newbuffer;
}


/*
[
    [DESCRIPTION]
    User streamer callback 

    [PARAMETERS]
    'stream'         pointer to the stream supplying the callback
    'buff'           pointer to the streamer buffer to fill.
    'len'            length of the data block in BYTES
 
    [RETURN_VALUE]

    [REMARKS]
    What a strange noise!!!
    (heh heh)

    [SEE_ALSO]
]
*/
signed char F_CALLBACKAPI streamcallback(FSOUND_STREAM *stream, void *buff, int len, void *param) 
{
    int             count;
    static float    t1 = 0, t2 = 0;        // time
    static float    v1 = 0, v2 = 0;        // velocity
    signed short   *stereo16bitbuffer = (signed short *)buff;

    for (count=0; count<len>>2; count++)        // >>2 = 16bit stereo (4 bytes per sample)
    {
        *stereo16bitbuffer++ = (signed short)(sin(t1) * 32767.0f);    // left channel
        *stereo16bitbuffer++ = (signed short)(sin(t2) * 32767.0f);    // right channel

        t1 += 0.01f   + v1;
        t2 += 0.0142f + v2;
        v1 += (float)(sin(t1) * 0.002f);
        v2 += (float)(sin(t2) * 0.002f);
    }

//    printf("callback : buff = %p, len = %d, time = %.02f param = %d\n", buff, len, (float)FSOUND_Stream_GetTime(stream) / 1000.0f, param);

    return 1;
}



/*
[
    [DESCRIPTION]
    End of stream user callback, initialized with FSOUND_Stream_SetEndCallback or 
    FSOUND_Stream_SetSynchCallback

    [PARAMETERS]
    'stream'     A pointer to the stream that ended.
    'buff'       This is NULL for end of stream callbacks, or a string for synch callbacks.
    'len'        This is reserved and is always 0 for end and synch callbacks. ignore.
    'param'      This is the value passed to FSOUND_Stream_SetEndCallback or 
                 FSOUND_Stream_SetSynchCallback as a user data value.
 
    [RETURN_VALUE]
    TRUE or FALSE, the value is ignored.

    [REMARKS]

    [SEE_ALSO]
]
*/
signed char F_CALLBACKAPI endcallback(FSOUND_STREAM *stream, void *buff, int len, void *param)
{
    // end of stream callback doesnt have a 'buff' value, if it doesnt it could be a synch point.
    if (buff)
    {
        printf("\nSYNCHPOINT : \"%s\"\n", buff);
    }
    else
    {
        printf("\nSTREAM ENDED!!\n");
    }

    return TRUE;
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
    FSOUND_STREAM  *stream;
    FSOUND_DSPUNIT *dsp1,*dsp2;
    char key;

    if (FSOUND_GetVersion() < FMOD_VERSION)
    {
        printf("Error : You are using the wrong DLL version!  You should be using FMOD %.02f\n", FMOD_VERSION);
        return 1;
    }

    printf("-------------------------------------------------------------\n");
    printf("FSOUND Streamer example.\n");
    printf("Copyright (c) Firelight Technologies Pty, Ltd, 2001-2004.\n");
    printf("-------------------------------------------------------------\n");


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
    printf("---------------------------------------------------------\n");    // print driver names
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
        default :   exit(0);
    }

    // ==========================================================================================
    // SELECT DRIVER
    // ==========================================================================================
    {
        int i,driver=0;
        char key;

        // The following list are the drivers for the output method selected above.
        printf("---------------------------------------------------------\n");    
        switch (FSOUND_GetOutput())
        {
            case FSOUND_OUTPUT_NOSOUND:   printf("NoSound"); break;
            case FSOUND_OUTPUT_WINMM:     printf("Windows Multimedia Waveout"); break;
            case FSOUND_OUTPUT_DSOUND:    printf("Direct Sound"); break;
            case FSOUND_OUTPUT_ASIO:      printf("ASIO"); break;
            case FSOUND_OUTPUT_OSS:       printf("Open Sound System"); break;
            case FSOUND_OUTPUT_ESD:       printf("Enlightment Sound Daemon"); break;
            case FSOUND_OUTPUT_ALSA:      printf("Alsa"); break;
           
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
    if (!FSOUND_Init(44100, 16, 0))
    {
        printf("Error!\n");
        printf("%s\n", FMOD_ErrorString(FSOUND_GetError()));
        return 1;
    }

    // ==========================================================================================
    // CREATE USER STREAM
    // ==========================================================================================
    stream = FSOUND_Stream_Create(streamcallback, 6*2048, FSOUND_NORMAL | FSOUND_16BITS | FSOUND_STEREO, 44100, (void *)12345);
    if (!stream)
    {
        printf("Error!\n");
        printf("%s\n", FMOD_ErrorString(FSOUND_GetError()));
        return 1;
    }

    FSOUND_Stream_SetEndCallback(stream, endcallback, 0);

    dsp1 = FSOUND_Stream_CreateDSP(stream, dspcallback, 0, 0);    // priority 0 = it comes first in dsp chain.
    dsp2 = FSOUND_Stream_CreateDSP(stream, dspcallback, 1, 0);    // priority 1 = it comes last

    printf("Press any key to quit\n");
    printf("=========================================================================\n");
    printf("Playing stream...\n");

    // ==========================================================================================
    // PLAY STREAM
    // ==========================================================================================
    if (FSOUND_Stream_Play(FSOUND_FREE, stream) == -1)
    {
        printf("Error!\n");
        printf("%s\n", FMOD_ErrorString(FSOUND_GetError()));
        return 1;

    }

    printf("******* Hit a key to active stream DSP unit #1 to halve the stream volume.\n");
    getch();

    FSOUND_DSP_SetActive(dsp1, 1);
    printf("******* Now hit a key to active stream DSP unit #2 to quarter the stream volume.\n");
    getch();
    FSOUND_DSP_SetActive(dsp2, 1);
    printf("******* How hit a key to finish.\n");

    getch();

    printf("\n");

    FSOUND_DSP_Free(dsp1);
    FSOUND_DSP_Free(dsp2);

    FSOUND_Stream_Close(stream);

    FSOUND_Close();
   
    return 0;
}
