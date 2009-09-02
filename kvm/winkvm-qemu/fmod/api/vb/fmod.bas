Attribute VB_Name = "FMod"
Option Explicit

'
'FMOD VB6 Module
'

Public Const FMOD_VERSION = 3.75

'************
'* Enums
'************


' FMOD_ERRORS
' On failure of commands in FMOD, use FSOUND_GetError to attain what happened.
'
Public Enum FMOD_ERRORS
    FMOD_ERR_NONE             ' No errors
    FMOD_ERR_BUSY             ' Cannot call this command after FSOUND_Init.  Call FSOUND_Close first.
    FMOD_ERR_UNINITIALIZED    ' This command failed because FSOUND_Init was not called
    FMOD_ERR_INIT             ' Error initializing output device.
    FMOD_ERR_ALLOCATED        ' Error initializing output device, but more specifically, the output device is already in use and cannot be reused.
    FMOD_ERR_PLAY             ' Playing the sound failed.
    FMOD_ERR_OUTPUT_FORMAT    ' Soundcard does not support the features needed for this soundsystem (16bit stereo output)
    FMOD_ERR_COOPERATIVELEVEL ' Error setting cooperative level for hardware.
    FMOD_ERR_CREATEBUFFER     ' Error creating hardware sound buffer.
    FMOD_ERR_FILE_NOTFOUND    ' File not found
    FMOD_ERR_FILE_FORMAT      ' Unknown file format
    FMOD_ERR_FILE_BAD         ' Error loading file
    FMOD_ERR_MEMORY           ' Not enough memory
    FMOD_ERR_VERSION          ' The version number of this file format is not supported
    FMOD_ERR_INVALID_PARAM    ' An invalid parameter was passed to this function
    FMOD_ERR_NO_EAX           ' Tried to use an EAX command on a non EAX enabled channel or output.
    FMOD_ERR_CHANNEL_ALLOC    ' Failed to allocate a new channel
    FMOD_ERR_RECORD           ' Recording is not supported on this machine
    FMOD_ERR_MEDIAPLAYER      ' Windows Media Player not installed so cannot play wma or use internet streaming.
    FMOD_ERR_CDDEVICE         ' An error occured trying to open the specified CD device
End Enum


' FSOUND_OUTPUTTYPES
' These output types are used with FSOUND_SetOutput, to choose which output driver to use.
' FSOUND_OUTPUT_DSOUND will not support hardware 3d acceleration if the sound card driver
' does not support DirectX 6 Voice Manager Extensions.
' FSOUND_OUTPUT_WINMM is recommended for NT and CE.
'
Public Enum FSOUND_OUTPUTTYPES
    FSOUND_OUTPUT_NOSOUND   ' NoSound driver, all calls to this succeed but do nothing.
    FSOUND_OUTPUT_WINMM     ' Windows Multimedia driver.
    FSOUND_OUTPUT_DSOUND    ' DirectSound driver.  You need this to get EAX2 or EAX3 support, or FX api support.
    FSOUND_OUTPUT_A3D       ' A3D driver.

    FSOUND_OUTPUT_OSS       ' Linux/Unix OSS (Open Sound System) driver, i.e. the kernel sound drivers.
    FSOUND_OUTPUT_ESD       ' Linux/Unix ESD (Enlightment Sound Daemon) driver.
    FSOUND_OUTPUT_ALSA      ' Linux Alsa driver.

    FSOUND_OUTPUT_ASIO      ' Low latency ASIO driver
    FSOUND_OUTPUT_XBOX      ' Xbox driver
    FSOUND_OUTPUT_PS2       ' PlayStation 2 driver
    FSOUND_OUTPUT_MAC       ' Mac SoundMager driver
    FSOUND_OUTPUT_GC        ' Gamecube driver
    FSOUND_OUTPUT_PSP		' PlayStation Portable driver

    FSOUND_OUTPUT_NOSOUND_NONREALTIME  ' This is the same as nosound, but the sound generation is driven by FSOUND_Update
End Enum


' FSOUND_MIXERTYPES
' These mixer types are used with FSOUND_SetMixer, to choose which mixer to use, or to act
' upon for other reasons using FSOUND_GetMixer.
' It is not nescessary to set the mixer.  FMOD will autodetect the best mixer for you.
'
Public Enum FSOUND_MIXERTYPES
    FSOUND_MIXER_AUTODETECT         ' CE/PS2 Only - Non interpolating/low quality mixer
    FSOUND_MIXER_BLENDMODE          ' removed / obsolete.
    FSOUND_MIXER_MMXP5              ' removed / obsolete.
    FSOUND_MIXER_MMXP6              ' removed / obsolete.

    FSOUND_MIXER_QUALITY_AUTODETECT ' All platforms - Autodetect the fastest quality mixer based on your cpu.
    FSOUND_MIXER_QUALITY_FPU        ' Win32/Linux only - Interpolating/volume ramping FPU mixer.
    FSOUND_MIXER_QUALITY_MMXP5      ' Win32/Linux only - Interpolating/volume ramping FPU mixer.
    FSOUND_MIXER_QUALITY_MMXP6      ' Win32/Linux only - Interpolating/volume ramping ppro+ MMX mixer.
    
    FSOUND_MIXER_MONO               ' CE/PS2 only - MONO non interpolating/low quality mixer. For speed
    FSOUND_MIXER_QUALITY_MONO       ' CE/PS2 only - MONO Interpolating mixer.  For speed
End Enum


' FMUSIC_TYPES
' These definitions describe the type of song being played.
' See FMUSIC_GetType
'
Public Enum FMUSIC_TYPES
    FMUSIC_TYPE_NONE
    FMUSIC_TYPE_MOD         'Protracker / Fasttracker
    FMUSIC_TYPE_S3M         'ScreamTracker 3
    FMUSIC_TYPE_XM          'FastTracker 2
    FMUSIC_TYPE_IT          'Impulse Tracker.
    FMUSIC_TYPE_MIDI        'MIDI file
    FMUSIC_TYPE_FSB         'FMOD Sample Bank file
End Enum


' FSOUND_DSP_PRIORITIES
' These default priorities are used by FMOD internal system DSP units.  They describe the
' position of the DSP chain, and the order of how audio processing is executed.
' You can actually through the use of FSOUND_DSP_GetxxxUnit (where xxx is the name of the DSP
' unit), disable or even change the priority of a DSP unit.
'
Public Enum FSOUND_DSP_PRIORITIES
    FSOUND_DSP_DEFAULTPRIORITY_CLEARUNIT = 0           'DSP CLEAR unit - done first
    FSOUND_DSP_DEFAULTPRIORITY_SFXUNIT = 100           'DSP SFX unit - done second
    FSOUND_DSP_DEFAULTPRIORITY_MUSICUNIT = 200         'DSP MUSIC unit - done third
    FSOUND_DSP_DEFAULTPRIORITY_USER = 300              'User priority, use this as reference for your own dsp units
    FSOUND_DSP_DEFAULTPRIORITY_FFTUNIT = 900           'This reads data for FSOUND_DSP_GetSpectrum, so it comes after user units
    FSOUND_DSP_DEFAULTPRIORITY_CLIPANDCOPYUNIT = 1000  'DSP CLIP AND COPY unit - last
End Enum


' FSOUND_CAPS
' Driver description bitfields.  Use FSOUND_Driver_GetCaps to determine if a driver enumerated
' has the settings you are after.  The enumerated driver depends on the output mode, see
' FSOUND_OUTPUTTYPES
'
Public Enum FSOUND_CAPS
    FSOUND_CAPS_HARDWARE = &H1       ' This driver supports hardware accelerated 3d sound.
    FSOUND_CAPS_EAX2 = &H2           ' This driver supports EAX 2 reverb
    FSOUND_CAPS_EAX3 = &H10          ' This driver supports EAX 3 reverb
End Enum


' FSOUND_MODES
' Sample description bitfields, OR them together for loading and describing samples.
' NOTE.  If the file format being loaded already has a defined format, such as WAV or MP3, then
' trying to override the pre-defined format with a new set of format flags will not work.  For
' example, an 8 bit WAV file will not load as 16bit if you specify FSOUND_16BITS.  It will just
' ignore the flag and go ahead loading it as 8bits.  For these type of formats the only flags
' you can specify that will really alter the behaviour of how it is loaded, are the following.
'
' Looping behaviour - FSOUND_LOOP_OFF, FSOUND_LOOP_NORMAL, FSOUND_LOOP_BIDI 
' Load destination - FSOUND_HW3D, FSOUND_HW2D, FSOUND_2D
' Loading behaviour - FSOUND_NONBLOCKING, FSOUND_LOADMEMORY, FSOUND_LOADRAW, FSOUND_MPEGACCURATE, FSOUND_MPEGHALFRATE, FSOUND_FORCEMONO
' Playback behaviour - FSOUND_STREAMABLE, FSOUND_ENABLEFX
' PlayStation 2 only - FSOUND_USECORE0, FSOUND_USECORE1, FSOUND_LOADMEMORYIOP    
'
' See flag descriptions for what these do.
'
Public Enum FSOUND_MODES
    FSOUND_LOOP_OFF = &H1             ' For non looping samples.
    FSOUND_LOOP_NORMAL = &H2          ' For forward looping samples.
    FSOUND_LOOP_BIDI = &H4            ' For bidirectional looping samples.  (no effect if in hardware).
    FSOUND_8BITS = &H8                ' For 8 bit samples.
    FSOUND_16BITS = &H10              ' For 16 bit samples.
    FSOUND_MONO = &H20                ' For mono samples.
    FSOUND_STEREO = &H40              ' For stereo samples.
    FSOUND_UNSIGNED = &H80            ' For source data containing unsigned samples.
    FSOUND_SIGNED = &H100             ' For source data containing signed data.
    FSOUND_DELTA = &H200              ' For source data stored as delta values.
    FSOUND_IT214 = &H400              ' For source data stored using IT214 compression.
    FSOUND_IT215 = &H800              ' For source data stored using IT215 compression.
    FSOUND_HW3D = &H1000              ' Attempts to make samples use 3d hardware acceleration. (if the card supports it)
    FSOUND_2D = &H2000                ' Ignores any 3d processing.  overrides FSOUND_HW3D.  Located in software.
    FSOUND_STREAMABLE = &H4000        ' For realtime streamable samples.  If you dont supply this sound may come out corrupted.
    FSOUND_LOADMEMORY = &H8000        ' For FSOUND_Sample_Load - name will be interpreted as a pointer to data
    FSOUND_LOADRAW = &H10000          ' For FSOUND_Sample_Load/FSOUND_Stream_Open - will ignore file format and treat as raw pcm.
    FSOUND_MPEGACCURATE = &H20000     ' For FSOUND_Stream_Open - scans MP2/MP3 (VBR also) for accurate FSOUND_Stream_GetLengthMs/FSOUND_Stream_SetTime.
    FSOUND_FORCEMONO = &H40000        ' For forcing stereo streams and samples to be mono - needed with FSOUND_HW3D - incurs speed hit
    FSOUND_HW2D = &H80000             ' 2d hardware sounds.  allows hardware specific effects
    FSOUND_ENABLEFX = &H100000        ' Allows DX8 FX to be played back on a sound.  Requires DirectX 8 - Note these sounds cant be played more than once, or have a changing frequency
    FSOUND_MPEGHALFRATE = &H200000    ' For FMODCE only - decodes mpeg streams using a lower quality decode, but faster execution
    FSOUND_XADPCM = &H400000          ' For XBOX only - Describes a user sample that its contents are compressed as XADPCM
    FSOUND_VAG = &H800000             ' For PS2 only - Describes a user sample that its contents are compressed as Sony VAG format.
    FSOUND_NONBLOCKING = &H1000000    ' For FSOUND_Stream_Open - Causes stream to open in the background and not block the foreground app - stream plays only when ready.
    FSOUND_GCADPCM = &H2000000        ' For Gamecube only - Contents are compressed as Gamecube DSP-ADPCM format
    FSOUND_MULTICHANNEL = &H4000000   ' For PS2 only - Contents are interleaved into a multi-channel (more than stereo) format
    FSOUND_USECORE0 = &H8000000       ' For PS2 only - Sample/Stream is forced to use hardware voices 00-23
    FSOUND_USECORE1 = &H10000000      ' For PS2 only - Sample/Stream is forced to use hardware voices 24-47
    FSOUND_LOADMEMORYIOP = &H20000000 ' For PS2 only - "name" will be interpreted as a pointer to data for streaming and samples.  The address provided will be an IOP address
	FSOUND_IGNORETAGS = &H40000000    ' Skips id3v2 etc tag checks when opening a stream, to reduce seek/read overhead when opening files (helps with CD performance)
    FSOUND_STREAM_NET = &H80000000    ' Specifies an internet stream
    
    FSOUND_NORMAL = FSOUND_16BITS Or FSOUND_SIGNED Or FSOUND_MONO
End Enum


' FSOUND_CDPLAYMODES
' Playback method for a CD Audio track, with FSOUND_CD_SetPlayMode
'
Public Enum FSOUND_CDPLAYMODES
    FSOUND_CD_PLAYCONTINUOUS         'Starts from the current track and plays to end of CD.
    FSOUND_CD_PLAYONCE               'Plays the specified track then stops.
    FSOUND_CD_PLAYLOOPED             'Plays the specified track looped, forever until stopped manually.
    FSOUND_CD_PLAYRANDOM             'Plays tracks in random order
End Enum


' FSOUND_CHANNELSAMPLEMODE
' Miscellaneous values for FMOD functions.
' FSOUND_PlaySound, FSOUND_PlaySoundEx, FSOUND_Sample_Alloc, FSOUND_Sample_Load, FSOUND_SetPan
'
Public Enum FSOUND_CHANNELSAMPLEMODE
    FSOUND_FREE = -1                 ' definition for dynamically allocated channel or sample
    FSOUND_UNMANAGED = -2            ' definition for allocating a sample that is NOT managed by fsound
    FSOUND_ALL = -3                  ' for a channel index or sample index, this flag affects ALL channels or samples available!  Not supported by all functions.
    FSOUND_STEREOPAN = -1            ' definition for full middle stereo volume on both channels
    FSOUND_SYSTEMCHANNEL = -1000     ' special channel ID for channel based functions that want to alter the global FSOUND software mixing output channel
    FSOUND_SYSTEMSAMPLE = -1000      ' special sample ID for all sample based functions that want to alter the global FSOUND software mixing output sample
End Enum


' FSOUND_REVERB_PROPERTIES
' FSOUND_Reverb_SetProperties, FSOUND_Reverb_GetProperties, FSOUND_REVERB_PROPERTYFLAGS
'
Public Type FSOUND_REVERB_PROPERTIES
                                    ' MIN     MAX    DEFAULT DESCRIPTION
    Environment         As Long     ' 0       25     0       sets all listener properties
    EnvSize             As Single   ' 1.0     100.0  7.5     environment size in meters
    EnvDiffusion        As Single   ' 0.0     1.0    1.0     environment diffusion
    Room                As Long     ' -10000  0      -1000   room effect level (at mid frequencies)
    RoomHF              As Long     ' -10000  0      -100    relative room effect level at high frequencies
    RoomLF              As Long     ' -10000  0      0       relative room effect level at low frequencies
    DecayTime           As Single   ' 0.1     20.0   1.49    reverberation decay time at mid frequencies
    DecayHFRatio        As Single   ' 0.1     2.0    0.83    high-frequency to mid-frequency decay time ratio
    DecayLFRatio        As Single   ' 0.1     2.0    1.0     low-frequency to mid-frequency decay time ratio
    Reflections         As Long     ' -10000  1000   -2602   early reflections level relative to room effect
    ReflectionsDelay    As Single   ' 0.0     0.3    0.007   initial reflection delay time
    ReflectionsPan(3)   As Single   '                0,0,0   early reflections panning vector
    Reverb              As Long     ' -1000   2000   200     late reverberation level relative to room effect
    ReverbDelay         As Single   ' 0.0     0.1    0.011   late reverberation delay time relative to initial reflection
    ReverbPan(3)        As Single   '                0,0,0   late reverberation panning vector
    EchoTime            As Single   ' .075    0.25   0.25    echo time
    EchoDepth           As Single   ' 0.0     1.0    0.0     echo depth
    ModulationTime      As Single   ' 0.04    4.0    0.25    modulation time
    ModulationDepth     As Single   ' 0.0     1.0    0.0     modulation depth
    AirAbsorptionHF     As Single   ' -100    0.0    -5.0    change in level per meter at high frequencies
    HFReference         As Single   ' 1000.0  20000  5000.0  reference high frequency (hz)
    LFReference         As Single   ' 20.0    1000.0 250.0   reference low frequency (hz)
    RoomRolloffFactor   As Single   ' 0.0     10.0   0.0     like FSOUND_3D_SetRolloffFactor but for room effect
    Diffusion           As Single   ' 0.0     100.0  100.0   Value that controls the echo density in the late reverberation decay. (xbox only)
    Density             As Single   ' 0.0     100.0  100.0   Value that controls the modal density in the late reverberation decay (xbox only)
    flags               As Long     '                        modifies the behavior of above properties
End Type


' FSOUND_REVERB_FLAGS
' Values for the Flags member of the FSOUND_REVERB_PROPERTIES structure.
'
Public Enum FSOUND_REVERB_PROPERTYFLAGS
    FSOUND_REVERBFLAGS_DECAYTIMESCALE = &H1          ' EnvironmentSize affects reverberation decay time
    FSOUND_REVERBFLAGS_REFLECTIONSSCALE = &H2        ' EnvironmentSize affects reflection level
    FSOUND_REVERBFLAGS_REFLECTIONSDELAYSCALE = &H4   ' EnvironmentSize affects initial reflection delay time
    FSOUND_REVERBFLAGS_REVERBSCALE = &H8             ' EnvironmentSize affects reflections level
    FSOUND_REVERBFLAGS_REVERBDELAYSCALE = &H10       ' EnvironmentSize affects late reverberation delay time
    FSOUND_REVERBFLAGS_DECAYHFLIMIT = &H20           ' AirAbsorptionHF affects DecayHFRatio
    FSOUND_REVERBFLAGS_ECHOTIMESCALE = &H40          ' EnvironmentSize affects echo time
    FSOUND_REVERBFLAGS_MODULATIONTIMESCALE = &H80    ' EnvironmentSize affects modulation time
    FSOUND_REVERB_FLAGS_CORE0 = &H100                ' PS2 Only - Reverb is applied to CORE0 (hw voices 0-23)
    FSOUND_REVERB_FLAGS_CORE1 = &H200                ' PS2 Only - Reverb is applied to CORE1 (hw voices 24-47)
    FSOUND_REVERBFLAGS_DEFAULT = FSOUND_REVERBFLAGS_DECAYTIMESCALE Or FSOUND_REVERBFLAGS_REFLECTIONSSCALE Or FSOUND_REVERBFLAGS_REFLECTIONSDELAYSCALE Or FSOUND_REVERBFLAGS_REVERBSCALE Or FSOUND_REVERBFLAGS_REVERBDELAYSCALE Or FSOUND_REVERBFLAGS_DECAYHFLIMIT Or FSOUND_REVERB_FLAGS_CORE0 Or FSOUND_REVERB_FLAGS_CORE1
End Enum


' FSOUND_REVERB_CHANNELPROPERTIES
' Structure defining the properties for a reverb source, related to a FSOUND channel.
' FSOUND_Reverb_SetEnvironment, FSOUND_Reverb_SetEnvironmentAdvanced
'
Public Type FSOUND_REVERB_CHANNELPROPERTIES
    Direct               As Long     ' direct path level (at low and mid frequencies)
    DirectHF             As Long     ' relative direct path level at high frequencies
    Room                 As Long     ' room effect level (at low and mid frequencies)
    RoomHF               As Long     ' relative room effect level at high frequencies
    Obstruction          As Long     ' main obstruction control (attenuation at high frequencies)
    ObstructionLFRatio   As Single   ' obstruction low-frequency level re. main control
    Occlusion            As Long     ' main occlusion control (attenuation at high frequencies)
    OcclustionLFRatio    As Single   ' occlusion low-frequency level re. main control
    OcclusionRoomRatio   As Single   ' relative occlusion control for room effect
    OcclusionDirectRatio As Single   ' relative occlusion control for direct path
    Exclusion            As Long     ' main exlusion control (attenuation at high frequencies)
    ExclusionLFRatio     As Single   ' exclusion low-frequency level re. main control
    OutsideVolumeHF      As Long     ' outside sound cone level at high frequencies
    DopplerFactor        As Single   ' like DS3D flDopplerFactor but per source
    RolloffFactor        As Single   ' like DS3D flRolloffFactor but per source
    RoomRolloffFactor    As Single   ' like DS3D flRolloffFactor but for room effect
    AirAbsorptionFactor  As Single   ' multiplies AirAbsorptionHF member of FSOUND_REVERB_PROPERTIES
    flags                As Long     ' modifies the behavior of properties
End Type


' FSOUND_REVERB_CHANNELFLAGS
' Values for the Flags member of the FSOUND_REVERB_CHANNELPROPERTIES structure.
'
Public Enum FSOUND_REVERB_CHANNELFLAGS
    FSOUND_REVERB_CHANNELFLAGS_DIRECTHFAUTO = &H1   ' Automatic setting of Direct due to distance from listener
    FSOUND_REVERB_CHANNELFLAGS_ROOMAUTO = &H2       ' Automatic setting of Room due to distance from listener
    FSOUND_REVERB_CHANNELFLAGS_ROOMHFAUTO = &H4     ' Automatic setting of RoomHF due to distance from listener
    FSOUND_REVERB_CHANNELFLAGS_DEFAULT = FSOUND_REVERB_CHANNELFLAGS_DIRECTHFAUTO Or FSOUND_REVERB_CHANNELFLAGS_ROOMAUTO Or FSOUND_REVERB_CHANNELFLAGS_ROOMHFAUTO
End Enum


' FSOUND_FX_MODES
' These values are used with FSOUND_FX_Enable to enable DirectX 8 FX for a channel.
'
Public Enum FSOUND_FX_MODES
    FSOUND_FX_CHORUS
    FSOUND_FX_COMPRESSOR
    FSOUND_FX_DISTORTION
    FSOUND_FX_ECHO
    FSOUND_FX_FLANGER
    FSOUND_FX_GARGLE
    FSOUND_FX_I3DL2REVERB
    FSOUND_FX_PARAMEQ
    FSOUND_FX_WAVES_REVERB
End Enum


'FSOUND_SPEAKERMODES
'These are speaker types defined for use with the FSOUND_SetSpeakerMode command.
'Note - Only reliably works with FSOUND_OUTPUT_DSOUND or FSOUND_OUTPUT_XBOX output modes.  Other output modes will only
'interpret FSOUND_SPEAKERMODE_MONO and set everything else to be stereo.
'Using either DolbyDigital or DTS will use whatever 5.1 digital mode is available if destination hardware is unsure.
'
Public Enum FSOUND_SPEAKERMODES
    FSOUND_SPEAKERMODE_DOLBYDIGITAL  ' The audio is played through a speaker arrangement of surround speakers with a subwoofer.
    FSOUND_SPEAKERMODE_HEADPHONE     ' The speakers are headphones.
    FSOUND_SPEAKERMODE_MONO          ' The speakers are monaural.
    FSOUND_SPEAKERMODE_QUAD          ' The speakers are quadraphonic.
    FSOUND_SPEAKERMODE_STEREO        ' The speakers are stereo (default value).
    FSOUND_SPEAKERMODE_SURROUND      ' The speakers are surround sound.
    FSOUND_SPEAKERMODE_DTS           ' The audio is played through a speaker arrangement of surround speakers with a subwoofer.
    FSOUND_SPEAKERMODE_PROLOGIC2     ' Dolby Prologic 2.  Playstation 2 and Gamecube only
End Enum


' FSOUND_INIT_FLAGS
' Initialization flags.  Use them with FSOUND_Init in the flags parameter to change various behaviour.
' FSOUND_INIT_ENABLESYSTEMCHANNELFX Is an init mode which enables the FSOUND mixer buffer to be affected by DirectX 8 effects.
' Note that due to limitations of DirectSound, FSOUND_Init may fail if this is enabled because the buffersize is too small.
' This can be fixed with FSOUND_SetBufferSize.  Increase the BufferSize until it works.
' When it is enabled you can use the FSOUND_FX api, and use FSOUND_SYSTEMCHANNEL as the channel id when setting parameters.
'
Public Enum FSOUND_INITMODES
    FSOUND_INIT_USEDEFAULTMIDISYNTH = &H1       'Causes MIDI playback to force software decoding.
    FSOUND_INIT_GLOBALFOCUS = &H2               'For DirectSound output - sound is not muted when window is out of focus.
    FSOUND_INIT_ENABLESYSTEMCHANNELFX = &H4     'For DirectSound output - Allows FSOUND_FX api to be used on global software mixer output!
    FSOUND_INIT_ACCURATEVULEVELS = &H8          'This latency adjusts FSOUND_GetCurrentLevels, but incurs a small cpu and memory hit
    FSOUND_INIT_PS2_DISABLECORE0REVERB = &H10   'PS2 only - Disable reverb on CORE 0 to regain SRAM
    FSOUND_INIT_PS2_DISABLECORE1REVERB = &H20   'PS2 only - Disable reverb on CORE 1 to regain SRAM
    FSOUND_INIT_PS2_SWAPDMACORES = &H40         'PS2 only - By default FMOD uses DMA CH0 for mixing, CH1 for uploads, this flag swaps them around
    FSOUND_INIT_DONTLATENCYADJUST = &H80        'Callbacks are not latency adjusted, and are called at mix time.  Also information functions are immediate
    FSOUND_INIT_GC_INITLIBS = &H100             'Gamecube only - Initializes GC audio libraries
    FSOUND_INIT_STREAM_FROM_MAIN_THREAD = &H200 'Turns off fmod streamer thread, and makes streaming update from FSOUND_Update called by the user
    FSOUND_INIT_PS2_USEVOLUMERAMPING = &H400    'PS2 only   - Turns on volume ramping system to remove hardware clicks.
    FSOUND_INIT_DSOUND_DEFERRED = &H800         'Win32 only - For DirectSound output.  3D commands are batched together and executed at FSOUND_Update.
    FSOUND_INIT_DSOUND_HRTF_LIGHT = &H1000      'Win32 only - For DirectSound output.  FSOUND_HW3D buffers use a slightly higher quality algorithm when 3d hardware acceleration is not present.
    FSOUND_INIT_DSOUND_HRTF_FULL = &H2000       'Win32 only - For DirectSound output.  FSOUND_HW3D buffers use full quality 3d playback when 3d hardware acceleration is not present.
    FSOUND_INIT_XBOX_REMOVEHEADROOM = &H4000    'XBox only - By default directsound attenuates all sound by 6db to avoid clipping/distortion.  CAUTION.  If you use this flag you are responsible for the final mix to make sure clipping / distortion doesn't happen.
    FSOUND_INIT_PSP_SILENCEONUNDERRUN = &H8000  'PSP only - If streams skip / stutter when device is powered on, either increase stream buffersize, or use this flag instead to play silence while the UMD is recovering.
End Enum


' FSOUND_STREAM_NET_STATUS
' Status values for internet streams. Use FSOUND_Stream_Net_GetStatus to get the current status of an internet stream.
'
Public Enum FSOUND_STREAM_NET_STATUS
    FSOUND_STREAM_NET_NOTCONNECTED         ' Stream hasn't connected yet
    FSOUND_STREAM_NET_CONNECTING           ' Stream is connecting to remote host
    FSOUND_STREAM_NET_BUFFERING            ' Stream is buffering data
    FSOUND_STREAM_NET_READY                ' Stream is ready to play
    FSOUND_STREAM_NET_ERROR                ' Stream has suffered a fatal error
End Enum


' FSOUND_TAGFIELD_TYPE
' Describes the type of a particular tag field.
' See FSOUND_Stream_GetNumTagFields, FSOUND_Stream_GetTagField, FSOUND_Stream_FindTagField
'
Public Enum FSOUND_TAGFIELD_TYPE
    FSOUND_TAGFIELD_VORBISCOMMENT = 0     ' A vorbis comment
    FSOUND_TAGFIELD_ID3V1                 ' Part of an ID3v1 tag
    FSOUND_TAGFIELD_ID3V2                 ' An ID3v2 frame
    FSOUND_TAGFIELD_SHOUTCAST             ' A SHOUTcast header line
    FSOUND_TAGFIELD_ICECAST               ' An Icecast header line
    FSOUND_TAGFIELD_ASF                   ' An Advanced Streaming Format header line
End Enum


' FSOUND_STATUS_FLAGS
' These values describe the protocol and format of an internet stream. Use FSOUND_Stream_Net_GetStatus to retrieve this information for an open internet stream.
'
Public Enum FSOUND_STATUS_FLAGS
    FSOUND_PROTOCOL_SHOUTCAST = &H1
    FSOUND_PROTOCOL_ICECAST = &H2
    FSOUND_PROTOCOL_HTTP = &H4
    FSOUND_FORMAT_MPEG = &H10000
    FSOUND_FORMAT_OGGVORBIS = &H20000
End Enum

' FSOUND_TOC_TAG
' FSOUND_Stream_Open, FSOUND_Stream_FindTagField
'
Public Type FSOUND_TOC_TAG
    TagName(3)      As Byte         ' The string "TOC" (4th character is 0), just in case this structure is accidentally treated as a string.
    NumTracks       As Long         ' The number of tracks on the CD.
    Min(99)         As Long         ' The start offset of each track in minutes.
    Sec(99)         As Long         ' The start offset of each track in seconds.
    Frame(99)       As Long         ' The start offset of each track in frames.
End Type


'/* ================================== */
'/* Initialization / Global functions. */
'/* ================================== */


' PRE - FSOUND_Init functions. These cant be called after FSOUND_Init is
' called (they will fail). They set up FMOD system functionality.


Public Declare Function FSOUND_SetOutput Lib "fmod.dll" Alias "_FSOUND_SetOutput@4" (ByVal outputtype As FSOUND_OUTPUTTYPES) As Byte
Public Declare Function FSOUND_SetDriver Lib "fmod.dll" Alias "_FSOUND_SetDriver@4" (ByVal driver As Long) As Byte
Public Declare Function FSOUND_SetMixer Lib "fmod.dll" Alias "_FSOUND_SetMixer@4" (ByVal mixer As FSOUND_MIXERTYPES) As Byte
Public Declare Function FSOUND_SetBufferSize Lib "fmod.dll" Alias "_FSOUND_SetBufferSize@4" (ByVal lenms As Long) As Byte
Public Declare Function FSOUND_SetHWND Lib "fmod.dll" Alias "_FSOUND_SetHWND@4" (ByVal hwnd As Long) As Byte
Public Declare Function FSOUND_SetMinHardwareChannels Lib "fmod.dll" Alias "_FSOUND_SetMinHardwareChannels@4" (ByVal min As Integer) As Byte
Public Declare Function FSOUND_SetMaxHardwareChannels Lib "fmod.dll" Alias "_FSOUND_SetMaxHardwareChannels@4" (ByVal min As Integer) As Byte
Public Declare Function FSOUND_SetMemorySystem Lib "fmod.dll" Alias "_FSOUND_SetMemorySystem@20" (ByVal pool As Long, ByVal poollen As Long, ByVal useralloc As Long, ByVal userrealloc As Long, ByVal userfree As Long) As Byte

'
'   Main initialization / closedown functions.
'   Note : Use FSOUND_INIT_USEDEFAULTMIDISYNTH with FSOUND_Init for software override
'          with MIDI playback.
'        : Use FSOUND_INIT_GLOBALFOCUS with FSOUND_Init to make sound audible no matter
'          which window is in focus. (FSOUND_OUTPUT_DSOUND only)
'

Public Declare Function FSOUND_Init Lib "fmod.dll" Alias "_FSOUND_Init@12" (ByVal mixrate As Long, ByVal maxchannels As Long, ByVal flags As FSOUND_INITMODES) As Byte
Public Declare Function FSOUND_Close Lib "fmod.dll" Alias "_FSOUND_Close@0" () As Long

'
'   Runtime system level functions
'

Public Declare Function FSOUND_Update Lib "fmod.dll" Alias "_FSOUND_Update@0" () As Long

Public Declare Function FSOUND_SetSpeakerMode Lib "fmod.dll" Alias "_FSOUND_SetSpeakerMode@4" (ByVal speakermode As FSOUND_SPEAKERMODES) As Long
Public Declare Function FSOUND_SetSFXMasterVolume Lib "fmod.dll" Alias "_FSOUND_SetSFXMasterVolume@4" (ByVal volume As Long) As Long
Public Declare Function FSOUND_SetPanSeperation Lib "fmod.dll" Alias "_FSOUND_SetPanSeperation@4" (ByVal pansep As Single) As Long
Public Declare Function FSOUND_File_SetCallbacks Lib "fmod.dll" Alias "_FSOUND_File_SetCallbacks@20" (ByVal OpenCallback As Long, ByVal CloseCallback As Long, ByVal ReadCallback As Long, ByVal SeekCallback As Long, ByVal TellCallback As Long) As Long

'
' System information functions.
'

Public Declare Function FSOUND_GetError Lib "fmod.dll" Alias "_FSOUND_GetError@0" () As FMOD_ERRORS
Public Declare Function FSOUND_GetVersion Lib "fmod.dll" Alias "_FSOUND_GetVersion@0" () As Single
Public Declare Function FSOUND_GetOutput Lib "fmod.dll" Alias "_FSOUND_GetOutput@0" () As FSOUND_OUTPUTTYPES
Public Declare Function FSOUND_GetOutputHandle Lib "fmod.dll" Alias "_FSOUND_GetOutputHandle@0" () As Long
Public Declare Function FSOUND_GetDriver Lib "fmod.dll" Alias "_FSOUND_GetDriver@0" () As Long
Public Declare Function FSOUND_GetMixer Lib "fmod.dll" Alias "_FSOUND_GetMixer@0" () As FSOUND_MIXERTYPES
Public Declare Function FSOUND_GetNumDrivers Lib "fmod.dll" Alias "_FSOUND_GetNumDrivers@0" () As Long
Public Declare Function FSOUND_GetDriverName Lib "fmod.dll" Alias "_FSOUND_GetDriverName@4" (ByVal id As Long) As Long
Public Declare Function FSOUND_GetDriverCaps Lib "fmod.dll" Alias "_FSOUND_GetDriverCaps@8" (ByVal id As Long, ByRef caps As Long) As Byte
Public Declare Function FSOUND_GetOutputRate Lib "fmod.dll" Alias "_FSOUND_GetOutputRate@0" () As Long
Public Declare Function FSOUND_GetMaxChannels Lib "fmod.dll" Alias "_FSOUND_GetMaxChannels@0" () As Long
Public Declare Function FSOUND_GetMaxSamples Lib "fmod.dll" Alias "_FSOUND_GetMaxSamples@0" () As Long
Public Declare Function FSOUND_GetSpeakerMode Lib "fmod.dll" Alias "_FSOUND_GetSpeakerMode@0" () As Long
Public Declare Function FSOUND_GetSFXMasterVolume Lib "fmod.dll" Alias "_FSOUND_GetSFXMasterVolume@0" () As Long
Public Declare Function FSOUND_GetNumHWChannels Lib "fmod.dll" Alias "_FSOUND_GetNumHWChannels@12" (ByRef num2d As Long, ByRef num3d As Long, ByRef total As Long)
Public Declare Function FSOUND_GetChannelsPlaying Lib "fmod.dll" Alias "_FSOUND_GetChannelsPlaying@0" () As Long
Public Declare Function FSOUND_GetCPUUsage Lib "fmod.dll" Alias "_FSOUND_GetCPUUsage@0" () As Single
Public Declare Sub FSOUND_GetMemoryStats Lib "fmod.dll" Alias "_FSOUND_GetMemoryStats@8" (ByRef currentalloced As Long, ByRef maxalloced As Long)

'/* =================================== */
'/* Sample management / load functions. */
'/* =================================== */


'   Sample creation and management functions
'   Note : Use FSOUND_LOADMEMORY   flag with FSOUND_Sample_Load to load from memory.
'          Use FSOUND_LOADRAW      flag with FSOUND_Sample_Load to treat as as raw pcm data.


Public Declare Function FSOUND_Sample_Load Lib "fmod.dll" Alias "_FSOUND_Sample_Load@20" (ByVal index As Long, ByVal name As String, ByVal mode As FSOUND_MODES, ByVal offset As Long, ByVal length As Long) As Long
Public Declare Function FSOUND_Sample_Alloc Lib "fmod.dll" Alias "_FSOUND_Sample_Alloc@28" (ByVal index As Long, ByVal length As Long, ByVal mode As Long, ByVal deffreq As Long, ByVal defvol As Long, ByVal defpan As Long, ByVal defpri As Long) As Long
Public Declare Function FSOUND_Sample_Free Lib "fmod.dll" Alias "_FSOUND_Sample_Free@4" (ByVal sptr As Long) As Long
Public Declare Function FSOUND_Sample_Upload Lib "fmod.dll" Alias "_FSOUND_Sample_Upload@12" (ByVal sptr As Long, ByRef srcdata As Long, ByVal mode As Long) As Byte
Public Declare Function FSOUND_Sample_Lock Lib "fmod.dll" Alias "_FSOUND_Sample_Lock@28" (ByVal sptr As Long, ByVal offset As Long, ByVal length As Long, ByRef ptr1 As Long, ByRef ptr2 As Long, ByRef len1 As Long, ByRef len2 As Long) As Byte
Public Declare Function FSOUND_Sample_Unlock Lib "fmod.dll" Alias "_FSOUND_Sample_Unlock@20" (ByVal sptr As Long, ByVal sptr1 As Long, ByVal sptr2 As Long, ByVal len1 As Long, ByVal len2 As Long) As Byte


'   Sample control functions


Public Declare Function FSOUND_Sample_SetMode Lib "fmod.dll" Alias "_FSOUND_Sample_SetMode@8" (ByVal sptr As Long, ByVal mode As FSOUND_MODES) As Byte
Public Declare Function FSOUND_Sample_SetLoopPoints Lib "fmod.dll" Alias "_FSOUND_Sample_SetLoopPoints@12" (ByVal sptr As Long, ByVal loopstart As Long, ByVal loopend As Long) As Byte
Public Declare Function FSOUND_Sample_SetDefaults Lib "fmod.dll" Alias "_FSOUND_Sample_SetDefaults@20" (ByVal sptr As Long, ByVal deffreq As Long, ByVal defvol As Long, ByVal defpan As Long, ByVal defpri As Long) As Byte
Public Declare Function FSOUND_Sample_SetDefaultsEx Lib "fmod.dll" Alias "_FSOUND_Sample_SetDefaultsEx@32" (ByVal sptr As Long, ByVal deffreq As Long, ByVal defvol As Long, ByVal defpan As Long, ByVal defpri As Long, ByVal varfreq As Long, ByVal varvol As Long, ByVal varpan As Long) As Byte
Public Declare Function FSOUND_Sample_SetMinMaxDistance Lib "fmod.dll" Alias "_FSOUND_Sample_SetMinMaxDistance@12" (ByVal sptr As Long, ByVal min As Single, ByVal max As Single) As Byte
Public Declare Function FSOUND_Sample_SetMaxPlaybacks Lib "fmod.dll" Alias "_FSOUND_Sample_SetMaxPlaybacks@8" (ByVal sptr As Long, ByVal max As Long) As Byte


'   Sample information functions


Public Declare Function FSOUND_Sample_Get Lib "fmod.dll" Alias "_FSOUND_Sample_Get@4" (ByVal sampno As Long) As Long
Public Declare Function FSOUND_Sample_GetName Lib "fmod.dll" Alias "_FSOUND_Sample_GetName@4" (ByVal sptr As Long) As Long
Public Declare Function FSOUND_Sample_GetLength Lib "fmod.dll" Alias "_FSOUND_Sample_GetLength@4" (ByVal sptr As Long) As Long
Public Declare Function FSOUND_Sample_GetLoopPoints Lib "fmod.dll" Alias "_FSOUND_Sample_GetLoopPoints@12" (ByVal sptr As Long, ByRef loopstart As Long, ByRef loopend As Long) As Byte
Public Declare Function FSOUND_Sample_GetDefaults Lib "fmod.dll" Alias "_FSOUND_Sample_GetDefaults@20" (ByVal sptr As Long, ByRef deffreq As Long, ByRef defvol As Long, ByRef defpan As Long, ByRef defpri As Long) As Byte
Public Declare Function FSOUND_Sample_GetDefaultsEx Lib "fmod.dll" Alias "_FSOUND_Sample_GetDefaultsEx@32" (ByVal sptr As Long, ByRef deffreq As Long, ByRef defvol As Long, ByRef defpan As Long, ByRef defpri As Long, ByRef varfreq As Long, ByRef varvol As Long, ByRef varpan As Long) As Byte
Public Declare Function FSOUND_Sample_GetMode Lib "fmod.dll" Alias "_FSOUND_Sample_GetMode@4" (ByVal sptr As Long) As Long
Public Declare Function FSOUND_Sample_GetMinMaxDistance Lib "fmod.dll" Alias "_FSOUND_Sample_GetMinMaxDistance@12" (ByVal sptr As Long, ByRef min As Single, ByRef max As Single) As Byte

'/* ============================ */
'/* Channel control functions.   */
'/* ============================ */


'   Playing and stopping sounds.
'   Note : Use FSOUND_FREE as the channel variable, to let FMOD pick a free channel for you.
'          Use FSOUND_ALL as the channel variable to control ALL channels with one function call!


Public Declare Function FSOUND_PlaySound Lib "fmod.dll" Alias "_FSOUND_PlaySound@8" (ByVal channel As Long, ByVal sptr As Long) As Long
Public Declare Function FSOUND_PlaySoundEx Lib "fmod.dll" Alias "_FSOUND_PlaySoundEx@16" (ByVal channel As Long, ByVal sptr As Long, ByVal dsp As Long, ByVal startpaused As Byte) As Long
Public Declare Function FSOUND_StopSound Lib "fmod.dll" Alias "_FSOUND_StopSound@4" (ByVal channel As Long) As Byte


'   Functions to control playback of a channel.
'   Note : FSOUND_ALL can be used on most of these functions as a channel value.


Public Declare Function FSOUND_SetFrequency Lib "fmod.dll" Alias "_FSOUND_SetFrequency@8" (ByVal channel As Long, ByVal freq As Long) As Byte
Public Declare Function FSOUND_SetVolume Lib "fmod.dll" Alias "_FSOUND_SetVolume@8" (ByVal channel As Long, ByVal Vol As Long) As Byte
Public Declare Function FSOUND_SetVolumeAbsolute Lib "fmod.dll" Alias "_FSOUND_SetVolumeAbsolute@8" (ByVal channel As Long, ByVal Vol As Long) As Byte
Public Declare Function FSOUND_SetPan Lib "fmod.dll" Alias "_FSOUND_SetPan@8" (ByVal channel As Long, ByVal pan As Long) As Byte
Public Declare Function FSOUND_SetSurround Lib "fmod.dll" Alias "_FSOUND_SetSurround@8" (ByVal channel As Long, ByVal surround As Long) As Byte
Public Declare Function FSOUND_SetMute Lib "fmod.dll" Alias "_FSOUND_SetMute@8" (ByVal channel As Long, ByVal mute As Byte) As Byte
Public Declare Function FSOUND_SetPriority Lib "fmod.dll" Alias "_FSOUND_SetPriority@8" (ByVal channel As Long, ByVal Priority As Long) As Byte
Public Declare Function FSOUND_SetReserved Lib "fmod.dll" Alias "_FSOUND_SetReserved@8" (ByVal channel As Long, ByVal reserved As Long) As Byte
Public Declare Function FSOUND_SetPaused Lib "fmod.dll" Alias "_FSOUND_SetPaused@8" (ByVal channel As Long, ByVal Paused As Byte) As Byte
Public Declare Function FSOUND_SetLoopMode Lib "fmod.dll" Alias "_FSOUND_SetLoopMode@8" (ByVal channel As Long, ByVal loopmode As Long) As Byte
Public Declare Function FSOUND_SetCurrentPosition Lib "fmod.dll" Alias "_FSOUND_SetCurrentPosition@8" (ByVal channel As Long, ByVal offset As Long) As Byte
Public Declare Function FSOUND_3D_SetAttributes Lib "fmod.dll" Alias "_FSOUND_3D_SetAttributes@12" (ByVal channel As Long, ByRef Pos As Single, ByRef vel As Single) As Byte
Public Declare Function FSOUND_3D_SetMinMaxDistance Lib "fmod.dll" Alias "_FSOUND_3D_SetMinMaxDistance@12" (ByVal channel As Long, ByVal min As Single, ByVal max As Single) As Byte

'
'   Channel information functions.
'

Public Declare Function FSOUND_IsPlaying Lib "fmod.dll" Alias "_FSOUND_IsPlaying@4" (ByVal channel As Long) As Byte
Public Declare Function FSOUND_GetFrequency Lib "fmod.dll" Alias "_FSOUND_GetFrequency@4" (ByVal channel As Long) As Long
Public Declare Function FSOUND_GetVolume Lib "fmod.dll" Alias "_FSOUND_GetVolume@4" (ByVal channel As Long) As Long
Public Declare Function FSOUND_GetAmplitude Lib "fmod.dll" Alias "_FSOUND_GetAmplitude@4" (ByVal channel As Long) As Long
Public Declare Function FSOUND_GetPan Lib "fmod.dll" Alias "_FSOUND_GetPan@4" (ByVal channel As Long) As Long
Public Declare Function FSOUND_GetSurround Lib "fmod.dll" Alias "_FSOUND_GetSurround@4" (ByVal channel As Long) As Byte
Public Declare Function FSOUND_GetMute Lib "fmod.dll" Alias "_FSOUND_GetMute@4" (ByVal channel As Long) As Byte
Public Declare Function FSOUND_GetPriority Lib "fmod.dll" Alias "_FSOUND_GetPriority@4" (ByVal channel As Long) As Long
Public Declare Function FSOUND_GetReserved Lib "fmod.dll" Alias "_FSOUND_GetReserved@4" (ByVal channel As Long) As Byte
Public Declare Function FSOUND_GetPaused Lib "fmod.dll" Alias "_FSOUND_GetPaused@4" (ByVal channel As Long) As Byte
Public Declare Function FSOUND_GetLoopMode Lib "fmod.dll" Alias "_FSOUND_GetLoopMode@4" (ByVal channel As Long) As Long
Public Declare Function FSOUND_GetCurrentPosition Lib "fmod.dll" Alias "_FSOUND_GetCurrentPosition@4" (ByVal channel As Long) As Long
Public Declare Function FSOUND_GetCurrentSample Lib "fmod.dll" Alias "_FSOUND_GetCurrentSample@4" (ByVal channel As Long) As Long
Public Declare Function FSOUND_GetCurrentLevels Lib "fmod.dll" Alias "_FSOUND_GetCurrentLevels@12" (ByVal channel As Long, ByRef l As Single, ByRef r As Single) As Byte
Public Declare Function FSOUND_GetNumSubChannels Lib "fmod.dll" Alias "_FSOUND_GetNumSubChannels@4" (ByVal channel As Long) As Long
Public Declare Function FSOUND_GetSubChannel Lib "fmod.dll" Alias "_FSOUND_GetSubChannel@8" (ByVal channel As Long, ByVal subchannel As Long) As Long
Public Declare Function FSOUND_3D_GetAttributes Lib "fmod.dll" Alias "_FSOUND_3D_GetAttributes@12" (ByVal channel As Long, ByRef Pos As Single, ByRef vel As Single) As Byte
Public Declare Function FSOUND_3D_GetMinMaxDistance Lib "fmod.dll" Alias "_FSOUND_3D_GetMinMaxDistance@12" (ByVal channel As Long, ByRef min As Single, ByRef max As Single) As Byte

'/* ========================== */
'/* Global 3D sound functions. */
'/* ========================== */

'
'    See also 3d sample and channel based functions above.
'    Call FSOUND_Update once a frame to process 3d information.
'

Public Declare Function FSOUND_3D_Listener_SetCurrent Lib "fmod.dll" Alias "_FSOUND_3D_Listener_SetCurrent@8" (ByVal current As Long) As Long
Public Declare Function FSOUND_3D_Listener_SetAttributes Lib "fmod.dll" Alias "_FSOUND_3D_Listener_SetAttributes@32" (ByVal Pos As Single, ByVal vel As Single, ByVal fx As Single, ByVal fy As Single, ByVal fz As Single, ByVal tx As Single, ByVal ty As Single, ByVal tz As Single) As Long
Public Declare Function FSOUND_3D_Listener_GetAttributes Lib "fmod.dll" Alias "_FSOUND_3D_Listener_GetAttributes@32" (ByRef Pos As Single, ByRef vel As Single, ByRef fx As Single, ByRef fy As Single, ByRef fz As Single, ByRef tx As Single, ByRef ty As Single, ByRef tz As Single) As Long
Public Declare Function FSOUND_3D_SetDopplerFactor Lib "fmod.dll" Alias "_FSOUND_3D_SetDopplerFactor@4" (ByVal fscale As Single) As Long
Public Declare Function FSOUND_3D_SetDistanceFactor Lib "fmod.dll" Alias "_FSOUND_3D_SetDistanceFactor@4" (ByVal fscale As Single) As Long
Public Declare Function FSOUND_3D_SetRolloffFactor Lib "fmod.dll" Alias "_FSOUND_3D_SetRolloffFactor@4" (ByVal fscale As Single) As Long

'/* =================== */
'/* FX functions.       */
'/* =================== */

 
'   Functions to control DX8 only effects processing.
'
'   - FX enabled samples can only be played once at a time, not multiple times at once.
'   - Sounds have to be created with FSOUND_HW2D or FSOUND_HW3D for this to work.
'   - FSOUND_INIT_ENABLESYSTEMCHANNELFX can be used to apply hardware effect processing to the
'     global mixed output of FMOD's software channels.
'   - FSOUND_FX_Enable returns an FX handle that you can use to alter fx parameters.
'   - FSOUND_FX_Enable can be called multiple times in a row, even on the same FX type,
'     it will return a unique handle for each FX.
'   - FSOUND_FX_Enable cannot be called if the sound is playing or locked.
'   - FSOUND_FX_Disable must be called to reset/clear the FX from a channel.


Public Declare Function FSOUND_FX_Enable Lib "fmod.dll" Alias "_FSOUND_FX_Enable@8" (ByVal channel As Long, ByVal fx As FSOUND_FX_MODES) As Long
Public Declare Function FSOUND_FX_Disable Lib "fmod.dll" Alias "_FSOUND_FX_Disable@4" (ByVal channel As Long) As Byte

Public Declare Function FSOUND_FX_SetChorus Lib "fmod.dll" Alias "_FSOUND_FX_SetChorus@32" (ByVal fxid As Long, ByVal WetDryMix As Single, ByVal Depth As Single, ByVal Feedback As Single, ByVal Frequency As Single, ByVal Waveform As Long, ByVal Delay As Single, ByVal Phase As Long) As Byte
Public Declare Function FSOUND_FX_SetCompressor Lib "fmod.dll" Alias "_FSOUND_FX_SetCompressor@28" (ByVal fxid As Long, ByVal Gain As Single, ByVal Attack As Single, ByVal Release As Single, ByVal Threshold As Single, ByVal Ratio As Single, ByVal Predelay As Single) As Byte
Public Declare Function FSOUND_FX_SetDistortion Lib "fmod.dll" Alias "_FSOUND_FX_SetDistortion@24" (ByVal fxid As Long, ByVal Gain As Single, ByVal Edge As Single, ByVal PostEQCenterFrequency As Single, ByVal PostEQBandwidth As Single, ByVal PreLowpassCutoff As Single) As Byte
Public Declare Function FSOUND_FX_SetEcho Lib "fmod.dll" Alias "_FSOUND_FX_SetEcho@24" (ByVal fxid As Long, ByVal WetDryMix As Single, ByVal Feedback As Single, ByVal LeftDelay As Single, ByVal RightDelay As Single, ByVal PanDelay As Long) As Byte
Public Declare Function FSOUND_FX_SetFlanger Lib "fmod.dll" Alias "_FSOUND_FX_SetFlanger@32" (ByVal fxid As Long, ByVal WetDryMix As Single, ByVal Depth As Single, ByVal Feedback As Single, ByVal Frequency As Single, ByVal Waveform As Long, ByVal Delay As Single, ByVal Phase As Long) As Byte
Public Declare Function FSOUND_FX_SetGargle Lib "fmod.dll" Alias "_FSOUND_FX_SetGargle@12" (ByVal fxid As Long, ByVal RateHz As Long, ByVal WaveShape As Long) As Byte
Public Declare Function FSOUND_FX_SetI3DL2Reverb Lib "fmod.dll" Alias "_FSOUND_FX_SetI3DL2Reverb@52" (ByVal fxid As Long, ByVal Room As Long, ByVal RoomHF As Long, ByVal RoomRolloffFactor As Single, ByVal DecayTime As Single, ByVal DecayHFRatio As Single, ByVal Reflections As Long, ByVal ReflectionsDelay As Single, ByVal Reverb As Long, ByVal ReverbDelay As Single, ByVal Diffusion As Single, ByVal Density As Single, ByVal HFReference As Single) As Byte
Public Declare Function FSOUND_FX_SetParamEQ Lib "fmod.dll" Alias "_FSOUND_FX_SetParamEQ@16" (ByVal fxid As Long, ByVal Center As Single, ByVal Bandwidth As Single, ByVal Gain As Single) As Byte
Public Declare Function FSOUND_FX_SetWavesReverb Lib "fmod.dll" Alias "_FSOUND_FX_SetWavesReverb@20" (ByVal fxid As Long, ByVal InGain As Single, ByVal ReverbMix As Single, ByVal ReverbTime As Single, ByVal HighFreqRTRatio As Single) As Byte

' ========================= */
' File Streaming functions. */
' ========================= */

'
'    Note : Use FSOUND_LOADMEMORY   flag with FSOUND_Stream_Open to stream from memory.
'           Use FSOUND_LOADRAW      flag with FSOUND_Stream_Open to treat stream as raw pcm data.
'           Use FSOUND_MPEGACCURATE flag with FSOUND_Stream_Open to open mpegs in 'accurate mode' for settime/gettime/getlengthms.
'           Use FSOUND_FREE as the 'channel' variable, to let FMOD pick a free channel for you.
'

Public Declare Function FSOUND_Stream_SetBufferSize Lib "fmod.dll" Alias "_FSOUND_Stream_SetBufferSize@4" (ByVal ms As Long) As Byte

Public Declare Function FSOUND_Stream_Open Lib "fmod.dll" Alias "_FSOUND_Stream_Open@16" (ByVal filename As String, ByVal mode As FSOUND_MODES, ByVal offset As Long, ByVal length As Long) As Long
Public Declare Function FSOUND_Stream_Open2 Lib "fmod.dll" Alias "_FSOUND_Stream_Open@16" (ByRef data As Byte, ByVal mode As FSOUND_MODES, ByVal offset As Long, ByVal length As Long) As Long
Public Declare Function FSOUND_Stream_Create Lib "fmod.dll" Alias "_FSOUND_Stream_Create@20" (ByVal callback As Long, ByVal length As Long, ByVal mode As Long, ByVal samplerate As Long, ByVal userdata As Long) As Long
Public Declare Function FSOUND_Stream_Close Lib "fmod.dll" Alias "_FSOUND_Stream_Close@4" (ByVal stream As Long) As Byte

Public Declare Function FSOUND_Stream_Play Lib "fmod.dll" Alias "_FSOUND_Stream_Play@8" (ByVal channel As Long, ByVal stream As Long) As Long
Public Declare Function FSOUND_Stream_PlayEx Lib "fmod.dll" Alias "_FSOUND_Stream_PlayEx@16" (ByVal channel As Long, ByVal stream As Long, ByVal dsp As Long, ByVal startpaused As Byte) As Long
Public Declare Function FSOUND_Stream_Stop Lib "fmod.dll" Alias "_FSOUND_Stream_Stop@4" (ByVal stream As Long) As Byte

Public Declare Function FSOUND_Stream_SetPosition Lib "fmod.dll" Alias "_FSOUND_Stream_SetPosition@8" (ByVal stream As Long, ByVal positition As Long) As Byte
Public Declare Function FSOUND_Stream_GetPosition Lib "fmod.dll" Alias "_FSOUND_Stream_GetPosition@4" (ByVal stream As Long) As Long
Public Declare Function FSOUND_Stream_SetTime Lib "fmod.dll" Alias "_FSOUND_Stream_SetTime@8" (ByVal stream As Long, ByVal ms As Long) As Byte
Public Declare Function FSOUND_Stream_GetTime Lib "fmod.dll" Alias "_FSOUND_Stream_GetTime@4" (ByVal stream As Long) As Long
Public Declare Function FSOUND_Stream_GetLength Lib "fmod.dll" Alias "_FSOUND_Stream_GetLength@4" (ByVal stream As Long) As Long
Public Declare Function FSOUND_Stream_GetLengthMs Lib "fmod.dll" Alias "_FSOUND_Stream_GetLengthMs@4" (ByVal stream As Long) As Long

Public Declare Function FSOUND_Stream_SetMode Lib "fmod.dll" Alias "_FSOUND_Stream_SetMode@8" (ByVal stream As Long, ByVal mode As Long) As Byte
Public Declare Function FSOUND_Stream_GetMode Lib "fmod.dll" Alias "_FSOUND_Stream_GetMode@4" (ByVal stream As Long) As Long
Public Declare Function FSOUND_Stream_SetLoopPoints Lib "fmod.dll" Alias "_FSOUND_Stream_SetLoopPoints@12" (ByVal stream As Long, ByVal loopstartpcm As Long, ByVal loopendpcm As Long) As Byte
Public Declare Function FSOUND_Stream_SetLoopCount Lib "fmod.dll" Alias "_FSOUND_Stream_SetLoopCount@8" (ByVal stream As Long, ByVal count As Long) As Byte
Public Declare Function FSOUND_Stream_GetOpenState Lib "fmod.dll" Alias "_FSOUND_Stream_GetOpenState@4" (ByVal stream As Long) As Long
Public Declare Function FSOUND_Stream_GetSample Lib "fmod.dll" Alias "_FSOUND_Stream_GetSample@4" (ByVal stream As Long) As Long
Public Declare Function FSOUND_Stream_CreateDSP Lib "fmod.dll" Alias "_FSOUND_Stream_CreateDSP@16" (ByVal stream As Long, ByVal callback As Long, ByVal Priority As Long, ByVal userdata As Long) As Long

Public Declare Function FSOUND_Stream_SetEndCallback Lib "fmod.dll" Alias "_FSOUND_Stream_SetEndCallback@12" (ByVal stream As Long, ByVal callback As Long, ByVal userdata As Long) As Byte
Public Declare Function FSOUND_Stream_SetSyncCallback Lib "fmod.dll" Alias "_FSOUND_Stream_SetSyncCallback@12" (ByVal stream As Long, ByVal callback As Long, ByVal userdata As Long) As Byte

Public Declare Function FSOUND_Stream_AddSyncPoint Lib "fmod.dll" Alias "_FSOUND_Stream_AddSyncPoint@12" (ByVal stream As Long, ByVal pcmoffset As Long, ByVal name As String) As Long
Public Declare Function FSOUND_Stream_DeleteSyncPoint Lib "fmod.dll" Alias "_FSOUND_Stream_DeleteSyncPoint@4" (ByVal point As Long) As Byte
Public Declare Function FSOUND_Stream_GetNumSyncPoints Lib "fmod.dll" Alias "_FSOUND_Stream_GetNumSyncPoints@4" (ByVal stream As Long) As Long
Public Declare Function FSOUND_Stream_GetSyncPoint Lib "fmod.dll" Alias "_FSOUND_Stream_GetSyncPoint@8" (ByVal stream As Long, ByVal index As Long) As Long
Public Declare Function FSOUND_Stream_GetSyncPointInfo Lib "fmod.dll" Alias "_FSOUND_Stream_GetSyncPointInfo@8" (ByVal point As Long, ByRef pcmoffset As Long) As Long

Public Declare Function FSOUND_Stream_SetSubStream Lib "fmod.dll" Alias "_FSOUND_Stream_SetSubStream@8" (ByVal stream As Long, ByVal index As Long) As Byte
Public Declare Function FSOUND_Stream_GetNumSubStreams Lib "fmod.dll" Alias "_FSOUND_Stream_GetNumSubStreams@4" (ByVal stream As Long) As Long
Public Declare Function FSOUND_Stream_SetSubStreamSentence Lib "fmod.dll" Alias "_FSOUND_Stream_SetSubStreamSentence@12" (ByVal stream As Long, ByRef sentencelist As Long, ByVal numitems As Long) As Byte

Public Declare Function FSOUND_Stream_GetNumTagFields Lib "fmod.dll" Alias "_FSOUND_Stream_GetNumTagFields@8" (ByVal stream As Long, ByRef num As Long) As Byte
Public Declare Function FSOUND_Stream_GetTagField Lib "fmod.dll" Alias "_FSOUND_Stream_GetTagField@24" (ByVal stream As Long, ByVal num As Long, ByRef tagtype As Long, ByRef name As Long, ByRef value As Long, ByRef length As Long) As Byte
Public Declare Function FSOUND_Stream_FindTagField Lib "fmod.dll" Alias "_FSOUND_Stream_FindTagField@20" (ByVal stream As Long, ByVal tagtype As Long, ByVal name As String, ByRef value As Long, ByRef length As Long) As Byte

'
'   Internet streaming functions
'

Public Declare Function FSOUND_Stream_Net_SetProxy Lib "fmod.dll" Alias "_FSOUND_Stream_Net_SetProxy@4" (ByVal proxy As String) As Byte
Public Declare Function FSOUND_Stream_Net_GetLastServerStatus Lib "fmod.dll" Alias "_FSOUND_Stream_Net_GetLastServerStatus@0" () As Long
Public Declare Function FSOUND_Stream_Net_SetBufferProperties Lib "fmod.dll" Alias "_FSOUND_Stream_Net_SetBufferProperties@12" (ByVal buffersize As Long, ByVal prebuffer_percent As Long, ByVal rebuffer_percent As Long) As Byte
Public Declare Function FSOUND_Stream_Net_GetBufferProperties Lib "fmod.dll" Alias "_FSOUND_Stream_Net_GetBufferProperties@12" (ByRef buffersize As Long, ByRef prebuffer_percent As Long, ByRef rebuffer_percent As Long) As Byte
Public Declare Function FSOUND_Stream_Net_SetMetadataCallback Lib "fmod.dll" Alias "_FSOUND_Stream_Net_SetMetadataCallback@12" (ByVal stream As Long, ByVal callback As Long, ByVal userdata As Long) As Byte
Public Declare Function FSOUND_Stream_Net_GetStatus Lib "fmod.dll" Alias "_FSOUND_Stream_Net_GetStatus@20" (ByVal stream As Long, ByRef status As Long, ByRef bufferpercentused As Long, ByRef bitrate As Long, ByRef flags As Long) As Byte

'/* =================== */
'/* CD audio functions. */
'/* =================== */


'   Note : 0 = default cdrom.  Otherwise specify the drive letter, for example. 'D'.


Public Declare Function FSOUND_CD_Play Lib "fmod.dll" Alias "_FSOUND_CD_Play@8" (ByVal drive As Byte, ByVal Track As Long) As Byte
Public Declare Function FSOUND_CD_SetPlayMode Lib "fmod.dll" Alias "_FSOUND_CD_SetPlayMode@8" (ByVal drive As Byte, ByVal mode As FSOUND_CDPLAYMODES) As Long
Public Declare Function FSOUND_CD_Stop Lib "fmod.dll" Alias "_FSOUND_CD_Stop@4" (ByVal drive As Byte) As Byte
Public Declare Function FSOUND_CD_SetPaused Lib "fmod.dll" Alias "_FSOUND_CD_SetPaused@8" (ByVal drive As Byte, ByVal Paused As Byte) As Byte
Public Declare Function FSOUND_CD_SetVolume Lib "fmod.dll" Alias "_FSOUND_CD_SetVolume@8" (ByVal drive As Byte, ByVal volume As Long) As Byte
Public Declare Function FSOUND_CD_SetTrackTime Lib "fmod.dll" Alias "_FSOUND_CD_SetTrackTime@8" (ByVal drive As Byte, ByVal ms As Long) As Byte
Public Declare Function FSOUND_CD_OpenTray Lib "fmod.dll" Alias "_FSOUND_CD_OpenTray@8" (ByVal drive As Byte, ByVal openState As Byte) As Byte

Public Declare Function FSOUND_CD_GetPaused Lib "fmod.dll" Alias "_FSOUND_CD_GetPaused@4" (ByVal drive As Byte) As Byte
Public Declare Function FSOUND_CD_GetTrack Lib "fmod.dll" Alias "_FSOUND_CD_GetTrack@4" (ByVal drive As Byte) As Long
Public Declare Function FSOUND_CD_GetNumTracks Lib "fmod.dll" Alias "_FSOUND_CD_GetNumTracks@4" (ByVal drive As Byte) As Long
Public Declare Function FSOUND_CD_GetVolume Lib "fmod.dll" Alias "_FSOUND_CD_GetVolume@4" (ByVal drive As Byte) As Long
Public Declare Function FSOUND_CD_GetTrackLength Lib "fmod.dll" Alias "_FSOUND_CD_GetTrackLength@8" (ByVal drive As Byte, ByVal Track As Long) As Long
Public Declare Function FSOUND_CD_GetTrackTime Lib "fmod.dll" Alias "_FSOUND_CD_GetTrackTime@4" (ByVal drive As Byte) As Long

'/* ============== */
'/* DSP functions. */
'/* ============== */

 
'   DSP Unit control and information functions.
'   These functions allow you access to the mixed stream that FMOD uses to play back sound on.


Public Declare Function FSOUND_DSP_Create Lib "fmod.dll" Alias "_FSOUND_DSP_Create@12" (ByVal callback As Long, ByVal Priority As Long, ByVal param As Long) As Long
Public Declare Function FSOUND_DSP_Free Lib "fmod.dll" Alias "_FSOUND_DSP_Free@4" (ByVal unit As Long) As Long
Public Declare Function FSOUND_DSP_SetPriority Lib "fmod.dll" Alias "_FSOUND_DSP_SetPriority@8" (ByVal unit As Long, ByVal Priority As Long) As Long
Public Declare Function FSOUND_DSP_GetPriority Lib "fmod.dll" Alias "_FSOUND_DSP_GetPriority@4" (ByVal unit As Long) As Long
Public Declare Function FSOUND_DSP_SetActive Lib "fmod.dll" Alias "_FSOUND_DSP_SetActive@8" (ByVal unit As Long, ByVal active As Integer) As Long
Public Declare Function FSOUND_DSP_GetActive Lib "fmod.dll" Alias "_FSOUND_DSP_GetActive@4" (ByVal unit As Long) As Byte


'   Functions to get hold of FSOUND 'system DSP unit' handles


Public Declare Function FSOUND_DSP_GetClearUnit Lib "fmod.dll" Alias "_FSOUND_DSP_GetClearUnit@0" () As Long
Public Declare Function FSOUND_DSP_GetSFXUnit Lib "fmod.dll" Alias "_FSOUND_DSP_GetSFXUnit@0" () As Long
Public Declare Function FSOUND_DSP_GetMusicUnit Lib "fmod.dll" Alias "_FSOUND_DSP_GetMusicUnit@0" () As Long
Public Declare Function FSOUND_DSP_GetFFTUnit Lib "fmod.dll" Alias "_FSOUND_DSP_GetFFTUnit@0" () As Long
Public Declare Function FSOUND_DSP_GetClipAndCopyUnit Lib "fmod.dll" Alias "_FSOUND_DSP_GetClipAndCopyUnit@0" () As Long


'   Miscellaneous DSP functions
'   Note for the spectrum analysis function to work, you have to enable the FFT DSP unit with
'   the following code FSOUND_DSP_SetActive(FSOUND_DSP_GetFFTUnit(), TRUE);
'   It is off by default to save cpu usage.


Public Declare Function FSOUND_DSP_MixBuffers Lib "fmod.dll" Alias "_FSOUND_DSP_MixBuffers@28" (ByVal destbuffer As Long, ByVal srcbuffer As Long, ByVal length As Long, ByVal freq As Long, ByVal Vol As Long, ByVal pan As Long, ByVal mode As Long) As Byte
Public Declare Function FSOUND_DSP_ClearMixBuffer Lib "fmod.dll" Alias "_FSOUND_DSP_ClearMixBuffer@0" () As Long
Public Declare Function FSOUND_DSP_GetBufferLength Lib "fmod.dll" Alias "_FSOUND_DSP_GetBufferLength@0" () As Long
Public Declare Function FSOUND_DSP_GetBufferLengthTotal Lib "fmod.dll" Alias "_FSOUND_DSP_GetBufferLengthTotal@0" () As Long
Public Declare Function FSOUND_DSP_GetSpectrum Lib "fmod.dll" Alias "_FSOUND_DSP_GetSpectrum@0" () As Long

'/* =================================================================================== */
'/* Reverb functions. (eax2/eax3 reverb)  (ONLY SUPPORTED ON WIN32 W/ FSOUND_HW3D FLAG) */
'/* =================================================================================== */


'   See top of file for definitions and information on the reverb parameters.

'The FSOUND_REVERB_PRESETS have not been included in VB yet so they cannot yet be used here...
Public Declare Function FSOUND_Reverb_SetProperties Lib "fmod.dll" Alias "_FSOUND_Reverb_SetProperties@4" (ByRef prop As FSOUND_REVERB_PROPERTIES) As Byte
Public Declare Function FSOUND_Reverb_GetProperties Lib "fmod.dll" Alias "_FSOUND_Reverb_GetProperties@4" (ByRef prop As FSOUND_REVERB_PROPERTIES) As Byte
Public Declare Function FSOUND_Reverb_SetChannelProperties Lib "fmod.dll" Alias "_FSOUND_Reverb_SetChannelProperties@8" (ByVal channel As Long, ByRef prop As FSOUND_REVERB_CHANNELPROPERTIES) As Byte
Public Declare Function FSOUND_Reverb_GetChannelProperties Lib "fmod.dll" Alias "_FSOUND_Reverb_GetChannelProperties@8" (ByVal channel As Long, ByRef prop As FSOUND_REVERB_CHANNELPROPERTIES) As Byte

'/* ===================================================== */
'/* Recording functions  (ONLY SUPPORTED IN WIN32, WINCE) */
'/* ===================================================== */


'    Recording initialization functions


Public Declare Function FSOUND_Record_SetDriver Lib "fmod.dll" Alias "_FSOUND_Record_SetDriver@4" (ByVal outputtype As Long) As Byte
Public Declare Function FSOUND_Record_GetNumDrivers Lib "fmod.dll" Alias "_FSOUND_Record_GetNumDrivers@0" () As Long
Public Declare Function FSOUND_Record_GetDriverName Lib "fmod.dll" Alias "_FSOUND_Record_GetDriverName@4" (ByVal id As Long) As Long
Public Declare Function FSOUND_Record_GetDriver Lib "fmod.dll" Alias "_FSOUND_Record_GetDriver@0" () As Long


'    Recording functionality.  Only one recording session will work at a time.


Public Declare Function FSOUND_Record_StartSample Lib "fmod.dll" Alias "_FSOUND_Record_StartSample@8" (ByVal sample As Long, ByVal loopit As Boolean) As Byte
Public Declare Function FSOUND_Record_Stop Lib "fmod.dll" Alias "_FSOUND_Record_Stop@0" () As Byte
Public Declare Function FSOUND_Record_GetPosition Lib "fmod.dll" Alias "_FSOUND_Record_GetPosition@0" () As Long

'/* ========================================================================================== */
'/* FMUSIC API (MOD,S3M,XM,IT,MIDI PLAYBACK)                                                   */
'/* ========================================================================================== */

 
'   Song management / playback functions.


Public Declare Function FMUSIC_LoadSong Lib "fmod.dll" Alias "_FMUSIC_LoadSong@4" (ByVal name As String) As Long
Public Declare Function FMUSIC_LoadSongEx Lib "fmod.dll" Alias "_FMUSIC_LoadSongEx@24" (ByVal name As String, ByVal offset As Long, ByVal length As Long, ByVal mode As FSOUND_MODES, ByRef sentencelist As Long, ByVal numitems As Long) As Long
Public Declare Function FMUSIC_LoadSongEx2 Lib "fmod.dll" Alias "_FMUSIC_LoadSongEx@24" (ByRef data As Byte, ByVal offset As Long, ByVal length As Long, ByVal mode As FSOUND_MODES, ByRef sentencelist As Long, ByVal numitems As Long) As Long
Public Declare Function FMUSIC_GetOpenState Lib "fmod.dll" Alias "_FMUSIC_GetOpenState@4" (ByVal module As Long) As Long
Public Declare Function FMUSIC_FreeSong Lib "fmod.dll" Alias "_FMUSIC_FreeSong@4" (ByVal module As Long) As Byte
Public Declare Function FMUSIC_PlaySong Lib "fmod.dll" Alias "_FMUSIC_PlaySong@4" (ByVal module As Long) As Byte
Public Declare Function FMUSIC_StopSong Lib "fmod.dll" Alias "_FMUSIC_StopSong@4" (ByVal module As Long) As Byte
Public Declare Function FMUSIC_StopAllSongs Lib "fmod.dll" Alias "_FMUSIC_StopAllSongs@0" () As Long

Public Declare Function FMUSIC_SetZxxCallback Lib "fmod.dll" Alias "_FMUSIC_SetZxxCallback@8" (ByVal module As Long, ByVal callback As Long) As Byte
Public Declare Function FMUSIC_SetRowCallback Lib "fmod.dll" Alias "_FMUSIC_SetRowCallback@12" (ByVal module As Long, ByVal callback As Long, ByVal rowstep As Long) As Byte
Public Declare Function FMUSIC_SetOrderCallback Lib "fmod.dll" Alias "_FMUSIC_SetOrderCallback@12" (ByVal module As Long, ByVal callback As Long, ByVal rowstep As Long) As Byte
Public Declare Function FMUSIC_SetInstCallback Lib "fmod.dll" Alias "_FMUSIC_SetInstCallback@12" (ByVal module As Long, ByVal callback As Long, ByVal instrument As Long) As Byte

Public Declare Function FMUSIC_SetSample Lib "fmod.dll" Alias "_FMUSIC_SetSample@12" (ByVal module As Long, ByVal sampno As Long, ByVal sptr As Long) As Byte
Public Declare Function FMUSIC_SetUserData Lib "fmod.dll" Alias "_FMUSIC_SetUserData@8" (ByVal module As Long, ByVal userdata As Long) As Byte
Public Declare Function FMUSIC_OptimizeChannels Lib "fmod.dll" Alias "_FMUSIC_OptimizeChannels@12" (ByVal module As Long, ByVal maxchannels As Long, ByVal minvolume As Long) As Byte


'   Runtime song functions


Public Declare Function FMUSIC_SetReverb Lib "fmod.dll" Alias "_FMUSIC_SetReverb@4" (ByVal Reverb As Byte) As Byte
Public Declare Function FMUSIC_SetLooping Lib "fmod.dll" Alias "_FMUSIC_SetLooping@8" (ByVal module As Long, ByVal looping As Byte) As Byte
Public Declare Function FMUSIC_SetOrder Lib "fmod.dll" Alias "_FMUSIC_SetOrder@8" (ByVal module As Long, ByVal order As Long) As Byte
Public Declare Function FMUSIC_SetPaused Lib "fmod.dll" Alias "_FMUSIC_SetPaused@8" (ByVal module As Long, ByVal Pause As Byte) As Byte
Public Declare Function FMUSIC_SetMasterVolume Lib "fmod.dll" Alias "_FMUSIC_SetMasterVolume@8" (ByVal module As Long, ByVal volume As Long) As Byte
Public Declare Function FMUSIC_SetMasterSpeed Lib "fmod.dll" Alias "_FMUSIC_SetMasterSpeed@8" (ByVal module As Long, ByVal speed As Single) As Byte
Public Declare Function FMUSIC_SetPanSeperation Lib "fmod.dll" Alias "_FMUSIC_SetPanSeperation@8" (ByVal module As Long, ByVal pansep As Single) As Byte


'   Static song information functions


Public Declare Function FMUSIC_GetName Lib "fmod.dll" Alias "_FMUSIC_GetName@4" (ByVal module As Long) As Long
Public Declare Function FMUSIC_GetType Lib "fmod.dll" Alias "_FMUSIC_GetType@4" (ByVal module As Long) As FMUSIC_TYPES
Public Declare Function FMUSIC_GetNumOrders Lib "fmod.dll" Alias "_FMUSIC_GetNumOrders@4" (ByVal module As Long) As Long
Public Declare Function FMUSIC_GetNumPatterns Lib "fmod.dll" Alias "_FMUSIC_GetNumPatterns@4" (ByVal module As Long) As Long
Public Declare Function FMUSIC_GetNumInstruments Lib "fmod.dll" Alias "_FMUSIC_GetNumInstruments@4" (ByVal module As Long) As Long
Public Declare Function FMUSIC_GetNumSamples Lib "fmod.dll" Alias "_FMUSIC_GetNumSamples@4" (ByVal module As Long) As Long
Public Declare Function FMUSIC_GetNumChannels Lib "fmod.dll" Alias "_FMUSIC_GetNumChannels@4" (ByVal module As Long) As Long
Public Declare Function FMUSIC_GetSample Lib "fmod.dll" Alias "_FMUSIC_GetSample@8" (ByVal module As Long, ByVal sampno As Long) As Long
Public Declare Function FMUSIC_GetPatternLength Lib "fmod.dll" Alias "_FMUSIC_GetPatternLength@8" (ByVal module As Long, ByVal orderno As Long) As Long


'   Runtime song information


Public Declare Function FMUSIC_IsFinished Lib "fmod.dll" Alias "_FMUSIC_IsFinished@4" (ByVal module As Long) As Byte
Public Declare Function FMUSIC_IsPlaying Lib "fmod.dll" Alias "_FMUSIC_IsPlaying@4" (ByVal module As Long) As Byte
Public Declare Function FMUSIC_GetMasterVolume Lib "fmod.dll" Alias "_FMUSIC_GetMasterVolume@4" (ByVal module As Long) As Long
Public Declare Function FMUSIC_GetGlobalVolume Lib "fmod.dll" Alias "_FMUSIC_GetGlobalVolume@4" (ByVal module As Long) As Long
Public Declare Function FMUSIC_GetOrder Lib "fmod.dll" Alias "_FMUSIC_GetOrder@4" (ByVal module As Long) As Long
Public Declare Function FMUSIC_GetPattern Lib "fmod.dll" Alias "_FMUSIC_GetPattern@4" (ByVal module As Long) As Long
Public Declare Function FMUSIC_GetSpeed Lib "fmod.dll" Alias "_FMUSIC_GetSpeed@4" (ByVal module As Long) As Long
Public Declare Function FMUSIC_GetBPM Lib "fmod.dll" Alias "_FMUSIC_GetBPM@4" (ByVal module As Long) As Long
Public Declare Function FMUSIC_GetRow Lib "fmod.dll" Alias "_FMUSIC_GetRow@4" (ByVal module As Long) As Long
Public Declare Function FMUSIC_GetPaused Lib "fmod.dll" Alias "_FMUSIC_GetPaused@4" (ByVal module As Long) As Byte
Public Declare Function FMUSIC_GetTime Lib "fmod.dll" Alias "_FMUSIC_GetTime@4" (ByVal module As Long) As Long
Public Declare Function FMUSIC_GetRealChannel Lib "fmod.dll" Alias "_FMUSIC_GetRealChannel@8" (ByVal module As Long, ByVal modchannel As Long) As Long
Public Declare Function FMUSIC_GetUserData Lib "fmod.dll" Alias "_FMUSIC_GetUserData@4" (ByVal module As Long) As Long

'************
'* Windows Declarations (Added by Adion)
'************
'Required for GetStringFromPointer
Private Declare Function ConvCStringToVBString Lib "kernel32" Alias "lstrcpyA" (ByVal lpsz As String, ByVal pt As Long) As Long ' Notice the As Long return value replacing the As String given by the API Viewer.
'Required for the FFT/Spectral functions
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal length As Long)

'************
'* FUNCTIONS (Added by Adion)
'************
'Usage: myerrorstring = FSOUND_GetErrorString(FSOUND_GetError)
Public Function FSOUND_GetErrorString(ByVal errorcode As Long) As String
    Select Case errorcode
        Case FMOD_ERR_NONE:             FSOUND_GetErrorString = "No errors"
        Case FMOD_ERR_BUSY:             FSOUND_GetErrorString = "Cannot call this command after FSOUND_Init.  Call FSOUND_Close first."
        Case FMOD_ERR_UNINITIALIZED:    FSOUND_GetErrorString = "This command failed because FSOUND_Init was not called"
        Case FMOD_ERR_PLAY:             FSOUND_GetErrorString = "Playing the sound failed."
        Case FMOD_ERR_INIT:             FSOUND_GetErrorString = "Error initializing output device."
        Case FMOD_ERR_ALLOCATED:        FSOUND_GetErrorString = "The output device is already in use and cannot be reused."
        Case FMOD_ERR_OUTPUT_FORMAT:    FSOUND_GetErrorString = "Soundcard does not support the features needed for this soundsystem (16bit stereo output)"
        Case FMOD_ERR_COOPERATIVELEVEL: FSOUND_GetErrorString = "Error setting cooperative level for hardware."
        Case FMOD_ERR_CREATEBUFFER:     FSOUND_GetErrorString = "Error creating hardware sound buffer."
        Case FMOD_ERR_FILE_NOTFOUND:    FSOUND_GetErrorString = "File not found"
        Case FMOD_ERR_FILE_FORMAT:      FSOUND_GetErrorString = "Unknown file format"
        Case FMOD_ERR_FILE_BAD:         FSOUND_GetErrorString = "Error loading file"
        Case FMOD_ERR_MEMORY:           FSOUND_GetErrorString = "Not enough memory "
        Case FMOD_ERR_VERSION:          FSOUND_GetErrorString = "The version number of this file format is not supported"
        Case FMOD_ERR_INVALID_PARAM:    FSOUND_GetErrorString = "An invalid parameter was passed to this function"
        Case FMOD_ERR_NO_EAX:           FSOUND_GetErrorString = "Tried to use an EAX command on a non EAX enabled channel or output."
        Case FMOD_ERR_CHANNEL_ALLOC:    FSOUND_GetErrorString = "Failed to allocate a new channel"
        Case FMOD_ERR_RECORD:           FSOUND_GetErrorString = "Recording is not supported on this machine"
        Case FMOD_ERR_MEDIAPLAYER:      FSOUND_GetErrorString = "Required Mediaplayer codec is not installed"
        Case FMOD_ERR_CDDEVICE:         FSOUND_GetErrorString = "An error occured trying to open the specified CD device"
        Case Else:                      FSOUND_GetErrorString = "Unknown error"
    End Select
End Function

'Thanks to KarLKoX for the following function
'Example: MyDriverName = GetStringFromPointer(FSOUND_GetDriverName(count))
Public Function GetStringFromPointer(ByVal lpString As Long) As String
Dim NullCharPos As Long
Dim szBuffer As String

    szBuffer = String(255, 0)
    ConvCStringToVBString szBuffer, lpString
    ' Look for the null char ending the C string
    NullCharPos = InStr(szBuffer, vbNullChar)
    GetStringFromPointer = Left(szBuffer, NullCharPos - 1)
End Function

'These functions are added by Adion
Public Function GetSingleFromPointer(ByVal lpSingle As Long) As Single
'A Single is 4 bytes, so we copy 4 bytes
CopyMemory GetSingleFromPointer, ByVal lpSingle, 4
End Function
'Warning: You should set the fft dsp to active before retreiving the spectrum
'Also make sure the array you pass is dimensioned and ready to use
'FSOUND_DSP_SetActive FSOUND_DSP_GetFFTUnit, 1
Public Function GetSpectrum(ByRef Spectrum() As Single)
Dim nrOfVals As Long, lpSpectrum As Long
Dim a As Long
If UBound(Spectrum) > 511 Then nrOfVals = 512 Else nrOfVals = UBound(Spectrum) + 1
lpSpectrum = FSOUND_DSP_GetSpectrum
CopyMemory Spectrum(0), ByVal lpSpectrum, nrOfVals * 4
End Function
