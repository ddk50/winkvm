//===============================================================================================
// 3D.EXE
// Copyright (c), Firelight Technologies Pty, Ltd, 1999-2004.
//
// This test shows EAX, DS3D and Software all being used together and the simple commands needed
// to set up some 3d audio.
// This application also displays the use of FSOUND_GetDriverCaps to get information on the 
// 3D capabilities of the selected driver
//===============================================================================================

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#if defined(WIN32) || defined(__WATCOMC__) || defined(_WIN64)
    #include <conio.h>
    #include <windows.h>
#else
    #include "../../api/inc/wincompat.h"
#endif

#include "../../api/inc/fmod.h"
#include "../../api/inc/fmod_errors.h"    // optional

#define INTERFACE_UPDATETIME 50        // 50ms update for interface

/*
[
    [DESCRIPTION]

    [PARAMETERS]
 
    [RETURN_VALUE]

    [REMARKS]

    [SEE_ALSO]
]
*/
void Close(FSOUND_SAMPLE *samp1, FSOUND_SAMPLE *samp2, FSOUND_SAMPLE *samp3)
{
    // you dont need to free samples if you let fsound's sample manager look after samples, as 
    // it will free them all for you.
    FSOUND_Sample_Free(samp1);    
    FSOUND_Sample_Free(samp2);
    FSOUND_Sample_Free(samp3);

    FSOUND_Close();
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
    FSOUND_SAMPLE  *samp1 = NULL, *samp2 = NULL, *samp3 = NULL;
    char            key, listenerflag = 1;
    int             driver, i = 0, channel1 = -1, channel2 = -1;
    float           listenerpos[3] =  { 0,0,0 }; 
    
    if (FSOUND_GetVersion() < FMOD_VERSION)
    {
        printf("Error : You are using the wrong DLL version!  You should be using FMOD %.02f\n", FMOD_VERSION);
        return 1;
    }

    // ==========================================================================================
    // SELECT OUTPUT METHOD
    // ==========================================================================================
    
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
        default  :  return 1; 
    }
    

    // ==========================================================================================
    // SELECT DRIVER
    // ==========================================================================================

    // The following list are the drivers for the output method selected above.
    printf("---------------------------------------------------------\n");    
    switch (FSOUND_GetOutput())
    {
        case FSOUND_OUTPUT_NOSOUND: printf("NoSound"); break;
#if defined(WIN32) || defined(_WIN64) || defined(__CYGWIN32__)  || defined(__WATCOMC__)
        case FSOUND_OUTPUT_WINMM:   printf("Windows Multimedia Waveout"); break;
        case FSOUND_OUTPUT_DSOUND:  printf("Direct Sound"); break;
        case FSOUND_OUTPUT_ASIO:    printf("ASIO"); break;
#elif defined(__linux__)
        case FSOUND_OUTPUT_OSS:     printf("Open Sound System"); break;
        case FSOUND_OUTPUT_ESD:     printf("Enlightment Sound Daemon"); break;
        case FSOUND_OUTPUT_ALSA:    printf("Alsa"); break;
#endif
         
    };
    printf(" Driver list\n");    
    printf("---------------------------------------------------------\n");    

    for (i=0; i < FSOUND_GetNumDrivers(); i++) 
    {
        printf("%d - %s\n", i+1, FSOUND_GetDriverName(i));    // print driver names
        {
            unsigned int caps = 0;

            FSOUND_GetDriverCaps(i, &caps);
            
            if (caps & FSOUND_CAPS_HARDWARE)
                printf("  * Driver supports hardware 3D sound!\n");
            if (caps & FSOUND_CAPS_EAX2)
                printf("  * Driver supports EAX 2 reverb!\n");
            if (caps & FSOUND_CAPS_EAX3)
                printf("  * Driver supports EAX 3 reverb!\n");
        }
    }
    printf("---------------------------------------------------------\n");    // print driver names
    printf("Press a corresponding number or ESC to quit\n");

    do
    {
        key = getch();
        if (key == 27) 
            return 0;
        driver = key - '1';
    } while (driver < 0 || driver >= FSOUND_GetNumDrivers());

    FSOUND_SetDriver(driver);                    // Select sound card (0 = default)

    {
        unsigned int caps = 0;

        FSOUND_GetDriverCaps(FSOUND_GetDriver(), &caps);
        
        printf("---------------------------------------------------------\n");    
        printf("Driver capabilities\n");
        printf("---------------------------------------------------------\n");    
        if (!caps)
            printf("- This driver will support software mode only.\n  It does not properly support 3D sound hardware.\n");
        if (caps & FSOUND_CAPS_HARDWARE)
            printf("- Driver supports hardware 3D sound!\n");
        if (caps & FSOUND_CAPS_EAX2)
            printf("- Driver supports EAX 2 reverb!\n");
        if (caps & FSOUND_CAPS_EAX3)
            printf("- Driver supports EAX 3 reverb!\n");
        printf("---------------------------------------------------------\n");    
    }

    FSOUND_SetMixer(FSOUND_MIXER_AUTODETECT);

    // ==========================================================================================
    // INITIALIZE
    // ==========================================================================================
    if (!FSOUND_Init(44100, 32, 0))
    {
        printf("Init: %s\n", FMOD_ErrorString(FSOUND_GetError()));
        return 1;
    }

    // ==========================================================================================
    // LOAD SAMPLES
    // ==========================================================================================

    // ==========================================================================================
    // 3D MONO 
    // ==========================================================================================

    samp1 = FSOUND_Sample_Load(FSOUND_FREE, "../../media/drumloop.wav", FSOUND_HW3D, 0, 0);
    if (!samp1)
    {
        printf("samp1: %s\n", FMOD_ErrorString(FSOUND_GetError()));
        Close(samp1, samp2, samp3);
        return 1;
    }

    // increasing mindistnace makes it louder in 3d space
    FSOUND_Sample_SetMinMaxDistance(samp1, 4.0f, 10000.0f);    
    FSOUND_Sample_SetMode(samp1, FSOUND_LOOP_NORMAL);

    // ==========================================================================================
    // 3D MONO 
    // ==========================================================================================
    samp2 = FSOUND_Sample_Load(FSOUND_UNMANAGED, "../../media/jaguar.wav", FSOUND_HW3D, 0, 0);
    if (!samp2)
    {
        printf("samp2: %s\n", FMOD_ErrorString(FSOUND_GetError()));
        Close(samp1, samp2, samp3);
        return 1;
    }
    // increasing mindistance makes it louder in 3d space
    FSOUND_Sample_SetMinMaxDistance(samp2, 4.0f, 10000.0f);
    FSOUND_Sample_SetMode(samp2, FSOUND_LOOP_NORMAL);

    // ==========================================================================================
    // 2D STEREO
    // ==========================================================================================
    samp3 = FSOUND_Sample_Load(FSOUND_UNMANAGED, "../../media/chimes.wav", FSOUND_HW2D, 0, 0);
    if (!samp3)
    {
        printf("samp3: %s\n", FMOD_ErrorString(FSOUND_GetError()));
        Close(samp1, samp2, samp3);
        return 1;
    }

    // ==========================================================================================
    // DISPLAY HELP
    // ==========================================================================================

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
        case FSOUND_MIXER_BLENDMODE:     printf("FSOUND_MIXER_BLENDMODE\n"); break;
        case FSOUND_MIXER_MMXP5:         printf("FSOUND_MIXER_MMXP5\n"); break;
        case FSOUND_MIXER_MMXP6:         printf("FSOUND_MIXER_MMXP6\n"); break;
        case FSOUND_MIXER_QUALITY_FPU:   printf("FSOUND_MIXER_QUALITY_FPU\n"); break;
        case FSOUND_MIXER_QUALITY_MMXP5: printf("FSOUND_MIXER_QUALITY_MMXP5\n"); break;
        case FSOUND_MIXER_QUALITY_MMXP6: printf("FSOUND_MIXER_QUALITY_MMXP6\n"); break;
    };
    printf("FSOUND Driver        : ");
    printf("%s\n", FSOUND_GetDriverName(FSOUND_GetDriver()));
    
    int num2d, num3d;

    FSOUND_GetNumHWChannels(&num2d, &num3d, NULL);
    
    printf("Hardware 2D channels : %d\n", num2d);
    printf("Hardware 3D channels : %d\n", num3d);

    printf("=========================================================================\n");
    printf("Press 1        Pause/Unpause 16bit 3D sound at any time\n");
    printf("      2        Pause/Unpause 8bit 3D sound at any time\n");
    printf("      3        Play 16bit STEREO 2D sound at any time\n");
    printf("      4        Change to EAX Reverb mode CONCERTHALL (DirectSound/SBLive only)\n");
    printf("      5        Change to EAX Reverb mode SEWERPIPE (DirectSound/SBLive only)\n");
    printf("      6        Change to EAX Reverb mode PSYCHOTIC (DirectSound/SBLive only)\n");
    printf("      <        Move listener left (in still mode)\n");
    printf("      >        Move listener right (in still mode)\n");
    printf("      SPACE Stop/Start listener automatic movement\n");
    printf("      ESC    Quit\n");
    printf("=========================================================================\n");

    // ==========================================================================================
    // PLAY 2 LOOPING SOUNDS
    // ==========================================================================================

    
    {
        float pos[3] = { -10.0f, -0.0f, 0.0f };
        float vel[3] = { 0,0,0 };

        channel1 = FSOUND_PlaySoundEx(FSOUND_FREE, samp1, NULL, TRUE);
        FSOUND_3D_SetAttributes(channel1, pos, vel);
        if (!FSOUND_SetPaused(channel1, FALSE))
        {
            printf("%s\n", FMOD_ErrorString(FSOUND_GetError()));
        }
    }
    {
        float pos[3] = { 15.0f, -0.0f, -0.0f };
        float vel[3] = { 0,0,0 };

        channel2 = FSOUND_PlaySoundEx(FSOUND_FREE, samp2, NULL, TRUE);
        FSOUND_3D_SetAttributes(channel2, pos, vel);
        FSOUND_SetVolume(channel2, 128);
        if (!FSOUND_SetPaused(channel2, FALSE))
        {
            printf("%s\n", FMOD_ErrorString(FSOUND_GetError()));
        }
    }

    // ==========================================================================================
    // MAIN LOOP
    // ==========================================================================================

    do
    {
        if (kbhit())
        {
            key = getch();

            if (key == '1') 
            {
                FSOUND_SetPaused(channel1, !FSOUND_GetPaused(channel1));
            }
            if (key == '2') 
            {
                FSOUND_SetPaused(channel2, !FSOUND_GetPaused(channel2));
            }
            if (key == '3') 
            {
                FSOUND_PlaySound(FSOUND_FREE, samp3);
            }
            if (key == '4') 
            {
                FSOUND_REVERB_PROPERTIES props = FSOUND_PRESET_CONCERTHALL;
                FSOUND_Reverb_SetProperties(&props);
            }
            if (key == '5') 
            {
                FSOUND_REVERB_PROPERTIES props = FSOUND_PRESET_SEWERPIPE;
                FSOUND_Reverb_SetProperties(&props);
            }
            if (key == '6')
            {
                FSOUND_REVERB_PROPERTIES props = FSOUND_PRESET_PSYCHOTIC;
                FSOUND_Reverb_SetProperties(&props);
            }

            if (key == ' ')
            {
                listenerflag = !listenerflag;
            }

            if (!listenerflag)
            {
                if (key == '<') 
                {
                    listenerpos[0] -= 1.0f;
                    if (listenerpos[0] < -35)
                    {
                        listenerpos[0] = -35;
                    }
                }
                if (key == '>') 
                {
                    listenerpos[0] += 1.0f;
                    if (listenerpos[0] > 30)
                    {
                        listenerpos[0] = 30;
                    }
                }
            }
        }


        // ==========================================================================================
        // UPDATE THE LISTENER
        // ==========================================================================================
        {
            static float t = 0;
            static float lastpos[3] = { 0,0,0 };
            float vel[3];

            if (listenerflag)
            {
                listenerpos[0] = ((float)sin(t*0.05f) * 33.0f); // left right pingpong
            }

            // ********* NOTE ******* READ NEXT COMMENT!!!!!
            // vel = how far we moved last FRAME (m/f), then time compensate it to SECONDS (m/s).
            vel[0] = (listenerpos[0]-lastpos[0]) * (1000 / INTERFACE_UPDATETIME);
            vel[1] = (listenerpos[1]-lastpos[1]) * (1000 / INTERFACE_UPDATETIME);
            vel[2] = (listenerpos[2]-lastpos[2]) * (1000 / INTERFACE_UPDATETIME);

            // store pos for next time
            lastpos[0] = listenerpos[0];
            lastpos[1] = listenerpos[1];
            lastpos[2] = listenerpos[2];

            FSOUND_3D_Listener_SetAttributes(&listenerpos[0], &vel[0], 0, 0, 1.0f, 0, 1.0f, 0);

            t += (30 * (1.0f / (float)INTERFACE_UPDATETIME));    // t is just a time value .. it increments in 30m/s steps in this example

            // print out a small visual display
            {
                char s[80];

                sprintf(s, "|.......................<1>......................<2>....................|");
                
                s[(int)(listenerpos[0])+35] = 'L';                
                printf("%s\r", s);
            }            
        }

        FSOUND_Update();

        Sleep(INTERFACE_UPDATETIME-1);    // -1 for time taken for printf etc

    } while (key != 27);

    printf("\n");

    // ==========================================================================================
    // CLEANUP AND SHUTDOWN
    // ==========================================================================================

    Close(samp1, samp2, samp3);
   
    return 0;
}
