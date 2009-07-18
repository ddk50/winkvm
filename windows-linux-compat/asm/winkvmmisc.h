
#ifndef _WINKVMMISC_H_
#define _WINKVMMISC_H_

#ifdef __WINKVM__

#include <asm/segment_32.h>

/* FIXME */
//typedef int size_t;

struct desc_ptr {
	unsigned short size;
	unsigned long address;
} __attribute__((packed));

struct Xgt_desc_struct {
	unsigned short size;
	unsigned long address __attribute__((packed));
	unsigned short pad;
} __attribute__ ((packed));

struct desc_struct {
	u16 limit0;
	u16 base0;
	unsigned base1 : 8, type : 4, s : 1, dpl : 2, p : 1;
	unsigned limit : 4, avl : 1, l : 1, d : 1, g : 1, base2 : 8;
} __attribute__((packed));

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

static inline void* memset(void* s, int c, unsigned n)
{
	int i;
	char *ss = (char*)s;

	for (i=0;i<n;i++) ss[i] = c;
	return s;
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
 * __ffs - find first bit in word.
 * @word: The word to search
 *
 * Undefined if no bit exists, so code should check against 0 first.
 */
static inline unsigned long __ffs(unsigned long word)
{
	__asm__("bsfl %1,%0"
		:"=r" (word)
		:"rm" (word));
	return word;
}

/**
 * clear_bit - Clears a bit in memory
 * @nr: Bit to clear
 * @addr: Address to start counting from
 *
 * clear_bit() is atomic and may not be reordered.  However, it does
 * not contain a memory barrier, so if it is used for locking purposes,
 * you should call smp_mb__before_clear_bit() and/or smp_mb__after_clear_bit()
 * in order to ensure changes are visible on other processors.
 */
static inline void clear_bit(int nr, volatile unsigned long * addr)
{
	__asm__ __volatile__( LOCK_PREFIX
		"btrl %1,%0"
		:"+m" (ADDR)
		:"Ir" (nr));
}

static inline unsigned long long native_read_msr(unsigned int msr)
{
	unsigned long long val;

	asm volatile("rdmsr" : "=A" (val) : "c" (msr));
	return val;
}

static inline void native_write_msr(unsigned int msr, unsigned long long val)
{
	asm volatile("wrmsr" : : "c" (msr), "A"(val));
}

static inline void wrmsr(u32 __msr, u32 __low, u32 __high)
{
	native_write_msr(__msr, ((u64)__high << 32) | __low);
}

#define rdmsrl(msr,val)							\
	((val) = native_read_msr(msr))

#define wrmsrl(msr,val)	native_write_msr(msr, val)

#define rdtsc(low,high) \
     __asm__ __volatile__("rdtsc" : "=a" (low), "=d" (high))

#define rdtscl(low) \
     __asm__ __volatile__ ("rdtsc" : "=a" (low) : : "edx")

#define rdtscp(low,high,aux) \
     __asm__ __volatile__ (".byte 0x0f,0x01,0xf9" : "=a" (low), "=d" (high), "=c" (aux))

#define rdtscll(val) do { \
     unsigned int __a,__d; \
     __asm__ __volatile__("rdtsc" : "=a" (__a), "=d" (__d)); \
     (val) = ((unsigned long)__a) | (((unsigned long)__d)<<32); \
} while(0)

#define rdtscpll(val, aux) do { \
     unsigned long __a, __d; \
     __asm__ __volatile__ (".byte 0x0f,0x01,0xf9" : "=a" (__a), "=d" (__d), "=c" (aux)); \
     (val) = (__d << 32) | __a; \
} while (0)

#define write_tsc(val1,val2) wrmsr(0x10, val1, val2)
#define write_rdtscp_aux(val) wrmsr(0xc0000103, val, 0)

static inline void load_TR_desc(void)  
{
	asm volatile("ltr %w0"::"q" (GDT_ENTRY_TSS*8));
}

static inline void load_gdt(const struct Xgt_desc_struct *dtr)
{
	asm volatile("lgdt %0"::"m" (*dtr));
}

static inline void load_idt(const struct Xgt_desc_struct *dtr)
{
	asm volatile("lidt %0"::"m" (*dtr));
}

static inline void store_gdt(struct Xgt_desc_struct *dtr)
{
	asm ("sgdt %0":"=m" (*dtr));
}

static inline void store_idt(struct Xgt_desc_struct *dtr)
{
	asm ("sidt %0":"=m" (*dtr));
}

static inline unsigned long store_tr(void)  
{
	unsigned long tr;
	asm ("str %0":"=r" (tr));
	return tr;
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

