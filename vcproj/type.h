
#ifndef __WINKVMINT_H
#define __WINKVMINT_H

/* FIXME */
#define __WORDSIZE  32

typedef signed char             __s8;
typedef unsigned char           __u8;

typedef signed short            __s16;
typedef unsigned short          __u16;

typedef signed int              __s32;
typedef __int32                 __u32;

#if __WORDSIZE == 64
typedef signed long             __s64;
typedef unsigned long           __u64;
#else
typedef signed long long        __s64;
typedef __int64                 __u64;
#endif

typedef __int8                  u8;
typedef __int16                 u16;
typedef __int32                 u32;
typedef __int64                 u64;

/* signed */
typedef signed char             int8_t;
typedef short int               int16_t;
typedef int                     int32_t;

#if __WORDSIZE == 64
typedef long int                int64_t;
#else
typedef long long int           int64_t;
#endif

/* unsigned */
typedef unsigned char           uint8_t;
typedef unsigned short int      uint16_t;
typedef unsigned int            uint32_t;

#if __WORDSIZE == 64
typedef unsigned long int       uint64_t;
#else
typedef unsigned long long int  uint64_t;
#endif

#endif