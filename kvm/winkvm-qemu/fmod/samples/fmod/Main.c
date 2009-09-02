/*
    FMOD.EXE
    Copyright (c), Firelight Technologies Pty, Ltd, 1999-2004.

    This example really demonstrates the FMOD music system at work, and is a standalone 
    mod/wav/mp3 player!
    It displays a lot of information and uses the DSP engine as well to provide DSP effects under
    MMX only.
*/

#include <windows.h>
#include <windowsx.h>
#include <commctrl.h>
#include <stdio.h>
#include <time.h>
#include <sys/stat.h>

#include "../../api/inc/fmod.h"
#include "../../api/inc/fmod_errors.h"	/* optional */

#include "resource.h"
#include "sdriver.h"
#include "lowpass.h"
#include "reverb.h"


/*
    DEFINITIONS
*/
#define NAME 			    "FSOUND TESTBED"
#define TITLE 			    "FMOD"
#define NUMCHANNELS		    128
#define MAXSONGS		    512
#define FSOUND_BUFFERSIZE   200         /* millisecond value for FMOD buffersize. */
#define MRU_MAX             16
#define STREAM_PLAYING      255

const float WINDOW_WIDTH           = 675.0f;
const float WINDOW_HEIGHT          = 324.0f;
const int   TEXT_CHANNELSPLAYING_X = 636;
const int   TEXT_CHANNELSPLAYING_Y = 237;
const int   TEXT_CPUUSAGE_X        = 622;
const int   TEXT_CPUUSAGE_Y        = 273;

enum
{
    GRAPHICWINDOW_MODINFO = 0,
    GRAPHICWINDOW_EQUALISER,
    GRAPHICWINDOW_WAVE,
    GRAPHICWINDOW_MAX
};

enum
{
    SONGTYPE_NONE = 0,
    SONGTYPE_MOD,
    SONGTYPE_STREAM,
    SONGTYPE_NETSTREAM,
    SONGTYPE_CD,
};

typedef struct
{
	FMUSIC_MODULE  *mod;
	FSOUND_STREAM  *stream;
	int             channel;
    char           *url;
    int             last_status;
    int             last_netstatus;
    char           *server_status;
    char           *title;
    char           *artist;
    char           *protocol;
    char           *format;
    char           *streamname;
    int             metadata;
    char           *listname;
    int             cdtrack;
    unsigned int    cdtrack_length;
} SONGTYPE;

typedef struct
{
    int    count;
    void **name;
    void **displayname;
} Playlist;

/*
    GLOBALS
*/

HWND            mainhwnd;
HWND			streaminfo_hwnd;
HWND			netstreaminfo_hwnd;
HWND			modinfo_hwnd;
HWND			cdinfo_hwnd;
HWND            songlist_hwnd;

#ifdef _WIN64
UINT_PTR        timerid=0;
#else
UINT            timerid=0;
#endif

SONGTYPE		song[MAXSONGS + 1];

int             DraggingCDSlider = FALSE;
int				DSP_Ready    = FALSE;
int				outputfreq   = 44100;				/* default output freq */
int				playlistsong = 0;
char            cddevice     = 0;                   /* 0 is the default device, could be 'D' or 'E' etc */
float			scalex       = 1.0f, scaley = 1.0f;

/*
    Lowpass stuff
*/
FSOUND_DSPUNIT *LowPassUnit;
signed char    *LowPassBuffer;
float			LowPassCutoffFrequency = 5000.0f;
float			LowPassResonance = 1.0f;

/*
    Echo stuff
*/
#define MAXECHOLEN (500 * outputfreq / 1000)

FSOUND_DSPUNIT *EchoUnit = NULL;
signed char	   *EchoBuffer = NULL;
int				EchoOffset=0, EchoLen=0;

/*
    Graphical window stuff for Spectrum and oscilliscope.
*/

#define GRAPHICWINDOW_WIDTH     256
#define GRAPHICWINDOW_HEIGHT    116

int             GraphicWindowCurrent = GRAPHICWINDOW_MODINFO;
BITMAPINFO      GraphicWindowBitmap;
RGBQUAD         GraphicWindowBitmapData[GRAPHICWINDOW_WIDTH * GRAPHICWINDOW_HEIGHT];
int             graphic_window_x;
int             graphic_window_y;


/*
    Oscilliscope stuff
*/

FSOUND_DSPUNIT      *OscUnit = NULL;
static signed short *OscBuffer = NULL;
static int           OscBlock = 0;


/*
    SETTINGS 
*/

int  setting_xpos              = 0;
int  setting_ypos              = 0;
int  setting_output            = 0;
int  setting_driver            = 0;
int  setting_mixer             = 0;
int  setting_outputrate        = 44100;
int  setting_buffersize        = 64000;
int  setting_prebuffer_percent = 95;
int  setting_rebuffer_percent  = 95;
char setting_http_proxy[2048];
int  setting_cdda              = 1;
int  setting_jitter            = 1;
int  setting_forceaspi         = 0;
char setting_cdletter[4]       = "C:";

char           url_to_load[4096];
HINSTANCE      g_hinst;
char          *mru[MRU_MAX];
signed char    play_button_play  = TRUE;

FSOUND_STREAM *cdda_stream       = 0;
int            cdda_channel      = -1;
int            cdda_track        = 0;
int            cdda_stream_state = -2;

/*
    PROTOTYPES 
*/

void          CloseDown();
BOOL          PlaySong(int index);
BOOL          AddToMRU(char *url);
BOOL          UpdateModInfo(int songid, BOOL forceupdate);
BOOL          UpdateStreamInfo(int songid, BOOL forceupdate);
BOOL          UpdateNetStreamInfo(int songid, BOOL forceupdate, BOOL forcequiet);
BOOL          UpdateCDInfo(int songid, BOOL forceupdate);
void          SelectInfoWindow();
char         *GetCommentValue(FSOUND_STREAM *stream, char *tag);
signed char   FreePlaylist(Playlist *playlist);
void          DeleteSong(int songid);
void          DeleteAllCDTracks();
signed char   StopCDTrack();

WNDPROC oldprogressproc;
WNDPROC oldcdtimeproc;

#ifdef _WIN64
INT_PTR CALLBACK FMOD_LoadURLDlgProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam);
#else
BOOL CALLBACK FMOD_LoadURLDlgProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam);
#endif

/*
[
	[DESCRIPTION]

	[PARAMETERS]
 
	[RETURN_VALUE]

	[REMARKS]

	[SEE_ALSO]
]
*/
signed char F_CALLBACKAPI MetadataCallback(char *name, char *value, void *userdata)
{
    char *tmp;
    int index = (int)userdata;

    if (!strcmp("ARTIST", name))
    {
        if (song[index].artist)
        {
            free(song[index].artist);
        }
        tmp = strdup(value);
        song[index].artist = tmp;
        song[index].metadata++;
    }
    else if (!strcmp("TITLE", name))
    {
        if (song[index].title)
        {
            free(song[index].title);
        }
        tmp = strdup(value);
        song[index].title = tmp;
        song[index].metadata++;
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
char *stristr(char *string2, char *string1)
{
    char *s1 = strdup(string1);
    char *s2 = strdup(string2);
    char *ret = 0;
    int i, j;
    int len1 = (int)strlen(string1);
    int len2 = (int)strlen(string2);

    for (i=0;s1[i];i++) s1[i] = tolower(s1[i]);
    for (i=0;s2[i];i++) s2[i] = tolower(s2[i]);

    for (j=0;j < (len2 - len1);j++)
    {
        char *a = s1;
        char *b = &s2[j];

        for (i=0;(i < len1) && *a && *b;a++, b++, i++)
        {
            if (*a != *b)
            {
                break;
            }
        }

        if (i == len1)
        {
            ret = &string2[j];
            break;
        }
    }

    free(s1);
    free(s2);
    return ret;
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
void SetFirstCDLetter()
{
    int count;
    char str[256];

    for (count=2;count < 26;count++)
    {
        sprintf(str, "%c:\\", (char)('A' + count));
        if (GetDriveType(str) == DRIVE_CDROM)
        {
            strncpy(setting_cdletter, str, 2);
            cddevice = str[0];
            break;
        }
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
void LoadSettings()
{
	HKEY key;
	DWORD result,size=4;
    int i;

	result = RegOpenKeyEx(HKEY_LOCAL_MACHINE, "Software\\FMOD\\Settings", 0, KEY_QUERY_VALUE , &key);

	setting_output      = FSOUND_OUTPUT_DSOUND;
	setting_driver      = 0;
	setting_mixer       = FSOUND_MIXER_QUALITY_AUTODETECT;
	setting_outputrate  = 44100;

    SetFirstCDLetter();

	if (result != ERROR_SUCCESS) 
    {
		return;
    }

	RegQueryValueEx(key, "xpos", 0, NULL, (LPBYTE)&setting_xpos, &size);
	RegQueryValueEx(key, "ypos", 0, NULL, (LPBYTE)&setting_ypos, &size);

	RegQueryValueEx(key, "output", 0, NULL, (LPBYTE)&setting_output, &size);
	RegQueryValueEx(key, "driver", 0, NULL, (LPBYTE)&setting_driver, &size);
	RegQueryValueEx(key, "mixer",  0, NULL, (LPBYTE)&setting_mixer, &size);
	RegQueryValueEx(key, "outputrate",  0, NULL, (LPBYTE)&setting_outputrate, &size);

	/*
        It is not possible to select nosound from dialog box, so it must be an uninitialized
	    registry key.. anyway, however it was 0, set it to directsound if it is.
    */
	if (!setting_output) 
    {
		setting_output = FSOUND_OUTPUT_DSOUND;
    }
	if (setting_outputrate < 4000) 
    {
		setting_outputrate = 44100;
    }

    for (i=0;i < MRU_MAX;i++)
    {
        char s[16];
        char *tmp;

        size = 0;

        if (mru[i])
        {
            free(mru[i]);
            mru[i] = 0;
        }

        sprintf(s, "MRU%d", i);

        if (RegQueryValueEx(key, s, 0, NULL, (LPBYTE)s, &size) == ERROR_MORE_DATA)
        {
            tmp = (char *)malloc(size);
            if (!tmp)
            {
                break;
            }

            if (RegQueryValueEx(key, s, 0, NULL, tmp, &size) == ERROR_SUCCESS)
            {
                mru[i] = tmp;
            }
        }
    }

	RegQueryValueEx(key, "buffersize",        0, NULL, (LPBYTE)&setting_buffersize,        &size);
	RegQueryValueEx(key, "prebuffer_percent", 0, NULL, (LPBYTE)&setting_prebuffer_percent, &size);
	RegQueryValueEx(key, "rebuffer_percent",  0, NULL, (LPBYTE)&setting_rebuffer_percent,  &size);
    FSOUND_Stream_Net_SetBufferProperties(setting_buffersize, setting_prebuffer_percent, setting_rebuffer_percent);

    size = 2048;
    setting_http_proxy[0] = 0;
    RegQueryValueEx(key, "http_proxy", 0, NULL, setting_http_proxy, &size);
    FSOUND_Stream_Net_SetProxy(setting_http_proxy);

	RegQueryValueEx(key, "cdda", 0, NULL, (LPBYTE)&setting_cdda, &size);
	RegQueryValueEx(key, "jitter", 0, NULL, (LPBYTE)&setting_jitter, &size);
	RegQueryValueEx(key, "forceaspi", 0, NULL, (LPBYTE)&setting_forceaspi, &size);

    size = 3;
    setting_cdletter[0] = 0;
    RegQueryValueEx(key, "cdletter", 0, NULL, setting_cdletter, &size);

    /*
        If it doesn't have a valid cd drive letter in the registry then set the first cd drive letter
    */
    if (GetDriveType(setting_cdletter) != DRIVE_CDROM)
    {
        SetFirstCDLetter();
    }

	RegCloseKey(key);
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
void SaveSettings()
{
	HKEY key;
	DWORD result;
    int i;

	setting_output      = FSOUND_GetOutput();
	setting_driver      = FSOUND_GetDriver();
	setting_mixer       = FSOUND_GetMixer();
	setting_outputrate  = FSOUND_GetOutputRate();

	RegCreateKeyEx(HKEY_LOCAL_MACHINE, "Software\\FMOD\\Settings", 0, NULL, REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, NULL, &key, &result);
	RegSetValueEx(key, "xpos", 0, REG_DWORD, (LPBYTE)&setting_xpos, 4);
	RegSetValueEx(key, "ypos", 0, REG_DWORD, (LPBYTE)&setting_ypos, 4);

	RegSetValueEx(key, "output", 0, REG_DWORD, (LPBYTE)&setting_output, 4);
	RegSetValueEx(key, "driver", 0, REG_DWORD, (LPBYTE)&setting_driver, 4);
	RegSetValueEx(key, "mixer",  0, REG_DWORD, (LPBYTE)&setting_mixer, 4);
	RegSetValueEx(key, "outputrate",  0, REG_DWORD, (LPBYTE)&setting_outputrate, 4);

    for (i=0;i < MRU_MAX;i++)
    {
        char s[16];

        sprintf(s, "MRU%d", i);

        if (mru[i])
        {
    	    RegSetValueEx(key, s, 0, REG_SZ, mru[i], (int)strlen(mru[i]) + 1);
        }
        else
        {
    	    RegDeleteValue(key, s);
        }
    }

    FSOUND_Stream_Net_GetBufferProperties(&setting_buffersize, &setting_prebuffer_percent, &setting_rebuffer_percent);
	RegSetValueEx(key, "buffersize",        0, REG_DWORD, (LPBYTE)&setting_buffersize,        4);
	RegSetValueEx(key, "prebuffer_percent", 0, REG_DWORD, (LPBYTE)&setting_prebuffer_percent, 4);
	RegSetValueEx(key, "rebuffer_percent",  0, REG_DWORD, (LPBYTE)&setting_rebuffer_percent,  4);

    if (setting_http_proxy[0])
    {
        RegSetValueEx(key, "http_proxy", 0, REG_SZ, setting_http_proxy, (int)strlen(setting_http_proxy) + 1);
    }
    else
    {
        RegDeleteValue(key, "http_proxy");
    }

	RegSetValueEx(key, "cdda",      0, REG_DWORD, (LPBYTE)&setting_cdda, 4);
	RegSetValueEx(key, "jitter",    0, REG_DWORD, (LPBYTE)&setting_jitter, 4);
	RegSetValueEx(key, "forceaspi", 0, REG_DWORD, (LPBYTE)&setting_forceaspi, 4);
    RegSetValueEx(key, "cdletter",  0, REG_SZ,    setting_cdletter, (int)strlen(setting_cdletter) + 1);

	RegCloseKey(key);
}





/*
[
	[DESCRIPTION]
	A slow and quite unscientific 4th order low pass filter, which leaves the source mix 
	buffer in tact, and returns a pointer to the new 'dirty' buffer.

	[PARAMETERS]
	'originalbuffer'	Pointer to the original mixbuffer, not any buffers passed down 
						through the dsp chain.  They are in newbuffer.
	'newbuffer'			Pointer to buffer passed from previous DSP unit.
	'length'			Length in SAMPLES of buffer being passed.
	'param'				User parameter.  In this case it is a pointer to LowPassBuffer.
 
	[RETURN_VALUE]
	A pointer to the new modified lowpass buffer, leaving the original buffer untouched.

	[REMARKS]
	Leaving the original source data untouched means we still have clean source data to 
	work with using other chained filters.
]
*/
void * F_CALLBACKAPI LowPassCallback(void *originalbuffer, void *newbuffer, int length, void *userdata)
{
	int				count;
	int				mixertype = FSOUND_GetMixer();
    union sample
    {
        void         *vptr;
        signed int   *dptr;
        signed short *wptr;
        float        *fptr;
    };
	union sample srcleft, srcright, destleft, destright;
	
	/*
        Must be 16bit stereo integer buffer.. sorry blendmode (32bit) and fpu (32bit float) dont support this.
    */
   	srcleft.vptr   = newbuffer;
    destleft.vptr  = userdata;
    if (mixertype == FSOUND_MIXER_QUALITY_FPU)
    {
	    srcright.fptr  = (float *)newbuffer + 1;
	    destright.fptr = (float *)userdata  + 1;
    }
    else if (mixertype == FSOUND_MIXER_MMXP5 || mixertype == FSOUND_MIXER_MMXP6 || mixertype == FSOUND_MIXER_QUALITY_MMXP5 || mixertype == FSOUND_MIXER_QUALITY_MMXP6)
    {
	    srcright.wptr  = (signed short *)newbuffer + 1;
	    destright.wptr = (signed short *)userdata  + 1;
    }
    else
    {
	    srcright.dptr  = (signed int *)newbuffer + 1;
	    destright.dptr = (signed int *)userdata  + 1;
    }

	length <<= 1;	/* *2 for stereo (number of 16 bit samples) */

	for (count=0; count<length; count+=2)
	{
		signed int l, r;
        float fl, fr;

        if (mixertype == FSOUND_MIXER_QUALITY_FPU)
        {
            fl = srcleft.fptr[count];
            fr = srcright.fptr[count];
        }
        else if (mixertype == FSOUND_MIXER_MMXP5 || mixertype == FSOUND_MIXER_MMXP6 || mixertype == FSOUND_MIXER_QUALITY_MMXP5 || mixertype == FSOUND_MIXER_QUALITY_MMXP6)
        {
            fl = (float)srcleft.wptr[count];
            fr = (float)srcright.wptr[count];
        }
        else
        {
            fl = (float)(srcleft.dptr[count]);
            fr = (float)(srcright.dptr[count]);
        }

		/*
            This isnt correct lowpassing l and r with the same filter (ie it should have one
		    filter per channel) but its a quick hack and sounds ok for the moment.
        */
		l = (signed int)LowPass_Filter(fl);
		r = (signed int)LowPass_Filter(fr);

		if      (l < -32768) l = -32768;
		else if (l >  32767) l =  32767;
		if      (r < -32768) r = -32768;
		else if (r >  32767) r =  32767;
		
        if (mixertype == FSOUND_MIXER_QUALITY_FPU)
        {
            destleft.fptr[count] = (float)l;
            destright.fptr[count] = (float)r;
        }
        else if (mixertype == FSOUND_MIXER_MMXP5 || mixertype == FSOUND_MIXER_MMXP6 || mixertype == FSOUND_MIXER_QUALITY_MMXP5 || mixertype == FSOUND_MIXER_QUALITY_MMXP6)
        {
            destleft.wptr[count] = (signed short)l;
            destright.wptr[count] = (signed short)r;
        }
        else
        {
            destleft.dptr[count] = l;
            destright.dptr[count] = r;
        }
	}

	/*
        Data has been copied into new buffer, old buffer is still in tact (clean) for another filter
    */
	return userdata;
}


/*
[
	[DESCRIPTION]
	Simple echo callback.  It copies the data into its own history buffer, then copies the data back in.

	[PARAMETERS]
	'originalbuffer'	Pointer to the original mixbuffer, not any buffers passed down 
						through the dsp chain.  They are in newbuffer.
	'newbuffer'			Pointer to buffer passed from previous DSP unit.
	'length'			Length in SAMPLES of buffer being passed.
	'param'				User parameter.  In this case it is a pointer to EchoBuffer.
 
	[RETURN_VALUE]
	A pointer to the new modified buffer.  The buffer passed in has been modified, and 
	EchoBuffer has just been filled with a copy of the original information to keep
	an echo history for later.

	[REMARKS]
	All the <<2 stuff is to convert samples to bytes, as all offsets and lengths are based 
	on samples not bytes.  For mmx the output size is 4 bytes per sample.

	[SEE_ALSO]
	LowPassCallback
]
*/
void * F_CALLBACKAPI EchoCallback(void *originalbuffer, void *newbuffer, int length, void *userdata)
{
	int     mixertype   = FSOUND_GetMixer();
	char   *echobuff    = userdata;
    int     bytesperoutputsample;
    int     count;
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

	/* 
        Echobuff is a ringbuffer that we copy the mixbuffer to.  
	    If the length of the write exceeds the end of the echo buffer,
	    then do the mix in 2 parts, the end part, and the start part.
    */
	if (EchoOffset + length > EchoLen)
	{
		int taillen = EchoLen - EchoOffset;
		int startlen = length - taillen;
		
		/*
            Feedback history from echo buffer into mixbuffer
        */
		FSOUND_DSP_MixBuffers(newbuffer, echobuff+(EchoOffset << 2), taillen,	  outputfreq, 128, FSOUND_STEREOPAN, FSOUND_STEREO | FSOUND_16BITS);
		FSOUND_DSP_MixBuffers((char *)newbuffer + (taillen * bytesperoutputsample), echobuff, startlen, outputfreq, 128, FSOUND_STEREOPAN, FSOUND_STEREO | FSOUND_16BITS);

		/*
            Now copy result into echo buffer again for next time
        */
        {
            signed short *dest;
        	union sample src;

            dest = (signed short *)(echobuff + (EchoOffset << 2));
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

            dest = (signed short *)echobuff;    // always 16bit
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
	/*
        No wrapping echo buffer write, just do a straight write 
    */
	else
	{
		/*
            Feedback history from echo buffer into mixbuffer
        */
		FSOUND_DSP_MixBuffers(newbuffer, echobuff + (EchoOffset << 2), length, outputfreq, 128, FSOUND_STEREOPAN, FSOUND_STEREO | FSOUND_16BITS);

		/*
            Now copy result into echo buffer again for next time
        */
        {
            signed short *dest;
        	union sample src = { newbuffer };

            dest = (signed short *)(echobuff + (EchoOffset << 2));

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

	EchoOffset+=length;
	if (EchoOffset >= EchoLen) 
    {
		EchoOffset -= EchoLen;
    }

	/*
        Echo history has been mixed into new buffer, so return it.
    */
	return newbuffer;
}




/*
[
	[DESCRIPTION]
	Buffering code for oscilliscope.

	[PARAMETERS]
	'originalbuffer'	Pointer to the original mixbuffer, not any buffers passed down 
						through the dsp chain.  They are in newbuffer.
	'newbuffer'			Pointer to buffer passed from previous DSP unit.
	'length'			Length in SAMPLES of buffer being passed.
	'param'				User parameter.  In this case it is 0.
 
	[RETURN_VALUE]
	A pointer to the new modified buffer.  

	[REMARKS]
	All the <<2 stuff is to convert samples to bytes, as all offsets and lengths are based 
	on samples not bytes.  For mmx the output size is 4 bytes per sample.

	[SEE_ALSO]
]
*/
void * F_CALLBACKAPI OscCallback(void *originalbuffer, void *newbuffer, int length, void *userdata)
{
	int             mixertype = FSOUND_GetMixer();
    int             count;
	int             totalblocks; 
    signed short    *dest;

	totalblocks = FSOUND_DSP_GetBufferLengthTotal() / FSOUND_DSP_GetBufferLength(); 
	
    /*
        Convert and downmix into a mono short int buffer.
    */

    dest = &OscBuffer[OscBlock * FSOUND_DSP_GetBufferLength()];

    if (mixertype == FSOUND_MIXER_QUALITY_FPU)
    {
        float *src = (float *)newbuffer;

        for (count=0; count < length; count++)
        {
            dest[count] = (signed short)((src[count << 1] + src[(count << 1) + 1]) * 0.5f);
        }
    }
    else if (mixertype == FSOUND_MIXER_MMXP5 || mixertype == FSOUND_MIXER_MMXP6 || mixertype == FSOUND_MIXER_QUALITY_MMXP5 || mixertype == FSOUND_MIXER_QUALITY_MMXP6)
    {
        signed short *src = (signed short *)newbuffer;

        for (count=0; count < length; count++)
        {
            dest[count] = (signed short)(((int)src[count << 1] + (int)src[(count << 1) + 1]) >> 1);
        }
    }
    else
    {
        signed int *src = (signed int *)newbuffer;

        for (count=0; count < length; count++)
        {
            dest[count] = (signed short)((src[count << 1] + src[(count << 1) + 1]) >> 1);
        }
    }

    OscBlock++;
    if (OscBlock >= totalblocks)
    {
        OscBlock = 0;
    }

	return newbuffer;
}



/*
[
	[DESCRIPTION]
	Plots a graphic spectrum using FSOUND_DSP_GetSpectrum

	[PARAMETERS]
	'hdc'	        Handle to device context to paint to.
 
	[RETURN_VALUE]
    void

	[REMARKS]

	[SEE_ALSO]
	FSOUND_DSP_GetSpectrum
	FSOUND_DSP_GetFFTUnit
    PlotOscilliscope
]
*/
void PlotSpectrum(HDC hdc)
{
    int count, count2;
    float *spectrum;

    spectrum = FSOUND_DSP_GetSpectrum();    /* returns an array of 512 floats */
    if (!spectrum)
    {
        return;
    }

    memset(GraphicWindowBitmapData, 0, GRAPHICWINDOW_WIDTH * GRAPHICWINDOW_HEIGHT * sizeof(RGBQUAD));

    /*
        Spectrum graphic is 256 entries wide, and the spectrum is 512 entries.
        The upper band of frequencies at 44khz is pretty boring (ie 11-22khz), so we are only
        going to display the first 256 frequencies, or (0-11khz)
    */
    for (count=0; count < GRAPHICWINDOW_WIDTH; count++)
    {
        RGBQUAD *pixel;
        int y;
        
        #define calcoffset(_x, _y) (GRAPHICWINDOW_WIDTH * _y) + _x

        y = (int)(spectrum[count] * 4.0f * (float)GRAPHICWINDOW_HEIGHT);
        if (y >= GRAPHICWINDOW_HEIGHT)
        {
            y = GRAPHICWINDOW_HEIGHT - 1;
        }

        for (count2=0; count2<y; count2++)
        {
            pixel = &GraphicWindowBitmapData[calcoffset(count, count2)];
            pixel->rgbRed   = count2 << 1;
            pixel->rgbGreen = 0xFF - (count2 << 1);
            pixel->rgbBlue  = 0x1F;
        }
    }


    SetDIBitsToDevice(
        hdc,                                    // Target device HDC
        graphic_window_x,
        graphic_window_y,
        GRAPHICWINDOW_WIDTH,                    // Destination width
        GRAPHICWINDOW_HEIGHT,                   // Destination height
        0,                                      // X source position
        0,                                      // Adjusted Y source position
        (UINT)0,                                // Start scan line
        GraphicWindowBitmap.bmiHeader.biHeight, // Scan lines present
        GraphicWindowBitmapData,                // Image data
        &GraphicWindowBitmap,                   // DIB header
        DIB_RGB_COLORS);                        // Type of palette
}


/*
[
	[DESCRIPTION]
	Plots an oscilliscope.

	[PARAMETERS]
	'hdc'	        Handle to device context to paint to.
 
	[RETURN_VALUE]
    void

	[REMARKS]
    The oscilliscope data is buffer because the block of data received in a DSP unit is the block
    being mixed ahead of time, not the block that is AUDIBLE.

	[SEE_ALSO]
    PlotSpectrum
]
*/
void PlotOscilliscope(HDC hdc)
{
    memset(GraphicWindowBitmapData, 0, GRAPHICWINDOW_WIDTH * GRAPHICWINDOW_HEIGHT * sizeof(RGBQUAD));

    if (OscBuffer)
    {
        int count, count2, offset;
        float xoff, step;
        signed short *src;
        /*
            The next pcmblock (Oscblock + 1) is the one that is audible.
        */
        offset = (OscBlock + 1) * FSOUND_DSP_GetBufferLength();
        if (offset >= FSOUND_DSP_GetBufferLengthTotal())
        {
            offset -= FSOUND_DSP_GetBufferLengthTotal();
        }

        src = &OscBuffer[offset];

        /*
            xoff is the x position that is scaled lookup of the dsp block according to the graphical
            window size.
        */
        xoff = 0;
        step = (float)FSOUND_DSP_GetBufferLength() / (float)GRAPHICWINDOW_WIDTH;

        for (count=0; count < GRAPHICWINDOW_WIDTH; count++)
        {
            RGBQUAD *pixel;
            int x, y, y2;
        
            #define calcoffset(_x, _y) (GRAPHICWINDOW_WIDTH * _y) + _x

            x  = (int)xoff;
            y  = (int)(((float)src[x]   + 32768.0f) / 65536.0f * (float)GRAPHICWINDOW_HEIGHT);
            y2 = (int)(((float)src[x+(int)step] + 32768.0f) / 65536.0f * (float)GRAPHICWINDOW_HEIGHT);

            if (y > y2)
            {
                int tmp = y;
                y = y2;
                y2 = tmp;
            }

            for (count2=y; count2<=y2; count2++)
            {
                pixel = &GraphicWindowBitmapData[calcoffset(count, count2)];
                pixel->rgbRed   = 0xff;
                pixel->rgbGreen = 0xff;
                pixel->rgbBlue  = 0xaf;
            }

            xoff += step;
        }
    }


    SetDIBitsToDevice(
        hdc,                                    // Target device HDC
        graphic_window_x,
        graphic_window_y,
        GRAPHICWINDOW_WIDTH,                    // Destination width
        GRAPHICWINDOW_HEIGHT,                   // Destination height
        0,                                      // X source position
        0,                                      // Adjusted Y source position
        (UINT)0,                                // Start scan line
        GraphicWindowBitmap.bmiHeader.biHeight, // Scan lines present
        GraphicWindowBitmapData,                // Image data
        &GraphicWindowBitmap,                   // DIB header
        DIB_RGB_COLORS);                        // Type of palette
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
Playlist *ParsePlaylist(char *name)
{
    struct _stat buf;
    FILE        *fp;
    char        *filebuf, *p;
    Playlist    *playlist = 0;
    int          buflen, count, i;

    if (!name || stricmp((const char *)".pls", (const char *)(&name[strlen(name) - 4])))
    {
        return 0;
    }

    if (_stat(name, &buf))
    {
        return 0;
    }

    buflen = buf.st_size + 1;

    filebuf = (char *)malloc(buflen);
    if (!filebuf)
    {
        return 0;
    }

    fp = fopen(name, "rb");
    if (!fp)
    {
        free(filebuf);
        return 0;
    }

    if (fread(filebuf, 1, buf.st_size, fp) != (unsigned int)buf.st_size)
    {
        fclose(fp);
        free(filebuf);
        return 0;
    }

    fclose(fp);

    filebuf[buflen - 1] = 0;

    p = stristr(filebuf, "NumberOfEntries=");
    if (!p)
    {
        goto ERR;
    }

    p += 16;
    count = atoi(p);

    if (!count)
    {
        goto ERR;
    }

    playlist = (Playlist *)calloc(sizeof(Playlist), 1);
    if (!playlist)
    {
        goto ERR;
    }

    playlist->count = count;

    playlist->name = (char **)calloc(sizeof(char *) * count, 1);
    if (!playlist->name)
    {
        goto ERR;
    }

    playlist->displayname = (char **)calloc(sizeof(char *) * count, 1);
    if (!playlist->displayname)
    {
        goto ERR;
    }

    for (i=0;i < count;i++)
    {
        char tmp[32];
        char *filename, *displayname, *t;

        filename = displayname = 0;

        sprintf(tmp, "File%d=", i + 1);
        p = strstr(filebuf, tmp);
        if (p)
        {
            p += strlen(tmp);
            t = p;
            for (;*t && (*t != 0xa) && (*t != 0xd);t++);
            if (*t)
            {
                char tmpc = *t;
                *t = 0;
                filename = strdup(p);
                *t = tmpc;
            }
        }

        if (strncmp(filename, "http://", 7) && strncmp(filename, "http:\\\\", 7))
        {
            char *tmpname = strdup(filename);
            p = &tmpname[strlen(tmpname) - 1];
            for (;(p > tmpname) && (*p != '\\') && (*p != '/');p--);
            if ((*p == '\\') || (*p == '/'))
            {
                p++;
            }
            displayname = strdup(p);
            free(tmpname);
        }

        playlist->name[i] = filename;
        playlist->displayname[i] = displayname;
    }

    free(filebuf);
    return playlist;

ERR:
    FreePlaylist(playlist);
    free(filebuf);
    return 0;
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
signed char FreePlaylist(Playlist *playlist)
{
    int i;

    if (!playlist)
    {
        return FALSE;
    }

    if (playlist->name)
    {
        for (i=0;i < playlist->count;i++)
        {
            if (playlist->name[i])
            {
                free(playlist->name[i]);
            }
        }

        free(playlist->name);
    }

    if (playlist->displayname)
    {
        for (i=0;i < playlist->count;i++)
        {
            if (playlist->displayname[i])
            {
                free(playlist->displayname[i]);
            }
        }

        free(playlist->displayname);
    }

    free(playlist);

    return TRUE;
}


/*
[
	[DESCRIPTION]

	[PARAMETERS]
 
	[RETURN_VALUE]
    Returns FALSE if there's no more room in the song list

	[REMARKS]

	[SEE_ALSO]
]
*/
signed char AddFileToSongList(char *name, char *displayname)
{
	FMUSIC_MODULE	*mod     = NULL;
	FSOUND_STREAM	*stream  = NULL;
	int				currsong = 0;
    char            s[256];

    if (!strncmp(name, "http://", 7) || !strncmp(name, "http:\\\\", 7))
    {
        displayname = name;
    }
    else
    {
        stream = NULL;
        mod = FMUSIC_LoadSong(name);
	    if (!mod)
        {
            stream = FSOUND_Stream_Open(name, FSOUND_NORMAL | FSOUND_2D | FSOUND_MPEGACCURATE | FSOUND_NONBLOCKING, 0, 0);
        }

	    if (!mod && !stream)
	    {
		    MessageBox(0, FMOD_ErrorString(FSOUND_GetError()), "Loading a song", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
            return TRUE;
	    }

	    if (mod)
	    {
		    if (FMUSIC_GetType(mod) != FMUSIC_TYPE_IT)		/* IT has its own master volume setting */
            {
			    FMUSIC_SetMasterVolume(mod, 192);
            }
		    if (FMUSIC_GetType(mod) == FMUSIC_TYPE_MOD || FMUSIC_GetType(mod) == FMUSIC_TYPE_S3M)
            {
			    FMUSIC_SetPanSeperation(mod, 0.85f);	    /* 15% crossover */
            }
	    }
    }

	currsong = (int)SendMessage(songlist_hwnd, LB_GETCOUNT, 0, 0);
	if (currsong >= MAXSONGS) 
	{
		MessageBox(0, "Error.  Unable to fit any more songs in.. please restart app", "Loading a song", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
        return FALSE;
	}
	
	if (mod)
	{
		song[currsong].mod    = mod;
		song[currsong].stream = NULL;
        song[currsong].url    = NULL;
	}
	else if (stream)
	{
		song[currsong].stream = stream;
		song[currsong].mod    = NULL;
        song[currsong].url    = NULL;
	}
    else
    {
		song[currsong].stream = NULL;
		song[currsong].mod    = NULL;
        song[currsong].url    = strdup(name);
    }
	
	strcpy(s, displayname);
    song[currsong].listname = strdup(displayname);

	SendMessage(songlist_hwnd, LB_ADDSTRING, 0, (LPARAM) (LPCTSTR)s);
	UpdateWindow(songlist_hwnd);
	SendMessage(songlist_hwnd, LB_SETCURSEL, currsong, 0);

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
void LoadSong() 
{
	OPENFILENAME	ofn;					/* common dialog box structure   */
	char			szDirName[MAX_PATH];    /* directory string              */
	char			szFile[20481];			/* filename string               */
	char			szFileTitle[4096];      /* filename string               */

	/*
        Obtain the system directory name and store it in szDirName. 
    */
	GetSystemDirectory(szDirName, sizeof(szDirName)); 

	/*
        Place the terminating null character in the szFile.
    */
	szFile[0] = '\0';
    szFileTitle[0] = '\0';

	/*
        Set the members of the OPENFILENAME structure.
    */
	memset(&ofn, 0, sizeof(ofn));
	ofn.lStructSize       = sizeof(OPENFILENAME); 
	ofn.hwndOwner         = mainhwnd; 
	ofn.lpstrTitle        = "Open\0";
	ofn.lpstrFilter       = "All song Types\0*.MOD;*.S3M;*.XM;*.IT;*.MID;*.RMI;*.SGT;*.WAV;*.MP2;*.MP3;*.OGG;*.WMA;*.ASF;*.AIFF;*.PLS;*.FSB;*.OXM\0Microsoft WAV (*.WAV)\0*.WAV\0MP2/MP3 (*.MP3 *.MP2)\0*.MP2;*.MP3\0Ogg Vorbis (*.OGG)\0*.OGG\0Windows Media Format (*.WMA *.ASF)\0*.WMA;*.ASF\0Audio Interchange File Format (*.AIFF)\0*.AIFF\0MIDI / DirectMusic Files (*.MID,*.RMI,*.SGT)\0*.MID;*.RMI;*.SGT\0Impulse Tracker (*.IT)\0*.IT\0FastTracker2 (*.XM)\0*.XM\0ScreamTracker 3 (*.S3M)\0*.S3M\0Protracker/FastTracker (*.MOD)\0*.MOD\0Playlist (*.PLS)\0*.PLS\0FMOD Sample Bank (*.FSB)\0*.FSB\0Ogg commpress XM (*.OXM)\0*.OXM\0All files (*.*)\0*.*\0\0";
	ofn.lpstrCustomFilter = NULL;
	ofn.nFilterIndex      = 1; 
	ofn.lpstrFile         = szFile; 
	ofn.nMaxFile          = 20480;     /* Huge value allows many files to be multi-selected */
	ofn.lpstrFileTitle    = szFileTitle;
	ofn.nMaxFileTitle     = 2048;
	ofn.lpstrInitialDir   = ".\0";
	ofn.Flags             = OFN_EXPLORER | OFN_PATHMUSTEXIST | OFN_FILEMUSTEXIST | OFN_ALLOWMULTISELECT; 

	/*
        Display the Open dialog box.
    */
	if (GetOpenFileName(&ofn)) 
	{
		char *path = ofn.lpstrFile;
		char *fname = ofn.lpstrFile;
		char name[256];

		/*
            Single file
        */
		if (ofn.nFileOffset)
		{
			/*
                Skip to the first filename
            */
			fname +=ofn.nFileOffset;
			*(fname-1) = 0;		/* clear the backslash before the filename so the loop below handles it */
		}
		/*
            Multiple files
        */
		else
		{
			while (*fname++);	/* search to the first filename */
		}

		do 
		{
            Playlist *p;
            int i;

			/*
                Put path in name
            */
			strcpy(name, path);
			strcat(name, "\\");
			strcat(name, fname);

			/*
                Open the file.
            */
            p = ParsePlaylist(name);
            if (p)
            {
                for (i=0;i < p->count;i++)
                {
                    AddFileToSongList(p->name[i], p->displayname[i]);
                }

                FreePlaylist(p);
            }
            else
            {
                AddFileToSongList(name, fname);
            }

			while (*fname++);

            Sleep(1);

		} while (*fname);
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
void LoadURL()
{
	if (DialogBox(g_hinst, MAKEINTRESOURCE(IDD_LOADURLDLG), mainhwnd, FMOD_LoadURLDlgProc))
    {
        if (strlen(url_to_load))
        {
		    int songid = (int)SendMessage(songlist_hwnd, LB_GETCOUNT, 0, 0);
		    if (songid >= MAXSONGS) 
		    {
			    MessageBox(0, "Error.  Unable to fit any more songs in.. please restart app", "Loading a song", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
                return;
		    }
		    
		    song[songid].mod      = 0;
		    song[songid].stream   = 0;
            song[songid].url      = strdup(url_to_load);
            song[songid].listname = strdup(url_to_load);
            
		    SendMessage(songlist_hwnd, LB_ADDSTRING, 0, (LPARAM) (LPCTSTR)song[songid].url);
		    UpdateWindow(songlist_hwnd);
		    SendMessage(songlist_hwnd, LB_SETCURSEL, songid, 0);

            UpdateNetStreamInfo(songid, TRUE, FALSE);
        }
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
void LoadCD()
{
    int numsongs, songid, i;
    char tmp[256];

    /*
        Bomb out if there's a cdda_stream already loading
    */
    if (cdda_stream)
    {
        if (FSOUND_Stream_GetOpenState(cdda_stream) == -2)
        {
            return;
        }
    }

    DeleteAllCDTracks();

    if (cdda_stream)
    {
        FSOUND_Stream_Close(cdda_stream);
        cdda_stream  = 0;
        cdda_channel = -1;
    }

    if (setting_cdda)
    {
        /*
            Use the "!" qualifier to specify "quick open" mode so we can populate the playlist and get 
            the track lengths quickly
        */
        sprintf(tmp, "%s*!j", setting_cdletter);
        cdda_stream = FSOUND_Stream_Open(tmp, FSOUND_NORMAL, 0, 0);
        if (!cdda_stream)
        {
            MessageBox(mainhwnd, "Couldn't open cdda stream", "Error", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
        }

        numsongs = FSOUND_Stream_GetNumSubStreams(cdda_stream);
        for (i=0;i < numsongs;i++)
        {
	        songid = (int)SendMessage(songlist_hwnd, LB_GETCOUNT, 0, 0);
	        if (songid >= MAXSONGS) 
	        {
		        MessageBox(0, "Error.  Unable to fit any more songs in.. please restart app", "Loading a song", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
                break;
	        }

            memset(&song[songid], 0, sizeof(song[songid]));

            sprintf(tmp, "Track %02d", i + 1);
            song[songid].listname = strdup(tmp);
            song[songid].channel  = -1;
            song[songid].cdtrack  = i + 1;

	        SendMessage(songlist_hwnd, LB_ADDSTRING, 0, (LPARAM) (LPCTSTR)tmp);
	        UpdateWindow(songlist_hwnd);
        }

        SendMessage(songlist_hwnd, LB_SETCURSEL, 0, 0);

        numsongs = (int)SendMessage(songlist_hwnd, LB_GETCOUNT, 0, 0);
        for (i=0;i < numsongs;i++)
        {
            if (song[i].cdtrack)
            {
                FSOUND_Stream_SetSubStream(cdda_stream, song[i].cdtrack - 1);
                song[i].cdtrack_length = FSOUND_Stream_GetLengthMs(cdda_stream);
            }
        }

        FSOUND_Stream_Close(cdda_stream);

        /*
            Now do a normal non-blocking open to setup the stream properly for playing
        */
        strcpy(tmp, setting_cdletter);
        strcat(tmp, "*");
        if (!setting_jitter)
        {
            strcat(tmp, "j");
        }
        if (setting_forceaspi)
        {
            strcat(tmp, "a");
        }
        cdda_stream = FSOUND_Stream_Open(tmp, FSOUND_NORMAL | FSOUND_NONBLOCKING, 0, 0);
        if (!cdda_stream)
        {
            MessageBox(mainhwnd, "Couldn't open cdda stream", "Error", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
        }

        cdda_stream_state = -2;
    }
    else
    {
        numsongs = FSOUND_CD_GetNumTracks(cddevice);
        if (numsongs)
        {
            for (i=0;i < numsongs;i++)
            {
	            songid = (int)SendMessage(songlist_hwnd, LB_GETCOUNT, 0, 0);
	            if (songid >= MAXSONGS) 
	            {
		            MessageBox(0, "Error.  Unable to fit any more songs in.. please restart app", "Loading a song", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
                    break;
	            }

                memset(&song[songid], 0, sizeof(song[songid]));

                sprintf(tmp, "Track %02d", i + 1);
                song[songid].listname = strdup(tmp);
                song[songid].channel  = -1;
                song[songid].cdtrack  = i + 1;
                song[songid].cdtrack_length = 0;

	            SendMessage(songlist_hwnd, LB_ADDSTRING, 0, (LPARAM) (LPCTSTR)tmp);
	            UpdateWindow(songlist_hwnd);
	            SendMessage(songlist_hwnd, LB_SETCURSEL, songid, 0);
            }
        }
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
void DeleteAllCDTracks()
{
    int numsongs, i;

    StopCDTrack();

    numsongs = (int)SendMessage(songlist_hwnd, LB_GETCOUNT, 0, 0);
    for (i=0;i < numsongs;i++)
    {
        if (song[i].cdtrack)
        {
            DeleteSong(i);
            i = -1;              /* Force it to start at the start */
            numsongs--;
        }
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
signed char StopCDTrack()
{
    int songid;
    int numsongs = (int)SendMessage(songlist_hwnd, LB_GETCOUNT, 0, 0);

    if (setting_cdda)
    {
        for (songid=0;songid < numsongs;songid++)
        {
            if (song[songid].cdtrack && (song[songid].channel != -1))
            {
                FSOUND_Stream_Stop(cdda_stream);
                song[songid].channel = -1;
                return TRUE;
            }
        }
    }
    else
    {
        FSOUND_CD_Stop(cddevice);
    }

    return FALSE;
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
signed char PlayCDTrack(int songid, int looped)
{
    unsigned int mode;

    if (setting_cdda)
    {
        if (cdda_stream)
        {
            if ((song[songid].channel != -1) && FSOUND_IsPlaying(song[songid].channel))
            {
                int off = FSOUND_Stream_GetTime(cdda_stream);
                int len = FSOUND_Stream_GetLengthMs(cdda_stream);
                if ((off < len) && (off > 0))
                {
                    /*
                        It's already playing
                    */
                    return TRUE;
                }
            }

            if (FSOUND_Stream_GetOpenState(cdda_stream) == 0)
            {
                StopCDTrack();

                FSOUND_Stream_SetSubStream(cdda_stream, song[songid].cdtrack - 1);
                /*
                    It's non-blocking - wait for it to finish seeking
                */
                while (FSOUND_Stream_GetOpenState(cdda_stream) != 0)
                {
                    Sleep(100);
                }

                mode = FSOUND_Stream_GetMode(cdda_stream);
                mode &= ~(FSOUND_LOOP_OFF | FSOUND_LOOP_NORMAL | FSOUND_LOOP_BIDI);
                if (looped == FSOUND_CD_PLAYONCE)
                {
                    mode |= FSOUND_LOOP_OFF;
                }
                else if (looped == FSOUND_CD_PLAYLOOPED)
                {
                    mode |= FSOUND_LOOP_NORMAL;
                }
                else
                {
                    mode |= FSOUND_LOOP_OFF;
                }
                FSOUND_Stream_SetMode(cdda_stream, mode);

                song[songid].channel = FSOUND_Stream_Play(FSOUND_FREE, cdda_stream);
		        if (song[songid].channel < 0)
                {
			        MessageBox(mainhwnd, "Error.  Cannot start song", "Playing a song", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
                    return FALSE;
                }
            }

            return TRUE;
        }
    }
    else
    {
        if (FSOUND_CD_GetPaused(cddevice)) 
        {
            return FSOUND_CD_SetPaused(cddevice, FALSE);
        }
        else
        {
            FSOUND_CD_SetPlayMode(cddevice, looped);
            return FSOUND_CD_Play(cddevice, song[songid].cdtrack);
        }
    }

    return FALSE;
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
void DeleteSong(int songid)
{
    int count;

	if (song[songid].mod)
	{
		FMUSIC_FreeSong(song[songid].mod);
		song[songid].mod = NULL;
	}
	else if (song[songid].stream)
	{
		FSOUND_Stream_Close(song[songid].stream);
		song[songid].stream = NULL;

        if (song[songid].url)
        {
            free(song[songid].url);
            song[songid].url = 0;
        }
	}
    else if (song[songid].cdtrack)
    {
        if (setting_cdda)
        {
            if (song[songid].channel && cdda_stream)
            {
                FSOUND_Stream_Stop(cdda_stream);
            }
        }
        else
        {
            if (FSOUND_CD_GetTrack(cddevice) == song[songid].cdtrack)
            {
                FSOUND_CD_Stop(cddevice);
            }
        }
    }

	song[songid].channel = -1;

    if (song[songid].listname)
    {
        free(song[songid].listname);
        song[songid].listname = 0;
    }

    if (song[songid].server_status)
    {
        free(song[songid].server_status);
        song[songid].server_status = 0;
    }

    if (song[songid].title)
    {
        free(song[songid].title);
        song[songid].title = 0;
    }

    if (song[songid].artist)
    {
        free(song[songid].artist);
        song[songid].artist = 0;
    }

    song[songid].protocol    = NULL;
    song[songid].format      = NULL;
    song[songid].streamname  = NULL;
    song[songid].last_status = -1;

	SendMessage(songlist_hwnd, LB_DELETESTRING, songid, 0);

	/*
        Shuffle down tunes
    */
	for (count=songid+1; count<MAXSONGS; count++) 
    {
		song[count-1] = song[count];
    }

	if (songid >= SendMessage(songlist_hwnd, LB_GETCOUNT, 0, 0))
	{
		songid = (int)SendMessage(songlist_hwnd, LB_GETCOUNT, 0, 0) - 1;
		if (songid < 0) 
        {
			songid = 0;
        }
	}

	SendMessage(songlist_hwnd, LB_SETCURSEL, songid, 0);

    UpdateStreamInfo(songid, TRUE);
    UpdateNetStreamInfo(songid, TRUE, FALSE);
    UpdateModInfo(songid, TRUE);
    UpdateCDInfo(songid, TRUE);
    SelectInfoWindow();

	playlistsong = 0;
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
BOOL PlaySong(int index)
{
	if (song[index].mod)
    {
        FMUSIC_SetLooping(song[index].mod, Button_GetCheck(GetDlgItem(mainhwnd, IDC_PLAYLOOPED)));
		FMUSIC_PlaySong(song[index].mod);
    }
    else if (song[index].stream && !song[index].url)
    {
        FSOUND_Stream_SetMode(song[index].stream, Button_GetCheck(GetDlgItem(mainhwnd, IDC_PLAYLOOPED)) ? FSOUND_LOOP_NORMAL : FSOUND_LOOP_OFF);
		song[index].channel = FSOUND_Stream_Play(FSOUND_FREE, song[index].stream);
    }
    else if (!song[index].stream && song[index].url)
    {
        song[index].stream = FSOUND_Stream_Open(song[index].url, FSOUND_NORMAL | FSOUND_NONBLOCKING, 0, 0);
        if (!song[index].stream)
        {
            MessageBox(mainhwnd, "ERROR: Couldn't open stream", "Playing a song", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
            return FALSE;
        }
    }
    else if (song[index].cdtrack)
    {
        PlayCDTrack(index, Button_GetCheck(GetDlgItem(mainhwnd, IDC_PLAYLOOPED)) ? FSOUND_CD_PLAYLOOPED : FSOUND_CD_PLAYONCE);
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
signed char PlayNextSong()
{
    playlistsong++;

    if (playlistsong >= SendMessage(songlist_hwnd, LB_GETCOUNT, 0, 0))
    {
        playlistsong = 0;
    }

    PlaySong(playlistsong);

    SendMessage(songlist_hwnd, LB_SETCURSEL, playlistsong, 0);
    SelectInfoWindow();

    return TRUE;
}


/*
[
	[DESCRIPTION]
	Create DSP units and reverb buffers etc

	[PARAMETERS]
	void
 
	[RETURN_VALUE]
	void

	[REMARKS]

	[SEE_ALSO]
	CloseDSP
]
*/
void InitDSP()
{
    int bytesperoutputsample;
    int mixertype = FSOUND_GetMixer();

	DSP_Ready = FALSE;

    if (mixertype == FSOUND_MIXER_MMXP5 || mixertype == FSOUND_MIXER_MMXP6 || mixertype == FSOUND_MIXER_QUALITY_MMXP5 || mixertype == FSOUND_MIXER_QUALITY_MMXP6)
    {
	    bytesperoutputsample = 4;   // 16bit stereo
    }
    else
    {
	    bytesperoutputsample = 8;   // 32bit stereo
    }

    /*
        Initalize and create lowpass buffer and DSP unit 
    */
    LowPass_Init();
	LowPassBuffer = calloc(FSOUND_DSP_GetBufferLength()+256, bytesperoutputsample);
	LowPass_Update(LowPassResonance, LowPassCutoffFrequency, outputfreq);
	LowPassUnit = FSOUND_DSP_Create(&LowPassCallback,	FSOUND_DSP_DEFAULTPRIORITY_USER+1,	LowPassBuffer);

    /*
        Create buffer and dsp unit for echo effect
    */
	EchoLen		= MAXECHOLEN;				/* 500ms */
	EchoBuffer  = calloc(EchoLen, 4);	    /* The echo buff is always 16bit stereo int regardless of the mixer format, so * 4 */
	EchoOffset	= 0;
	EchoUnit	= FSOUND_DSP_Create(&EchoCallback, FSOUND_DSP_DEFAULTPRIORITY_USER+2, EchoBuffer);
 
    /*
        Create buffer and dsp unit for oscilliscope.
    */
	OscUnit	    = FSOUND_DSP_Create(&OscCallback, FSOUND_DSP_DEFAULTPRIORITY_USER+3,	0);
    OscBuffer   = calloc(FSOUND_DSP_GetBufferLengthTotal() + 16, 2); /* *2 for mono 16bit buffer */

    /*
        Initialize reverb stuff
    */
    Reverb_Init();

    /*
        Create a bitmap to draw the Spectrum into
    */

    // make the header
    ZeroMemory( &GraphicWindowBitmap, sizeof( BITMAPINFO ) );
    GraphicWindowBitmap.bmiHeader.biSize = sizeof( GraphicWindowBitmap.bmiHeader );
    GraphicWindowBitmap.bmiHeader.biWidth  = GRAPHICWINDOW_WIDTH;
    GraphicWindowBitmap.bmiHeader.biHeight = GRAPHICWINDOW_HEIGHT;
    GraphicWindowBitmap.bmiHeader.biPlanes = 1;
    GraphicWindowBitmap.bmiHeader.biBitCount = 32;
    GraphicWindowBitmap.bmiHeader.biCompression = BI_RGB;
    GraphicWindowBitmap.bmiHeader.biSizeImage = 0;
    GraphicWindowBitmap.bmiHeader.biXPelsPerMeter = 0;
    GraphicWindowBitmap.bmiHeader.biYPelsPerMeter = 0;
    GraphicWindowBitmap.bmiHeader.biClrUsed = 0;
    GraphicWindowBitmap.bmiHeader.biClrImportant = 0;
   

	DSP_Ready = TRUE;
}


/*
[
	[DESCRIPTION]
	Remove all DSP units and reverb buffers etc.

	[PARAMETERS]
	void
 
	[RETURN_VALUE]
	void

	[REMARKS]

	[SEE_ALSO]
	InitDSP
]
*/
void CloseDSP()
{
	DSP_Ready = FALSE;

	if (LowPassUnit)
    {
		FSOUND_DSP_Free(LowPassUnit);
    }
	LowPassUnit = NULL;

	if (EchoUnit)
    {
		FSOUND_DSP_Free(EchoUnit);
    }
	EchoUnit = NULL;

	if (OscUnit)
    {
		FSOUND_DSP_Free(OscUnit);
    }
	OscUnit = NULL;

    /*
        Free buffers
    */
	if (LowPassBuffer)
    {
		free(LowPassBuffer);
    }
	LowPassBuffer = NULL;

	if (EchoBuffer)
    {
		free(EchoBuffer);
    }
	EchoBuffer = NULL;

	if (OscBuffer)
    {
		free(OscBuffer);
    }
	OscBuffer = NULL;

    Reverb_Close();
	LowPass_Close();
}


/*
 ** TextWindowProc
 *
 *  PARAMETERS:
 *
 *  DESCRIPTION: Sends back messages to the parent window if this window got focus
 *
 *  RETURNS:
 *
 */
long FAR PASCAL ProgressWindowProc(HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam) 
{
	switch (message)
	{
        case WM_LBUTTONDOWN:
        case WM_MOUSEMOVE:
        {
			int songid = (int)SendMessage(songlist_hwnd, LB_GETCURSEL, 0, 0);

            if (message == WM_MOUSEMOVE && wParam != MK_LBUTTON)
            {
                break;
            }

			if (songid != LB_ERR)
			{
				FMUSIC_MODULE *mod    = song[songid].mod;
				FSOUND_STREAM *stream = song[songid].stream;
                char *url             = song[songid].url;
                RECT    r;
                int     width;
                int     xPos    = LOWORD(lParam);  // horizontal position of cursor 
            
                GetWindowRect(hwnd, &r);

                width = r.right - r.left;

				if (mod)
                {
                    int count;

                    for (count=0; count < FMUSIC_GetNumChannels(mod); count++)
                    {
                        FSOUND_StopSound(FMUSIC_GetRealChannel(mod, count));
                    }
					FMUSIC_SetOrder(mod, (int)((float)FMUSIC_GetNumOrders(mod) / (float)width * (float)xPos));
                }
				else if (stream && !url)
                {
        			FSOUND_Stream_SetTime(stream, (int)((float)FSOUND_Stream_GetLengthMs(stream) / (float)width * (float)xPos));
                }
                else if (song[songid].cdtrack)
                {
                    if (setting_cdda)
                    {
                        if ((song[songid].channel != -1) && cdda_stream)
                        {
        			        FSOUND_Stream_SetTime(cdda_stream, (int)((float)FSOUND_Stream_GetLengthMs(cdda_stream) / (float)width * (float)xPos));
                        }
                    }
                    else
                    {
                        if (song[songid].cdtrack == FSOUND_CD_GetTrack(cddevice))
                        {
        			        FSOUND_CD_SetTrackTime(cddevice, (int)((float)FSOUND_CD_GetTrackLength(cddevice, FSOUND_CD_GetTrack(cddevice)) / (float)width * (float)xPos));
                        }
                    }
                }
			}
            break;
        }
	};
    
	return (long)CallWindowProc(oldprogressproc, hwnd, message, wParam, lParam);
}


/*
 ** TextWindowProc
 *
 *  PARAMETERS:
 *
 *  DESCRIPTION: Sends back messages to the parent window if this window got focus
 *
 *  RETURNS:
 *
 */
long FAR PASCAL CDTimeWindowProc(HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam) 
{
	switch (message)
	{
        case WM_LBUTTONDOWN:
        {
            DraggingCDSlider = TRUE;
            break;
        }
        case WM_LBUTTONUP:
        {
            int pos = (int)SendMessage(hwnd, TBM_GETPOS, 0, 0);

            if (setting_cdda)
            {
                if (cdda_stream)
                {
                    FSOUND_Stream_SetTime(cdda_stream, (int)((float)pos * (float)FSOUND_Stream_GetLengthMs(cdda_stream) / 1000.0f));
                }
            }
            else
            {
		        FSOUND_CD_SetTrackTime(cddevice, (int)((float)pos * (float)FSOUND_CD_GetTrackLength(cddevice, FSOUND_CD_GetTrack(cddevice)) / 1000.0f));
            }
            DraggingCDSlider = FALSE;
			break;
        }
	};
    
	return (long)CallWindowProc(oldcdtimeproc, hwnd, message, wParam, lParam);
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
#ifdef _WIN64
INT_PTR CALLBACK FMOD_DlgProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
#else
BOOL CALLBACK FMOD_DlgProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
#endif
{
	switch (msg)
	{
		case WM_INITDIALOG:
		{
			int	 count;
            RECT r;

			SetFocus(hwnd);

			/*
			    CALL DRIVER DIALOG BOX
			*/
			#if 0
			if (!SoundDriver_Init(&outputfreq))
			{
				SendMessage(hwnd, WM_CLOSE, 0, 0);
	  			return TRUE;
			}
			#endif

			/*
                CONFIGURE STABILITY OF SOUND OUTPUT UNDER WINDOWS
			*/

			FSOUND_SetBufferSize(FSOUND_BUFFERSIZE);

			/*
			    INITIALIZE FSOUND
			*/
			FSOUND_SetOutput(setting_output);
			FSOUND_SetDriver(setting_driver);
			FSOUND_SetMixer(setting_mixer);
			FSOUND_SetHWND(hwnd);

			outputfreq = setting_outputrate;
			if (!FSOUND_Init(outputfreq, NUMCHANNELS, FSOUND_INIT_GLOBALFOCUS))
			{
    			MessageBox(hwnd, FMOD_ErrorString(FSOUND_GetError()), "FSOUND", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
				SendMessage(hwnd, WM_CLOSE, 0, 0);
    			return TRUE;
			}

            FSOUND_Stream_Net_SetProxy(setting_http_proxy);
            FSOUND_Stream_SetBufferSize(1000);

			/*
			    SET UP A PAINT TIMER FOR INTERFACE
			*/
			timerid = SetTimer(hwnd, 0, 5, (TIMERPROC)0); 
			if (!timerid)
			{
    			MessageBox( NULL, "Too many timers in use", "Error", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
    			return FALSE;
			}

			/*
			    INITIALIZE SONG LIST TO NULL
			*/
			for (count=0; count<MAXSONGS+1; count++) 
			{
				song[count].mod            = NULL;
				song[count].stream         = NULL;
				song[count].url            = NULL;
				song[count].channel        = -1;
				song[count].last_status    = -2;
				song[count].last_netstatus = FSOUND_STREAM_NET_NOTCONNECTED;
                song[count].server_status  = NULL;
                song[count].title          = NULL;
                song[count].artist         = NULL;
                song[count].protocol       = NULL;
                song[count].format         = NULL;
                song[count].streamname     = NULL;
                song[count].metadata       = 0;
                song[count].cdtrack        = 0;
                song[count].cdtrack_length = 0;
			}

			/*
			    SET UP DSP UNITS
			*/
			InitDSP();

            GetWindowRect(GetDlgItem(hwnd, IDC_STATIC_INFO), &r);
            graphic_window_x = r.left + (((r.right - r.left) - GRAPHICWINDOW_WIDTH) / 2) - 2;
            graphic_window_y = r.top;

			songlist_hwnd = GetDlgItem(hwnd, IDC_SONGLIST);

			return TRUE;
		}

		case WM_CLOSE:
		{
			CloseDSP();

			KillTimer(hwnd, timerid);

            /*
                The timer doesnt die immediately, sleep for a bit to let it die so we dont free streams then the timer tries to access them
            */
            Sleep(200);

			CloseDown();
			EndDialog(hwnd,0);
            PostQuitMessage(0);
			return TRUE;
		}

		case WM_HSCROLL:
		{
            if ((HWND)lParam == GetDlgItem(hwnd, IDC_SLIDER1))
            { 
			    int songid = (int)SendMessage(songlist_hwnd, LB_GETCURSEL, 0, 0);
			    if (songid != LB_ERR)
			    {
				    FMUSIC_MODULE *mod    = song[songid].mod;
				    FSOUND_STREAM *stream = song[songid].stream;

				    if (mod)
                    {
					    FMUSIC_SetMasterVolume(mod, (int)SendMessage((HWND)lParam, TBM_GETPOS, 0, 0));
                    }
				    else if (stream)
                    {
					    FSOUND_SetVolume(song[songid].channel, (int)SendMessage((HWND)lParam, TBM_GETPOS, 0, 0));
                    }
                    else if (song[songid].cdtrack)
                    {
                        if (setting_cdda)
                        {
                            if ((song[songid].channel != -1) && cdda_stream)
                            {
        					    FSOUND_SetVolume(song[songid].channel, (int)SendMessage((HWND)lParam, TBM_GETPOS, 0, 0));
                            }
                        }
                        else
                        {
                            if (song[songid].cdtrack == FSOUND_CD_GetTrack(cddevice))
                            {
                                FSOUND_CD_SetVolume(cddevice, (int)SendMessage((HWND)lParam, TBM_GETPOS, 0, 0));
                            }
                        }
                    }
			    }
            }
			break;
		}

		case WM_VSCROLL :
		{
            if ((HWND)lParam == GetDlgItem(hwnd,IDC_ECHOSLIDER))
			{
				EchoLen = (int)SendMessage((HWND)lParam, TBM_GETPOS, 0, 0) * outputfreq / 1000;
				if (EchoLen < FSOUND_DSP_GetBufferLength())
                {
					EchoLen = FSOUND_DSP_GetBufferLength();
                }

				EchoOffset = 0;
				memset(EchoBuffer, 0, MAXECHOLEN);	/* echolen is in samples. */
				break;
			}
			else if ((HWND)lParam == GetDlgItem(hwnd,IDC_CUTOFFSLIDER))
			{
				LowPassCutoffFrequency = 520 - (float)SendMessage((HWND)lParam, TBM_GETPOS, 0, 0);
				LowPassCutoffFrequency *= 10;	/* 200 to 5000 */
				LowPass_Update(LowPassResonance, LowPassCutoffFrequency, FSOUND_GetOutputRate());
				break;
			}
			else if ((HWND)lParam == GetDlgItem(hwnd,IDC_RESOSLIDER))
			{
				LowPassResonance = 520 - (float)SendMessage((HWND)lParam, TBM_GETPOS, 0, 0);
				LowPassResonance /= 50;			/* .2 to 10 */
				LowPass_Update(LowPassResonance, LowPassCutoffFrequency, FSOUND_GetOutputRate());
		
				break;
			}
		}

		case WM_COMMAND :
		{
			switch (LOWORD(wParam))
			{
				case IDCANCEL:
				{
					CloseDown();
					EndDialog(hwnd, 0);
		            PostQuitMessage(0);
					return TRUE;
				}

				case IDC_LOAD:		/* LOAD MOD */
				{
					LoadSong();
                    SelectInfoWindow();
					break;
				}

				case IDC_LOADURL :  /* LOAD URL */
				{
					LoadURL();
                    SelectInfoWindow();
					break;
				}

				case IDC_LOADCD :
				{
					LoadCD();
                    SelectInfoWindow();
					break;
				}

                case IDC_DELETE :
				{
					int songid = (int)SendMessage(songlist_hwnd, LB_GETCURSEL, 0, 0);
					if (songid == LB_ERR) 
                    {
						MessageBox(hwnd, "Error.  Please SELECT a song to delete", "Deleting a mod", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
                    }
					else
					{
                        DeleteSong(songid);
					}
					break;
				}

				case IDC_PLAY :
				{
                    if (play_button_play)
                    {
					    int songid = (int)SendMessage(songlist_hwnd, LB_GETCURSEL, 0, 0);
					    if (songid != LB_ERR)
					    {
						    if (Button_GetCheck(GetDlgItem(hwnd,IDC_PLAYLIST))) 
                            {
							    playlistsong = songid;
                            }

						    if (song[songid].mod)
						    {
                                FMUSIC_SetLooping(song[songid].mod, Button_GetCheck(GetDlgItem(hwnd,IDC_PLAYLOOPED)));
							    if (!FMUSIC_PlaySong(song[songid].mod)) 
                                {
                                    FMUSIC_SetLooping(song[songid].mod, Button_GetCheck(GetDlgItem(hwnd,IDC_PLAYLOOPED)));
								    MessageBox(hwnd, "Error.  Cannot start song", "Playing a song", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
                                }
						    }
						    else if (song[songid].url)
						    {
                                if (song[songid].stream)
                                {
                                    switch (FSOUND_Stream_GetOpenState(song[songid].stream))
                                    {
                                        case -1 :
                                        case -3 :
                                        {
                                            FSOUND_Stream_Close(song[songid].stream);
                                            song[songid].stream = FSOUND_Stream_Open(song[songid].url, FSOUND_NORMAL | FSOUND_NONBLOCKING, 0, 0);
                                            if (!song[songid].stream)
                                            {
                                                MessageBox(hwnd, "ERROR: Couldn't open stream", "Playing a song", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
                                            }
                                            break;
                                        }

                                        case 0 :
                                        {
                                            int off, len, status;

                                            off = FSOUND_Stream_GetTime(song[songid].stream);
                                            len = FSOUND_Stream_GetLengthMs(song[songid].stream);

                                            FSOUND_Stream_Net_GetStatus(song[songid].stream, &status, 0, 0, 0);

                                            if ((status == FSOUND_STREAM_NET_ERROR) || (off >= len))
                                            {
                                                FSOUND_Stream_Close(song[songid].stream);
                                                song[songid].stream = FSOUND_Stream_Open(song[songid].url, FSOUND_NORMAL | FSOUND_NONBLOCKING, 0, 0);
                                                if (!song[songid].stream)
                                                {
                                                    MessageBox(hwnd, "ERROR: Couldn't open stream", "Playing a song", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
                                                }
                                            }
                                            break;
                                        }
                                    }
                                }
                                else
                                {
                                    song[songid].stream = FSOUND_Stream_Open(song[songid].url, FSOUND_NORMAL | FSOUND_NONBLOCKING, 0, 0);
                                    if (!song[songid].stream)
                                    {
                                        MessageBox(hwnd, "ERROR: Couldn't open stream", "Playing a song", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
                                    }
                                }
                            }
                            else if (song[songid].stream)
                            {
                                /*
                                    It's non-blocking - wait for it to finish opening first
                                */
                                if (FSOUND_Stream_GetOpenState(song[songid].stream) != 0)
                                {
                            	    HWND pwhwnd = CreateDialog(g_hinst, MAKEINTRESOURCE(IDD_DIALOGWAIT), mainhwnd, 0);
                                    while (FSOUND_Stream_GetOpenState(song[songid].stream) == -2)
                                    {
                                        Sleep(100);
                                    }
                                    EndDialog(pwhwnd, 0);
                                }

                                FSOUND_Stream_SetMode(song[songid].stream, Button_GetCheck(GetDlgItem(hwnd,IDC_PLAYLOOPED)) ? FSOUND_LOOP_NORMAL : FSOUND_LOOP_OFF);
                                song[songid].channel = FSOUND_Stream_Play(FSOUND_FREE, song[songid].stream);
							    if (song[songid].channel < 0)
                                {
								    MessageBox(hwnd, "Error.  Cannot start song", "Playing a song", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
                                }
                            }
                            else if (song[songid].cdtrack)
                            {
                                if (!PlayCDTrack(songid, Button_GetCheck(GetDlgItem(hwnd,IDC_PLAYLOOPED)) ? FSOUND_CD_PLAYLOOPED : FSOUND_CD_PLAYONCE))
                                {
								    MessageBox(hwnd, "Error.  Cannot start song", "Playing a song", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
                                }
                            }
					    }
					    else 
                        {
						    MessageBox(hwnd, "Error.  Please select a song to play first", "Playing a song", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
                        }
                    }
                    else
                    {
					    int songid = (int)SendMessage(songlist_hwnd, LB_GETCURSEL, 0, 0);
					    if (songid != LB_ERR) 
					    {
						    if (song[songid].mod)
                            {
							    FMUSIC_StopSong(song[songid].mod);
                            }
						    else if (song[songid].stream)
						    {
                                if (song[songid].url)
                                {
    							    FSOUND_Stream_Close(song[songid].stream);
                                    song[songid].stream = NULL;
                                }
                                else
                                {
    							    FSOUND_Stream_Stop(song[songid].stream);
                                }
						    }
                            else if (song[songid].cdtrack)
                            {
                                if (setting_cdda)
                                {
                                    if ((song[songid].channel != -1) && cdda_stream)
                                    {
                                        StopCDTrack();
                                    }
                                }
                                else
                                {
                                    if (song[songid].cdtrack == FSOUND_CD_GetTrack(cddevice))
                                    {
                                        StopCDTrack();
                                    }
                                }
                            }

                            if (song[songid].title)
                            {
                                free(song[songid].title);
                                song[songid].title = 0;
                            }

                            if (song[songid].artist)
                            {
                                free(song[songid].artist);
                                song[songid].artist = 0;
                            }

						    song[songid].channel    = -1;
                            song[songid].protocol   = NULL;
                            song[songid].format     = NULL;
                            song[songid].streamname = NULL;
					    }
					    else
                        {
						    MessageBox(hwnd, "Error.  Please select a song to play first", "Playing a mod", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
                        }
                    }

					break;
				}

                case IDC_SPECTRUM:     /* GRAPHIC SPECTRUM / INFO BUTTON */
                {
                    int  x, y;
                    RECT rect;

                    if (GraphicWindowCurrent == GRAPHICWINDOW_MODINFO)
                    {
	                    ShowWindow(modinfo_hwnd,       SW_HIDE);
	                    ShowWindow(streaminfo_hwnd,    SW_HIDE);
	                    ShowWindow(netstreaminfo_hwnd, SW_HIDE);
	                    ShowWindow(cdinfo_hwnd,        SW_HIDE);
                    }
                    else if (GraphicWindowCurrent == GRAPHICWINDOW_EQUALISER)
                    {
                        FSOUND_DSP_SetActive(FSOUND_DSP_GetFFTUnit(), FALSE);
                    }
                    else if (GraphicWindowCurrent == GRAPHICWINDOW_WAVE)
                    {
                        FSOUND_DSP_SetActive(OscUnit, FALSE);
                    }

                    GraphicWindowCurrent++;
                    if (GraphicWindowCurrent >= GRAPHICWINDOW_MAX)
                    {
                        GraphicWindowCurrent = GRAPHICWINDOW_MODINFO;
                    }

                    if (GraphicWindowCurrent == GRAPHICWINDOW_MODINFO)
                    {
                        SelectInfoWindow();
                        SendMessage(GetDlgItem(hwnd, IDC_SPECTRUM),   WM_SETTEXT, 0, (LPARAM)(LPCTSTR)"Spectrum");
                    }
                    else if (GraphicWindowCurrent == GRAPHICWINDOW_EQUALISER)
                    {
                        FSOUND_DSP_SetActive(FSOUND_DSP_GetFFTUnit(), TRUE);
                        SendMessage(GetDlgItem(hwnd, IDC_STATIC_INFO), WM_SETTEXT, 0, (LPARAM)(LPCTSTR)"Spectrum");
                        SendMessage(GetDlgItem(hwnd, IDC_SPECTRUM),   WM_SETTEXT, 0, (LPARAM)(LPCTSTR)"Wave");
                    }
                    else if (GraphicWindowCurrent == GRAPHICWINDOW_WAVE)
                    {
                        FSOUND_DSP_SetActive(OscUnit, TRUE);
                        SendMessage(GetDlgItem(hwnd, IDC_STATIC_INFO), WM_SETTEXT, 0, (LPARAM)(LPCTSTR)"Oscilliscope");
                        SendMessage(GetDlgItem(hwnd, IDC_SPECTRUM),   WM_SETTEXT, 0, (LPARAM)(LPCTSTR)"Info");
                    }

                    x = graphic_window_x;
                    y = graphic_window_y;
                    rect.left   = x;
                    rect.top    = y;
                    rect.right  = x + GRAPHICWINDOW_WIDTH;
                    rect.bottom = y + GRAPHICWINDOW_HEIGHT;
                    InvalidateRect(hwnd, &rect, TRUE);

                    break;
                }

                case IDC_SONGLIST :
                {
                    if (HIWORD(wParam) == LBN_SELCHANGE)
                    {
                        SelectInfoWindow();
                    }
                    break;
                }

				case IDC_CONFIG :
				{
                    int i, numsongs, currsong;

					CloseDSP();

                    /*
                        Close all open internet streams because all network stuff gets shutdown in FSOUND_Close
                    */
                    numsongs = (int)SendMessage(songlist_hwnd, LB_GETCOUNT, 0, 0);
                    currsong = (int)SendMessage(songlist_hwnd, LB_GETCURSEL, 0, 0);
                    for (i=0;i < numsongs;i++)
                    {
                        if (song[i].url && song[i].stream)
                        {
                            FSOUND_Stream_Close(song[i].stream);
                            song[i].stream  = 0;
                            song[i].channel = -1;
                            song[i].last_status = -1;

                            if (i == currsong)
                            {
                                UpdateNetStreamInfo(i, TRUE, FALSE);
                            }
                        }
                    }

                    if (cdda_stream)
                    {
                        FSOUND_Stream_Close(cdda_stream);
                        cdda_stream  = 0;
                        cdda_channel = -1;
                    }

                    DeleteAllCDTracks();

					/* 
                        Remember .. FSOUND_Close cleans up all DSP units, so if you still have pointers to them, 
					    it could cause problems (crashes) because they are pointing to freed data.
					    This is why there is a call to CloseDSP above.
                    */
					FSOUND_Close();

					/*
                        Call up dialog box to select sound options
                    */
					SoundDriver_Init(&outputfreq);

        			FSOUND_SetBufferSize(FSOUND_BUFFERSIZE);

					/*
                        Initialize FSOUND
                    */

					if (!FSOUND_Init(outputfreq,NUMCHANNELS, FSOUND_INIT_GLOBALFOCUS))
					{
    					MessageBox(hwnd, FMOD_ErrorString(FSOUND_GetError()), "FSOUND", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
    					return FALSE;
					}

                    FSOUND_Stream_Net_SetProxy(setting_http_proxy);
                    FSOUND_Stream_SetBufferSize(1000);

					InitDSP();

                    if (GraphicWindowCurrent == GRAPHICWINDOW_EQUALISER)
                    {
   					    FSOUND_DSP_SetActive(FSOUND_DSP_GetFFTUnit(), TRUE);
                    }
                    else if (GraphicWindowCurrent == GRAPHICWINDOW_WAVE)
                    {
   					    FSOUND_DSP_SetActive(OscUnit, TRUE);
                    }

					break;
				}
            }

            InvalidateRect(songlist_hwnd, NULL, FALSE);

			break;
		}

		case WM_DROPFILES :
		{
			HDROP			hDrop = (HDROP)wParam;
			int				numfiles, count;
			char			name[1024];
            Playlist       *p;
            int             i;
            struct _stat    buf;

			numfiles = DragQueryFile(hDrop, 0xFFFFFFFF, &name[0], 1024);
			if (!numfiles) 
				break;

			for (count=0; count<numfiles; count++)
			{
				DragQueryFile(hDrop, count, &name[0], 1024);

                if (_stat(name, &buf))
                {
                    continue;
                }

                if (!(buf.st_mode & _S_IFREG))
                {
                    continue;
                }

                p = ParsePlaylist(name);
                if (p)
                {
                    for (i=0;i < p->count;i++)
                    {
                        AddFileToSongList(p->name[i], p->displayname[i]);
                    }

                    FreePlaylist(p);
                }
                else
                {
                    AddFileToSongList(name, name);
                }
			}

			DragFinish(hDrop);
            SelectInfoWindow();

			break;
		}
		case WM_COPYDATA :
		{
            Playlist *p;
            char     *name;
            int       i;
            COPYDATASTRUCT *data;

            data = (COPYDATASTRUCT *)lParam;
            if (data->cbData)
            {
                char tmp[2048];

		        strcpy(tmp, (char *)data->lpData);
                name = tmp;

                if (*name == '"')
                {
                    name++;
                }

                if (name[strlen(name) - 1] == '"')
                {
                    name[strlen(name) - 1] = 0;
                }

                p = ParsePlaylist(name);
                if (p)
                {
                    for (i=0;i < p->count;i++)
                    {
                        AddFileToSongList(p->name[i], p->displayname[i]);
                    }

                    FreePlaylist(p);
                }
                else
                {
                    AddFileToSongList(name, name);
                }
            }

            SelectInfoWindow();
			break;
		}

		case WM_TIMER :
		{
			char			s[256];
			HDC				hdc = GetDC(hwnd);
			HFONT			myfont;
			FMUSIC_MODULE	*mod;
			FSOUND_STREAM	*stream;
			int				songid;
			int				greyoutfilters;

			greyoutfilters = FALSE;

			myfont = GetStockObject(DEFAULT_GUI_FONT);
			SelectObject(hdc, myfont);

			SetBkColor(hdc, GetSysColor(COLOR_3DFACE));
			SetTextColor(hdc, RGB(0, 0, 255));

			sprintf(s, "%03d", FSOUND_GetChannelsPlaying());
			TextOut(hdc, (int)(TEXT_CHANNELSPLAYING_X * scalex), (int)(TEXT_CHANNELSPLAYING_Y * scaley), s, (int)strlen(s));

			sprintf(s, "%5.02f%% ", FSOUND_GetCPUUsage());
			TextOut(hdc, (int)(TEXT_CPUUSAGE_X * scalex), (int)(TEXT_CPUUSAGE_Y * scaley), s, (int)strlen(s));

			/*
                DSP BUTTONS
            */
			if (DSP_Ready)
			{
				int count;

				/*
                    If the unit is inactive and the checkbox is checked, then clear preverb buffer
				    this stops any old preverb dregs hanging around.
                */
				if (!FSOUND_DSP_GetActive(PreverbTap[0].Unit) && (char)Button_GetCheck(GetDlgItem(hwnd,IDC_PREVERB)))
				{
					for (count=0; count < PREVERB_NUMTAPS; count++)
                    {
						memset(PreverbTap[count].historybuff, 0, PreverbTap[count].historylen<<2);	/* preverblen is in samples. */
                    }
				}
				for (count=0; count < PREVERB_NUMTAPS; count++)
                {
					FSOUND_DSP_SetActive(PreverbTap[count].Unit, (char)Button_GetCheck(GetDlgItem(hwnd,IDC_PREVERB)));
                }

				/*
                    If the unit is inactive and the checkbox is checked, then clear reverb buffer
                    this stops any old reverb dregs hanging around.
                */
				if (!FSOUND_DSP_GetActive(ReverbTap[0].Unit) && (char)Button_GetCheck(GetDlgItem(hwnd,IDC_REVERB)))
				{
					for (count=0; count < REVERB_NUMTAPS; count++)
                    {
						memset(ReverbTap[count].historybuff, 0, ReverbTap[count].historylen<<2);	/* preverblen is in samples. */
                    }
				}
				for (count=0; count < REVERB_NUMTAPS; count++)
				{
					FSOUND_DSP_SetActive(ReverbTap[count].Unit, (char)Button_GetCheck(GetDlgItem(hwnd,IDC_REVERB)));
				}

				
				/*
                    MIDI reverb uses the reverb button as well
                */
				FMUSIC_SetReverb((char)Button_GetCheck(GetDlgItem(hwnd,IDC_REVERB)));


				/*
                    If the unit is inactive and the checkbox is checked, then clear echo buffer
				    this stops any old echo dregs hanging around.
                */
				if (!FSOUND_DSP_GetActive(EchoUnit) && (char)Button_GetCheck(GetDlgItem(hwnd,IDC_ECHO)))
				{
					/*
                        Set status
                    */
					ShowWindow(GetDlgItem(mainhwnd,IDC_ECHOSLIDER), SW_SHOW);
					memset(EchoBuffer, 0, MAXECHOLEN);	/* echolen is in samples. */

					SendMessage(GetDlgItem(mainhwnd,IDC_ECHOSLIDER), TBM_SETPOS, TRUE, EchoLen * 1000 / outputfreq);
				}
				if (FSOUND_DSP_GetActive(EchoUnit) && !(char)Button_GetCheck(GetDlgItem(hwnd,IDC_ECHO)))
                {
					ShowWindow(GetDlgItem(mainhwnd,IDC_ECHOSLIDER), SW_HIDE);
                }

				FSOUND_DSP_SetActive(EchoUnit, (char)Button_GetCheck(GetDlgItem(hwnd,IDC_ECHO)));



				if (!FSOUND_DSP_GetActive(LowPassUnit) && (char)Button_GetCheck(GetDlgItem(hwnd,IDC_LOWPASS)))
				{
					/*
                        Set status
                    */
					ShowWindow(GetDlgItem(mainhwnd,IDC_CUTOFFSLIDER), SW_SHOW);
					ShowWindow(GetDlgItem(mainhwnd,IDC_RESOSLIDER), SW_SHOW);

					SendMessage(GetDlgItem(mainhwnd,IDC_CUTOFFSLIDER), TBM_SETPOS, TRUE, 520 - (int)(LowPassCutoffFrequency / 10.0f));
					SendMessage(GetDlgItem(mainhwnd,IDC_RESOSLIDER), TBM_SETPOS, TRUE, 520 - (int)(LowPassResonance * 50.0f));
				}
				if (FSOUND_DSP_GetActive(LowPassUnit) && !(char)Button_GetCheck(GetDlgItem(hwnd,IDC_LOWPASS)))
				{
					ShowWindow(GetDlgItem(mainhwnd,IDC_CUTOFFSLIDER), SW_HIDE);
					ShowWindow(GetDlgItem(mainhwnd,IDC_RESOSLIDER), SW_HIDE);
				}

				FSOUND_DSP_SetActive(LowPassUnit, (char)Button_GetCheck(GetDlgItem(hwnd,IDC_LOWPASS)));
			}

			/*
                Check PLAYLIST checkbox
            */
			if (Button_GetCheck(GetDlgItem(hwnd,IDC_PLAYLIST)))
			{
				mod = song[playlistsong].mod;
				if (mod)
				{
					if (FMUSIC_IsFinished(mod))
					{
						FMUSIC_StopSong(mod);
                        PlayNextSong();
					}
				}
				else 
				{
					stream = song[playlistsong].stream;
					if (stream)
					{
						int off = FSOUND_Stream_GetTime(stream);
						int len = FSOUND_Stream_GetLengthMs(stream);

                        if ((!song[playlistsong].url) || (song[playlistsong].url && (FSOUND_Stream_GetOpenState(song[playlistsong].stream) == 0)))
                        {
						    if (off >= len)
						    {
                                if (song[playlistsong].url)
                                {
							        FSOUND_Stream_Close(stream);
                                    song[playlistsong].stream = 0;
                                }
                                else
                                {
							        FSOUND_Stream_Stop(stream);
                                }

                                song[playlistsong].channel = -1;

                                PlayNextSong();
                            }
                        }
					}
                    else
                    {
                        if (song[playlistsong].cdtrack)
                        {
                            if (setting_cdda)
                            {
                                if ((song[playlistsong].channel != -1) && cdda_stream && (FSOUND_Stream_GetOpenState(cdda_stream) == 0))
                                {
                                    int off = FSOUND_Stream_GetTime(cdda_stream);
                                    int len = FSOUND_Stream_GetLengthMs(cdda_stream);

    					            if (off >= len)
						            {
							            StopCDTrack();
                                        PlayNextSong();
                                    }
                                }
                            }
                            else
                            {
                                int off = FSOUND_CD_GetTrackTime(cddevice);
                                int len = FSOUND_CD_GetTrackLength(cddevice, FSOUND_CD_GetTrack(cddevice));
    					        if (off >= len)
						        {
							        StopCDTrack();
                                    PlayNextSong();
                                }
                            }
                        }
                    }
				}
			}

			songid = (int)SendMessage(songlist_hwnd, LB_GETCURSEL, 0, 0);
			if (songid >= 0)
			{
                unsigned int lengthms, currtime;
                signed char playing = FALSE;

				if (song[songid].mod)
				{
                    mod = song[songid].mod;
                    UpdateModInfo(songid, FALSE);
					SendMessage(GetDlgItem(hwnd,IDC_PROGRESS1), PBM_SETRANGE, 0, MAKELPARAM(0, FMUSIC_GetNumOrders(mod)-1));
					SendMessage(GetDlgItem(hwnd,IDC_PROGRESS1), PBM_SETPOS, FMUSIC_GetOrder(mod), 0);

					/*
                        Grey out fx buttons for midi
                    */
					if (FMUSIC_GetType(mod) == FMUSIC_TYPE_MIDI)
                    {
						greyoutfilters = TRUE;
                    }

                    playing = FMUSIC_IsPlaying(mod);
				}
				else if (song[songid].url)
                {
                    UpdateNetStreamInfo(songid, FALSE, FALSE);

                    if (song[songid].stream && (song[songid].channel != -1))
                    {
                        playing = FSOUND_IsPlaying(song[songid].channel);
                    }
                }
                else if (song[songid].stream)
                {
                    UpdateStreamInfo(songid, FALSE);

                    currtime = FSOUND_Stream_GetTime(song[songid].stream);
                    lengthms = FSOUND_Stream_GetLengthMs(song[songid].stream);

					SendMessage(GetDlgItem(hwnd,IDC_PROGRESS1), PBM_SETRANGE, 0, MAKELPARAM(0, 1000) );
					SendMessage(GetDlgItem(hwnd,IDC_PROGRESS1), PBM_SETPOS, (WPARAM)((float)currtime / (float)lengthms * 1000.0f), 0);

                    if (song[songid].channel != -1)
                    {
                        playing = FSOUND_IsPlaying(song[songid].channel);
                        if (currtime >= lengthms)
                        {
                            playing = FALSE;
                        }
                    }
                }
                else if (song[songid].cdtrack)
                {
                    UpdateCDInfo(songid, TRUE);

                    if (setting_cdda)
                    {
                        if ((song[songid].channel != -1) && cdda_stream)
                        {
                            currtime = FSOUND_Stream_GetTime(cdda_stream);
                            lengthms = FSOUND_Stream_GetLengthMs(cdda_stream);
                            SendMessage(GetDlgItem(hwnd,IDC_PROGRESS1), PBM_SETRANGE, 0, MAKELPARAM(0, 1000) );
                            SendMessage(GetDlgItem(hwnd,IDC_PROGRESS1), PBM_SETPOS, (WPARAM)((float)currtime / (float)lengthms * 1000.0f), 0);

                            playing = FSOUND_IsPlaying(song[songid].channel);
                        }
                        else
                        {
                            currtime = 0;
                            lengthms = 1;
                            SendMessage(GetDlgItem(hwnd,IDC_PROGRESS1), PBM_SETRANGE, 0, MAKELPARAM(0, 1000) );
					        SendMessage(GetDlgItem(hwnd,IDC_PROGRESS1), PBM_SETPOS, (WPARAM)((float)currtime / (float)lengthms * 1000.0f), 0);
                        }
                    }
                    else
                    {
                        if (song[songid].cdtrack == FSOUND_CD_GetTrack(cddevice))
                        {
                            currtime = FSOUND_CD_GetTrackTime(cddevice);
                            lengthms = FSOUND_CD_GetTrackLength(cddevice, FSOUND_CD_GetTrack(cddevice));
                            SendMessage(GetDlgItem(hwnd,IDC_PROGRESS1), PBM_SETRANGE, 0, MAKELPARAM(0, 1000) );
					        SendMessage(GetDlgItem(hwnd,IDC_PROGRESS1), PBM_SETPOS, (WPARAM)((float)currtime / (float)lengthms * 1000.0f), 0);

                            if (FSOUND_CD_GetTrack(cddevice))
                            {
                                playing = TRUE;
                            }
                        }
                        else
                        {
                            currtime = 0;
                            lengthms = 1;
                            SendMessage(GetDlgItem(hwnd,IDC_PROGRESS1), PBM_SETRANGE, 0, MAKELPARAM(0, 1000) );
					        SendMessage(GetDlgItem(hwnd,IDC_PROGRESS1), PBM_SETPOS, (WPARAM)((float)currtime / (float)lengthms * 1000.0f), 0);
                        }
                    }
                }

                if (!playing)
                {
                    if (!play_button_play)
                    {
                        SetWindowText(GetDlgItem(hwnd, IDC_PLAY), "Play");
                        play_button_play = TRUE;
                    }
                }
                else
                {
                    if (play_button_play)
                    {
                        SetWindowText(GetDlgItem(hwnd, IDC_PLAY), "Stop");
                        play_button_play = FALSE;
                    }
                }

				/*
                    Set position of the master volume slider
                */
				if (song[songid].mod)
                {
					SendMessage(GetDlgItem(hwnd,IDC_SLIDER1), TBM_SETPOS, TRUE, FMUSIC_GetMasterVolume(mod));
                }
				else if (song[songid].cdtrack && !setting_cdda)
                {
					SendMessage(GetDlgItem(hwnd,IDC_SLIDER1), TBM_SETPOS, TRUE, FSOUND_CD_GetVolume(cddevice));
                }
                else
                {
					SendMessage(GetDlgItem(hwnd,IDC_SLIDER1), TBM_SETPOS, TRUE, FSOUND_GetVolume(song[songid].channel));
                }
			}

            /*
                Update song listbox entries if the open state has changed
            */
            {
                int numsongs = (int)SendMessage(songlist_hwnd, LB_GETCOUNT, 0, 0);
                int count;

                for (count = 0; count < numsongs; count++)
                {
                    int status = -2;

                    if (song[count].url)
                    { 
                        UpdateNetStreamInfo(count, FALSE, TRUE);
                    }
                    
                    if (song[count].stream)
                    { 
                        status = FSOUND_Stream_GetOpenState(song[count].stream);
                    }
                    else if (song[count].mod)
                    {
                        status = FMUSIC_GetOpenState(song[count].mod);
                    }

                    if (status != song[count].last_status)
                    {
                        if (song[count].stream && !song[count].url && !status)
                        {
                            UpdateStreamInfo(count, TRUE);
                        }

	                    SendMessage(songlist_hwnd, LB_SETITEMDATA, count, 0);
                        InvalidateRect(songlist_hwnd, 0, FALSE);
                    }
                    song[count].last_status = status;
                }
            }

			if (greyoutfilters)
			{
				EnableWindow(GetDlgItem(hwnd,IDC_LOWPASS), FALSE);
				EnableWindow(GetDlgItem(hwnd,IDC_PREVERB), FALSE);
				EnableWindow(GetDlgItem(hwnd,IDC_ECHO), FALSE);
			}
			else
			{
				EnableWindow(GetDlgItem(hwnd,IDC_LOWPASS), TRUE);
				EnableWindow(GetDlgItem(hwnd,IDC_PREVERB), TRUE);
				EnableWindow(GetDlgItem(hwnd,IDC_ECHO), TRUE);
			}

            if (GraphicWindowCurrent == GRAPHICWINDOW_EQUALISER)
            {
                PlotSpectrum(hdc);
            }
            else if (GraphicWindowCurrent == GRAPHICWINDOW_WAVE)
            {
                PlotOscilliscope(hdc);
            }

            if (setting_cdda)
            {
                if (cdda_stream)
                {
                    if (FSOUND_Stream_GetOpenState(cdda_stream) == -3)
                    {
                        FSOUND_Stream_Close(cdda_stream);
                        cdda_stream = 0;
                        cdda_channel = -1;
                        MessageBox(0, "ERROR: Unable to open CDDA stream", "Error", MB_ICONHAND | MB_OK | MB_SYSTEMMODAL);
                    }
                    else
                    {
                        if ((cdda_stream_state != 0) && (FSOUND_Stream_GetOpenState(cdda_stream) == 0))
                        {
                            char *tag;

                            cdda_stream_state = 0;

                            if (FSOUND_Stream_FindTagField(cdda_stream, FSOUND_TAGFIELD_ASF + 1, "CD_ERROR", (void **)&tag, 0))
                            {
                                MessageBox(mainhwnd, tag, "Error", MB_ICONHAND|MB_OK|MB_SYSTEMMODAL);
                                FSOUND_Stream_Close(cdda_stream);
                                cdda_stream  = 0;
                                cdda_channel = -1;
                            }
                            else
                            {
                                FSOUND_Stream_SetSubStream(cdda_stream, 0);
                                while (FSOUND_Stream_GetOpenState(cdda_stream) != 0)
                                {
                                    Sleep(100);
                                }

                            	InvalidateRect(songlist_hwnd, 0, FALSE);
                            }
                        }
                        if (cdda_stream)
                        {
                            if (FSOUND_Stream_GetLengthMs(cdda_stream) && !DraggingCDSlider)
                            {
			                    SendMessage(GetDlgItem(hwnd,IDC_CDTIME), TBM_SETPOS, TRUE, (int)((float)FSOUND_Stream_GetTime(cdda_stream) * 1000.0f / (float)FSOUND_Stream_GetLengthMs(cdda_stream)));
                            }
                        }
                    }
                }
            }
            else
            {
                if (FSOUND_CD_GetTrack(cddevice))
                {
                    if (FSOUND_CD_GetTrackLength(cddevice, FSOUND_CD_GetTrack(cddevice)) && !DraggingCDSlider)
                    {
			            SendMessage(GetDlgItem(hwnd,IDC_CDTIME), TBM_SETPOS, TRUE, (int)((float)FSOUND_CD_GetTrackTime(cddevice) * 1000.0f / (float)FSOUND_CD_GetTrackLength(cddevice, FSOUND_CD_GetTrack(cddevice))));
                    }
                }
            }

			DeleteObject(myfont);
			ReleaseDC(hwnd, hdc);
			break;
		}

        case WM_MEASUREITEM: 
        {
            LPMEASUREITEMSTRUCT lpmis = (LPMEASUREITEMSTRUCT) lParam; 
            TEXTMETRIC m;
            HDC hdc;
 
            hdc = GetDC(hwnd);

            GetTextMetrics(hdc, &m);                      

            ReleaseDC(hwnd, hdc);

            lpmis->itemHeight = m.tmAscent;
            return TRUE; 
        }
        case WM_DRAWITEM:
        {
            DRAWITEMSTRUCT FAR *pDIS;
            DWORD crBack;
            DWORD crText;
            HBRUSH hbrBack;
            char szBuf[MAX_PATH];
            int state;

            #define PHDC (pDIS->hDC)
            #define PRC  (pDIS->rcItem)

            pDIS = (DRAWITEMSTRUCT FAR *)lParam;

            if (pDIS->itemID < 0)
            {
                break;

            }
            memset(szBuf, 0, MAX_PATH);

            /* Draw the focus rectangle for an empty list box or an
                empty combo box to indicate that the control has the
                focus
            */ 
            if ((int)(pDIS->itemID) < 0)
            {
                switch(pDIS->CtlType)
                {
                    case ODT_LISTBOX:
                    {
                        if ((pDIS->itemAction) & (ODA_FOCUS))
                        {
                            DrawFocusRect (PHDC, &PRC);
                        }
                        break;
                    }
                    case ODT_COMBOBOX:
                    {
                        if ((pDIS->itemState) & (ODS_FOCUS))
                        {
                            DrawFocusRect (PHDC, &PRC);
                        }
                        break;
                    }
                }
                return TRUE;
            }

            /* Get the string */ 
            switch(pDIS->CtlType)
            {
                case ODT_LISTBOX:
                {
                    SendMessage ( pDIS->hwndItem, LB_GETTEXT, pDIS->itemID, (LPARAM)(LPSTR)szBuf);
                    break;
                }
                case ODT_COMBOBOX:
                {
                    SendMessage ( pDIS->hwndItem, CB_GETLBTEXT, pDIS->itemID, (LPARAM)(LPSTR)szBuf);
                    break;
                }
            }


            if ((pDIS->itemState) & (ODS_SELECTED))
            {
                /* Set background and text colors for selected item */ 
                crBack = GetSysColor (COLOR_HIGHLIGHT);
            }
            else
            {
                /* Set background and text colors for unselected item */ 
                crBack = GetSysColor (COLOR_WINDOW);
            }

            if (song[pDIS->itemID].mod)
            {
                state = FMUSIC_GetOpenState(song[pDIS->itemID].mod);
            }
            if (song[pDIS->itemID].stream)
            {
                state = FSOUND_Stream_GetOpenState(song[pDIS->itemID].stream);
            }
            if (song[pDIS->itemID].cdtrack)
            {
                if (setting_cdda && cdda_stream)
                {
                    state = FSOUND_Stream_GetOpenState(cdda_stream);
                }
                else
                {
                    state = 0;
                }
            }

            switch (state)
            {
                case  0:  crText = (pDIS->itemState & ODS_SELECTED) ? GetSysColor(COLOR_HIGHLIGHTTEXT) : GetSysColor(COLOR_WINDOWTEXT) ; break;
                case -1:  crText = (pDIS->itemState & ODS_SELECTED) ? GetSysColor(COLOR_HIGHLIGHTTEXT) : RGB(255, 0,   0)              ; break;
                case -2:  crText = (pDIS->itemState & ODS_SELECTED) ? GetSysColor(COLOR_HIGHLIGHTTEXT) : RGB(192, 192, 192)            ; break;
                case -3:  crText = (pDIS->itemState & ODS_SELECTED) ? GetSysColor(COLOR_HIGHLIGHTTEXT) : RGB(255, 0,   0)              ; break;
                case -4:  crText = (pDIS->itemState & ODS_SELECTED) ? GetSysColor(COLOR_HIGHLIGHTTEXT) : RGB(0,   0,   255)            ; break;
                case -5:  crText = (pDIS->itemState & ODS_SELECTED) ? GetSysColor(COLOR_HIGHLIGHTTEXT) : RGB(0,   0,   255)            ; break;
            }

            // Fill item rectangle with background color
            hbrBack = CreateSolidBrush (crBack);
            FillRect (PHDC, &PRC, hbrBack);
            DeleteObject (hbrBack);

            // Set current background and text colors
            SetBkColor (PHDC, crBack);
            SetTextColor (PHDC, crText);

            // TextOut uses current background and text colors
            TextOut ( PHDC, PRC.left, PRC.top, szBuf, lstrlen(szBuf));

            /* If enabled item has the input focus, call DrawFocusRect to set or clear the focus rectangle */ 
            if ((pDIS->itemState) & (ODS_FOCUS))
            {
                DrawFocusRect (PHDC, &PRC);
            }
            break;
        }
		default:
        {
			return FALSE;
        }
	}

	return FALSE;
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
#ifdef _WIN64
INT_PTR CALLBACK FMOD_StreamDetailsDlgProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
#else
BOOL CALLBACK FMOD_StreamDetailsDlgProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
#endif
{
	switch (msg)
	{
        case WM_INITDIALOG :
        {
            RECT r;
            char str[8192];
            char tmp[4096];
            int songid, numinfo, i, bitrate;
            signed char twotabs = FALSE;

            songid = (int)SendMessage(songlist_hwnd, LB_GETCURSEL, 0, 0);
            str[0] = 0;

            FSOUND_Stream_GetNumTagFields(song[songid].stream, &numinfo);

            for (i=0;i < numinfo;i++)
            {
                char *name, *value;
                int  type, length;
                char *str_streaminfotype[6] = 
                {
                    "VORBIS",
                    "ID3V1",
                    "ID3V2",
                    "SHOUTcast",
                    "Icecast",
                    "ASF"
                };

                if (FSOUND_Stream_GetTagField(song[songid].stream, i, &type, &name, &value, &length))
                {
                    if (type == FSOUND_TAGFIELD_SHOUTCAST)
                    {
                        twotabs = TRUE;
                    }

                    if (type == FSOUND_TAGFIELD_ID3V2 && ((name[0] == 'T' && value[0] == 0) || !strncmp(name, "COMM", 4)))
                    {
                        char tmp2[2048];
                        int offset = 0;

                        if (name[0] == 'T' && value[0] == 0)
                        {
                            offset = 1;
                        }
                        else if (!strncmp(name, "COMM", 4) && length > 8)
                        {
                            offset = 8;     /* a quick hack to skip the COMM tag stuff at the start (language etc), check id3.org for more */
                        }

                        strncpy(tmp2, value + offset, length - offset);

                        tmp2[length - 1] = 0;

                        sprintf(tmp, "%s\t%s = %s  (%d bytes)\r\n", str_streaminfotype[type], name, tmp2, length);
                    }
                    else
                    {
                        if (type != FSOUND_TAGFIELD_SHOUTCAST)
                        {
                            sprintf(tmp, "%s%s%s = %s  (%d bytes)\r\n", str_streaminfotype[type], twotabs ? "\t\t" : "\t", name, value, length);
                        }
                        else
                        {
                            sprintf(tmp, "%s\t%s = %s  (%d bytes)\r\n", str_streaminfotype[type], name, value, length);
                        }
                    }

                    strcat(str, tmp);
                }
            }

            if (FSOUND_Stream_Net_GetStatus(song[songid].stream, 0, 0, &bitrate, 0))
            {
                sprintf(tmp, "Current bitrate : %d\r\n", bitrate);
                strcat(str, tmp);
            }

            SetWindowText(GetDlgItem(hwnd, IDC_STREAMDETAILSEDIT), str);
            PostMessage(GetDlgItem(hwnd, IDC_STREAMDETAILSEDIT), EM_SETSEL, 0, 0);
            GetClientRect(hwnd, &r);
            MoveWindow(GetDlgItem(hwnd, IDC_STREAMDETAILSEDIT), 0, 0, r.right, r.bottom, TRUE);

            return TRUE;
        }

		case WM_COMMAND :
			switch (LOWORD(wParam))
			{
				case IDOK :
				{
			        EndDialog(hwnd, 0);
			        return TRUE;
				}
            }
            break;

        case WM_SIZE :
            MoveWindow(GetDlgItem(hwnd, IDC_STREAMDETAILSEDIT), 0, 0, LOWORD(lParam), HIWORD(lParam), TRUE);
            return 0;

		case WM_CLOSE:
			EndDialog(hwnd, 0);
			return TRUE;

		default:
			return FALSE;
	}

	return FALSE;
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
#ifdef _WIN64
INT_PTR CALLBACK FMOD_InfoDlgProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
#else
BOOL CALLBACK FMOD_InfoDlgProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
#endif
{
	switch (msg)
	{
		case WM_COMMAND :
		{
			switch (LOWORD(wParam))
			{
				case IDC_NETSTREAMINFO_DETAILS :
				{
                    int songid = (int)SendMessage(songlist_hwnd, LB_GETCURSEL, 0, 0);
			        if ((songid >= 0) && song[songid].stream)
                    {
                        DialogBox(g_hinst, MAKEINTRESOURCE(IDD_STREAMDETAILSDLG), mainhwnd, FMOD_StreamDetailsDlgProc);
                    }
					break;
				}
            }
            break;
        }

		case WM_CLOSE:
		{
			EndDialog(hwnd, 0);
			return TRUE;
		}

		default:
			return FALSE;
	}

	return FALSE;
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
#ifdef _WIN64
INT_PTR CALLBACK FMOD_LoadURLDlgProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
#else
BOOL CALLBACK FMOD_LoadURLDlgProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
#endif
{
	switch (msg)
	{
		case WM_INITDIALOG :
		{
            int i;
            HWND h = GetDlgItem(hwnd, IDC_URLCOMBO);

            ComboBox_ResetContent(h);

            for (i=0;i < MRU_MAX;i++)
            {
                if (!mru[i])
                {
                    break;
                }

                ComboBox_AddString(h, mru[i]);
            }

            url_to_load[0] = 0;
			SetFocus(hwnd);
			return TRUE;
		}

		case WM_COMMAND:
		{
			switch (LOWORD(wParam))
			{
				case IDOK :
				{
                    ComboBox_GetText(GetDlgItem(hwnd, IDC_URLCOMBO), url_to_load, 4095);
                    if (strlen(url_to_load))
                    {
                        AddToMRU(url_to_load);
                    }
					EndDialog(hwnd, 1);
					return TRUE;
				}

				case IDCANCEL :
				{
					EndDialog(hwnd, 0);
					return TRUE;
				}
            }
            break;
        }

    	case WM_CLOSE :
		{
			EndDialog(hwnd, 0);
			return TRUE;
		}

		default:
			return FALSE;
	}

	return FALSE;
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
BOOL AddToMRU(char *url)
{
    int i, j;

    for (i=0;i < MRU_MAX;i++)
    {
        if (!mru[i])
        {
            break;
        }
        else
        {
            if (!strcmp(mru[i], url))
            {
                if (i)
                {
                    char *tmp = mru[i];
                    for (j=i;j > 0;j--)
                    {
                        mru[j] = mru[j - 1];
                    }
                    mru[0] = tmp;
                }

                return TRUE;
            }
        }
    }

    for (i=MRU_MAX - 1;i > 0;i--)
    {
        mru[i] = mru[i - 1];
    }

    mru[0] = strdup(url);

    return FALSE;
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
BOOL UpdateStreamInfo(int songid, BOOL forceupdate)
{
    char                s[256];
    static int          last_songid = -1;
    static unsigned int last_pos    = -1;
    static int          last_time   = -1;
    BOOL                update = forceupdate;
    FSOUND_STREAM      *stream;

    if (!song[songid].stream)
    {
        return FALSE;
    }

    stream = song[songid].stream;

    if (songid != last_songid)
    {
        update = TRUE;
    }
    
    if (update)
    {
        sprintf(s, "Name\t%s", FSOUND_Sample_GetName(FSOUND_Stream_GetSample(stream)));
        SetWindowText(GetDlgItem(streaminfo_hwnd, IDC_STREAMINFO_NAME), s);
    }

    if ((last_pos != FSOUND_Stream_GetPosition(stream)) || update)
    {
        sprintf(s, "Pos\t%d/%d", FSOUND_Stream_GetPosition(stream), FSOUND_Stream_GetLength(stream));
        SetWindowText(GetDlgItem(streaminfo_hwnd, IDC_STREAMINFO_POSITION), s);
    }

    if ((last_time != FSOUND_Stream_GetTime(stream)) || update)
    {
        sprintf(s, "Pos\t%d/%d", FSOUND_Stream_GetPosition(stream), FSOUND_Stream_GetLength(stream));
        SetWindowText(GetDlgItem(streaminfo_hwnd, IDC_STREAMINFO_POSITION), s);
        sprintf(s, "Time\t%02d:%02d/%02d:%02d", FSOUND_Stream_GetTime(stream) / 1000 / 60,
                                                FSOUND_Stream_GetTime(stream) / 1000 % 60,
                                                FSOUND_Stream_GetLengthMs(stream) / 1000 / 60,
                                                FSOUND_Stream_GetLengthMs(stream) / 1000 % 60);
        SetWindowText(GetDlgItem(streaminfo_hwnd, IDC_STREAMINFO_TIME), s);
    }

    last_time   = FSOUND_Stream_GetTime(stream);
    last_pos    = FSOUND_Stream_GetPosition(stream);
    last_songid = songid;

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
BOOL UpdateCDInfo(int songid, BOOL forceupdate)
{
    char                s[256];
    static int          last_songid = -1;
    static unsigned int last_time   = -1;
    BOOL                update = forceupdate;
    unsigned int        pos, length;

    if (!song[songid].cdtrack)
    {
        return FALSE;
    }

    if (setting_cdda && !cdda_stream)
    {
        return FALSE;
    }

    if (songid != last_songid)
    {
        update = TRUE;
    }
    
    if (update)
    {
        sprintf(s, "Name\tTrack %02d", song[songid].cdtrack);
        SetWindowText(GetDlgItem(cdinfo_hwnd, IDC_CDINFO_NAME), s);
    }

    if ((setting_cdda && (song[songid].channel != -1)) || (!setting_cdda && (FSOUND_CD_GetTrack(cddevice) == song[songid].cdtrack)))
    {
        pos    = setting_cdda ? FSOUND_Stream_GetTime(cdda_stream)     : FSOUND_CD_GetTrackTime(cddevice);
        length = setting_cdda ? FSOUND_Stream_GetLengthMs(cdda_stream) : FSOUND_CD_GetTrackLength(cddevice, FSOUND_CD_GetTrack(cddevice));

        if ((last_time != pos) || update)
        {
            sprintf(s, "Time\t%02d:%02d/%02d:%02d", pos / 1000 / 60,
                                                    pos / 1000 % 60,
                                                    length / 1000 / 60,
                                                    length / 1000 % 60);
            SetWindowText(GetDlgItem(cdinfo_hwnd, IDC_CDINFO_TIME), s);
        }
    }
    else
    {
        if (setting_cdda && (song[songid].channel == -1))
        {
            sprintf(s, "Time\t%02d:%02d/%02d:%02d", 0 / 1000 / 60,
                                                    0 / 1000 % 60,
                                                    song[songid].cdtrack_length / 1000 / 60,
                                                    song[songid].cdtrack_length / 1000 % 60);
            SetWindowText(GetDlgItem(cdinfo_hwnd, IDC_CDINFO_TIME), s);
        }
        else
        {
            sprintf(s, "Time\t%02d:%02d/%02d:%02d", 0 / 1000 / 60,
                                                    0 / 1000 % 60,
                                                    0 / 1000 / 60,
                                                    0 / 1000 % 60);
            SetWindowText(GetDlgItem(cdinfo_hwnd, IDC_CDINFO_TIME), s);
        }
    }

    last_time   = pos;
    last_songid = songid;

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
BOOL UpdateNetStreamInfo(int songid, BOOL forceupdate, BOOL forceqiuet)
{
    static int  last_songid       = -1;
    static int  last_read_percent = -1;
    signed char update            = forceupdate;
    int status, off, len, flags;
    char str[4096];
    char *tmp;

    if (!song[songid].url)
    {
        return FALSE;
    }

    if (song[songid].stream)
    {
        int ret = FSOUND_Stream_GetOpenState(song[songid].stream);
        if ((ret == -3) || (ret == -1))
        {
            status = FSOUND_STREAM_NET_ERROR;
            if (song[songid].last_netstatus != status)
            {
                char *s;

                if (song[songid].server_status)
                {
                    free(song[songid].server_status);
                    song[songid].server_status = 0;
                }

                s = FSOUND_Stream_Net_GetLastServerStatus();
                if (s)
                {
                    song[songid].server_status = strdup(s);
                }
            }
        }
        else
        {
            FSOUND_Stream_Net_GetStatus(song[songid].stream, &status, 0, 0, 0);

            if ((status == FSOUND_STREAM_NET_READY) && (song[songid].channel == -1))
            {
                song[songid].channel = FSOUND_Stream_Play(FSOUND_FREE, song[songid].stream);
                if (song[songid].channel != -1)
                {
                    FSOUND_Stream_Net_SetMetadataCallback(song[songid].stream, MetadataCallback, (void *)songid);
                    update = TRUE;
                }
            }

            if (FSOUND_Stream_GetOpenState(song[songid].stream) == 0)
            {
				off = FSOUND_Stream_GetTime(song[songid].stream);
				len = FSOUND_Stream_GetLengthMs(song[songid].stream);

				if (off >= len)
                {
                    FSOUND_Stream_Close(song[songid].stream);
                    song[songid].stream  = 0;
                    song[songid].channel = -1;
                    song[songid].last_status = -2;
                }
            }
        }
    }
    else
    {
        status = FSOUND_STREAM_NET_NOTCONNECTED;
    }

    if ((songid != last_songid) || (status != song[songid].last_netstatus))
    {
        update = TRUE;
    }

    if (song[songid].metadata)
    {
        song[songid].metadata = 0;
        update = TRUE;
    }

    last_songid = songid;
    song[songid].last_netstatus = status;

    if (!forceqiuet)
    {
        if (update)
        {
            SetWindowText(GetDlgItem(netstreaminfo_hwnd, IDC_NETSTREAMINFO_STREAM),   "Stream");
            SetWindowText(GetDlgItem(netstreaminfo_hwnd, IDC_NETSTREAMINFO_TRACK),    "Track");
            SetWindowText(GetDlgItem(netstreaminfo_hwnd, IDC_NETSTREAMINFO_PROTOCOL), "Proto");
            SetWindowText(GetDlgItem(netstreaminfo_hwnd, IDC_NETSTREAMINFO_FORMAT),   "Format");
            SetWindowText(GetDlgItem(netstreaminfo_hwnd, IDC_NETSTREAMINFO_STATUS),   "Status");

	        if (!song[songid].url)
            {
                return TRUE;
            }

            switch (status)
            {
                case FSOUND_STREAM_NET_NOTCONNECTED :
                    SetWindowText(GetDlgItem(netstreaminfo_hwnd, IDC_NETSTREAMINFO_STATUS), "Status\tNot playing");
                    break;

                case FSOUND_STREAM_NET_CONNECTING :
                    SetWindowText(GetDlgItem(netstreaminfo_hwnd, IDC_NETSTREAMINFO_STATUS), "Status\tConnecting...");
                    break;

                case FSOUND_STREAM_NET_BUFFERING :
                    SetWindowText(GetDlgItem(netstreaminfo_hwnd, IDC_NETSTREAMINFO_STATUS), "Status\tBuffering...");
                    break;

                case FSOUND_STREAM_NET_ERROR :
                {
                    if (song[songid].server_status)
                    {
                        char tmp[1024];
                        sprintf(tmp, "Status\t%s", song[songid].server_status);
                        SetWindowText(GetDlgItem(netstreaminfo_hwnd, IDC_NETSTREAMINFO_STATUS), tmp);
                    }
                    else
                    {
                        SetWindowText(GetDlgItem(netstreaminfo_hwnd, IDC_NETSTREAMINFO_STATUS), "Status\tError");
                    }
                    break;
                }

                case FSOUND_STREAM_NET_READY :
                    SetWindowText(GetDlgItem(netstreaminfo_hwnd, IDC_NETSTREAMINFO_STATUS), "Status\tPlaying");
                    break;

                default :
                    SetWindowText(GetDlgItem(netstreaminfo_hwnd, IDC_NETSTREAMINFO_STATUS), "Status\tUnknown");
                    break;
            }

            if (status != FSOUND_STREAM_NET_NOTCONNECTED)
            {
                sprintf(str, "Track\t%s%s%s", song[songid].artist ? song[songid].artist : "", song[songid].title ? " - " : "", song[songid].title ? song[songid].title : "");
                SetWindowText(GetDlgItem(netstreaminfo_hwnd, IDC_NETSTREAMINFO_TRACK), str);

                if (song[songid].protocol)
                {
                    sprintf(str, "Proto\t%s", song[songid].protocol);
                    SetWindowText(GetDlgItem(netstreaminfo_hwnd, IDC_NETSTREAMINFO_PROTOCOL), str);
                }

                if (song[songid].format)
                {
                    sprintf(str, "Format\t%s", song[songid].format);
                    SetWindowText(GetDlgItem(netstreaminfo_hwnd, IDC_NETSTREAMINFO_FORMAT), str);
                }

                if (song[songid].streamname)
                {
                    sprintf(str, "Stream\t%s", song[songid].streamname);
                    SetWindowText(GetDlgItem(netstreaminfo_hwnd, IDC_NETSTREAMINFO_STREAM), str);
                }
            }
        }

        {
            int read_percent;

            FSOUND_Stream_Net_GetStatus(song[songid].stream, 0, &read_percent, 0, 0);
            if (read_percent != last_read_percent)
            {
			    SendMessage(GetDlgItem(mainhwnd, IDC_PROGRESS1), PBM_SETRANGE, 0, MAKELPARAM(0, 100) );
			    SendMessage(GetDlgItem(mainhwnd, IDC_PROGRESS1), PBM_SETPOS, (WPARAM)read_percent, 0);
            }
        }

        if (FSOUND_Stream_Net_GetStatus(song[songid].stream, 0, 0, 0, &flags))
        {
            if (!song[songid].protocol)
            {
                char *str_protocol[3] = 
                {
                    "SHOUTcast",
                    "Icecast",
                    "HTTP"
                };

                if (flags & FSOUND_PROTOCOL_SHOUTCAST)
                {
                    tmp = str_protocol[0];
                }
                else if (flags & FSOUND_PROTOCOL_ICECAST)
                {
                    tmp = str_protocol[1];
                }
                else if (flags & FSOUND_PROTOCOL_HTTP)
                {
                    tmp = str_protocol[2];
                }
                else
                {
                    tmp = 0;
                }

                if (tmp)
                {
                    song[songid].protocol = tmp;
                    sprintf(str, "Proto\t%s", tmp);
                    SetWindowText(GetDlgItem(netstreaminfo_hwnd, IDC_NETSTREAMINFO_PROTOCOL), str);
                }
            }

            if (!song[songid].format)
            {
                char *str_format[2] = 
                {
                    "MPEG Layer 3",
                    "Ogg Vorbis"
                };

                if (flags & FSOUND_FORMAT_MPEG)
                {
                    tmp = str_format[0];
                }
                else if (flags & FSOUND_FORMAT_OGGVORBIS)
                {
                    tmp = str_format[1];
                }
                else
                {
                    tmp = 0;
                }

                if (tmp)
                {
                    song[songid].format = tmp;
                    sprintf(str, "Format\t%s", tmp);
                    SetWindowText(GetDlgItem(netstreaminfo_hwnd, IDC_NETSTREAMINFO_FORMAT), str);
                }
            }

            if (!song[songid].streamname)
            {
                if (flags & FSOUND_PROTOCOL_SHOUTCAST)
                {
                    FSOUND_Stream_FindTagField(song[songid].stream, FSOUND_TAGFIELD_SHOUTCAST, "icy-name", &tmp, 0);
                }
                else if (flags & FSOUND_PROTOCOL_ICECAST)
                {
                    FSOUND_Stream_FindTagField(song[songid].stream, FSOUND_TAGFIELD_ICECAST, "ice-name", &tmp, 0);
                }
                else if (flags & FSOUND_PROTOCOL_HTTP)
                {
                    tmp = song[songid].url;
                }
                else
                {
                    tmp = 0;
                }

                if (tmp)
                {
                    song[songid].streamname = tmp;
                    sprintf(str, "Stream\t%s", tmp);
                    SetWindowText(GetDlgItem(netstreaminfo_hwnd, IDC_NETSTREAMINFO_STREAM), str);
                }
            }
        }
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
BOOL UpdateModInfo(int songid, BOOL forceupdate)
{
    char s[256];
    static int last_songid  = -1;
    static int last_speed   = -1;
    static int last_bpm     = -1;
    static int last_order   = -1;
    static int last_pattern = -1;
    static int last_row     = -1;
	char *type[] = 
	{
		"Unknown                      ",
		"Protracker / FastTracker     ",
		"ScreamTracker 3              ",
		"FastTracker 2                ",
		"Impulse Tracker              ",
		"MIDI                         ",
        "FMOD Sample Bank             "
	};
    FMUSIC_MODULE *mod = song[songid].mod;
    BOOL update = forceupdate;

    if (!song[songid].mod)
    {
        return FALSE;
    }

    if (songid != last_songid)
    {
        update = TRUE;
    }

    if (update)
    {
        sprintf(s, "Name\t%s", FMUSIC_GetName(mod));
        SetWindowText(GetDlgItem(modinfo_hwnd, IDC_MODINFO_NAME), s);

        sprintf(s, "Type\t%s", type[FMUSIC_GetType(mod)]);
        SetWindowText(GetDlgItem(modinfo_hwnd, IDC_MODINFO_TYPE), s);
    }

    if ((last_speed != FMUSIC_GetSpeed(mod)) || update)
    {
	    sprintf(s, "Speed\t%02d", FMUSIC_GetSpeed(mod));
        SetWindowText(GetDlgItem(modinfo_hwnd, IDC_MODINFO_SPEED), s);
    }

    if ((last_bpm != FMUSIC_GetBPM(mod)) || update)
    {
	    sprintf(s, "BPM\t%03d", FMUSIC_GetBPM(mod));
        SetWindowText(GetDlgItem(modinfo_hwnd, IDC_MODINFO_BPM), s);
    }

    if ((last_order != FMUSIC_GetOrder(mod)) || update)
    {
	    sprintf(s, "Order\t%03d / %03d", FMUSIC_GetOrder(mod), FMUSIC_GetNumOrders(mod));
        SetWindowText(GetDlgItem(modinfo_hwnd, IDC_MODINFO_ORDER), s);
    }

    if ((last_pattern != FMUSIC_GetPattern(mod)) || update)
    {
	    sprintf(s, "Pattern\t%03d / %03d", FMUSIC_GetPattern(mod), FMUSIC_GetNumPatterns(mod));
        SetWindowText(GetDlgItem(modinfo_hwnd, IDC_MODINFO_PATTERN), s);
    }

    if ((last_row != FMUSIC_GetRow(mod)) || (last_order != FMUSIC_GetOrder(mod)) || update)
    {
	    sprintf(s, "Row\t%03d / %03d", FMUSIC_GetRow(mod), FMUSIC_GetPatternLength(mod, FMUSIC_GetOrder(mod)));
        SetWindowText(GetDlgItem(modinfo_hwnd, IDC_MODINFO_ROW), s);
    }

    last_speed   = FMUSIC_GetSpeed(mod);
    last_bpm     = FMUSIC_GetBPM(mod);
    last_order   = FMUSIC_GetOrder(mod);
    last_pattern = FMUSIC_GetPattern(mod);
    last_row     = FMUSIC_GetRow(mod);
    last_songid  = songid;

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
void SelectInfoWindow()
{
    int songid;
    int songtype = SONGTYPE_NONE;

    ShowWindow(modinfo_hwnd,       SW_HIDE);
    ShowWindow(streaminfo_hwnd,    SW_HIDE);
    ShowWindow(netstreaminfo_hwnd, SW_HIDE);
    ShowWindow(cdinfo_hwnd,        SW_HIDE);

    if (GraphicWindowCurrent == GRAPHICWINDOW_MODINFO)
    {
	    songid = (int)SendMessage(songlist_hwnd, LB_GETCURSEL, 0, 0);
	    if (songid != LB_ERR) 
	    {
            songtype = song[songid].mod ? SONGTYPE_MOD : song[songid].url ? SONGTYPE_NETSTREAM : song[songid].stream ? SONGTYPE_STREAM : song[songid].cdtrack ? SONGTYPE_CD : SONGTYPE_NONE;
        }

        switch (songtype)
        {
            case SONGTYPE_MOD :
                SendMessage(GetDlgItem(mainhwnd, IDC_STATIC_INFO), WM_SETTEXT, 0, (LPARAM)(LPCTSTR)"Module Info");
        	    ShowWindow(modinfo_hwnd, SW_SHOW);
                break;

            case SONGTYPE_STREAM :
                SendMessage(GetDlgItem(mainhwnd, IDC_STATIC_INFO), WM_SETTEXT, 0, (LPARAM)(LPCTSTR)"Stream Info");
        	    ShowWindow(streaminfo_hwnd, SW_SHOW);
                break;

            case SONGTYPE_NETSTREAM :
                SendMessage(GetDlgItem(mainhwnd, IDC_STATIC_INFO), WM_SETTEXT, 0, (LPARAM)(LPCTSTR)"Net Stream Info");
        	    ShowWindow(netstreaminfo_hwnd, SW_SHOW);
                break;

            case SONGTYPE_CD :
                SendMessage(GetDlgItem(mainhwnd, IDC_STATIC_INFO), WM_SETTEXT, 0, (LPARAM)(LPCTSTR)"CD Track Info");
        	    ShowWindow(cdinfo_hwnd, SW_SHOW);
                break;

            case SONGTYPE_NONE :
                SendMessage(GetDlgItem(mainhwnd, IDC_STATIC_INFO), WM_SETTEXT, 0, (LPARAM)(LPCTSTR)"No file loaded");
                break;
        }
    }
}


/*
[API]
[
	[DESCRIPTION]

	[PARAMETERS]
 
	[RETURN_VALUE]

	[REMARKS]

	[SEE_ALSO]
]
*/
char SetupInterface(HINSTANCE hinst, LPSTR lpCmdLine)
{
	char			name[2048];
	RECT			r;
	int				desktop_height,desktop_width;
	int				window_height,window_width;
    int             i;

    for (i=0;i < MRU_MAX;i++)
    {
        mru[i] = 0;
    }

	LoadSettings();

	GetWindowRect(GetDesktopWindow(), &r);
	desktop_width = r.right - r.left;
	desktop_height = r.bottom - r.top;
	
	/*
        Fix up screwed up xy positions
    */
	if (setting_xpos > desktop_width || setting_xpos < 0)
    {
		setting_xpos = (desktop_width / 2)-320;
    }
	if (setting_ypos > desktop_height || setting_ypos < 0)
    {
		setting_ypos = (desktop_height / 2)-140;
    }

	mainhwnd = CreateDialog(hinst, MAKEINTRESOURCE(IDD_INTERFACE), GetDesktopWindow(), FMOD_DlgProc);

	ShowWindow(mainhwnd, SW_HIDE);

	sprintf(name, "FMOD %.2f", FMOD_VERSION);
    SetWindowText(mainhwnd, name);


	/*
        Set the icon
    */
#ifdef _WIN64
	SetClassLong(mainhwnd, GCLP_HICON, (LONG) LoadIcon(hinst, MAKEINTRESOURCE(IDI_ICON1)));
#else
	SetClassLong(mainhwnd, GCL_HICON, (LONG) LoadIcon(hinst, MAKEINTRESOURCE(IDI_ICON1)));
#endif

	GetWindowRect(mainhwnd, &r);
	MoveWindow(mainhwnd, setting_xpos, setting_ypos, r.right, r.bottom, TRUE);

	window_width = r.right - r.left;
	window_height = r.bottom - r.top;
	scalex = (float)window_width  / WINDOW_WIDTH;
	scaley = (float)window_height / WINDOW_HEIGHT;

    ShowWindow(mainhwnd, SW_SHOW);

	InitCommonControls();

	/*
        Set the range of the master volume slider
    */
	SendMessage(GetDlgItem(mainhwnd,IDC_SLIDER1), TBM_SETRANGE, TRUE, MAKELPARAM(0, 256));

	/*
        Set position of the master volume slider
    */
	SendMessage(GetDlgItem(mainhwnd,IDC_SLIDER1), TBM_SETPOS, TRUE, 256);

	/* 
        set the range of the echo slider
	    set position of the echo slider
	    set status
    */
	SendMessage(GetDlgItem(mainhwnd,IDC_ECHOSLIDER), TBM_SETRANGE, TRUE, MAKELPARAM(20, 500));
	SendMessage(GetDlgItem(mainhwnd,IDC_ECHOSLIDER), TBM_SETPOS, TRUE, 500);
	ShowWindow(GetDlgItem(mainhwnd,IDC_ECHOSLIDER), SW_HIDE);

	/*
        set the range of the cutoff freq slider
	    set position of the cutoff freq  slider
	    set status
    */
	SendMessage(GetDlgItem(mainhwnd,IDC_CUTOFFSLIDER), TBM_SETRANGE, TRUE, MAKELPARAM(20, 500));
	SendMessage(GetDlgItem(mainhwnd,IDC_CUTOFFSLIDER), TBM_SETPOS, TRUE, 20);
	ShowWindow(GetDlgItem(mainhwnd,IDC_CUTOFFSLIDER), SW_HIDE);

	/*
        set the range of the resonance slider
	    set position of the resonance slider
	    set status
    */
	SendMessage(GetDlgItem(mainhwnd,IDC_RESOSLIDER), TBM_SETRANGE, TRUE, MAKELPARAM(20, 500));
	SendMessage(GetDlgItem(mainhwnd,IDC_RESOSLIDER), TBM_SETPOS, TRUE, 500);
	ShowWindow(GetDlgItem(mainhwnd,IDC_RESOSLIDER), SW_HIDE);

	/*
        COMMAND LINE
    */
	if (strlen(lpCmdLine)) 
	{
        Playlist *p;
        int i;
        char *filename = name;

		strcpy(filename, lpCmdLine);

        if (*filename == '"')
        {
            filename++;
        }

        if (filename[strlen(filename) - 1] == '"')
        {
            filename[strlen(filename) - 1] = 0;
        }

		/*
            Open the file.
        */
        p = ParsePlaylist(filename);
        if (p)
        {
            for (i=0;i < p->count;i++)
            {
                AddFileToSongList(p->name[i], p->displayname[i]);
            }

            FreePlaylist(p);
        }
        else
        {
            AddFileToSongList(filename, filename);
        }
	}

	srand(clock());
	Button_SetCheck(GetDlgItem(mainhwnd,IDC_RADIOCONTINUOUS), TRUE);

    /*
	    Subclass the position slider so we can get the mouse messages and process them there
    */
#ifdef _WIN64
	oldprogressproc = (WNDPROC)GetWindowLong(GetDlgItem(mainhwnd, IDC_PROGRESS1), GWLP_WNDPROC);
	oldcdtimeproc   = (WNDPROC)GetWindowLong(GetDlgItem(mainhwnd, IDC_CDTIME), GWLP_WNDPROC);

    SetWindowLong(GetDlgItem(mainhwnd, IDC_PROGRESS1), GWLP_WNDPROC, (LONG)&ProgressWindowProc);
    SetWindowLong(GetDlgItem(mainhwnd, IDC_CDTIME),    GWLP_WNDPROC, (LONG)&CDTimeWindowProc);
#else
	oldprogressproc = (WNDPROC)GetWindowLong(GetDlgItem(mainhwnd, IDC_PROGRESS1), GWL_WNDPROC);
	oldcdtimeproc   = (WNDPROC)GetWindowLong(GetDlgItem(mainhwnd, IDC_CDTIME), GWL_WNDPROC);

    SetWindowLong(GetDlgItem(mainhwnd, IDC_PROGRESS1), GWL_WNDPROC, (LONG)&ProgressWindowProc);
    SetWindowLong(GetDlgItem(mainhwnd, IDC_CDTIME),    GWL_WNDPROC, (LONG)&CDTimeWindowProc);
#endif
	
    SetWindowText(GetDlgItem(mainhwnd, IDC_STATIC_INFO), "No file loaded");
    SetWindowText(GetDlgItem(mainhwnd, IDC_INFOWINDOW), "");

	streaminfo_hwnd = CreateDialog(hinst, MAKEINTRESOURCE(IDD_STREAMINFODLG), GetDlgItem(mainhwnd, IDC_INFOWINDOW), FMOD_InfoDlgProc);
	ShowWindow(streaminfo_hwnd, SW_HIDE);

	netstreaminfo_hwnd = CreateDialog(hinst, MAKEINTRESOURCE(IDD_NETSTREAMINFODLG), GetDlgItem(mainhwnd, IDC_INFOWINDOW), FMOD_InfoDlgProc);
	ShowWindow(netstreaminfo_hwnd, SW_HIDE);

	cdinfo_hwnd = CreateDialog(hinst, MAKEINTRESOURCE(IDD_CDINFODLG), GetDlgItem(mainhwnd, IDC_INFOWINDOW), FMOD_InfoDlgProc);
	ShowWindow(cdinfo_hwnd, SW_HIDE);

	modinfo_hwnd = CreateDialog(hinst, MAKEINTRESOURCE(IDD_MODINFODLG), GetDlgItem(mainhwnd, IDC_INFOWINDOW), FMOD_InfoDlgProc);
	ShowWindow(modinfo_hwnd, SW_HIDE);

    url_to_load[0] = 0;

	if (strlen(lpCmdLine))
    {
		int songid = (int)SendMessage(songlist_hwnd, LB_GETCURSEL, 0, 0);
        UpdateStreamInfo(songid, TRUE);
        UpdateNetStreamInfo(songid, TRUE, FALSE);
        UpdateModInfo(songid, TRUE);
        UpdateCDInfo(songid, TRUE);
        SelectInfoWindow();
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
void CloseDown() 
{
	int count, i;
	RECT r;
	int desktop_height, desktop_width;

	GetWindowRect(mainhwnd, &r);
	setting_xpos = r.left;
	setting_ypos = r.top;

	GetWindowRect(GetDesktopWindow(), &r);
	desktop_width = r.right - r.left;
	desktop_height = r.bottom - r.top;
	if (setting_xpos > desktop_width || setting_xpos < 0)
    {
		setting_xpos = (desktop_width / 2)-320;
    }
	if (setting_ypos > desktop_height || setting_ypos < 0)
    {
		setting_ypos = (desktop_height / 2)-140;
    }

	SaveSettings();

    for (i=0;i < MRU_MAX;i++)
    {
        if (mru[i])
        {
            free(mru[i]);
            mru[i] = 0;
        }
    }

	for (count=0; count<MAXSONGS; count++)
    {
        if (song[count].stream)
        {
		    FSOUND_Stream_Close(song[count].stream);
            song[count].stream = NULL;
        }

        if (song[count].mod)
        {
		    FMUSIC_FreeSong(song[count].mod);
            song[count].mod = NULL;
        }

        if (song[count].url)
        {
            free(song[count].url);
            song[count].url = NULL;
        }

        if (song[count].listname)
        {
            free(song[count].listname);
            song[count].listname = NULL;
        }

        if (song[count].server_status)
        {
            free(song[count].server_status);
            song[count].server_status = NULL;
        }

        if (song[count].title)
        {
            free(song[count].title);
            song[count].title = 0;
        }

        if (song[count].artist)
        {
            free(song[count].artist);
            song[count].artist = 0;
        }
    }

    if (cdda_stream)
    {
        FSOUND_Stream_Close(cdda_stream);
        cdda_stream = 0;
    }

	FSOUND_Close();
}


/*
	[NAME]

	[DESCRIPTION]

	[PARAMETERS]
 
	[RETURN_VALUE]

	[REMARKS]

	[SEE_ALSO]
*/
int PASCAL WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow) 
{
    MSG  msg;
    char name[1024];
    HWND hwnd;
    COPYDATASTRUCT data;

    g_hinst = hInstance;

	sprintf(name, "FMOD %.2f", FMOD_VERSION);
    hwnd = FindWindow(0, name);
    if (hwnd)
    {
        if (IsIconic(hwnd))
        {
            ShowWindow(hwnd, SW_RESTORE);
        }
        else
        {
            SetActiveWindow(hwnd);
        }

        if (strlen(lpCmdLine))
        {
            data.dwData = 0;
            data.cbData = (int)strlen(lpCmdLine) + 1;
            data.lpData = lpCmdLine;
            SendMessage(hwnd, WM_COPYDATA, 0, (LPARAM)&data);
        }

        return 0;
    }

	if (FSOUND_GetVersion() < FMOD_VERSION)
    {
		MessageBox(GetForegroundWindow(), "INCORRECT DLL VERSION!!", "FMOD ERROR", MB_OK);
    }

    /*
        Initialize
    */
	if (!SetupInterface(hInstance, lpCmdLine)) return FALSE;

  	while (GetMessage( &msg, 0, 0, 0 ))
	{
    	TranslateMessage( &msg );
      	DispatchMessage( &msg );
  	}

	return (int)msg.wParam;
}
