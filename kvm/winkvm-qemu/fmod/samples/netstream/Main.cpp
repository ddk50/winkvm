//===============================================================================================
// netstream.exe
// Copyright (c), Firelight Technologies Pty, Ltd, 1999-2004.
//
// This example shows how to play internet streams (SHOUTcast/Icecast2/HTTP)
//===============================================================================================

#include <stdio.h>

#if defined(WIN32) || defined(_WIN64) || defined(__WATCOMC__)
  #include <windows.h>
  #include <conio.h>
#else
  #include "../../api/inc/wincompat.h"
  #include <string.h>
#endif

#include "../../api/inc/fmod.h"
#include "../../api/inc/fmod_errors.h"


const char *status_str[] = 
{
    "NOTCONNECTED",
    "CONNECTING  ",
    "BUFFERING   ",
    "READY       ",
    "ERROR       "
};

const char bar[56]   = "==================================================";
const char nobar[56] = "                                                  ";

char artist[256] = "";
char title[256]  = "";
int  metanum     = 0;


/*
[
    [DESCRIPTION]

    [PARAMETERS]
 
    [RETURN_VALUE]

    [REMARKS]

    [SEE_ALSO]
]
*/
signed char F_CALLBACKAPI metacallback(char *name, char *value, void *userdata)
{
    if (!strcmp("ARTIST", name))
    {
        strcpy(artist, value);
        return TRUE;
    }

    if (!strcmp("TITLE", name))
    {
        strcpy(title, value);
        metanum++;
        return TRUE;
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
int main(int argc, char *argv[])
{
    FSOUND_STREAM *stream;
    int read_percent = 0, i, driver = 0, channel = -1, status = 0, openstate, bitrate;
    unsigned int flags;
    char s[256] = "";
    char key;


    if (FSOUND_GetVersion() < FMOD_VERSION)
    {
        printf("Error : You are using the wrong DLL version!  You should be using FMOD %.02f\n", FMOD_VERSION);
        return 1;
    }

    if ((argc < 2) || (strnicmp(argv[1], "http:", 5)))
    {
        printf("-------------------------------------------------------------\n");
        printf("FMOD netstream example.\n");
        printf("Copyright (c) Firelight Technologies Pty, Ltd, 1999-2004.\n");
        printf("-------------------------------------------------------------\n");
        printf("Syntax:  netstream <url>\n");
        printf("Example: netstream http://www.fmod.org/stream.mp3\n\n");
        return 1;
    }

#if defined(WIN32) || defined(_WIN64) || defined(__CYGWIN32__) || defined(__WATCOMC__)
    FSOUND_SetOutput(FSOUND_OUTPUT_DSOUND);
#elif defined(__linux__)
    FSOUND_SetOutput(FSOUND_OUTPUT_OSS);
#endif

    // ==========================================================================================
    // SELECT DRIVER
    // ==========================================================================================
    printf("---------------------------------------------------------\n");    
    switch (FSOUND_GetOutput())
    {
        case FSOUND_OUTPUT_NOSOUND:    printf("NoSound");                    break;
        case FSOUND_OUTPUT_WINMM:      printf("Windows Multimedia Waveout"); break;
        case FSOUND_OUTPUT_DSOUND:     printf("Direct Sound");               break;
        case FSOUND_OUTPUT_A3D:        printf("A3D");                        break;
        case FSOUND_OUTPUT_OSS:        printf("Open Sound System");          break;
        case FSOUND_OUTPUT_ESD:        printf("Enlightenment Sound Daemon"); break;
        case FSOUND_OUTPUT_ALSA:       printf("ALSA");                       break;
    };
    printf(" Driver list\n");    
    printf("---------------------------------------------------------\n");    

    for (i=0; i < FSOUND_GetNumDrivers(); i++) 
    {
        printf("%d - %s\n", i+1, FSOUND_GetDriverName(i));
    }
    printf("---------------------------------------------------------\n");
    printf("Press a corresponding number or ESC to quit\n");

    do
    {
        key = getch();
        if (key == 27) exit(0);

        driver = key - '1';
    } while (driver < 0 || driver >= FSOUND_GetNumDrivers());

    FSOUND_SetDriver(driver);

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

    /*
        Internet streams can work with a much smaller stream buffer than normal streams because they
        use another level of buffering on top of the stream buffer.
    */
    FSOUND_Stream_SetBufferSize(100);

    /*
        Here's where we set the size of the network buffer and some buffering parameters.
        In this case we want a network buffer of 64k, we want it to prebuffer 60% of that when we first
        connect, and we want it to rebuffer 80% of that whenever we encounter a buffer underrun.
    */
    FSOUND_Stream_Net_SetBufferProperties(64000, 60, 80);

    /*
        Open the stream using FSOUND_NONBLOCKING because the connect/buffer process might take a long time
    */
    stream = FSOUND_Stream_Open(argv[1], FSOUND_NORMAL | FSOUND_NONBLOCKING, 0, 0);
    if (!stream)
    {
        printf("Error!\n");
        printf("%s\n", FMOD_ErrorString(FSOUND_GetError()));
        FSOUND_Close();
        return 1;
    }

    printf("\nPress ESC to quit...\n\n");
  
    key = 0;
    do
    {
        if (kbhit())
        {
            key = getch();
        }

        /*
            Play the stream if it's not already playing
        */
        if (channel < 0)
        {
            channel = FSOUND_Stream_PlayEx(FSOUND_FREE, stream, NULL, TRUE);
            FSOUND_SetPaused(channel, FALSE);

            if (channel != -1)
            {
                FSOUND_Stream_Net_SetMetadataCallback(stream, metacallback, 0);
            }
        }

        openstate = FSOUND_Stream_GetOpenState(stream);
        if ((openstate == -1) || (openstate == -3))
        {
            printf("\nERROR: failed to open stream!\n");
            printf("SERVER: %s\n", FSOUND_Stream_Net_GetLastServerStatus());
            break;
        }

        FSOUND_Stream_Net_GetStatus(stream, &status, &read_percent, &bitrate, &flags);

        /*
            Show how much of the net buffer is used and what the status is
        */
        if (metanum)
        {
            printf("%s - %s\n", artist, title);
            metanum = 0;
        }
        s[0] = 0;
        strncat(s, bar, (read_percent >> 1) + (read_percent & 1));
        strncat(s, nobar, (100 - read_percent) >> 1);
        printf("|%s| %d%%  %s\r", s, read_percent, status_str[status]);

        Sleep(16);
    
    } while (key != 27);

    printf("\n");

    FSOUND_Stream_Close(stream);
    FSOUND_Close();

    return 0;
}
