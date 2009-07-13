
#ifndef _WINKVMMISC_H_
#define _WINKVMMISC_H_

#ifdef __WINKVM__

/* FIXME */
typedef int size_t;

static inline void *memcpy(void * to, const void * from, size_t n)
{
	int d0, d1, d2;
	__asm__ __volatile__(
		"rep ; movsl\n\t"
		"movl %4,%%ecx\n\t"
		"andl $3,%%ecx\n\t"
		"jz 1f\n\t"
		"rep ; movsb\n\t"
		"1:"
		: "=&c" (d0), "=&D" (d1), "=&S" (d2)
		: "0" (n/4), "g" (n), "1" ((long) to), "2" ((long) from)
		: "memory");
	return (to);
}

static inline void native_cpuid(unsigned int *eax, unsigned int *ebx,
								unsigned int *ecx, unsigned int *edx)
{
	/* ecx is often an input as well as an output. */
	__asm__("cpuid"
			: "=a" (*eax),
			  "=b" (*ebx),
			  "=c" (*ecx),
			  "=d" (*edx)
			: "0" (*eax), "2" (*ecx));
}

#define __cpuid native_cpuid

/*
 * Generic CPUID function
 * clear %ecx since some cpus (Cyrix MII) do not set or clear %ecx
 * resulting in stale register contents being returned.
 */
static inline void cpuid(unsigned int op,
						 unsigned int *eax, unsigned int *ebx,
						 unsigned int *ecx, unsigned int *edx)
{
	*eax = op;
	*ecx = 0;
	__cpuid(eax, ebx, ecx, edx);
}

/* Some CPUID calls want 'count' to be placed in ecx */
static inline void cpuid_count(unsigned int op, int count,
							   unsigned int *eax, unsigned int *ebx,
							   unsigned int *ecx, unsigned int *edx)
{
	*eax = op;
	*ecx = count;
	__cpuid(eax, ebx, ecx, edx);
}

/*
 * CPUID functions returning a single datum
 */
static inline unsigned int cpuid_eax(unsigned int op)
{
	unsigned int eax, ebx, ecx, edx;

	cpuid(op, &eax, &ebx, &ecx, &edx);
	return eax;
}
static inline unsigned int cpuid_ebx(unsigned int op)
{
	unsigned int eax, ebx, ecx, edx;

	cpuid(op, &eax, &ebx, &ecx, &edx);
	return ebx;
}
static inline unsigned int cpuid_ecx(unsigned int op)
{
	unsigned int eax, ebx, ecx, edx;

	cpuid(op, &eax, &ebx, &ecx, &edx);
	return ecx;
}
static inline unsigned int cpuid_edx(unsigned int op)
{
	unsigned int eax, ebx, ecx, edx;

	cpuid(op, &eax, &ebx, &ecx, &edx);
	return edx;
}

static inline int strcmp(const char *str1, const char *str2)
{
	const unsigned char *s1 = (const unsigned char *)str1;
	const unsigned char *s2 = (const unsigned char *)str2;
	int delta = 0;

	while (*s1 || *s2) {
		delta = *s2 - *s1;
		if (delta)
			return delta;
		s1++;
		s2++;
	}
	return 0;
}

/**
 * container_of - cast a member of a structure out to the containing structure
 * @ptr:	the pointer to the member.
 * @type:	the type of the container struct this is embedded in.
 * @member:	the name of the member within the struct.
 *
 */
#define container_of(ptr, type, member) ({			\
	const typeof( ((type *)0)->member ) *__mptr = (ptr);	\
	(type *)( (char *)__mptr - offsetof(type,member) );})

#define DEFINE_PER_CPU(type, name) __typeof__(type) per_cpu__##name

#endif /* __WINKVM__ */

#endif /* _WINKVMMISC_H_ */

