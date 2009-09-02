//===============================================================================================
// CDDARIP.EXE
// Copyright (c), Firelight Technologies Pty, Ltd, 1999-2004.
//
// Use CDDA streaming to rip a CD track to a wav file
//===============================================================================================

#include <string.h>
#include <stdio.h>

#if defined(WIN32) || defined(_WIN64) || defined(__WATCOMC__)
    #include <windows.h>
    #include <conio.h>
    #define __PACKED /*dummy*/
#else
    #include "../../api/inc/wincompat.h"
    #include <string.h>
    #define __PACKED __attribute__((packed)) /* gcc packed */
#endif

#include "../../api/inc/fmod.h"
#include "../../api/inc/fmod_errors.h"    // optional


#if defined(WIN32) || defined(_WIN64) || defined(__WATCOMC__) || defined(_WIN32) || defined(__WIN32__)
#pragma pack(1)
#endif

/*
    WAV Structures
*/
typedef struct
{
	signed char id[4];
	int 		size;
} RiffChunk;

struct
{
    RiffChunk       chunk           __PACKED;
    unsigned short	wFormatTag      __PACKED;    /* format type  */
    unsigned short	nChannels       __PACKED;    /* number of channels (i.e. mono, stereo...)  */
    unsigned int	nSamplesPerSec  __PACKED;    /* sample rate  */
    unsigned int	nAvgBytesPerSec __PACKED;    /* for buffer estimation  */
    unsigned short	nBlockAlign     __PACKED;    /* block size of data  */
    unsigned short	wBitsPerSample  __PACKED;    /* number of bits per sample of mono data */
} FmtChunk  = { {{'f','m','t',' '}, sizeof(FmtChunk) - sizeof(RiffChunk) }, 1, 2, 44100, 44100 * 2 * 16 / 8, 1 * 2 * 16 / 8, 16 } __PACKED;

struct
{
    RiffChunk   chunk;
} DataChunk = { {{'d','a','t','a'}, 0 } };

struct
{
    RiffChunk   chunk;
	signed char rifftype[4];
} WavHeader = { {{'R','I','F','F'}, 0 }, {'W','A','V','E'} };

#if defined(WIN32) || defined(_WIN64) || defined(__WATCOMC__) || defined(_WIN32) || defined(__WIN32__)
#pragma pack()
#endif

        
const char bar[56]   = "==================================================";
const char nobar[56] = "                                                  ";

FILE *fp;
signed char stream_ended = FALSE;
unsigned int byteswritten = 0;


signed char F_CALLBACKAPI endcallback(FSOUND_STREAM *stream, void *buff, int len, void *param)
{
    stream_ended = TRUE;
    return TRUE;
}


void * F_CALLBACKAPI DSP_RawWriteCallback(void *originalbuffer, void *newbuffer, int length, void *param)
{
    if (fp && !stream_ended)
    {
        fwrite(newbuffer, 1, length << 2, fp);
        byteswritten += (length << 2);
    }

    return newbuffer;
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
    char s[256];
    unsigned char key;
    char drive_letter[5] = "d:*j";
    int track_num, read_percent;
    unsigned int start_time, elapsed_time;
    FSOUND_STREAM *stream;
    FSOUND_DSPUNIT *rawwrite_dsp;

    start_time = timeGetTime();

    if (argc < 3)
    {
        printf("Usage:   cddarip <driveletter> <tracknumber starting from 1>\n");
        printf("Example: cddarip d 2\n");
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
        printf("Error : You are using the wrong DLL version!  You should be using FMOD %.02f\n", FMOD_VERSION);
        return 1;
    }

    FSOUND_SetOutput(FSOUND_OUTPUT_NOSOUND_NONREALTIME);

    if (!FSOUND_Init(44100, 32, 0))
    {
        printf("Error!\n");
        printf("%s\n", FMOD_ErrorString(FSOUND_GetError()));
        FSOUND_Close();
        return 1;
    }

    fp = fopen("dump.wav", "wb");
    if (!fp)
    {
        printf("ERROR: Couldn't open dump.wav for writing\n");
        FSOUND_Close();
        return 1;
    }

    /*
        Before we've even written the headers for the wav out, seek to the offset the raw data will start from.
    */
    fseek(fp, sizeof(WavHeader) + sizeof(FmtChunk) + sizeof(DataChunk), SEEK_SET);

    /*
        Create a DSP callback which will capture the mixed data and write it to disk
    */
    rawwrite_dsp = FSOUND_DSP_Create(&DSP_RawWriteCallback, FSOUND_DSP_DEFAULTPRIORITY_USER, 0);
    FSOUND_DSP_SetActive(rawwrite_dsp, TRUE);

    FSOUND_Stream_SetBufferSize(2000);

    stream = FSOUND_Stream_Open(drive_letter, FSOUND_NORMAL, 0, 0);
    if (!stream)
    {
        printf("ERROR: Couldn't create CDDA stream\n");
        FSOUND_DSP_SetActive(rawwrite_dsp, FALSE);
        FSOUND_DSP_Free(rawwrite_dsp);
        FSOUND_Close();
        return 1;
    }

    track_num = atoi(argv[2]);
    if ((track_num < 1) || ((track_num - 1) >= FSOUND_Stream_GetNumSubStreams(stream)))
    {
        printf("ERROR: Invalid track number\n");
        FSOUND_Stream_Close(stream);
        FSOUND_DSP_SetActive(rawwrite_dsp, FALSE);
        FSOUND_DSP_Free(rawwrite_dsp);
        FSOUND_Close();
        return 1;
    }

    FSOUND_Stream_SetEndCallback(stream, endcallback, 0);
    FSOUND_Stream_SetSubStream(stream, track_num - 1);
    FSOUND_Stream_Play(FSOUND_FREE, stream);

    printf("Ripping %s track %d  (%02d:%02d)\n", drive_letter, track_num, FSOUND_Stream_GetLengthMs(stream) / 1000 / 60, FSOUND_Stream_GetLengthMs(stream) / 1000 % 60);
    
    key = 0;
    do
    {
        if (kbhit())
        {
            key = getch();
        }

        read_percent = (int)(((float)FSOUND_Stream_GetTime(stream) / (float)FSOUND_Stream_GetLengthMs(stream)) * 100.0f);
        s[0] = 0;
        strncat(s, bar, (read_percent >> 1) + (read_percent & 1));
        strncat(s, nobar, (100 - read_percent) >> 1);
        printf("|%s| %d%%   \r", s, read_percent);

        FSOUND_Update();
    
    } while ((key != 27) && !stream_ended);

    FSOUND_Stream_Close(stream);
    FSOUND_DSP_SetActive(rawwrite_dsp, FALSE);
    FSOUND_DSP_Free(rawwrite_dsp);

    /*
        Now finalize the wav file by seeking to the start and putting in the headers.
    */
    WavHeader.chunk.size = sizeof(FmtChunk) + sizeof(RiffChunk) + byteswritten;
    DataChunk.chunk.size = byteswritten;

    fseek(fp, 0, SEEK_SET);
    fwrite(&WavHeader, sizeof(WavHeader), 1, fp);
    fwrite(&FmtChunk, sizeof(FmtChunk), 1, fp);
    fwrite(&DataChunk, sizeof(DataChunk), 1, fp);
    fclose(fp);

    FSOUND_Close();

    elapsed_time = timeGetTime() - start_time;
    printf("\nElapsed time: %02d:%02d\n", elapsed_time / 1000 / 60, elapsed_time / 1000 % 60);

    return 0;
}
