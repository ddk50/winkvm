//===============================================================================================
// STREAM.EXE
// Copyright (c), Firelight Technologies Pty, Ltd, 1999-2004.
//
// This example takes a command line parameter, a wav/mp2/mp3/ogg etc file, and uses the streamer 
// system to play it back.
//===============================================================================================

#include <string.h>
#include <stdio.h>
#include <math.h>

#if defined(WIN32) || defined(_WIN64) || defined(__WATCOMC__)
  #include <windows.h>
  #include <conio.h>
#else
  #include "../../api/inc/wincompat.h"
#endif

#include "../../api/inc/fmod.h"
#include "../../api/inc/fmod_errors.h"    // optional

int channel = -1;

void *F_CALLBACKAPI myopen(const char *name)
{
    return (void *)fopen(name, "rb");
}

void F_CALLBACKAPI myclose(void *handle)
{
    fclose((FILE *)handle);
}

int F_CALLBACKAPI myread(void *buffer, int size, void *handle)
{
    return fread(buffer, 1, size, (FILE *)handle);
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
[
    [DESCRIPTION]
    End of stream user callback, initialized with FSOUND_Stream_SetEndCallback or 
    FSOUND_Stream_SetSynchCallback

    [PARAMETERS]
    'stream'      A pointer to the stream that ended.
    'buff'        This is NULL for end of stream callbacks, or a string for synch callbacks.
    'len'         This is reserved and is always 0 for end and synch callbacks. ignore.
    'param'       This is the value passed to FSOUND_Stream_SetEndCallback or 
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
    main entry point into streamer example.

    [PARAMETERS]
    'argc'    Number of command line parameters.
    'argv'    Parameter list
 
    [RETURN_VALUE]
    void

    [REMARKS]

    [SEE_ALSO]
]
*/
int main(int argc, char *argv[])
{
    FSOUND_STREAM *stream;
    FSOUND_SAMPLE *sptr;
    char           key;

    if (FSOUND_GetVersion() < FMOD_VERSION)
    {
        printf("Error : You are using the wrong DLL version!  You should be using FMOD %.02f\n", FMOD_VERSION);
        return 1;
    }

    if (argc < 2)
    {
        printf("-------------------------------------------------------------\n");
        printf("FMOD Streamer example.\n");
        printf("Copyright (c) Firelight Technologies Pty, Ltd, 1999-2004.\n");
        printf("-------------------------------------------------------------\n");
        printf("Syntax: stream infile.[mp2 mp3 wav ogg wma asf]\n\n");
        return 1;
    }

#if defined(WIN32) || defined(_WIN64) || defined(__CYGWIN32__) || defined(__WATCOMC__)
    FSOUND_SetOutput(FSOUND_OUTPUT_WINMM);
#elif defined(__linux__)
    FSOUND_SetOutput(FSOUND_OUTPUT_OSS);
#endif

    // Set custom file callbacks?  This doesnt have to be done, its just here as an example.
    FSOUND_File_SetCallbacks(myopen, myclose, myread, myseek, mytell);

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

    FSOUND_Stream_SetBufferSize(1000);

    // ==========================================================================================
    // OPEN STREAM (use #if 1 for streaming from memory)
    // ==========================================================================================
#if 0
    {
        FILE      *fp;
        int        length;
        char      *data;

        fp = fopen(argv[1], "rb");
        if (!fp)
        {
            printf("Error!\n");
            printf("File Not Found\n");
            FSOUND_Close();
            return 1;
        }
        fseek(fp, 0, SEEK_END);
        length = ftell(fp);
        fseek(fp, 0, SEEK_SET);

        data = (char *)malloc(length);
        fread(data, length, 1, fp);
        fclose(fp);

        stream = FSOUND_Stream_Open(data, FSOUND_NORMAL | FSOUND_MPEGACCURATE | FSOUND_LOADMEMORY, 0, length);

        // The memory pointer MUST remain valid while streaming!
    }
#else

    if (!strnicmp(argv[1], "http:", 5))
    {
        printf("Connecting to %s, please wait (this may take some time)....\n", argv[1]);
    }
    stream = FSOUND_Stream_Open(argv[1], FSOUND_NORMAL | FSOUND_MPEGACCURATE, 0, 0);
    if (!stream)
    {
        printf("Error!\n");
        printf("%s\n", FMOD_ErrorString(FSOUND_GetError()));
        FSOUND_Close();

        return 1;
    }

#endif

    // ==========================================================================================
    // SET AN END OF STREAM CALLBACK AND RIFF SYNCH POINTS CALLBACK
    // ==========================================================================================
    FSOUND_Stream_SetEndCallback(stream, endcallback, 0);
    FSOUND_Stream_SetSyncCallback(stream, endcallback, 0);
   

    printf("=========================================================================\n");
    printf("Press SPACE to pause/unpause\n");
    printf("Press 'f'   to fast forward 2 seconds\n");
    printf("Press ESC   to quit\n");
    printf("=========================================================================\n");
    printf("Playing stream...\n\n");
  
    sptr = FSOUND_Stream_GetSample(stream);
    if (sptr)
    {
        int freq;
        FSOUND_Sample_GetDefaults(sptr, &freq, NULL, NULL, NULL);
        printf("Name      : %s\n", FSOUND_Sample_GetName(sptr));
        printf("Frequency : %d\n\n", freq);
    }

    key = 0;
    do
    {
        if (channel < 0)
        {
            // ==========================================================================================
            // PLAY STREAM
            // ==========================================================================================
            channel = FSOUND_Stream_PlayEx(FSOUND_FREE, stream, NULL, TRUE);
            FSOUND_SetPaused(channel, FALSE);
        }

        if (kbhit())
        {
            key = getch();
            if (key == ' ')
            {
                FSOUND_SetPaused(channel, !FSOUND_GetPaused(channel));
            }
            if (key == 'f')
            {
                FSOUND_Stream_SetTime(stream, FSOUND_Stream_GetTime(stream) + 2000);
            }
        }

        printf("pos %6d/%6d time %02d:%02d/%02d:%02d cpu %5.02f%%   \r", FSOUND_Stream_GetPosition(stream), 
                                                                         FSOUND_Stream_GetLength(stream), 
                                                                         FSOUND_Stream_GetTime(stream) / 1000 / 60, 
                                                                         FSOUND_Stream_GetTime(stream) / 1000 % 60, 
                                                                         FSOUND_Stream_GetLengthMs(stream) / 1000 / 60, 
                                                                         FSOUND_Stream_GetLengthMs(stream) / 1000 % 60, 
                                                                         FSOUND_GetCPUUsage());

        Sleep(10);
    
    } while (key != 27);

    printf("\n");

    FSOUND_Stream_Close(stream);

    FSOUND_Close();

    return 0;
}
