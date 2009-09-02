#ifndef _REVERB_H
#define _REVERB_H

#define PREVERB_NUMTAPS	3
#define REVERB_NUMTAPS	7

#include "../../api/inc/fmod.h"

typedef struct
{
	FSOUND_DSPUNIT	*Unit;
	char			*historybuff;		/* storage space for tap history */
	char			*workarea;			/* a place to hold 1 buffer worth of data (for preverb) */
	char			*workarea2;			/* a temporary 16bit stereo place to convert from the mixer format to 16bit stereo for mixing */
	int				delayms;			/* delay of p/reverb tab in milliseconds */
	int				volume;				/* volume of p/reverb tab */
	int				pan;				/* pan of p/reverb tab */
	int				historyoffset;		/* running offset into history buffer */
	int				historylen;			/* size of history buffer in SAMPLES */
} REVERBTAP;

#ifdef __cplusplus
extern "C" {
#endif

/*
    Preverb stuff
*/
extern REVERBTAP		PreverbTap[];

/*
    Reverb stuff
*/
extern REVERBTAP		ReverbTap[];

void Reverb_Init();
void Reverb_Close();

#ifdef __cplusplus
}
#endif

#endif