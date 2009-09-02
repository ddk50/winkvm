#ifndef _FSBANKLIB_H
#define _FSBANKLIB_H

/*
[ENUM]
[
    [DESCRIPTION]   
    Errorcode returned by all FSBank commands
    
    [SEE_ALSO]      
]
*/
typedef enum FSBANK_RESULT
{
    FSBANK_OK,
    FSBANK_ERR_INIT,                // Failed to initialize 
    FSBANK_ERR_UNINITIALIZED,       // FSBank_Init hasnt been called yet.
    FSBANK_ERR_FILE_DIRNOTFILE,     // The target is an existing file.  The specified build mode requires a destination directory, not a file.    
    FSBANK_ERR_FILE_DESTFILE,       // Cannot create destination file.  File may be in use or read only
    FSBANK_ERR_FILE_WORKING,        // Cannot create working file.  File may be in use or read only
    FSBANK_ERR_FILE_HEADER,         // Cannot create destination c header file.  File may be in use or read only
    FSBANK_ERR_FILE_EOF,            // End of file was encountered unexpectedly.
    FSBANK_ERR_FILE_OS,             // An operating system based file error was encountered.  Could cause corruption or failure of FSB to be created.
    FSBANK_ERR_INVALID_PARAM,       // An invalid parameter was passed to this function
    FSBANK_ERR_INVALID_FORMAT,      // A dll was missing for this format or the environment wasnt set up properly.
    FSBANK_ERR_CANCELLED,           // The build process was cancelled during compilation by the user.
    FSBANK_ERR_COMPILATION_ABORTED  // Compilation aborted due to error
} FSBANK_RESULT;


/*
[ENUM]
[
    [DESCRIPTION]   
    Describes the target build type or method of creating the FSB file(s).
    
    [SEE_ALSO]     
    FSBank_Build 
]
*/
typedef enum FSBANK_BUILDMODE
{
    FSBANK_BUILDMODE_SINGLE = 0,    // This creates a single FSB file with multiple sounds in it, or a standard sound bank.
    FSBANK_BUILDMODE_MULTI,         // This creates multiple FSB files with 1 sound in each.   The destfile_or_dir parameter of FSBank_Build is then interpreted as a directory and not a file.
    FSBANK_BUILDMODE_INTERLEAVED,   // This creates a single FSB file with a single sound in it, but with all the source files interleaved/multiplexed into it so that when it is played, all files play at once, and are given a channel each.
} FSBANK_BUILDMODE;


/*
[ENUM]
[
    [DESCRIPTION]
    Describes the target platform.
    
    [SEE_ALSO]      
    FSBank_Build
]
*/
typedef enum FSBANK_PLATFORM
{
    FSBANK_PLATFORM_PS2 = 0,        // Sony PlayStation 2
    FSBANK_PLATFORM_GC,             // Nintendo GameCube
    FSBANK_PLATFORM_XBOX,           // Microsoft XBox
    FSBANK_PLATFORM_CROSS,          // Cross platform.  Only PCM is truly supported on all platforms.
    FSBANK_PLATFORM_MAX
} FSBANK_PLATFORM;


/*
[ENUM]
[
    [DESCRIPTION]   
    Describes the target format.
    
    [SEE_ALSO]      
    FSBank_Build
]
*/
typedef enum FSBANK_FORMAT
{
    FSBANK_FORMAT_VAG = 0,          // VAG (SPU2) (3.5:1) PlayStation 2 Only. Hardware decompression, no cpu hit.
    FSBANK_FORMAT_GCADPCM,          // GCADPCM (3.5:1) GameCube Only. Hardware decompression, no cpu hit.
    FSBANK_FORMAT_XADPCM,           // XADPCM (3.5:1) XBox only. Hardware decompression, no cpu hit.
    FSBANK_FORMAT_PCM,              // PCM (1:1) All Platforms. 
    FSBANK_FORMAT_SOURCE,           // Retain original format.  All platforms (except PlayStation 2 unless using pcm wav files).
    FSBANK_FORMAT_IMAADPCM,         // IMA ADPCM (3.5:1) All platforms except PlayStation 2.  
    FSBANK_FORMAT_MAX,
} FSBANK_FORMAT;


/*
[STRUCTURE] 
[
    [DESCRIPTION]
    Structure containing default values for various sample attributes.

    [SEE_ALSO]
    FSBank_Build
]
*/
typedef struct _FSBANK_SAMPLE_DEFAULTS
{                                   
	float        mindistance;       // Minimum volume distance in "units"
	float        maxdistance;       // Maximum volume distance in "units"
    int          deffreq;           // Sample default speed in hz
	int          defvol;            // Sample default volume
	int          defpan;            // Sample default pan
	int          defpri;            // Sample priority. 0 = low priority, 255=high priority
    int          varfreq;           // Frequency variation in hz
    int          varvol;            // Volume variation
    int          varpan;            // Pan variation
    unsigned int mode;              // FSOUND_MODES bits. Bits allowed are FSOUND_LOOP_NORMAL, FSOUND_LOOP_BIDI, FSOUND_2D, FSOUND_HW2D and FSOUND_HW3D

} FSBANK_SAMPLE_DEFAULTS;


typedef void (__stdcall *FSBANK_UPDATECALLBACK)(int index, int memused, void *userdata);
typedef void (__stdcall *FSBANK_DEBUGCALLBACK)(const char *debugstring, void *userdata);


#ifdef __cplusplus
extern "C" {
#endif

FSBANK_RESULT FSBank_Init();
FSBANK_RESULT FSBank_Close();
FSBANK_RESULT FSBank_IsFormatAllowed(FSBANK_FORMAT format);
FSBANK_RESULT FSBank_Build(FSBANK_BUILDMODE buildmode,
                           FSBANK_FORMAT format,
                           FSBANK_PLATFORM platform,
                           int basicheaders, 
                           const char *destfile_or_dir, 
                           int numsrcfiles, 
                           char **srcfile, 
                           FSBANK_SAMPLE_DEFAULTS **defaults,
                           int dupdirstructure,
                           const char *srcdir,
                           int createincludes,
                           int abortonerror);
FSBANK_RESULT FSBank_SetUpdateCallback(FSBANK_UPDATECALLBACK callback, void *userdata);
FSBANK_RESULT FSBank_SetDebugCallback(FSBANK_DEBUGCALLBACK callback, void *userdata);
FSBANK_RESULT FSBank_SetBuildCancel(int cancel);
FSBANK_RESULT FSBank_GetBuildCancel(int *cancel);

#ifdef __cplusplus
}
#endif

#endif