/*===========================================================================================
 DSP.EXE
 Copyright (c), Firelight Technologies Pty, Ltd, 1999-2004.

 This example demonstrates advanced DSP usage.
 You can now attach sounds to dsp units.  The dsp units to be attached to must have a NULL
 callback.  It is simply a holder for sounds to attach to, and have a specific position in 
 the DSP chain.. see the diagram below for a visual representation of the DSP chain.
 It also demonstrates the use of hardware DirectX 8 FX.
===========================================================================================*/
    

/*
    Priority :    0          100        320-332       400          1000
    Name     : [CLEAR]-->[samp1-WET]-->[REVERB]-->[samp1-DRY]-->[CLIPCOPY]-->[SOUNDCARD]

    Note the above priority values correspond to the values in FMOD.H

    FSOUND_DSP_DEFAULTPRIORITY_CLEARUNIT        0       
    FSOUND_DSP_DEFAULTPRIORITY_SFXUNIT          100     
    FSOUND_DSP_DEFAULTPRIORITY_MUSICUNIT        200     
    FSOUND_DSP_DEFAULTPRIORITY_USER             300     
    FSOUND_DSP_DEFAULTPRIORITY_FFTUNIT          900     
    FSOUND_DSP_DEFAULTPRIORITY_CLIPANDCOPYUNIT  1000    

    Notice how 'SFX' unit is wet (has reverb).  This is because it is the default destination
    For sound effects if NULL is passed to PlaySoundEx or PlaySound is used.
    Also the Reverb DSP has itself positioned AFTER the 'SFX' unit so then we will hear reverb.
    Now if a sound is attached to the 'Dry' DSP unit located at priority 400, then it will not
    be affected by reverb!
*/


/*
    INCLUDES
*/

#include <stdio.h>
#if defined(WIN32) || defined(_WIN64) || defined(__WATCOMC__)
  #include <conio.h>
  #include <windows.h>
#elif defined(__linux__)
  #include "../../api/inc/wincompat.h"
#endif
#include <math.h>
#include <stdlib.h>

#include "../../api/inc/fmod.h"
#include "../../api/inc/fmod_errors.h"    /* optional */

/*
    GLOBALS AND DEFINIITIONS
*/

/*
    Here's our simple reverb again
*/

#define REVERB_NUMTAPS    7
typedef struct
{
    FSOUND_DSPUNIT    *Unit;
    char              *historybuff;         /* storage space for tap history */
    char              *workarea;            /* a place to hold 1 buffer worth of data (for preverb) */
    int                delayms;             /* delay of p/reverb tab in milliseconds */
    int                volume;              /* volume of p/reverb tab */
    int                pan;                 /* pan of p/reverb tab */
    int                historyoffset;       /* running offset into history buffer */
    int                historylen;          /* size of history buffer in SAMPLES */
} REVERBTAP;

/*
    Reverb stuff
*/
REVERBTAP        DSP_ReverbTap[REVERB_NUMTAPS];

/*
    Dry sfx unit
*/
FSOUND_DSPUNIT    *DrySFXUnit = NULL;


/*
[
    [DESCRIPTION]
    Callback to mix in one reverb tap.  It copies the buffer into its own history buffer also.

    [PARAMETERS]
    'originalbuffer'    Pointer to the original mixbuffer, not any buffers passed down 
                        through the dsp chain.  They are in newbuffer.
    'newbuffer'         Pointer to buffer passed from previous DSP unit.
    'length'            Length in SAMPLES of buffer being passed.
    'userdata'          User parameter.  In this case it is a pointer to DSP_LowPassBuffer.
 
    [RETURN_VALUE]
    a pointer to the buffer that was passed in, with a tap mixed into it.

    [REMARKS]
]
*/
void * F_CALLBACKAPI DSP_ReverbCallback(void *originalbuffer, void *newbuffer, int length, void *userdata)
{
	int		     mixertype = FSOUND_GetMixer();
    int          count;
    int          bytesperoutputsample;
	REVERBTAP	*tap = (REVERBTAP *)userdata;
    union sample
    {
        void         *vptr;
        signed int   *dptr;
        signed short *wptr;
        float        *fptr;
    };

    if (mixertype == FSOUND_MIXER_MMXP5 || mixertype == FSOUND_MIXER_MMXP6 || mixertype == FSOUND_MIXER_QUALITY_MMXP5 || mixertype == FSOUND_MIXER_QUALITY_MMXP6)
    {
	    bytesperoutputsample = 4;   // 16bit stereo
    }
    else
    {
	    bytesperoutputsample = 8;   // 32bit stereo
    }

	// reverb history buffer is a ringbuffer.  If the length makes the copy wrap, then split the copy 
	// into end part, and start part.. 
	if (tap->historyoffset + length > tap->historylen)
	{
		int taillen = tap->historylen - tap->historyoffset;
		int startlen = length - taillen;

		// mix a scaled version of history buffer into output
		FSOUND_DSP_MixBuffers(newbuffer, tap->historybuff + (tap->historyoffset << 2), taillen, 44100, tap->volume, tap->pan, FSOUND_STEREO | FSOUND_16BITS);
		FSOUND_DSP_MixBuffers((char *)newbuffer+(taillen * bytesperoutputsample), tap->historybuff, startlen, 44100, tap->volume, tap->pan, FSOUND_STEREO | FSOUND_16BITS);

		// now copy input into reverb/history buffer 
        {
            signed short *dest;
        	union sample src;

            dest = (signed short *)(tap->historybuff + (tap->historyoffset << 2));
            src.vptr = newbuffer;

            for (count=0; count < taillen * 2; count++)
            {
                int val;
                
                if (mixertype == FSOUND_MIXER_QUALITY_FPU)
                {
                    val = (int)src.fptr[count];
                }
                else if (mixertype == FSOUND_MIXER_MMXP5 || mixertype == FSOUND_MIXER_MMXP6 || mixertype == FSOUND_MIXER_QUALITY_MMXP5 || mixertype == FSOUND_MIXER_QUALITY_MMXP6)
                {
                    val = (int)src.wptr[count];
                }
                else
                {
                    val = (int)src.dptr[count];
                }               

                val = (val > 32767 ? 32767 : val < -32768 ? -32768 : val);
                dest[count] = val;
            }	
        }
        {
            signed short *dest;
        	union sample src;

            dest = (signed short *)tap->historybuff;    // always 16bit
            src.vptr = (char *)newbuffer + (taillen * bytesperoutputsample);

            for (count=0; count < startlen * 2; count++)
            {
                int val;
                
                if (mixertype == FSOUND_MIXER_QUALITY_FPU)
                {
                    val = (int)src.fptr[count];
                }
                else if (mixertype == FSOUND_MIXER_MMXP5 || mixertype == FSOUND_MIXER_MMXP6 || mixertype == FSOUND_MIXER_QUALITY_MMXP5 || mixertype == FSOUND_MIXER_QUALITY_MMXP6)
                {
                    val = (int)src.wptr[count];
                }
                else
                {
                    val = (int)src.dptr[count];
                }               

                val = (val > 32767 ? 32767 : val < -32768 ? -32768 : val);
                dest[count] = val;
            }	
        }

	}
	// no wrapping reverb buffer, just write dest
	else
	{
		// mix a scaled version of history buffer into output
		FSOUND_DSP_MixBuffers(newbuffer, tap->historybuff + (tap->historyoffset << 2), length, 44100, tap->volume, tap->pan, FSOUND_STEREO | FSOUND_16BITS);

		// now copy input into reverb/history buffer 
        {
            signed short *dest;
        	union sample src = { newbuffer };

            dest = (signed short *)(tap->historybuff + (tap->historyoffset << 2));

            for (count=0; count < length * 2; count++)
            {
                int val;

                if (mixertype == FSOUND_MIXER_QUALITY_FPU)
                {
                    val = (int)src.fptr[count];
                }
                else if (mixertype == FSOUND_MIXER_MMXP5 || mixertype == FSOUND_MIXER_MMXP6 || mixertype == FSOUND_MIXER_QUALITY_MMXP5 || mixertype == FSOUND_MIXER_QUALITY_MMXP6)
                {
                    val = (int)src.wptr[count];
                }
                else
                {
                    val = (int)src.dptr[count];
                }               
                val = (val > 32767 ? 32767 : val < -32768 ? -32768 : val);
                dest[count] = val;
            }	
        }
	}


	tap->historyoffset += length;
	if (tap->historyoffset >= tap->historylen) 
    {
		tap->historyoffset -= tap->historylen;
    }

	// reverb history has been mixed into new buffer, so return it.
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
void SetupReverb()
{
    /*
        REVERB SETUP
    */
    /* something to fiddle with. */
    int delay[REVERB_NUMTAPS]     = { 131, 149, 173, 211, 281, 401, 457};    /* prime numbers make it sound cool! */
    int volume[REVERB_NUMTAPS]    = { 120, 100,  95,  90,  80,  60,  50};
    int pan[REVERB_NUMTAPS]       = { 100, 128, 128, 152, 128, 100, 152};
    int count;

    for (count=0; count< REVERB_NUMTAPS; count++)
    {
        DSP_ReverbTap[count].delayms        = delay[count];    
        DSP_ReverbTap[count].volume         = volume[count];
        DSP_ReverbTap[count].pan            = pan[count];
        DSP_ReverbTap[count].historyoffset  = 0;
        DSP_ReverbTap[count].historylen     = (DSP_ReverbTap[count].delayms * 44100 / 1000);
        if (DSP_ReverbTap[count].historylen < FSOUND_DSP_GetBufferLength())
        {
            DSP_ReverbTap[count].historylen = FSOUND_DSP_GetBufferLength();    /* just in case our calc is not the same. */
        }

        DSP_ReverbTap[count].historybuff    = (char *)calloc(DSP_ReverbTap[count].historylen, 4);    /* * 4 is for 16bit stereo (mmx only) */
        DSP_ReverbTap[count].workarea       = NULL;
        DSP_ReverbTap[count].Unit           = FSOUND_DSP_Create(&DSP_ReverbCallback, FSOUND_DSP_DEFAULTPRIORITY_USER+20+(count*2), &DSP_ReverbTap[count]);

        FSOUND_DSP_SetActive(DSP_ReverbTap[count].Unit, TRUE);
    }
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
void CloseReverb()
{
    int count;

    for (count=0; count<REVERB_NUMTAPS; count++)
    {
        FSOUND_DSP_Free(DSP_ReverbTap[count].Unit);    
        DSP_ReverbTap[count].Unit = NULL;

        free(DSP_ReverbTap[count].historybuff);        
        DSP_ReverbTap[count].historybuff = NULL;

        free(DSP_ReverbTap[count].workarea);        
        DSP_ReverbTap[count].workarea = NULL;
    }
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
    FSOUND_SAMPLE *samp1 = 0, *samp2 = 0;
    int key;
    int eqid1,eqid2;
   
    if (FSOUND_GetVersion() < FMOD_VERSION)
    {
        printf("Error : You are using the wrong DLL version!  You should be using FMOD %.02f\n", FMOD_VERSION);
        return 1;
    }

     /*
        INITIALIZE
    */
    FSOUND_SetBufferSize(100);  /* This is nescessary to get FX to work on output buffer */
    if (!FSOUND_Init(44100, 32, FSOUND_INIT_ENABLESYSTEMCHANNELFX))
    {
        printf("Error!\n");
        printf("%s\n", FMOD_ErrorString(FSOUND_GetError()));
        return 1;
    }

    /*
        LOAD SAMPLES
    */

    /* PCM,44,100 Hz, 8 Bit, Mono */
    samp1 = FSOUND_Sample_Load(FSOUND_FREE, "../../media/drumloop.wav", FSOUND_2D, 0, 0);
    if (!samp1)
    {
        printf("Error!\n");
        printf("%s\n", FMOD_ErrorString(FSOUND_GetError()));
        return 1;
    }
    FSOUND_Sample_SetMode(samp1, FSOUND_LOOP_OFF);

    /* PCM,44,100 Hz, 16 Bit, Stereo */
    samp2 = FSOUND_Sample_Load(FSOUND_FREE, "../../media/jules.mp3", FSOUND_HW2D | FSOUND_ENABLEFX, 0, 0);
    if (!samp2)
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
        case FSOUND_OUTPUT_NOSOUND:  printf("FSOUND_OUTPUT_NOSOUND\n"); break;
        case FSOUND_OUTPUT_WINMM:    printf("FSOUND_OUTPUT_WINMM\n"); break;
        case FSOUND_OUTPUT_DSOUND:   printf("FSOUND_OUTPUT_DSOUND\n"); break;
        case FSOUND_OUTPUT_ASIO:     printf("FSOUND_OUTPUT_ASIO\n"); break;
        case FSOUND_OUTPUT_OSS:      printf("FSOUND_OUTPUT_OSS\n"); break;
        case FSOUND_OUTPUT_ALSA:     printf("FSOUND_OUTPUT_ALSA\n"); break;
        case FSOUND_OUTPUT_ESD:      printf("FSOUND_OUTPUT_ESD\n"); break;
    };

    printf("FSOUND Mixer         : ");
    switch (FSOUND_GetMixer())
    {
        case FSOUND_MIXER_QUALITY_FPU:    printf("FSOUND_MIXER_QUALITY_FPU\n"); break;
        case FSOUND_MIXER_QUALITY_MMXP5:  printf("FSOUND_MIXER_QUALITY_MMXP5\n"); break;
        case FSOUND_MIXER_QUALITY_MMXP6:  printf("FSOUND_MIXER_QUALITY_MMXP6\n"); break;
    };
    printf("FSOUND Driver        : %s\n", FSOUND_GetDriverName(FSOUND_GetDriver()));

    printf("=========================================================================\n");
    printf("Press 1       Play SOFTWARE sound affected by following reverb dsp unit (wet)\n");
    printf("      2       Play SOFTWARE sound unaffected by following reverb dsp unit (dry)\n");
    if (FSOUND_GetOutput() == FSOUND_OUTPUT_DSOUND)
    {
        printf("      3       Play HARDWARE FX enabled sound using Direct X 8 (echo+flange)\n");
        printf("      4       Set EQ on global software output to be affect by DX8 FX\n");
        printf("              Press 1 or 2 to hear the effect (3 is unaffected)\n");
        printf("      5       Turn off EQ on global software output\n");
    }
    printf("      ESC     Quit\n");
    printf("=========================================================================\n");

    /*
        SET UP DSPS!
    */

    SetupReverb();

    /*
        Note if we are using a dsp unit for playing sounds, callback and parameter are ignored!
    */
    DrySFXUnit = FSOUND_DSP_Create(NULL, FSOUND_DSP_DEFAULTPRIORITY_USER+100, 0);
    FSOUND_DSP_SetActive(DrySFXUnit, TRUE);

    /*
        You must pause the software output before getting the FX handle on it.
    */
    if (FSOUND_GetOutput() == FSOUND_OUTPUT_DSOUND)
    {
        FSOUND_SetPaused(FSOUND_SYSTEMCHANNEL, TRUE);

        eqid1 = FSOUND_FX_Enable(FSOUND_SYSTEMCHANNEL, FSOUND_FX_PARAMEQ);
        eqid2 = FSOUND_FX_Enable(FSOUND_SYSTEMCHANNEL, FSOUND_FX_PARAMEQ);

        FSOUND_SetPaused(FSOUND_SYSTEMCHANNEL, FALSE);
    }

    /*
        START PLAYING!
    */

    do
    {
        key = 0;
        printf("channels playing = %d cpu usage = %.02f%%\r", FSOUND_GetChannelsPlaying(), FSOUND_GetCPUUsage());

        if (kbhit())
        {
            key = getch();


            if (key == '1') 
            {
                int channel = FSOUND_PlaySound(FSOUND_FREE, samp1);
            }
            if (key == '2') 
            {
                FSOUND_PlaySoundEx(FSOUND_FREE, samp1, DrySFXUnit, FALSE);
            }
            if (FSOUND_GetOutput() == FSOUND_OUTPUT_DSOUND)
            {       
                if (key == '3') 
                {
                    static int  fxchannel = FSOUND_FREE;
                    static int  echoid = -1, echoid2 = -1,flangeid = -1, firsttime;

                    if (fxchannel == FSOUND_FREE)
                    {
                        firsttime = TRUE;
                    }
                    else
                    {
                        firsttime = FALSE;
                    }

                    fxchannel = FSOUND_PlaySoundEx(fxchannel, samp2, DrySFXUnit, TRUE);     

                    /* 
                       NOTE! Even though it is for hardware FX, set it to a DrySFXUnit just 
                       in case a non hardware output mode has been selected (such as 
                       WINMM/Linux etc) and it actually drops back to 100% software 
                     */

                    FSOUND_SetVolume(fxchannel, 120); /* turn it down a bit! */
                
                    if (firsttime)
                    {
                        echoid   = FSOUND_FX_Enable(fxchannel, FSOUND_FX_ECHO);
                        echoid2  = FSOUND_FX_Enable(fxchannel, FSOUND_FX_ECHO);
                        flangeid = FSOUND_FX_Enable(fxchannel, FSOUND_FX_FLANGER);
                    }

                    FSOUND_SetPaused(fxchannel, FALSE);

                    FSOUND_FX_SetEcho(echoid,  80.0f, 70.0f, 100.0f, 100.0f, TRUE);
                    FSOUND_FX_SetEcho(echoid2,  100, 70.0f, 10, 10, FALSE);
                }
                if (key == '4')
                {
                    FSOUND_FX_SetParamEQ(eqid1, 8000, 36, -15);
                    FSOUND_FX_SetParamEQ(eqid2, 16000, 36, -15);
                }
                if (key == '5')
                {
                    FSOUND_FX_SetParamEQ(eqid1, 8000, 15, 0);
                    FSOUND_FX_SetParamEQ(eqid2, 8000, 15, 0);
                }
            }
        }
        Sleep(10);

    } while (key != 27);

    printf("\n");

    /*
        CLEANUP AND SHUTDOWN
    */

    FSOUND_DSP_Free(DrySFXUnit);    

    CloseReverb();

    FSOUND_Sample_Free(samp1);
    FSOUND_Sample_Free(samp2);

    FSOUND_Close();
   
    return 0;
}

