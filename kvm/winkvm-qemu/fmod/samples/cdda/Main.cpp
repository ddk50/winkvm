//===============================================================================================
// CDDA.EXE
// Copyright (c), Firelight Technologies Pty, Ltd, 1999-2004.
//
// Use FMOD stream API to do digital CD playback. Also demonstrates how to use FMOD to 
// generate a CDDB query.
//===============================================================================================

#include <string.h>
#include <stdio.h>

#if defined(WIN32) || defined(_WIN64) || defined(__WATCOMC__)
    #include <windows.h>
    #include <conio.h>
#else
    #include "../../api/inc/wincompat.h"
    #include <string.h>
#endif

#include "../../api/inc/fmod.h"
#include "../../api/inc/fmod_errors.h"    // optional


int cddb_sum(int n)
{
    int	ret = 0;

    while (n > 0)
    {
        ret += (n % 10);
        n /= 10;
    }

    return ret;
}

unsigned long cddb_discid(FSOUND_TOC_TAG *toc)
{
    int	i, t, n = 0;

    for (i = 0; i < toc->numtracks; i++)
    {
        n += cddb_sum((toc->min[i] * 60) + toc->sec[i]);
    }

    t = ((toc->min[toc->numtracks] * 60) + toc->sec[toc->numtracks]) - ((toc->min[0] * 60) + toc->sec[0]);

    return ((n % 0xff) << 24 | t << 8 | toc->numtracks);
}

void dump_cddb_query(FSOUND_TOC_TAG *toc)
{
    int i;

    printf("cddb query %08x %d", cddb_discid(toc), toc->numtracks);

    for (i = 0; i < toc->numtracks; i++)
    {
        printf(" %d", (toc->min[i] * (60 * 75)) + (toc->sec[i] * 75) + toc->frame[i]);
    }

    printf(" %d\n", (toc->min[toc->numtracks] * 60) + toc->sec[toc->numtracks]);
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
    unsigned char key;
    FSOUND_STREAM *stream;
    int channel = -1;
    int track = 0;
    char *cd_error;
    char drive_letter[6] = "d:*?j";

    if (argc < 2)
    {
        printf("Usage:   cdda <driveletter>\n");
        printf("Example: cdda d\n");
        return 1;
    }

    drive_letter[0] = argv[1][0];
    if (!((drive_letter[0] >= 'a' && drive_letter[0] <= 'z') || (drive_letter[0] >= 'A' && drive_letter[0] <= 'Z')))
    {
        printf("ERROR: Invalid drive letter\n");
        return 1;
    }

    if (FSOUND_GetVersion() < FMOD_VERSION)
    {
        printf("ERROR: You are using the wrong DLL version!  You should be using FMOD %.02f\n", FMOD_VERSION);
        return 1;
    }

    if (!FSOUND_Init(44100, 32, 0))
    {
        printf("ERROR: %s\n", FMOD_ErrorString(FSOUND_GetError()));
        FSOUND_Close();
        return 1;
    }

    FSOUND_Stream_SetBufferSize(2000);

    stream = FSOUND_Stream_Open(drive_letter, FSOUND_NORMAL | FSOUND_NONBLOCKING, 0, 0);
    if (!stream)
    {
        printf("ERROR: %s\n", FMOD_ErrorString(FSOUND_GetError()));
        FSOUND_Close();
        return 1;
    }

    FSOUND_Stream_SetSubStream(stream, 0);

    printf("=========================================================================\n");
    printf("Press f        Skip forward 2 seconds\n");
    printf("      b        Skip back 2 seconds\n");
    printf("      n        Next track\n");
    printf("      SPACE    Pause/Unpause\n");
    printf("      ESC      Quit\n");
    printf("=========================================================================\n");

    key = 0;
    do
    {
        static int last_openstate = -1;

        if (stream && (channel < 0))
        {
            int this_openstate = FSOUND_Stream_GetOpenState(stream);

            if (this_openstate == -3)
            {
                if (FSOUND_Stream_FindTagField(stream, 0, "CD_ERROR", (void **)&cd_error, 0))
                {
                    printf("%s\n", cd_error);
                }
                else
                {
                    printf("ERROR: Couldn't open CDDA stream\n");
                }
                FSOUND_Stream_Close(stream);
                FSOUND_Close();
                return 1;
            }

            if ((last_openstate != 0) && (this_openstate == 0))
            {
                static int firsttime = TRUE;

                if (firsttime)
                {
                    char *cd_device_info;
                    FSOUND_TOC_TAG *toc;

                    if (FSOUND_Stream_FindTagField(stream, 0, "CD_TOC", (void **)&toc, 0))
                    {
                        dump_cddb_query(toc);
                    }

                    if (!FSOUND_Stream_GetTagField(stream, 0, 0, 0, (void **)&cd_device_info, 0))
                    {
                        printf("ERROR: Couldn't get CD_DEVICE_INFO tag\n");
                        FSOUND_Stream_Close(stream);
                        FSOUND_Close();
                        return 1;
                    }

                    printf(cd_device_info);
                    printf("\n=========================================================================\n");
                    firsttime = FALSE;

                    if (FSOUND_Stream_FindTagField(stream, 0, "CD_ERROR", (void **)&cd_error, 0))
                    {
                        printf("%s\n", cd_error);
                        FSOUND_Stream_Close(stream);
                        FSOUND_Close();
                        return 1;
                    }
                }

                channel = FSOUND_Stream_PlayEx(FSOUND_FREE, stream, 0, TRUE);
                FSOUND_SetPaused(channel, FALSE);
            }

            last_openstate = this_openstate;
        }

        if (kbhit())
        {
            key = getch();

            if (channel != -1)
            {
                if (key == ' ')
                {
                    FSOUND_SetPaused(channel, !FSOUND_GetPaused(channel));
                }

                if (key == 'f')
                {
                    FSOUND_Stream_SetTime(stream, FSOUND_Stream_GetTime(stream) + 2000);
                }

                if (key == 'b')
                {
                    FSOUND_Stream_SetTime(stream, FSOUND_Stream_GetTime(stream) - 2000);
                }

                if (key == 'n')
                {
                    track++;
                    if (track >= FSOUND_Stream_GetNumSubStreams(stream))
                    {
                        track = 0;
                    }
                    FSOUND_Stream_SetSubStream(stream, track);
                    last_openstate = -2;
                    channel = -1;
                }
            }
        }

        if (FSOUND_Stream_GetOpenState(stream) == 0)
        {
            printf("Track %d/%d  %02d:%02d/%02d:%02d  cpu %5.02f%%   \r", track + 1, 
                                                                          FSOUND_Stream_GetNumSubStreams(stream), 
                                                                          FSOUND_Stream_GetTime(stream) / 1000 / 60, 
                                                                          FSOUND_Stream_GetTime(stream) / 1000 % 60, 
                                                                          FSOUND_Stream_GetLengthMs(stream) / 1000 / 60, 
                                                                          FSOUND_Stream_GetLengthMs(stream) / 1000 % 60, 
                                                                          FSOUND_GetCPUUsage());
        }

        FSOUND_Update();
        Sleep(10);
    
    } while (key != 27);

    printf("\n");

    FSOUND_Stream_Close(stream);
    FSOUND_Close();

    return 0;
}
