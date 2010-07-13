
#ifndef _WINKVMMISC_H_
#define _WINKVMMISC_H_

#ifdef __WINKVM__

//#include <asm/segment_32.h>
#include <asm/winkvm86.h>

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

/* extern void* __fastcall RtlCopyMemory(void *Destination, const void *Source, size_t Length); */
/* extern void* __fastcall RtlFillMemory(void *Destination, size_t Length, unsigned char Fill); */

/* static inline void *memcpy(void *to, const void *from, size_t n) */
/* { */
/* 	return RtlCopyMemory(to, from, n);	 */
/* } */

/* static inline void* memset(void* s, int c, unsigned n) */
/* { */
/* 	return RtlFillMemory(s, n, (unsigned char)c);	 */
/* } */

extern void *memcpy(void *to, const void *from, size_t n);
extern void* memset(void* s, int c, unsigned n);
extern int strcmp(const char *str1, const char *str2);

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
	__asm__ __volatile__(						 
		"lock; btrl %1,%0"		
		:"+m" (ADDR)		 
		:"Ir" (nr));	
}

#define rdmsr(msr,val1,val2)						\
	do {											\
		u64 __val = native_read_msr(msr);			\
		(val1) = (u32)__val;						\
		(val2) = (u32)(__val >> 32);				\
	} while(0)

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

#define rdmsr_safe(msr,p1,p2)					\
	({											\
		int __err = 1;							\
		u64 __val = native_read_msr(msr);		\
		(*p1) = (u32)__val;						\
		(*p2) = (u32)(__val >> 32);				\
		__err;									\
	})
	
/* Warning */
static inline int wrmsr_safe(u32 __msr, u32 __low, u32 __high)
{
/* 	return native_write_msr_safe(__msr, ((u64)__high << 32) | __low); */
	native_write_msr(__msr, ((u64)__high << 32) | __low);	
	return 1;	
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

/* #define rdtscll(val) do {	\ */
/*       unsigned int __a,__d; \ */
/*       __asm__ __volatile__("rdtsc" : "=a" (__a), "=d" (__d)); \ */
/*       (val) = ((unsigned long)__a) | (((unsigned long)__d)<<32); \ */
/*   } while(0) */

static inline unsigned long long native_read_tsc(void)
{
	unsigned long long val;

	/* rdtsc_barrier(); */
	asm volatile("rdtsc" : "=A" (val));
	/* rdtsc_barrier(); */	

	return val;
}

#define rdtscll(val)							\
  ((val) = native_read_tsc())

#define rdtscpll(val, aux) do { \
     unsigned long __a, __d; \
     __asm__ __volatile__ (".byte 0x0f,0x01,0xf9" : "=a" (__a), "=d" (__d), "=c" (aux)); \
     (val) = (__d << 32) | __a; \
} while (0)

#define write_tsc(val1,val2) wrmsr(0x10, val1, val2)
#define write_rdtscp_aux(val) wrmsr(0xc0000103, val, 0)

/* FIXME */
#define GDT_ENTRY_TSS			(4)

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

static inline void write_cr4(unsigned long val) 
{
	asm volatile("movl %0,%%cr4": :"r" (val));
}

static inline unsigned long read_cr4(void)  
{
	unsigned long val;
	asm volatile("movl %%cr4,%0\n\t" :"=r" (val));
	return val;	
}

static inline unsigned long read_cr0(void)
{
	unsigned long val;
	asm volatile("movl %%cr0,%0\n\t" :"=r" (val));	
	return val;
}

static inline void write_cr0(unsigned long val)
{
	asm volatile("movl %0,%%cr0": :"r" (val));
}

static inline unsigned long read_cr2(void)
{
	unsigned long val;
	asm volatile("movl %%cr2,%0\n\t" :"=r" (val));
	return val;
}

static inline void write_cr2(unsigned long val)
{
	asm volatile("movl %0,%%cr2": :"r" (val));
}

static inline unsigned long read_cr3(void)
{
	unsigned long val;
	asm volatile("movl %%cr3,%0\n\t" :"=r" (val));
	return val;
}

static inline void write_cr3(unsigned long val)
{
	asm volatile("movl %0,%%cr3": :"r" (val));
}

/**
 * Kazushi original functions 
 */

static inline unsigned short read_es(void)
{
	unsigned short r;	
	asm volatile ("mov %%es, %0" : "=r"(r));	
	return r;
}

static inline unsigned short read_cs(void)
{
	unsigned short r;	
	asm volatile ("mov %%cs, %0" : "=r"(r));	
	return r;
}

static inline unsigned short read_ss(void)
{
	unsigned short r;	
	asm volatile ("mov %%ss, %0" : "=r"(r));	
	return r;
}

static inline unsigned short read_ds(void)	
{
	unsigned short r;	
	asm volatile ("mov %%ds, %0" : "=r"(r));	
	return r;
}

static inline unsigned short store_fs(void)  
{
	unsigned short r;
	asm volatile ("mov %%fs, %0" : "=r"(r));
	return r;
}

static inline unsigned short store_gs(void)  
{
	unsigned short r;
	asm volatile ("mov %%gs, %0" : "=r"(r));	
	return r;
}

static inline unsigned long read_fs_base(void)
{
	unsigned short fs_s = store_fs() >> 3;	
	unsigned long base_address;	
	struct Xgt_desc_struct Xgt_desc;	
	struct desc_struct *desc;

	FUNCTION_ENTER();   

	store_gdt(&Xgt_desc);
	desc = (struct desc_struct*)Xgt_desc.address;	

	base_address =  (desc[fs_s].base2 << 24) | (desc[fs_s].base1 << 16) | desc[fs_s].base0;
	
	FUNCTION_EXIT();
	
	return base_address;
}

static inline unsigned long read_gs_base(void)
{
	unsigned short gs_s = store_gs() >> 3;	
	unsigned long base_address;	
	struct Xgt_desc_struct Xgt_desc;	
	struct desc_struct *desc;

	FUNCTION_ENTER();
	
	store_gdt(&Xgt_desc);
	desc = (struct desc_struct*)Xgt_desc.address;

	base_address =  (desc[gs_s].base2 << 24) | (desc[gs_s].base1 << 16) | desc[gs_s].base0;	

	FUNCTION_EXIT();	
	
	return base_address;
}

/**
 * end original functions
 */

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

/* debug reg */
#define set_debugreg(value, register)				\
	native_set_debugreg(register, value)

static inline void native_set_debugreg(int regno, unsigned long value)
{
	switch (regno) {
	case 0:
		asm("movl %0,%%db0"	: /* no output */ :"r" (value));
		break;
	case 1:
		asm("movl %0,%%db1"	: /* no output */ :"r" (value));
		break;
	case 2:
		asm("movl %0,%%db2"	: /* no output */ :"r" (value));
		break;
	case 3:
		asm("movl %0,%%db3"	: /* no output */ :"r" (value));
		break;
	case 6:
		asm("movl %0,%%db6"	: /* no output */ :"r" (value));
		break;
	case 7:
		asm("movl %0,%%db7"	: /* no output */ :"r" (value));
		break;
	default:
/* 		BUG();		 */
		break;		
	}
}

/**
 * atomic_inc - increment atomic variable
 * @v: pointer of type atomic_t
 *
 * Atomically increments @v by 1.
 */
static __inline__ void atomic_inc(int *v)  
{
	__asm__ __volatile__(
		"lock; incl %0"					   
		:"+m" (v));   
}

/**
 * atomic_dec - decrement atomic variable
 * @v: pointer of type atomic_t
 *
 * Atomically decrements @v by 1.
 */
static __inline__ void atomic_dec(int *v)	
{
	__asm__ __volatile__(		
		"lock; decl %0"		
		:"+m" (v));	
}

#endif /* __WINKVM__ */

#endif /* _WINKVMMISC_H_ */

