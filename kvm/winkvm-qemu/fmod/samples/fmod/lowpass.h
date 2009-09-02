#ifndef _LOWPASS_H
#define _LOWPASS_H


/* FILTER INFORMATION STRUCTURE FOR FILTER ROUTINES */

#define FILTER_SECTIONS   2   /* 2 filter sections for 24 db/oct filter */

typedef struct {
    unsigned int length;       /* size of filter */
    float history[2 * FILTER_SECTIONS];    /* history in filter */
    float *coef;               /* pointer to coefficients of filter */
} FILTER;

typedef struct {
        double a0, a1, a2;       /* numerator coefficients */
        double b0, b1, b2;       /* denominator coefficients */
} BIQUAD;

BIQUAD ProtoCoef[FILTER_SECTIONS];      /* Filter prototype coefficients,
                                                     1 for each filter section */

void szxform(
    double *a0, double *a1, double *a2,     /* numerator coefficients */
    double *b0, double *b1, double *b2,   /* denominator coefficients */
    double fc,           /* Filter cutoff frequency */
    double fs,           /* sampling rate */
    double *k,           /* overall gain factor */
    float *coef);         /* pointer to 4 iir coefficients */



#ifdef __cplusplus
	extern "C" {
#endif

	signed char LowPass_Init();
	void		LowPass_Close();
	float		LowPass_Filter(float input);
	void		LowPass_Update(float resonance, float cutoff, int samplerate);

#ifdef __cplusplus
	}
#endif

#endif