
#ifndef _WINKVMINT_H_
#define _WINKVMINT_H_

/* FIXME */
#define __WORDSIZE  32

typedef signed char             __s8;
typedef unsigned char           __u8;

typedef signed short            __s16;
typedef unsigned short          __u16;

typedef signed int              __s32;
typedef unsigned int            __u32;

/* FIXME */
#if __WORDSIZE == 64
typedef signed long             __s64;
typedef unsigned long           __u64;
#else
typedef signed long long        __s64;
typedef unsigned long long      __u64;
#endif

typedef unsigned char           u8;
typedef unsigned short          u16;
typedef unsigned int            u32;
typedef __u64                   u64;

typedef __s8                    s8;
typedef __s16                   s16;
typedef __s32                   s32;
typedef __s64                   s64;

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

typedef unsigned int            size_t;

#endif /* _WINKVMINT_H_ */
