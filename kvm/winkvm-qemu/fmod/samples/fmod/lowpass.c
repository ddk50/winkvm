/* 
Resonant low pass filter source code.
By baltrax@hotmail.com (Zxform)

- little changes and optimizations by Brett Paterson for FMOD example.

*/

#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#include "lowpass.h"

/**************************************************************************

FILTER.C - Source code for filter functions

    iir_filter         IIR filter floats sample by sample (real time)

*************************************************************************/

FILTER   iir;

/*
 * --------------------------------------------------------------------
 * 
 * iir_filter - Perform IIR filtering sample by sample on floats
 * 
 * Implements cascaded direct form II second order sections.
 * Requires FILTER structure for history and coefficients.
 * The length in the filter structure specifies the number of sections.
 * The size of the history array is 2*iir.length.
 * The size of the coefficient array is 4*iir.length + 1 because
 * the first coefficient is the overall scale factor for the filter.
 * Returns one output sample for each input sample.  Allocates history
 * array if not previously allocated.
 * 
 * float iir_filter(float input,FILTER *iir)
 * 
 *     float input        new float input sample
 *     FILTER *iir        pointer to FILTER structure
 * 
 * Returns float value giving the current output.
 * 
 * Allocation errors cause an error message and a call to exit.
 * --------------------------------------------------------------------
 */
float LowPass_Filter(float input)
{
    unsigned int i;
    float *hist1_ptr,*hist2_ptr,*coef_ptr;
    float output,new_hist,history1,history2;
    static float dc = (float)1E-25;
    input += dc;
    dc = -dc;

	/* allocate history array if different size than last call */

    coef_ptr = iir.coef;                /* coefficient pointer */

    hist1_ptr = iir.history;            /* first history */
    hist2_ptr = hist1_ptr + 1;           /* next history */

    /* 1st number of coefficients array is overall input scale factor,
     * or filter gain */
    output = input * (*coef_ptr++);

    for (i = 0 ; i < iir.length; i++)
    {
        history1 = *hist1_ptr;           /* history values */
        history2 = *hist2_ptr;

        output   = output - history1 * coef_ptr[0];
        new_hist = output - history2 * coef_ptr[1];    /* poles */

        output = new_hist + history1 * coef_ptr[2];
        output = output   + history2 * coef_ptr[3];    /* zeros */

        coef_ptr += 4;
        *hist2_ptr++ = *hist1_ptr;
        *hist1_ptr++ = new_hist;
        hist1_ptr++;
        hist2_ptr++;
    }

    return(output);
}


void LowPass_Update(float resonance, float cutoff, int samplerate)
{
    unsigned nInd;
    double   a0, a1, a2, b0, b1, b2;
    double   fs;    /* Sampling frequency, cutoff frequency */
    double   k;           /* overall gain factor */
    float    *coef;

	k = 1.0;				/* Set overall filter gain */
	coef = iir.coef + 1;		/* Skip k, or gain */
	fs = (double)samplerate;    /* Sampling frequency (Hz) */

/*
 * Compute z-domain coefficients for each biquad section
 * for new Cutoff Frequency and Resonance
 */
    for (nInd = 0; nInd < iir.length; nInd++)
    {
             a0 = ProtoCoef[nInd].a0;
             a1 = ProtoCoef[nInd].a1;
             a2 = ProtoCoef[nInd].a2;

             b0 = ProtoCoef[nInd].b0;
             b1 = ProtoCoef[nInd].b1 / resonance;      /* Divide by resonance or Q */
             b2 = ProtoCoef[nInd].b2;
             szxform(&a0, &a1, &a2, &b0, &b1, &b2, cutoff, fs, &k, coef);
             coef += 4;                       /* Point to next filter section */
    }

    /* Update overall filter gain in coef array */
    iir.coef[0] = (float)k;
}


/*
 * --------------------------------------------------------------------
 * 
 * initn()
 * 
 * Example main function to show how to update filter coefficients.
 * We create a 4th order filter (24 db/oct roloff), consisting
 * of two second order sections.
 * --------------------------------------------------------------------
 */
signed char LowPass_Init()
{

/*
 * Setup filter s-domain coefficients
 */
	/* Section 1 */       
	ProtoCoef[0].a0 = 1.0;
	ProtoCoef[0].a1 = 0;
	ProtoCoef[0].a2 = 0;
	ProtoCoef[0].b0 = 1.0;
	ProtoCoef[0].b1 = 0.765367;
	ProtoCoef[0].b2 = 1.0;
	
	/* Section 2 */       
	ProtoCoef[1].a0 = 1.0;
	ProtoCoef[1].a1 = 0;
	ProtoCoef[1].a2 = 0;
	ProtoCoef[1].b0 = 1.0;
	ProtoCoef[1].b1 = 1.847759;
	ProtoCoef[1].b2 = 1.0;

	iir.length = FILTER_SECTIONS;         /* Number of filter sections */

/*
 * Allocate array of z-domain coefficients for each filter section
 * plus filter gain variable
 */
	iir.coef = (float *) calloc(4 * iir.length + 1, sizeof(float));
	if (!iir.coef)
	{
//		 printf("Unable to allocate coef array, exiting\n");
		 return 0;
	}

	LowPass_Update(1.0, 5000.0, 44100);

    /* Display filter coefficients */
//    for (nInd = 0; nInd < (iir.length * 4 + 1); nInd++)
//             printf("C[%d] = %15.10f\n", nInd, iir.coef[nInd]);
/*
 * To process audio samples, call function iir_filter()
 * for each audio sample
 */
   return 1;
}

void LowPass_Close()
{
}


/*
 * ----------------------------------------------------------
 *      bilinear.c
 *
 *      Perform bilinear transformation on s-domain coefficients
 *      of 2nd order biquad section.
 *      First design an analog filter and use s-domain coefficients
 *      as input to szxform() to convert them to z-domain.
 *
 * Here's the butterworth polinomials for 2nd, 4th and 6th order sections.
 *      When we construct a 24 db/oct filter, we take to 2nd order
 *      sections and compute the coefficients separately for each section.
 *
 *      n       Polinomials
 * --------------------------------------------------------------------
 *      2       s^2 + 1.4142s +1
 *      4       (s^2 + 0.765367s + 1) (s^2 + 1.847759s + 1)
 *      6       (s^2 + 0.5176387s + 1) (s^2 + 1.414214 + 1) (s^2 + 1.931852s + 1)
 *
 *      Where n is a filter order.
 *      For n=4, or two second order sections, we have following equasions for each
 *      2nd order stage:
 *
 *      (1 / (s^2 + (1/Q) * 0.765367s + 1)) * (1 / (s^2 + (1/Q) * 1.847759s + 1))
 *
 *      Where Q is filter quality factor in the range of
 *      1 to 1000. The overall filter Q is a product of all
 *      2nd order stages. For example, the 6th order filter
 *      (3 stages, or biquads) with individual Q of 2 will
 *      have filter Q = 2 * 2 * 2 = 8.
 *
 *      The nominator part is just 1.
 *      The denominator coefficients for stage 1 of filter are:
 *      b2 = 1; b1 = 0.765367; b0 = 1;
 *      numerator is
 *      a2 = 0; a1 = 0; a0 = 1;
 *
 *      The denominator coefficients for stage 1 of filter are:
 *      b2 = 1; b1 = 1.847759; b0 = 1;
 *      numerator is
 *      a2 = 0; a1 = 0; a0 = 1;
 *
 *      These coefficients are used directly by the szxform()
 *      and bilinear() functions. For all stages the numerator
 *      is the same and the only thing that is different between
 *      different stages is 1st order coefficient. The rest of
 *      coefficients are the same for any stage and equal to 1.
 *
 *      Any filter could be constructed using this approach.
 *
 *      References:
 *             Van Valkenburg, "Analog Filter Design"
 *             Oxford University Press 1982
 *             ISBN 0-19-510734-9
 *
 *             C Language Algorithms for Digital Signal Processing
 *             Paul Embree, Bruce Kimble
 *             Prentice Hall, 1991
 *             ISBN 0-13-133406-9
 *
 *             Digital Filter Designer's Handbook
 *             With C++ Algorithms
 *             Britton Rorabaugh
 *             McGraw Hill, 1997
 *             ISBN 0-07-053806-9
 * ----------------------------------------------------------
 */

void prewarp(double *a0, double *a1, double *a2, double fc, double fs);
void bilinear(
    double a0, double a1, double a2,    /* numerator coefficients */
    double b0, double b1, double b2,    /* denominator coefficients */
    double *k,                                   /* overall gain factor */
    double fs,                                   /* sampling rate */
    float *coef);                         /* pointer to 4 iir coefficients */


/*
 * ----------------------------------------------------------
 *      Pre-warp the coefficients of a numerator or denominator.
 *      Note that a0 is assumed to be 1, so there is no wrapping
 *      of it.
 * ----------------------------------------------------------
 */
void prewarp(
    double *a0, double *a1, double *a2,
    double fc, double fs)
{
    double wp, pi;

    pi = 4.0 * atan(1.0);
    wp = 2.0 * fs * tan(pi * fc / fs);

    *a2 = (*a2) / (wp * wp);
    *a1 = (*a1) / wp;
}


/*
 * ----------------------------------------------------------
 * bilinear()
 *
 * Transform the numerator and denominator coefficients
 * of s-domain biquad section into corresponding
 * z-domain coefficients.
 *
 *      Store the 4 IIR coefficients in array pointed by coef
 *      in following order:
 *             beta1, beta2    (denominator)
 *             alpha1, alpha2  (numerator)
 *
 * Arguments:
 *             a0-a2   - s-domain numerator coefficients
 *             b0-b2   - s-domain denominator coefficients
 *             k               - filter gain factor. initially set to 1
 *                                and modified by each biquad section in such
 *                                a way, as to make it the coefficient by
 *                                which to multiply the overall filter gain
 *                                in order to achieve a desired overall filter gain,
 *                                specified in initial value of k.
 *             fs             - sampling rate (Hz)
 *             coef    - array of z-domain coefficients to be filled in.
 *
 * Return:
 *             On return, set coef z-domain coefficients
 * ----------------------------------------------------------
 */
void bilinear(
    double a0, double a1, double a2,	/* numerator coefficients */
    double b0, double b1, double b2,	/* denominator coefficients */
    double *k,							/* overall gain factor */
    double fs,							/* sampling rate */
    float *coef							/* pointer to 4 iir coefficients */
)
{
    double ad, bd;

	/* alpha (Numerator in s-domain) */
    ad = 4. * a2 * fs * fs + 2. * a1 * fs + a0;
	/* beta (Denominator in s-domain) */
    bd = 4. * b2 * fs * fs + 2. * b1* fs + b0;

	/* update gain constant for this section */
    *k *= ad/bd;

	/* Denominator */
    *coef++ = (float)((2. * b0 - 8. * b2 * fs * fs)           / bd); /* beta1 */
    *coef++ = (float)((4. * b2 * fs * fs - 2. * b1 * fs + b0) / bd); /* beta2 */

	/* Nominator */
    *coef++ = (float)((2. * a0 - 8. * a2 * fs * fs) / ad);			 /* alpha1 */
    *coef   = (float)((4. * a2 * fs * fs - 2. * a1 * fs + a0) / ad); /* alpha2 */
}


/*
 * ----------------------------------------------------------
 * Transform from s to z domain using bilinear transform
 * with prewarp.
 *
 * Arguments:
 *      For argument description look at bilinear()
 *
 *      coef - pointer to array of floating point coefficients,
 *                     corresponding to output of bilinear transofrm
 *                     (z domain).
 *
 * Note: frequencies are in Hz.
 * ----------------------------------------------------------
 */
void szxform(
    double *a0, double *a1, double *a2, /* numerator coefficients */
    double *b0, double *b1, double *b2, /* denominator coefficients */
    double fc,         /* Filter cutoff frequency */
    double fs,         /* sampling rate */
    double *k,         /* overall gain factor */
    float *coef)         /* pointer to 4 iir coefficients */
{
                 /* Calculate a1 and a2 and overwrite the original values */
        prewarp(a0, a1, a2, fc, fs);
        prewarp(b0, b1, b2, fc, fs);
        bilinear(*a0, *a1, *a2, *b0, *b1, *b2, k, fs, coef);
}


